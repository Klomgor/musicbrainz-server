/*
 * @flow strict
 * Copyright (C) 2021 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

/* eslint-disable no-unused-vars */

declare type EDIT_ARTIST_CREATE_T = 1;
declare type EDIT_ARTIST_EDIT_T = 2;
declare type EDIT_ARTIST_DELETE_T = 3;
declare type EDIT_ARTIST_MERGE_T = 4;
declare type EDIT_ARTIST_ADD_ANNOTATION_T = 5;
declare type EDIT_ARTIST_ADD_ALIAS_T = 6;
declare type EDIT_ARTIST_DELETE_ALIAS_T = 7;
declare type EDIT_ARTIST_EDIT_ALIAS_T = 8;
declare type EDIT_ARTIST_EDITCREDIT_T = 9;

declare type EDIT_LABEL_CREATE_T = 10;
declare type EDIT_LABEL_EDIT_T = 11;
declare type EDIT_LABEL_DELETE_T = 13;
declare type EDIT_LABEL_MERGE_T = 14;
declare type EDIT_LABEL_ADD_ANNOTATION_T = 15;
declare type EDIT_LABEL_ADD_ALIAS_T = 16;
declare type EDIT_LABEL_DELETE_ALIAS_T = 17;
declare type EDIT_LABEL_EDIT_ALIAS_T = 18;

declare type EDIT_RELEASEGROUP_CREATE_T = 20;
declare type EDIT_RELEASEGROUP_EDIT_T = 21;
declare type EDIT_RELEASEGROUP_SET_COVER_ART_T = 22;
declare type EDIT_RELEASEGROUP_DELETE_T = 23;
declare type EDIT_RELEASEGROUP_MERGE_T = 24;
declare type EDIT_RELEASEGROUP_ADD_ANNOTATION_T = 25;
declare type EDIT_RELEASEGROUP_ADD_ALIAS_T = 26;
declare type EDIT_RELEASEGROUP_DELETE_ALIAS_T = 27;
declare type EDIT_RELEASEGROUP_EDIT_ALIAS_T = 28;

declare type EDIT_RELEASE_CREATE_T = 31;
declare type EDIT_RELEASE_EDIT_T = 32;
declare type EDIT_RELEASE_MOVE_T = 33;
declare type EDIT_RELEASE_ADDRELEASELABEL_T = 34;
declare type EDIT_RELEASE_ADD_ANNOTATION_T = 35;
declare type EDIT_RELEASE_DELETERELEASELABEL_T = 36;
declare type EDIT_RELEASE_EDITRELEASELABEL_T = 37;
declare type EDIT_RELEASE_CHANGE_QUALITY_T = 38;
declare type EDIT_RELEASE_EDIT_BARCODES_T = 39;
declare type EDIT_RELEASE_DELETE_T = 310;
declare type EDIT_RELEASE_MERGE_T = 311;
declare type EDIT_RELEASE_ARTIST_T = 312;
declare type EDIT_RELEASE_REORDER_MEDIUMS_T = 313;
declare type EDIT_RELEASE_ADD_COVER_ART_T = 314;
declare type EDIT_RELEASE_REMOVE_COVER_ART_T = 315;
declare type EDIT_RELEASE_EDIT_COVER_ART_T = 316;
declare type EDIT_RELEASE_REORDER_COVER_ART_T = 317;
declare type EDIT_RELEASE_ADD_ALIAS_T = 318;
declare type EDIT_RELEASE_DELETE_ALIAS_T = 319;
declare type EDIT_RELEASE_EDIT_ALIAS_T = 320;

declare type EDIT_WORK_CREATE_T = 41;
declare type EDIT_WORK_EDIT_T = 42;
declare type EDIT_WORK_DELETE_T = 43;
declare type EDIT_WORK_MERGE_T = 44;
declare type EDIT_WORK_ADD_ANNOTATION_T = 45;
declare type EDIT_WORK_ADD_ALIAS_T = 46;
declare type EDIT_WORK_DELETE_ALIAS_T = 47;
declare type EDIT_WORK_EDIT_ALIAS_T = 48;
declare type EDIT_WORK_ADD_ISWCS_T = 49;
declare type EDIT_WORK_REMOVE_ISWC_T = 410;

