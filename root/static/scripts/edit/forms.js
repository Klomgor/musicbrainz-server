/*
 * Copyright (C) 2013 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import $ from 'jquery';
import ko from 'knockout';

import {compare} from '../common/i18n.js';
import MB from '../common/MB.js';
import {last} from '../common/utility/arrays.js';
import debounce from '../common/utility/debounce.js';

import {stripAttributes} from './utility/linkPhrase.js';

function cmpOptions(a, b) {
  return (a.data.child_order - b.data.child_order) ||
    compare(a.text, b.text);
}

const formUtils = {

  buildOptionsTree(root, textAttr, valueAttr) {
    var options = [];
    var nbsp = String.fromCharCode(160);

    function buildOptions(parent, indent) {
      const children = parent.children;

      if (!children) {
        return;
      }

      const childOptions = [];
      let child;
      let i = 0;

      while ((child = children[i++])) {
        var opt = {};

        opt.value = child[valueAttr];
        opt.text = nbsp.repeat(indent * 2) +
                   (typeof textAttr === 'function'
                     ? textAttr(child)
                     : child[textAttr]);
        opt.data = child;
        childOptions.push(opt);
      }

      childOptions.sort(cmpOptions);

      for (let i = 0; i < childOptions.length; i++) {
        const opt = childOptions[i];
        options.push(opt);
        buildOptions(opt.data, indent + 1);
      }
    }

    buildOptions(root, 0);
    return options;
  },

  linkTypeOptions(root, backward) {
    function getText(data) {
      return stripAttributes(
        data,
        l_relationships(
          backward ? data.reverse_link_phrase : data.link_phrase,
        ),
      );
    }

    var options = formUtils.buildOptionsTree(root, getText, 'id');

    for (var i = 0, len = options.length, option; i < len; i++) {
      if ((option = options[i]) && !option.data.description) {
        option.disabled = true;
      }
    }

    return options;
  },

  setDisabledOption(option, data) {
    if (data && data.disabled) {
      option.disabled = true;
    }
  },
};


ko.bindingHandlers.loop = {

  init(
    parentNode,
    valueAccessor,
    allBindings,
    viewModel,
    bindingContext,
  ) {
    const options = valueAccessor();
    const observableArray = options.items;

    /*
     * The way this binding handler works is by using the "arrayChange"
     * event found on observableArrays, which notifies a list of changes
     * we can apply to the UI.
     */

    if (!ko.isObservable(observableArray) ||
        !observableArray.cacheDiffForKnownOperation) {
      throw new Error('items must an an observableArray');
    }

    const idAttribute = options.id;
    const elements = options.elements || {};
    const template = [];

    const childNodes = Array.from(ko.virtualElements.childNodes(parentNode));
    for (const node of childNodes) {
      if (node.nodeType === Node.ELEMENT_NODE ||
          node.nodeType === Node.COMMENT_NODE) {
        template.push(node);
      }
    }

    /*
     * For regular DOM nodes this is the same as parentNode; if parentNode
     * is a virtual element, this will be the parentNode of the comment.
     */
    var actualParentNode = parentNode;
    while (actualParentNode.nodeType !== Node.ELEMENT_NODE) {
      actualParentNode = actualParentNode.parentNode;
    }

    ko.virtualElements.emptyNode(parentNode);

    function update(changes) {
      const activeElement = document.activeElement;
      const items = observableArray.peek();
      const removals = [];

      for (let i = 0, change, node; (change = changes[i]); i++) {
        var status = change.status;

        if (status === 'retained') {
          continue;
        }

        const item = change.value;
        const itemID = item[idAttribute];
        let currentElements = elements[itemID];
        let tmpElementContainer;

        if (status === 'added') {
          if (change.moved === undefined) {
            var newContext = bindingContext.createChildContext(item);

            if (!currentElements) {
              /*
               * Using a documentFragment would simplify things,
               * but knockout doesn't support them.
               * https://github.com/knockout/knockout/pull/1432
               */
              tmpElementContainer = document.createElement('div');

              for (let j = 0; (node = template[j]); j++) {
                tmpElementContainer.appendChild(node.cloneNode(true));
              }

              ko.applyBindingsToDescendants(newContext, tmpElementContainer);
              currentElements = Array.from(tmpElementContainer.childNodes);
              elements[itemID] = currentElements;
              tmpElementContainer = null;
            }
          }
        } else if (status === 'deleted') {
          if (change.moved === undefined) {
            for (let j = 0; (node = currentElements[j]); j++) {
              /*
               * If the node is already removed for some unknown
               * reason, don't outright explode. It's possible
               * an exception occurred somewhere in the middle
               * of an arrayChange notification, causing
               * knockout to send duplicate changes afterward.
               */
              if (node.parentNode) {
                node.parentNode.removeChild(node);
              }
              removals.push({node, itemID});
            }
          }
          /*
           * When knockout detects a moved item, it sends both
           * "added" and "deleted" changes for it. We only need
           * to handle the former.
           */
          continue;
        }

        let elementsToInsert;
        let elementsToInsertAfter;
        if (currentElements.length === 1) {
          elementsToInsert = currentElements[0];
        } else {
          elementsToInsert = document.createDocumentFragment();
          for (let j = 0; (node = currentElements[j]); j++) {
            elementsToInsert.appendChild(node);
          }
        }

        /*
         * Find where to insert the elements associated with this
         * item. The final result should be in the same order as the
         * items are in their containing array.
         */
        var prevItem;

        /*
         * Loop through the items before the current one, and find one
         * that actually has elements on the page (i.e. something we
         * can insertAfter). It doesn't matter if we don't insert
         * after the *immediate* prevItem, because when *that* item
         * is dealt with it'll be inserted after the same item we
         * used (thus settling before us). prevItem will be undefined
         * when it's past the first item in the array, and the for-
         * loop will end; insertAfter handles that by just prepending
         * the elements to parentNode.
         */

        for (var j = change.index - 1; (prevItem = items[j]); j--) {
          elementsToInsertAfter = elements[prevItem[idAttribute]];

          /*
           * prevItem's elements won't exist on the page if they
           * were previously removed, but haven't been purged from
           * `elements` yet (below).
           */
          if (elementsToInsertAfter) {
            if (actualParentNode.contains(elementsToInsertAfter[0])) {
              break;
            }
            elementsToInsertAfter = null;
          }
        }

        ko.virtualElements.insertAfter(
          parentNode,
          elementsToInsert,
          last(elementsToInsertAfter),
        );
      }

      // Brief timeout in case a removed item gets re-added.
      setTimeout(function () {
        for (var i = 0, removal; (removal = removals[i]); i++) {
          if (!document.body.contains(removal.node)) {
            ko.cleanNode(removal.node);
            delete elements[removal.itemID];
          }
        }
      }, 100);

      if (actualParentNode.contains(activeElement)) {
        activeElement.focus();
      }
    }

    var changeSubscription =
      observableArray.subscribe(update, null, 'arrayChange');

    function nodeDisposal() {
      ko.utils.domNodeDisposal.removeDisposeCallback(
        parentNode,
        nodeDisposal,
      );
      changeSubscription.dispose();
    }

    ko.utils.domNodeDisposal.addDisposeCallback(parentNode, nodeDisposal);

    update(observableArray.peek().map(function (value, index) {
      return {status: 'added', value, index};
    }));

    return {controlsDescendantBindings: true};
  },
};

