\set ON_ERROR_STOP 1

SET client_min_messages TO 'warning';

-- Temporarily drop problematic triggers.
DROP TRIGGER deny_deprecated ON link;

INSERT INTO area (id, gid, name, type) VALUES
  ( 13, '106e0bec-b638-3b37-b731-f53d507dc00e', 'Australia', 1),
  ( 81, '85752fda-13c4-31a3-bee5-0e5cb1f51dad', 'Germany', 1),
  (107, '2db42837-c832-3c27-b4a3-08198f75693c', 'Japan', 1),
  (113, 'b9f7d640-46e8-313e-b158-ded6d18593b3', 'South Korea', 1),
  (150, 'ef1b7cc0-cd26-36f4-8ea0-04d9623786c7', 'Netherlands', 1),
  (221, '8a754a16-0027-3a29-b6d7-2b40ea0481ed', 'United Kingdom', 1),
  (222, '489ce91b-6658-3307-9877-795b68554c98', 'United States', 1),
  (241, '89a675c2-3e37-3518-b83c-418bad59a85a', 'Europe', 1);
INSERT INTO country_area (area) VALUES (13), (81), (107), (113), (150), (221), (222), (241);
INSERT INTO iso_3166_1 (area, code) VALUES (13, 'AU'), (81, 'DE'), (107, 'JP'), (113, 'KR'), (150, 'NL'), (221, 'GB'), (222, 'US'), (241, 'XE');

-- Editors

INSERT INTO editor (id, name, password, ha1, email, email_confirm_date)
     VALUES (95821, 'the-anti-kuno', '{CLEARTEXT}notreally', '79237ef54f6d3b8711030c0d6d5939a0', 'foo@example.com', now()),
            (100000001, 'a tagger', '', '', '', now()),
            (100000002, 'b tagger', '', '', '', now()),
            (100000003, 'c tagger', '', '', '', now()),
            (100000004, 'd tagger', '', '', '', now()),
            (100000005, 'e tagger', '', '', '', now()),
            (100000006, 'f tagger', '', '', '', now()),
            (100000007, 'g tagger', '', '', '', now());

-- URLs

INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (24048, 0, '2665145a-4474-4c57-97d1-c0299048177a', '2011-01-18 16:23:38+00', 'http://www.mop2001.com/bag.html');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (71412, 0, '463210f0-8e30-4601-8189-bc29c17a8498', '2011-01-18 16:23:38+00', 'http://www.amazon.co.jp/gp/product/B00005LA6G');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (80267, 0, '06b2ffd2-a4b6-492d-a598-583e8816353f', '2011-01-18 16:23:38+00', 'http://www.amazon.co.jp/gp/product/B0000YGBSG');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (151497, 0, 'b8dcbe2e-95ed-433e-9f70-3ec373ea19b0', '2011-01-18 16:23:38+00', 'http://www.discogs.com/release/30895');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (177282, 0, 'decacbb6-c2d7-4d07-8576-fd60f2392fc0', '2011-01-18 16:23:38+00', 'http://www.discogs.com/release/1722');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (181389, 0, '03e3d0be-d336-447e-b7da-06d0adcd15cd', '2011-01-18 16:23:38+00', 'http://www.discogs.com/artist/DJ+Distance');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (192298, 0, '503bee09-9392-4bbe-8e7d-b514dc7ab801', '2011-01-18 16:23:38+00', 'http://www.discogs.com/label/RAM+Records');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (192299, 0, '9fab9df3-7fea-471a-8815-6740bcf50afe', '2011-01-18 16:23:38+00', 'http://www.ramrecords.co.uk/');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (194973, 0, '4e5f8e53-a6fc-46e2-8fe4-2b3192be57e1', '2011-01-18 16:23:38+00', 'http://en.wikipedia.org/wiki/Rhythm_Zone');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (194975, 0, 'baaf9d35-392a-407a-b1bb-564015b146c6', '2011-01-18 16:23:38+00', 'http://www.discogs.com/label/Rhythm+Zone');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (194976, 0, 'e697226c-7752-47d5-9192-5722babd9c32', '2011-01-18 16:23:38+00', 'http://ja.wikipedia.org/wiki/Rhythm_zone');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (195251, 0, '97248598-7b73-40a0-8595-452dc0bb76e0', '2011-01-18 16:23:38+00', 'http://en.wikipedia.org/wiki/Freestyle_Dust');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (197281, 0, '66ff4ddb-349b-412d-b660-826d6db0c2c9', '2011-01-18 16:23:38+00', 'http://www.amazon.co.uk/gp/product/B000KJTG6K');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (366634, 0, '4bd8ba69-ac05-444d-be17-4ea037f5d09f', '2011-01-18 16:23:38+00', 'http://www.amazon.com/gp/product/B00001IVAI');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (445083, 0, '2a545d02-5447-4f16-a9c5-6239d98ea3f0', '2011-01-18 16:23:38+00', 'http://rzn.jp/');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (447790, 0, '98e8fa6d-c976-4b50-ad82-684f64ab5ca1', '2011-01-18 16:23:38+00', 'http://www.myspace.com/ramrecordsltd');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (447791, 0, '78c34a6e-4022-43b7-a727-cc30d9e3b46d', '2011-01-18 16:23:38+00', 'http://en.wikipedia.org/wiki/Ram_Records_(UK)');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (485359, 0, '4f9bc980-b8ee-4738-9625-3e7931d88cbc', '2011-01-18 16:23:38+00', 'http://www.amazon.com/gp/product/B000XULO2A');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (573314, 0, '02c14af2-5ce0-41ca-acd7-ee9913692558', '2011-01-18 16:23:38+00', 'http://www.amazon.co.jp/gp/product/B0001FAD2O');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (615313, 0, '5e766c4e-16dd-47f2-b032-d96ef23c0cf1', '2011-01-18 16:23:38+00', 'http://en.wikipedia.org/wiki/The_Love_Bug_(song)');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (615327, 0, 'dff9a8ca-2029-4818-92d4-d45b91484b0a', '2011-01-18 16:23:38+00', 'http://ja.wikipedia.org/wiki/The_Love_Bug');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (670179, 0, '63854ab2-4804-481f-8b07-e2cbe8192c0f', '2011-01-18 16:23:38+00', 'http://www.myspace.com/djdistancedub');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (670180, 0, '5eb2c075-3c3b-4cf7-ab77-2dacaee19366', '2011-01-18 16:23:38+00', 'http://dj-distance.blogspot.com/');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (670181, 0, '651248e8-6a8f-4365-948a-aa43559caf58', '2011-01-18 16:23:38+00', 'http://en.wikipedia.org/wiki/Distance_(musician)');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (697220, 0, '9bd7cece-05e3-438b-a2a1-070f8a829ed5', '2011-01-18 16:23:38+00', 'http://www.discogs.com/release/30896');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (748185, 0, '5855c1ff-5a05-4f32-a7c7-cbf83758fae0', '2011-01-18 16:23:38+00', 'http://www.amazon.co.uk/gp/product/B001IKWNCE');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (788379, 0, '37ad368b-d37d-46d4-be3a-349f78355253', '2011-01-18 16:23:38+00', 'https://www.imdb.com/name/nm4057169/');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (788381, 0, 'daa73242-f491-4d94-bbd0-b08a03a4a69b', '2011-01-18 16:23:38+00', 'http://www.paulallgood.com/');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (788382, 0, 'e0a79771-e9f0-4127-b58a-f5e6869c8e96', '2011-01-18 16:23:38+00', 'http://www.discogs.com/artist/Paul+Allgood');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (788384, 0, '6f0fce21-abd4-4ef7-a7cf-d9ec9830b350', '2011-01-18 16:23:38+00', 'http://farm4.static.flickr.com/3652/3334818186_6e19173c33_b.jpg');
INSERT INTO url (id, edits_pending, gid, last_updated, url) VALUES (788385, 0, '09ea2bb6-0280-4be1-aa7a-46e641c16451', '2011-01-18 16:23:38+00', 'http://members.boardhost.com/wedlock/');

-- Artists

INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (5, 11, 1986, '', NULL, 0, NULL, NULL, NULL, '0', NULL, 'a16d1433-ba89-4f72-a47b-a370add0bb55', 9496, NULL, 'BoA', 'BoA', 1, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, NULL, '', NULL, 0, NULL, NULL, NULL, '0', NULL, '3088b672-fba9-4b4b-8ae0-dce13babfbb4', 11545, NULL, 'Plone', 'Plone', 2, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (23, 9, 1985, '', 107, 0, NULL, NULL, NULL, '0', 2, '678ba12a-e485-44c7-8eaf-25e61a78a61b', 82524, '2012-08-27 01:34:50.942403+00', '後藤真希', 'Goto, Maki', 1, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, 1998, '', NULL, 0, NULL, NULL, NULL, '0', NULL, '22dd2db3-88ea-4428-a7a8-5cd3acf23175', 135345, NULL, 'm-flo', 'm-flo', 2, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, NULL, '', NULL, 0, NULL, NULL, NULL, '0', NULL, '5b85945c-c9ca-4346-a58e-7992f6c6a5b6', 180273, '2010-05-23 13:32:49.951844+00', 'SKC & Bratwa', 'SKC & Bratwa', 2, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, NULL, '', NULL, 0, NULL, NULL, NULL, '0', NULL, '802673f0-9b88-4e8a-bb5c-dd01d68b086f', 265420, NULL, '7人祭', '7nin Matsuri', 2, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, NULL, '', NULL, 0, NULL, NULL, NULL, '0', NULL, '802673f0-9b88-4e8a-bb5c-dd01d68b086a', 265421, NULL, 'Testy', 'Testy', 2, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, NULL, '', NULL, 0, NULL, NULL, NULL, '0', NULL, '97fa3f6e-557c-4227-bc0e-95a7f9f3285d', 283833, NULL, 'BAGDAD CAFE THE trench town', 'BAGDAD CAFE THE trench town', NULL, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, 2004, 'USA electro pop', NULL, 0, NULL, NULL, NULL, '0', NULL, '6fe9f838-112e-44f1-af83-97464f08285b', 398438, '2009-09-03 07:02:56.975521+00', 'Wedlock', 'Wedlock', 2, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, NULL, '', NULL, 0, NULL, NULL, NULL, '0', NULL, '05d83760-08b5-42bb-a8d7-00d80b3bf47c', 398598, NULL, 'Paul Allgood', 'Allgood, Paul', 1, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, NULL, 'UK dubstep artist Greg Sanders', NULL, 0, NULL, NULL, NULL, '0', NULL, '472bc127-8861-45e8-bc9e-31e8dd32de7a', 427385, '2009-12-30 20:10:06.209461+00', 'Distance', 'Distance', 1, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, 1989, '', NULL, 0, NULL, NULL, NULL, '0', NULL, '1946a82a-f927-40c2-8235-38d64f50d043', 242, NULL, 'The Chemical Brothers', 'Chemical Brothers, The', 2, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (NULL, NULL, 1988, '', 222, 0, NULL, NULL, NULL, '0', NULL, '38c5cdab-5d6d-43d1-85b0-dac41bde186e', 305, '2011-10-10 15:41:33.909553-05', 'Blind Melon', 'Blind Melon', 2, NULL, NULL);
INSERT INTO artist (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gender, gid, id, last_updated, name, sort_name, type, begin_area, end_area) VALUES (18, 6, 1952, '', 113, 0, NULL, NULL, NULL, '0', 1, '4d5ec626-2251-4bb1-b62a-f24f471e3f2c', 664994, '2011-06-10 16:23:52.317925+00', '이수만', 'Lee, Soo-Man', 1, NULL, NULL);

UPDATE artist_meta SET rating_count = NULL, rating = NULL WHERE id = 265420;
UPDATE artist_meta SET rating_count = 2, rating = 70 WHERE id = 11545;
UPDATE artist_meta SET rating_count = 1, rating = 100 WHERE id = 427385;
UPDATE artist_meta SET rating_count = 3, rating = 60 WHERE id = 135345;
UPDATE artist_meta SET rating_count = 3, rating = 87 WHERE id = 9496;
UPDATE artist_meta SET rating_count = NULL, rating = NULL WHERE id = 283833;
UPDATE artist_meta SET rating_count = 12, rating = 87 WHERE id = 242;
UPDATE artist_meta SET rating_count = NULL, rating = NULL WHERE id = 180273;
UPDATE artist_meta SET rating_count = 1, rating = 80 WHERE id = 398438;
UPDATE artist_meta SET rating_count = 1, rating = 80 WHERE id = 398598;
UPDATE artist_meta SET rating_count = NULL, rating = NULL WHERE id = 82524;

INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (265420, NULL, NULL, NULL, 0, NULL, NULL, NULL, 34039, '2011-01-18 15:20:17.74049+00', NULL, '7닌마츠리', '0', '7닌마츠리', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (265420, NULL, NULL, NULL, 0, NULL, NULL, NULL, 34038, '2011-01-18 15:20:17.74049+00', NULL, 'ななにんまつり', '0', 'ななにんまつり', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (265420, NULL, NULL, NULL, 0, NULL, NULL, NULL, 29643, '2011-01-18 15:20:17.74049+00', NULL, '7nin Matsuri', '0', '7nin Matsuri', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (265420, NULL, NULL, NULL, 0, NULL, NULL, NULL, 34037, '2011-01-18 15:20:17.74049+00', NULL, '7 nin matsuri', '0', '7 nin matsuri', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (427385, NULL, NULL, NULL, 0, NULL, NULL, NULL, 76296, '2011-01-18 15:20:17.74049+00', NULL, 'Distance', '0', 'Distance', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (427385, NULL, NULL, NULL, 0, NULL, NULL, NULL, 68866, '2011-01-18 15:20:17.74049+00', NULL, 'DJ Distance', '0', 'DJ Distance', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (135345, NULL, NULL, NULL, 0, NULL, NULL, NULL, 70047, '2011-01-18 15:20:17.74049+00', NULL, 'mediarite-flow crew', '0', 'mediarite-flow crew', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (135345, NULL, NULL, NULL, 0, NULL, NULL, NULL, 69816, '2011-01-18 15:20:17.74049+00', NULL, 'mflo', '0', 'mflo', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (135345, NULL, NULL, NULL, 0, NULL, NULL, NULL, 70046, '2011-01-18 15:20:17.74049+00', NULL, 'meteorite-flow crew', '0', 'meteorite-flow crew', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (135345, NULL, NULL, NULL, 0, NULL, NULL, NULL, 38930, '2011-01-18 15:20:17.74049+00', NULL, 'm-flow', '0', 'm-flow', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (135345, NULL, NULL, NULL, 0, NULL, NULL, NULL, 69814, '2011-01-18 15:20:17.74049+00', NULL, 'えむふろう', '0', 'えむふろう', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (135345, NULL, NULL, NULL, 0, NULL, NULL, NULL, 69815, '2011-01-18 15:20:17.74049+00', NULL, 'エムフロウ', '0', 'エムフロウ', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (9496, NULL, NULL, NULL, 0, NULL, NULL, NULL, 11905, '2011-01-18 15:20:17.74049+00', NULL, 'Beat of Angel', '0', 'Beat of Angel', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (9496, NULL, NULL, NULL, 0, NULL, NULL, NULL, 70378, '2011-01-18 15:20:17.74049+00', NULL, 'ボア', '0', 'ボア', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (9496, NULL, NULL, NULL, 0, NULL, NULL, NULL, 11902, '2011-01-18 15:20:17.74049+00', NULL, 'BoA Kwon', '0', 'BoA Kwon', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (9496, NULL, NULL, NULL, 0, NULL, NULL, NULL, 11901, '2011-01-18 15:20:17.74049+00', NULL, 'Kwon BoA', '0', 'Kwon BoA', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (9496, NULL, NULL, NULL, 0, NULL, NULL, NULL, 18652, '2011-01-18 15:20:17.74049+00', NULL, '보아', '0', '보아', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (242, NULL, NULL, NULL, 0, NULL, NULL, NULL, 34446, '2011-01-18 15:20:17.74049+00', NULL, 'Chemical Brother', '0', 'Chemical Brother', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (242, NULL, NULL, NULL, 0, NULL, NULL, NULL, 381, '2011-01-18 15:20:17.74049+00', NULL, 'CHEMICAL BROTHERS', '0', 'CHEMICAL BROTHERS', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (242, NULL, NULL, NULL, 0, NULL, NULL, NULL, 2207, '2011-01-18 15:20:17.74049+00', NULL, 'Chemical Brothers', '0', 'Chemical Brothers', NULL);
INSERT INTO artist_alias (artist, begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (398438, NULL, NULL, NULL, 0, NULL, NULL, NULL, 51110, '2011-01-18 15:20:17.74049+00', NULL, 'Wedlock(U.S.)', '0', 'Wedlock(U.S.)', NULL);

-- Artist Credits

INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (242, 1, '2011-01-18 16:24:02.551922+00', 'The Chemical Brothers', 2654, 'a17fe3a6-c6e7-3559-b2df-917fb52e65ff');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (9496, 1, '2011-01-18 16:24:02.551922+00', 'BoA', 2401, 'd47ef84c-318d-327b-8920-00ee48937224');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (11545, 1, '2011-01-18 16:24:02.551922+00', 'Plone', 115, '68734848-cbfb-3d65-9e0c-d4e2870650bf');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (135345, 1, '2011-01-18 16:24:02.551922+00', 'm-flo', 764, '2e12df5b-963e-38f7-9be3-d78adef836c3');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (180273, 1, '2011-01-18 16:24:02.551922+00', 'SKC & Bratwa', 13, '34279919-4d79-35e8-be13-c999873970e1');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (265420, 1, '2011-01-18 16:24:02.551922+00', '7人祭', 32, 'cc604781-0597-35e7-80c8-892cd7e70c24');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (265421, 1, '2011-01-18 16:24:02.551922+00', 'Testy', 32, 'f6daf4dc-acb7-3085-b18c-a14eab9eacfc');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (283833, 1, '2011-01-18 16:24:02.551922+00', 'BAGDAD CAFE THE trench town', 53, '174aaa1a-8beb-3d6c-94eb-fcb9aa58d50d');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (398438, 1, '2011-01-18 16:24:02.551922+00', 'Wedlock', 175, 'b6810eae-d108-3940-9b62-1667531589e6');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (398598, 1, '2011-01-18 16:24:02.551922+00', 'Paul Allgood', 68, '84d4a3ec-0e1a-30ec-b650-643f9ffaf25b');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (427385, 1, '2011-01-18 16:24:02.551922+00', 'Distance', 293, '76cd8b1c-c129-3631-81cd-c03679516925');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (792488, 2, '2011-01-18 16:24:02.551922+00', 'm-flo♥BoA', 21, '8df9a1df-24aa-3457-b994-15a715777ff6');
INSERT INTO artist_credit (id, artist_count, created, name, ref_count, gid) VALUES (305, 1, '2011-05-16 11:32:11.963929-05', 'Blind Melon', 1148, 'c891596f-5584-3022-804b-717f04c64edf');

INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (242, 242, '', 'The Chemical Brothers', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (9496, 9496, '', 'BoA', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (11545, 11545, '', 'Plone', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (135345, 135345, '', 'm-flo', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (180273, 180273, '', 'SKC & Bratwa', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (265420, 265420, '', '7人祭', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (265421, 265421, '', 'Testy', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (283833, 283833, '', 'BAGDAD CAFE THE trench town', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (398438, 398438, '', 'Wedlock', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (398598, 398598, '', 'Paul Allgood', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (427385, 427385, '', 'Distance', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (135345, 792488, '♥', 'm-flo', 0);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (9496, 792488, '', 'BoA', 1);
INSERT INTO artist_credit_name (artist, artist_credit, join_phrase, name, position) VALUES (305, 305, '', 'Blind Melon', 0);

-- Events
INSERT INTO event (id, gid, name, type) VALUES (7, 'eb668bdc-a928-49a1-beb7-8e37db2a5b65', 'Cool Festival', 2);
INSERT INTO event (begin_date_day, begin_date_month, begin_date_year, cancelled, comment, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, last_updated, name, time, type) VALUES (12, 5, 2014, '1', 'A Comment', 0, 13, 5, 2014, '1', '166359d1-5a63-4033-945c-a6707844fb19', 8, '2014-08-01 22:16:44.339332+00', 'Sadly Cancelled Festival', '20:00', 2);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 52512, 798);
INSERT INTO l_artist_event (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 398598, 8, 201, '2011-01-18 15:31:00.495651+00', 52512);

INSERT INTO event_alias (id, event, name, sort_name) VALUES
    (1, 7, 'El Festival Cool', 'Festival Cool, El'),
    (2, 7, 'Warm Festival', 'Warm Festival');

-- Instruments

INSERT INTO instrument (id, gid, name, type) VALUES (7, '3590521b-8c97-4f4b-b1bb-5f68d3663d8a', 'English horn', 1);

INSERT INTO instrument_alias (id, instrument, name, sort_name) VALUES
    (1, 7, 'cor anglais', 'cor anglais'),
    (2, 7, 'English horn', 'English horn');

-- RGs

INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (265420, '', 0, 'b84625af-6229-305f-9f1b-59c0185df016', 377462, '2009-05-24 20:47:00.490177+00', 'サマーれげぇ!レインボー', 2);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (265421, '', 0, 'b84625af-6229-305f-9f1b-59c0185df017', 377463, '2009-05-24 20:47:00.490177+00', 'Testy', 2);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (11545, '', 0, '202cad78-a2e1-3fa7-b8bc-77c1f737e3da', 155364, '2009-05-24 20:47:00.490177+00', 'For Beginner Piano', 1);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (427385, '', 0, '22b54315-6e51-350b-bb34-e6e16f7688bd', 597897, '2009-05-24 20:47:00.490177+00', 'My Demons', 1);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (427385, '', 0, '56683a0b-45b8-3664-a231-5b68efe2e7e2', 761939, '2009-05-24 20:47:00.490177+00', 'Repercussions', 1);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (135345, '', 0, '153f0a09-fead-3370-9b17-379ebd09446b', 403214, '2009-05-24 20:47:00.490177+00', 'the Love Bug', 2);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (9496, '', 0, '23f421e7-431e-3e1d-bcbf-b91f5f7c5e2c', 326504, '2009-05-24 20:47:00.490177+00', 'LOVE & HONESTY', 1);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (242, '', 0, '22ca85ec-ee39-3895-aef9-dee5d5c2f4d6', 724150, '2010-10-16 17:05:05.553747+00', 'Surrender', 1);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (398438, '', 0, 'cde61708-3be3-31ad-ba61-06af6af59565', 703316, '2009-05-24 20:47:00.490177+00', 'Exogamy', 1);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (398598, '', 0, '04ba5879-e3ac-3cba-8a69-ee7da8ad8c4c', 772397, '2009-05-24 20:47:00.490177+00', 'An Inextricable Tale Audiobook', 1);
INSERT INTO release_group (artist_credit, comment, edits_pending, gid, id, last_updated, name, type) VALUES (305, '', 0, '9dba763e-7cff-36b3-af88-b755f237a4c7', 61258, '2009-05-24 15:47:00.490177-05', 'Soup', 1);

UPDATE release_group_meta SET first_release_date_month = 7, rating_count = NULL, first_release_date_year = 2001, release_count = 2, first_release_date_day = 4, rating = NULL WHERE id = 377462;
UPDATE release_group_meta SET first_release_date_month = 9, rating_count = NULL, first_release_date_year = 1999, release_count = 3, first_release_date_day = 13, rating = NULL WHERE id = 155364;
UPDATE release_group_meta SET first_release_date_month = 1, rating_count = 1, first_release_date_year = 2007, release_count = 1, first_release_date_day = 29, rating = 80 WHERE id = 597897;
UPDATE release_group_meta SET first_release_date_month = 11, rating_count = NULL, first_release_date_year = 2008, release_count = 1, first_release_date_day = 17, rating = NULL WHERE id = 761939;
UPDATE release_group_meta SET first_release_date_month = 3, rating_count = 2, first_release_date_year = 2004, release_count = 1, first_release_date_day = 17, rating = 100 WHERE id = 403214;
UPDATE release_group_meta SET first_release_date_month = 1, rating_count = NULL, first_release_date_year = 2004, release_count = 3, first_release_date_day = 15, rating = NULL WHERE id = 326504;
UPDATE release_group_meta SET first_release_date_month = NULL, rating_count = 3, first_release_date_year = 1999, release_count = 9, first_release_date_day = NULL, rating = 87 WHERE id = 724150;
UPDATE release_group_meta SET first_release_date_month = 6, rating_count = NULL, first_release_date_year = 1998, release_count = 2, first_release_date_day = 15, rating = NULL WHERE id = 148670;
UPDATE release_group_meta SET first_release_date_month = NULL, rating_count = NULL, first_release_date_year = NULL, release_count = 0, first_release_date_day = NULL, rating = NULL WHERE id = 284354;
UPDATE release_group_meta SET first_release_date_month = 4, rating_count = 1, first_release_date_year = 2008, release_count = 1, first_release_date_day = 29, rating = 80 WHERE id = 703316;
UPDATE release_group_meta SET first_release_date_month = 11, rating_count = NULL, first_release_date_year = 2007, release_count = 1, first_release_date_day = 8, rating = NULL WHERE id = 772397;

INSERT INTO release_group_secondary_type_join (release_group, secondary_type) VALUES (761939, 7);
INSERT INTO release_group_secondary_type_join (release_group, secondary_type) VALUES (772397, 3);

-- Recordings

INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, '44704dda-b877-4551-a2a8-c1f764476e65', 1542682, NULL, 267560, 'On My Bus');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, '8920288e-7541-48a7-b23b-f80447c8b1ab', 1542683, NULL, 230506, 'Top & Low Rent');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, '6e89c516-b0b6-4735-a758-38e31855dcb6', 1542684, NULL, 237133, 'Plock');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, '791d9b27-ae1a-4295-8943-ded4284f2122', 1542685, NULL, 229826, 'Marbles');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, '4f392ffb-d3df-4f8a-ba74-fdecbb1be877', 1542686, NULL, 217440, 'Busy Working');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, 'dc891eca-bf42-4103-8682-86068fe732a5', 1542687, NULL, 227293, 'The Greek Alphabet');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, '25e9ae0f-8b7d-4230-9cde-9a07f7680e4a', 1542688, NULL, 244506, 'Press a Key');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, '6f9c8c32-3aae-4dad-b023-56389361cf6b', 1542689, NULL, 173960, 'Bibi Plone');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, '7e379a1d-f2bc-47b8-964e-00723df34c8a', 1542690, NULL, 208706, 'Be Rude to Your School');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (11545, '', 0, 'a8614bda-42dc-43c7-ac5f-4067acb6f1c5', 1542691, NULL, 320067, 'Summer Plays Out');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'c4ef59be-bfa1-4601-81f8-9a65e3d8c1c9', 6750260, NULL, 369000, 'Night Vision');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '290792d5-5b32-4ba7-bd06-272589ab9669', 6750261, NULL, 291000, 'My Demons');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'ccb347ea-5123-4bc8-a1a8-f60cf5fee9ad', 6750262, NULL, 348000, 'Weigh Down');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '03144356-5c08-47f8-8590-39a623cc5f36', 6750263, NULL, 319000, 'Traffic');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '35db5502-4937-4653-8494-c4291f1f22fe', 6750264, NULL, 280000, 'Mistral');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'a4eb6323-519d-44e4-8ab7-df0a0f9df349', 6750265, NULL, 265000, 'Cyclops');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '7a356856-9483-42c2-bed9-dc07cb555952', 6750266, NULL, 334000, 'Cella');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '3b869875-6f4e-40e8-abda-d14184b073cd', 6750267, NULL, 300000, 'Ska');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '34061710-6ed8-4999-9ee6-177bad0af0a3', 6750268, NULL, 311000, 'Fractured');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '4ce2ac82-56f6-4a8a-af9b-33af6c67f30d', 6750269, NULL, 272000, 'Tuning');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'e5a5847b-451b-4051-a09b-8295329097e3', 6750270, NULL, 314000, 'Confined');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '9011e90d-b7e3-400b-b932-305f94608772', 6750271, NULL, 339000, 'Delight');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '4f3321a6-7277-4c0e-808f-423b81e083e0', 8509231, NULL, 308706, 'Magnesium');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '1468c415-12bd-4fb9-b9e9-ca8d3f1df161', 8509232, NULL, 340626, 'Out of Mind');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '4abc57ff-035a-4612-9b53-6962f8216c9b', 8509233, NULL, 326066, 'Free Me');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'cd836930-a4c7-45ac-821f-5642e99d4428', 8509234, NULL, 340133, 'Koncrete');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'cbd9e885-b160-4c3c-9b87-468914839d45', 8509235, NULL, 353773, 'Loosen My Grip');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '5a9d7af8-b149-4764-ad98-cf839a376a60', 8509236, NULL, 296000, 'Repercussions');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '7e97f000-b36d-463e-bc86-795999fc9146', 8509237, NULL, 329026, 'Mirror Tell');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'f08c7c21-252b-46a3-9af1-ee53fb07fb56', 8509238, NULL, 295786, 'Sending Chills');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '9e57a454-076e-4c2f-91f5-7c95efd3e05e', 8509239, NULL, 276373, 'Skeleton Grin');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'a242aea7-7eff-41b2-9c83-a41f7e7b2c84', 8692017, NULL, 355346, 'V');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '11536500-0baa-492d-a821-3075ed66a3bc', 8692018, NULL, 209826, 'Headstrung');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '5c1b7a3d-89bd-408b-a0f5-3d7482c7dead', 8692019, NULL, 291773, 'Misfit');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'f2f8c768-4a5a-48a8-a7e0-e3385870e7aa', 8692020, NULL, 350120, 'Present Day');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '14d5dfdb-6aa8-45a9-b2dd-bc5ed23e6211', 8692021, NULL, 317733, 'Feel Me');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '4deca105-005e-442e-b60d-f0d04f7f4e9d', 8692022, NULL, 325720, 'Radical');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'de6d544e-914e-4f28-8f17-e83a1da7caa8', 8692023, NULL, 334266, 'No Sunshine');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, 'd96d5cc7-7c31-4b4a-b38a-7d8bab3725f4', 8692024, NULL, 305600, 'Victim Support');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (427385, '', 0, '3f7ea9f9-1a8e-4f30-bcf4-54f79d0f7417', 8692025, NULL, 286186, 'Battle Sequence');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (792488, '', 0, '0cf3008f-e246-428f-abc1-35f87d584d60', 4525123, NULL, 242226, 'the Love Bug');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (792488, '', 0, '84c98ebf-5d40-4a29-b7b2-0e9c26d9061d', 4525010, NULL, 222000, 'the Love Bug (Big Bug NYC remix)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (283833, '', 0, '3f33fc37-43d0-44dc-bfd6-60efd38810c5', 4525011, NULL, 333000, 'the Love Bug (cover)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, 'c869cc03-cb88-462b-974e-8e46c1538ad4', 3451976, NULL, 255146, 'Rock With You');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, 'ddbe4d0c-9b41-4db8-9244-cd08cc6ee2d8', 1307406, NULL, 307000, 'Shine We Are!');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '0c0245df-34f0-416b-8c3f-f20f66e116d0', 3622822, NULL, 273000, 'SOME DAY ONE DAY (feat. VERBAL (m-flo))');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '150621f0-3e08-43a3-9882-6a68322fcc04', 3622823, NULL, 282000, 'LOVE & HONESTY');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, 'f0f18e4b-3697-4b4d-9bd6-e986cfa38906', 3584195, NULL, 261600, 'Midnight Parade');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, 'f9234d15-137b-4229-9b76-717885ba7224', 3622825, NULL, 227000, 'Be the one');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '3f3ec8e2-24be-46dc-812b-bb5d5b608eb0', 3622826, NULL, 260000, 'EXPECT');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, 'f0de8cba-2f1e-4633-9163-c8c933b25d87', 3622827, NULL, 349000, 'OVER～across the time～');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '98a4adf6-8761-4adb-a940-acb58dc664b3', 3622828, NULL, 290000, '心の手紙');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '25db6c3b-eeb7-4258-9a81-fb9b4c903bfc', 3451975, NULL, 206066, 'DOUBLE');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '18c16c80-421d-476f-893c-0b02f964bd86', 3622830, NULL, 295000, 'Easy To Be Hard');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, 'df229cdb-9539-46b7-92e9-d164b27f6361', 3622831, NULL, 186000, 'Song With No Name～名前のない歌～');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '1272ecf4-fc8d-4d10-889c-afe6a1fa2d8f', 3584196, NULL, 203840, 'Milky Way 〜君の歌〜');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '40e4acf3-546e-4ccc-b5c5-3a45686c2d6c', 9538744, NULL, NULL, 'Shine We Are! (Video clip)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '326d943f-9ca5-4a54-bdcc-76a2b5facf3a', 9538745, NULL, NULL, 'Rock With You (Video clip)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '8d611994-ce7e-43dc-9793-b2b2b8bd12ff', 9538746, NULL, NULL, 'NO.1 (Video clip)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '1597d65a-d012-497d-a2f2-5c98e1ed778c', 9538747, NULL, NULL, 'Rock With You (Making of)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, '675ac228-7181-44b5-873f-056b242f19c0', 9538748, NULL, NULL, 'Commercial Films');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (9496, '', 0, 'b950c904-ebfc-4eec-af65-1913f78c51c9', 9538749, NULL, NULL, 'Interview');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'bf7845cc-eac3-48a3-8b06-543b4b7ba117', 1062699, NULL, 290853, 'Hey Boy Hey Girl');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'fc336694-71c3-4963-b221-2c0687e26cfb', 1353886, NULL, 441066, 'Out of Control');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '1344425c-47ea-4d7b-a759-c7f5ec0fa191', 2726277, NULL, 287386, 'Asleep From Day');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '12842247-cabf-4a85-9e8d-4e1201c42364', 2726271, NULL, 320146, 'Music: Response');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '0982e813-a279-482c-8057-285d07372fb9', 2726274, NULL, 186826, 'Orange Wedge');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'e186e921-9d7e-4cd9-b499-4030a1e78960', 15296, NULL, 270040, 'Racing the Tide');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '7d37745a-fdf8-4ee4-b6f2-1453bd432572', 2726276, NULL, 518906, 'The Sunshine Underground');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '6efd1d7e-4c99-4dee-b3ef-55724809fb28', 2726281, NULL, 405760, 'Dream On');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '6abc5eed-68a4-4ea3-a092-374772b8f09d', 2726275, NULL, 235360, 'Let Forever Be');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '4b364aa9-f227-42b8-b0c2-ee32f5ccf4fa', 2726272, NULL, 256253, 'Under the Influence');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '310a7db0-9a0f-4833-817f-ae4f6adc026e', 2726278, NULL, 326906, 'Got Glint?');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '9c83afdc-cd59-4d2a-b990-611b6c7c1899', 2726280, NULL, 269360, 'Surrender');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'e01f42b4-7fcd-482a-81bf-5aa8b76a961d', 4844120, NULL, 364560, 'Hey Boy Hey Girl (extended version)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '6ac6e0d3-e4ba-4cd0-8480-17771b66c3e7', 4844121, NULL, 318946, 'Flashback');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '4f7ba3c3-a4db-4237-a035-06627152b217', 4844122, NULL, 249493, 'Power Move');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '459b1b98-9dfb-41b8-aa35-4b1c201012b3', 4844123, NULL, 439000, 'Out of Control (Sasha remix)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'd2f35e7e-40a2-43ef-8bb5-d663f89ece60', 8106513, NULL, 319000, 'Music: Response');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'edb27a19-282f-45d8-801d-7150f6d5b03c', 8106514, NULL, 256000, 'Under the Influence');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '85d192d5-22f2-4e00-bdbc-526736214dfb', 8106515, NULL, 439000, 'Out of Control');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'fae71a78-e80c-4c99-b54c-5dbcc3229a62', 8106516, NULL, 186000, 'Orange Wedge');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'eb6d914e-67b7-4e71-b405-f91631d09752', 8106517, NULL, 236000, 'Let Forever Be');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'a2158231-1782-4c8c-95a8-1a3822598313', 8106507, NULL, 518000, 'The Sunshine Underground');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '1c070213-82c2-4df3-bead-2083439f6314', 8106508, NULL, 287000, 'Asleep From Day');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '9ddd8cfc-37de-4258-9975-1528e093e436', 8106509, NULL, 326000, 'Got Glint?');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'e2020511-784c-4013-8985-c263edb43b8b', 8106510, NULL, 290000, 'Hey Boy Hey Girl');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '5b74ba85-89c4-4291-8f59-9fdf431494fc', 8106511, NULL, 270000, 'Surrender');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'd79b0fda-7004-45fa-86ad-ef6f2ab2b3fc', 8106512, NULL, 406000, 'Dream On');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'cc824d2a-cbed-492f-843e-4463c7cab7d7', 11484260, NULL, 102000, 'Out of Control');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, 'ba5daf89-a258-4d88-bd7a-f861f64ac7e1', 11484261, NULL, 99000, 'Let Forever Be');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '5f3a2eee-7e50-466c-aa4f-73184b1b1a37', 11484262, NULL, 82000, 'The Sunshine Underground');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '5a247ba6-4ec7-4800-bfd0-5134280866f8', 11484263, NULL, 91000, 'Asleep From Day');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '79052eed-d17d-4bd7-8f65-51adade0b8f4', 11484264, NULL, 83000, 'Hey Boy, Hey Girl');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (242, '', 0, '8d85165b-8af3-4db2-82de-5b117d7d8a3a', 11484265, NULL, 91000, 'Got Glint?');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (180273, '', 0, '643d0549-ad6d-4692-9a73-0ee98b05c03b', 7505756, NULL, 379000, 'Time Is Now');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398438, '', 0, '88d26635-cfc8-4fd9-b81e-36f7a1b3d270', 7905439, NULL, 256666, 'Reverend Charisma');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398438, '', 0, '37a8d72a-a9c9-4edc-9ecf-b5b58e6197a9', 7905440, NULL, 86666, 'Dear Diary');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398438, '', 0, '7152d72e-c7d4-4b15-9f8e-97fabb88b1af', 7905441, NULL, 213666, 'Black Sundress');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398438, '', 0, 'da778cae-9e88-4385-af7f-666e102b94af', 7905442, NULL, 266666, 'Allegiance?WTF?');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398438, '', 0, '150b8c8c-ed02-4ade-99cc-e8d673f6f5b9', 7905443, NULL, 254666, 'Maggie&Heidi');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398438, '', 0, '9815c3e5-f842-41c2-bb5c-bcd0dd97dbe5', 7905444, NULL, 236666, 'Discopharma');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398438, '', 0, '6356e37c-a44b-4218-80ce-6fb6c11a124f', 7905445, NULL, 230666, 'Still Unsatisfied');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398438, '', 0, '4878bc36-7306-497a-b45a-561d9f7f8573', 7905446, NULL, 274666, 'Asseswaving');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398438, '', 0, '15918f5f-20b1-4e1a-888d-8762790017a9', 7905447, NULL, 249653, 'Just Because');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, 'b997f9c9-c7d9-42cc-a9dd-2561215c6611', 8621499, NULL, 1027000, 'Here');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, 'c87d7541-3478-4c71-9e14-10bad6e16768', 8621500, NULL, 394000, 'Kira');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, 'f2cd70c2-e077-40c2-a4aa-351bedf8394f', 8621501, NULL, 249000, 'Life as a Genuine Fake');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, '84b725db-def5-4c39-b8f2-ee7b96c18fde', 8621502, NULL, 370000, 'It Takes a Thief');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, '52fce516-1836-41ad-b21d-dcb555c124bb', 8621503, NULL, 2036000, 'Good Old Albermarle (6x9)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, '572ceed5-7497-40fe-a31a-e09ff68b3155', 8621504, NULL, 2770000, 'Life as an Ampersand');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, 'f7b7fcbc-d1af-4366-8a43-506e92c21ed6', 8621505, NULL, 1071000, 'Nat Sherman and the Beauty of the Blade');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, 'c5c1380a-214d-4073-8682-70ece2e1a08d', 8621506, NULL, 1614000, 'Saul''s First Vision');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, '3be114ea-e757-4e31-a8b1-5c55a69d5ea5', 8621507, NULL, 562000, 'The Rattigan');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, '77fe028e-b026-4b0e-9fde-b60280508ac9', 8621508, NULL, 758000, 'The Rattigan, Part Two');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, '5c443b7f-bf16-402a-ad45-4fca59dc1bf6', 8621509, NULL, 322000, 'Wasted Early Sunday Morning');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, '87d58ffb-3aee-49c7-b382-afad76ea8777', 8621510, NULL, 1097000, 'I''m Not Crazy');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, 'ff424a8b-e3aa-494b-a159-3eb51cf0bf6f', 8621511, NULL, 2074000, 'The Saul Shields Gospel Hour');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, '1bf74356-f781-4f3f-90bd-cdccfbfbf0aa', 8621512, NULL, 216000, 'Saul''s Second Vision');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (398598, '', 0, 'c41ae2e6-d88f-4ab1-a0e8-02141893766f', 8621513, NULL, 802000, 'One Thing Leads to Another / Epilogue');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (265420, '', 0, '162630d9-36d2-4a8d-ade1-1c77440b34e7', 4223059, NULL, 296026, 'サマーれげぇ!レインボー');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (265420, '', 0, '487cac92-eed5-4efa-8563-c9a818079b9a', 4223060, NULL, 213106, 'HELLO! また会おうね (7人祭 version)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (265420, '', 0, 'eb818aa4-d472-4d2b-b1a9-7fe5f1c7d26e', 4223061, NULL, 292800, 'サマーれげぇ!レインボー (instrumental)');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (305, '', 0, 'c43ee188-0049-4eec-ba2e-0385c5edd2db', 449989, NULL, 211133, 'Hello Goodbye / Galaxie');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (305, '', 0, 'c830c239-3f91-4485-9577-4b86f92ad725', 449990, NULL, 240400, '2 X 4');
INSERT INTO recording (artist_credit, comment, edits_pending, gid, id, last_updated, length, name) VALUES (305, '', 0, 'c0beb80b-4185-4328-8761-b9e45a5d0ac6', 14488617, NULL, 128000, 'Hello Goodbye [hidden track]');

UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4223059;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4223060;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4223061;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542682;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542683;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542684;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542685;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542686;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542687;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542688;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542689;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542690;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1542691;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750260;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750261;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750262;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750263;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750264;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750265;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750266;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750267;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750268;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750269;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750270;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 6750271;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8509231;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8509232;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8509233;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8509234;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8509235;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8509236;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8509237;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8509238;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8509239;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8692017;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8692018;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8692019;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8692020;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8692021;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8692022;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8692023;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8692024;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8692025;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4525123;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4525010;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4525011;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3451976;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1307406;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3622822;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3622823;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3584195;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3622825;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3622826;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3622827;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3622828;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3451975;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3622830;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3622831;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 3584196;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 9538744;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 9538745;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 9538746;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 9538747;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 9538748;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 9538749;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2746106;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2746107;
UPDATE recording_meta SET rating_count = 1, rating = 50 WHERE id = 1062699;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 1353886;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2726277;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2726271;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2726274;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 15296;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2726276;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2726281;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2726275;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2726272;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2726278;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 2726280;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4844120;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4844121;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4844122;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 4844123;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106513;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106514;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106515;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106516;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106517;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106507;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106508;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106509;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106510;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106511;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8106512;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 11484260;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 11484261;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 11484262;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 11484263;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 11484264;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 11484265;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7505755;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7505756;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7505767;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7505768;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7905439;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7905440;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7905441;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7905442;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7905443;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7905444;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7905445;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7905446;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 7905447;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621499;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621500;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621501;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621502;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621503;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621504;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621505;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621506;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621507;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621508;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621509;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621510;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621511;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621512;
UPDATE recording_meta SET rating_count = NULL, rating = NULL WHERE id = 8621513;

INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189218, 'GBAAA9900303', 1062699, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189222, 'GBAAA9900297', 1353886, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189217, 'GBAAA9900301', 2726277, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189216, 'GBAAA9900295', 2726271, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189215, 'GBAAA9900298', 2726274, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189224, 'GBAAA9900300', 2726276, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189223, 'GBAAA9900305', 2726281, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 38816, 'GBAAA9900299', 2726275, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189220, 'GBAAA9900296', 2726272, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189219, 'GBAAA9900302', 2726278, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 189225, 'GBAAA9900304', 2726280, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 176395, 'GBAAA9900309', 4844121, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 176392, 'GBAAA9900528', 4844122, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 176393, 'GBAAA9900529', 4844123, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 4255, 'JPA600102450', 4223059, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 4256, 'JPA600102460', 4223060, 0);
INSERT INTO isrc (created, edits_pending, id, isrc, recording, source) VALUES ('2011-01-18 15:56:00.408782+00', 0, 4257, 'JPA600102459', 4223061, 0);