declare type EDIT_MEDIUM_CREATE_T = 51;
declare type EDIT_MEDIUM_EDIT_T = 52;
declare type EDIT_MEDIUM_DELETE_T = 53;
declare type EDIT_MEDIUM_REMOVE_DISCID_T = 54;
declare type EDIT_MEDIUM_ADD_DISCID_T = 55;
declare type EDIT_MEDIUM_MOVE_DISCID_T = 56;
declare type EDIT_SET_TRACK_LENGTHS_T = 58;

declare type EDIT_PLACE_CREATE_T = 61;
declare type EDIT_PLACE_EDIT_T = 62;
declare type EDIT_PLACE_DELETE_T = 63;
declare type EDIT_PLACE_MERGE_T = 64;
declare type EDIT_PLACE_ADD_ANNOTATION_T = 65;
declare type EDIT_PLACE_ADD_ALIAS_T = 66;
declare type EDIT_PLACE_DELETE_ALIAS_T = 67;
declare type EDIT_PLACE_EDIT_ALIAS_T = 68;

declare type EDIT_RECORDING_CREATE_T = 71;
declare type EDIT_RECORDING_EDIT_T = 72;
declare type EDIT_RECORDING_DELETE_T = 73;
declare type EDIT_RECORDING_MERGE_T = 74;
declare type EDIT_RECORDING_ADD_ANNOTATION_T = 75;
declare type EDIT_RECORDING_ADD_ISRCS_T = 76;
declare type EDIT_RECORDING_REMOVE_ISRC_T = 78;
declare type EDIT_RECORDING_ADD_ALIAS_T = 711;
declare type EDIT_RECORDING_DELETE_ALIAS_T = 712;
declare type EDIT_RECORDING_EDIT_ALIAS_T = 713;

declare type EDIT_AREA_CREATE_T = 81;
declare type EDIT_AREA_EDIT_T = 82;
declare type EDIT_AREA_DELETE_T = 83;
declare type EDIT_AREA_MERGE_T = 84;
declare type EDIT_AREA_ADD_ANNOTATION_T = 85;
declare type EDIT_AREA_ADD_ALIAS_T = 86;
declare type EDIT_AREA_DELETE_ALIAS_T = 87;
declare type EDIT_AREA_EDIT_ALIAS_T = 88;

declare type EDIT_RELATIONSHIP_CREATE_T = 90;
declare type EDIT_RELATIONSHIP_EDIT_T = 91;
declare type EDIT_RELATIONSHIP_DELETE_T = 92;
declare type EDIT_RELATIONSHIP_REMOVE_LINK_TYPE_T = 93;
declare type EDIT_RELATIONSHIP_REMOVE_LINK_ATTRIBUTE_T = 94;
declare type EDIT_RELATIONSHIP_EDIT_LINK_TYPE_T = 95;
declare type EDIT_RELATIONSHIP_ADD_TYPE_T = 96;
declare type EDIT_RELATIONSHIP_ATTRIBUTE_T = 97;
declare type EDIT_RELATIONSHIP_ADD_ATTRIBUTE_T = 98;
declare type EDIT_RELATIONSHIPS_REORDER_T = 99;

declare type EDIT_SERIES_CREATE_T = 140;
declare type EDIT_SERIES_EDIT_T = 141;
declare type EDIT_SERIES_DELETE_T = 142;
declare type EDIT_SERIES_MERGE_T = 143;
declare type EDIT_SERIES_ADD_ANNOTATION_T = 144;
declare type EDIT_SERIES_ADD_ALIAS_T = 145;
declare type EDIT_SERIES_DELETE_ALIAS_T = 146;
declare type EDIT_SERIES_EDIT_ALIAS_T = 147;

declare type EDIT_INSTRUMENT_CREATE_T = 131;
declare type EDIT_INSTRUMENT_EDIT_T = 132;
declare type EDIT_INSTRUMENT_DELETE_T = 133;
declare type EDIT_INSTRUMENT_MERGE_T = 134;
declare type EDIT_INSTRUMENT_ADD_ANNOTATION_T = 135;
declare type EDIT_INSTRUMENT_ADD_ALIAS_T = 136;
declare type EDIT_INSTRUMENT_DELETE_ALIAS_T = 137;
declare type EDIT_INSTRUMENT_EDIT_ALIAS_T = 138;

