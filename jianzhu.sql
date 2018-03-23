/*
Navicat MySQL Data Transfer

Source Server         : php
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jianzhu

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-28 11:35:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for modao_action
-- ----------------------------
DROP TABLE IF EXISTS `modao_action`;
CREATE TABLE `modao_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of modao_action
-- ----------------------------
INSERT INTO `modao_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `modao_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `modao_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `modao_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `modao_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `modao_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `modao_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `modao_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `modao_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `modao_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `modao_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for modao_action_log
-- ----------------------------
DROP TABLE IF EXISTS `modao_action_log`;
CREATE TABLE `modao_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of modao_action_log
-- ----------------------------
INSERT INTO `modao_action_log` VALUES ('1', '1', '1', '2130706433', 'member', '1', 'admin在2017-12-07 09:15登录了后台', '1', '1512609328');
INSERT INTO `modao_action_log` VALUES ('2', '8', '1', '2130706433', 'attribute', '22', '操作url：/admin.php?s=/Attribute/update.html', '1', '1512610665');
INSERT INTO `modao_action_log` VALUES ('3', '8', '1', '2130706433', 'attribute', '22', '操作url：/admin.php?s=/Attribute/update.html', '1', '1512613844');
INSERT INTO `modao_action_log` VALUES ('4', '8', '1', '2130706433', 'attribute', '22', '操作url：/admin.php?s=/Attribute/update.html', '1', '1512613864');
INSERT INTO `modao_action_log` VALUES ('5', '11', '1', '2130706433', 'category', '2', '操作url：/admin.php?s=/Category/edit.html', '1', '1512616265');
INSERT INTO `modao_action_log` VALUES ('6', '11', '1', '2130706433', 'category', '2', '操作url：/admin.php?s=/Category/edit.html', '1', '1512616276');
INSERT INTO `modao_action_log` VALUES ('7', '8', '1', '2130706433', 'attribute', '33', '操作url：/admin.php?s=/Attribute/update.html', '1', '1512639867');
INSERT INTO `modao_action_log` VALUES ('8', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1512639881');
INSERT INTO `modao_action_log` VALUES ('9', '8', '1', '2130706433', 'attribute', '33', '操作url：/admin.php?s=/Attribute/remove/id/33.html', '1', '1512639941');
INSERT INTO `modao_action_log` VALUES ('10', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin.php?s=/Attribute/update.html', '1', '1512639981');
INSERT INTO `modao_action_log` VALUES ('11', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1512640136');
INSERT INTO `modao_action_log` VALUES ('12', '1', '1', '2130706433', 'member', '1', 'admin在2017-12-08 09:10登录了后台', '1', '1512695406');
INSERT INTO `modao_action_log` VALUES ('13', '1', '1', '2130706433', 'member', '1', 'admin在2017-12-11 09:23登录了后台', '1', '1512955396');
INSERT INTO `modao_action_log` VALUES ('14', '1', '1', '2130706433', 'member', '1', 'admin在2017-12-12 09:17登录了后台', '1', '1513041428');
INSERT INTO `modao_action_log` VALUES ('15', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1513047145');
INSERT INTO `modao_action_log` VALUES ('16', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1513047212');
INSERT INTO `modao_action_log` VALUES ('17', '1', '1', '2130706433', 'member', '1', 'admin在2017-12-14 13:59登录了后台', '1', '1513231150');
INSERT INTO `modao_action_log` VALUES ('18', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1513236247');
INSERT INTO `modao_action_log` VALUES ('19', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1513236356');
INSERT INTO `modao_action_log` VALUES ('20', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1513236433');
INSERT INTO `modao_action_log` VALUES ('21', '1', '1', '2130706433', 'member', '1', 'admin在2017-12-18 10:19登录了后台', '1', '1513563581');
INSERT INTO `modao_action_log` VALUES ('22', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1513564459');
INSERT INTO `modao_action_log` VALUES ('23', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin.php?s=/Attribute/update.html', '1', '1513564478');
INSERT INTO `modao_action_log` VALUES ('24', '8', '1', '2130706433', 'attribute', '35', '操作url：/admin.php?s=/Attribute/update.html', '1', '1513565519');
INSERT INTO `modao_action_log` VALUES ('25', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1513565617');
INSERT INTO `modao_action_log` VALUES ('26', '1', '1', '2130706433', 'member', '1', 'admin在2017-12-19 09:49登录了后台', '1', '1513648197');
INSERT INTO `modao_action_log` VALUES ('27', '1', '1', '2130706433', 'member', '1', 'admin在2017-12-19 10:02登录了后台', '1', '1513648936');
INSERT INTO `modao_action_log` VALUES ('28', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516678210');
INSERT INTO `modao_action_log` VALUES ('29', '7', '1', '-1062731773', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1516678222');
INSERT INTO `modao_action_log` VALUES ('30', '8', '1', '-1062731773', 'attribute', '35', '操作url：/admin.php?s=/Attribute/remove/id/35.html', '1', '1516692632');
INSERT INTO `modao_action_log` VALUES ('31', '1', '1', '-1062731773', 'member', '1', 'admin在2018-01-24 09:26登录了后台', '1', '1516757192');
INSERT INTO `modao_action_log` VALUES ('32', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516764124');
INSERT INTO `modao_action_log` VALUES ('33', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516764230');
INSERT INTO `modao_action_log` VALUES ('34', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516764291');
INSERT INTO `modao_action_log` VALUES ('35', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516764352');
INSERT INTO `modao_action_log` VALUES ('36', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516764411');
INSERT INTO `modao_action_log` VALUES ('37', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516764435');
INSERT INTO `modao_action_log` VALUES ('38', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516765773');
INSERT INTO `modao_action_log` VALUES ('39', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516766342');
INSERT INTO `modao_action_log` VALUES ('40', '7', '1', '-1062731773', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1516778774');
INSERT INTO `modao_action_log` VALUES ('41', '1', '1', '-1062731773', 'member', '1', 'admin在2018-01-25 09:53登录了后台', '1', '1516845184');
INSERT INTO `modao_action_log` VALUES ('42', '8', '1', '-1062731773', 'attribute', '39', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516845329');
INSERT INTO `modao_action_log` VALUES ('43', '8', '1', '-1062731773', 'attribute', '39', '操作url：/admin.php?s=/Attribute/remove/id/39.html', '1', '1516845334');
INSERT INTO `modao_action_log` VALUES ('44', '7', '1', '-1062731773', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1516845457');
INSERT INTO `modao_action_log` VALUES ('45', '1', '1', '-1062731773', 'member', '1', 'admin在2018-01-26 09:10登录了后台', '1', '1516929004');
INSERT INTO `modao_action_log` VALUES ('46', '8', '1', '-1062731773', 'attribute', '38', '操作url：/admin.php?s=/Attribute/remove/id/38.html', '1', '1516929045');
INSERT INTO `modao_action_log` VALUES ('47', '8', '1', '-1062731773', 'attribute', '23', '操作url：/admin.php?s=/Attribute/remove/id/23.html', '1', '1516929052');
INSERT INTO `modao_action_log` VALUES ('48', '8', '1', '-1062731773', 'attribute', '25', '操作url：/admin.php?s=/Attribute/remove/id/25.html', '1', '1516929061');
INSERT INTO `modao_action_log` VALUES ('49', '8', '1', '-1062731773', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516929235');
INSERT INTO `modao_action_log` VALUES ('50', '8', '1', '-1062731773', 'attribute', '41', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516929368');
INSERT INTO `modao_action_log` VALUES ('51', '7', '1', '-1062731773', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1516929841');
INSERT INTO `modao_action_log` VALUES ('52', '7', '1', '-1062731773', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1516930069');
INSERT INTO `modao_action_log` VALUES ('53', '7', '1', '-1062731773', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1516930899');
INSERT INTO `modao_action_log` VALUES ('54', '8', '1', '-1062731773', 'attribute', '24', '操作url：/admin.php?s=/Attribute/remove/id/24.html', '1', '1516930917');
INSERT INTO `modao_action_log` VALUES ('55', '8', '1', '-1062731773', 'attribute', '42', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516931018');
INSERT INTO `modao_action_log` VALUES ('56', '8', '1', '-1062731773', 'attribute', '43', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516931062');
INSERT INTO `modao_action_log` VALUES ('57', '8', '1', '-1062731773', 'attribute', '44', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516931110');
INSERT INTO `modao_action_log` VALUES ('58', '8', '1', '-1062731773', 'attribute', '45', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516931145');
INSERT INTO `modao_action_log` VALUES ('59', '7', '1', '-1062731773', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1516931201');
INSERT INTO `modao_action_log` VALUES ('60', '8', '1', '-1062731773', 'attribute', '45', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516931212');
INSERT INTO `modao_action_log` VALUES ('61', '8', '1', '-1062731773', 'attribute', '44', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516931219');
INSERT INTO `modao_action_log` VALUES ('62', '8', '1', '-1062731773', 'attribute', '43', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516931228');
INSERT INTO `modao_action_log` VALUES ('63', '8', '1', '-1062731773', 'attribute', '46', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516931963');
INSERT INTO `modao_action_log` VALUES ('64', '8', '1', '-1062731773', 'attribute', '47', '操作url：/admin.php?s=/Attribute/update.html', '1', '1516932204');
INSERT INTO `modao_action_log` VALUES ('65', '7', '1', '-1062731773', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1516932517');
INSERT INTO `modao_action_log` VALUES ('66', '11', '1', '-1062731773', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1516938042');
INSERT INTO `modao_action_log` VALUES ('67', '11', '1', '-1062731773', 'category', '2', '操作url：/admin.php?s=/Category/remove/id/2.html', '1', '1516938126');
INSERT INTO `modao_action_log` VALUES ('68', '11', '1', '-1062731773', 'category', '39', '操作url：/admin.php?s=/Category/add.html', '1', '1516938192');
INSERT INTO `modao_action_log` VALUES ('69', '11', '1', '-1062731773', 'category', '39', '操作url：/admin.php?s=/Category/edit.html', '1', '1516938496');
INSERT INTO `modao_action_log` VALUES ('70', '11', '1', '-1062731773', 'category', '39', '操作url：/admin.php?s=/Category/edit.html', '1', '1516938512');
INSERT INTO `modao_action_log` VALUES ('71', '11', '1', '-1062731773', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1516938535');
INSERT INTO `modao_action_log` VALUES ('72', '11', '1', '-1062731773', 'category', '40', '操作url：/admin.php?s=/Category/add.html', '1', '1516938668');
INSERT INTO `modao_action_log` VALUES ('73', '11', '1', '-1062731773', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1516939220');
INSERT INTO `modao_action_log` VALUES ('74', '11', '1', '-1062731773', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1516939301');
INSERT INTO `modao_action_log` VALUES ('75', '11', '1', '-1062731773', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1516939396');
INSERT INTO `modao_action_log` VALUES ('76', '11', '1', '-1062731773', 'category', '41', '操作url：/admin.php?s=/Category/add.html', '1', '1516939482');
INSERT INTO `modao_action_log` VALUES ('77', '11', '1', '-1062731773', 'category', '42', '操作url：/admin.php?s=/Category/add.html', '1', '1516939528');
INSERT INTO `modao_action_log` VALUES ('78', '11', '1', '-1062731773', 'category', '43', '操作url：/admin.php?s=/Category/add.html', '1', '1516939582');
INSERT INTO `modao_action_log` VALUES ('79', '11', '1', '-1062731773', 'category', '42', '操作url：/admin.php?s=/Category/edit.html', '1', '1516939589');
INSERT INTO `modao_action_log` VALUES ('80', '11', '1', '-1062731773', 'category', '43', '操作url：/admin.php?s=/Category/edit.html', '1', '1516939590');
INSERT INTO `modao_action_log` VALUES ('81', '11', '1', '-1062731773', 'category', '44', '操作url：/admin.php?s=/Category/add.html', '1', '1516939661');
INSERT INTO `modao_action_log` VALUES ('82', '11', '1', '-1062731773', 'category', '44', '操作url：/admin.php?s=/Category/edit.html', '1', '1516939667');
INSERT INTO `modao_action_log` VALUES ('83', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1518165359');
INSERT INTO `modao_action_log` VALUES ('84', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1518165369');
INSERT INTO `modao_action_log` VALUES ('85', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1518165388');
INSERT INTO `modao_action_log` VALUES ('86', '11', '1', '2130706433', 'category', '45', '操作url：/admin.php?s=/Category/add.html', '1', '1518165485');
INSERT INTO `modao_action_log` VALUES ('87', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/add.html', '1', '1518165542');
INSERT INTO `modao_action_log` VALUES ('88', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/edit.html', '1', '1518165546');
INSERT INTO `modao_action_log` VALUES ('89', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/edit.html', '1', '1518165682');
INSERT INTO `modao_action_log` VALUES ('90', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/edit.html', '1', '1518165744');
INSERT INTO `modao_action_log` VALUES ('91', '11', '1', '2130706433', 'category', '47', '操作url：/admin.php?s=/Category/add.html', '1', '1518165787');
INSERT INTO `modao_action_log` VALUES ('92', '11', '1', '2130706433', 'category', '48', '操作url：/admin.php?s=/Category/add.html', '1', '1518165934');
INSERT INTO `modao_action_log` VALUES ('93', '11', '1', '2130706433', 'category', '48', '操作url：/admin.php?s=/Category/edit.html', '1', '1518165944');
INSERT INTO `modao_action_log` VALUES ('94', '11', '1', '2130706433', 'category', '48', '操作url：/admin.php?s=/Category/edit.html', '1', '1518165962');
INSERT INTO `modao_action_log` VALUES ('95', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/edit.html', '1', '1518165980');
INSERT INTO `modao_action_log` VALUES ('96', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168316');
INSERT INTO `modao_action_log` VALUES ('97', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168370');
INSERT INTO `modao_action_log` VALUES ('98', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168406');
INSERT INTO `modao_action_log` VALUES ('99', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168455');
INSERT INTO `modao_action_log` VALUES ('100', '11', '1', '2130706433', 'category', '42', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168472');
INSERT INTO `modao_action_log` VALUES ('101', '11', '1', '2130706433', 'category', '42', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168521');
INSERT INTO `modao_action_log` VALUES ('102', '11', '1', '2130706433', 'category', '43', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168537');
INSERT INTO `modao_action_log` VALUES ('103', '11', '1', '2130706433', 'category', '43', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168562');
INSERT INTO `modao_action_log` VALUES ('104', '11', '1', '2130706433', 'category', '44', '操作url：/admin.php?s=/Category/remove/id/44.html', '1', '1518168572');
INSERT INTO `modao_action_log` VALUES ('105', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168603');
INSERT INTO `modao_action_log` VALUES ('106', '11', '1', '2130706433', 'category', '49', '操作url：/admin.php?s=/Category/add.html', '1', '1518168662');
INSERT INTO `modao_action_log` VALUES ('107', '11', '1', '2130706433', 'category', '49', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168672');
INSERT INTO `modao_action_log` VALUES ('108', '11', '1', '2130706433', 'category', '50', '操作url：/admin.php?s=/Category/add.html', '1', '1518168772');
INSERT INTO `modao_action_log` VALUES ('109', '11', '1', '2130706433', 'category', '50', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168780');
INSERT INTO `modao_action_log` VALUES ('110', '11', '1', '2130706433', 'category', '51', '操作url：/admin.php?s=/Category/add.html', '1', '1518168813');
INSERT INTO `modao_action_log` VALUES ('111', '11', '1', '2130706433', 'category', '52', '操作url：/admin.php?s=/Category/add.html', '1', '1518168845');
INSERT INTO `modao_action_log` VALUES ('112', '11', '1', '2130706433', 'category', '52', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168850');
INSERT INTO `modao_action_log` VALUES ('113', '11', '1', '2130706433', 'category', '53', '操作url：/admin.php?s=/Category/add.html', '1', '1518168923');
INSERT INTO `modao_action_log` VALUES ('114', '11', '1', '2130706433', 'category', '53', '操作url：/admin.php?s=/Category/edit.html', '1', '1518168930');
INSERT INTO `modao_action_log` VALUES ('115', '10', '1', '2130706433', 'Menu', '2', '操作url：/admin.php?s=/Menu/edit.html', '1', '1518169044');
INSERT INTO `modao_action_log` VALUES ('116', '10', '1', '2130706433', 'Menu', '2', '操作url：/admin.php?s=/Menu/edit.html', '1', '1518169169');
INSERT INTO `modao_action_log` VALUES ('117', '1', '1', '2130706433', 'member', '1', 'admin在2018-02-09 17:40登录了后台', '1', '1518169244');
INSERT INTO `modao_action_log` VALUES ('118', '1', '1', '2130706433', 'member', '1', 'admin在2018-02-10 09:22登录了后台', '1', '1518225763');
INSERT INTO `modao_action_log` VALUES ('119', '6', '1', '2130706433', 'config', '4', '操作url：/admin.php?s=/Config/edit.html', '1', '1518228969');
INSERT INTO `modao_action_log` VALUES ('120', '6', '1', '2130706433', 'config', '0', '操作url：/admin.php?s=/Config/del/id/43.html', '1', '1518228980');
INSERT INTO `modao_action_log` VALUES ('121', '6', '1', '2130706433', 'config', '0', '操作url：/admin.php?s=/Config/del/id/42.html', '1', '1518228984');
INSERT INTO `modao_action_log` VALUES ('122', '6', '1', '2130706433', 'config', '0', '操作url：/admin.php?s=/Config/del/id/41.html', '1', '1518228987');
INSERT INTO `modao_action_log` VALUES ('123', '6', '1', '2130706433', 'config', '0', '操作url：/admin.php?s=/Config/del/id/40.html', '1', '1518228996');
INSERT INTO `modao_action_log` VALUES ('124', '6', '1', '2130706433', 'config', '0', '操作url：/admin.php?s=/Config/del/id/39.html', '1', '1518229000');
INSERT INTO `modao_action_log` VALUES ('125', '6', '1', '2130706433', 'config', '0', '操作url：/admin.php?s=/Config/del/id/38.html', '1', '1518229004');
INSERT INTO `modao_action_log` VALUES ('126', '6', '1', '2130706433', 'config', '3', '操作url：/admin.php?s=/Config/edit.html', '1', '1518229081');
INSERT INTO `modao_action_log` VALUES ('127', '6', '1', '2130706433', 'config', '2', '操作url：/admin.php?s=/Config/edit.html', '1', '1518229108');
INSERT INTO `modao_action_log` VALUES ('128', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1518229291');
INSERT INTO `modao_action_log` VALUES ('129', '8', '1', '2130706433', 'attribute', '49', '操作url：/admin.php?s=/Attribute/update.html', '1', '1518229688');
INSERT INTO `modao_action_log` VALUES ('130', '8', '1', '2130706433', 'attribute', '50', '操作url：/admin.php?s=/Attribute/update.html', '1', '1518229721');
INSERT INTO `modao_action_log` VALUES ('131', '8', '1', '2130706433', 'attribute', '51', '操作url：/admin.php?s=/Attribute/update.html', '1', '1518229769');
INSERT INTO `modao_action_log` VALUES ('132', '8', '1', '2130706433', 'attribute', '52', '操作url：/admin.php?s=/Attribute/update.html', '1', '1518229795');
INSERT INTO `modao_action_log` VALUES ('133', '8', '1', '2130706433', 'attribute', '53', '操作url：/admin.php?s=/Attribute/update.html', '1', '1518229868');
INSERT INTO `modao_action_log` VALUES ('134', '8', '1', '2130706433', 'attribute', '54', '操作url：/admin.php?s=/Attribute/update.html', '1', '1518229932');
INSERT INTO `modao_action_log` VALUES ('135', '8', '1', '2130706433', 'attribute', '55', '操作url：/admin.php?s=/Attribute/update.html', '1', '1518230204');
INSERT INTO `modao_action_log` VALUES ('136', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1518230308');
INSERT INTO `modao_action_log` VALUES ('137', '8', '1', '2130706433', 'attribute', '56', '操作url：/admin.php?s=/Attribute/update.html', '1', '1518230352');
INSERT INTO `modao_action_log` VALUES ('138', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1518230392');
INSERT INTO `modao_action_log` VALUES ('139', '11', '1', '2130706433', 'category', '54', '操作url：/admin.php?s=/Category/add.html', '1', '1518230544');
INSERT INTO `modao_action_log` VALUES ('140', '1', '1', '2130706433', 'member', '1', 'admin在2018-02-23 09:01登录了后台', '1', '1519347712');
INSERT INTO `modao_action_log` VALUES ('141', '1', '1', '2130706433', 'member', '1', 'admin在2018-02-24 09:10登录了后台', '1', '1519434614');
INSERT INTO `modao_action_log` VALUES ('142', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1519434676');
INSERT INTO `modao_action_log` VALUES ('143', '11', '1', '2130706433', 'category', '45', '操作url：/admin.php?s=/Category/edit.html', '1', '1519434685');
INSERT INTO `modao_action_log` VALUES ('144', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/edit.html', '1', '1519434694');
INSERT INTO `modao_action_log` VALUES ('145', '7', '1', '2130706433', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1519436378');
INSERT INTO `modao_action_log` VALUES ('146', '7', '1', '2130706433', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1519436422');
INSERT INTO `modao_action_log` VALUES ('147', '8', '1', '2130706433', 'attribute', '57', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519436466');
INSERT INTO `modao_action_log` VALUES ('148', '8', '1', '2130706433', 'attribute', '58', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519436546');
INSERT INTO `modao_action_log` VALUES ('149', '8', '1', '2130706433', 'attribute', '59', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519436577');
INSERT INTO `modao_action_log` VALUES ('150', '8', '1', '2130706433', 'attribute', '60', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519436601');
INSERT INTO `modao_action_log` VALUES ('151', '8', '1', '2130706433', 'attribute', '62', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519436708');
INSERT INTO `modao_action_log` VALUES ('152', '8', '1', '2130706433', 'attribute', '63', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519436730');
INSERT INTO `modao_action_log` VALUES ('153', '8', '1', '2130706433', 'attribute', '64', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519436924');
INSERT INTO `modao_action_log` VALUES ('154', '8', '1', '2130706433', 'attribute', '65', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519437257');
INSERT INTO `modao_action_log` VALUES ('155', '8', '1', '2130706433', 'attribute', '66', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519437319');
INSERT INTO `modao_action_log` VALUES ('156', '8', '1', '2130706433', 'attribute', '66', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519437333');
INSERT INTO `modao_action_log` VALUES ('157', '11', '1', '2130706433', 'category', '54', '操作url：/admin.php?s=/Category/edit.html', '1', '1519437378');
INSERT INTO `modao_action_log` VALUES ('158', '7', '1', '2130706433', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1519437475');
INSERT INTO `modao_action_log` VALUES ('159', '8', '1', '2130706433', 'attribute', '65', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519439569');
INSERT INTO `modao_action_log` VALUES ('160', '7', '1', '2130706433', 'model', '6', '操作url：/admin.php?s=/Model/update.html', '1', '1519441314');
INSERT INTO `modao_action_log` VALUES ('161', '7', '1', '2130706433', 'model', '6', '操作url：/admin.php?s=/Model/update.html', '1', '1519441340');
INSERT INTO `modao_action_log` VALUES ('162', '7', '1', '2130706433', 'model', '6', '操作url：/admin.php?s=/Model/update.html', '1', '1519441374');
INSERT INTO `modao_action_log` VALUES ('163', '7', '1', '2130706433', 'model', '6', '操作url：/admin.php?s=/Model/update.html', '1', '1519441398');
INSERT INTO `modao_action_log` VALUES ('164', '8', '1', '2130706433', 'attribute', '67', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519441494');
INSERT INTO `modao_action_log` VALUES ('165', '7', '1', '2130706433', 'model', '6', '操作url：/admin.php?s=/Model/update.html', '1', '1519441509');
INSERT INTO `modao_action_log` VALUES ('166', '11', '1', '2130706433', 'category', '45', '操作url：/admin.php?s=/Category/edit.html', '1', '1519441527');
INSERT INTO `modao_action_log` VALUES ('167', '11', '1', '2130706433', 'category', '54', '操作url：/admin.php?s=/Category/edit.html', '1', '1519444237');
INSERT INTO `modao_action_log` VALUES ('168', '7', '1', '2130706433', 'model', '7', '操作url：/admin.php?s=/Model/update.html', '1', '1519444787');
INSERT INTO `modao_action_log` VALUES ('169', '7', '1', '2130706433', 'model', '7', '操作url：/admin.php?s=/Model/update.html', '1', '1519444808');
INSERT INTO `modao_action_log` VALUES ('170', '7', '1', '2130706433', 'model', '7', '操作url：/admin.php?s=/Model/update.html', '1', '1519444839');
INSERT INTO `modao_action_log` VALUES ('171', '8', '1', '2130706433', 'attribute', '68', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519451587');
INSERT INTO `modao_action_log` VALUES ('172', '8', '1', '2130706433', 'attribute', '69', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519451606');
INSERT INTO `modao_action_log` VALUES ('173', '8', '1', '2130706433', 'attribute', '70', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519451636');
INSERT INTO `modao_action_log` VALUES ('174', '8', '1', '2130706433', 'attribute', '71', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519451756');
INSERT INTO `modao_action_log` VALUES ('175', '8', '1', '2130706433', 'attribute', '72', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519451775');
INSERT INTO `modao_action_log` VALUES ('176', '8', '1', '2130706433', 'attribute', '73', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519451804');
INSERT INTO `modao_action_log` VALUES ('177', '8', '1', '2130706433', 'attribute', '74', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519451907');
INSERT INTO `modao_action_log` VALUES ('178', '8', '1', '2130706433', 'attribute', '74', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519452036');
INSERT INTO `modao_action_log` VALUES ('179', '8', '1', '2130706433', 'attribute', '75', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519452072');
INSERT INTO `modao_action_log` VALUES ('180', '8', '1', '2130706433', 'attribute', '75', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519452099');
INSERT INTO `modao_action_log` VALUES ('181', '8', '1', '2130706433', 'attribute', '76', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519452142');
INSERT INTO `modao_action_log` VALUES ('182', '8', '1', '2130706433', 'attribute', '77', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519452406');
INSERT INTO `modao_action_log` VALUES ('183', '8', '1', '2130706433', 'attribute', '78', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519452559');
INSERT INTO `modao_action_log` VALUES ('184', '8', '1', '2130706433', 'attribute', '79', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519452652');
INSERT INTO `modao_action_log` VALUES ('185', '7', '1', '2130706433', 'model', '7', '操作url：/admin.php?s=/Model/update.html', '1', '1519452734');
INSERT INTO `modao_action_log` VALUES ('186', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/edit.html', '1', '1519452812');
INSERT INTO `modao_action_log` VALUES ('187', '11', '1', '2130706433', 'category', '53', '操作url：/admin.php?s=/Category/edit.html', '1', '1519456956');
INSERT INTO `modao_action_log` VALUES ('188', '7', '1', '2130706433', 'model', '8', '操作url：/admin.php?s=/Model/update.html', '1', '1519457434');
INSERT INTO `modao_action_log` VALUES ('189', '7', '1', '2130706433', 'model', '8', '操作url：/admin.php?s=/Model/update.html', '1', '1519457459');
INSERT INTO `modao_action_log` VALUES ('190', '7', '1', '2130706433', 'model', '8', '操作url：/admin.php?s=/Model/update.html', '1', '1519457503');
INSERT INTO `modao_action_log` VALUES ('191', '8', '1', '2130706433', 'attribute', '80', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519457609');
INSERT INTO `modao_action_log` VALUES ('192', '8', '1', '2130706433', 'attribute', '81', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519457931');
INSERT INTO `modao_action_log` VALUES ('193', '8', '1', '2130706433', 'attribute', '82', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519458226');
INSERT INTO `modao_action_log` VALUES ('194', '8', '1', '2130706433', 'attribute', '83', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519458916');
INSERT INTO `modao_action_log` VALUES ('195', '7', '1', '2130706433', 'model', '8', '操作url：/admin.php?s=/Model/update.html', '1', '1519459162');
INSERT INTO `modao_action_log` VALUES ('196', '11', '1', '2130706433', 'category', '53', '操作url：/admin.php?s=/Category/edit.html', '1', '1519459369');
INSERT INTO `modao_action_log` VALUES ('197', '7', '1', '2130706433', 'model', '8', '操作url：/admin.php?s=/Model/update.html', '1', '1519459427');
INSERT INTO `modao_action_log` VALUES ('198', '7', '1', '2130706433', 'model', '8', '操作url：/admin.php?s=/Model/update.html', '1', '1519459459');
INSERT INTO `modao_action_log` VALUES ('199', '1', '1', '2130706433', 'member', '1', 'admin在2018-02-26 09:12登录了后台', '1', '1519607531');
INSERT INTO `modao_action_log` VALUES ('200', '11', '1', '2130706433', 'category', '53', '操作url：/admin.php?s=/Category/edit.html', '1', '1519610750');
INSERT INTO `modao_action_log` VALUES ('201', '1', '1', '2130706433', 'member', '1', 'admin在2018-02-27 09:09登录了后台', '1', '1519693769');
INSERT INTO `modao_action_log` VALUES ('202', '7', '1', '2130706433', 'model', '9', '操作url：/admin.php?s=/Model/update.html', '1', '1519702986');
INSERT INTO `modao_action_log` VALUES ('203', '7', '1', '2130706433', 'model', '9', '操作url：/admin.php?s=/Model/update.html', '1', '1519703013');
INSERT INTO `modao_action_log` VALUES ('204', '7', '1', '2130706433', 'model', '9', '操作url：/admin.php?s=/Model/update.html', '1', '1519703044');
INSERT INTO `modao_action_log` VALUES ('205', '8', '1', '2130706433', 'attribute', '84', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519703122');
INSERT INTO `modao_action_log` VALUES ('206', '8', '1', '2130706433', 'attribute', '85', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519703149');
INSERT INTO `modao_action_log` VALUES ('207', '11', '1', '2130706433', 'category', '47', '操作url：/admin.php?s=/Category/edit.html', '1', '1519703166');
INSERT INTO `modao_action_log` VALUES ('208', '7', '1', '2130706433', 'model', '9', '操作url：/admin.php?s=/Model/update.html', '1', '1519703198');
INSERT INTO `modao_action_log` VALUES ('209', '11', '1', '2130706433', 'category', '47', '操作url：/admin.php?s=/Category/edit.html', '1', '1519703621');
INSERT INTO `modao_action_log` VALUES ('210', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/edit.html', '1', '1519710629');
INSERT INTO `modao_action_log` VALUES ('211', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/edit.html', '1', '1519710651');
INSERT INTO `modao_action_log` VALUES ('212', '7', '1', '2130706433', 'model', '9', '操作url：/admin.php?s=/Model/update.html', '1', '1519711120');
INSERT INTO `modao_action_log` VALUES ('213', '7', '1', '2130706433', 'model', '10', '操作url：/admin.php?s=/Model/update.html', '1', '1519711347');
INSERT INTO `modao_action_log` VALUES ('214', '7', '1', '2130706433', 'model', '10', '操作url：/admin.php?s=/Model/update.html', '1', '1519711379');
INSERT INTO `modao_action_log` VALUES ('215', '7', '1', '2130706433', 'model', '10', '操作url：/admin.php?s=/Model/update.html', '1', '1519711417');
INSERT INTO `modao_action_log` VALUES ('216', '8', '1', '2130706433', 'attribute', '87', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519711486');
INSERT INTO `modao_action_log` VALUES ('217', '8', '1', '2130706433', 'attribute', '88', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519711541');
INSERT INTO `modao_action_log` VALUES ('218', '7', '1', '2130706433', 'model', '10', '操作url：/admin.php?s=/Model/update.html', '1', '1519711556');
INSERT INTO `modao_action_log` VALUES ('219', '11', '1', '2130706433', 'category', '48', '操作url：/admin.php?s=/Category/edit.html', '1', '1519711581');
INSERT INTO `modao_action_log` VALUES ('220', '8', '1', '2130706433', 'attribute', '47', '操作url：/admin.php?s=/Attribute/remove/id/47.html', '1', '1519713022');
INSERT INTO `modao_action_log` VALUES ('221', '8', '1', '2130706433', 'attribute', '46', '操作url：/admin.php?s=/Attribute/remove/id/46.html', '1', '1519713028');
INSERT INTO `modao_action_log` VALUES ('222', '8', '1', '2130706433', 'attribute', '26', '操作url：/admin.php?s=/Attribute/remove/id/26.html', '1', '1519713032');
INSERT INTO `modao_action_log` VALUES ('223', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin.php?s=/Attribute/remove/id/34.html', '1', '1519713034');
INSERT INTO `modao_action_log` VALUES ('224', '8', '1', '2130706433', 'attribute', '36', '操作url：/admin.php?s=/Attribute/remove/id/36.html', '1', '1519713036');
INSERT INTO `modao_action_log` VALUES ('225', '8', '1', '2130706433', 'attribute', '37', '操作url：/admin.php?s=/Attribute/remove/id/37.html', '1', '1519713038');
INSERT INTO `modao_action_log` VALUES ('226', '8', '1', '2130706433', 'attribute', '41', '操作url：/admin.php?s=/Attribute/remove/id/41.html', '1', '1519713040');
INSERT INTO `modao_action_log` VALUES ('227', '8', '1', '2130706433', 'attribute', '45', '操作url：/admin.php?s=/Attribute/remove/id/45.html', '1', '1519713045');
INSERT INTO `modao_action_log` VALUES ('228', '8', '1', '2130706433', 'attribute', '44', '操作url：/admin.php?s=/Attribute/remove/id/44.html', '1', '1519713048');
INSERT INTO `modao_action_log` VALUES ('229', '8', '1', '2130706433', 'attribute', '43', '操作url：/admin.php?s=/Attribute/remove/id/43.html', '1', '1519713052');
INSERT INTO `modao_action_log` VALUES ('230', '8', '1', '2130706433', 'attribute', '42', '操作url：/admin.php?s=/Attribute/remove/id/42.html', '1', '1519713055');
INSERT INTO `modao_action_log` VALUES ('231', '8', '1', '2130706433', 'attribute', '89', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519713123');
INSERT INTO `modao_action_log` VALUES ('232', '8', '1', '2130706433', 'attribute', '90', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519713276');
INSERT INTO `modao_action_log` VALUES ('233', '8', '1', '2130706433', 'attribute', '91', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519713318');
INSERT INTO `modao_action_log` VALUES ('234', '8', '1', '2130706433', 'attribute', '91', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519713356');
INSERT INTO `modao_action_log` VALUES ('235', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1519713838');
INSERT INTO `modao_action_log` VALUES ('236', '8', '1', '2130706433', 'attribute', '92', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519713878');
INSERT INTO `modao_action_log` VALUES ('237', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1519713981');
INSERT INTO `modao_action_log` VALUES ('238', '11', '1', '2130706433', 'category', '49', '操作url：/admin.php?s=/Category/edit.html', '1', '1519716327');
INSERT INTO `modao_action_log` VALUES ('239', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1519718818');
INSERT INTO `modao_action_log` VALUES ('240', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1519718856');
INSERT INTO `modao_action_log` VALUES ('241', '7', '1', '2130706433', 'model', '11', '操作url：/admin.php?s=/Model/update.html', '1', '1519719469');
INSERT INTO `modao_action_log` VALUES ('242', '7', '1', '2130706433', 'model', '11', '操作url：/admin.php?s=/Model/update.html', '1', '1519719497');
INSERT INTO `modao_action_log` VALUES ('243', '7', '1', '2130706433', 'model', '11', '操作url：/admin.php?s=/Model/update.html', '1', '1519719535');
INSERT INTO `modao_action_log` VALUES ('244', '8', '1', '2130706433', 'attribute', '93', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519719564');
INSERT INTO `modao_action_log` VALUES ('245', '8', '1', '2130706433', 'attribute', '94', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519719618');
INSERT INTO `modao_action_log` VALUES ('246', '8', '1', '2130706433', 'attribute', '95', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519719658');
INSERT INTO `modao_action_log` VALUES ('247', '7', '1', '2130706433', 'model', '11', '操作url：/admin.php?s=/Model/update.html', '1', '1519719677');
INSERT INTO `modao_action_log` VALUES ('248', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1519720087');
INSERT INTO `modao_action_log` VALUES ('249', '11', '1', '2130706433', 'category', '43', '操作url：/admin.php?s=/Category/edit.html', '1', '1519721076');
INSERT INTO `modao_action_log` VALUES ('250', '7', '1', '2130706433', 'model', '12', '操作url：/admin.php?s=/Model/update.html', '1', '1519722495');
INSERT INTO `modao_action_log` VALUES ('251', '7', '1', '2130706433', 'model', '12', '操作url：/admin.php?s=/Model/update.html', '1', '1519722513');
INSERT INTO `modao_action_log` VALUES ('252', '7', '1', '2130706433', 'model', '12', '操作url：/admin.php?s=/Model/update.html', '1', '1519722548');
INSERT INTO `modao_action_log` VALUES ('253', '8', '1', '2130706433', 'attribute', '96', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519722585');
INSERT INTO `modao_action_log` VALUES ('254', '8', '1', '2130706433', 'attribute', '97', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519722604');
INSERT INTO `modao_action_log` VALUES ('255', '8', '1', '2130706433', 'attribute', '98', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519722633');
INSERT INTO `modao_action_log` VALUES ('256', '7', '1', '2130706433', 'model', '12', '操作url：/admin.php?s=/Model/update.html', '1', '1519722646');
INSERT INTO `modao_action_log` VALUES ('257', '11', '1', '2130706433', 'category', '42', '操作url：/admin.php?s=/Category/edit.html', '1', '1519722667');
INSERT INTO `modao_action_log` VALUES ('258', '8', '1', '2130706433', 'attribute', '97', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519722753');
INSERT INTO `modao_action_log` VALUES ('259', '11', '1', '2130706433', 'category', '50', '操作url：/admin.php?s=/Category/edit.html', '1', '1519723596');
INSERT INTO `modao_action_log` VALUES ('260', '8', '1', '2130706433', 'attribute', '99', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519723755');
INSERT INTO `modao_action_log` VALUES ('261', '7', '1', '2130706433', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1519723771');
INSERT INTO `modao_action_log` VALUES ('262', '7', '1', '2130706433', 'model', '13', '操作url：/admin.php?s=/Model/update.html', '1', '1519724716');
INSERT INTO `modao_action_log` VALUES ('263', '7', '1', '2130706433', 'model', '13', '操作url：/admin.php?s=/Model/update.html', '1', '1519724742');
INSERT INTO `modao_action_log` VALUES ('264', '7', '1', '2130706433', 'model', '13', '操作url：/admin.php?s=/Model/update.html', '1', '1519724778');
INSERT INTO `modao_action_log` VALUES ('265', '8', '1', '2130706433', 'attribute', '100', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519724817');
INSERT INTO `modao_action_log` VALUES ('266', '8', '1', '2130706433', 'attribute', '101', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519724840');
INSERT INTO `modao_action_log` VALUES ('267', '7', '1', '2130706433', 'model', '13', '操作url：/admin.php?s=/Model/update.html', '1', '1519724872');
INSERT INTO `modao_action_log` VALUES ('268', '11', '1', '2130706433', 'category', '52', '操作url：/admin.php?s=/Category/edit.html', '1', '1519724918');
INSERT INTO `modao_action_log` VALUES ('269', '7', '1', '2130706433', 'model', '13', '操作url：/admin.php?s=/Model/update.html', '1', '1519724949');
INSERT INTO `modao_action_log` VALUES ('270', '7', '1', '2130706433', 'model', '14', '操作url：/admin.php?s=/Model/update.html', '1', '1519725138');
INSERT INTO `modao_action_log` VALUES ('271', '7', '1', '2130706433', 'model', '14', '操作url：/admin.php?s=/Model/update.html', '1', '1519725166');
INSERT INTO `modao_action_log` VALUES ('272', '8', '1', '2130706433', 'attribute', '102', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519725311');
INSERT INTO `modao_action_log` VALUES ('273', '7', '1', '2130706433', 'model', '14', '操作url：/admin.php?s=/Model/update.html', '1', '1519725326');
INSERT INTO `modao_action_log` VALUES ('274', '11', '1', '2130706433', 'category', '52', '操作url：/admin.php?s=/Category/edit.html', '1', '1519725344');
INSERT INTO `modao_action_log` VALUES ('275', '7', '1', '2130706433', 'model', '14', '操作url：/admin.php?s=/Model/update.html', '1', '1519725394');
INSERT INTO `modao_action_log` VALUES ('276', '8', '1', '2130706433', 'attribute', '103', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519725432');
INSERT INTO `modao_action_log` VALUES ('277', '7', '1', '2130706433', 'model', '14', '操作url：/admin.php?s=/Model/update.html', '1', '1519725446');
INSERT INTO `modao_action_log` VALUES ('278', '1', '1', '2130706433', 'member', '1', 'admin在2018-02-28 08:59登录了后台', '1', '1519779569');
INSERT INTO `modao_action_log` VALUES ('279', '7', '1', '2130706433', 'model', '15', '操作url：/admin.php?s=/Model/update.html', '1', '1519781810');
INSERT INTO `modao_action_log` VALUES ('280', '7', '1', '2130706433', 'model', '15', '操作url：/admin.php?s=/Model/update.html', '1', '1519781895');
INSERT INTO `modao_action_log` VALUES ('281', '8', '1', '2130706433', 'attribute', '104', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519781923');
INSERT INTO `modao_action_log` VALUES ('282', '8', '1', '2130706433', 'attribute', '105', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519781968');
INSERT INTO `modao_action_log` VALUES ('283', '8', '1', '2130706433', 'attribute', '106', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519782010');
INSERT INTO `modao_action_log` VALUES ('284', '8', '1', '2130706433', 'attribute', '107', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519782043');
INSERT INTO `modao_action_log` VALUES ('285', '8', '1', '2130706433', 'attribute', '108', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519782067');
INSERT INTO `modao_action_log` VALUES ('286', '7', '1', '2130706433', 'model', '15', '操作url：/admin.php?s=/Model/update.html', '1', '1519782165');
INSERT INTO `modao_action_log` VALUES ('287', '11', '1', '2130706433', 'category', '51', '操作url：/admin.php?s=/Category/edit.html', '1', '1519782209');
INSERT INTO `modao_action_log` VALUES ('288', '7', '1', '2130706433', 'model', '16', '操作url：/admin.php?s=/Model/update.html', '1', '1519782333');
INSERT INTO `modao_action_log` VALUES ('289', '7', '1', '2130706433', 'model', '16', '操作url：/admin.php?s=/Model/update.html', '1', '1519782364');
INSERT INTO `modao_action_log` VALUES ('290', '7', '1', '2130706433', 'model', '16', '操作url：/admin.php?s=/Model/update.html', '1', '1519782446');
INSERT INTO `modao_action_log` VALUES ('291', '8', '1', '2130706433', 'attribute', '109', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519782478');
INSERT INTO `modao_action_log` VALUES ('292', '7', '1', '2130706433', 'model', '16', '操作url：/admin.php?s=/Model/update.html', '1', '1519782502');
INSERT INTO `modao_action_log` VALUES ('293', '11', '1', '2130706433', 'category', '51', '操作url：/admin.php?s=/Category/edit.html', '1', '1519782516');
INSERT INTO `modao_action_log` VALUES ('294', '7', '1', '2130706433', 'model', '16', '操作url：/admin.php?s=/Model/update.html', '1', '1519782577');
INSERT INTO `modao_action_log` VALUES ('295', '7', '1', '2130706433', 'model', '16', '操作url：/admin.php?s=/Model/update.html', '1', '1519782606');
INSERT INTO `modao_action_log` VALUES ('296', '7', '1', '2130706433', 'model', '1', '操作url：/admin.php?s=/Model/update.html', '1', '1519782642');
INSERT INTO `modao_action_log` VALUES ('297', '1', '1', '2130706433', 'member', '1', 'admin在2018-02-28 10:34登录了后台', '1', '1519785251');
INSERT INTO `modao_action_log` VALUES ('298', '7', '1', '2130706433', 'model', '16', '操作url：/admin.php?s=/Model/update.html', '1', '1519785489');
INSERT INTO `modao_action_log` VALUES ('299', '8', '1', '2130706433', 'attribute', '109', '操作url：/admin.php?s=/Attribute/update.html', '1', '1519785564');
INSERT INTO `modao_action_log` VALUES ('300', '7', '1', '2130706433', 'model', '16', '操作url：/admin.php?s=/Model/update.html', '1', '1519785667');
INSERT INTO `modao_action_log` VALUES ('301', '7', '1', '2130706433', 'model', '16', '操作url：/admin.php?s=/Model/update.html', '1', '1519785701');

-- ----------------------------
-- Table structure for modao_addons
-- ----------------------------
DROP TABLE IF EXISTS `modao_addons`;
CREATE TABLE `modao_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of modao_addons
-- ----------------------------
INSERT INTO `modao_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `modao_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `modao_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `modao_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `modao_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `modao_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `modao_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for modao_attachment
-- ----------------------------
DROP TABLE IF EXISTS `modao_attachment`;
CREATE TABLE `modao_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of modao_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for modao_attribute
-- ----------------------------
DROP TABLE IF EXISTS `modao_attribute`;
CREATE TABLE `modao_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of modao_attribute
-- ----------------------------
INSERT INTO `modao_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `modao_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `modao_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `modao_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿\r\n4:推荐', '1', '0', '1', '1512613864', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `modao_attribute` VALUES ('91', 'laiyuan', '来源', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1519713356', '1519713318', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('92', 'contant', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '2', '0', '1', '1519713878', '1519713878', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('89', 'img', '封面图', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '303,179', '1', '', '2', '0', '1', '1519713123', '1519713123', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('90', 'leixing', '文章类型', 'varchar(100) NOT NULL', 'checkbox', '', '可多选，头条将展示在首页。', '1', '1:头条\r\n2:行业\r\n3:热点\r\n4:新闻', '2', '0', '1', '1519713276', '1519713276', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `modao_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `modao_attribute` VALUES ('98', 'contant', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '12', '0', '1', '1519722633', '1519722633', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('99', 'contant', '百度地图', 'text NOT NULL', 'editor', '', '', '1', '', '5', '0', '1', '1519723756', '1519723756', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('93', 'fu_title', '副标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '11', '0', '1', '1519719564', '1519719564', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('94', 'img', '封面图', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '549,486', '1', '', '11', '0', '1', '1519719618', '1519719618', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('95', 'contant', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '11', '0', '1', '1519719658', '1519719658', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('96', 'zhiwei', '职位', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '12', '0', '1', '1519722585', '1519722585', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('97', 'img', '封面图', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '255,256', '1', '', '12', '0', '1', '1519722754', '1519722604', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('57', 'about', '关于我们', 'text NOT NULL', 'textarea', '', '', '1', '', '5', '0', '1', '1519436466', '1519436466', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('58', 'phone', '电话', 'varchar(255) NOT NULL', 'string', '', '如：0731-88842500', '1', '', '5', '0', '1', '1519436546', '1519436546', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('59', 'fax', '传真', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '0', '1', '1519436577', '1519436577', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('60', 'email', '公司邮箱', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '0', '1', '1519436601', '1519436601', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('62', 'youbian', '邮编', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '0', '1', '1519436708', '1519436708', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('63', 'tel', '公司地址', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '0', '1', '1519436730', '1519436730', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('64', 'times', '工作时间', 'varchar(255) NOT NULL', 'string', '', '如：09:00-18:00', '1', '', '5', '0', '1', '1519436924', '1519436924', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('65', 'url', '友情链接', 'text NOT NULL', 'textarea', '', '如： 百度&https//www.baidu.com; （不同的链接用英文字符隔开）', '1', '', '5', '0', '1', '1519439569', '1519437257', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('66', 'wx', '微信公众号', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '108,108', '1', '', '5', '0', '1', '1519437333', '1519437320', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('67', 'banner', '首页banner', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '1920,978', '1', '', '6', '0', '1', '1519441494', '1519441494', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('68', 'title_1', '优势-标题-1', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '7', '0', '1', '1519451587', '1519451587', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('69', 'title_2', '优势-标题-2', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '7', '0', '1', '1519451606', '1519451606', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('70', 'title_3', '优势-标题-3', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '7', '0', '1', '1519451636', '1519451636', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('71', 'miaoshu_1', '优势-描述-1', 'text NOT NULL', 'textarea', '', '', '1', '', '7', '0', '1', '1519451756', '1519451756', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('72', 'miaoshu_2', '优势-描述-2', 'text NOT NULL', 'textarea', '', '', '1', '', '7', '0', '1', '1519451775', '1519451775', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('73', 'miaoshu_3', '优势-描述-3', 'text NOT NULL', 'textarea', '', '', '1', '', '7', '0', '1', '1519451804', '1519451804', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('74', 'tubiao_1', '优势-小图标-1', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '30,30', '1', '', '7', '0', '1', '1519452036', '1519451907', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('75', 'tubiao_2', '优势-小图标-2', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '136,136', '1', '', '7', '0', '1', '1519452099', '1519452073', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('76', 'tubiao_3', '优势-小图标-3', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '30,30', '1', '', '7', '0', '1', '1519452142', '1519452142', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('77', 'img_1', '优势-大图片-1', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '958,340', '1', '', '7', '0', '1', '1519452406', '1519452406', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('78', 'img_2', '优势-大图片-2', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '598,446', '1', '', '7', '0', '1', '1519452559', '1519452559', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('79', 'img_3', '优势-大图片-3', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '300,319', '1', '', '7', '0', '1', '1519452652', '1519452652', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('80', 'laiyuan', '文章来源', 'varchar(255) NOT NULL', 'string', '莫道建站', '', '1', '', '8', '0', '1', '1519457609', '1519457609', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('81', 'contant', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '8', '0', '1', '1519457931', '1519457931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('82', 'leixing', '文章类型', 'varchar(100) NOT NULL', 'checkbox', '', '', '1', '1:建筑\r\n2:景观\r\n3:艺术\r\n4:设计\r\n', '8', '0', '1', '1519458226', '1519458226', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('83', 'img', '封面图', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '344,206', '1', '', '8', '0', '1', '1519458916', '1519458916', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('84', 'img', '封面图', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '490,340', '1', '', '9', '0', '1', '1519703122', '1519703122', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('85', 'contant', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '9', '0', '1', '1519703150', '1519703150', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('87', 'url', 'URL', 'varchar(255) NOT NULL', 'string', '', '如：http://www.moodao.com', '1', '', '10', '0', '1', '1519711486', '1519711486', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('88', 'img', '图片', 'int(10) UNSIGNED NOT NULL', 'img_caijian', '', '162,26', '1', '', '10', '0', '1', '1519711541', '1519711541', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('103', 'xiangqing', '招聘详情', 'text NOT NULL', 'editor', '', '', '1', '', '14', '0', '1', '1519725432', '1519725432', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('102', 'jianjie', '招聘简介', 'text NOT NULL', 'editor', '', '', '1', '', '14', '0', '1', '1519725311', '1519725311', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `modao_attribute` VALUES ('109', 'phone', '手机', 'int(10) UNSIGNED NOT NULL', 'string', '', '', '1', '', '16', '0', '1', '1519785564', '1519782478', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for modao_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `modao_auth_extend`;
CREATE TABLE `modao_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of modao_auth_extend
-- ----------------------------
INSERT INTO `modao_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `modao_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `modao_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `modao_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `modao_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `modao_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `modao_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `modao_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for modao_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `modao_auth_group`;
CREATE TABLE `modao_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modao_auth_group
-- ----------------------------
INSERT INTO `modao_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `modao_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for modao_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `modao_auth_group_access`;
CREATE TABLE `modao_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modao_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for modao_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `modao_auth_rule`;
CREATE TABLE `modao_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modao_auth_rule
-- ----------------------------
INSERT INTO `modao_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/index', '内容', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/examine', '审核列表', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `modao_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('217', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `modao_auth_rule` VALUES ('218', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');

-- ----------------------------
-- Table structure for modao_category
-- ----------------------------
DROP TABLE IF EXISTS `modao_category`;
CREATE TABLE `modao_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  `url` varchar(255) NOT NULL COMMENT '外链',
  `banner_jianjie` varchar(255) NOT NULL COMMENT 'banner简介',
  `banner_title` varchar(255) NOT NULL COMMENT 'banner标题',
  `e_name` varchar(255) NOT NULL COMMENT '英文名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of modao_category
-- ----------------------------
INSERT INTO `modao_category` VALUES ('1', 'blog', '首页', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '2,1', '0', '0', '2', '0', '0', '1', '', '1379474947', '1519434676', '1', '90', '', '', '提供多类行业主题选择，跨终端适配 PC、平板、手机一次搞定', '艺术品级响应式模板', '');
INSERT INTO `modao_category` VALUES ('39', 'home', '我们的服务', '0', '1', '10', '', '', '', '', 'fuwu', '', '', '2', '2', '2', '0', '0', '1', '0', '0', '', null, '1516938192', '1519710651', '1', '91', '', '', '', '', 'COMPANY SERVICE');
INSERT INTO `modao_category` VALUES ('40', 'abouts', '关于我们', '0', '3', '10', '', '', '', '', 'about', '', '', '2', '2', '2,1', '0', '0', '1', '0', '0', '', null, '1516938668', '1519718856', '1', '92', '', '', '', '', 'ABOUT US');
INSERT INTO `modao_category` VALUES ('41', 'about', '简介', '40', '0', '10', '', '', '', '', 'about', '', '', '11', '11', '2,1', '0', '1', '1', '0', '0', '', null, '1516939482', '1519720087', '1', '90', '', '', '崇尚创意是我们的活力和根源。因为努力和真诚，有更多的客户群和我们聚集在一起！', '莫道网络简介', '');
INSERT INTO `modao_category` VALUES ('42', 'us', '我们的团队', '40', '1', '10', '', '', '', '', '', '', '', '12', '12', '2,1', '0', '1', '1', '0', '0', '', null, '1516939528', '1519722667', '1', '90', '', '', '', '', 'us');
INSERT INTO `modao_category` VALUES ('53', 'case', '公司案例', '0', '5', '9', '', '', '', '', 'case', '', '', '8', '8', '2,1', '0', '1', '1', '0', '0', '', null, '1518168923', '1519610750', '1', '95', '', '', '', '', 'COMPANY CASE');
INSERT INTO `modao_category` VALUES ('43', 'licheng', '发展历程', '40', '2', '10', '', '', '', '', '', '', '', '11', '11', '2,1', '0', '1', '1', '0', '0', '', null, '1516939582', '1519721076', '1', '90', '', '', '', '', 'licheng');
INSERT INTO `modao_category` VALUES ('51', 'lianxi', '联系我们', '50', '0', '10', '', '', '', '', '', '', '', '16', '16', '2,1', '0', '2', '1', '0', '1', '', null, '1518168813', '1519782516', '1', '0', '', '', '', '', 'lianxi');
INSERT INTO `modao_category` VALUES ('49', 'news', '新闻动态', '0', '2', '6', '', '', '', '', '', '', '', '2', '2', '2,1', '0', '1', '1', '0', '0', '', null, '1518168662', '1519716327', '1', '93', '', '', '', '', 'NEWS INFORMATION');
INSERT INTO `modao_category` VALUES ('50', 'contact', '联系我们', '0', '4', '10', '', '', '', '', 'contact', '', '', '2', '2', '2,1', '0', '0', '1', '0', '0', '', null, '1518168772', '1519723596', '1', '94', '', '', '', '', 'CONTACT US');
INSERT INTO `modao_category` VALUES ('45', 'banner', 'Banner', '1', '0', '10', '', '', '', '', '', '', '', '6', '6', '2,1', '0', '1', '2', '0', '0', '', null, '1518165485', '1519441527', '1', '0', '', '', '打造国内最有品质、最高效的建站平台。', '莫道建站，专注高品质的网站建设', 'banner');
INSERT INTO `modao_category` VALUES ('46', 'youshi', '我们的优势', '1', '1', '10', '', '', '', '', '', '', '', '7', '7', '2,1', '0', '1', '2', '0', '0', '', null, '1518165542', '1519452812', '1', '0', '', '', '', '', 'INFORMATION AREA');
INSERT INTO `modao_category` VALUES ('47', 'fuwu', '我们的服务', '39', '0', '10', '', '', '', '', 'fuwu', '', '', '9', '9', '2,1', '0', '1', '1', '0', '0', '', null, '1518165787', '1519703621', '1', '0', '', '', '', '', 'fuwu');
INSERT INTO `modao_category` VALUES ('48', 'zuopin', '我们的作品', '39', '1', '10', '', '', '', '', '', '', '', '10', '10', '2,1,3', '0', '1', '1', '0', '0', '', null, '1518165934', '1519711581', '1', '91', '', '', '', '', 'zuopin');
INSERT INTO `modao_category` VALUES ('52', 'join', '加入我们', '50', '1', '10', '', '', '', '', '', '', '', '14', '14', '2,1', '0', '1', '1', '0', '0', '', null, '1518168845', '1519725344', '1', '0', '', '', '', '', 'join');
INSERT INTO `modao_category` VALUES ('54', 'foot', 'Footer', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1', '0', '1', '2', '0', '0', '', null, '1518230544', '1519444237', '1', '0', '', '', '', '', 'foot');

-- ----------------------------
-- Table structure for modao_channel
-- ----------------------------
DROP TABLE IF EXISTS `modao_channel`;
CREATE TABLE `modao_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modao_channel
-- ----------------------------
INSERT INTO `modao_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `modao_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `modao_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for modao_config
-- ----------------------------
DROP TABLE IF EXISTS `modao_config`;
CREATE TABLE `modao_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modao_config
-- ----------------------------
INSERT INTO `modao_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', '莫道科技', '0');
INSERT INTO `modao_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '4', '', '网站搜索引擎描述', '1378898976', '1518229108', '1', '', '1');
INSERT INTO `modao_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '4', '', '网站搜索引擎关键字', '1378898976', '1518229081', '1', '', '8');
INSERT INTO `modao_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '4', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1518228969', '1', '1', '1');
INSERT INTO `modao_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `modao_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', 'Copyright©2014sanguui.com,All Rights Reserved 湘ICP备17012807-1号', '9');
INSERT INTO `modao_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', '3');
INSERT INTO `modao_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `modao_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `modao_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `modao_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `modao_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `modao_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `modao_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `modao_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `modao_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `modao_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `modao_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `modao_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `modao_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `modao_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `modao_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `modao_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `modao_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `modao_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `modao_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `modao_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- ----------------------------
-- Table structure for modao_document
-- ----------------------------
DROP TABLE IF EXISTS `modao_document`;
CREATE TABLE `modao_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of modao_document
-- ----------------------------
INSERT INTO `modao_document` VALUES ('14', '1', '', 'Fooer', '54', '0', '', '0', '0', '5', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519437540', '1519724465', '1');
INSERT INTO `modao_document` VALUES ('15', '1', '', '莫道建站，专注高品质的网站建设', '45', '0', '打造国内最有品质、最高效的建站平台。', '0', '0', '6', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519441583', '1519441583', '1');
INSERT INTO `modao_document` VALUES ('16', '1', '', '莫道建站，专注高品质的网站建设', '45', '0', '打造国内最有品质、最高效的建站平台。', '0', '0', '6', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519441618', '1519441618', '-1');
INSERT INTO `modao_document` VALUES ('17', '1', '', '莫道建站，专注高品质的网站建设', '45', '0', '打造国内最有品质、最高效的建站平台。', '0', '0', '6', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519441732', '1519441732', '1');
INSERT INTO `modao_document` VALUES ('18', '1', '', '莫道建站，专注高品质的网站建设', '45', '0', '打造国内最有品质、最高效的建站平台。', '0', '0', '6', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519444212', '1519444212', '1');
INSERT INTO `modao_document` VALUES ('19', '1', '', '我们的优势', '46', '0', '', '0', '0', '7', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519453380', '1519454921', '1');
INSERT INTO `modao_document` VALUES ('20', '1', '', '静冈住宅改造，日本', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519459980', '1519459980', '1');
INSERT INTO `modao_document` VALUES ('21', '1', '', '瓦登海游客中心景观设计, 丹麦', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519460100', '1519460155', '1');
INSERT INTO `modao_document` VALUES ('22', '1', '', '磁器口大街杂院房微改造，北京', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519460220', '1519460233', '1');
INSERT INTO `modao_document` VALUES ('23', '1', '', '静冈住宅改造，日本', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519459980', '1519459980', '1');
INSERT INTO `modao_document` VALUES ('24', '1', '', '瓦登海游客中心景观设计, 丹麦', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '7', '0', '0', '0', '1519460100', '1519460155', '1');
INSERT INTO `modao_document` VALUES ('25', '1', '', '磁器口大街杂院房微改造，北京', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1519460220', '1519460233', '1');
INSERT INTO `modao_document` VALUES ('26', '1', '', '静冈住宅改造，日本', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519459980', '1519459980', '1');
INSERT INTO `modao_document` VALUES ('27', '1', '', '瓦登海游客中心景观设计, 丹麦', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519460100', '1519460155', '1');
INSERT INTO `modao_document` VALUES ('28', '1', '', '磁器口大街杂院房微改造，北京', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519460220', '1519460233', '1');
INSERT INTO `modao_document` VALUES ('29', '1', '', '静冈住宅改造，日本', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519459980', '1519459980', '1');
INSERT INTO `modao_document` VALUES ('30', '1', '', '瓦登海游客中心景观设计, 丹麦', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519460100', '1519460155', '1');
INSERT INTO `modao_document` VALUES ('31', '1', '', '磁器口大街杂院房微改造，北京', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1519460220', '1519460233', '1');
INSERT INTO `modao_document` VALUES ('32', '1', '', '静冈住宅改造，日本', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1519459980', '1519459980', '1');
INSERT INTO `modao_document` VALUES ('33', '1', '', '瓦登海游客中心景观设计, 丹麦', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1519460100', '1519460155', '1');
INSERT INTO `modao_document` VALUES ('34', '1', '', '磁器口大街杂院房微改造，北京', '53', '0', '2017年深圳香港双城双年展以“城市共生“为主题，讨论在现代城市化进程中城中村与城市相辅相成的关系...', '0', '0', '8', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1519460220', '1519460233', '1');
INSERT INTO `modao_document` VALUES ('36', '1', '', '大型公共交通项目', '47', '0', '该项目是对一个三口之家进行改造。业主认为如果和父母分开居住会损失很多快乐，因此初为人父的他萌生了给予女儿更多贴心照顾的想法，决定买下相邻的土地，建一个更大的房子让女儿和自己一起居住', '0', '0', '9', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '4', '1519703280', '1519703345', '1');
INSERT INTO `modao_document` VALUES ('37', '1', '', '办公大楼', '47', '0', '该项目是对一个三口之家进行改造。业主认为如果和父母分开居住会损失很多快乐，因此初为人父的他萌生了给予女儿更多贴心照顾的想法，决定买下相邻的土地，建一个更大的房子让女儿和自己一起居住', '0', '0', '9', '2', '0', '0', '0', '1', '0', '0', '3', '0', '0', '3', '1519703340', '1519703562', '1');
INSERT INTO `modao_document` VALUES ('38', '1', '', '会展及文体建筑', '47', '0', '该项目是对一个三口之家进行改造。业主认为如果和父母分开居住会损失很多快乐，因此初为人父的他萌生了给予女儿更多贴心照顾的想法，决定买下相邻的土地，建一个更大的房子让女儿和自己一起居住', '0', '0', '9', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '2', '1519703460', '1519703568', '1');
INSERT INTO `modao_document` VALUES ('39', '1', '', '商业综合体', '47', '0', '该项目是对一个三口之家进行改造。业主认为如果和父母分开居住会损失很多快乐，因此初为人父的他萌生了给予女儿更多贴心照顾的想法，决定买下相邻的土地，建一个更大的房子让女儿和自己一起居住', '0', '0', '9', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '1', '1519703520', '1519703574', '1');
INSERT INTO `modao_document` VALUES ('40', '1', '', '长沙图书馆', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711626', '1519711626', '1');
INSERT INTO `modao_document` VALUES ('41', '1', '', '中国烟草', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711650', '1519711650', '1');
INSERT INTO `modao_document` VALUES ('42', '1', '', '网易', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711671', '1519711671', '1');
INSERT INTO `modao_document` VALUES ('43', '1', '', '长沙市公安局', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711707', '1519711707', '1');
INSERT INTO `modao_document` VALUES ('44', '1', '', '欧达', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711726', '1519711726', '1');
INSERT INTO `modao_document` VALUES ('45', '1', '', '长沙图书馆', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711626', '1519711626', '1');
INSERT INTO `modao_document` VALUES ('46', '1', '', '中国烟草', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711650', '1519711650', '1');
INSERT INTO `modao_document` VALUES ('47', '1', '', '网易', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711671', '1519711671', '1');
INSERT INTO `modao_document` VALUES ('48', '1', '', '长沙市公安局', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711707', '1519711707', '1');
INSERT INTO `modao_document` VALUES ('49', '1', '', '欧达', '48', '0', '', '0', '0', '10', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519711726', '1519711726', '1');
INSERT INTO `modao_document` VALUES ('50', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714500', '1519714526', '1');
INSERT INTO `modao_document` VALUES ('51', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714539', '1519714539', '1');
INSERT INTO `modao_document` VALUES ('52', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714543', '1519714543', '1');
INSERT INTO `modao_document` VALUES ('53', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714543', '1519714543', '1');
INSERT INTO `modao_document` VALUES ('54', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714547', '1519714547', '1');
INSERT INTO `modao_document` VALUES ('55', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714547', '1519714547', '1');
INSERT INTO `modao_document` VALUES ('56', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714547', '1519714547', '1');
INSERT INTO `modao_document` VALUES ('57', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714547', '1519714547', '1');
INSERT INTO `modao_document` VALUES ('58', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714568', '1519714568', '1');
INSERT INTO `modao_document` VALUES ('59', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714560', '1519714623', '1');
INSERT INTO `modao_document` VALUES ('60', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714568', '1519714568', '1');
INSERT INTO `modao_document` VALUES ('61', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1519714568', '1519714568', '1');
INSERT INTO `modao_document` VALUES ('62', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714568', '1519714568', '1');
INSERT INTO `modao_document` VALUES ('63', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1519714568', '1519714568', '1');
INSERT INTO `modao_document` VALUES ('64', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714560', '1519714606', '1');
INSERT INTO `modao_document` VALUES ('65', '1', '', '2017年度每月最受欢迎的24个室内设计', '49', '0', '在2017年年底，我们为大家总结了莫道设计网今年一年室内类别每月最受欢迎的（根据点击率优选的）24个作品。统计截止日期为2018年8月25日...', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519714560', '1519714591', '1');
INSERT INTO `modao_document` VALUES ('66', '1', '', '企业文化', '41', '0', '', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519720192', '1519720192', '1');
INSERT INTO `modao_document` VALUES ('67', '1', '', '莫道网络', '41', '0', '', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519720260', '1519720612', '1');
INSERT INTO `modao_document` VALUES ('68', '1', '', '2010年', '43', '0', '莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点\r\n\r\n', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '1', '1519721182', '1519721182', '1');
INSERT INTO `modao_document` VALUES ('69', '1', '', '2011年', '43', '0', '让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '2', '1519721203', '1519721203', '1');
INSERT INTO `modao_document` VALUES ('70', '1', '', '2012年', '43', '0', '莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '3', '1519721228', '1519721228', '1');
INSERT INTO `modao_document` VALUES ('71', '1', '', '2013年', '43', '0', '基于通讯行业客户诉求优化自身产品，推出串码管理系统、IMEI产品，在同类产品中处于领先地位，并在通讯行业中获得诸多好评。', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '4', '1519721254', '1519721254', '1');
INSERT INTO `modao_document` VALUES ('72', '1', '', '2014年', '43', '0', '让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站\r\n\r\n', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '5', '1519721273', '1519721273', '1');
INSERT INTO `modao_document` VALUES ('73', '1', '', '2015年', '43', '0', '莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '6', '1519721327', '1519721327', '1');
INSERT INTO `modao_document` VALUES ('74', '1', '', '2016年', '43', '0', '我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '7', '1519721349', '1519721349', '1');
INSERT INTO `modao_document` VALUES ('75', '1', '', '2017年', '43', '0', '我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。', '0', '0', '11', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '8', '1519721372', '1519721372', '1');
INSERT INTO `modao_document` VALUES ('76', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1519722720', '1519722784', '1');
INSERT INTO `modao_document` VALUES ('77', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519722720', '1519722784', '1');
INSERT INTO `modao_document` VALUES ('78', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519722720', '1519722784', '1');
INSERT INTO `modao_document` VALUES ('79', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519722720', '1519722784', '1');
INSERT INTO `modao_document` VALUES ('80', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519722720', '1519722784', '1');
INSERT INTO `modao_document` VALUES ('81', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519722720', '1519722784', '1');
INSERT INTO `modao_document` VALUES ('82', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519722720', '1519722784', '1');
INSERT INTO `modao_document` VALUES ('83', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519722720', '1519722970', '1');
INSERT INTO `modao_document` VALUES ('84', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1519722720', '1519722961', '1');
INSERT INTO `modao_document` VALUES ('85', '1', '', 'ERYAN（梁一亚）', '42', '0', '', '0', '0', '12', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519722720', '1519722952', '1');
INSERT INTO `modao_document` VALUES ('86', '1', '', '前端工程师', '52', '0', '', '0', '0', '14', '2', '0', '0', '0', '1', '0', '0', '3', '0', '0', '0', '1519725480', '1519725558', '1');
INSERT INTO `modao_document` VALUES ('87', '1', '', '高级UI设计师', '52', '0', '', '0', '0', '14', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1519725480', '1519725551', '1');
INSERT INTO `modao_document` VALUES ('88', '1', '', 'UI设计师', '52', '0', '', '0', '0', '14', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1519725480', '1519725546', '1');
INSERT INTO `modao_document` VALUES ('89', '0', '', '6786', '51', '0', '678', '0', '0', '16', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1519785225', '0');
INSERT INTO `modao_document` VALUES ('90', '0', '', '678', '51', '0', '67867', '0', '0', '16', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1519785340', '0');
INSERT INTO `modao_document` VALUES ('91', '0', '', '678', '51', '0', '678', '0', '0', '16', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1519785429', '0');
INSERT INTO `modao_document` VALUES ('92', '0', '', '678', '51', '0', '12321', '0', '0', '16', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1519785524', '0');
INSERT INTO `modao_document` VALUES ('93', '0', '', '089', '51', '0', '890', '0', '0', '16', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1519785608', '0');

-- ----------------------------
-- Table structure for modao_document_anli
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_anli`;
CREATE TABLE `modao_document_anli` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `laiyuan` varchar(255) NOT NULL DEFAULT '莫道建站' COMMENT '文章来源',
  `contant` text NOT NULL COMMENT '内容',
  `leixing` varchar(100) NOT NULL COMMENT '文章类型',
  `img` int(10) unsigned NOT NULL COMMENT '封面图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_anli
-- ----------------------------
INSERT INTO `modao_document_anli` VALUES ('20', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '1', '107');
INSERT INTO `modao_document_anli` VALUES ('21', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '2,3', '108');
INSERT INTO `modao_document_anli` VALUES ('22', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '3,4', '109');
INSERT INTO `modao_document_anli` VALUES ('23', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '1', '107');
INSERT INTO `modao_document_anli` VALUES ('24', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '2,3', '108');
INSERT INTO `modao_document_anli` VALUES ('25', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '3,4', '109');
INSERT INTO `modao_document_anli` VALUES ('26', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '1', '107');
INSERT INTO `modao_document_anli` VALUES ('27', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '2,3', '108');
INSERT INTO `modao_document_anli` VALUES ('28', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '3,4', '109');
INSERT INTO `modao_document_anli` VALUES ('29', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '1', '107');
INSERT INTO `modao_document_anli` VALUES ('30', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '2,3', '108');
INSERT INTO `modao_document_anli` VALUES ('31', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '3,4', '109');
INSERT INTO `modao_document_anli` VALUES ('32', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;font-family:微软雅黑, &quot;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '1', '107');
INSERT INTO `modao_document_anli` VALUES ('33', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '2,3', '108');
INSERT INTO `modao_document_anli` VALUES ('34', '莫道建站', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>', '3,4', '109');

-- ----------------------------
-- Table structure for modao_document_article
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_article`;
CREATE TABLE `modao_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `img` int(10) unsigned NOT NULL COMMENT '封面图',
  `leixing` varchar(100) NOT NULL COMMENT '文章类型',
  `laiyuan` varchar(255) NOT NULL COMMENT '来源',
  `contant` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of modao_document_article
-- ----------------------------
INSERT INTO `modao_document_article` VALUES ('50', '123', '1,2,3', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('51', '124', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('52', '123', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('53', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('54', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('55', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('56', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('57', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('58', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('59', '124', '4', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('60', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('61', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('62', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('63', '121', '1,2', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('64', '123', '1', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_article` VALUES ('65', '122', '1,2,3,4', '建筑艺术', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');

-- ----------------------------
-- Table structure for modao_document_banner
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_banner`;
CREATE TABLE `modao_document_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `banner` int(10) unsigned NOT NULL COMMENT '首页banner',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_banner
-- ----------------------------
INSERT INTO `modao_document_banner` VALUES ('15', '97');
INSERT INTO `modao_document_banner` VALUES ('17', '98');
INSERT INTO `modao_document_banner` VALUES ('18', '99');

-- ----------------------------
-- Table structure for modao_document_download
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_download`;
CREATE TABLE `modao_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of modao_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for modao_document_footer
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_footer`;
CREATE TABLE `modao_document_footer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `about` text NOT NULL COMMENT '关于我们',
  `phone` varchar(255) NOT NULL COMMENT '电话',
  `fax` varchar(255) NOT NULL COMMENT '传真',
  `email` varchar(255) NOT NULL COMMENT '公司邮箱',
  `youbian` varchar(255) NOT NULL COMMENT '邮编',
  `tel` varchar(255) NOT NULL COMMENT '公司地址',
  `times` varchar(255) NOT NULL COMMENT '工作时间',
  `url` text NOT NULL COMMENT '友情链接',
  `wx` int(10) unsigned NOT NULL COMMENT '微信公众号',
  `contant` text NOT NULL COMMENT '百度地图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_footer
-- ----------------------------
INSERT INTO `modao_document_footer` VALUES ('14', '一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。', '0731-88842500', '88888888', '201124068@qq.com', '100014', '湖南省长沙市麓谷企业广场F3栋1406室', '09:00-18:00', '莫道建站&http://www.moodao.com;\r\n莫道设计&http://www.moodao.com;\r\n莫道技术支持&http://www.moodao.com;', '96', '<iframe src=\"/Public/static/kindeditor/plugins/baidumap/index.html?center=112.890699%2C28.214484&zoom=17&width=558&height=360&markers=112.890699%2C28.214484&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:560px;height:362px;\">\r\n</iframe>');

-- ----------------------------
-- Table structure for modao_document_fuwu
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_fuwu`;
CREATE TABLE `modao_document_fuwu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `img` int(10) unsigned NOT NULL COMMENT '封面图',
  `contant` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_fuwu
-- ----------------------------
INSERT INTO `modao_document_fuwu` VALUES ('36', '110', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_fuwu` VALUES ('37', '111', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_fuwu` VALUES ('38', '112', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_fuwu` VALUES ('39', '113', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');

-- ----------------------------
-- Table structure for modao_document_hezuo
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_hezuo`;
CREATE TABLE `modao_document_hezuo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) NOT NULL COMMENT 'URL',
  `img` int(10) unsigned NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_hezuo
-- ----------------------------
INSERT INTO `modao_document_hezuo` VALUES ('40', '', '116');
INSERT INTO `modao_document_hezuo` VALUES ('41', '', '117');
INSERT INTO `modao_document_hezuo` VALUES ('42', '', '118');
INSERT INTO `modao_document_hezuo` VALUES ('43', '', '119');
INSERT INTO `modao_document_hezuo` VALUES ('44', '', '120');
INSERT INTO `modao_document_hezuo` VALUES ('45', '', '116');
INSERT INTO `modao_document_hezuo` VALUES ('46', '', '117');
INSERT INTO `modao_document_hezuo` VALUES ('47', '', '118');
INSERT INTO `modao_document_hezuo` VALUES ('48', '', '119');
INSERT INTO `modao_document_hezuo` VALUES ('49', '', '120');

-- ----------------------------
-- Table structure for modao_document_jianjie
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_jianjie`;
CREATE TABLE `modao_document_jianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fu_title` varchar(255) NOT NULL COMMENT '副标题',
  `img` int(10) unsigned NOT NULL COMMENT '封面图',
  `contant` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_jianjie
-- ----------------------------
INSERT INTO `modao_document_jianjie` VALUES ('66', 'CORPORATE CULTURE', '125', '<h4>\r\n	六分人才 八分使用 十分待遇\r\n</h4>\r\n<h4>\r\n	尊重人才 唯才是举 以人兴企 人企共赢\r\n</h4>\r\n<h5>\r\n	Talent meritocracy people person popular business enterprises win\r\n</h5>');
INSERT INTO `modao_document_jianjie` VALUES ('67', '2014年成立于湖南长沙', '129', '<p>莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。</p>');
INSERT INTO `modao_document_jianjie` VALUES ('68', '', '0', '');
INSERT INTO `modao_document_jianjie` VALUES ('69', '', '0', '');
INSERT INTO `modao_document_jianjie` VALUES ('70', '', '0', '');
INSERT INTO `modao_document_jianjie` VALUES ('71', '', '0', '');
INSERT INTO `modao_document_jianjie` VALUES ('72', '', '0', '');
INSERT INTO `modao_document_jianjie` VALUES ('73', '', '0', '');
INSERT INTO `modao_document_jianjie` VALUES ('74', '', '0', '');
INSERT INTO `modao_document_jianjie` VALUES ('75', '', '0', '');

-- ----------------------------
-- Table structure for modao_document_jiaru
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_jiaru`;
CREATE TABLE `modao_document_jiaru` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `jianjie` text NOT NULL COMMENT '招聘简介',
  `xiangqing` text NOT NULL COMMENT '招聘详情',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_jiaru
-- ----------------------------
INSERT INTO `modao_document_jiaru` VALUES ('86', '<li>\r\n	精通网页前端技术与HTML5，兼容各 浏览器标准\r\n</li>\r\n<li>\r\n	精通JavaScript,jQuery框架，有解决问题能力\r\n</li>', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_jiaru` VALUES ('87', '<li>\r\n	精通网页前端技术与HTML5，兼容各 浏览器标准\r\n</li>\r\n<li>\r\n	精通JavaScript,jQuery框架，有解决问题能力\r\n</li>', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_jiaru` VALUES ('88', '<li>\r\n	精通网页前端技术与HTML5，兼容各 浏览器标准\r\n</li>\r\n<li>\r\n	精通JavaScript,jQuery框架，有解决问题能力\r\n</li>', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');

-- ----------------------------
-- Table structure for modao_document_tuandui
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_tuandui`;
CREATE TABLE `modao_document_tuandui` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zhiwei` varchar(255) NOT NULL COMMENT '职位',
  `img` int(10) unsigned NOT NULL COMMENT '封面图',
  `contant` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_tuandui
-- ----------------------------
INSERT INTO `modao_document_tuandui` VALUES ('76', '市场副总裁', '131', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_tuandui` VALUES ('77', '市场副总裁', '131', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_tuandui` VALUES ('78', '市场副总裁', '131', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_tuandui` VALUES ('79', '市场副总裁', '131', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_tuandui` VALUES ('80', '市场副总裁', '131', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_tuandui` VALUES ('81', '市场副总裁', '131', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_tuandui` VALUES ('82', '市场副总裁', '131', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_tuandui` VALUES ('83', '市场副总裁', '134', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_tuandui` VALUES ('84', '市场副总裁', '133', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');
INSERT INTO `modao_document_tuandui` VALUES ('85', '市场副总裁', '132', '<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<img src=\"/Uploads/Editor/2018-02-24/5a911e62dea3e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2018-02-24/5a911e77dc7df.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。莫道建站立志于为每一位高端诉求者提供最专业、便捷的建站服务体验，我们是一家专业的互联网设计开发机构，以全新的视觉设计及出色的用户体验为创业者、大中小型企业提供简单却不平庸的企业站点。让每一位合作伙伴创造出更大的商业价值，建立属于自己的互联网营销平台。莫道建站提供了多类主题、不同风格与行业的模板网站、艺术品级的设计水准、多终端响应式设计。让每一位普通用户能享受到高品质的建站服务体验。并且我们也为需要定制化设计的用户提供更高标准的网站定制服务，针对您的企业文化及理念制作属于您企业特有的专属创意网站。我们将凭借优秀的设计实力与专业的设计服务打造成为国内最优秀的互联网设计开发品牌。\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;vertical-align:baseline;color:#222222;\">\r\n	一款美观大气的响应式建站平台，一种方便快捷的建站方式。我们致力于帮助中小企业用最少的时间和成本建设真正的高端响应式网站，让世界通过官网的名片快速了解您的企业。我们只是想让更多的用户看到更精美的网站。\r\n</p>');

-- ----------------------------
-- Table structure for modao_document_xuqiu
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_xuqiu`;
CREATE TABLE `modao_document_xuqiu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(100) NOT NULL COMMENT '手机',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_xuqiu
-- ----------------------------
INSERT INTO `modao_document_xuqiu` VALUES ('89', '2147483647');
INSERT INTO `modao_document_xuqiu` VALUES ('90', '2147483647');
INSERT INTO `modao_document_xuqiu` VALUES ('91', '2147483647');
INSERT INTO `modao_document_xuqiu` VALUES ('92', '2147483647');
INSERT INTO `modao_document_xuqiu` VALUES ('93', '13574185052');

-- ----------------------------
-- Table structure for modao_document_youshi
-- ----------------------------
DROP TABLE IF EXISTS `modao_document_youshi`;
CREATE TABLE `modao_document_youshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title_1` varchar(255) NOT NULL COMMENT '优势-标题-1',
  `title_2` varchar(255) NOT NULL COMMENT '优势-标题-2',
  `title_3` varchar(255) NOT NULL COMMENT '优势-标题-3',
  `miaoshu_1` text NOT NULL COMMENT '优势-描述-1',
  `miaoshu_2` text NOT NULL COMMENT '优势-描述-2',
  `miaoshu_3` text NOT NULL COMMENT '优势-描述-3',
  `tubiao_1` int(10) unsigned NOT NULL COMMENT '优势-小图标-1',
  `tubiao_2` int(10) unsigned NOT NULL COMMENT '优势-小图标-2',
  `tubiao_3` int(10) unsigned NOT NULL COMMENT '优势-小图标-3',
  `img_1` int(10) unsigned NOT NULL COMMENT '优势-大图片-1',
  `img_2` int(10) unsigned NOT NULL COMMENT '优势-大图片-2',
  `img_3` int(10) unsigned NOT NULL COMMENT '优势-大图片-3',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of modao_document_youshi
-- ----------------------------
INSERT INTO `modao_document_youshi` VALUES ('19', '施工总包化', '设计高端化', '施工总包化', '设计高端化，材料自主化，施工总包化，集设计、施工材料定制选购全方位一体化的优质服务。设计高端化，材料自主化，施工总包化，集设计、施工材料定制选购全方位一体化的优质服务。设计高端化，材料自主化，施工总包化', '设计高端化，材料自主化，施工总包化，集设计、施工材料定制选购全方位一体化的优质服务', '设计高端化，材料自主化，施工总包化，集设计、施工材料定制选购全方位一体化的优质服务。', '100', '106', '104', '101', '103', '105');

-- ----------------------------
-- Table structure for modao_file
-- ----------------------------
DROP TABLE IF EXISTS `modao_file`;
CREATE TABLE `modao_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of modao_file
-- ----------------------------

-- ----------------------------
-- Table structure for modao_hooks
-- ----------------------------
DROP TABLE IF EXISTS `modao_hooks`;
CREATE TABLE `modao_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modao_hooks
-- ----------------------------
INSERT INTO `modao_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '', '1');
INSERT INTO `modao_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop', '1');
INSERT INTO `modao_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment', '1');
INSERT INTO `modao_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment', '1');
INSERT INTO `modao_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `modao_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment', '1');
INSERT INTO `modao_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor', '1');
INSERT INTO `modao_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin', '1');
INSERT INTO `modao_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam', '1');
INSERT INTO `modao_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor', '1');
INSERT INTO `modao_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '', '1');

-- ----------------------------
-- Table structure for modao_member
-- ----------------------------
DROP TABLE IF EXISTS `modao_member`;
CREATE TABLE `modao_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of modao_member
-- ----------------------------
INSERT INTO `modao_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '100', '20', '0', '1512609307', '2130706433', '1519785251', '1');

-- ----------------------------
-- Table structure for modao_menu
-- ----------------------------
DROP TABLE IF EXISTS `modao_menu`;
CREATE TABLE `modao_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modao_menu
-- ----------------------------
INSERT INTO `modao_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('2', '官网', '0', '2', 'Article/mydocument', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0', '1');
INSERT INTO `modao_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0', '1');
INSERT INTO `modao_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('16', '用户', '0', '3', 'User/index', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0', '1');
INSERT INTO `modao_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0', '1');
INSERT INTO `modao_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0', '1');
INSERT INTO `modao_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0', '1');
INSERT INTO `modao_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0', '1');
INSERT INTO `modao_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0', '1');
INSERT INTO `modao_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('68', '系统', '0', '4', 'Config/group', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0', '1');
INSERT INTO `modao_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0', '1');
INSERT INTO `modao_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0', '1');
INSERT INTO `modao_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0', '1');
INSERT INTO `modao_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0', '1');
INSERT INTO `modao_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0', '1');
INSERT INTO `modao_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0', '1');
INSERT INTO `modao_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0', '1');
INSERT INTO `modao_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0', '1');
INSERT INTO `modao_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '', '0', '1');
INSERT INTO `modao_menu` VALUES ('123', '审核列表', '3', '0', 'Article/examine', '1', '', '', '0', '1');

-- ----------------------------
-- Table structure for modao_model
-- ----------------------------
DROP TABLE IF EXISTS `modao_model`;
CREATE TABLE `modao_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of modao_model
-- ----------------------------
INSERT INTO `modao_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"2\",\"3\",\"5\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1383891233', '1519782642', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"90\",\"91\",\"89\",\"5\",\"92\"],\"2\":[\"19\",\"20\",\"9\",\"2\",\"16\",\"12\",\"17\",\"10\",\"11\",\"14\",\"13\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891243', '1519713981', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('5', 'footer', 'Footer', '1', '', '1', '{\"1\":[\"3\",\"57\",\"58\",\"60\",\"62\",\"59\",\"64\",\"63\",\"65\",\"66\",\"99\"],\"2\":[\"16\",\"9\",\"10\",\"2\",\"5\",\"17\",\"14\",\"11\",\"13\",\"12\",\"20\",\"19\"]}', '1:基础;2:其他', '', '', '', '', '', '', '10', '', '', '1519436378', '1519723771', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('6', 'banner', 'Banner', '1', '', '1', '{\"1\":[\"3\",\"5\",\"67\"],\"2\":[\"16\",\"14\",\"9\",\"10\",\"2\",\"13\",\"17\",\"20\",\"19\",\"12\",\"11\"]}', '1:基础;2:其他', '', '', '', '', '', '', '10', '', '', '1519441314', '1519441509', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('7', 'youshi', '我们的优势', '1', '', '1', '{\"1\":[\"3\",\"68\",\"71\",\"74\",\"77\",\"69\",\"72\",\"75\",\"78\",\"70\",\"73\",\"76\",\"79\"],\"2\":[\"16\",\"14\",\"2\",\"10\",\"13\",\"9\",\"17\",\"20\",\"19\",\"12\",\"5\",\"11\"]}', '1:基础;2:其他', '', '', '', '', '', '', '10', '', '', '1519444787', '1519452734', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('8', 'anli', '公司案例', '1', '', '1', '{\"1\":[\"3\",\"82\",\"80\",\"83\",\"20\",\"5\",\"81\"],\"2\":[\"16\",\"14\",\"17\",\"13\",\"9\",\"19\",\"10\",\"12\",\"2\",\"11\"]}', '1:基础;2:其他', '', '', '', '', '', '', '10', '', '', '1519457434', '1519459459', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('9', 'fuwu', '服务', '1', '', '1', '{\"1\":[\"86\",\"3\",\"84\",\"5\",\"85\"],\"2\":[\"16\",\"14\",\"13\",\"9\",\"10\",\"17\",\"2\",\"20\",\"19\",\"12\",\"11\"]}', '1:基础;2:其他', '', '', '', '', '', '', '10', '', '', '1519702986', '1519711120', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('10', 'hezuo', '合作单位', '1', '', '1', '{\"1\":[\"3\",\"87\",\"88\"],\"2\":[\"16\",\"14\",\"13\",\"9\",\"17\",\"10\",\"20\",\"19\",\"12\",\"11\",\"2\",\"5\"]}', '1:基础;2:其他', '', '', '', '', '', '', '10', '', '', '1519711347', '1519711556', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('11', 'jianjie', '简介', '1', '', '1', '{\"1\":[\"3\",\"93\",\"94\",\"5\",\"95\"],\"2\":[\"16\",\"14\",\"13\",\"9\",\"11\",\"10\",\"2\",\"17\",\"20\",\"12\",\"19\"]}', '1:基础;2:其他', '', '', '', '', '', '', '10', '', '', '1519719469', '1519719677', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('12', 'tuandui', '团队', '1', '', '1', '{\"1\":[\"3\",\"96\",\"97\",\"98\"],\"2\":[\"16\",\"14\",\"9\",\"10\",\"2\",\"13\",\"17\",\"20\",\"19\",\"12\",\"11\",\"5\"]}', '1:基础;2:其他', '', '', '', '', '', '', '10', '', '', '1519722495', '1519722646', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('14', 'jiaru', '加入我们', '1', '', '1', '{\"1\":[\"3\",\"102\",\"103\"],\"2\":[\"16\",\"14\",\"9\",\"10\",\"2\",\"12\",\"5\",\"13\",\"11\",\"17\",\"19\",\"20\"]}', '1:基础;2:其他', '', '', '', '', '', '', '10', '', '', '1519725138', '1519725446', '1', 'MyISAM');
INSERT INTO `modao_model` VALUES ('16', 'xuqiu', '联系我们', '1', '', '1', '{\"1\":[\"3\",\"109\",\"5\"],\"2\":[\"20\",\"17\",\"19\",\"11\",\"9\",\"10\",\"2\",\"14\",\"16\",\"12\",\"13\"]}', '1:基础;2:其他', '', '', '', '', '', 'id:编号\r\ntitle:姓名:[EDIT]\r\nphone:手机\r\nupdate_time:时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', '', '', '1519782333', '1519785701', '1', 'MyISAM');

-- ----------------------------
-- Table structure for modao_picture
-- ----------------------------
DROP TABLE IF EXISTS `modao_picture`;
CREATE TABLE `modao_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modao_picture
-- ----------------------------
INSERT INTO `modao_picture` VALUES ('90', '/Uploads/Picture/2018-01-26/5a6aa7cedf0a8.jpg', '', 'e56cbdeb940d450b7831ff492579973d', '35a5d18ec24932851ef697d1b8edcfc057df12b6', '1', '1516939214');
INSERT INTO `modao_picture` VALUES ('91', '/Uploads/Picture/2018-02-09/5a7d5faa65fc1.jpg', '', '26e110178c1240fe26cb150e734c6abb', 'd1b87ba198f7cad04333e06979e0b8daa4514282', '1', '1518165930');
INSERT INTO `modao_picture` VALUES ('92', '/Uploads/Picture/2018-02-09/5a7d692ae8e06.jpg', '', 'a82af84c5883b822033014dabbafd932', 'ec2d249780b1466997317521618dde67f1b3ac8b', '1', '1518168362');
INSERT INTO `modao_picture` VALUES ('93', '/Uploads/Picture/2018-02-09/5a7d6a54097c6.jpg', '', '3ef4792b2b195b48553bc0d3f537ea7d', '5fc704eb2aacbcdbd8f14dcca7f30adee6d00903', '1', '1518168659');
INSERT INTO `modao_picture` VALUES ('94', '/Uploads/Picture/2018-02-09/5a7d6ac30953b.jpg', '', 'ac04fb02a753439cc1a016630de56399', 'f613d15549af7863b31a38dc383915c8633b1979', '1', '1518168770');
INSERT INTO `modao_picture` VALUES ('95', '/Uploads/Picture/2018-02-09/5a7d6b557af1c.jpg', '', '6be0e9abc6c03a29dba172fbb2fea2d0', 'acd61ab8c753373f62a0a73599595d8abbe40727', '1', '1518168917');
INSERT INTO `modao_picture` VALUES ('96', '/Uploads/Picture/caijian/1519437524.png', '', '', '', '1', '1519437524');
INSERT INTO `modao_picture` VALUES ('97', '/Uploads/Picture/caijian/1519441578.png', '', '', '', '1', '1519441578');
INSERT INTO `modao_picture` VALUES ('98', '/Uploads/Picture/caijian/1519441730.png', '', '', '', '1', '1519441730');
INSERT INTO `modao_picture` VALUES ('99', '/Uploads/Picture/caijian/1519444211.png', '', '', '', '1', '1519444211');
INSERT INTO `modao_picture` VALUES ('100', '/Uploads/Picture/caijian/1519453102.png', '', '', '', '1', '1519453102');
INSERT INTO `modao_picture` VALUES ('101', '/Uploads/Picture/caijian/1519453213.png', '', '', '', '1', '1519453213');
INSERT INTO `modao_picture` VALUES ('102', '/Uploads/Picture/caijian/1519453286.png', '', '', '', '1', '1519453286');
INSERT INTO `modao_picture` VALUES ('103', '/Uploads/Picture/caijian/1519453320.png', '', '', '', '1', '1519453320');
INSERT INTO `modao_picture` VALUES ('104', '/Uploads/Picture/caijian/1519453365.png', '', '', '', '1', '1519453365');
INSERT INTO `modao_picture` VALUES ('105', '/Uploads/Picture/caijian/1519453379.png', '', '', '', '1', '1519453379');
INSERT INTO `modao_picture` VALUES ('106', '/Uploads/Picture/caijian/1519454918.png', '', '', '', '1', '1519454918');
INSERT INTO `modao_picture` VALUES ('107', '/Uploads/Picture/caijian/1519459776.png', '', '', '', '1', '1519459776');
INSERT INTO `modao_picture` VALUES ('108', '/Uploads/Picture/caijian/1519460120.png', '', '', '', '1', '1519460120');
INSERT INTO `modao_picture` VALUES ('109', '/Uploads/Picture/caijian/1519460209.png', '', '', '', '1', '1519460209');
INSERT INTO `modao_picture` VALUES ('110', '/Uploads/Picture/caijian/1519703302.png', '', '', '', '1', '1519703302');
INSERT INTO `modao_picture` VALUES ('111', '/Uploads/Picture/caijian/1519703374.png', '', '', '', '1', '1519703374');
INSERT INTO `modao_picture` VALUES ('112', '/Uploads/Picture/caijian/1519703458.png', '', '', '', '1', '1519703458');
INSERT INTO `modao_picture` VALUES ('113', '/Uploads/Picture/caijian/1519703535.png', '', '', '', '1', '1519703535');
INSERT INTO `modao_picture` VALUES ('114', '/Uploads/Picture/duotu/15197111480.png', '', '', '', '1', '1519711148');
INSERT INTO `modao_picture` VALUES ('115', '/Uploads/Picture/duotu/15197111481.png', '', '', '', '1', '1519711148');
INSERT INTO `modao_picture` VALUES ('116', '/Uploads/Picture/caijian/1519711623.png', '', '', '', '1', '1519711623');
INSERT INTO `modao_picture` VALUES ('117', '/Uploads/Picture/caijian/1519711648.png', '', '', '', '1', '1519711648');
INSERT INTO `modao_picture` VALUES ('118', '/Uploads/Picture/caijian/1519711670.png', '', '', '', '1', '1519711670');
INSERT INTO `modao_picture` VALUES ('119', '/Uploads/Picture/caijian/1519711706.png', '', '', '', '1', '1519711706');
INSERT INTO `modao_picture` VALUES ('120', '/Uploads/Picture/caijian/1519711725.png', '', '', '', '1', '1519711725');
INSERT INTO `modao_picture` VALUES ('121', '/Uploads/Picture/caijian/1519714420.png', '', '', '', '1', '1519714420');
INSERT INTO `modao_picture` VALUES ('122', '/Uploads/Picture/caijian/1519714589.png', '', '', '', '1', '1519714589');
INSERT INTO `modao_picture` VALUES ('123', '/Uploads/Picture/caijian/1519714604.png', '', '', '', '1', '1519714604');
INSERT INTO `modao_picture` VALUES ('124', '/Uploads/Picture/caijian/1519714617.png', '', '', '', '1', '1519714617');
INSERT INTO `modao_picture` VALUES ('125', '/Uploads/Picture/caijian/1519720154.png', '', '', '', '1', '1519720154');
INSERT INTO `modao_picture` VALUES ('126', '/Uploads/Picture/caijian/1519720226.png', '', '', '', '1', '1519720226');
INSERT INTO `modao_picture` VALUES ('127', '/Uploads/Picture/caijian/1519720226.png', '', '', '', '1', '1519720226');
INSERT INTO `modao_picture` VALUES ('128', '/Uploads/Picture/caijian/1519720236.png', '', '', '', '1', '1519720236');
INSERT INTO `modao_picture` VALUES ('129', '/Uploads/Picture/caijian/1519720246.png', '', '', '', '1', '1519720246');
INSERT INTO `modao_picture` VALUES ('130', '/Uploads/Picture/caijian/1519722714.png', '', '', '', '1', '1519722714');
INSERT INTO `modao_picture` VALUES ('131', '/Uploads/Picture/caijian/1519722781.png', '', '', '', '1', '1519722781');
INSERT INTO `modao_picture` VALUES ('132', '/Uploads/Picture/caijian/1519722950.png', '', '', '', '1', '1519722950');
INSERT INTO `modao_picture` VALUES ('133', '/Uploads/Picture/caijian/1519722959.png', '', '', '', '1', '1519722959');
INSERT INTO `modao_picture` VALUES ('134', '/Uploads/Picture/caijian/1519722969.png', '', '', '', '1', '1519722969');

-- ----------------------------
-- Table structure for modao_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `modao_ucenter_admin`;
CREATE TABLE `modao_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of modao_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for modao_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `modao_ucenter_app`;
CREATE TABLE `modao_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of modao_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for modao_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `modao_ucenter_member`;
CREATE TABLE `modao_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of modao_ucenter_member
-- ----------------------------
INSERT INTO `modao_ucenter_member` VALUES ('1', 'admin', '5f1d583f297c18754659d6a894d1b8df', '1099426482@qq.com', '', '1513648971', '2130706433', '1519785251', '2130706433', '1513648971', '1');

-- ----------------------------
-- Table structure for modao_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `modao_ucenter_setting`;
CREATE TABLE `modao_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of modao_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for modao_url
-- ----------------------------
DROP TABLE IF EXISTS `modao_url`;
CREATE TABLE `modao_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of modao_url
-- ----------------------------

-- ----------------------------
-- Table structure for modao_userdata
-- ----------------------------
DROP TABLE IF EXISTS `modao_userdata`;
CREATE TABLE `modao_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modao_userdata
-- ----------------------------