-- Releases

INSERT INTO release (artist_credit, barcode, comment, edits_pending, gid, id, language, last_updated, name, packaging, quality, release_group, script, status) VALUES (265420, '4942463511227', '', 0, '0385f276-5f4f-4c81-a7a4-6bd7b8d85a7e', 49161, 198, NULL, 'サマーれげぇ!レインボー', NULL, -1, 377462, 85, 1);
INSERT INTO release (artist_credit, barcode, comment, edits_pending, gid, id, language, last_updated, name, packaging, quality, release_group, script, status) VALUES (265420, '4942463511227', '', 0, 'b3b7e934-445b-4c68-a097-730c6a6d47e6', 123054, 198, NULL, 'Summer Reggae! Rainbow', NULL, 2, 377462, 28, 4);
INSERT INTO release (artist_credit, barcode, comment, edits_pending, gid, id, language, last_updated, name, packaging, quality, release_group, script, status) VALUES (265421, '4942463511227', '', 0, 'b3b7e934-445b-4c68-a097-730c6a6d47e7', 123055, 198, NULL, 'Testy', NULL, -1, 377463, 28, 4);
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 155364, 0, NULL, 24752, -1, '2010-02-22 02:01:29.413661+00', 28, 120, 'For Beginner Piano', 11545, '5021603064126', '', '4f5a6b97-a09b-4893-80d1-eae1f3bfa221');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 155364, 0, NULL, 243064, -1, '2010-02-22 02:01:29.413661+00', 28, 120, 'For Beginner Piano', 11545, NULL, '', 'fbe4eb72-0f24-3875-942e-f581589713d4');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 155364, 0, NULL, 654729, -1, '2010-02-22 02:01:29.413661+00', 28, 120, 'For Beginner Piano', 11545, '', '', 'dd66bfdd-6097-32e3-91b6-67f47ba25d4c');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 597897, 0, NULL, 246898, -1, '2010-06-02 13:52:58.277743+00', 28, 120, 'My Demons', 427385, '600116817020', '', 'adcf7b48-086e-48ee-b420-1001f88d672f');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (3, 761939, 0, NULL, 446581, -1, '2010-06-02 13:25:54.789939+00', 28, 120, 'Repercussions', 427385, '600116822123', '', '3b3d130a-87a8-4a47-b9fb-920f2530d134');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 403214, 0, NULL, 59662, -1, '2009-08-17 08:23:42.424855+00', 28, 120, 'the Love Bug', 135345, '4988064451180', '', 'aff4a693-5970-4e2e-bd46-e2ee49c22de7');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (4, 326504, 0, NULL, 4675, -1, NULL, 28, 198, 'LOVE & HONESTY', 9496, NULL, '', '757a1723-3769-4298-89cd-48d31177852a');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 326504, 0, NULL, 59312, -1, '2009-09-24 19:33:36.305407+00', 85, 198, 'LOVE & HONESTY', 9496, '4988064173907', '', 'cacc586f-c2f2-49db-8534-6f44b55196f2');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 326504, 0, NULL, 558940, -1, '2009-09-24 19:33:36.305407+00', 85, 198, 'LOVE & HONESTY', 9496, '4988064173891', '', '28fc2337-985b-3da9-ac40-ad6f28ff0d8e');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (2, 724150, 0, NULL, 8312, -1, '2009-07-20 18:08:07.739267+00', 28, 120, 'Surrender', 242, NULL, '', '8268c2f8-bfc3-4079-9c25-fad0d69a38df');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 724150, 0, NULL, 19969, 2, '2010-10-03 08:04:16.761636+00', 28, 120, 'Surrender', 242, '724384761028', '', '91d36d01-a898-426d-bc28-35ee5b7a7b6b');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 724150, 0, NULL, 31689, 2, '2010-10-03 08:04:16.761636+00', 28, 120, 'Surrender', 242, '9326165000435', '', '7e188ed0-249a-3f43-a13e-0a5085b1ab4b');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 724150, 0, NULL, 31690, 2, '2010-10-03 08:04:16.761636+00', 28, 120, 'Surrender', 242, '724384761028', '', 'b4820c33-41f0-3fd5-854e-8b9f98a60b50');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 724150, 0, NULL, 278075, 2, '2010-10-03 08:04:16.761636+00', 28, 120, 'Surrender', 242, '724384761080', '', '46706d7e-f543-379c-a626-b0f0f0e7fbb4');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 724150, 0, NULL, 338506, -1, '2010-10-03 08:04:16.761636+00', 28, 120, 'Surrender', 242, '724384884901', '', '5199f302-99bc-3c80-a9ec-dffd68867c10');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 724150, 0, NULL, 400930, -1, NULL, 28, 120, 'Surrender', 242, '724384761011', '', '0117b17b-7721-49a9-a202-089f8d1b3d42');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (2, 724150, 0, NULL, 741970, -1, '2010-10-16 17:05:05.553747+00', 28, 120, 'Surrender', 242, NULL, '', 'a84b9fea-aee9-4e1f-b5a2-a5a23c673688');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 724150, 0, NULL, 748905, 2, '2010-10-03 08:04:16.761636+00', 28, 120, 'Surrender', 242, '9326165000435', '', '699c8545-75b4-378e-bc29-9d0f951f7eee');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 703316, 0, NULL, 375273, -1, NULL, 28, 120, 'Exogamy', 398438, '844395014422', '', '980e0f65-930e-4743-95d3-602665c25c15');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 772397, 0, NULL, 459740, -1, NULL, 28, 120, 'An Inextricable Tale Audiobook', 398598, '634479663338', '', '4ccb3e54-caab-4ad4-94a6-a598e0e52eec');
INSERT INTO release (status, release_group, edits_pending, packaging, id, quality, last_updated, script, language, name, artist_credit, barcode, comment, gid) VALUES (1, 61258, 0, NULL, 1247355, -1, NULL, 28, 120, 'Soup', 305, '0208311348266', '', 'ec0d0122-b559-4aa1-a017-7068814aae57');

UPDATE release_meta SET amazon_asin = 'B00005LA6G', date_added = '2005-07-09 06:10:18.57297+00', info_url = 'http://www.amazon.co.jp/gp/product/B00005LA6G', cover_art_presence = 'absent' WHERE id = 49161;
UPDATE release_meta SET amazon_asin = 'B00005LA6G', date_added = '2006-03-18 07:45:41.990026+00', info_url = 'http://www.amazon.co.jp/gp/product/B00005LA6G', cover_art_presence = 'absent' WHERE id = 123054;
UPDATE release_meta SET amazon_asin = 'B00005LA6G', date_added = '2006-03-18 07:45:41.990026+00', info_url = 'http://www.amazon.co.jp/gp/product/B00005LA6G', cover_art_presence = 'absent' WHERE id = 123055;
UPDATE release_meta SET amazon_asin = 'B00001IVAI', date_added = '2003-10-28 13:47:22.987027+00', info_url = 'http://www.amazon.com/gp/product/B00001IVAI', cover_art_presence = 'absent' WHERE id = 24752;
UPDATE release_meta SET amazon_asin = 'B00001IVAI', date_added = '2003-10-28 13:47:22.987027+00', info_url = 'http://www.amazon.com/gp/product/B00001IVAI', cover_art_presence = 'absent' WHERE id = 243064;
UPDATE release_meta SET amazon_asin = NULL, date_added = '2003-10-28 13:47:22.987027+00', info_url = NULL, cover_art_presence = 'absent' WHERE id = 654729;
UPDATE release_meta SET amazon_asin = 'B000KJTG6K', date_added = '2007-03-14 23:33:51.126346+00', info_url = 'http://www.amazon.co.uk/gp/product/B000KJTG6K', cover_art_presence = 'absent' WHERE id = 246898;
UPDATE release_meta SET amazon_asin = 'B001IKWNCE', date_added = '2008-10-05 16:57:46.005559+00', info_url = 'http://www.amazon.co.uk/gp/product/B001IKWNCE', cover_art_presence = 'absent' WHERE id = 446581;
UPDATE release_meta SET amazon_asin = 'B0001FAD2O', date_added = '2005-09-07 02:23:50.964236+00', info_url = 'http://www.amazon.co.jp/gp/product/B0001FAD2O', cover_art_presence = 'present' WHERE id = 59662;
UPDATE release_meta SET amazon_asin = 'B0000YGBSG', date_added = '2004-02-15 07:01:30.766831+00', info_url = 'http://www.amazon.co.jp/gp/product/B0000YGBSG', cover_art_presence = 'absent' WHERE id = 4675;
UPDATE release_meta SET amazon_asin = 'B0000YG9NS', date_added = '2005-03-12 19:22:14.383478+00', info_url = 'http://www.amazon.co.jp/gp/product/B0000YG9NS', cover_art_presence = 'absent' WHERE id = 59312;
UPDATE release_meta SET amazon_asin = 'B0000YGBSG', date_added = '2005-03-12 19:22:14.383478+00', info_url = 'http://www.amazon.co.jp/gp/product/B0000YGBSG', cover_art_presence = 'absent' WHERE id = 558940;
UPDATE release_meta SET amazon_asin = 'B00000J8EK', date_added = NULL, info_url = 'http://www.amazon.com/gp/product/B00000J8EK', cover_art_presence = 'absent' WHERE id = 8312;
UPDATE release_meta SET amazon_asin = 'B00000J8EK', date_added = '2004-08-23 07:28:55.160816+00', info_url = 'http://www.amazon.co.uk/gp/product/B00000J8EK', cover_art_presence = 'absent' WHERE id = 19969;
UPDATE release_meta SET amazon_asin = NULL, date_added = '2004-08-23 07:28:55.160816+00', info_url = NULL, cover_art_presence = 'absent' WHERE id = 31689;
UPDATE release_meta SET amazon_asin = 'B00000J8EK', date_added = '2004-08-23 07:28:55.160816+00', info_url = 'http://www.amazon.co.uk/gp/product/B00000J8EK', cover_art_presence = 'absent' WHERE id = 31690;
UPDATE release_meta SET amazon_asin = NULL, date_added = '2004-08-23 07:28:55.160816+00', info_url = NULL, cover_art_presence = 'absent' WHERE id = 278075;
UPDATE release_meta SET amazon_asin = 'B00003W1QB', date_added = '2004-08-23 07:28:55.160816+00', info_url = 'http://www.amazon.de/gp/product/B00003W1QB', cover_art_presence = 'absent' WHERE id = 338506;
UPDATE release_meta SET amazon_asin = 'B00000JKRG', date_added = '2008-06-06 21:20:07.761374+00', info_url = 'http://www.amazon.co.uk/gp/product/B00000JKRG', cover_art_presence = 'absent' WHERE id = 400930;
UPDATE release_meta SET amazon_asin = NULL, date_added = '2010-09-18 08:06:53.407161+00', info_url = NULL, cover_art_presence = 'absent' WHERE id = 741970;
UPDATE release_meta SET amazon_asin = NULL, date_added = '2004-08-23 07:28:55.160816+00', info_url = NULL, cover_art_presence = 'absent' WHERE id = 748905;
UPDATE release_meta SET amazon_asin = 'B0015XAAY2', date_added = '2008-04-10 17:44:44.312392+00', info_url = 'http://www.amazon.com/gp/product/B0015XAAY2', cover_art_presence = 'absent' WHERE id = 375273;
UPDATE release_meta SET amazon_asin = 'B000XULO2A', date_added = '2008-11-06 20:09:13.862182+00', info_url = 'http://www.amazon.com/gp/product/B000XULO2A', cover_art_presence = 'absent' WHERE id = 459740;

INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (4675, 107, 2004, 1, 15);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (8312, 222, 1999, NULL, NULL);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (19969, 222, 1999, 6, 22);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (24752, 221, 1999, 9, 13);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (31689, 13, 1999, 6, 21);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (31690, 221, 1999, 6, 21);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (49161, 107, 2001, 7, 4);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (59312, 107, 2004, 1, 15);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (59662, 107, 2004, 3, 17);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (123054, 107, 2001, 7, 4);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (123055, 107, 2001, 7, 4);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (243064, 222, 1999, 9, 23);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (246898, 221, 2007, 1, 29);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (278075, 221, 1999, 6, 21);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (338506, 13, 2000, 1, 25);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (375273, 222, 2008, 4, 29);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (400930, 221, 1999, 6, 21);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (446581, 221, 2008, 11, 17);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (459740, 222, 2007, 11, 8);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (558940, 107, 2004, 1, 15);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (654729, 221, 1999, 9, 13);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (741970, 81, 1999, NULL, NULL);
INSERT INTO release_country (release, country, date_year, date_month, date_day) VALUES (748905, 13, 1999, 6, 21);

-- Mediums

INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 49161, '1f8e4908-a1ae-4681-a945-900d64ee91f8', '2011-01-18 15:21:33.71184+00', '', 1, 49161, 3);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 123054, '18d49785-59f6-4698-99bc-43aa0043abd9', '2011-01-18 15:21:33.71184+00', '', 1, 123054, 3);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 123055, '596a290f-cf94-4d63-ae82-8dcbacd7db6a', '2011-01-18 15:21:33.71184+00', '', 1, 123055, 0);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 24752, '7a5e9a3b-6587-489a-bf68-83ce04bafaea', '2011-01-18 15:21:33.71184+00', '', 1, 24752, 10);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 243064, '8622e14b-f3e5-47d0-b4ba-dbedf8d744f0', '2011-01-18 15:21:33.71184+00', '', 1, 243064, 10);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 7, 654729, 'cf08f19c-4530-4d6d-905b-5d4b73c333c7', '2011-01-18 15:21:33.71184+00', '', 1, 654729, 10);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 246898, 'a2262369-c808-447c-babb-e10317f4d6b2', '2011-01-18 15:21:33.71184+00', '', 1, 246898, 12);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 446581, 'a9aa3219-fbb8-44de-a312-ad1a58eb8203', '2011-01-18 15:21:33.71184+00', '', 1, 446581, 9);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 467794, 'b3702464-93dc-43f4-8337-b081f667ffa0', '2011-01-18 15:21:33.71184+00', 'Chestplate Singles', 2, 446581, 9);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 59662, '09af1de4-a712-4bfb-8331-fb15f6fcd844', '2011-01-18 15:21:33.71184+00', '', 1, 59662, 3);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, NULL, 4675, 'c2bf1cb1-9c9a-47ec-a6ab-aed0a634ba4e', '2011-01-18 15:21:33.71184+00', '', 1, 4675, 13);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 59312, 'e0df2f88-caa6-44fb-918f-1aa07f20f361', '2011-01-18 15:21:33.71184+00', '', 1, 59312, 13);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 558940, 'db455319-effc-45a3-aaf6-0505353b4254', '2011-01-18 15:21:33.71184+00', '', 1, 558940, 13);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 2, 558944, '62e76249-db87-4e86-bfaa-cac5f8887ed9', '2011-01-18 15:21:33.71184+00', '', 2, 558940, 6);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 19969, '87e671f5-c537-4945-912d-15f91345e550', '2011-01-18 15:21:33.71184+00', '', 1, 19969, 11);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 31689, '97a2a156-1712-4b5b-83ae-8db7ce5225a7', '2011-01-18 15:21:33.71184+00', '', 1, 31689, 11);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 31690, 'a664e7c3-036f-44b9-84a4-f8df894e63db', '2011-01-18 15:21:33.71184+00', '', 1, 31690, 11);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 6, 278075, '1aac4949-cca5-4eeb-9956-a4e02907a7ba', '2011-01-18 15:21:33.71184+00', '', 1, 278075, 11);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 338506, '1a16ac6a-4df5-4bf7-8a20-4dcc62cc81f4', '2011-01-18 15:21:33.71184+00', '', 1, 338506, 11);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 73608, 'dd21eafd-02c7-4dc3-b6d0-2f6dd7948efd', '2011-01-18 15:21:33.71184+00', '', 2, 338506, 4);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 7, 400930, '82570f0c-051f-4565-bf07-106774edd266', '2011-01-18 15:21:33.71184+00', '', 1, 400930, 5);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 7, 400929, '3b34f66e-9a36-4eed-876c-4b82accca1d4', '2011-01-18 15:21:33.71184+00', '', 2, 400930, 6);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 741970, 'f04ef73b-299c-4580-b8b1-359fc19ff0e3', '2011-01-18 15:21:33.71184+00', '', 1, 741970, 6);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 748905, '77e8a35c-fc1e-4835-bfca-3ece42753693', '2011-01-18 15:21:33.71184+00', '', 1, 748905, 11);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 375273, '132d0658-f83b-4683-aecb-8442681e5a99', '2011-01-18 15:21:33.71184+00', '', 1, 375273, 9);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 459740, 'ddafe3ce-2a55-46eb-99a9-679230c1d530', '2011-01-18 15:21:33.71184+00', '', 1, 459740, 15);
INSERT INTO medium (edits_pending, format, id, gid, last_updated, name, position, release, track_count) VALUES (0, 1, 1279200, 'cc7380e2-f2bc-44b8-a8a2-75d8b85aa590', '2013-01-25 14:09:41.827297-06', '', 1, 1247355, 3);

-- Tracks

INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '6b7cff23-5e7c-352c-9e34-585ddc0e0f82', '62', '2011-01-18 15:56:00.408782+00', 317733, 467794, 'Feel Me', '5', 5, 8692021);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '5ce47862-147f-33f8-82e9-9d0dade5b49e', '63', '2011-01-18 15:56:00.408782+00', 325720, 467794, 'Radical', '6', 6, 8692022);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '93ae1131-88a5-37c2-929d-c4c2c3467292', '64', '2011-01-18 15:56:00.408782+00', 334266, 467794, 'No Sunshine', '7', 7, 8692023);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '63aab7f9-488b-3a5a-ab77-21014062fafa', '65', '2011-01-18 15:56:00.408782+00', 305600, 467794, 'Victim Support', '8', 8, 8692024);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '622951f1-f779-3981-98f2-4f39003be002', '66', '2011-01-18 15:56:00.408782+00', 286186, 467794, 'Battle Sequence', '9', 9, 8692025);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (792488, 0, 'ec60f5e2-ed8a-391d-90cd-bf119c50f6a0', '67', '2011-01-18 15:56:00.408782+00', 243000, 59662, 'the Love Bug', '1', 1, 4525123);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (792488, 0, '2519283c-93d9-30de-a0ba-75f99ca25604', '68', '2011-01-18 15:56:00.408782+00', 222000, 59662, 'the Love Bug (Big Bug NYC remix)', '2', 2, 4525010);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (283833, 0, '4ffc18f0-96cc-3e1f-8192-cf0d0c489beb', '69', '2011-01-18 15:56:00.408782+00', 333000, 59662, 'the Love Bug (cover)', '3', 3, 4525011);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'c7d5f3c4-cee7-320d-8a69-18a745729ee6', '70', '2011-01-18 15:56:00.408782+00', 254400, 4675, 'Rock With You', '1', 1, 3451976);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '3184a594-f32c-3544-9896-1b571726543d', '71', '2011-01-18 15:56:00.408782+00', 305266, 4675, 'Shine We Are!', '2', 2, 1307406);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'fb17af0e-b6a4-3128-bbae-a4821912210a', '72', '2011-01-18 15:56:00.408782+00', 273426, 4675, 'SOME DAY ONE DAY (feat. VERBAL (m-flo))', '3', 3, 3622822);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '1a8b1e4a-8081-3410-a211-dda74b7c4c02', '73', '2011-01-18 15:56:00.408782+00', 282466, 4675, 'LOVE & HONESTY', '4', 4, 3622823);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '726118fa-e3cc-3ae3-ae5d-9d47a639ce95', '74', '2011-01-18 15:56:00.408782+00', 261600, 4675, 'Midnight Parade', '5', 5, 3584195);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'dd91ceb6-0db0-303f-abbd-24a31abf8a01', '75', '2011-01-18 15:56:00.408782+00', 227173, 4675, 'Be the one', '6', 6, 3622825);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '2783742f-c686-304b-90fa-82fff6b8b18d', '76', '2011-01-18 15:56:00.408782+00', 260000, 4675, 'EXPECT', '7', 7, 3622826);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '86334de5-72d4-3d6b-ab53-eccef40e5e6a', '77', '2011-01-18 15:56:00.408782+00', 349466, 4675, 'OVER ~across the time~', '8', 8, 3622827);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '60876afe-e6bf-312d-b7a9-f36c97aa87cd', '78', '2011-01-18 15:56:00.408782+00', 289866, 4675, 'Kokoro no Tegami', '9', 9, 3622828);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '79e12293-7225-3306-bafa-cc4bff78297f', '79', '2011-01-18 15:56:00.408782+00', 208333, 4675, 'DOUBLE', '10', 10, 3451975);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'c50eed88-f571-3293-8ba4-ed64fc50e79f', '80', '2011-01-18 15:56:00.408782+00', 295160, 4675, 'Easy To Be Hard', '11', 11, 3622830);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '43da7544-6283-3159-84f9-537fe823a1a7', '81', '2011-01-18 15:56:00.408782+00', 186173, 4675, 'Song With No Name', '12', 12, 3622831);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '23aacc6d-f388-37fe-b2fc-e60958ecb572', '82', '2011-01-18 15:56:00.408782+00', 199667, 4675, 'Milky Way', '13', 13, 3584196);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'ad762819-bdfe-3e70-94d6-1abcc3da3ebd', '84', '2011-01-18 15:56:00.408782+00', 254000, 59312, 'Rock With You', '1', 1, 3451976);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '2b0f230b-dc66-36f2-880d-0f1a304e1da2', '86', '2011-01-18 15:56:00.408782+00', 305000, 59312, 'Shine We Are!', '2', 2, 1307406);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '5a2cc59d-a255-3256-bfdb-d7d94fbb0868', '88', '2011-01-18 15:56:00.408782+00', 273000, 59312, 'SOME DAY ONE DAY (feat. VERBAL (m-flo))', '3', 3, 3622822);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '9520f971-f048-3ae0-95de-c9c034551544', '90', '2011-01-18 15:56:00.408782+00', 282000, 59312, 'LOVE & HONESTY', '4', 4, 3622823);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '0355f7e5-2288-30fb-b2ba-c580450c7dab', '92', '2011-01-18 15:56:00.408782+00', 262000, 59312, 'Midnight Parade', '5', 5, 3584195);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '77438323-bdcf-3584-89e7-559ef4474983', '94', '2011-01-18 15:56:00.408782+00', 227000, 59312, 'Be the one', '6', 6, 3622825);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'f34f2cc8-686f-3954-b78b-dc63a46cbf9d', '96', '2011-01-18 15:56:00.408782+00', 260000, 59312, 'EXPECT', '7', 7, 3622826);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'dfc0ed57-c1d7-38eb-9782-1dd7e2143eb3', '98', '2011-01-18 15:56:00.408782+00', 349000, 59312, 'OVER～across the time～', '8', 8, 3622827);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '9c6a0164-b24b-3592-b41d-a04e40de923e', '100', '2011-01-18 15:56:00.408782+00', 290000, 59312, '心の手紙', '9', 9, 3622828);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'cf4531ba-6c6b-32ea-aafc-e85e577178ef', '102', '2011-01-18 15:56:00.408782+00', 208000, 59312, 'DOUBLE', '10', 10, 3451975);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '44903f1e-2270-32f0-86b5-66194ed0d44b', '104', '2011-01-18 15:56:00.408782+00', 295000, 59312, 'Easy To Be Hard', '11', 11, 3622830);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '54d69466-d0f2-3e1a-acf2-d2f96d610622', '106', '2011-01-18 15:56:00.408782+00', 186000, 59312, 'Song With No Name～名前のない歌～', '12', 12, 3622831);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'e56c6d3c-09cf-33a0-81c5-ceade77c35dc', '108', '2011-01-18 15:56:00.408782+00', 200000, 59312, 'Milky Way-君の歌-', '13', 13, 3584196);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '8ca1c76b-bb5c-3dbc-b3ab-dc1d287b1859', '83', '2011-01-18 15:56:00.408782+00', 254000, 558940, 'Rock With You', '1', 1, 3451976);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'b78014e7-7314-342b-8fa0-a19c733279cb', '85', '2011-01-18 15:56:00.408782+00', 305000, 558940, 'Shine We Are!', '2', 2, 1307406);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'f95a72bf-f7e8-3c48-81f3-603a9091ba9d', '87', '2011-01-18 15:56:00.408782+00', 273000, 558940, 'SOME DAY ONE DAY (feat. VERBAL (m-flo))', '3', 3, 3622822);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'e7a9d5cf-e9ee-3f98-a964-666db90a0b0b', '89', '2011-01-18 15:56:00.408782+00', 282000, 558940, 'LOVE & HONESTY', '4', 4, 3622823);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '5e29f99c-e089-32ae-a922-fd5d3d57a5f9', '91', '2011-01-18 15:56:00.408782+00', 262000, 558940, 'Midnight Parade', '5', 5, 3584195);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'b23ef113-fa28-3c2c-9cb8-55b1b05fb0aa', '93', '2011-01-18 15:56:00.408782+00', 227000, 558940, 'Be the one', '6', 6, 3622825);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '82d48378-d892-3837-99fc-b94ad8ef7775', '95', '2011-01-18 15:56:00.408782+00', 260000, 558940, 'EXPECT', '7', 7, 3622826);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'b96622e2-863f-34ca-a5b3-3ecadec0ff92', '97', '2011-01-18 15:56:00.408782+00', 349000, 558940, 'OVER～across the time～', '8', 8, 3622827);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'fa124f9a-d8ea-36a3-bed3-c817fdbe13e2', '99', '2011-01-18 15:56:00.408782+00', 290000, 558940, '心の手紙', '9', 9, 3622828);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'f6c40f8f-2271-3fe9-b06c-32edd9da0b78', '101', '2011-01-18 15:56:00.408782+00', 208000, 558940, 'DOUBLE', '10', 10, 3451975);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '412646d4-dfda-3ef5-bce3-43e9025d67af', '103', '2011-01-18 15:56:00.408782+00', 295000, 558940, 'Easy To Be Hard', '11', 11, 3622830);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'e9612ce5-5ba4-3e6c-8fd7-725f136516e7', '105', '2011-01-18 15:56:00.408782+00', 186000, 558940, 'Song With No Name～名前のない歌～', '12', 12, 3622831);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'd09c8169-51b8-38c9-95b6-dcd5c9a03389', '107', '2011-01-18 15:56:00.408782+00', 200000, 558940, 'Milky Way-君の歌-', '13', 13, 3584196);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '5fabde7e-88f6-343a-b4f0-3b0d6d9f3f72', '109', '2011-01-18 15:56:00.408782+00', NULL, 558944, 'Shine We Are! (Video clip)', '1', 1, 9538744);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '01994320-b161-3491-a9be-74cbdec88999', '110', '2011-01-18 15:56:00.408782+00', NULL, 558944, 'Rock With You (Video clip)', '2', 2, 9538745);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '8f04b4a6-4ba8-3b80-8b2e-8e2a5bc6ad66', '111', '2011-01-18 15:56:00.408782+00', NULL, 558944, 'NO.1 (Video clip)', '3', 3, 9538746);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, 'd102bf10-e401-3f0f-85ab-6caad1bd98ef', '112', '2011-01-18 15:56:00.408782+00', NULL, 558944, 'Rock With You (Making of)', '4', 4, 9538747);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '6b45389c-8b13-3ace-af6f-faf026bab54a', '113', '2011-01-18 15:56:00.408782+00', NULL, 558944, 'Commercial Films', '5', 5, 9538748);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (9496, 0, '6ef49e01-2367-3045-ae4b-8ff9645d8a68', '114', '2011-01-18 15:56:00.408782+00', NULL, 558944, 'Interview', '6', 6, 9538749);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'cabc36f1-44b8-3c84-a384-0f9ec159dc60', '137', '2011-01-18 15:56:00.408782+00', 320146, 19969, 'Music: Response', '1', 1, 2726271);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'ca629f30-9a52-39c5-ada7-f000d63a7c7d', '143', '2011-01-18 15:56:00.408782+00', 256253, 19969, 'Under the Influence', '2', 2, 2726272);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '1de0d658-5cad-3a93-8c4b-cd402d356935', '149', '2011-01-18 15:56:00.408782+00', 439546, 19969, 'Out of Control', '3', 3, 1353886);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'c2ba4dc4-7171-3f16-bb3c-d078bc3c8543', '155', '2011-01-18 15:56:00.408782+00', 186826, 19969, 'Orange Wedge', '4', 4, 2726274);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '5484c5aa-83da-37c5-a705-fe2e1cd2398c', '161', '2011-01-18 15:56:00.408782+00', 235360, 19969, 'Let Forever Be', '5', 5, 2726275);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'e4ebff5d-ce66-3360-b0b6-c22dda7ed001', '167', '2011-01-18 15:56:00.408782+00', 518906, 19969, 'The Sunshine Underground', '6', 6, 2726276);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'eeefd589-1eba-3159-96fb-04ecb89bc148', '173', '2011-01-18 15:56:00.408782+00', 287386, 19969, 'Asleep From Day', '7', 7, 2726277);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '7d2cc2e8-26b1-30f7-a846-8dea130c4a95', '179', '2011-01-18 15:56:00.408782+00', 326906, 19969, 'Got Glint?', '8', 8, 2726278);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'ab2f62e9-75d0-3b30-b0d4-0c6146d6e9bf', '185', '2011-01-18 15:56:00.408782+00', 289946, 19969, 'Hey Boy Hey Girl', '9', 9, 1062699);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '7a3a0f15-df95-3f66-9858-93df8074c4cf', '191', '2011-01-18 15:56:00.408782+00', 269360, 19969, 'Surrender', '10', 10, 2726280);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '9d86c134-4aa5-3674-b94c-1c5b6eac0b57', '197', '2011-01-18 15:56:00.408782+00', 405760, 19969, 'Dream On', '11', 11, 2726281);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '6ac5437e-43ca-317d-9cc2-95c7502c4e4f', '136', '2011-01-18 15:56:00.408782+00', 320146, 31689, 'Music: Response', '1', 1, 2726271);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '9187620a-0d52-3745-a450-f390aefbb9cd', '142', '2011-01-18 15:56:00.408782+00', 256253, 31689, 'Under the Influence', '2', 2, 2726272);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '1ae874f9-41a9-37e2-9600-acf9232f1fcb', '148', '2011-01-18 15:56:00.408782+00', 439546, 31689, 'Out of Control', '3', 3, 1353886);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '130917bc-085c-3123-9120-11c53fadc5ed', '154', '2011-01-18 15:56:00.408782+00', 186826, 31689, 'Orange Wedge', '4', 4, 2726274);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '87cf2992-ce3e-322f-85de-bb272bec6de6', '160', '2011-01-18 15:56:00.408782+00', 235360, 31689, 'Let Forever Be', '5', 5, 2726275);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '49318032-eb75-3d16-9448-63662ad44ff2', '166', '2011-01-18 15:56:00.408782+00', 518906, 31689, 'The Sunshine Underground', '6', 6, 2726276);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'c19c6197-1744-39d8-abcb-f4e1c6d7ceff', '172', '2011-01-18 15:56:00.408782+00', 287386, 31689, 'Asleep From Day', '7', 7, 2726277);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'e86f9042-b45c-3687-b088-ce1acd3679bc', '178', '2011-01-18 15:56:00.408782+00', 326906, 31689, 'Got Glint?', '8', 8, 2726278);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '84b32f22-3628-36c1-b322-0df30a4a7af9', '184', '2011-01-18 15:56:00.408782+00', 289946, 31689, 'Hey Boy Hey Girl', '9', 9, 1062699);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '6f53057e-f644-3c4a-9a62-d6d2cf9d9106', '190', '2011-01-18 15:56:00.408782+00', 269360, 31689, 'Surrender', '10', 10, 2726280);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '200dd597-f1d2-32ee-8f2f-d75afb33370d', '196', '2011-01-18 15:56:00.408782+00', 405760, 31689, 'Dream On', '11', 11, 2726281);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '17c8ef25-d633-366d-b50b-1c3332eaf1b2', '135', '2011-01-18 15:56:00.408782+00', 320146, 31690, 'Music: Response', '1', 1, 2726271);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'eeaac0db-3f32-3da9-b851-3389d7917cf4', '141', '2011-01-18 15:56:00.408782+00', 256253, 31690, 'Under the Influence', '2', 2, 2726272);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '1364ccbd-019c-39db-8694-b4ecbef60d4e', '147', '2011-01-18 15:56:00.408782+00', 439546, 31690, 'Out of Control', '3', 3, 1353886);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'dd4cc74d-182f-3b7c-9e11-8aad60e89440', '153', '2011-01-18 15:56:00.408782+00', 186826, 31690, 'Orange Wedge', '4', 4, 2726274);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'a72ebf86-4c36-3e3c-9471-903415bdf3ba', '159', '2011-01-18 15:56:00.408782+00', 235360, 31690, 'Let Forever Be', '5', 5, 2726275);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'f5b35850-9a5d-3d6a-bf37-83d1febe8dec', '165', '2011-01-18 15:56:00.408782+00', 518906, 31690, 'The Sunshine Underground', '6', 6, 2726276);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '9bb30543-392e-3471-84fb-98ac37d917b5', '171', '2011-01-18 15:56:00.408782+00', 287386, 31690, 'Asleep From Day', '7', 7, 2726277);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '0ab555a7-889a-309d-832d-9c379dd6029d', '177', '2011-01-18 15:56:00.408782+00', 326906, 31690, 'Got Glint?', '8', 8, 2726278);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'a30c7cbd-793f-35eb-a85d-a681fd9d91f1', '183', '2011-01-18 15:56:00.408782+00', 289946, 31690, 'Hey Boy Hey Girl', '9', 9, 1062699);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '600c137c-b62f-3e56-9e0b-aad1d45b1958', '189', '2011-01-18 15:56:00.408782+00', 269360, 31690, 'Surrender', '10', 10, 2726280);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'f6f13e8d-2a28-3c54-baa4-d50893bed6a8', '195', '2011-01-18 15:56:00.408782+00', 405760, 31690, 'Dream On', '11', 11, 2726281);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '05fdfafe-5071-3588-818d-025d4117d784', '134', '2011-01-18 15:56:00.408782+00', 320146, 278075, 'Music: Response', '1', 1, 2726271);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '85e0fc8e-d4b3-3dc5-8146-0437a064ced2', '140', '2011-01-18 15:56:00.408782+00', 256253, 278075, 'Under the Influence', '2', 2, 2726272);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '60ee87a0-3a9d-3939-82fb-3b028d5152b5', '146', '2011-01-18 15:56:00.408782+00', 439546, 278075, 'Out of Control', '3', 3, 1353886);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'faf931aa-3267-36b0-8c42-13ce057e18a3', '152', '2011-01-18 15:56:00.408782+00', 186826, 278075, 'Orange Wedge', '4', 4, 2726274);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'a844da2d-8abd-328e-8305-6743fa9cd2d8', '158', '2011-01-18 15:56:00.408782+00', 235360, 278075, 'Let Forever Be', '5', 5, 2726275);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '09790e40-35e1-3dc4-a49c-8deca038d019', '164', '2011-01-18 15:56:00.408782+00', 518906, 278075, 'The Sunshine Underground', '6', 6, 2726276);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'b52e153b-8c58-380b-81bc-11f72a037606', '170', '2011-01-18 15:56:00.408782+00', 287386, 278075, 'Asleep From Day', '7', 7, 2726277);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'cb2629bb-db37-3cac-8e29-b750d906992b', '176', '2011-01-18 15:56:00.408782+00', 326906, 278075, 'Got Glint?', '8', 8, 2726278);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '61bf8a24-27b8-30d6-90bd-f504617167cc', '182', '2011-01-18 15:56:00.408782+00', 289946, 278075, 'Hey Boy Hey Girl', '9', 9, 1062699);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '2055086b-d6c6-32a4-9844-83243d16631f', '188', '2011-01-18 15:56:00.408782+00', 269360, 278075, 'Surrender', '10', 10, 2726280);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '9cf3f04c-4378-3368-b066-375768b4b578', '194', '2011-01-18 15:56:00.408782+00', 405760, 278075, 'Dream On', '11', 11, 2726281);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'd78b0d35-d566-3293-a00f-3874586a1640', '133', '2011-01-18 15:56:00.408782+00', 320146, 338506, 'Music: Response', '1', 1, 2726271);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '16c475bf-723d-326e-b0fc-cd8bd7199532', '139', '2011-01-18 15:56:00.408782+00', 256253, 338506, 'Under the Influence', '2', 2, 2726272);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '88a74fe1-6820-3d86-8b65-e4296b6a31d9', '145', '2011-01-18 15:56:00.408782+00', 439546, 338506, 'Out of Control', '3', 3, 1353886);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'fca6070a-54f1-357f-8251-c4421f6d7792', '151', '2011-01-18 15:56:00.408782+00', 186826, 338506, 'Orange Wedge', '4', 4, 2726274);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '239c0c5b-fe1b-32c3-a68c-aed3f34325e6', '157', '2011-01-18 15:56:00.408782+00', 235360, 338506, 'Let Forever Be', '5', 5, 2726275);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '0b5250c3-1ee1-3bc1-91ad-9e8f5fa3ad99', '163', '2011-01-18 15:56:00.408782+00', 518906, 338506, 'The Sunshine Underground', '6', 6, 2726276);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '8c3c0249-416d-3df9-bf3b-ae0af8c40702', '169', '2011-01-18 15:56:00.408782+00', 287386, 338506, 'Asleep From Day', '7', 7, 2726277);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'b78329ae-1540-3ffd-9d82-cb1b45aae1a3', '175', '2011-01-18 15:56:00.408782+00', 326906, 338506, 'Got Glint?', '8', 8, 2726278);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '2da74354-272c-36a1-8007-3ec303ceeb31', '181', '2011-01-18 15:56:00.408782+00', 289946, 338506, 'Hey Boy Hey Girl', '9', 9, 1062699);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '26a9a0df-0616-39e2-bd9e-124a00d180f6', '187', '2011-01-18 15:56:00.408782+00', 269360, 338506, 'Surrender', '10', 10, 2726280);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'bc0eff1d-454d-3e71-b19a-4f8c9d5fbd39', '193', '2011-01-18 15:56:00.408782+00', 405760, 338506, 'Dream On', '11', 11, 2726281);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '0ea76ec4-84d2-31f8-b25f-ef84e3981ab3', '198', '2011-01-18 15:56:00.408782+00', 364560, 73608, 'Hey Boy Hey Girl (extended version)', '1', 1, 4844120);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '77c9d005-aaec-3c56-a514-a4fb98881b55', '199', '2011-01-18 15:56:00.408782+00', 318946, 73608, 'Flashback', '2', 2, 4844121);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '19ff2766-3840-3673-9565-3534686aa457', '200', '2011-01-18 15:56:00.408782+00', 249493, 73608, 'Power Move', '3', 3, 4844122);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'dce5de51-6c0a-3b99-b222-2a6d0052803f', '201', '2011-01-18 15:56:00.408782+00', 439000, 73608, 'Out of Control (Sasha remix)', '4', 4, 4844123);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '63b4576b-5938-3fe9-bb0b-5bbc72f0dda2', '202', '2011-01-18 15:56:00.408782+00', 319000, 400930, 'Music: Response', '1', 1, 8106513);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '581d6a0c-389c-3c71-9110-98be6e1036d1', '203', '2011-01-18 15:56:00.408782+00', 256000, 400930, 'Under the Influence', '2', 2, 8106514);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '6f988237-a9bb-3aa0-a400-a8f366e0c833', '204', '2011-01-18 15:56:00.408782+00', 439000, 400930, 'Out of Control', '3', 3, 8106515);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'ef1bc128-97a7-3151-b4e5-8f7e99a649eb', '205', '2011-01-18 15:56:00.408782+00', 186000, 400930, 'Orange Wedge', '4', 4, 8106516);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '863d5969-0d9e-300d-b2e2-2486e0bd199a', '206', '2011-01-18 15:56:00.408782+00', 236000, 400930, 'Let Forever Be', '5', 5, 8106517);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '1dbaa07d-6477-3a05-afe9-19004cb41e66', '207', '2011-01-18 15:56:00.408782+00', 518000, 400929, 'The Sunshine Underground', '1', 1, 8106507);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'aabb776b-2383-3cce-8231-984c98b25bb8', '208', '2011-01-18 15:56:00.408782+00', 287000, 400929, 'Asleep From Day', '2', 2, 8106508);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'b064fb0c-a547-3227-b2f3-464de430d9ac', '209', '2011-01-18 15:56:00.408782+00', 326000, 400929, 'Got Glint?', '3', 3, 8106509);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '5463d2f4-0cfb-35d5-bd14-945b5c2f32cd', '210', '2011-01-18 15:56:00.408782+00', 290000, 400929, 'Hey Boy Hey Girl', '4', 4, 8106510);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '36f45036-3e4c-35bb-9060-7e109dd35d78', '211', '2011-01-18 15:56:00.408782+00', 270000, 400929, 'Surrender', '5', 5, 8106511);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '5f4a28cc-63a0-3e33-8b25-44cbae10fca4', '212', '2011-01-18 15:56:00.408782+00', 406000, 400929, 'Dream On', '6', 6, 8106512);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '908c21bf-cb31-3725-ae5a-a34c7b4425c8', '213', '2011-01-18 15:56:00.408782+00', 102000, 741970, 'Out of Control', '1', 1, 11484260);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '672694cb-5600-3cd5-8a85-075f8d6d5b76', '214', '2011-01-18 15:56:00.408782+00', 99000, 741970, 'Let Forever Be', '2', 2, 11484261);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '16095f7b-37dc-3dd5-be15-8cf911d868d8', '215', '2011-01-18 15:56:00.408782+00', 82000, 741970, 'The Sunshine Underground', '3', 3, 11484262);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '76a0ba62-4787-3dc3-99e9-ffa686815c56', '216', '2011-01-18 15:56:00.408782+00', 91000, 741970, 'Asleep From Day', '4', 4, 11484263);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '899067f5-8e1a-3e87-88af-08a392b0520e', '217', '2011-01-18 15:56:00.408782+00', 83000, 741970, 'Hey Boy, Hey Girl', '5', 5, 11484264);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '7555667b-d4aa-33ed-9dec-02d0aa453531', '218', '2011-01-18 15:56:00.408782+00', 91000, 741970, 'Got Glint?', '6', 6, 11484265);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'c8525ac8-0fca-335a-9107-d68a11432b2a', '132', '2011-01-18 15:56:00.408782+00', 320146, 748905, 'Music: Response', '1', 1, 2726271);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '5860ba7a-07d1-3666-9220-8fa150faaea1', '138', '2011-01-18 15:56:00.408782+00', 256253, 748905, 'Under the Influence', '2', 2, 2726272);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'f06c53e6-214f-339a-a99c-60c60fce35fb', '144', '2011-01-18 15:56:00.408782+00', 439546, 748905, 'Out of Control', '3', 3, 1353886);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'a50f4001-0be4-394c-8d4a-de297b210503', '150', '2011-01-18 15:56:00.408782+00', 186826, 748905, 'Orange Wedge', '4', 4, 2726274);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, 'f3d74239-3544-33e6-aebe-143583bbcead', '156', '2011-01-18 15:56:00.408782+00', 235360, 748905, 'Let Forever Be', '5', 5, 2726275);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '34690c03-ed34-32c6-8c57-dfed747190ae', '162', '2011-01-18 15:56:00.408782+00', 518906, 748905, 'The Sunshine Underground', '6', 6, 2726276);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '2b1acd58-64e5-3758-923f-ba75b09354e9', '168', '2011-01-18 15:56:00.408782+00', 287386, 748905, 'Asleep From Day', '7', 7, 2726277);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '278f062e-9aa6-38de-96ac-456b882c14dc', '174', '2011-01-18 15:56:00.408782+00', 326906, 748905, 'Got Glint?', '8', 8, 2726278);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '7f4611dd-e291-3e05-acbb-52b5d272d011', '180', '2011-01-18 15:56:00.408782+00', 289946, 748905, 'Hey Boy Hey Girl', '9', 9, 1062699);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '28dab397-8fb8-3b32-a535-2f009d9d4d3e', '186', '2011-01-18 15:56:00.408782+00', 269360, 748905, 'Surrender', '10', 10, 2726280);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (242, 0, '0ed421be-606f-3fec-b761-21a5d63b34e4', '192', '2011-01-18 15:56:00.408782+00', 405760, 748905, 'Dream On', '11', 11, 2726281);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398438, 0, '719e1eba-920f-31da-9c45-9eb53f791aee', '417', '2011-01-18 15:56:00.408782+00', 256666, 375273, 'Reverend Charisma', '1', 1, 7905439);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398438, 0, '5a0b7a30-4297-3cda-ba0f-2547c4b7ae9b', '418', '2011-01-18 15:56:00.408782+00', 86666, 375273, 'Dear Diary', '2', 2, 7905440);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398438, 0, 'a5b038bf-6e36-362b-9397-9cecda03e9bc', '419', '2011-01-18 15:56:00.408782+00', 213666, 375273, 'Black Sundress', '3', 3, 7905441);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398438, 0, '7c66606c-8a1b-3407-a856-21e4622da140', '420', '2011-01-18 15:56:00.408782+00', 266666, 375273, 'Allegiance?WTF?', '4', 4, 7905442);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398438, 0, '2d11d4ec-b9c0-3bfe-86d9-df5034e2522e', '421', '2011-01-18 15:56:00.408782+00', 254666, 375273, 'Maggie&Heidi', '5', 5, 7905443);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398438, 0, '3ec79596-482b-3d1b-8f48-325a1b332366', '422', '2011-01-18 15:56:00.408782+00', 236666, 375273, 'Discopharma', '6', 6, 7905444);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398438, 0, 'baaa07d9-6c32-31e6-bbea-1796fd79a8f1', '423', '2011-01-18 15:56:00.408782+00', 230666, 375273, 'Still Unsatisfied', '7', 7, 7905445);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398438, 0, '61add1a9-5a53-3eb3-afa6-fb503998a909', '424', '2011-01-18 15:56:00.408782+00', 274666, 375273, 'Asseswaving', '8', 8, 7905446);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398438, 0, '8cef791e-3363-3c36-8b29-1f5dd2982902', '425', '2011-01-18 15:56:00.408782+00', 249653, 375273, 'Just Because', '9', 9, 7905447);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, '04f245ea-88ac-34e8-9bab-32c1e47072c4', '426', '2011-01-18 15:56:00.408782+00', 1027000, 459740, 'Here', '1', 1, 8621499);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, '2be903ec-2958-3a63-9727-750476c46e46', '427', '2011-01-18 15:56:00.408782+00', 394000, 459740, 'Kira', '2', 2, 8621500);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, 'ac6e521c-3a60-3258-b0ec-94766200de07', '428', '2011-01-18 15:56:00.408782+00', 249000, 459740, 'Life as a Genuine Fake', '3', 3, 8621501);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, 'c83963c7-103e-3809-b74d-227df41a306b', '429', '2011-01-18 15:56:00.408782+00', 370000, 459740, 'It Takes a Thief', '4', 4, 8621502);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, '54903059-ab65-39f4-8361-5c5ceaa44197', '430', '2011-01-18 15:56:00.408782+00', 2036000, 459740, 'Good Old Albermarle (6x9)', '5', 5, 8621503);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, 'bfaa48c5-2aaf-396f-811c-699564d5bbca', '431', '2011-01-18 15:56:00.408782+00', 2770000, 459740, 'Life as an Ampersand', '6', 6, 8621504);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, 'ac8931fc-ca24-32ca-8864-492b0682ed8b', '432', '2011-01-18 15:56:00.408782+00', 1071000, 459740, 'Nat Sherman and the Beauty of the Blade', '7', 7, 8621505);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, 'c164c872-acca-3559-ac6a-50af68d5fef8', '433', '2011-01-18 15:56:00.408782+00', 1614000, 459740, 'Saul''s First Vision', '8', 8, 8621506);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, 'f51cd028-bfdd-3e0b-b48e-8f527fe34e41', '434', '2011-01-18 15:56:00.408782+00', 562000, 459740, 'The Rattigan', '9', 9, 8621507);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, '58c5fe5a-1adf-3489-bc68-39a0107c3b4f', '435', '2011-01-18 15:56:00.408782+00', 758000, 459740, 'The Rattigan, Part Two', '10', 10, 8621508);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, '42b615c5-f57b-38fd-8ac8-571aab35b6b6', '436', '2011-01-18 15:56:00.408782+00', 322000, 459740, 'Wasted Early Sunday Morning', '11', 11, 8621509);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, 'd3d7a423-e1d9-30ff-bfb2-07ceebc70b96', '437', '2011-01-18 15:56:00.408782+00', 1097000, 459740, 'I''m Not Crazy', '12', 12, 8621510);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, 'c9ddfb56-5715-38c3-ad1b-214510e62cd0', '438', '2011-01-18 15:56:00.408782+00', 2074000, 459740, 'The Saul Shields Gospel Hour', '13', 13, 8621511);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, 'c2531c44-08c8-32d3-8200-6f667db4605f', '439', '2011-01-18 15:56:00.408782+00', 216000, 459740, 'Saul''s Second Vision', '14', 14, 8621512);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (398598, 0, '2e28c3a9-304b-3d5a-b965-758af49dba8c', '440', '2011-01-18 15:56:00.408782+00', 802000, 459740, 'One Thing Leads to Another / Epilogue', '15', 15, 8621513);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (265420, 0, '4a7c2f1e-cf40-383c-a1c1-d1272d8234cd', '1', '2011-01-18 15:56:00.408782+00', 296026, 49161, 'サマーれげぇ!レインボー', '1', 1, 4223059);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (265420, 0, 'b5efef3e-6a1f-3234-9c9c-fceedf2ff10d', '2', '2011-01-18 15:56:00.408782+00', 213106, 49161, 'HELLO! また会おうね (7人祭 version)', '2', 2, 4223060);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (265420, 0, '817bd026-3e05-3005-9beb-8d212e1b6b52', '3', '2011-01-18 15:56:00.408782+00', 292800, 49161, 'サマーれげぇ!レインボー (instrumental)', '3', 3, 4223061);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (265420, 0, '3b9d0128-ed86-3c2c-af24-c331a3798875', '4', '2011-01-18 15:56:00.408782+00', 296026, 123054, 'Summer Reggae! Rainbow', '1', 1, 4223059);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (265420, 0, 'c7c21691-6f85-3ec7-9b08-e431c3b310a5', '5', '2011-01-18 15:56:00.408782+00', 213106, 123054, 'Hello! Mata Aou Ne (7nin Matsuri version)', '2', 2, 4223060);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (265420, 0, 'e436c057-ca19-36c6-9f1e-dc4ada2604b0', '6', '2011-01-18 15:56:00.408782+00', 292800, 123054, 'Summer Reggae! Rainbow (Instrumental)', '3', 3, 4223061);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '9b9a84b5-0a41-38f6-859f-36cb22ac813c', '9', '2011-01-18 15:56:00.408782+00', 267560, 24752, 'On My Bus', '1', 1, 1542682);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'f38b8e31-a10d-3973-8c1f-10923ee61adc', '12', '2011-01-18 15:56:00.408782+00', 230506, 24752, 'Top & Low Rent', '2', 2, 1542683);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'd17bed32-940a-3fcc-9210-a5d7c516b4bb', '15', '2011-01-18 15:56:00.408782+00', 237133, 24752, 'Plock', '3', 3, 1542684);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '001bc675-ba25-32bc-9914-d5d9e22c3c44', '18', '2011-01-18 15:56:00.408782+00', 229826, 24752, 'Marbles', '4', 4, 1542685);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'c009176f-ff26-3f5f-bd16-46cede30ebe6', '21', '2011-01-18 15:56:00.408782+00', 217440, 24752, 'Busy Working', '5', 5, 1542686);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '70454e43-b39b-3ca7-8c50-ae235b5ef358', '24', '2011-01-18 15:56:00.408782+00', 227293, 24752, 'The Greek Alphabet', '6', 6, 1542687);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '1b5da50c-e20f-3762-839c-5a0eea89d6a5', '27', '2011-01-18 15:56:00.408782+00', 244506, 24752, 'Press a Key', '7', 7, 1542688);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'f1b5bd23-ad01-3c0c-a49a-cf8e99088369', '30', '2011-01-18 15:56:00.408782+00', 173960, 24752, 'Bibi Plone', '8', 8, 1542689);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '928f2274-5694-35f9-92da-a1fc565867cf', '33', '2011-01-18 15:56:00.408782+00', 208706, 24752, 'Be Rude to Your School', '9', 9, 1542690);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '40727388-237d-34b2-8a3a-288878e5c883', '36', '2011-01-18 15:56:00.408782+00', 320067, 24752, 'Summer Plays Out', '10', 10, 1542691);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '659797a3-5be2-3563-b308-58667c80cbf9', '8', '2011-01-18 15:56:00.408782+00', 267560, 243064, 'On My Bus', '1', 1, 1542682);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'e29ffe54-9f94-382a-84d1-de55048a873c', '11', '2011-01-18 15:56:00.408782+00', 230506, 243064, 'Top & Low Rent', '2', 2, 1542683);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '9df3b0d8-ac00-3005-bec9-7534427ae4ef', '14', '2011-01-18 15:56:00.408782+00', 237133, 243064, 'Plock', '3', 3, 1542684);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'd7b86b05-cf6f-3bdc-80fa-24b0fbcfa8b3', '17', '2011-01-18 15:56:00.408782+00', 229826, 243064, 'Marbles', '4', 4, 1542685);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '6d080e0c-e7f1-31e2-b6ee-9ac3d4ffa469', '20', '2011-01-18 15:56:00.408782+00', 217440, 243064, 'Busy Working', '5', 5, 1542686);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'a3f63552-ae5d-3070-8f1a-7e2f1627a010', '23', '2011-01-18 15:56:00.408782+00', 227293, 243064, 'The Greek Alphabet', '6', 6, 1542687);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '14332da9-9900-3038-a83c-9f3060d58b1a', '26', '2011-01-18 15:56:00.408782+00', 244506, 243064, 'Press a Key', '7', 7, 1542688);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'eea90a37-39f9-31fb-9896-32f8108076d0', '29', '2011-01-18 15:56:00.408782+00', 173960, 243064, 'Bibi Plone', '8', 8, 1542689);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '795685fd-144f-3802-9336-f418c8b362b5', '32', '2011-01-18 15:56:00.408782+00', 208706, 243064, 'Be Rude to Your School', '9', 9, 1542690);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'fd27957f-f4dd-3109-a397-01ecb39b900d', '35', '2011-01-18 15:56:00.408782+00', 320067, 243064, 'Summer Plays Out', '10', 10, 1542691);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '60479776-bd36-38a7-801b-459c04511117', '7', '2011-01-18 15:56:00.408782+00', 267560, 654729, 'On My Bus', '1', 1, 1542682);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'b7b06585-45d2-3313-9521-ffc5da758605', '10', '2011-01-18 15:56:00.408782+00', 230506, 654729, 'Top & Low Rent', '2', 2, 1542683);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '6e652a65-606e-37a5-ae1c-1196efab3f2c', '13', '2011-01-18 15:56:00.408782+00', 237133, 654729, 'Plock', '3', 3, 1542684);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '9ed45d72-e57b-3bba-af36-d0eb491c9daf', '16', '2011-01-18 15:56:00.408782+00', 229826, 654729, 'Marbles', '4', 4, 1542685);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'b2da826a-d320-3dcb-818a-697e7b272a2e', '19', '2011-01-18 15:56:00.408782+00', 217440, 654729, 'Busy Working', '5', 5, 1542686);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '58b677c8-940c-328f-b6de-ec7a3eb7b45a', '22', '2011-01-18 15:56:00.408782+00', 227293, 654729, 'The Greek Alphabet', '6', 6, 1542687);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '28d6004e-8b22-36c1-b83b-ef15363ff531', '25', '2011-01-18 15:56:00.408782+00', 244506, 654729, 'Press a Key', '7', 7, 1542688);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '42b6a451-da4d-33ee-b07d-262e41699bde', '28', '2011-01-18 15:56:00.408782+00', 173960, 654729, 'Bibi Plone', '8', 8, 1542689);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, '0fd83be0-b230-3535-879e-a736aeed0f00', '31', '2011-01-18 15:56:00.408782+00', 208706, 654729, 'Be Rude to Your School', '9', 9, 1542690);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (11545, 0, 'cf7e7c47-b3b1-3be9-ba31-623bb258f73d', '34', '2011-01-18 15:56:00.408782+00', 320067, 654729, 'Summer Plays Out', '10', 10, 1542691);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '52b0195e-673e-31d2-b9a7-be49edef1ea8', '37', '2011-01-18 15:56:00.408782+00', 369000, 246898, 'Night Vision', '1', 1, 6750260);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, 'ad1467f9-df92-38e0-b99f-9d5acc186cf3', '38', '2011-01-18 15:56:00.408782+00', 291000, 246898, 'My Demons', '2', 2, 6750261);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, 'af9bda3a-71d6-3b09-b8fe-445c69daaf9b', '39', '2011-01-18 15:56:00.408782+00', 348000, 246898, 'Weigh Down', '3', 3, 6750262);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '32c60d36-7cfa-3c3d-a55a-22ba23d3dfb0', '40', '2011-01-18 15:56:00.408782+00', 319000, 246898, 'Traffic', '4', 4, 6750263);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '8d13b868-aada-3aae-a31c-bc305528de52', '41', '2011-01-18 15:56:00.408782+00', 280000, 246898, 'Mistral', '5', 5, 6750264);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '6ba592c0-3788-3d6d-b900-ab5d64374054', '42', '2011-01-18 15:56:00.408782+00', 265000, 246898, 'Cyclops', '6', 6, 6750265);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '87cc2257-592a-3f54-ad0f-61380cb9b346', '43', '2011-01-18 15:56:00.408782+00', 334000, 246898, 'Cella', '7', 7, 6750266);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '7b6cd398-9867-3b70-9be8-8ee49f36bbb8', '44', '2011-01-18 15:56:00.408782+00', 300000, 246898, 'Ska', '8', 8, 6750267);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '8dc6d377-8f15-32d6-8545-1c13f33bbd40', '45', '2011-01-18 15:56:00.408782+00', 311000, 246898, 'Fractured', '9', 9, 6750268);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, 'd702507a-ad80-3990-a0ee-242721b05863', '46', '2011-01-18 15:56:00.408782+00', 272000, 246898, 'Tuning', '10', 10, 6750269);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, 'd2d372d8-d19f-3e7f-85c7-dfccf1e980a2', '47', '2011-01-18 15:56:00.408782+00', 314000, 246898, 'Confined', '11', 11, 6750270);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '6d37927f-e15f-3de5-ba4e-02bdf86e1a83', '48', '2011-01-18 15:56:00.408782+00', 339000, 246898, 'Delight', '12', 12, 6750271);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, 'fb1b7396-afef-3390-bc44-b7c22ec4bbea', '49', '2011-01-18 15:56:00.408782+00', 308706, 446581, 'Magnesium', '1', 1, 8509231);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '3f55b934-4c5d-39bf-97ed-7c1091fb1204', '50', '2011-01-18 15:56:00.408782+00', 340626, 446581, 'Out of Mind', '2', 2, 8509232);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '2b9c46e1-5f99-3020-b3c7-dcf0b5702902', '51', '2011-01-18 15:56:00.408782+00', 326066, 446581, 'Free Me', '3', 3, 8509233);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '56d28592-a6b8-336e-8d82-2f48a9322c41', '52', '2011-01-18 15:56:00.408782+00', 340133, 446581, 'Koncrete', '4', 4, 8509234);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, 'cb8287e2-9c67-341c-8b42-fb02470beb0e', '53', '2011-01-18 15:56:00.408782+00', 353773, 446581, 'Loosen My Grip', '5', 5, 8509235);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '919f8a01-becd-3a52-8f64-8597b4afa6cd', '54', '2011-01-18 15:56:00.408782+00', 296000, 446581, 'Repercussions', '6', 6, 8509236);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '0a684ffb-d291-3df1-8cb1-97ca82a4111d', '55', '2011-01-18 15:56:00.408782+00', 329026, 446581, 'Mirror Tell', '7', 7, 8509237);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '686b3471-eb00-3b45-9612-cf104d4a4278', '56', '2011-01-18 15:56:00.408782+00', 295786, 446581, 'Sending Chills', '8', 8, 8509238);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '1f74a1d5-d355-3982-bfc1-e1ba03143c2d', '57', '2011-01-18 15:56:00.408782+00', 276373, 446581, 'Skeleton Grin', '9', 9, 8509239);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '856ae00a-cc2f-392f-a4a2-5ed96e234efb', '58', '2011-01-18 15:56:00.408782+00', 355346, 467794, 'V', '1', 1, 8692017);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, 'aaa81c88-2b48-3247-ad63-61ec4d423c5c', '59', '2011-01-18 15:56:00.408782+00', 209826, 467794, 'Headstrung', '2', 2, 8692018);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, 'a4066707-1f29-30d9-80c6-3b6d12f3f6e6', '60', '2011-01-18 15:56:00.408782+00', 291773, 467794, 'Misfit', '3', 3, 8692019);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (427385, 0, '75bbcd04-b648-3dd0-bad4-a84d38cc20da', '61', '2011-01-18 15:56:00.408782+00', 350120, 467794, 'Present Day', '4', 4, 8692020);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (305, 0, '1a0ba71b-fb23-3931-a426-cd204a82a90e', '14059814', '2013-01-25 14:09:41.036045-06', 128000, 1279200, 'Hello Goodbye [hidden track]', '0', 0, 14488617);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (305, 0, '7b84af2d-96b3-3c50-a667-e7d10e8b000d', '14059815', '2013-01-25 14:09:41.036045-06', 211133, 1279200, 'Galaxie', '1', 1, 449989);
INSERT INTO track (artist_credit, edits_pending, gid, id, last_updated, length, medium, name, number, position, recording) VALUES (305, 0, 'e9f7ca98-ba9d-3276-97a4-26475c9f4527', '14059816', '2013-01-25 14:09:41.036045-06', 240400, 1279200, '2 X 4', '2', 2, 449990);

