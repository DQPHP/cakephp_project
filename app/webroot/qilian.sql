/*
 Navicat MySQL Data Transfer

 Source Server         : vagrant
 Source Server Version : 50542
 Source Host           : 192.168.33.10
 Source Database       : qilian

 Target Server Version : 50542
 File Encoding         : utf-8

 Date: 05/28/2015 22:40:32 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `appointments`
-- ----------------------------
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(8) NOT NULL,
  `student_id` int(8) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `appointments`
-- ----------------------------
BEGIN;
INSERT INTO `appointments` VALUES ('1', '1', '1', '2015-04-04 10:00:00', '2015-04-04 12:00:00', '已经报名能源企业，希望可以多了解相关的企业信息。', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '1', '11', '2015-05-26 16:52:00', '2015-05-26 16:52:00', 'dfasdfas\r\nasdf\r\n\r\nasdf', '2015-05-25 17:08:10', '2015-05-25 17:08:59');
COMMIT;

-- ----------------------------
--  Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `categories`
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES ('1', '七联专栏'), ('2', '七联活动'), ('3', '课程'), ('4', '企业招聘'), ('5', '七联就职'), ('6', '学员心得');
COMMIT;

-- ----------------------------
--  Table structure for `courses`
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `description` text NOT NULL COMMENT '课程简介',
  `content` text NOT NULL COMMENT '课程大纲',
  `tota_attendee` int(8) NOT NULL,
  `curr_attendee` int(8) NOT NULL,
  `price` varchar(255) NOT NULL,
  `price_detail` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `courses`
-- ----------------------------
BEGIN;
INSERT INTO `courses` VALUES ('1', '1', '自己分析 & ES对策', 'ff1ca26a0399beaa6a8e7018660c4655.png', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-04 10:00:00', '2015-04-04 12:00:00', 'Rob老师带领你开始准备敲开理想公司的大门。平凡？NO！引导性的自己分析帮助你发现，挖掘自己的闪光点；俯瞰各个行业的发展概况，帮助你做到心中有数；ES经验谈让你的ES不再千篇一律。或者你有疑问？过来答疑！', '课程大纲', '30', '0', '', '', '0000-00-00 00:00:00', '2015-05-26 10:38:45'), ('2', '4', 'IT业界研究', 'ff1ca26a0399beaa6a8e7018660c4655.png', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-11 10:00:00', '2015-04-11 12:00:00', '向往最cool，最geek的IT职业？从日本到世界，从现在到未来，Kuma老师为你诠释IT技术者要如何顺应瞬息万变的技术变革，站在未来世界的风口浪尖。\r\n\r\n向往最cool，最geek的IT职业？从日本到世界，从现在到未来，Kuma老师为你诠释IT技术者要如何顺应瞬息万变的技术变革，站在未来世界的风口浪尖。\r\n\r\n向往最cool，最geek的IT职业？从日本到世界，从现在到未来，Kuma老师为你诠释IT技术者要如何顺应瞬息万变的技术变革，站在未来世界的风口浪尖。\r\n\r\n向往最cool，最geek的IT职业？从日本到世界，从现在到未来，Kuma老师为你诠释IT技术者要如何顺应瞬息万变的技术变革，站在未来世界的风口浪尖。', '向往最cool，最geek的IT职业？从日本到世界，从现在到未来，Kuma老师为你诠释IT技术者要如何顺应瞬息万变的技术变革，站在未来世界的风口浪尖。\r\n向往最cool，最geek的IT职业？从日本到世界，从现在到未来，Kuma老师为你诠释IT技术者要如何顺应瞬息万变的技术变革，站在未来世界的风口浪尖。\r\n向往最cool，最geek的IT职业？从日本到世界，从现在到未来，Kuma老师为你诠释IT技术者要如何顺应瞬息万变的技术变革，站在未来世界的风口浪尖。\r\n\r\n向往最cool，最geek的IT职业？从日本到世界，从现在到未来，Kuma老师为你诠释IT技术者要如何顺应瞬息万变的技术变革，站在未来世界的风口浪尖。', '30', '0', '1300', '每课时1300日元。\r\naasdfasdfasdf\r\n\r\n\r\nasdfasd\r\n\r\nasdf\r\n\r\n', '0000-00-00 00:00:00', '2015-05-26 13:25:29'), ('3', '1', '金融・保险・证券业界分析', 'ff1ca26a0399beaa6a8e7018660c4655.png', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-12 10:00:00', '2015-04-12 12:00:00', '想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n\r\n想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n\r\n想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n', '想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n\r\n想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！\r\n', '30', '0', '', '', '0000-00-00 00:00:00', '2015-05-26 13:17:19'), ('4', '1', '自己分析 & ES对策', 'ff1ca26a0399beaa6a8e7018660c4655.png', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-18 10:00:00', '2015-04-18 12:00:00', '往往简简单单的自我分析被视为整个就职过程中最为重要的一部分，而它却是最容易被忽视的一部分。这堂课就是让看似理所应当的自己，赤裸裸的浮现在自己的眼前吧。不仅如此，业界研究概论能让你对所以业界有着一览众山小的感觉。', '', '30', '0', '', '', '0000-00-00 00:00:00', '2015-05-26 10:41:05'), ('5', '4', 'IT业界分析', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-25 10:00:00', '2015-04-25 12:00:00', 'IT是世界的大势所趋，从日本到世界，告诉你如何站在未来世界的风头浪尖。\n金融-保险-证券业界分析    金融？商社？呵呵！讲述这两个行业赤裸裸的背后故事。\n个人模拟面试    主要讲面试常问问题和对策。vivian以上百场面试的丰富经验为大家详解面试官的心理，以及如何回答的意料之外情理之中。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', '1', '金融・保险・证券业界分析 ', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-26 10:00:00', '2015-04-26 12:00:00', '想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', '3', 'Maker(B2C) 业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-11 13:00:00', '2015-04-11 15:00:00', '从社风、待遇、上升性等方面，集中分析外国社员较多的50+制造类企业，以企业优缺点着眼，确定最适合你的应募名单。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', '5', '商社业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-12 13:00:00', '2015-04-12 15:00:00', '想进入商社，锻炼自己成为明日商界耀眼的星星？Mimi老师帮助你掌握要领，将你的热情，你的抱负表现得淋漓尽致！', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', '3', 'WebTest对策', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-18 13:00:00', '2015-04-18 15:00:00', '想进入商社，锻炼自己成为明日商界耀眼的星星？Mimi老师帮助你掌握要领，将你的热情，你的抱负表现得淋漓尽致！', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', '3', 'Maker(B2C)业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-25 13:00:00', '2015-04-26 15:00:00', '想进入最有实力的全球化制造业公司？Johnny老师帮助你从社风，事业内容，发展性，待遇等多方面综合分析TOP 50＋家公司，着眼各企业优缺点，一同参谋确定最适合你的应聘名单。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('11', '5', '商社业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-26 13:00:00', '2015-04-26 15:00:00', '想进入商社，锻炼自己成为明日商界耀眼的星星？Mimi老师帮助你掌握要领，将你的热情，你的抱负表现得淋漓尽致！', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('12', '3', 'Maker(B2B)业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-11 15:10:00', '2015-04-11 17:10:00', '想进入最有实力的全球化制造业公司？Johnny老师帮助你从社风，事业内容，发展性，待遇等多方面综合分析TOP 50＋家公司，着眼各企业优缺点，一同参谋确定最适合你的应聘名单。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('13', '2', '咨询业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-12 15:10:00', '2015-04-12 17:10:00', '资质？要求什么样的能力？Vivian老师洞悉业界常情，帮助你深入了解咨询，分析常见面试问题，更有效地锻炼和表现出自己的能力。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('14', '3', 'Maker(B2B)业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-25 15:10:00', '2015-04-25 17:10:00', '想进入最有实力的全球化制造业公司？Johnny老师帮助你从社风，事业内容，发展性，待遇等多方面综合分析TOP 50＋家公司，着眼各企业优缺点，一同参谋确定最适合你的应聘名单。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('15', '2', '咨询业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-04-26 15:10:00', '2015-04-26 17:10:00', '资质？要求什么样的能力？Vivian老师洞悉业界常情，帮助你深入了解咨询，分析常见面试问题，更有效地锻炼和表现出自己的能力。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('16', '4', 'IT业界分析', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-09 10:00:00', '2015-05-09 12:00:00', 'IT是世界的大势所趋，从日本到世界，告诉你如何站在未来世界的风头浪尖。\n金融-保险-证券业界分析    金融？商社？呵呵！讲述这两个行业赤裸裸的背后故事。\n个人模拟面试    主要讲面试常问问题和对策。vivian以上百场面试的丰富经验为大家详解面试官的心理，以及如何回答的意料之外情理之中。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('17', '1', '金融・保险・证券业界分析 ', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-10 10:00:00', '2015-05-10 12:00:00', '想实现自我突破？高大上的职业不再遥遥不可及！Rob老师帮助你拨开疑云，更多地了解这个行业。相信自己，一切皆有可能！', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('18', '3', 'GD面试对策', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-16 10:00:00', '2015-05-16 12:00:00', '分析group discussion的流程及角色定位，传授以“起，承，转，结，点”策略，帮助你在任何场合下依旧可以游刃有余，更好地表现出自己的能力。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('19', '2', '个人面试对策', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-23 10:00:00', '2015-05-23 12:00:00', 'Practise！Practise！Practise！2对1的形式真实再现面试场景，老师们帮助你更准确的理解面试问题，更简洁更有逻辑性地组织自己的回答，吸引面试官的注意。相信面试不再是如坐针毡的煎熬，把握机会，更深入的了解企业，了解自己。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('20', '3', 'Maker(B2C)业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-09 13:00:00', '2015-05-09 15:00:00', '想进入最有实力的全球化制造业公司？Johnny老师帮助你从社风，事业内容，发展性，待遇等多方面综合分析TOP 50＋家公司，着眼各企业优缺点，一同参谋确定最适合你的应聘名单。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('21', '5', '商社业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-10 13:00:00', '2015-05-10 15:00:00', '想进入商社，锻炼自己成为明日商界耀眼的星星？Mimi老师帮助你掌握要领，将你的热情，你的抱负表现得淋漓尽致！', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('22', '8', 'GD模拟面试', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-16 13:00:00', '2015-05-16 15:00:00', '分析group discussion的流程及角色定位，传授以“起，承，转，结，点”策略，帮助你在任何场合下依旧可以游刃有余，更好地表现出自己的能力。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('23', '8', '个人模拟面试', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-23 13:00:00', '2015-05-23 15:00:00', 'Practise！Practise！Practise！2对1的形式真实再现面试场景，老师们帮助你更准确的理解面试问题，更简洁更有逻辑性地组织自己的回答，吸引面试官的注意。相信面试不再是如坐针毡的煎熬，把握机会，更深入的了解企业，了解自己。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('24', '3', 'Maker(B2B)业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-09 15:10:00', '2015-05-09 17:10:00', '想进入最有实力的全球化制造业公司？Johnny老师帮助你从社风，事业内容，发展性，待遇等多方面综合分析TOP 50＋家公司，着眼各企业优缺点，一同参谋确定最适合你的应聘名单。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('25', '2', '咨询业界研究', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-10 15:10:00', '2015-05-10 17:10:00', '资质？要求什么样的能力？Vivian老师洞悉业界常情，帮助你深入了解咨询，分析常见面试问题，更有效地锻炼和表现出自己的能力。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('26', '8', 'GD模拟面试', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-16 15:10:00', '2015-05-16 17:10:00', '分析group discussion的流程及角色定位，传授以“起，承，转，结，点”策略，帮助你在任何场合下依旧可以游刃有余，更好地表现出自己的能力。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('27', '8', '个人模拟面试', '', '〒101-0024 東京都千代田区神田和泉1-11-17 プラントビル2階', '2015-05-23 15:10:00', '2015-05-23 17:10:00', 'Practise！Practise！Practise！2对1的形式真实再现面试场景，老师们帮助你更准确的理解面试问题，更简洁更有逻辑性地组织自己的回答，吸引面试官的注意。相信面试不再是如坐针毡的煎熬，把握机会，更深入的了解企业，了解自己。', '', '30', '0', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `entries`
-- ----------------------------
DROP TABLE IF EXISTS `entries`;
CREATE TABLE `entries` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `student_id` int(8) NOT NULL,
  `course_id` int(8) NOT NULL,
  `note` text NOT NULL,
  `status` int(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `entries`
-- ----------------------------
BEGIN;
INSERT INTO `entries` VALUES ('1', '1', '1', '', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '1', '3', '', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', '11', '0', 'testnoet', '0', '2015-05-25 17:01:24', '2015-05-25 17:01:24');
COMMIT;

-- ----------------------------
--  Table structure for `images`
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `post_id` int(8) NOT NULL,
  `url` text NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `category_id` int(8) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `author` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `posts`
-- ----------------------------
BEGIN;
INSERT INTO `posts` VALUES ('1', '1', '【七联・肉包专栏】第四十六期：一周日经小结 ', '\n#【七联・肉包专栏】第四十六期：一周日经小结\n肉包最近一直在乡下学习。虽然是乡下，但是学的知识却是世界先进水平的，所以感觉自己的知识领域又变得广了许多。即使是一天只睡5个小时，也是开开心心的战斗到夜晚。\n\n对于知识的理解，肉包也并不是有百分之百的信心。但是请大家不要放弃对于知识的追求，对于工作的追求。因为有追求，才会有动力，有所成长。\n为了理解日本的公司在干什么，肉包必须说我们应该先理解日本的经济大环境是什么，以及世界的经济大环境是什么。看清了森林的春夏秋冬，才能大致掌握树木的情况。所以对新手来说，比起查些微观的企业，理解宏观经济更容易也更重要。\n\n那就来说说本周日本的三大主题：**电力**，**投信**，**AIIB**。\n\n## 电力\n关于电力的新闻其实上周在能源部分当中也是有所提到的。而这周新闻的重点在于两部分，关西电力的高浜原子能发电站和东西电力融通。\n\n肉包在上个礼拜已经提到过，日本准备在未来实行分散能源政策降低核电站的利用，并且增加再生能源发电的利用。而这次高浜原子能发电站的停止运行也说明了日本的民众对于原子能发电站的抵触感。这不仅导致了经营者关西电力的费用变高利益减少，对于日本政府能否实现分散能源政策更是打上了一个大大的问号。\n\n关于东西电力融通的新闻，主要是讲原本分开的东西电力系统，经过融通之后可以互相利用。这一措施主要是针对两点：\n1）当地震发生的时候，西日本和东日本的电力可以交换来支援对方。\n2）电力自由化，东西电力融通将会在未来变成一个附加价值。\n\n## 信托\n信托也是本周一个比较重要的主题。其原因肉包认为有2个：\n- 日本的信托市场在慢慢变大，已经成长到了资产97兆日元。对于长期生活在间接金融世界当中的日本民众来说已经是非常不容易的事情了。所以对于我们来说也不得不关注这个市场。\n\n- 信托的特性其实是非常适合日本的国民性的。总的来说有3个优点，分散投资，小额投资，专业人员运用。每一点其实都是为了日本人而设计的。所以对于信托银行或者资产运用的公司来说，信托在未来的日本绝对会是一个非常有吸引力的商品。\n\n## AIIB\n最后一个关键的主题就是我们祖国引导的AIIB。肉包相信不用解释AIIB的全称是什么，具体是干什么的。肉包只想告诉大家，未来在考虑逆问题的时候，可以适当想想这个大环境是什么，这个公司在这个环境下能干些什么。而这次AIIB的突然崛起必定是对这个大环境有重要影响的。\n \n当然AIIB有其自己的特征，比如它是由中国组织创立的，而且是对于亚洲发展中国家的基础设备等部分的投资。其主要目的是来挑战美国的世界霸主地位。而日本作为美国的小弟只能跟着美国走，这其实是非常辛苦的。当然AIIB未来的构造图和审核基准能够更加清晰的话，相信参加的国家也会变得更多。\n\n大家已经陆陆续续开始面试了吧。如果有什么疑问的话，可以随时来找七联的工作人员。相信会给出最适合大家的答复。\n\n##关注肉包专栏，关注七联就职。', '2015-04-10 10:00:00', 'Rob', 'http://qilian.jp/img/rob.png', 'http://qilian.jp/blog/2015/04/10/rob_column_46/'), ('2', '1', '【七联・肉包专栏】第四十五期：好久不见 ', '# 【七联・肉包专栏】第四十五期：好久不见\n\n     \n  大家好久不见，终于等到了礼拜五肉包专栏的时候了。最近肉包每天都过着早上5点起，晚上12点睡的日子。即使是这样，肉包也觉得这些苦都是值得的。因为我们是拿着工资进化自己，这是多么美好的事情。\n  \n  这一周的日经新闻的主题主要有以下几个，**能源**，**地方银行**，**金融政策**和**物流**。\n  \n## 能源  \n   能源的主题肉包就不再多说了，主要分石油和电力。需要关注的新闻是壳牌的收购事件和日本未来发电构成的分析。壳牌购买了英国的BG集团为了巩固自己在世界市场石油的地位，从这则新闻可以看出日本的石油企业是多么的弱小，虽然某些公司在日本国内可以当大老虎，但拿到世界一比也就是一只小猫咪而已。石油这种企业还是要靠规模的。\n   \n  日本发电构成的分析其实就是讲日本政府未来准备延长对核电站的使用，并且扩大再生环保能源的利用。这对于那些将再生能源投入较大的公司来说是一个福音。而且日本的企业对于这个方面是有很强大的技术力量支撑的，未来形势一片大好。\n  \n## 地方银行  \n第二个行业是关于地方银行。这个话题其实已经风靡很久了，就是各大地方银行积极合作合并事业规模。这是一个必然的话题，因为像银行这种企业，谁的规模大，路子多，顾客就会选择用谁。虽然地方银行不是特别需要留学生，但是对于想要就职的同学还是需要知道整个金融界在发生什么的。\n\n## 金融政策 \n第三个主题是日本的金融政策。我希望每个同学都知道黑田总裁现在在干什么。黑田先生在上任日本银行总裁之后主要是两个目标，一个是物价上升2%，一个是通货量翻倍。其实第2个很简单，就是印钞票就行了，难的是物价上升2%。\n\n为什么说物价上升比较难呢，其实理由也很简单，就是因为石油变得便宜，导致进口原材料的费用降低，从而使原本期待上涨的物价迟迟没有上涨。但是肉包佩服甚至坚信总有一天物价会上涨的原因是，即使在如此恶劣的条件下，日本的物价没有降低。这其实就是说明日本的经济现在恢复的很健康。肉包大胆预测，一旦石油价格恢复，日本的物价就 会上涨。前提是日本经济撑到那一天，安倍首相赢得自民党总裁选举。\n\n## 物流\n第四个主题是关于物流的。劳森和佐川合作增强产业的物流网络。乐天和日本邮政合作在邮局开设储蓄所，为的是方便大家收取自己在网上购物的商品。而关于德意志邮政的新闻也说明了，世界第一是如何开展自己的事业，如何从国有企业转成成为一个世界第一的物流私营企业。这些都是对于日本的经济有建设性的建议的。因为日本邮政要上市了，而且政府卖的价钱肯定是要刷新国有企业私营化记录的。\n\n说了很多关于这周日本经济的主要话题。其实很多同学都发现这些内容或多或少在专栏当中被提到，这也说明新闻不是一下子就爆发出来的，而是慢慢积累起来，最后变成经济上的主角的。日本经济是这样，08年的金融危机也是这样，就职活动更是这样。\n\n一切都是靠着积累。经验多了，对策也多了。自然而然，大家就会找到自己的路，前往内定的道路。\n\n\n## 关注肉包专栏！关注七联就职！', '2015-04-09 10:00:00', 'Rob', 'http://qilian.jp/img/rob.png', 'http://qilian.jp/blog/2015/04/09/rob_column_45/'), ('3', '1', '【七联・肉包专栏】第四十四期：日本的电力现状 ', '#【七联・肉包专栏】第四十四期：日本的电力现状\n\n今天的日经头条讲的是日本将在福井县开展**核电站的废炉**的整理工作。这必然是一件非常漫长和严谨的工作，因为其处理的对象是核电站。即使这些核电站已经停止工作，迈入废弃的行列当中，但如何处理这些留在炉里的高危险物质其实是需要非常谨慎的。\n\n三菱重工将和欧美对于处理此类核电站有过经验的企业合作一起来开展此项工作。其中也包括了东芝旗下的一家美国公司。所以找工作的大家千万不要以为东芝就只做美容产品和电饭煲，它还做其他很多基础设施的项目，其中最厉害的应该就是关于核反应堆的了。\n\n肉包不禁感叹一个地震给日本造成的伤害是多么的可拍。对于日本这个没有任何资源，任何能源的国家来说，核电站的停运对于这个国家的用电供应是影响之大。\n\n如果用火来代替的话，那么碳石的进口负担将大大增加，电费也将步步攀升。\n\n如果是用水来代替的话，对于日本这个平均海拔不是很高的国家来说，找一个像三峡那样的得天独厚的地形的水力发电站的概率是微乎极微的。\n\n如果是生物或者地热的来代替的话，其产量还远远不够。\n\n现在日本终于准备在海上造**风力发电站**来减小用电的负担。就在今天日立制造所宣布在茨城建造全日本最大的风力发电站来用于商用发电。大家注意到了没？又是**日立**！肉包专栏40多期以来日立是出现最多的企业。这家企业真是日本基础设施设备的顶梁企业！\n\n总而言之，日本的电力状况因为防范核泄漏导致了现在很多电力公司的负担极其沉重，其他公司用电量的负担也很沉重，日本民众的负担也很沉重，政府的决策的压力负担也很沉重。\n\n因为电对于生活，工作都是有非常大的影响。而许多公司也是看中这个特点，从而准备进入电力市场来换取一定的利益。其中有像JX，丸红，三菱商事等实力雄厚的公司。肉包觉得做这些工作，其工作的意义是非同小可的。为已经工作和对此类工作有浓厚兴趣的人们点赞。\n\n这几天肉包还改了很多同学们的ES。感觉就是写过的和没写过的差距很大，练过的和没练过的差距也很大，当然最大就是上过七联的课和没上过七联的课的差距了。写ES是有套路的，可以看作是像写高考最后那篇作文一样。以**紧扣题目，紧扣中心思想**来展开。但必须是以**简练的语言**进行阐述。\n\n肉包总结了以下几个大家的问题。\n\n- 太罗嗦。明明一句话就可以结束的，却分了好几句话去阐述，看的就有点恼怒。\n- 日语还是硬伤，尤其是助词。这个还是需要日本人来帮忙改一下。\n- 太口语化。日语也是分正式的和口语的。例如でも是口语，しかし是较为正式的。\n- 有时会混乱。明明是在讲“东”，却讲了好多“西”。\n\n只要注意这些问题的话，相信大家的ES的质量会有一个质的提升的。\n\n这几天以中国为主的亚投行在世界上刮起热潮，预示着我们的祖国的强大。而肉包这几天往返中国的旅程体会到了中国企业的强大。希望大家将自己的未来不要紧缩于一个国家，日本或中国，而是将自己的舞台放在整个世界。\n\n4月开始七联就要开始新的课程了，请大家多多关注啦！\n\n##关注肉包专栏，关注七联就职。\n', '2015-04-08 10:00:00', 'Rob', 'http://qilian.jp/img/rob.png', 'http://qilian.jp/blog/2015/04/08/rob_column_44/'), ('4', '1', '【七联・肉包专栏】第四十三期：日本车的未来在哪里 ', '# 【七联・肉包专栏】第四十三期：日本车的未来在哪里\n\n肉包昨晚接近凌晨的时候，终于回到了东京。一下飞机发现羽田被堵了，过关的队伍排到了电梯口。按照这个游客量的势头，今年日本的旅游人口肯定又要涨好多。\n\n**今天的日经新闻的头版头条是讲关于2015年环保车的减税制度的更改。**从2015年开始，除了一部分混合动力以外，其他车型的减税率都出现了一定的下降。这也就说明消费者和厂商需要负担的费用将有一部分的增加。这对原本因为消费税增加导致日本国内市场低迷的车企又是一个不小的打击。\n\n但是因为混合动力不在此次制度改革的范围内，所以很多企业都准备大力生产原本的混合动力车型或设计一些新的车型来适应此次改革。其中就包括像丰田和富士重工等企业。\n\n肉包一直都非常佩服日本政府对于环境保护所作出的贡献，因为没有政府对于政策上的调控，大家也不会在日本看到这么美的蓝天。肉包更佩服日本民众对于环保的支持。因为对于设计汽车的人来说，混合动力是一件非常丑陋的作品。即便是这样，混合动力也因为其“表面上的环保功能”被日本民众喜欢。也因为如此，奠定了丰田在世界汽车市场的霸主地位。\n\n肉包真的不是很爱混合动力，也不觉得混合动力有多么的环保。如果大家把生产混合动力发动机的二氧化碳排量也放上去的话，这个车其实真的很不环保，还不如去买清洁柴油车来的更加环保。\n\n所以其实大家看东西需要看一个整体。从生产到回收整个一个cost是怎么样的，才能定夺这个混合动力是真环保还是假环保。而不像日本佬或者美国佬只看自己的这部分输出，而忽略对整个系统的伤害有多大。\n\n其实这个想法能够引入到Group Discussion就最好了。\n\n  不追求结果，追求的是整个过程！\n\n很多同学经常觉得拥有一个猪一样的队友的话肯定无法通过GD的考试了。其实肉包认为还是有一定的机会的，因为面试官不是傻子。所以如果大家能尽可能的将自己的团队往正道上走的话，相信大家还是可以通过的。\n\n而很多的同学都是因为各种埋怨，而导致整个过程都是在一种非常压抑的状态下结束的。这其实是一个非常可惜但又普遍的结果。所以请大家以一种积极向上的心情完成整个GD吧。\n\n另外有一个消息是，**只要是一面或者是GD，它的淘汰率永远是最高的。**所以大家请真正慎重的对待第一次哈！\n\n## 关注肉包专栏，关注七联就职！', '2015-04-07 10:00:00', 'Rob', 'http://qilian.jp/img/rob.png', 'http://qilian.jp/blog/2015/04/07/rob_column_43/'), ('5', '1', '【七联・肉包专栏】第四十二期：肉包工作前的最后一篇 ', '# Rob专栏第四十二期：肉包工作前的最后一篇\n\n今天的日经头条讲的是三菱商事将在缅甸进入其食品类市场的商业活动。今年5月，三菱商事将对缅甸的一家名为CDSG集团公司旗下的面粉及咖啡公司出资30%，用来增强其在缅甸的物流网及食品制造的实力。\n\n肉包今天的专栏主要讲三个单词，**三菱商事，缅甸，以及食品**。\n\n##三菱商事\n三菱商事作为日本第一的综合商社，长期以来霸占着日本的贸易市场。因为有着日本最大财阀的背景，其贸易利润以资源类的贸易为主，例如石油，铁矿石等。可也正是因为其对于资源类的过度重视，导致了这次在俄罗斯石油危机上亏了不少钱。并且，由于这几年非资源市场的关注度及其规模的慢慢增加，其在商社业界的绝对优势在逐渐缩小。\n\n但是肉包认为如果三菱商社倒了，日本也就倒了。三菱商社在日本的影响力相当于中国几大央企对中国经济的影响力。所以根本没有必要对三菱商社或者其他商社的短期危机产生恐惧。其原因有很多，比如综合商社里会聚着日本的尖端的人才，综合商社是日本最有钱的企业，拥有着日本最多的关系网。其实世界上每个地方都是一样的，有关系，事半功倍。\n\n##缅甸\n缅甸最近在日本非常的火热，原因也有很多。最重要的一点是去年美国恢复了和缅甸的外交关系，导致了日本也开始了和缅甸的来往。再加上日本在缅甸独立战争时期给予缅甸一定帮助的原因，缅甸其实是非常亲日的。\n\n另外，缅甸对于日企的战略意义是非常大的。因为其在东南亚的地理优势，以及非常廉价的人力费和非常实惠的招商引资政策，缅甸在未来对日企来说都是非常有吸引力的。所以，缅甸人在近期找工作的话是非常有优势的。\n\n##食品\n食品业界在日本是最火的业界。如果大家去看日本就职活动人气业界排名的话，食品业界在最近的日本就职活动当中长居第一。\n\n日本食品的国际影响力在不断上升，不光是餐饮业，一些做零食，调味品，或者酒类的企业在最近也慢慢变得有名起来。健康，干净，精致等一系列大众对日本食品的印象导致了一些想去国际舞台大展身手的学生对看似无趣的食品业界也有了兴趣。\n\n对于日本人来说，日本食本身就是非常有魅力的一种东西。很多日本人出国是无法适应国外饮食的。这种现象从侧面反映了日本人对于自己国家饮食有一种依赖性，这也使日本人对于食品行业的工作有一种向往性。而本身对于日本这种极度缺乏资源的国家来说，通过国际贸易来解决国家食品储备的工作，让日本人自己有一种优越感。\n\n当然对于留学生来说，不管是自身职业未来发展，还是自身实力成长，进食品业界都是一个不错的选择。\n\n最后想说的是，这一期是肉包成为社会人之前的最后一期，明天将会是肉包新生活的开始。希望大家每天都有好心情。未来肉包会在每周五送上一周的专栏，希望大家能够多多支持。\n\n##关注肉包专栏，关注七联就职。', '2015-04-06 10:00:00', 'Rob', 'http://qilian.jp/img/rob.png', 'http://qilian.jp/blog/2015/04/06/rob_column_42/'), ('6', '1', '【七联・恬姐专栏】第五期：2014年4月入社的社会人前辈专访（三）', '## 简介\n4月1日，即将有一批新入社员带着期许与不安开始自己的职业生涯。在就活中忙碌的留学生后辈也急需了解前辈们是如何就职的。从三月中旬开始，恬姐专栏会连载四期社会人前辈专访，为您带来新鲜的就活心得与职场体验。\n\n## 内容摘要\n   在前两期专访中我们共同探讨了两个问题：一、如何衔接学业生涯与职一、如何衔接学业生涯与职业生涯。本期受访嘉宾的经历比较特殊，她先在上海工作了两年，然后通过“海外出愿（在中国提交报考大学院的资料）”考上了日本的大学院，在硕士在读期间拿到大手能源公司的内定。\n   我迫切地想知道：她为何通过留学来重塑自己的职业生涯？所有的选择都有两面性，她是如何看待得与失的？对正在求职和即将步入职场的后辈，她有什么样的建议？\n\n##嘉宾介绍\n   郭雨贤（化名），日语专业毕业，毕业后进入上海的日企现地法人工作，在职场上打拼了将近两年后选择出国留学，通过“海外出愿”的方式合格了早稻田大学商学研究科。硕士在读期间积极地参加实习和就职，参加了50个以上的企业的选考，现在在某大手能源公司做综合职。\n\n##采访内容\n- 恬：我们开门见山地来好了。是出于什么样的原因，选择辞掉工作去留学呢？\n- 郭：因为是在日企的现地法人工作，公司给的教育培训力度不够，而且周围的同事都在酝酿跳槽，让我感到很不安。再加上自己除了日语以外不会别的专业，在大都市又经历了工资与房价不成正比的现实。\n- 恬：但是辞职去留学相当于一次冒险，需要很大的勇气，是什么支撑你做出这个决定的呢？\n- 郭：在收集了很多信息以后才做的这个决定。通过公司的日本人了解到由于奉行终身雇佣制，日企本社会花更多的心思在培养人才上。另外，在日本留学的朋友告诉我一些考大学院的信息和在日本找工作的信息。整理了很多信息后我决定报考日本大学院，重塑自己的职业生涯。\n- 恬：在备考的过程中肯定遇到不少困难吧？\n- 郭：是的。海外出愿的手续就比较麻烦，去日本考一次试的成本也比较高。\n- 恬：那准备笔试和面试对你来说难度大吗？\n- 郭：拜托朋友帮我买了过去问，翻阅了过去问后就开始自学，早大当时有考英语校内考，自己的英语水平也不差，然后就过了。面试没有太难。\n- 恬：来日本后就积极地为找工作做准备了是吗？\n- 郭：是的。我是就职为主学业为辅。\n- 恬：能简单地说一下你的求职过程吗？\n- 郭：听了大概五六十家企业的说明，其中有十几家公司给了我面试机会，最后拿到三家企业的内定。我都是和周围同学一样做webtest、写entry sheet等，在面试前翻阅这家企业最近三个月的日经新闻。\n- 恬：你选社的标准是什么？\n- 郭：这个公司有无国际业务，公司的人事和社员给人什么样的感觉，人事制度怎么样。\n- 恬：拿到三家内定，为什么选择了现在的雇主？\n- 郭：因为这家公司的面试流程非常地快，不会拖拖拉拉，在这家公司做综合职也能成长得很快。\n- 恬：现在工作了有一年了，你感觉怎么样？\n- 郭：一直在努力地学习工作技能和提高业务水平，当然也不可避免地会有做重复劳动的时候，整体上来说还是一直有新鲜感的。\n- 恬：你们部门像你这样的外国人多吗？\n- 郭：就我一个。有时候会感觉文化上的差异和语言上的壁垒对自己来说是一个挑战，不过在努力学习和适应中。公司比较好的一点就是，大家尊重我作为已婚女性和外国人的身份，这一点还是蛮感动的。\n- 恬：可以问一个不太好回答的问题吗？你觉得公司不好的地方在哪里？\n- 郭：公司内部依旧是年功序列制，容易造成优秀的员工难以速度被提升，表现一般的职员只要不犯大错，到了一定年龄就会升值加薪。  \n- 恬：你会不会担心自己有一天被同化？\n- 郭：在日企想混日子的话，其实也可以。我在下班后会学习充电，毕竟业余时间的努力会决定事业的高度。\n- 恬：假如你当初不辞职来日本，现在至少有5年的工作经验了。有没有后悔过之前的决定？\n- 郭：没有后悔过。因为有之前的工作经验，在做一些决定的时候就有了参考。如果没有比较的话，看待问题和考虑问题的方式会和现在不一样。\n- 恬：你现在会很客观地衡量做当初那个决定的得与失吗？\n- 郭：会啊。“失”的话，陪伴父母家人的时间太少了，这个只能慢慢去弥补。“得”的话，经验、经历、朋友，都是“得”。\n- 恬：大部分找工作的后辈都没有工作经验，你对他们有什么建议吗？\n- 郭：享受整个找工作的过程，尽量多报一些企业，把求职过程当做深刻认识商业社会的一次千载难逢的机会。还有就是一定要明确自己想要的是什么。然后，今年的就职情况比往年好很多，大家只要努力就能找到很好的工作，希望后辈们加油吧！\n## 恬姐寄语\n   采访进行到尾声，我和郭雨贤说：“你是一个目标很明确的人，做事非常有逻辑。”她却回答我说：“我很偷懒，有时候在家什么都不做，看喜欢的书看很久。”但是从字里行间我能感觉到她用力会用到点上，这个点就是“人生的转折点”，而且她的“转折点”完全是靠自己创造出来的。\n   “选择”和“努力”究竟哪个更重要？努力到点上最重要。', '2015-04-05 10:00:00', 'Tianjie', 'http://qilian.jp/img/tianjie.png', 'http://qilian.jp/blog/2015/04/05/tianjie_column_3/'), ('7', '1', '【七联・肉包专栏】第四十一期：如何选择说明会?! ', '#【七联・肉包专栏】第四十一期：如何选择说明会?!\n\n因为家里发生了点事导致肉包的状态不是很好，所以在春节过后出了一期之后肉包又停了半个月。肉包也正是在这半个月里面想了很多，也决定了未来自己的一些方向。\n\n人就是这样，自己的目标会因为一些事物的发生而改变。但是这就是我们所需要面对的现实吧。\n\n找工作也是一样的。往往自己在找工作前锁定的一些公司，因为时间等一系列事物的发生而慢慢的放弃，或转向了另一些公司。凭心而论，很少有人能够得到那些自己一开始最想去的公司的offer。\n\n在我看来，这并非是坏事。因为你看一家公司，肯定比一家公司看你来的肤浅。公司是你要花未来40年的地方，而因为自己主观的一些想法而放弃那些潜在的机会实在有些可惜。所以拿光你想去的公司的offer，然后再去选择一家公司，可以说是最好的结果。\n\n今天的肉包专栏不会介绍一些日本发生的经济新闻，而是总结了这半个月以来大家所有的疑惑，并且传递一些肉包自己的看法。希望能够帮助到大家的就职活动。\n\n## 如何选择说明会\n自从3月1日开始大家的邮箱都炸开了锅。很多人都在犹豫是否要参加这么多的说明会?\n\n是的! 而且越多越好!! 就职就是这样，如何合理的安排时间去参加一些**有意义**的说明会是非常重要的。因为这几个月是你人生唯一的机会去听一些免费的公司说明会，不仅增加了你的日本公司的实力的了解，也有可能会让你对这些公司的看法导致一些改变。很多人都会在就职活动期间改变他的公司希望度。肉包也是这样。肉包参加了自己公司的说明会高达6次。其中也有抽签抽中的运气成分，但是正是因为这6次说明会，让肉包对自己未来的公司有很深度的认知。\n\n肉包在上面的解释当中有一个形容说明会的词叫做**“有意义”**。何为有意义的说明会? 肉包不推荐大家盲目的去参加说明会，因为参加说明会是一件非常劳累的活动。所以带着目的去参加说明会的话，可以看作是去参加有意义的说明会。\n\n这个时候问题又来了。如果没有目的，但是非常想参加这家公司的说明会的话，那应该咋办呢？\n\n这个时候，肉包可以提供一些独家小窍门。每个公司不仅只有一些无聊通俗的说明会，它还会有一些有价值的说明会。例如，部门说明会，面向理科学生的说明会，面向留学生的说明会，面向女性的说明会，一日实习说明会等等。像这些**范围较小的，并有较大可能性得到别人得不到消息的说明会**的话，肉包认为就是有意义的说明会了。\n\n就职活动无非就是**比拼情报量，和让人事记住你**。所以参加肉包所认为的有意义的说明会其实就是让自己在这两点上做的比别人优秀罢了。除此之外，你需要做好准备的也有以下几件事情：\n\n1. 买一个有日历的记事本。将每天的说明会的时间和公司名都记录在日历当中。每预约一个就写一个。\n2. 手机上下载一个乘车导航。当两个说明会时间凑得很近的时候，请先查一下两地之间所需要的路程之后，再预约。不要到时候迟到了。\n\n有时候参加一些说明会之前，会叫你写个name card贴在自己的胸前，或者你被安排到了指定的座位当中。恭喜你，你已经开始进入到了面试环节。这个环节肉包会在下一期当中着重介绍。但有一点是可以提前说的，就是请放松，不要紧张。\n\n4月份开始肉包也要参加工作了，肉包争取一个礼拜写一篇文章来帮助那些需要的同学。就职活动才刚刚开始，机会还在眼前。请大家花几个月的时间努力一下，来抓住这些机会，不要让自己后悔哈! 如果有任何问题的话，也欢迎大家通过七联公共平台来给我们留言，我们会在搜集留言之后，统一回复大家的。\n\n##关注肉包专栏，关注七联就职。', '2015-04-05 10:00:00', 'Rob', 'http://qilian.jp/img/rob.png', 'http://qilian.jp/blog/2015/04/05/rob_column_41/'), ('8', '1', '【七联・肉包专栏】第四十期：如何去做好一个好的说明会 ', '#【七联・肉包专栏】第四十期：如何去做好一个好的说明会\n\n这几天东京的天气慢慢回暖，就如同现在的世界股市一样热闹腾腾。不知大家对于就职活动的热情是否也越来越高涨呢？\n\n因为上期的专栏当中有提到**说明会其实也有是面试的可能**，所以这期的专栏主要是给大家讲讲如何做好一个好的说明会，并且可以在人事面前给予自己加分。\n\n有面试的说明会，或者说人事有打分的说明会其实有很多种。以下几种情况是大家需要注意的，因为人事极有可能会为你打分。\n\n- 发名牌让你贴在西服上的\n- 有指定座位的\n- 自己将桌上的白纸写上名字和大学的\n- 最后写一篇感想，让你放在座位上的\n\n等等，只要你将自己的个人情报留在了场地上，其实你就有可能会被人事锁定。就是那么阴险。哈哈！\n\n所以当你察觉到自己的名字会将留在那个说明会的时候，你就应该提起精神来好好的想想如何表现自己。因为评分如果高的话，就有机会得到リクルーター的青睐，从而走上了裏ルート―的开后门旅程。\n\n需要多多注意的业界有**金融业界**，**船运业界**，**商社业界**，**老牌制造业大手**！其实就是越老牌老油条型的，就越有这种传统风俗在里面。\n那我们来看看当我们遇到这种状况的时候应当如何做的游刃有余。\n肉包把这种黑暗的评分说明会分成4种。\n\n##普通提问型\n其实这种类型的说明会或seminar其实就是一种普通的OBOG的访问，只是它是公司办的一个活动，而往往来参加这些OBOG的人都会带个本本来记录问题，也顺便会记录对人的评价。\n而如何对策这种类型的说明会，其实就放轻松，当成普通的OBOG访问就可以了。只是应该好好想想如何问问题，能问出让人可以印象深刻的问题。\n当然问下やりがい、仕事している時辛いと思う瞬間这种东西都是可以的，也是非常基础的。以这种说明会必定是以了解工作为主的。\n但如果能问出一些关于这家公司最近的一些时事，然后听一下这位社员的看法的问题的话，是最为理想的。\n因为这表现出你对这家公司是极其关注，了解极深的姿态。肯定是大大加分。做普通的OBOG其实也是应该这样，而不是为了去吃顿饭，或喝杯咖啡哈。\n\n##Group Work型\n这种说明会就表现的比上面那个更为明显了，它会和说明会连在一起进行。这个时候你就可以用出大家在**【七联】**学的**GD对策（“玉U”）**来做啦。这样必定是顺利通过的。\n\n##抢问型\n这种形式其实是很贱贱的一种说明会，它会留下一定的时间，相对较长的时间，给大家提问，提好问之后它会叫你写张评价纸，评价下今天的说明会，然后请你放在桌上离开。这是一个非常阴险的做法，让你无法防范。\n肉包曾经跟一个大手的部长吃饭的时候问过在说明会提问的意义。然后那位部长就说了句，不会提问的人对于公司来说其实可以当成没有积极工作的态度的人，当然评价也会变低。\n所以很显然，这种在有限时间内，一群人问一个人的状况的时候，**请疯狂举起你的手去赢得问问题**的机会。这样才能提高你进入下一轮的机率。\n提的问题可以很基本，但是提总比不提好。\n\n## 神不知鬼不觉型\n这种类型就是我们根本不可能防范和准备的了。我们根本无法知道人事是如何锁定我们的身份来评价我们的。但是我们就是这么的被评价了，也许就是这么的被刷了。\n肉包觉得这种状况下被刷不一定就是一件坏事，你做的就是最真实的你，不假，不做。如其到时候工作的时候被弄得死去活来，还不如现在早点被抛弃来的幸福。\n\n其实人事的评分手段有很多很多，这都是我们无法预料的。但是就职活动就是这样，就是在合格和不合格的当中无数次的来回。不要介意一些我们无法handle over的东西，只要努力了，就不会后悔。\n\n今天的日经头条说的很简单，就是大家要涨工资了。形势一片大好啊！哈哈。\n\n##关注肉包专栏，关注七联就职。', '2015-04-04 10:00:00', 'Rob', 'http://qilian.jp/img/rob.png', 'http://qilian.jp/blog/2015/04/04/rob_column_40/'), ('9', '1', '【七联・肉包专栏】第三十九期：雅马哈宣布目标在2019年在欧洲开展汽车事业 ', '#【七联・肉包专栏】第三十九期：雅马哈宣布目标在2019年在欧洲开展汽车事业\n\n今天是肉包专栏在羊年的第一弹。不知大家这次过年过的怎么样，是否也是红包多多，抢的甚是开心。肉包这年过的异常难过，虽然见了很多朋友， 喝了很多小酒，但是因为自己的外公出了些小意外，让自己思考了很多，想了很多。调整下心情，来进入今天的话题。\n\n今天的日经的头条是位居世界摩托车市场第2位的雅马哈宣布目标在2019年在欧洲开展汽车事业。雅马哈为此将投入数百亿日元来建造工厂。而其制造和贩卖的车型为2人座的汽车为主。\n\n至此，雅马哈将成为第9家渗入汽车市场的日本企业。肉包不禁感叹**日本的汽车制造业是多么的强大**。不愧是日本第一大产业，其意义不仅仅在于日本汽车产业在世界的地位，其更重要的意义是在于汽车产业对于整个国家的经济贡献有多么的大，就业率，关联企业的扶持等等。\n\n再来看看雅马哈此次**进军汽车市场的手法**。\n\n肉包觉得其成功的概率非常之大，理由就是因为雅马哈在摩托车市场的成功有很大可能性能够带动汽车市场的成功。而投入于2人座的汽车市场恰恰就是将雅马哈在摩托车的各种技术融入到汽车当中来。\n\n大家可以简单的想想，摩托车改成汽车其实就是将前后座改成并排座。\n\n并且雅马哈对于汽车的引擎的开发早在1964年就已经触碰。对于汽车引擎的制造技术早已到达炉火纯青的地步，因为现在的雷克萨斯身上其实就有雅马哈的技术。所以在技术方面雅马哈是没有什么问题的。\n\n那再来看看**市场**这一方面。雅马哈在摩托车市场的巨大成功让其拥有一大批忠实的粉丝，也让其在世界具有一定的品牌竞争力。而其生产贩卖的市场是在于小型车相当成熟发达的欧洲市场，这更令其在未来开发新兴国市场的时候能具有导向的作用。\n\n而数据显示日本的其他8家汽车企业在海外生产汽车数量同比增加5.9%，也说明未来海外市场对于日本企业是多么的重要。所以一些同学假如对汽车行业有兴趣的话，可以大胆去尝试一下这些企业。不光光是我们熟知的那些大企业，那些做零部件的企业，肉包也大力推荐。\n\n除了这则消息之外，以下几则消息也可以适当关注下。\n\n**松下积极投入到复合式的看护设施用品的市场**。因为老年化的加剧，日本对于老年人的服务市场也必定扩大。而肉包一直觉得这个市场未来很有前景，因为不光光是日本，我们的祖国也将面临同样的问题。在昨天的中国统计年报当中就指出65岁以上的老年人的总数已经占到整体的10%以上。\n对于**人才培养的**一些观点也非常有趣。例如DENA的CEO南场智子说，日本对于加工贸易当中不犯错的人才培养是非常擅长的，但是希望日本能够有些自我思考，具有创造力的人才培养方式。来自文部科学省的松坂浩史表示对于现在以填空题为主的大学考试是无法培养出创业能力的。其实在面试当中，如果同学们能够表现出自己的一定的创造能力，相信对于面试官来说是一个非常新鲜的感觉。\n\n今天的专栏其实是在病床上的外公的身旁写下的。希望自己的外公能够坚强的挺过来。外公加油！\n\n##关注肉包专栏，关注七联就职。', '2015-04-03 10:00:00', 'Rob', 'http://qilian.jp/img/rob.png', 'http://qilian.jp/blog/2015/04/03/rob_column_39/'), ('10', '1', '【七联・肉包专栏】第三十八期：春节快乐！日本就业好状况！ ', '#【七联・肉包专栏】第三十八期：春节快乐！日本就业好状况！\n\n经过一个周末的洗礼，肉包已经体验到了国内的年味十足。穿梭于各大商场的肉包深切的感受到国内的经济之好，消费水平之高。不知在东京的同学是否已经陆陆续续的开始准备在他国的年夜饭了吗？如果没有的话，可以来七联的活动哈! (【活动】请点左下角阅读原文)\n\n今天的日经主题是讲关于**日本的就业现状**。各大企业增加了正式员工的名额，特别是在一些服务行业和贩卖行业。在年轻人的总人数减少，每年的可用劳动力持续降低的大背景下，提高工资待遇和提高工作环境水准是日本企业不得不做的事情。\n\n**增加可用劳动力**有在肉包看来有两种方式。第一就是**增加女性劳动力**，让更多的主妇投入到工作当中。统计指出，在15-64岁的日本女性就业率是在64.4%，比男性低了17.2%。所以增加日本女性的可用劳动力对于日本企业来说是最为理想的。\n\n第二就是**大力增加外国人的名额**。这就是七联一直在援助大家所做的东西。在日本这个没有资源的国家当中，跟国外的联系是无法切断的。没有中国，没有中东，没有美国，日本将变成一个一无所有的国家。\n\n增加外国人的就职名额对日本企业来说是有一个一石二鸟的作用。不仅企业的可支配的劳动力增加了，而且和国外的企业的联系也大大变得紧密起来。这对我们这些外国人来说是一个双赢的消息。\n\n所以今年的就职活动对外国人来说是一个大年。日本经济，美国经济，中国经济世界上这几个经济大体都是平稳提升，没有重大的隐性危机。在这个大的积极的环境之下，我们只需做的是努力地，勤奋地，不知疲倦地去寻找最适合自己的那一家公司。\n\n除了这一则消息以为，肉包还要介绍一家大家都不是特别熟悉的公司，名叫**ファナック（FANUC）**。上过七联Maker课程的同学其实都应该知道这个神秘的公司。这个公司有一个非常厉害的特点，就是**高市场占有率，高利益率**。在自己的主业，工作机械用的NC，也就是数字控制上面，它的世界占有率为50%，列世界第一。这在经营学上面来看的话，其实已经有垄断的感觉存在，完全是这个市场上的领导者。\n\n而它的高利益率也是高的吓死人，在2008年的时候，其总收入在4684亿日元，而其经常利益为2100亿。也就是说他的经常利益对总收入的比为将近50%！可知道日本其他公司在这个上面的值能超过10%的上市公司已经是屈指可数了。\n\n对于外国人来说，这个公司也有一个缺点就是这家公司的总部在遥远的山梨县，并非东京。\n\n而这家公司在今天的日经新闻也抛出了重磅消息。**FANUC将在2016年为止投资1300亿日元去修建新的工厂以及研究所**。这一举措在肉包看来就是巩固其在数字控制技术的一个绝对竞争力。而此举也是进一步的解决如何运用他们在高收益下面挣来的钱的问题。\n\n这个问题其实很多日企都是有的。丰田也有，几个大的综合商社也是有的。如何挣钱已经不是烦恼，而烦恼是如何用赚来的钱再去生钱。这个也是未来我们在日本工作的人要去帮企业做的事情。\n\n除了这两则新闻之外，还有以下几则消息是可以受到关注的。\n**Big Camera将增强其网络贩卖的事业**。\n**大手的生命保险公司大力向海外输送人才**。肉包想说的是，在生保这个业界来说，大家可以去试下**第一生命**，而不要去试日本生命这种古老的掉渣的企业。要问理由其实就是日本生命不会要外国人。\n**三井住友银行作为第一家入住上海自由贸易试验区的日本银行**。\n\n肉包将在明天开始进入春节休息状态，在这里提前给大家拜个早年！而【肉包专栏】将在27号强势回归。敬请期待！\n\n##关注肉包专栏，关注七联就职。', '2015-04-02 10:00:00', 'Rob', 'http://qilian.jp/img/rob.png', 'http://qilian.jp/blog/2015/04/02/rob_column_38/'), ('11', '2', '【七联・五一黄金周】黄金海岸BBQ', '抓住春天的尾巴，让我们一起狂欢吧~！\n\n七联黄金海滩BBQ，带你在这个黄金周结识更多的朋友~\n\n不管是即将参加就职活动的你还是正在为就职四处奔波的你，不妨给自己放一天假，在这个美丽的季节，遇到一生的挚友、一起努力的同道中人，放宽眼界，了解更多资讯，小七带你“勾搭”前辈~~~\n\n\n- `参与对象`：想要结交更多志同道合朋友的你~\n- `参与费用`：男士3000日元 / 女士2500日元（门票＋BBQ器材＋食物酒水）\n- `时间`：5月2日（周六）10:00～16:30\n- `地点`：大井埠頭中央海浜公園\n- `集合地点`：JR品川駅（東口）都営バス「品91系統」 「八潮南」   下車　徒歩６分\n\n## 当日流程：\n\n\n>    10:00   JR品川駅车站集合 （迟到的童鞋请自行来公园集合）\n\n>    10:30～11:00   巴士 移动\n\n>    11:00～12:00   开始准备烤肉\n\n>    12:00～16:30   自由活动・游戏・交流\n\n>    16:30～        解散or二次会\n\n## 报名方式:\n\n点击阅读原文。请花上1分钟，填写一下报名表格~\n\n>    [点击报名](http://goo.gl/forms/qnPLnrhguZ)\n\n需要的物品：以单反为代表的各种相机，手不够长的同学可以选择带自拍杆、拍晒黑的MM请一定备上防晒霜、最最重要的是请大家带着愉快的心情来哦~', '2015-04-21 10:00:00', 'QiLian', '', '');
COMMIT;

-- ----------------------------
--  Table structure for `teacher_available`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_available`;
CREATE TABLE `teacher_available` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(8) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `teachers`
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL COMMENT '老师头像',
  `description` text NOT NULL,
  `university` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `teachers`
-- ----------------------------
BEGIN;
INSERT INTO `teachers` VALUES ('1', 'Rob', 'rob.jpg', 'Rob修士就读于庆应义塾大学大学院。在大学院期间，曾经经过学校推荐，参加荷兰代尔夫特工科大学的交换留学。也是因为这次交换留学，没有时间参加所谓的暑期实习，甚至自己人生第一场就职说明会也只能安排在12月底。但正是因为这种看起来起步晚，无正规实习经验的危机感，使自己更加努力，在3月26日拿到了第一家大手石油公司内定，并在4月初拿到了大手证券N社内定。Rob虽然担当金融部分的讲师，但对能源、化学、商社、海运、物流、咨询等业界也有深刻理解。更重要的是，Rob通过自己经验总结出来的3个月速度就活方法，能够帮助你迅速的找到就活的自我，就职的自我，以及未来的自我。', '慶応大学', '金融大手企業N社', '0000-00-00 00:00:00', '2015-05-26 10:45:42'), ('3', 'Johnny', 'johnny.jpg', 'Johhny，本科毕业于西安交通大学能源与动力工程学院，现就读于东京大学机械工学。在有限的日语能力和贫乏的实习经历下，如何通关简历，打开面试大门？身佩“学校推荐”的双刃剑，工科生又应如何规划就活之路？纷繁复杂的非IT类制造类企业中，又隐藏了多少不为人知的绩优股？如果你正疑惑着上述问题，他也许能帮你拨云见月，明确自己的最佳答案。情报先行，知己知彼。绕过金融或咨询，我们也能收获高年收内定。', '東京大学', 'エネルギー大手企業C社', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Kuma', 'kuma.jpg', 'Kuma 修士毕业于庆应义塾大学，拥有他人不可想象的五所大学经历：武汉大学、华中科技大学、北海道大学、庆应义塾大学、华盛顿大学交换留学。他参与过上到宇宙下到深海的研究课题，发表过4篇国际论文。暑假期间，Kuma参加了IBM咨询部门、C社、以及日挥的实习。并在4月获得外资IT大手C社、IBM、Docomo的内定。他曾参加P＆G、JP Morgan、Docomo、NTT communications、Google、IBM等超大手公司的面试，覆盖几乎所有业界，ES通过率更达到9成以上。Kuma擅长完全的个性化就职，有很多奇葩的技巧区别自我。Kuma的面试可以总结为【傲娇】! 曾有5分钟令考官叹服，直接进入下一轮的经历。', '慶応大学', 'IT大手企業C社', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'Water', 'water.jpg', '本科毕业于日本地方国立大学，在号称经济专攻的环境下杂学无数，导致修士进学东京大学综合文化研究科继续其莫名其妙的文系研究。特长就是没有特长，或者全是特长。实习经历遍布制造业（宝洁CEO Challenge），百货业（三越伊势丹），IT咨询业（ＩＢＭ），保险业（损保日本兴亚新加坡实习），金融业（高盛投资调查部门，三菱东京ＵＦＪ摩根士丹利私人银行），咨询业（普华永道，埃森哲）。虽对企业了解不如其他讲师，但由于其丰富的个人经历与奇葩的个人魅力，选考突破率貌似挺高，其中ＧＤ为１００％。\nWater开过网店，做过翻译，有簿记三级，明明是只英语弱还厚颜无耻的爱讲，Water对各位就职同学的建议就是，趁年轻多出丑，有一个厚脸皮和强壮的神经，不怕没有好内定。', '東京大学', '内定：PwC战略部门', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', 'Bruce', 'bruce.jpg', 'ES通過率9割以上，GD通過率9割以上。　来日6年，比较理解日本就职文化，面试官思维。在外资投资银行，日资证券，咨询，外资maker领域有丰富面试经验。曾在10所以上金融公司实习，1~2次面试通过率9成以上。教你如何在赢得实习机会并在实习中脱颖而出，洞悉面试官心理，根据面试官类型随机应变改变战略，引诱面试官掉入你精心准备的“陷阱”，并非一方面的展示自己，而是通过对话博得好感，最后在反问问题环节一击必杀。', '東京大学', '内定：SMBC日興IB　みずほ証券IB　デロイト', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `realname` varchar(255) NOT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `wechat` varchar(255) NOT NULL,
  `line` varchar(255) NOT NULL,
  `university` varchar(255) NOT NULL,
  `major` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL DEFAULT 'student',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', '吴昌龙', null, 'clongbupt@gmail.com', 'clongbupt', 'clongbupt', '北京邮电大学', '计算机科学与技术', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '王戴维', null, 'davidijing@gmail.com', 'davidbeartokyo', 'davidbearintokyo', '電気通信大学', '情報通信工学', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', '齐向超', '', 'sqddd@hotmail.com', 'asdfqqq', 'asdfqqq', '早稲田大学', '情報通信工学', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', '吴雪婷', null, 'dongqiang.dali@gmail.com', 'wuxueting', 'wu_xueting', '立教大学', '経済学科', 'student', '0000-00-00 00:00:00', '2015-05-26 07:32:12'), ('5', '李师', null, 'lishi@hotmail.com', 'lishi', 'lishi', '早稲田大学', '経済学科', 'student', '0000-00-00 00:00:00', '2015-05-26 07:32:09'), ('11', 'DongQiang', 'e28ed5e6e07591b3a7bb429faefe137645d27a11', 'dongqiang.v@gmail.com', 'tokyodq', '', 'Tokyo Univ', 'IT', 'admin', '0000-00-00 00:00:00', '2015-05-26 08:32:16'), ('13', 'dongqiang.tokyo', 'e28ed5e6e07591b3a7bb429faefe137645d27a11', 'dongqiang.tokyo@gmail.com', '', '', '', '', 'student', '2015-05-26 08:53:11', '2015-05-26 08:53:11');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;