ko.virtualElements.allowedBindings.loop = true;


/*
 * By default, knockout limits the number of items it'll loop through before
 * giving up finding any moves in an arrayChange sequence, presumably to
 * limit its polynomial time complexity in the case of really large arrays.
 * But the loop bindingHandler which we use depends on moves always being
 * detected, so we must disable this limit by passing a falsy value as the
 * third argument.
 */
ko.utils.__findMovesInArrayComparison = ko.utils.findMovesInArrayComparison;

ko.utils.findMovesInArrayComparison = function (left, right) {
  ko.utils.__findMovesInArrayComparison(left, right, false);
};


/*
 * Helper binding that matches an input and label (assuming a table layout)
 * together in a foreach loop, by assigning an id composed of a prefix
 * concatenated with the index of the item in the loop.
 *
 * So if you have something like this in the template:
 *
 * <!-- ko foreach: items -->
 * <tr>
 *   <td><label>Foo</label></td>
 *   <td><input data-bind="withLabel: 'foo'" /></td>
 * <tr>
 * <!-- /ko -->
 *
 * It'll result in this markup once rendered (assuming two items):
 *
 * <tr>
 *   <td><label for="foo-0">Foo</label></td>
 *   <td><input id="foo-0" data-bind="withLabel: 'foo'" /></td>
 * <tr>
 * <tr>
 *   <td><label for="foo-1">Foo</label></td>
 *   <td><input id="foo-1" data-bind="withLabel: 'foo'" /></td>
 * <tr>
 */
ko.bindingHandlers.withLabel = {

  update(element, valueAccessor, allBindings,
    viewModel, bindingContext) {
    var name = valueAccessor() + '-' + bindingContext.$index();

    $(element)
      .attr('id', name)
      .parents('td')
      .prev('td')
      .find('label')
      .attr('for', name);
  },
};

export const buildOptionsTree = formUtils.buildOptionsTree;
export const linkTypeOptions = formUtils.linkTypeOptions;
export const setDisabledOption = formUtils.setDisabledOption;

MB.initializeTooShortYearChecks = function (type) {
  function blockTooShortBeginYear() {
    const beginYear =
      $(`#id-edit-${type}\\.period\\.begin_date\\.year`).val();
    const allowed = (!beginYear || beginYear.trim().length === 4);
    $('.submit').prop('disabled', !allowed);
    $('#too_short_begin_year').toggle(!allowed);
  }

  function blockTooShortEndYear() {
    const endYear = $(`#id-edit-${type}\\.period\\.end_date\\.year`).val();
    const allowed =
      (endYear === null || endYear === '' || endYear.length === 4);
    $('.submit').prop('disabled', !allowed);
    $('#too_short_end_year').toggle(!allowed);
  }

  $(`#id-edit-${type}\\.period\\.begin_date\\.year`)
    .keyup(debounce(blockTooShortBeginYear, 500))
    .change(debounce(blockTooShortBeginYear, 500));

  blockTooShortBeginYear();

  $(`#id-edit-${type}\\.period\\.end_date\\.year`)
    .keyup(debounce(blockTooShortEndYear, 500))
    .change(debounce(blockTooShortEndYear, 500));

  blockTooShortEndYear();
};

export const initializeTooShortYearChecks = MB.initializeTooShortYearChecks;