-- Labels

INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, NULL, '', 222, 0, NULL, NULL, NULL, '0', 'f8714b81-78da-4f6e-a20c-7b2bad7709ce', 8092, NULL, NULL, 'Classic Records', 6);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1980, '', 222, 0, NULL, NULL, NULL, '0', '1bfd06be-a6ed-4ced-8159-7d4d2923a40c', 395, NULL, NULL, 'Epitaph', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (29, 4, 1996, 'UK drum & bass', 221, 0, NULL, NULL, NULL, '0', '8562598d-60d1-4bd6-8b85-4d709e951770', 288, 12939, NULL, 'Hospital Records', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, NULL, '', 222, 0, NULL, NULL, NULL, '0', '49375f06-59e2-4c94-93ac-ac0c6df52151', 36456, NULL, '2009-05-13 21:32:42.20387+00', 'MCA Music', 7);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, NULL, '', 222, 0, NULL, NULL, NULL, '0', 'ef36d3a8-fcc9-4e50-bb80-27bcfd0bbdad', 15288, NULL, NULL, 'ABC-Paramount', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, NULL, 'UK, started in 1981', 221, 0, NULL, NULL, NULL, '0', '6ca0c797-97f1-4701-8b62-f2f6d5fd1d10', 6553, 5982, NULL, 'Ace Records', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1965, '65-79 US', 222, 0, NULL, NULL, 1979, '1', 'c3e5d5a2-53f2-4eab-9641-23d61e511928', 2333, NULL, '2009-09-22 23:46:54.441733+00', 'ABC Records', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1967, 'US branch', 222, 0, NULL, NULL, 2004, '1', '46a3941a-c810-47a1-974f-955effec4d09', 347, 1056, NULL, 'MCA Records', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1977, '', 222, 0, NULL, NULL, NULL, '0', 'edd54e2f-2eef-46b1-a9b5-bedfe5ed33be', 4349, NULL, '2010-08-22 10:59:52.267882+00', 'Mobile Fidelity Sound Lab', 6);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (2, 6, 2003, '', 222, 0, NULL, NULL, NULL, '0', 'dc7149d6-0356-49d5-baa4-e7e7c57d88ff', 3933, NULL, NULL, 'Kounterfeit Records', 1);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, 11, 2005, '', 222, 0, NULL, NULL, NULL, '0', 'e95b7378-49f2-41a5-bc5f-08378fb69335', 30181, NULL, NULL, 'Grey Vireo Press', NULL);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, NULL, '', 107, 1, NULL, NULL, NULL, '0', '6bb73458-6c5f-4c26-8367-66fcef562955', 381, NULL, '2011-02-03 18:27:17.336777+00', 'zetima', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1989, '', 221, 0, NULL, NULL, NULL, '0', '46f0f4cd-8aab-4b33-b698-f459faf64190', 46, 2070, '2008-11-24 23:37:52.738165+00', 'Warp Records', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1989, '', 222, 0, NULL, NULL, NULL, '0', '229bd4be-8cd7-442c-85b0-5007ea353abc', 124, 11552, NULL, 'Matador Records', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1995, '', 221, 0, NULL, NULL, NULL, '0', 'b4edce40-090f-4956-b82a-5d9d285da40b', 132, NULL, NULL, 'Planet Mu', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, NULL, '', 107, 0, NULL, NULL, NULL, '0', '72a46579-e9a0-405a-8ee1-e6e6b63b8212', 2882, NULL, '2008-11-29 10:19:30.284281+00', 'rhythm zone', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, NULL, '', 107, 0, NULL, NULL, NULL, '0', '168f48c8-057e-4974-9600-aa9956d21e1a', 28, NULL, '2009-06-27 16:09:17.482349+00', 'avex trax', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 2001, 'UK drum & bass, Klute''s label', 221, 0, NULL, NULL, NULL, '0', '3218df3e-3de3-45e3-9a05-041528db6ee5', 3592, NULL, NULL, 'Commercial Suicide', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1992, '', 221, 0, NULL, NULL, NULL, '0', 'fe03671d-df66-4984-abbc-bd022f5c6c3f', 1949, NULL, NULL, 'RAM Records', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 2001, '', 221, 0, NULL, NULL, NULL, '0', '60a71ab7-a21b-4f25-94e0-1f51a84a9add', 3545, NULL, NULL, 'Frequency Recordings', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, NULL, '', 222, 0, NULL, NULL, NULL, '0', '60f3af98-d6ca-4995-a9b5-b93924e2405f', 187, NULL, NULL, 'Astralwerks', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1995, '', 221, 0, NULL, NULL, NULL, '0', '86b88c78-b21f-4711-a43d-991d8d1db10b', 2988, 3098, NULL, 'Freestyle Dust', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, NULL, '', 13, 0, NULL, NULL, NULL, '0', '42adf77e-f597-4bfe-9abd-b3e2516851e3', 9632, NULL, NULL, 'Virgin Records Australia', NULL);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1973, 'UK/worldwide', 221, 0, NULL, NULL, NULL, '0', '49b58bdb-3d74-40c6-956a-4c4b46115c9c', 95, 3098, NULL, 'Virgin', NULL);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1955, '', 222, 0, NULL, NULL, NULL, '0', '1b65f6a5-8214-4add-b5ad-5af191b4572c', 839, 1557, NULL, 'EastWest Records America', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1947, '', 222, 0, NULL, NULL, NULL, '0', '50c384a2-0b44-401b-b893-8181173339c7', 33, 121, NULL, 'Atlantic', 4);
INSERT INTO label (begin_date_day, begin_date_month, begin_date_year, comment, area, edits_pending, end_date_day, end_date_month, end_date_year, ended, gid, id, label_code, last_updated, name, type) VALUES (NULL, NULL, 1989, '', 107, 0, NULL, NULL, NULL, '0', '26ea8229-7cf7-4482-8dae-15589ceb5398', 369, NULL, NULL, 'Warner Music Japan', 1);

UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 33;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 369;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 8092;
UPDATE label_meta SET rating_count = 1, rating = 80 WHERE id = 395;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 288;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 36456;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 15288;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 6553;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 2333;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 347;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 4349;
UPDATE label_meta SET rating_count = 1, rating = 100 WHERE id = 3933;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 30181;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 381;
UPDATE label_meta SET rating_count = 1, rating = 100 WHERE id = 46;
UPDATE label_meta SET rating_count = 2, rating = 100 WHERE id = 124;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 132;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 2882;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 28;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 3592;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 1949;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 3545;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 187;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 2988;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 9632;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 95;
UPDATE label_meta SET rating_count = NULL, rating = NULL WHERE id = 839;

INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 3779, 369, '2011-01-18 15:21:33.71184+00', NULL, 'ワーナー・ミュージック・ジャパン', '0', 'ワーナー・ミュージック・ジャパン', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 1226, 395, '2011-01-18 15:21:33.71184+00', NULL, 'Epitaph Records', '0', 'Epitaph Records', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 2017, 36456, '2011-01-18 15:21:33.71184+00', NULL, 'MCA Music Ltd', '0', 'MCA Music Ltd', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 3854, 6553, '2011-01-18 15:21:33.71184+00', NULL, 'Ace Records UK', '0', 'Ace Records UK', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 1922, 2333, '2011-01-18 15:21:33.71184+00', NULL, 'ABC', '0', 'ABC', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 1634, 347, '2011-01-18 15:21:33.71184+00', NULL, 'MCA', '0', 'MCA', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 2155, 347, '2011-01-18 15:21:33.71184+00', NULL, 'MCA Records Inc', '0', 'MCA Records Inc', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 592, 4349, '2011-01-18 15:21:33.71184+00', NULL, 'MFSL', '0', 'MFSL', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 2457, 4349, '2011-01-18 15:21:33.71184+00', NULL, 'Mobile Fidelity Sound Labs', '0', 'Mobile Fidelity Sound Labs', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 2499, 3933, '2011-01-18 15:21:33.71184+00', NULL, 'Kounterfeit', '0', 'Kounterfeit', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 1, NULL, NULL, NULL, 4906, 381, '2011-02-03 18:27:17.336777+00', NULL, 'ゼティマ', '0', 'ゼティマ', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 639, 132, '2011-01-18 15:21:33.71184+00', NULL, 'Planet µ', '0', 'Planet µ', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 1244, 2882, '2011-01-18 15:21:33.71184+00', NULL, 'rythm zone', '0', 'rythm zone', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 895, 28, '2011-01-18 15:21:33.71184+00', NULL, 'Avex Trax Japan', '0', 'Avex Trax Japan', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 3311, 28, '2011-01-18 15:21:33.71184+00', NULL, 'エイベックス・トラックス', '0', 'エイベックス・トラックス', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 3411, 187, '2011-01-18 15:21:33.71184+00', NULL, 'Astralwerks Records', '0', 'Astralwerks Records', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 19, 95, '2011-01-18 15:21:33.71184+00', NULL, 'ヴァージン・レコード', '0', 'ヴァージン・レコード', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 1557, 95, '2011-01-18 15:21:33.71184+00', NULL, 'Virgin Records Ltd.', '0', 'Virgin Records Ltd.', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 1755, 95, '2011-01-18 15:21:33.71184+00', NULL, 'Virgin Records Japan', '0', 'Virgin Records Japan', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 2162, 95, '2011-01-18 15:21:33.71184+00', NULL, 'Virgin Music Co.', '0', 'Virgin Music Co.', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 2326, 95, '2011-01-18 15:21:33.71184+00', NULL, 'Virgin Records Canada', '0', 'Virgin Records Canada', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 3079, 95, '2011-01-18 15:21:33.71184+00', NULL, 'Virgin UK', '0', 'Virgin UK', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 3585, 95, '2011-01-18 15:21:33.71184+00', NULL, 'Virgin Records', '0', 'Virgin Records', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 295, 839, '2011-01-18 15:21:33.71184+00', NULL, 'East West Records America', '0', 'East West Records America', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 1684, 839, '2011-01-18 15:21:33.71184+00', NULL, 'EastWest', '0', 'EastWest', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 1523, 33, '2011-01-18 15:21:33.71184+00', NULL, 'Atlantic', '0', 'Atlantic', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 3831, 33, '2011-01-18 15:21:33.71184+00', NULL, 'Atlantic Recording Corporation', '0', 'Atlantic Recording Corporation', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 4096, 33, '2011-01-18 15:21:33.71184+00', NULL, 'Atlantic Records', '0', 'Atlantic Records', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 422, 369, '2011-01-18 15:21:33.71184+00', NULL, 'ワーナーミュージックジャパン', '0', 'ワーナーミュージックジャパン', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 507, 369, '2011-01-18 15:21:33.71184+00', NULL, 'ワーナーミュージック・ジャパン', '0', 'ワーナーミュージック・ジャパン', NULL);
INSERT INTO label_alias (begin_date_day, begin_date_month, begin_date_year, edits_pending, end_date_day, end_date_month, end_date_year, id, label, last_updated, locale, name, primary_for_locale, sort_name, type) VALUES (NULL, NULL, NULL, 0, NULL, NULL, NULL, 2656, 369, '2011-01-18 15:21:33.71184+00', NULL, 'WMJ', '0', 'WMJ', NULL);

-- Release labels

INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('EPCE-5112', 127218, 381, '2011-01-18 15:52:02.917556+00', 49161);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('EPCE-5112', 155396, 381, '2011-01-18 15:52:02.917556+00', 123054);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('WARPCD64', 57662, 46, '2011-01-18 15:52:02.917556+00', 24752);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('OLE 358-2', 57660, 124, '2011-01-18 15:52:02.917556+00', 243064);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('WARPLP64', 57661, 46, '2011-01-18 15:52:02.917556+00', 654729);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('ZIQ170CD', 187480, 132, '2011-01-18 15:52:02.917556+00', 246898);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('ZIQ221CD', 318646, 132, '2011-01-18 15:52:02.917556+00', 446581);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('RZCD-45118', 134076, 2882, '2011-01-18 15:52:02.917556+00', 59662);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES (NULL, 69343, 28, '2011-01-18 15:52:02.917556+00', 4675);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('AVCD-17390', 113447, 28, '2011-01-18 15:52:02.917556+00', 59312);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('AVCD-17389', 113446, 28, '2011-01-18 15:52:02.917556+00', 558940);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('ASW CD PRO 47610-2', 82, 187, '2011-01-18 15:52:02.917556+00', 8312);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('ASW47610-2', 90295, 187, '2011-01-18 15:52:02.917556+00', 19969);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('XDUSTCD4', 478343, 2988, '2011-01-18 15:52:02.917556+00', 31689);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('XDUSTCD4', 90294, 2988, '2011-01-18 15:52:02.917556+00', 31690);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('XDUSTMD4', 90293, 2988, '2011-01-18 15:52:02.917556+00', 278075);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('7243 8 48849 0 1', 90296, 9632, '2011-01-18 15:52:02.917556+00', 338506);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('XDUSTLP4', 277443, 2988, '2011-01-18 15:52:02.917556+00', 400930);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('VGP 000245', 33174, 95, '2011-01-18 15:52:02.917556+00', 741970);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('8476102', 431676, 2988, '2011-01-18 15:52:02.917556+00', 748905);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('KOU-004', 261286, 3933, '2011-01-18 15:52:02.917556+00', 375273);
INSERT INTO release_label (catalog_number, id, label, last_updated, release) VALUES ('GVP01', 313869, 30181, '2011-01-18 15:52:02.917556+00', 459740);

-- Places

INSERT INTO place (id, gid, name, type, address, area, coordinates, comment, edits_pending, last_updated, begin_date_year, begin_date_month, begin_date_day, end_date_year, end_date_month, end_date_day, ended) VALUES (1, 'df9269dd-0470-4ea2-97e8-c11e46080edd', 'A Test Place', 2, 'An Address', 241, '(0.323,1.234)', 'A PLACE!', 0, '2013-09-07 14:40:22.041309+00', 2013, NULL, NULL, NULL, NULL, NULL, '0');

INSERT INTO place_alias (id, place, name, locale, edits_pending, last_updated, type, sort_name, begin_date_year, begin_date_month, begin_date_day, end_date_year, end_date_month, end_date_day, primary_for_locale, ended) VALUES (1, 1, 'A Test Place Alias', NULL, 0, '2013-09-16 11:00:11.746172+00', NULL, 'A Test Place Alias', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0');

-- Series

INSERT INTO series (id, gid, name, type, ordering_type) VALUES
    (25, 'd977f7fd-96c9-4e3e-83b5-eb484a9e6582', 'Bach-Werke-Verzeichnis', 5, 1),
    (30, 'd977f7fd-96c9-4e3e-83b5-eb484a9e6581', 'A Release Group Series', 1, 1);

INSERT INTO series_alias (id, series, name, sort_name) VALUES
    (7, 25, 'BWV', 'BWV');

INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES
    ('', 0, '13bb5d97-00db-4fd8-920c-14da7c11bdd4', 12488154, '2014-07-09 15:10:16.494155-05', 'Kantate, BWV 1 "Wie schön leuchtet der Morgenstern"', 3),
    ('', 0, 'fa97639c-ea29-47d6-9461-16b411322bac', 12488155, '2014-07-09 14:59:14.107699-05', 'Kantate, BWV 2 "Ach Gott, vom Himmel sieh darein"', 3),
    ('', 0, '3edf4a3f-2b11-4a61-a5cf-e193363ef55c', 12488156, '2014-07-03 15:29:22.181908-05', 'Kantate, BWV 3 "Ach Gott, wie manches Herzeleid"', 3);

INSERT INTO work_language (work, language) VALUES
    (12488154, 145),
    (12488155, 145),
    (12488156, 145);

INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES
    (1, NULL, NULL, NULL, '2014-07-09 15:10:16.494155-05', NULL, NULL, NULL, '0', 180865, 743),
    (1, NULL, NULL, NULL, '2014-07-09 15:10:16.494155-05', NULL, NULL, NULL, '0', 180875, 742),
    (1, NULL, NULL, NULL, '2014-07-03 15:25:50.050958-05', NULL, NULL, NULL, '0', 180086, 743),
    (1, NULL, NULL, NULL, '2014-06-24 07:16:41.33395-05', NULL, NULL, NULL, '0', 178448, 743);

INSERT INTO link_attribute (attribute_type, created, link) VALUES
    (788, '2014-07-09 15:10:16.494155-05', 180865),
    (788, '2014-07-09 15:10:16.494155-05', 180875),
    (788, '2014-07-03 15:25:50.050958-05', 180086),
    (788, '2014-06-24 07:16:41.33395-05', 178448);

INSERT INTO link_attribute_text_value (attribute_type, link, text_value) VALUES
    (788, 180865, 'BWV 1'),
    (788, 180086, 'BWV 2'),
    (788, 178448, 'BWV 3'),
    (788, 180875, '1');

INSERT INTO l_release_group_series (edits_pending, entity0, entity0_credit, entity1, entity1_credit, id, last_updated, link, link_order) VALUES
    (0, 403214, '', 30, '', 7765, '2014-07-09 15:10:16.494155-05', 180875, 1);

INSERT INTO l_series_work (edits_pending, entity0, entity0_credit, entity1, entity1_credit, id, last_updated, link, link_order) VALUES
    (0, 25, '', 12488154, '', 7760, '2014-07-09 15:10:16.494155-05', 180865, 1),
    (0, 25, '', 12488155, '', 7494, '2014-07-03 15:25:50.050958-05', 180086, 2),
    (0, 25, '', 12488156, '', 6668, '2014-06-24 07:16:41.33395-05', 178448, 3);

-- Works

INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'f5cdd40d-6dc3-358b-8d7d-22dd9d8f87a8', 7905446, NULL, 'Asseswaving', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '3c37b9fa-a6c1-37d2-9e90-657a116d337c', 4223059, NULL, 'サマーれげぇ!レインボー', 17);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '25c7c80f-a624-3b3e-b643-4204b05cb447', 1542682, NULL, 'On My Bus', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '482530c1-a2ab-32e8-be43-ea5240aa7913', 1542684, NULL, 'Plock', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'b26203e5-73cb-3579-b575-a12d8b3f8209', 7905443, NULL, 'Maggie&Heidi', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'b07e71c7-1cc7-3c6f-8c31-22be30a472dd', 7905441, NULL, 'Black Sundress', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '2734cd31-4bab-3bf6-a758-c5d94ad957bb', 1542685, NULL, 'Marbles', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '53d1fbac-e60a-38cb-85ff-e5a9224c9749', 3622825, NULL, 'Be the one', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '7981d409-8e76-33df-be27-ef625d81c501', 1307406, NULL, 'Shine We Are!', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '303f9bd2-152f-3145-9e09-afa34edb6a57', 3451975, NULL, 'DOUBLE', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'f23ae726-0300-3830-b1ca-634f4362f78c', 3622823, NULL, 'LOVE & HONESTY', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'e67f54be-a68b-351d-9fbf-57468e61fd95', 1542691, NULL, 'Summer Plays Out', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '37814c05-f7ff-308d-a339-21570bc56003', 1542690, NULL, 'Be Rude to Your School', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'e8d55116-1ea6-339a-a059-228d71c2f27d', 7905439, NULL, 'Reverend Charisma', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '9c38c012-9b30-30a2-a2fb-4b44afdc3973', 7905445, NULL, 'Still Unsatisfied', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '93836f17-7646-374e-a679-455429162c20', 1542688, NULL, 'Press a Key', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '46724ef1-241e-3d7f-9f3b-e51ba34e2aa1', 4525123, NULL, 'the Love Bug', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '79945eb6-f0c2-351a-a00b-3ef3b775f9da', 2726271, NULL, 'Music: Response', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'cd86f9e2-83ce-3192-a817-fe6c98079303', 3622831, NULL, 'Song With No Name～名前のない歌～', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'f2892986-c106-3705-9cf2-4fe599154dc2', 1353887, NULL, 'Power Move', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '61ab56f0-e803-3aef-a91b-63564b7a8043', 3451976, NULL, 'Rock With You', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'c4a1c334-ccd3-37df-b248-40653cefb181', 7905442, NULL, 'Allegiance?WTF?', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '2d967c29-63dc-309d-bbc1-a2d38639aaa1', 3622828, NULL, '心の手紙', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '5466408d-ad87-3663-8bce-937c5d3e0159', 1353886, NULL, 'Out of Control', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '6f08d5a8-1811-3e5e-848b-35ffa77babe5', 3584195, NULL, 'Midnight Parade', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'ba0182aa-27b4-3e39-b4e5-2c7583696dab', 2726278, NULL, 'Got Glint?', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '835c06f2-b015-3715-a649-d92b3c1adf62', 2726280, NULL, 'Surrender', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '294f16fe-e123-3634-a0f4-03953e111321', 1542686, NULL, 'Busy Working', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '55f63d35-d941-3988-a9b0-16150c4acdb7', 2726276, NULL, 'The Sunshine Underground', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'b8f69869-f01d-384c-bd65-b67caed6d9ac', 203492, NULL, 'Hey Boy Hey Girl', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '4290c4aa-f538-31d8-b502-cb01fc7fc5af', 1542683, NULL, 'Top & Low Rent', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '7e78f281-52b4-315b-9d7b-6d215732f3d7', 3622826, NULL, 'EXPECT', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '2cd04f80-fbd7-343f-8499-bf0028f0f530', 7905440, NULL, 'Dear Diary', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '8b943176-4f67-3925-a26a-33f66649c438', 2726272, NULL, 'Under the Influence', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '286ecfdd-2ffe-3bc7-b3e9-04cc8cea229b', 3622830, NULL, 'Easy To Be Hard', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'd2f1ea1f-de2e-3d0c-b534-e96377912478', 3622827, NULL, 'OVER～across the time～', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'f4f581d8-50e0-3886-bcd3-610187821bcd', 1542687, NULL, 'The Greek Alphabet', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '61a259e3-8d3f-3982-a9f4-41e16488fecc', 2726281, NULL, 'Dream On', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '3a62a9f7-1365-32aa-9da8-3e0ef1f2b0ca', 1542689, NULL, 'Bibi Plone', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '03c1ac6c-4eff-3df1-a3e7-ac9db55a45fa', 203493, NULL, 'Flashback', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '0fd9dd5e-a5a4-3498-b68c-9f4c86fe674d', 4223060, NULL, 'HELLO! また会おうね (7人祭 version)', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'f64b38ee-4451-3b29-8551-05146764b5b9', 2726274, NULL, 'Orange Wedge', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '20146cdd-1179-3c25-897a-b30d76b2c980', 1353888, NULL, 'Out of Control (Sasha remix)', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '4b6a46c2-a904-3471-9bff-3942d4549f47', 3622822, NULL, 'SOME DAY ONE DAY )', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '50c07b24-7ee2-31ac-ab87-f0d399011c71', 3584196, NULL, 'Milky Way 〜君の歌〜', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, '511f5124-c0ae-3386-bb76-4b6521498a68', 3622832, NULL, 'Milky Way-君の歌-', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'd132b1b7-3432-38e1-9e2d-5e5fa319fe8a', 211564, NULL, 'Let Forever Be', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'c473ece7-4858-3f4f-9d7a-a1e026400887', 2726277, NULL, 'Asleep From Day', NULL);
INSERT INTO work (comment, edits_pending, gid, id, last_updated, name, type) VALUES ('', 0, 'c473ece7-4858-3f4f-9d7a-a1e026400888', 2726288, NULL, 'Hello Goodbye', NULL);

INSERT INTO work_language (work, language) VALUES (7905446, 198), (4223059, 198), (2726288, 120);

UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 7905446;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 4223059;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542682;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542684;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 7905443;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 7905441;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542685;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3622825;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1307406;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3451975;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3622823;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542691;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542690;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 7905439;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 7905445;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542688;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 4525123;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 2726271;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3622831;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1353887;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3451976;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 7905442;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3622828;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1353886;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3584195;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 2726278;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 2726280;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542686;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 2726276;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 203492;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542683;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3622826;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 162920;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 7905440;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 2726272;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3622830;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3622827;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542687;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 2726281;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1542689;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 203493;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 4223060;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 2726274;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 1353888;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3622822;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3584196;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 3622832;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 211564;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 2726277;
UPDATE work_meta SET rating_count = NULL, rating = NULL WHERE id = 2726288;