declare type EDIT_EVENT_CREATE_T = 150;
declare type EDIT_EVENT_EDIT_T = 151;
declare type EDIT_EVENT_DELETE_T = 152;
declare type EDIT_EVENT_MERGE_T = 153;
declare type EDIT_EVENT_ADD_ANNOTATION_T = 154;
declare type EDIT_EVENT_ADD_ALIAS_T = 155;
declare type EDIT_EVENT_DELETE_ALIAS_T = 156;
declare type EDIT_EVENT_EDIT_ALIAS_T = 157;
declare type EDIT_EVENT_ADD_EVENT_ART_T = 158;
declare type EDIT_EVENT_REMOVE_EVENT_ART_T = 159;
declare type EDIT_EVENT_EDIT_EVENT_ART_T = 1510;
declare type EDIT_EVENT_REORDER_EVENT_ART_T = 1511;

declare type EDIT_GENRE_CREATE_T = 160;
declare type EDIT_GENRE_EDIT_T = 161;
declare type EDIT_GENRE_DELETE_T = 162;
// 163 reserved for EDIT_GENRE_MERGE_T if ever implemented
declare type EDIT_GENRE_ADD_ANNOTATION_T = 164;
declare type EDIT_GENRE_ADD_ALIAS_T = 165;
declare type EDIT_GENRE_DELETE_ALIAS_T = 166;
declare type EDIT_GENRE_EDIT_ALIAS_T = 167;

declare type EDIT_WIKIDOC_CHANGE_T = 120;

declare type EDIT_URL_EDIT_T = 101;

declare type EDIT_HISTORIC_EDIT_RELEASE_NAME_T = 201;
declare type EDIT_HISTORIC_EDIT_TRACKNAME_T = 204;
declare type EDIT_HISTORIC_EDIT_TRACKNUM_T = 205;
declare type EDIT_HISTORIC_ADD_TRACK_T = 207;
declare type EDIT_HISTORIC_MOVE_RELEASE_T = 208;
declare type EDIT_HISTORIC_SAC_TO_MAC_T = 209;
declare type EDIT_HISTORIC_CHANGE_TRACK_ARTIST_T = 210;
declare type EDIT_HISTORIC_REMOVE_TRACK_T = 211;
declare type EDIT_HISTORIC_REMOVE_RELEASE_T = 212;
declare type EDIT_HISTORIC_MAC_TO_SAC_T = 213;
declare type EDIT_HISTORIC_ADD_RELEASE_T = 216;
declare type EDIT_HISTORIC_ADD_TRACK_KV_T = 218;
declare type EDIT_HISTORIC_REMOVE_DISCID_T = 220;
declare type EDIT_HISTORIC_MOVE_DISCID_T = 221;
declare type EDIT_HISTORIC_MERGE_RELEASE_T = 223;
declare type EDIT_HISTORIC_REMOVE_RELEASES_T = 224;
declare type EDIT_HISTORIC_MERGE_RELEASE_MAC_T = 225;
declare type EDIT_HISTORIC_EDIT_RELEASE_ATTRS_T = 226;
declare type EDIT_HISTORIC_EDIT_RELEASE_EVENTS_OLD_T = 229;
declare type EDIT_HISTORIC_ADD_RELEASE_ANNOTATION_T = 231;
declare type EDIT_HISTORIC_ADD_DISCID_T = 232;
declare type EDIT_HISTORIC_ADD_LINK_T = 233;
declare type EDIT_HISTORIC_EDIT_LINK_T = 234;
declare type EDIT_HISTORIC_REMOVE_LINK_T = 235;
declare type EDIT_HISTORIC_EDIT_LINK_TYPE_T = 237;
declare type EDIT_HISTORIC_REMOVE_LINK_TYPE_T = 238;
declare type EDIT_HISTORIC_EDIT_RELEASE_LANGUAGE_T = 244;
declare type EDIT_HISTORIC_EDIT_TRACK_LENGTH_T = 245;
declare type EDIT_HISTORIC_ADD_RELEASE_EVENTS_T = 249;
declare type EDIT_HISTORIC_EDIT_RELEASE_EVENTS_T = 250;
declare type EDIT_HISTORIC_REMOVE_RELEASE_EVENTS_T = 251;
declare type EDIT_HISTORIC_CHANGE_ARTIST_QUALITY_T = 252;
declare type EDIT_HISTORIC_SET_TRACK_LENGTHS_FROM_CDTOC_T = 253;
declare type EDIT_HISTORIC_REMOVE_LABEL_ALIAS_T = 262;
declare type EDIT_HISTORIC_CHANGE_RELEASE_QUALITY_T = 263;
declare type EDIT_HISTORIC_CHANGE_RELEASE_GROUP_T = 273;
