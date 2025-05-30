/*
 * @flow strict
 * Copyright (C) 2018 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

export const EDIT_ARTIST_CREATE = 1;
export const EDIT_ARTIST_EDIT = 2;
export const EDIT_ARTIST_DELETE = 3;
export const EDIT_ARTIST_MERGE = 4;
export const EDIT_ARTIST_ADD_ANNOTATION = 5;
export const EDIT_ARTIST_ADD_ALIAS = 6;
export const EDIT_ARTIST_DELETE_ALIAS = 7;
export const EDIT_ARTIST_EDIT_ALIAS = 8;
export const EDIT_ARTIST_EDITCREDIT = 9;

export const EDIT_LABEL_CREATE = 10;
export const EDIT_LABEL_EDIT = 11;
export const EDIT_LABEL_DELETE = 13;
export const EDIT_LABEL_MERGE = 14;
export const EDIT_LABEL_ADD_ANNOTATION = 15;
export const EDIT_LABEL_ADD_ALIAS = 16;
export const EDIT_LABEL_DELETE_ALIAS = 17;
export const EDIT_LABEL_EDIT_ALIAS = 18;

export const EDIT_RELEASEGROUP_CREATE = 20;
export const EDIT_RELEASEGROUP_EDIT = 21;
export const EDIT_RELEASEGROUP_SET_COVER_ART = 22;
export const EDIT_RELEASEGROUP_DELETE = 23;
export const EDIT_RELEASEGROUP_MERGE = 24;
export const EDIT_RELEASEGROUP_ADD_ANNOTATION = 25;
export const EDIT_RELEASEGROUP_ADD_ALIAS = 26;
export const EDIT_RELEASEGROUP_DELETE_ALIAS = 27;
export const EDIT_RELEASEGROUP_EDIT_ALIAS = 28;

export const EDIT_RELEASE_CREATE = 31;
export const EDIT_RELEASE_EDIT = 32;
export const EDIT_RELEASE_MOVE = 33;
export const EDIT_RELEASE_ADDRELEASELABEL = 34;
export const EDIT_RELEASE_ADD_ANNOTATION = 35;
export const EDIT_RELEASE_DELETERELEASELABEL = 36;
export const EDIT_RELEASE_EDITRELEASELABEL = 37;
export const EDIT_RELEASE_CHANGE_QUALITY = 38;
export const EDIT_RELEASE_EDIT_BARCODES = 39;
export const EDIT_RELEASE_DELETE = 310;
export const EDIT_RELEASE_MERGE = 311;
export const EDIT_RELEASE_ARTIST = 312;
export const EDIT_RELEASE_REORDER_MEDIUMS = 313;
export const EDIT_RELEASE_ADD_COVER_ART = 314;
export const EDIT_RELEASE_REMOVE_COVER_ART = 315;
export const EDIT_RELEASE_EDIT_COVER_ART = 316;
export const EDIT_RELEASE_REORDER_COVER_ART = 317;
export const EDIT_RELEASE_ADD_ALIAS = 318;
export const EDIT_RELEASE_DELETE_ALIAS = 319;
export const EDIT_RELEASE_EDIT_ALIAS = 320;

export const EDIT_WORK_CREATE = 41;
export const EDIT_WORK_EDIT = 42;
export const EDIT_WORK_DELETE = 43;
export const EDIT_WORK_MERGE = 44;
export const EDIT_WORK_ADD_ANNOTATION = 45;
export const EDIT_WORK_ADD_ALIAS = 46;
export const EDIT_WORK_DELETE_ALIAS = 47;
export const EDIT_WORK_EDIT_ALIAS = 48;
export const EDIT_WORK_ADD_ISWCS = 49;
export const EDIT_WORK_REMOVE_ISWC = 410;

export const EDIT_MEDIUM_CREATE = 51;
export const EDIT_MEDIUM_EDIT = 52;
export const EDIT_MEDIUM_DELETE = 53;
export const EDIT_MEDIUM_REMOVE_DISCID = 54;
export const EDIT_MEDIUM_ADD_DISCID = 55;
export const EDIT_MEDIUM_MOVE_DISCID = 56;
export const EDIT_SET_TRACK_LENGTHS = 58;

export const EDIT_PLACE_CREATE = 61;
export const EDIT_PLACE_EDIT = 62;
export const EDIT_PLACE_DELETE = 63;
export const EDIT_PLACE_MERGE = 64;
export const EDIT_PLACE_ADD_ANNOTATION = 65;
export const EDIT_PLACE_ADD_ALIAS = 66;
export const EDIT_PLACE_DELETE_ALIAS = 67;
export const EDIT_PLACE_EDIT_ALIAS = 68;

export const EDIT_RECORDING_CREATE = 71;
export const EDIT_RECORDING_EDIT = 72;
export const EDIT_RECORDING_DELETE = 73;
export const EDIT_RECORDING_MERGE = 74;
export const EDIT_RECORDING_ADD_ANNOTATION = 75;
export const EDIT_RECORDING_ADD_ISRCS = 76;
export const EDIT_RECORDING_REMOVE_ISRC = 78;
export const EDIT_RECORDING_ADD_ALIAS = 711;
export const EDIT_RECORDING_DELETE_ALIAS = 712;
export const EDIT_RECORDING_EDIT_ALIAS = 713;

export const EDIT_AREA_CREATE = 81;
export const EDIT_AREA_EDIT = 82;
export const EDIT_AREA_DELETE = 83;
export const EDIT_AREA_MERGE = 84;
export const EDIT_AREA_ADD_ANNOTATION = 85;
export const EDIT_AREA_ADD_ALIAS = 86;
export const EDIT_AREA_DELETE_ALIAS = 87;
export const EDIT_AREA_EDIT_ALIAS = 88;

export const EDIT_RELATIONSHIP_CREATE = 90;
export const EDIT_RELATIONSHIP_EDIT = 91;
export const EDIT_RELATIONSHIP_DELETE = 92;
export const EDIT_RELATIONSHIP_REMOVE_LINK_TYPE = 93;
export const EDIT_RELATIONSHIP_REMOVE_LINK_ATTRIBUTE = 94;
export const EDIT_RELATIONSHIP_EDIT_LINK_TYPE = 95;
export const EDIT_RELATIONSHIP_ADD_TYPE = 96;
export const EDIT_RELATIONSHIP_ATTRIBUTE = 97;
export const EDIT_RELATIONSHIP_ADD_ATTRIBUTE = 98;
export const EDIT_RELATIONSHIPS_REORDER = 99;

export const EDIT_SERIES_CREATE = 140;
export const EDIT_SERIES_EDIT = 141;
export const EDIT_SERIES_DELETE = 142;
export const EDIT_SERIES_MERGE = 143;
export const EDIT_SERIES_ADD_ANNOTATION = 144;
export const EDIT_SERIES_ADD_ALIAS = 145;
export const EDIT_SERIES_DELETE_ALIAS = 146;
export const EDIT_SERIES_EDIT_ALIAS = 147;

export const EDIT_INSTRUMENT_CREATE = 131;
export const EDIT_INSTRUMENT_EDIT = 132;
export const EDIT_INSTRUMENT_DELETE = 133;
export const EDIT_INSTRUMENT_MERGE = 134;
export const EDIT_INSTRUMENT_ADD_ANNOTATION = 135;
export const EDIT_INSTRUMENT_ADD_ALIAS = 136;
export const EDIT_INSTRUMENT_DELETE_ALIAS = 137;
export const EDIT_INSTRUMENT_EDIT_ALIAS = 138;

export const EDIT_EVENT_CREATE = 150;
export const EDIT_EVENT_EDIT = 151;
export const EDIT_EVENT_DELETE = 152;
export const EDIT_EVENT_MERGE = 153;
export const EDIT_EVENT_ADD_ANNOTATION = 154;
export const EDIT_EVENT_ADD_ALIAS = 155;
export const EDIT_EVENT_DELETE_ALIAS = 156;
export const EDIT_EVENT_EDIT_ALIAS = 157;
export const EDIT_EVENT_ADD_EVENT_ART = 158;
export const EDIT_EVENT_REMOVE_EVENT_ART = 159;
export const EDIT_EVENT_EDIT_EVENT_ART = 1510;
export const EDIT_EVENT_REORDER_EVENT_ART = 1511;

export const EDIT_GENRE_CREATE = 160;
export const EDIT_GENRE_EDIT = 161;
export const EDIT_GENRE_DELETE = 162;
// 163 reserved for EDIT_GENRE_MERGE if ever implemented
export const EDIT_GENRE_ADD_ANNOTATION = 164;
export const EDIT_GENRE_ADD_ALIAS = 165;
export const EDIT_GENRE_DELETE_ALIAS = 166;
export const EDIT_GENRE_EDIT_ALIAS = 167;

export const EDIT_WIKIDOC_CHANGE = 120;

export const EDIT_URL_EDIT = 101;

export const EDIT_HISTORIC_EDIT_RELEASE_NAME = 201;
export const EDIT_HISTORIC_EDIT_TRACKNAME = 204;
export const EDIT_HISTORIC_EDIT_TRACKNUM = 205;
export const EDIT_HISTORIC_ADD_TRACK = 207;
export const EDIT_HISTORIC_MOVE_RELEASE = 208;
export const EDIT_HISTORIC_SAC_TO_MAC = 209;
export const EDIT_HISTORIC_CHANGE_TRACK_ARTIST = 210;
export const EDIT_HISTORIC_REMOVE_TRACK = 211;
export const EDIT_HISTORIC_REMOVE_RELEASE = 212;
export const EDIT_HISTORIC_MAC_TO_SAC = 213;
export const EDIT_HISTORIC_ADD_RELEASE = 216;
export const EDIT_HISTORIC_ADD_TRACK_KV = 218;
export const EDIT_HISTORIC_REMOVE_DISCID = 220;
export const EDIT_HISTORIC_MOVE_DISCID = 221;
export const EDIT_HISTORIC_MERGE_RELEASE = 223;
export const EDIT_HISTORIC_REMOVE_RELEASES = 224;
export const EDIT_HISTORIC_MERGE_RELEASE_MAC = 225;
export const EDIT_HISTORIC_EDIT_RELEASE_ATTRS = 226;
export const EDIT_HISTORIC_EDIT_RELEASE_EVENTS_OLD = 229;
export const EDIT_HISTORIC_ADD_RELEASE_ANNOTATION = 231;
export const EDIT_HISTORIC_ADD_DISCID = 232;
export const EDIT_HISTORIC_ADD_LINK = 233;
export const EDIT_HISTORIC_EDIT_LINK = 234;
export const EDIT_HISTORIC_REMOVE_LINK = 235;
export const EDIT_HISTORIC_EDIT_LINK_TYPE = 237;
export const EDIT_HISTORIC_REMOVE_LINK_TYPE = 238;
export const EDIT_HISTORIC_EDIT_RELEASE_LANGUAGE = 244;
export const EDIT_HISTORIC_EDIT_TRACK_LENGTH = 245;
export const EDIT_HISTORIC_ADD_RELEASE_EVENTS = 249;
export const EDIT_HISTORIC_EDIT_RELEASE_EVENTS = 250;
export const EDIT_HISTORIC_REMOVE_RELEASE_EVENTS = 251;
export const EDIT_HISTORIC_CHANGE_ARTIST_QUALITY = 252;
export const EDIT_HISTORIC_SET_TRACK_LENGTHS_FROM_CDTOC = 253;
export const EDIT_HISTORIC_REMOVE_LABEL_ALIAS = 262;
export const EDIT_HISTORIC_CHANGE_RELEASE_QUALITY = 263;
export const EDIT_HISTORIC_CHANGE_RELEASE_GROUP = 273;