-- Tags
INSERT INTO tag (id, name, ref_count) VALUES (1, 'trip-hop', 586);
INSERT INTO tag (id, name, ref_count) VALUES (7, 'rock', 64679);
INSERT INTO tag (id, name, ref_count) VALUES (11, 'electronic', 59601);
INSERT INTO tag (id, name, ref_count) VALUES (16, 'post-rock', 353);
INSERT INTO tag (id, name, ref_count) VALUES (19, 'pop', 20790);
INSERT INTO tag (id, name, ref_count) VALUES (20, 'alternative rock', 8771);
INSERT INTO tag (id, name, ref_count) VALUES (26, 'drum and bass', 5525);
INSERT INTO tag (id, name, ref_count) VALUES (30, 'dubstep', 347);
INSERT INTO tag (id, name, ref_count) VALUES (34, 'big beat', 668);
INSERT INTO tag (id, name, ref_count) VALUES (49, 'instrumental', 1641);
INSERT INTO tag (id, name, ref_count) VALUES (71, 'jazz', 14168);
INSERT INTO tag (id, name, ref_count) VALUES (77, 'house', 9722);
INSERT INTO tag (id, name, ref_count) VALUES (88, 'punk', 10474);
INSERT INTO tag (id, name, ref_count) VALUES (104, 'japanese', 706);
INSERT INTO tag (id, name, ref_count) VALUES (111, 'american', 2207);
INSERT INTO tag (id, name, ref_count) VALUES (114, 'hello project', 1633);
INSERT INTO tag (id, name, ref_count) VALUES (166, 'experimental', 7173);
INSERT INTO tag (id, name, ref_count) VALUES (171, 'british', 2254);
INSERT INTO tag (id, name, ref_count) VALUES (205, 'idm', 3936);
INSERT INTO tag (id, name, ref_count) VALUES (237, 'uk', 3174);
INSERT INTO tag (id, name, ref_count) VALUES (271, 'hard rock', 5890);
INSERT INTO tag (id, name, ref_count) VALUES (273, 'usa', 1876);
INSERT INTO tag (id, name, ref_count) VALUES (280, 'britannique', 438);
INSERT INTO tag (id, name, ref_count) VALUES (284, 'indie rock', 4364);
INSERT INTO tag (id, name, ref_count) VALUES (343, 'folk rock', 2948);
INSERT INTO tag (id, name, ref_count) VALUES (502, 'j-pop', 145);
INSERT INTO tag (id, name, ref_count) VALUES (518, 'instrumental rock', 312);
INSERT INTO tag (id, name, ref_count) VALUES (537, 'indie', 4529);
INSERT INTO tag (id, name, ref_count) VALUES (545, 'techno', 11831);
INSERT INTO tag (id, name, ref_count) VALUES (558, 'kpop', 45);
INSERT INTO tag (id, name, ref_count) VALUES (559, 'electronica', 1557);
INSERT INTO tag (id, name, ref_count) VALUES (590, 'breakbeat', 2358);
INSERT INTO tag (id, name, ref_count) VALUES (642, 'disco', 3398);
INSERT INTO tag (id, name, ref_count) VALUES (741, 'jpop', 150);
INSERT INTO tag (id, name, ref_count) VALUES (743, 'hardcore punk', 155);
INSERT INTO tag (id, name, ref_count) VALUES (748, 'américain', 557);
INSERT INTO tag (id, name, ref_count) VALUES (800, 'breaks', 1585);
INSERT INTO tag (id, name, ref_count) VALUES (1030, 'tech house', 3185);
INSERT INTO tag (id, name, ref_count) VALUES (1032, 'glitch', 634);
INSERT INTO tag (id, name, ref_count) VALUES (1051, 'audiobook', 67);
INSERT INTO tag (id, name, ref_count) VALUES (1063, 'experimental rock', 104);
INSERT INTO tag (id, name, ref_count) VALUES (1079, 'post-punk revival', 40);
INSERT INTO tag (id, name, ref_count) VALUES (1190, 'piano rock', 30);
INSERT INTO tag (id, name, ref_count) VALUES (1246, 'free jazz', 346);
INSERT INTO tag (id, name, ref_count) VALUES (1282, 'progressive house', 1615);
INSERT INTO tag (id, name, ref_count) VALUES (1354, 'c-pop', 2);
INSERT INTO tag (id, name, ref_count) VALUES (1355, 'k-pop', 5);
INSERT INTO tag (id, name, ref_count) VALUES (1391, 'english', 1326);
INSERT INTO tag (id, name, ref_count) VALUES (1522, 'grime', 472);
INSERT INTO tag (id, name, ref_count) VALUES (1604, 'independent', 71);
INSERT INTO tag (id, name, ref_count) VALUES (1661, 'warp', 104);
INSERT INTO tag (id, name, ref_count) VALUES (1887, 'california', 234);
INSERT INTO tag (id, name, ref_count) VALUES (1974, 'manchester', 53);
INSERT INTO tag (id, name, ref_count) VALUES (1997, 'hello project shuffle units', 16);
INSERT INTO tag (id, name, ref_count) VALUES (1998, 'hello project groups', 56);
INSERT INTO tag (id, name, ref_count) VALUES (2105, 'united kingdom', 85);
INSERT INTO tag (id, name, ref_count) VALUES (2147, 'los angeles', 116);
INSERT INTO tag (id, name, ref_count) VALUES (2726, 'chapel hill', 4);
INSERT INTO tag (id, name, ref_count) VALUES (3253, 'discopharma', 5);
INSERT INTO tag (id, name, ref_count) VALUES (3254, 'wedlock', 17);
INSERT INTO tag (id, name, ref_count) VALUES (3255, 'the beatguild', 2);
INSERT INTO tag (id, name, ref_count) VALUES (3256, 'discopharmacy', 1);
INSERT INTO tag (id, name, ref_count) VALUES (3257, 'gaydisco', 1);
INSERT INTO tag (id, name, ref_count) VALUES (3258, 'exogamy', 8);
INSERT INTO tag (id, name, ref_count) VALUES (3259, 'ana mitchell', 4);
INSERT INTO tag (id, name, ref_count) VALUES (3403, 'north carolina', 8);
INSERT INTO tag (id, name, ref_count) VALUES (3857, 'matrimony', 3);
INSERT INTO tag (id, name, ref_count) VALUES (3859, 'cuts both ways', 6);
INSERT INTO tag (id, name, ref_count) VALUES (3862, 'amazon', 87);
INSERT INTO tag (id, name, ref_count) VALUES (3870, 'k t', 1);
INSERT INTO tag (id, name, ref_count) VALUES (3871, 'jason merritt', 2);
INSERT INTO tag (id, name, ref_count) VALUES (3872, 'still unsatisfied', 4);
INSERT INTO tag (id, name, ref_count) VALUES (3873, 'dear diary', 3);
INSERT INTO tag (id, name, ref_count) VALUES (3874, 'jj kidder', 3);
INSERT INTO tag (id, name, ref_count) VALUES (3875, 'black sundress', 5);
INSERT INTO tag (id, name, ref_count) VALUES (3876, 'just because', 2);
INSERT INTO tag (id, name, ref_count) VALUES (3877, 'kirk bryson', 3);
INSERT INTO tag (id, name, ref_count) VALUES (3878, 'kounterfeit records', 7);
INSERT INTO tag (id, name, ref_count) VALUES (3879, 'blue metallic brush', 1);
INSERT INTO tag (id, name, ref_count) VALUES (3880, 'nine tracks', 1);
INSERT INTO tag (id, name, ref_count) VALUES (3881, 'rev charisma', 1);
INSERT INTO tag (id, name, ref_count) VALUES (3882, 'asseswaving', 1);
INSERT INTO tag (id, name, ref_count) VALUES (3883, 'maggie and heidi', 1);
INSERT INTO tag (id, name, ref_count) VALUES (3884, 'paul allgood', 21);
INSERT INTO tag (id, name, ref_count) VALUES (3885, 'allegiance', 2);
INSERT INTO tag (id, name, ref_count) VALUES (3886, 'studio 31', 1);
INSERT INTO tag (id, name, ref_count) VALUES (3887, 'glyph', 1);
INSERT INTO tag (id, name, ref_count) VALUES (4666, 'dance and electronica', 861);
INSERT INTO tag (id, name, ref_count) VALUES (5221, 'united states', 104);
INSERT INTO tag (id, name, ref_count) VALUES (6542, 'lee whitsel', 6);
INSERT INTO tag (id, name, ref_count) VALUES (6543, 'baxter smith', 5);
INSERT INTO tag (id, name, ref_count) VALUES (6544, 'jay bowden', 2);
INSERT INTO tag (id, name, ref_count) VALUES (6622, 'jeff hathaway', 4);
INSERT INTO tag (id, name, ref_count) VALUES (6650, 'reverend charisma', 2);
INSERT INTO tag (id, name, ref_count) VALUES (6662, 'jonathan kidder', 2);
INSERT INTO tag (id, name, ref_count) VALUES (6669, 'complex', 2);
INSERT INTO tag (id, name, ref_count) VALUES (6670, 'killing is easy', 1);
INSERT INTO tag (id, name, ref_count) VALUES (6671, 'unsatisfied', 1);
INSERT INTO tag (id, name, ref_count) VALUES (6672, 'an inextricable tale', 2);
INSERT INTO tag (id, name, ref_count) VALUES (6673, 'here', 1);
INSERT INTO tag (id, name, ref_count) VALUES (6674, 'virgina ocallah', 1);
INSERT INTO tag (id, name, ref_count) VALUES (6675, 'inextricable', 2);
INSERT INTO tag (id, name, ref_count) VALUES (6676, 'saul shields', 1);
INSERT INTO tag (id, name, ref_count) VALUES (6677, 'kira', 1);
INSERT INTO tag (id, name, ref_count) VALUES (6678, 'rattigan', 1);
INSERT INTO tag (id, name, ref_count) VALUES (6679, 'life as an ampersand', 1);
INSERT INTO tag (id, name, ref_count) VALUES (7913, 'éditeur', 152);
INSERT INTO tag (id, name, ref_count) VALUES (7914, 'publisher', 153);
INSERT INTO tag (id, name, ref_count) VALUES (8383, 'major label', 1);
INSERT INTO tag (id, name, ref_count) VALUES (22032, 'christopher jackson', 2);
INSERT INTO tag (id, name, ref_count) VALUES (22033, 'alison davis', 4);
INSERT INTO tag (id, name, ref_count) VALUES (25514, 'epitaph', 26);
INSERT INTO tag (id, name, ref_count) VALUES (27737, 'country-jp', 188);
INSERT INTO tag (id, name, ref_count) VALUES (29329, 'format-dvd-video', 264);
INSERT INTO tag (id, name, ref_count) VALUES (33017, 'electronica dubstep', 14);

-- Genres
INSERT INTO genre (id, gid, name) VALUES (1, '1b50083b-1afa-4778-82c8-548b309af783', 'dubstep');
INSERT INTO genre (id, gid, name) VALUES (2, '89255676-1f14-4dd8-bbad-fca839d6aff4', 'electronic');
INSERT INTO genre (id, gid, name, comment) VALUES (3, '51cfaac4-6696-480b-8f1b-27cfc789109c', 'grime', 'stuff');
INSERT INTO genre (id, gid, name) VALUES (4, 'eba7715e-ee26-4989-8d49-9db382955419', 'j-pop');
INSERT INTO genre (id, gid, name) VALUES (5, 'b74b3b6c-0700-46b1-aa55-1f2869a3bd1a', 'k-pop');
INSERT INTO genre (id, gid, name) VALUES (6, '911c7bbb-172d-4df8-9478-dbff4296e791', 'pop');
INSERT INTO genre (id, gid, name) VALUES (7, '53a3cea3-17af-4421-a07a-5824b540aeb5', 'electronica');
INSERT INTO genre (id, gid, name) VALUES (8, 'aac07ae0-8acf-4249-b5c0-2762b53947a2', 'big beat');
INSERT INTO genre (id, gid, name) VALUES (9, 'a2782cb6-1cd0-477c-a61d-b3f8b42dd1b3', 'house');
INSERT INTO genre (id, gid, name) VALUES (10, '18b010d7-7d85-4445-a4a8-1889a4688308', 'glitch');

INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 95821, 34, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 34, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000002, 34, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000003, 34, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 77, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 1, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 237, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 1391, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 1974, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 4666, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 171, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000002, 171, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000003, 171, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000004, 171, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000005, 171, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000006, 171, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 559, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000002, 559, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 95821, 11, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 11, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000002, 11, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000003, 11, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000004, 11, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000005, 11, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000006, 11, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000007, 11, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 100000001, 2105, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (242, 95821, 741, 'f');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (9496, 100000001, 558, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (9496, 100000001, 741, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (9496, 100000001, 1354, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (9496, 100000001, 1355, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (9496, 100000001, 104, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (9496, 100000001, 502, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (9496, 100000001, 19, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (11545, 100000001, 237, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (11545, 100000001, 171, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (11545, 100000001, 1391, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (11545, 100000001, 1661, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (11545, 100000001, 559, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (11545, 100000001, 11, 't');
INSERT INTO artist_tag_raw (artist, editor, tag, is_upvote) VALUES (11545, 100000001, 1032, 't');

INSERT INTO release_group_tag_raw (release_group, editor, tag, is_upvote) VALUES (326504, 100000001, 29329, 't');
INSERT INTO release_group_tag_raw (release_group, editor, tag, is_upvote) VALUES (597897, 100000001, 11, 't');
INSERT INTO release_group_tag_raw (release_group, editor, tag, is_upvote) VALUES (597897, 100000001, 1522, 't');
INSERT INTO release_group_tag_raw (release_group, editor, tag, is_upvote) VALUES (597897, 100000001, 30, 't');
INSERT INTO release_group_tag_raw (release_group, editor, tag, is_upvote) VALUES (597897, 100000002, 30, 't');

INSERT INTO label_tag_raw (label, editor, tag, is_upvote) VALUES (132, 100000001, 237, 't');
INSERT INTO label_tag_raw (label, editor, tag, is_upvote) VALUES (132, 100000001, 171, 't');
INSERT INTO label_tag_raw (label, editor, tag, is_upvote) VALUES (132, 100000001, 1391, 't');

INSERT INTO recording_tag_raw (recording, editor, tag, is_upvote) VALUES (4525010, 100000001, 741, 't');
INSERT INTO recording_tag_raw (recording, editor, tag, is_upvote) VALUES (4525011, 100000001, 1354, 't');
INSERT INTO recording_tag_raw (recording, editor, tag, is_upvote) VALUES (4525123, 100000001, 558, 't');
INSERT INTO recording_tag_raw (recording, editor, tag, is_upvote) VALUES (6750266, 100000001, 30, 't');

-- CDTOC/medium_cdtoc/etc.

INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'W01Qvrvwkaz2Cm.IQm55_RHoRxs-', '1c032103', 129807, 60295, 3, '{150,22352,38335}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '4Fzv46Cx17XbCG5hQ1xo6KmQojk-', '9509400a', 96188, 177766, 10, '{150,20190,37441,55229,72498,88781,105874,124205,137213,152863}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'VkX.hmODEJMV9FhQnxkWzQSX8iE-', '7f09350a', 114635, 176980, 10, '{150,20217,37505,55290,72527,88835,105882,124220,137267,152920}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '75S7Yp3IiqPVREQhjAjMXPhwz0Y-', '7f0ea40c', 269350, 281289, 12, '{150,27852,49751,75876,99845,120876,140765,165856,188422,211757,232229,255810}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '93K4ogyxWlv522XF0BG8fZOuay4-', '800b3209', 281138, 215137, 9, '{150,23303,48850,73305,98815,125348,147548,172225,194409}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'VnL0A7ksXznBxvZ94H3Z61EZY3k-', '840ad809', 281139, 208393, 9, '{150,26801,42538,64421,90680,114510,138939,164009,186929}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'afhq1hAs2MoqPcU9JENE5i_mACM-', 'ad0d410d', 77049, 254650, 13, '{150,19230,42125,62632,83817,103437,120475,139975,166185,187925,203550,225687,239650}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'T.epJ9O5SoDjPqAJuOJfAI9O8Nk-', 'a90d590d', 81302, 256486, 13, '{150,19383,42431,63091,84429,104202,121393,141045,167408,189301,205078,227368,241484}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'sodU6_.Y7u.KceQOILt9TBWlowE-', '870dd20b', 43155, 265570, 11, '{150,24285,43532,76330,90350,108054,146995,168537,193007,214812,235112}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'BtKm6dTiu3iaAKXG0UOzQLQoqtg-', '890dbd0b', 152078, 263933, 11, '{150,23995,43046,75876,89722,107222,145988,167378,191709,213344,233445}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'I80AyqyKJJ7ErmcO3Ol6IvkNm6Q-', '840dcf0b', 133905, 265276, 11, '{150,24140,43339,76218,90206,107832,146742,168281,192801,214535,234708}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'HBdX34kIIszmAgC0rQgA5wpm.00-', '950deb0b', 240446, 267444, 11, '{150,24344,43701,76936,91098,109072,148147,169851,194526,216393,236740}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'Y0vn_rEMiqZBjcX83_H0kIhAHWI-', '890dd30b', 322076, 265580, 11, '{150,24197,43367,76382,90380,108107,147025,168567,193050,214817,235077}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'IMDbh1LVwOMIWvJuREMoC1iauOY-', '930dd70b', 340280, 265922, 11, '{150,24192,43397,76480,90490,108312,147235,168787,193310,215025,235220}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'AEksyBzpAWwQVR8rz2ASF984Uo4-', '980de20b', 344827, 266723, 11, '{150,24297,43650,76705,90853,108653,147721,169413,194046,215983,236386}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'ntVUGiLS__Fa__494wln20X0YnI-', '890dd20b', 17, 265530, 11, '{150,24147,43350,76332,90330,108057,146975,168517,193000,214787,235040}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'I7bkQQjCp.XBo0zrwTLxLYz1vXs-', '890dd00b', 110729, 265380, 11, '{150,24161,43380,76346,90358,108010,146928,168482,193000,214746,234948}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'rfLLTAuy0gbQkonQKCLGabmk2MY-', '1902ec03', 268493, 56275, 3, '{150,18727,39085}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'Sehck3.MCN8EFcUJ5.F8nR4H3v0-', '60099608', 49930, 184210, 8, '{182,24925,59357,81107,95905,112640,132355,163885}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'vdqjl0qd439MIsKaj0snDOhuiLU-', '5e099b08', 354280, 184645, 8, '{150,24890,59372,81145,95795,112695,132545,164315}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '8g0LhwVHIn_LfBt88ruvkYe1X3g-', '60099608', 339838, 184245, 8, '{150,24947,59365,81115,95912,112647,132362,163892}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'dvMaF6OoUA42N9Jw_nwISI86ocY-', '69099e08', 316245, 184805, 8, '{187,25000,59482,81242,95895,112795,132645,164425}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'RQ69TCHg_nsoKXtFgDc5T5QGMgQ-', '5e099c08', 295235, 184657, 8, '{150,24890,59372,81145,95795,112695,132545,164315}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'VWXyO4ux.s2_c5jFS1Q4Etsp6co-', '6b0c5408', 291363, 236918, 8, '{150,33045,69418,101400,119930,137573,158710,211493}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'AE1YB3XUylgfysw.tszWOdkrwiQ-', '60099608', 268087, 184245, 8, '{150,24948,59365,81115,95913,112648,132363,163893}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'YOLlLOewMCnK5OdwRldTW8H8Ph0-', '60099608', 256078, 184210, 8, '{182,24928,59358,81108,95905,112640,132355,163885}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'ZeUS.FCJxbcQhhKEEul4EHw6NYQ-', '63099c08', 184796, 184690, 8, '{183,24923,59405,81178,95828,112728,132578,164348}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'AUwjxNYeUi4fSgvQJfjGRDwJXJ0-', '5e099508', 181552, 184165, 8, '{150,24895,59325,81075,95872,112607,132322,163852}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '9h2hHjVbVjVI6KwuTGDZzhbmc9U-', '61099608', 152998, 184240, 8, '{182,24937,59360,81125,95920,112650,132350,163895}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '7sSDtdOuG5P3Y.eEDls6U7SYorE-', '63099c08', 121086, 184665, 8, '{183,24930,59413,81178,95828,112728,132578,164355}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'nuzctgwwFzYqqT06PC55YXawumw-', '60099508', 108503, 184190, 8, '{182,24917,59357,81107,95905,112640,132355,163885}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'YawI_3ga7sXXZk6jGfmPOm9god4-', '60099608', 893, 184210, 8, '{150,24912,59357,81107,95902,112640,132337,163880}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '8IxUHoNrTHMAmTIlhuY4F7A3pv4-', '69099b08', 7927, 184707, 8, '{225,24977,59460,81232,95882,112782,132632,164402}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '6QwQ1XpuVHRAf2WmEJ7ncFCHIFE-', '6809ad08', 98281, 185931, 8, '{150,25072,59718,81659,96480,113544,133562,165506}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'syCuIG.VDtfkIkCZ7srayNW8rnA-', 'b208d40e', 376870, 169673, 14, '{150,9348,21473,36280,48635,63000,77050,88643,105705,117915,127185,139398,151893,166523}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '5t9hqzNTxRPT7zKSgqbIaUPfBzg-', 'b708d40e', 10144, 169707, 14, '{182,9382,21507,36312,48670,63032,77085,88675,105737,117947,127217,139430,151927,166555}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'Oa9KN2peBaJdn1znF7XXMXKkhLo-', 'b208d40e', 112902, 169667, 14, '{150,9347,21470,36285,48637,63002,77035,88645,105707,117925,127190,139395,151892,166525}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'tR2SpfaE.q4kUoGwP.NkPT6vwhc-', 'b708d40e', 146522, 169707, 14, '{182,9380,21505,36312,48667,63032,77082,88675,105737,117947,127217,139430,151925,166555}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '5ryUSsKSzUhTIcCvvBbzY6mmP70-', 'b908d30e', 164606, 169600, 14, '{150,9280,21410,36220,48575,62940,76970,88582,105647,117847,127127,139330,151812,166457}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '9pK3Eo7YF8qSiBlGg9D0l5sNuaU-', 'c008d40e', 252608, 169657, 14, '{150,9305,21420,36237,48587,62945,76977,88592,105660,117865,127147,139337,151820,163460}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'Nmu_OfWl7g83XbuXuosWZMZMEvc-', '8608370a', 35066, 157932, 10, '{182,14367,33090,47290,63412,77047,88985,117735,125570,146057}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '6bOGp3KERq1vhgKLLZreS.RMhGo-', '7b082e0a', 38029, 157223, 10, '{183,12103,31365,47415,63623,77168,87830,116693,124563,145245}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '2Mh4AS8DoNfkCsU04_YFk.kLtLI-', '7b082f0a', 339241, 157282, 10, '{150,12102,31362,47412,63620,77165,87827,116690,124560,145242}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '.0cCQpoefOzJUvLd79fwI7mObJY-', '7508240a', 314632, 156512, 10, '{187,12075,30995,47172,63430,76855,87480,116322,123955,144670}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'UktFGPE6.FpszCQhvf7DJHijYmg-', '8608360a', 127389, 157845, 10, '{150,14287,33007,47200,63327,76965,88900,117650,125485,145972}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'tHYfkdt32Wlxkp5n8Vik12AGa4M-', '8708370a', 258542, 157877, 10, '{182,14320,33040,47232,63360,76997,88932,117682,125517,146005}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'Vs9WHtem2u9Oo3Dmh0ccFeEEYQw-', '72082e0a', 85413, 157245, 10, '{150,12057,31025,46720,63580,77157,87825,116687,124570,143825}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '_nvx4zcP5SgeupDR.tKLEyTy5vg-', '7f082f0a', 194277, 157320, 10, '{187,12140,31400,47450,63657,77202,87865,116727,124597,145280}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', 'E65upMAlfpOT9WK2PAcs.TyvC.s-', '76082d0a', 141117, 157157, 10, '{150,12060,31320,47370,63577,77122,87785,116647,124517,145200}');
INSERT INTO cdtoc (created, discid, freedb_id, id, leadout_offset, track_count, track_offset) VALUES ('2011-01-18 15:21:33.71184+00', '_mIJp3ou5BAQ1GFOiu0hWuoz2mI-', '72081509', 248388, 155399, 9, '{150,19400,25900,41925,61925,81025,98775,116075,136675}');

INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (129807, 0, 68408, '2011-01-18 15:21:33.71184+00', 49161);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (129807, 0, 117662, '2011-01-18 15:21:33.71184+00', 123054);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (96188, 0, 40907, '2011-01-18 15:21:33.71184+00', 24752);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (114635, 0, 40908, '2011-01-18 15:21:33.71184+00', 24752);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (114635, 0, 187727, '2011-01-18 15:21:33.71184+00', 243064);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (96188, 0, 187728, '2011-01-18 15:21:33.71184+00', 243064);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (269350, 0, 189705, '2011-01-18 15:21:33.71184+00', 246898);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (281138, 0, 308418, '2011-01-18 15:21:33.71184+00', 446581);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (281139, 0, 320049, '2011-01-18 15:21:33.71184+00', 467794);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (77049, 0, 10359, '2011-01-18 15:21:33.71184+00', 4675);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (81302, 0, 10360, '2011-01-18 15:21:33.71184+00', 4675);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (133905, 0, 35235, '2011-01-18 15:21:33.71184+00', 19969);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (240446, 0, 35236, '2011-01-18 15:21:33.71184+00', 19969);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (322076, 0, 35237, '2011-01-18 15:21:33.71184+00', 19969);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (340280, 0, 35238, '2011-01-18 15:21:33.71184+00', 19969);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (344827, 0, 35239, '2011-01-18 15:21:33.71184+00', 19969);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (17, 0, 35240, '2011-01-18 15:21:33.71184+00', 19969);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (110729, 0, 35241, '2011-01-18 15:21:33.71184+00', 19969);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (133905, 0, 49901, '2011-01-18 15:21:33.71184+00', 31689);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (322076, 0, 49902, '2011-01-18 15:21:33.71184+00', 31689);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (240446, 0, 49903, '2011-01-18 15:21:33.71184+00', 31689);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (17, 0, 49904, '2011-01-18 15:21:33.71184+00', 31689);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (344827, 0, 49905, '2011-01-18 15:21:33.71184+00', 31689);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (340280, 0, 49906, '2011-01-18 15:21:33.71184+00', 31689);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (110729, 0, 49907, '2011-01-18 15:21:33.71184+00', 31689);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (17, 0, 49908, '2011-01-18 15:21:33.71184+00', 31690);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (344827, 0, 49909, '2011-01-18 15:21:33.71184+00', 31690);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (340280, 0, 49910, '2011-01-18 15:21:33.71184+00', 31690);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (322076, 0, 49911, '2011-01-18 15:21:33.71184+00', 31690);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (240446, 0, 49912, '2011-01-18 15:21:33.71184+00', 31690);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (133905, 0, 49913, '2011-01-18 15:21:33.71184+00', 31690);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (110729, 0, 49914, '2011-01-18 15:21:33.71184+00', 31690);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (133905, 0, 248696, '2011-01-18 15:21:33.71184+00', 338506);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (322076, 0, 248697, '2011-01-18 15:21:33.71184+00', 338506);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (110729, 0, 248698, '2011-01-18 15:21:33.71184+00', 338506);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (17, 0, 248699, '2011-01-18 15:21:33.71184+00', 338506);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (340280, 0, 248700, '2011-01-18 15:21:33.71184+00', 338506);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (344827, 0, 248701, '2011-01-18 15:21:33.71184+00', 338506);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (240446, 0, 248702, '2011-01-18 15:21:33.71184+00', 338506);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (240446, 0, 466320, '2011-01-18 15:21:33.71184+00', 748905);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (133905, 0, 466321, '2011-01-18 15:21:33.71184+00', 748905);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (322076, 0, 466322, '2011-01-18 15:21:33.71184+00', 748905);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (110729, 0, 466323, '2011-01-18 15:21:33.71184+00', 748905);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (17, 0, 466324, '2011-01-18 15:21:33.71184+00', 748905);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (340280, 0, 466325, '2011-01-18 15:21:33.71184+00', 748905);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (344827, 0, 466326, '2011-01-18 15:21:33.71184+00', 748905);
INSERT INTO medium_cdtoc (cdtoc, edits_pending, id, last_updated, medium) VALUES (248388, 0, 269967, '2011-01-18 15:21:33.71184+00', 375273);

-- Assorted

INSERT INTO edit (autoedit, close_time, editor, expire_time, id, language, open_time, quality, status, type) VALUES (0, NULL, 95821, '2013-04-16 17:42:38.063723+00', 1, NULL, '2013-04-02 17:42:38.063723+00', 1, 2, 314);
INSERT INTO edit_data (edit, data) VALUES (1, '{}');

INSERT INTO cover_art_archive.cover_art (comment, mime_type, date_uploaded, edit, edits_pending, id, ordering, release) VALUES ('', 'image/jpeg', '2012-05-24 07:35:13.984115+00', 1, 0, '1031598329', 1, 59662);

INSERT INTO cover_art_archive.cover_art_type (id, type_id) VALUES ('1031598329', 1);

-- Relationships

INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6101, 103);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6103, 102);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (1, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 12351, 149);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (1, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 12282, 148);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 12281, 141);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 12810, 132);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (1, NULL, NULL, 2007, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 1956, 60);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 34, 19);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 33, 34);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 63, 19);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, 2, 6, 2003, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 11764, 115);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 11714, 116);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, 1993, '2011-01-18 15:31:00.495651+00', NULL, NULL, 2001, '1', 11999, 121);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, 2001, '2011-05-16 15:03:23.368437+00', NULL, NULL, NULL, '0', 6490, 103);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22986, 180);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22988, 178);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22992, 173);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22998, 199);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23005, 185);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22987, 189);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22989, 179);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22994, 190);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22990, 183);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22993, 172);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 22991, 184);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, 20, 11, 2007, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23198, 183);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23007, 192);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23008, 174);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23004, 192);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 1123780, 168);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23805, 226);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23799, 231);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23865, 278);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, 2008, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6059, 69);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6067, 89);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6073, 90);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 4, 2);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6065, 76);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6064, 77);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6066, 79);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6077, 74);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6070, 78);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23758, 206);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 6012, 66);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23367, 200);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, 1965, '2011-01-18 15:31:00.495651+00', NULL, NULL, 1965, '1', 23622, 202);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, 1995, '2011-01-18 15:31:00.495651+00', NULL, NULL, 1998, '1', 23403, 200);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23775, 212);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23776, 216);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23777, 219);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23778, 217);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23781, 211);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23779, 215);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23782, 225);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23785, 210);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (0, NULL, NULL, NULL, '2011-01-18 15:31:00.495651+00', NULL, NULL, NULL, '0', 23780, 213);
INSERT INTO link (attribute_count, begin_date_day, begin_date_month, begin_date_year, created, end_date_day, end_date_month, end_date_year, ended, id, link_type) VALUES (1, NULL, NULL, NULL, '2011-05-16 15:03:23.368437+00', NULL, NULL, NULL, '0', 50, 30);

INSERT INTO link_attribute (attribute_type, created, link) VALUES (194, '2011-01-18 15:31:00.495651+00', 12351);
INSERT INTO link_attribute (attribute_type, created, link) VALUES (4, '2011-01-18 15:31:00.495651+00', 1956);
INSERT INTO link_attribute (attribute_type, created, link) VALUES (229, '2011-01-18 15:31:00.495651+00', 12282);
INSERT INTO link_attribute (attribute_type, created, link) VALUES (425, '2011-05-16 15:03:23.368437+00', 50);

INSERT INTO link_attribute_credit (link, attribute_type, credited_as) VALUES (12282, 229, 'crazy guitar');

INSERT INTO l_artist_artist (edits_pending, entity0, entity1, id, last_updated, link, entity0_credit, entity1_credit) VALUES (0, 398598, 398438, 45799, '2011-01-18 15:31:00.495651+00', 6101, '', '');
INSERT INTO l_artist_artist (edits_pending, entity0, entity1, id, last_updated, link, entity0_credit, entity1_credit) VALUES (0, 82524, 265420, 127517, '2011-05-16 15:03:23.368437+00', 6490, 'Maki Goto', '7nin Matsuri');

INSERT INTO l_artist_label (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 398438, 3933, 201, '2011-01-18 15:31:00.495651+00', 11764);
INSERT INTO l_artist_label (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 2988, 2893, '2011-01-18 15:31:00.495651+00', 11714);

INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 9496, 4525123, 6751, '2011-01-18 15:56:00.408782+00', 12351);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 135345, 4525123, 508792, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 135345, 4525123, 508809, '2011-01-18 15:56:00.408782+00', 12810);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542682, 515098, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542683, 515099, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542684, 515100, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542685, 515101, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542686, 515102, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542687, 515103, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542688, 515104, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542689, 515105, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542690, 515106, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 1542691, 515107, '2011-01-18 15:56:00.408782+00', 12281);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 283833, 2726274, 515108, '2011-01-18 15:56:00.408782+00', 12282);
INSERT INTO l_artist_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 398598, 449989, 515109, '2011-01-18 15:56:00.408782+00', 12282);

INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 398598, 459740, 79005, '2011-01-18 15:52:02.917556+00', 1956);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 24752, 219815, '2011-01-18 15:52:02.917556+00', 34);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 243064, 219813, '2011-01-18 15:52:02.917556+00', 34);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 11545, 654729, 219814, '2011-01-18 15:52:02.917556+00', 34);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 19969, 210524, '2011-01-18 15:52:02.917556+00', 33);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 31689, 210527, '2011-01-18 15:52:02.917556+00', 33);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 31690, 210523, '2011-01-18 15:52:02.917556+00', 33);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 278075, 210522, '2011-01-18 15:52:02.917556+00', 33);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 338506, 210525, '2011-01-18 15:52:02.917556+00', 33);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 748905, 210526, '2011-01-18 15:52:02.917556+00', 33);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 19969, 212053, '2011-01-18 15:52:02.917556+00', 63);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 31689, 212056, '2011-01-18 15:52:02.917556+00', 63);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 31690, 212052, '2011-01-18 15:52:02.917556+00', 63);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 278075, 212051, '2011-01-18 15:52:02.917556+00', 63);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 338506, 212054, '2011-01-18 15:52:02.917556+00', 63);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 242, 748905, 212055, '2011-01-18 15:52:02.917556+00', 63);
INSERT INTO l_artist_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 664994, 558940, 303073, '2011-05-16 15:59:00.785958+00', 50);

INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 398598, 788382, 293369, '2011-01-18 16:23:37.789736+00', 22986);
INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 398598, 788379, 293371, '2011-01-18 16:23:37.789736+00', 22988);
INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 398598, 788384, 293368, '2011-01-18 16:23:37.789736+00', 22992);
INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 398598, 788381, 293370, '2011-01-18 16:23:37.789736+00', 22998);
INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 398598, 788385, 293367, '2011-01-18 16:23:37.789736+00', 23005);
INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 283833, 24048, 201534, '2011-01-18 16:23:37.789736+00', 22990);
INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 427385, 181389, 69567, '2011-01-18 16:23:37.789736+00', 22986);
INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 427385, 670179, 36743, '2011-01-18 16:23:37.789736+00', 22987);
INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 427385, 670181, 37052, '2011-01-18 16:23:37.789736+00', 22989);
INSERT INTO l_artist_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 427385, 670180, 36870, '2011-01-18 16:23:37.789736+00', 22998);

INSERT INTO l_artist_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 427385, 7905446, 1117124, '2013-04-02 17:42:38.063723+00', 1123780);
INSERT INTO l_artist_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 305, 2726288, 1117125, '2013-04-02 17:42:38.063723+00', 1123780);

INSERT INTO l_recording_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 4223059, 4223061, 37160, '2011-01-18 15:56:00.408782+00', 23805);

INSERT INTO l_recording_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 7905440, 459740, 1, '2011-01-18 15:56:00.408782+00', 6059);

INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 7905446, 7905446, 43140, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 4223061, 4223059, 60649, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542682, 1542682, 239469, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542684, 1542684, 76476, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 7905443, 7905443, 186752, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 7905441, 7905441, 263470, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542685, 1542685, 145893, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3622825, 3622825, 73089, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1307406, 1307406, 107026, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3451975, 3451975, 257745, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3622823, 3622823, 41700, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542691, 1542691, 116653, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 4223059, 4223059, 83730, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542690, 1542690, 35331, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 7905439, 7905439, 123565, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 7905445, 7905445, 248093, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542688, 1542688, 169875, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 4525123, 4525123, 186192, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2726271, 2726271, 145497, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3622831, 3622831, 255365, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 4844122, 1353887, 102645, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3451976, 3451976, 126513, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 7905442, 7905442, 56348, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3622828, 3622828, 71959, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1353886, 1353886, 256888, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3584195, 3584195, 163067, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2726278, 2726278, 226592, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2726280, 2726280, 242615, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542686, 1542686, 274154, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2726276, 2726276, 255756, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1062699, 203492, 223131, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542683, 1542683, 120208, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3622826, 3622826, 51390, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 7905440, 7905440, 102181, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2726272, 2726272, 53184, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3622830, 3622830, 30381, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3622827, 3622827, 243421, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542687, 1542687, 151402, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2726281, 2726281, 251750, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1542689, 1542689, 60385, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 4844121, 203493, 208511, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 4223060, 4223060, 172361, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2726274, 2726274, 228828, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 4844123, 1353888, 218392, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3622822, 3622822, 2172, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3584196, 3584196, 249614, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 3584196, 3622832, 99903, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2726275, 211564, 8120, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2726277, 2726277, 230405, '2011-01-18 16:15:33.876477+00', 23865);
INSERT INTO l_recording_work (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 14488617, 2726288, 230406, '2011-01-18 16:15:33.876477+00', 23865);

INSERT INTO l_release_group_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 403214, 615313, 4356, '2011-01-18 16:23:37.789736+00', 6067);
INSERT INTO l_release_group_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 403214, 615327, 4613, '2011-01-18 16:23:37.789736+00', 6067);

INSERT INTO l_release_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 49161, 123054, 4671, '2011-01-18 15:52:02.917556+00', 4);
INSERT INTO l_release_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 558940, 4675, 23136, '2011-01-18 15:52:02.917556+00', 4);
INSERT INTO l_release_release (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 59312, 4675, 23137, '2011-01-18 15:52:02.917556+00', 4);

INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 446581, 748185, 227728, '2011-01-18 16:23:37.789736+00', 6064);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 24752, 151497, 308465, '2011-01-18 16:23:37.789736+00', 6065);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 24752, 177282, 248391, '2011-01-18 16:23:37.789736+00', 6065);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 24752, 366634, 367276, '2011-01-18 16:23:37.789736+00', 6064);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 24752, 697220, 412426, '2011-01-18 16:23:37.789736+00', 6065);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 4675, 80267, 495908, '2011-01-18 16:23:37.789736+00', 6064);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 59662, 573314, 22747, '2011-01-18 16:23:37.789736+00', 6064);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 49161, 71412, 15028, '2011-01-18 16:23:37.789736+00', 6064);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 243064, 151497, 308463, '2011-01-18 16:23:37.789736+00', 6065);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 243064, 177282, 248389, '2011-01-18 16:23:37.789736+00', 6065);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 243064, 366634, 367275, '2011-01-18 16:23:37.789736+00', 6064);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 243064, 697220, 412424, '2011-01-18 16:23:37.789736+00', 6065);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 654729, 151497, 308464, '2011-01-18 16:23:37.789736+00', 6065);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 654729, 177282, 248390, '2011-01-18 16:23:37.789736+00', 6065);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 654729, 697220, 412425, '2011-01-18 16:23:37.789736+00', 6065);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 558940, 80267, 124990, '2011-01-18 16:23:37.789736+00', 6064);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 246898, 197281, 175461, '2011-01-18 16:23:37.789736+00', 6064);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 123054, 71412, 492344, '2011-01-18 16:23:37.789736+00', 6064);
INSERT INTO l_release_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 459740, 485359, 75581, '2011-01-18 16:23:37.789736+00', 6064);

INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 1062699, 989, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 1353886, 288, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 2726271, 993, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 2726272, 983, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 2726274, 985, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 2726275, 43, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 2726276, 995, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 2726277, 987, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 2726278, 1001, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 2726280, 1003, '2011-01-18 15:56:00.408782+00', 23758);
INSERT INTO l_label_recording (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 36456, 2726281, 991, '2011-01-18 15:56:00.408782+00', 23758);

INSERT INTO l_label_label (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 33, 839, 3252, '2011-01-18 15:31:00.495651+00', 23367);
INSERT INTO l_label_label (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1949, 3545, 2182, '2011-01-18 15:31:00.495651+00', 23367);
INSERT INTO l_label_label (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 15288, 2333, 2818, '2011-01-18 15:31:00.495651+00', 23622);
INSERT INTO l_label_label (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 95, 132, 340, '2011-01-18 15:31:00.495651+00', 23403);
INSERT INTO l_label_label (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 95, 9632, 999, '2011-01-18 15:31:00.495651+00', 23367);
INSERT INTO l_label_label (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 95, 2988, 2484, '2011-01-18 15:31:00.495651+00', 23367);

INSERT INTO l_label_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1949, 447791, 6505, '2011-01-18 16:23:37.789736+00', 23776);
INSERT INTO l_label_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1949, 192299, 19632, '2011-01-18 16:23:37.789736+00', 23777);
INSERT INTO l_label_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1949, 192298, 19631, '2011-01-18 16:23:37.789736+00', 23778);
INSERT INTO l_label_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 1949, 447790, 25391, '2011-01-18 16:23:37.789736+00', 23779);
INSERT INTO l_label_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2882, 194973, 15099, '2011-01-18 16:23:37.789736+00', 23776);
INSERT INTO l_label_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2882, 194976, 15096, '2011-01-18 16:23:37.789736+00', 23776);
INSERT INTO l_label_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2882, 445083, 13458, '2011-01-18 16:23:37.789736+00', 23777);
INSERT INTO l_label_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2882, 194975, 15097, '2011-01-18 16:23:37.789736+00', 23778);
INSERT INTO l_label_url (edits_pending, entity0, entity1, id, last_updated, link) VALUES (0, 2988, 195251, 21646, '2011-01-18 16:23:37.789736+00', 23776);

INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (1, 'cc8cd8ee-6477-47d5-a16d-adac11ed9f30', 95821, 'public area collection', TRUE, '', 7);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (2, '9ece2fbd-3f4e-431d-9424-da8af38374e0', 95821, 'private area collection', FALSE, '', 7);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (3, '9c782444-f9f4-4a4f-93cb-92d132c79887', 95821, 'public artist collection', TRUE, '', 8);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (4, '5f0831af-c84c-44a3-849d-abdf0a18cdd9', 95821, 'private artist collection', FALSE, '', 8);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (5, '05febe0a-a9df-414a-a2c9-7dc366b0de9b', 95821, 'public event collection', TRUE, '', 4);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (6, '13b1d199-a79e-40fe-bd7c-0ecc3ca52d73', 95821, 'private event collection', FALSE, '', 4);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (7, '7749c811-d77c-4ea5-9a9e-e2a4e7ae0d1f', 95821, 'public instrument collection', TRUE, '', 9);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (8, 'cdef54c4-2798-4d39-a0c9-5074191f9b6e', 95821, 'private instrument collection', FALSE, '', 9);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (9, 'd8c9f799-9255-45ca-93fa-88f7c438d0d8', 95821, 'public label collection', TRUE, '', 10);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (10, 'b0f57375-7009-47ab-a631-469aaba34885', 95821, 'private label collection', FALSE, '', 10);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (11, 'e6fac30e-28c9-46ed-9cbc-5aabce8170e8', 95821, 'public place collection', TRUE, '', 11);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (12, '65e18c7a-0958-4066-9c3e-7c1474c623d1', 95821, 'private place collection', FALSE, '', 11);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (13, '38a6a0ec-f4a9-4424-80fd-bd4f9eb2e880', 95821, 'public recording collection', TRUE, '', 12);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (14, 'b5486110-906e-4c0c-a6e6-e16baf4e18e2', 95821, 'private recording collection', FALSE, '', 12);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (15, 'dd07ea8b-0ec3-4b2d-85cf-80e523de4902', 95821, 'public release collection', TRUE, '', 1);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (16, '1d1e41eb-20a2-4545-b4a7-d76e53d6f2f5', 95821, 'private release collection', FALSE, '', 1);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (17, 'dadae81b-ff9e-464e-8c38-51156557bc36', 95821, 'public release group collection', TRUE, '', 13);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (18, 'b0f09ccf-a777-4c17-a917-28e01b0e66a3', 95821, 'private release group collection', FALSE, '', 13);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (19, '5adf966d-d82f-4ae9-a9a3-e5e187ed2c34', 95821, 'public series collection', TRUE, '', 14);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (20, '870dbdcf-e047-4da5-9c80-c39e964da96f', 95821, 'private series collection', FALSE, '', 14);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (21, '3529acda-c0c1-4b13-9761-a4a8dedb64be', 95821, 'public work collection', TRUE, '', 15);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (22, 'b69030b0-911e-4f7d-aa59-c488b2c8fe8e', 95821, 'private work collection', FALSE, '', 15);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (23, '7749c811-d77c-4ea5-9a9e-e2a4e7ae0d1a', 95821, 'public genre collection', TRUE, '', 16);
INSERT INTO editor_collection (id, gid, editor, name, public, description, type) VALUES (24, '7749c811-d77c-4ea5-9a9e-e2a4e7ae0d1b', 95821, 'private genre collection',FALSE, '', 16);

INSERT INTO editor_collection_area (collection, area) VALUES (1, 13);
INSERT INTO editor_collection_area (collection, area) VALUES (2, 81);
INSERT INTO editor_collection_artist (collection, artist) VALUES (3, 9496);
INSERT INTO editor_collection_artist (collection, artist) VALUES (4, 135345);
INSERT INTO editor_collection_event (collection, event) VALUES (5, 7);
INSERT INTO editor_collection_event (collection, event) VALUES (6, 8);
INSERT INTO editor_collection_genre (collection, genre) VALUES (23, 3);
INSERT INTO editor_collection_genre (collection, genre) VALUES (24, 3);
INSERT INTO editor_collection_instrument (collection, instrument) VALUES (7, 7);
INSERT INTO editor_collection_instrument (collection, instrument) VALUES (8, 7);
INSERT INTO editor_collection_label (collection, label) VALUES (9, 8092);
INSERT INTO editor_collection_label (collection, label) VALUES (10, 395);
INSERT INTO editor_collection_place (collection, place) VALUES (11, 1);
INSERT INTO editor_collection_place (collection, place) VALUES (12, 1);
INSERT INTO editor_collection_recording (collection, recording) VALUES (13, 1542682);
INSERT INTO editor_collection_recording (collection, recording) VALUES (14, 1542683);
INSERT INTO editor_collection_release (collection, release) VALUES (15, 49161);
INSERT INTO editor_collection_release (collection, release) VALUES (16, 123054);
INSERT INTO editor_collection_release_group (collection, release_group) VALUES (17, 377462);
INSERT INTO editor_collection_release_group (collection, release_group) VALUES (18, 155364);
INSERT INTO editor_collection_series (collection, series) VALUES (19, 25);
INSERT INTO editor_collection_series (collection, series) VALUES (20, 25);
INSERT INTO editor_collection_work (collection, work) VALUES (21, 12488154);
INSERT INTO editor_collection_work (collection, work) VALUES (22, 12488155);

UPDATE medium
SET track_count = tc.count
FROM (SELECT count(id),medium FROM track GROUP BY medium) tc
WHERE tc.medium = medium.id;

-- Restore triggers.
CREATE TRIGGER deny_deprecated BEFORE UPDATE OR INSERT ON link
    FOR EACH ROW EXECUTE PROCEDURE deny_deprecated_links();
