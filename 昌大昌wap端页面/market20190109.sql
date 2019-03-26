/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50634
Source Host           : 127.0.0.1:3306
Source Database       : market

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2019-01-09 03:12:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for osc_address
-- ----------------------------
DROP TABLE IF EXISTS `osc_address`;
CREATE TABLE `osc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL COMMENT '地址',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `country_id` int(11) NOT NULL DEFAULT '0' COMMENT '县乡',
  `province_id` int(11) DEFAULT '0' COMMENT '省',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户收货地址';

-- ----------------------------
-- Records of osc_address
-- ----------------------------
INSERT INTO `osc_address` VALUES ('1', '1', '大白鲨', '15099999999', '广东省深圳市南山区蛇口美年广场4栋102', '36', '38', '1');

-- ----------------------------
-- Table structure for osc_admin
-- ----------------------------
DROP TABLE IF EXISTS `osc_admin`;
CREATE TABLE `osc_admin` (
  `admin_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `passwd` varchar(128) DEFAULT NULL,
  `true_name` varchar(20) DEFAULT NULL COMMENT '真名',
  `telephone` varchar(40) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `login_count` mediumint(8) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT '最后登录ip',
  `last_ip_region` varchar(40) DEFAULT NULL,
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `last_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `group_id` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- ----------------------------
-- Records of osc_admin
-- ----------------------------
INSERT INTO `osc_admin` VALUES ('1', 'admin', 'MDAwMDAwMDAwML+Zf61/n7CShYuSmYOqza1+hIKr', '', '', 'admin@admin.com', '111', '127.0.0.1', '', '1505270345', '0', '1559370470', '1', '0');
INSERT INTO `osc_admin` VALUES ('2', 'adminx', 'MDAwMDAwMDAwMLO3b3I', '', '15099988888', null, '1', '58.62.92.33', null, '1533191514', '0', '1535536137', '1', '2');

-- ----------------------------
-- Table structure for osc_agent
-- ----------------------------
DROP TABLE IF EXISTS `osc_agent`;
CREATE TABLE `osc_agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `total_bonus` decimal(9,3) NOT NULL COMMENT '总奖金',
  `cash` decimal(9,3) NOT NULL COMMENT '已经提现的',
  `no_cash` decimal(9,3) NOT NULL COMMENT '未提现',
  `uid` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `tel` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `id_card` varchar(64) NOT NULL,
  `bank_name` varchar(128) NOT NULL COMMENT '收款银行',
  `bank_account` varchar(128) NOT NULL COMMENT '银行账户',
  `alipay` varchar(128) NOT NULL COMMENT '支付宝账号',
  `agent_level` int(11) NOT NULL,
  `member_num` int(11) NOT NULL COMMENT '名下会员数',
  `deal_num` int(11) NOT NULL COMMENT '成交数量',
  `return_percent` decimal(4,2) NOT NULL COMMENT '返点',
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_agent
-- ----------------------------

-- ----------------------------
-- Table structure for osc_agent_apply
-- ----------------------------
DROP TABLE IF EXISTS `osc_agent_apply`;
CREATE TABLE `osc_agent_apply` (
  `aa_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `deal_time` int(11) NOT NULL COMMENT '处理时间',
  `answer` varchar(255) NOT NULL COMMENT '留言',
  `tel` varchar(20) NOT NULL COMMENT '手机号',
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `id_cart` varchar(64) NOT NULL COMMENT '身份证',
  PRIMARY KEY (`aa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商申请表';

-- ----------------------------
-- Records of osc_agent_apply
-- ----------------------------

-- ----------------------------
-- Table structure for osc_agent_bonus
-- ----------------------------
DROP TABLE IF EXISTS `osc_agent_bonus`;
CREATE TABLE `osc_agent_bonus` (
  `ab_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_num_alias` varchar(40) NOT NULL,
  `buyer_id` int(11) NOT NULL COMMENT '下单人的id',
  `bonus` decimal(9,3) NOT NULL COMMENT '奖金',
  `return_percent` decimal(4,2) NOT NULL COMMENT '提成点数',
  `order_total` decimal(6,2) NOT NULL COMMENT '订单总价',
  `pay_time` int(11) NOT NULL COMMENT '下单时间',
  `create_time` varchar(40) NOT NULL COMMENT '创建时间',
  `month_time` varchar(40) NOT NULL,
  `year_time` varchar(40) NOT NULL,
  `order_status_id` int(11) NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`ab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商分红';

-- ----------------------------
-- Records of osc_agent_bonus
-- ----------------------------

-- ----------------------------
-- Table structure for osc_agent_cash_apply
-- ----------------------------
DROP TABLE IF EXISTS `osc_agent_cash_apply`;
CREATE TABLE `osc_agent_cash_apply` (
  `aca_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `cash` decimal(9,3) NOT NULL COMMENT '提现金额',
  `bank_name` varchar(64) NOT NULL,
  `bank_account` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `tel` varchar(64) NOT NULL,
  `alipay` varchar(64) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pass_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `admin_user` varchar(40) NOT NULL COMMENT '后台操作者',
  PRIMARY KEY (`aca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商提现申请表';

-- ----------------------------
-- Records of osc_agent_cash_apply
-- ----------------------------

-- ----------------------------
-- Table structure for osc_agent_level
-- ----------------------------
DROP TABLE IF EXISTS `osc_agent_level`;
CREATE TABLE `osc_agent_level` (
  `al_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL COMMENT '等级名称',
  `return_percent` decimal(4,2) NOT NULL COMMENT '返佣比例',
  `type` int(11) NOT NULL COMMENT '代理等级',
  PRIMARY KEY (`al_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_agent_level
-- ----------------------------

-- ----------------------------
-- Table structure for osc_area
-- ----------------------------
DROP TABLE IF EXISTS `osc_area`;
CREATE TABLE `osc_area` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区父ID',
  `area_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '地区深度，从1开始',
  PRIMARY KEY (`area_id`),
  KEY `area_parent_id` (`area_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45056 DEFAULT CHARSET=utf8 COMMENT='地区表';

-- ----------------------------
-- Records of osc_area
-- ----------------------------
INSERT INTO `osc_area` VALUES ('1', '北京', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('2', '天津', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('3', '河北省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('4', '山西省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('5', '内蒙古自治区', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('6', '辽宁省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('7', '吉林省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('8', '黑龙江省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('9', '上海', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('10', '江苏省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('11', '浙江省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('12', '安徽省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('13', '福建省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('14', '江西省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('15', '山东省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('16', '河南省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('17', '湖北省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('18', '湖南省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('19', '广东省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('20', '广西壮族自治区', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('21', '海南省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('22', '重庆', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('23', '四川省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('24', '贵州省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('25', '云南省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('26', '西藏自治区', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('27', '陕西省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('28', '甘肃省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('29', '青海省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('30', '宁夏回族自治区', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('31', '新疆维吾尔自治区', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('32', '台湾省', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('33', '香港特别行政区', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('34', '澳门特别行政区', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('35', '海外', '0', '0', '1');
INSERT INTO `osc_area` VALUES ('36', '北京市', '1', '0', '2');
INSERT INTO `osc_area` VALUES ('37', '东城区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('38', '西城区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('39', '上海市', '9', '0', '2');
INSERT INTO `osc_area` VALUES ('40', '天津市', '2', '0', '2');
INSERT INTO `osc_area` VALUES ('41', '朝阳区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('42', '丰台区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('43', '石景山区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('44', '海淀区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('45', '门头沟区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('46', '房山区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('47', '通州区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('48', '顺义区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('49', '昌平区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('50', '大兴区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('51', '怀柔区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('52', '平谷区', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('53', '密云县', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('54', '延庆县', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('55', '和平区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('56', '河东区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('57', '河西区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('58', '南开区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('59', '河北区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('60', '红桥区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('61', '塘沽区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('62', '重庆市', '22', '0', '2');
INSERT INTO `osc_area` VALUES ('64', '东丽区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('65', '西青区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('66', '津南区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('67', '北辰区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('68', '武清区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('69', '宝坻区', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('70', '宁河县', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('71', '静海县', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('72', '蓟县', '40', '0', '3');
INSERT INTO `osc_area` VALUES ('73', '石家庄市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('74', '唐山市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('75', '秦皇岛市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('76', '邯郸市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('77', '邢台市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('78', '保定市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('79', '张家口市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('80', '承德市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('81', '衡水市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('82', '廊坊市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('83', '沧州市', '3', '0', '2');
INSERT INTO `osc_area` VALUES ('84', '太原市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('85', '大同市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('86', '阳泉市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('87', '长治市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('88', '晋城市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('89', '朔州市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('90', '晋中市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('91', '运城市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('92', '忻州市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('93', '临汾市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('94', '吕梁市', '4', '0', '2');
INSERT INTO `osc_area` VALUES ('95', '呼和浩特市', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('96', '包头市', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('97', '乌海市', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('98', '赤峰市', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('99', '通辽市', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('100', '鄂尔多斯市', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('101', '呼伦贝尔市', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('102', '巴彦淖尔市', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('103', '乌兰察布市', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('104', '兴安盟', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('105', '锡林郭勒盟', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('106', '阿拉善盟', '5', '0', '2');
INSERT INTO `osc_area` VALUES ('107', '沈阳市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('108', '大连市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('109', '鞍山市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('110', '抚顺市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('111', '本溪市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('112', '丹东市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('113', '锦州市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('114', '营口市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('115', '阜新市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('116', '辽阳市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('117', '盘锦市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('118', '铁岭市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('119', '朝阳市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('120', '葫芦岛市', '6', '0', '2');
INSERT INTO `osc_area` VALUES ('121', '长春市', '7', '0', '2');
INSERT INTO `osc_area` VALUES ('122', '吉林市', '7', '0', '2');
INSERT INTO `osc_area` VALUES ('123', '四平市', '7', '0', '2');
INSERT INTO `osc_area` VALUES ('124', '辽源市', '7', '0', '2');
INSERT INTO `osc_area` VALUES ('125', '通化市', '7', '0', '2');
INSERT INTO `osc_area` VALUES ('126', '白山市', '7', '0', '2');
INSERT INTO `osc_area` VALUES ('127', '松原市', '7', '0', '2');
INSERT INTO `osc_area` VALUES ('128', '白城市', '7', '0', '2');
INSERT INTO `osc_area` VALUES ('129', '延边朝鲜族自治州', '7', '0', '2');
INSERT INTO `osc_area` VALUES ('130', '哈尔滨市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('131', '齐齐哈尔市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('132', '鸡西市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('133', '鹤岗市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('134', '双鸭山市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('135', '大庆市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('136', '伊春市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('137', '佳木斯市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('138', '七台河市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('139', '牡丹江市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('140', '黑河市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('141', '绥化市', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('142', '大兴安岭地区', '8', '0', '2');
INSERT INTO `osc_area` VALUES ('143', '黄浦区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('144', '卢湾区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('145', '徐汇区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('146', '长宁区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('147', '静安区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('148', '普陀区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('149', '闸北区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('150', '虹口区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('151', '杨浦区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('152', '闵行区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('153', '宝山区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('154', '嘉定区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('155', '浦东新区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('156', '金山区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('157', '松江区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('158', '青浦区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('159', '南汇区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('160', '奉贤区', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('161', '崇明县', '39', '0', '3');
INSERT INTO `osc_area` VALUES ('162', '南京市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('163', '无锡市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('164', '徐州市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('165', '常州市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('166', '苏州市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('167', '南通市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('168', '连云港市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('169', '淮安市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('170', '盐城市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('171', '扬州市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('172', '镇江市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('173', '泰州市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('174', '宿迁市', '10', '0', '2');
INSERT INTO `osc_area` VALUES ('175', '杭州市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('176', '宁波市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('177', '温州市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('178', '嘉兴市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('179', '湖州市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('180', '绍兴市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('181', '舟山市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('182', '衢州市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('183', '金华市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('184', '台州市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('185', '丽水市', '11', '0', '2');
INSERT INTO `osc_area` VALUES ('186', '合肥市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('187', '芜湖市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('188', '蚌埠市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('189', '淮南市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('190', '马鞍山市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('191', '淮北市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('192', '铜陵市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('193', '安庆市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('194', '黄山市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('195', '滁州市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('196', '阜阳市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('197', '宿州市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('198', '巢湖市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('199', '六安市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('200', '亳州市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('201', '池州市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('202', '宣城市', '12', '0', '2');
INSERT INTO `osc_area` VALUES ('203', '福州市', '13', '0', '2');
INSERT INTO `osc_area` VALUES ('204', '厦门市', '13', '0', '2');
INSERT INTO `osc_area` VALUES ('205', '莆田市', '13', '0', '2');
INSERT INTO `osc_area` VALUES ('206', '三明市', '13', '0', '2');
INSERT INTO `osc_area` VALUES ('207', '泉州市', '13', '0', '2');
INSERT INTO `osc_area` VALUES ('208', '漳州市', '13', '0', '2');
INSERT INTO `osc_area` VALUES ('209', '南平市', '13', '0', '2');
INSERT INTO `osc_area` VALUES ('210', '龙岩市', '13', '0', '2');
INSERT INTO `osc_area` VALUES ('211', '宁德市', '13', '0', '2');
INSERT INTO `osc_area` VALUES ('212', '南昌市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('213', '景德镇市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('214', '萍乡市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('215', '九江市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('216', '新余市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('217', '鹰潭市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('218', '赣州市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('219', '吉安市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('220', '宜春市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('221', '抚州市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('222', '上饶市', '14', '0', '2');
INSERT INTO `osc_area` VALUES ('223', '济南市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('224', '青岛市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('225', '淄博市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('226', '枣庄市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('227', '东营市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('228', '烟台市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('229', '潍坊市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('230', '济宁市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('231', '泰安市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('232', '威海市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('233', '日照市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('234', '莱芜市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('235', '临沂市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('236', '德州市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('237', '聊城市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('238', '滨州市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('239', '菏泽市', '15', '0', '2');
INSERT INTO `osc_area` VALUES ('240', '郑州市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('241', '开封市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('242', '洛阳市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('243', '平顶山市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('244', '安阳市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('245', '鹤壁市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('246', '新乡市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('247', '焦作市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('248', '濮阳市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('249', '许昌市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('250', '漯河市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('251', '三门峡市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('252', '南阳市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('253', '商丘市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('254', '信阳市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('255', '周口市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('256', '驻马店市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('257', '济源市', '16', '0', '2');
INSERT INTO `osc_area` VALUES ('258', '武汉市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('259', '黄石市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('260', '十堰市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('261', '宜昌市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('262', '襄樊市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('263', '鄂州市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('264', '荆门市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('265', '孝感市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('266', '荆州市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('267', '黄冈市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('268', '咸宁市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('269', '随州市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('270', '恩施土家族苗族自治州', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('271', '仙桃市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('272', '潜江市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('273', '天门市', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('274', '神农架林区', '17', '0', '2');
INSERT INTO `osc_area` VALUES ('275', '长沙市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('276', '株洲市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('277', '湘潭市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('278', '衡阳市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('279', '邵阳市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('280', '岳阳市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('281', '常德市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('282', '张家界市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('283', '益阳市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('284', '郴州市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('285', '永州市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('286', '怀化市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('287', '娄底市', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('288', '湘西土家族苗族自治州', '18', '0', '2');
INSERT INTO `osc_area` VALUES ('289', '广州市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('290', '韶关市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('291', '深圳市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('292', '珠海市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('293', '汕头市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('294', '佛山市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('295', '江门市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('296', '湛江市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('297', '茂名市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('298', '肇庆市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('299', '惠州市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('300', '梅州市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('301', '汕尾市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('302', '河源市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('303', '阳江市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('304', '清远市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('305', '东莞市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('306', '中山市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('307', '潮州市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('308', '揭阳市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('309', '云浮市', '19', '0', '2');
INSERT INTO `osc_area` VALUES ('310', '南宁市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('311', '柳州市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('312', '桂林市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('313', '梧州市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('314', '北海市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('315', '防城港市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('316', '钦州市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('317', '贵港市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('318', '玉林市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('319', '百色市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('320', '贺州市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('321', '河池市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('322', '来宾市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('323', '崇左市', '20', '0', '2');
INSERT INTO `osc_area` VALUES ('324', '海口市', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('325', '三亚市', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('326', '五指山市', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('327', '琼海市', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('328', '儋州市', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('329', '文昌市', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('330', '万宁市', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('331', '东方市', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('332', '定安县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('333', '屯昌县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('334', '澄迈县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('335', '临高县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('336', '白沙黎族自治县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('337', '昌江黎族自治县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('338', '乐东黎族自治县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('339', '陵水黎族自治县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('340', '保亭黎族苗族自治县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('341', '琼中黎族苗族自治县', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('342', '西沙群岛', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('343', '南沙群岛', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('344', '中沙群岛的岛礁及其海域', '21', '0', '2');
INSERT INTO `osc_area` VALUES ('345', '万州区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('346', '涪陵区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('347', '渝中区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('348', '大渡口区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('349', '江北区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('350', '沙坪坝区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('351', '九龙坡区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('352', '南岸区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('353', '北碚区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('354', '双桥区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('355', '万盛区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('356', '渝北区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('357', '巴南区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('358', '黔江区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('359', '长寿区', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('360', '綦江县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('361', '潼南县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('362', '铜梁县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('363', '大足县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('364', '荣昌县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('365', '璧山县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('366', '梁平县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('367', '城口县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('368', '丰都县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('369', '垫江县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('370', '武隆县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('371', '忠县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('372', '开县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('373', '云阳县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('374', '奉节县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('375', '巫山县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('376', '巫溪县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('377', '石柱土家族自治县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('378', '秀山土家族苗族自治县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('379', '酉阳土家族苗族自治县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('380', '彭水苗族土家族自治县', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('381', '江津市', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('382', '合川市', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('383', '永川市', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('384', '南川市', '62', '0', '3');
INSERT INTO `osc_area` VALUES ('385', '成都市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('386', '自贡市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('387', '攀枝花市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('388', '泸州市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('389', '德阳市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('390', '绵阳市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('391', '广元市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('392', '遂宁市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('393', '内江市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('394', '乐山市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('395', '南充市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('396', '眉山市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('397', '宜宾市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('398', '广安市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('399', '达州市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('400', '雅安市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('401', '巴中市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('402', '资阳市', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('403', '阿坝藏族羌族自治州', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('404', '甘孜藏族自治州', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('405', '凉山彝族自治州', '23', '0', '2');
INSERT INTO `osc_area` VALUES ('406', '贵阳市', '24', '0', '2');
INSERT INTO `osc_area` VALUES ('407', '六盘水市', '24', '0', '2');
INSERT INTO `osc_area` VALUES ('408', '遵义市', '24', '0', '2');
INSERT INTO `osc_area` VALUES ('409', '安顺市', '24', '0', '2');
INSERT INTO `osc_area` VALUES ('410', '铜仁地区', '24', '0', '2');
INSERT INTO `osc_area` VALUES ('411', '黔西南布依族苗族自治州', '24', '0', '2');
INSERT INTO `osc_area` VALUES ('412', '毕节地区', '24', '0', '2');
INSERT INTO `osc_area` VALUES ('413', '黔东南苗族侗族自治州', '24', '0', '2');
INSERT INTO `osc_area` VALUES ('414', '黔南布依族苗族自治州', '24', '0', '2');
INSERT INTO `osc_area` VALUES ('415', '昆明市', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('416', '曲靖市', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('417', '玉溪市', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('418', '保山市', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('419', '昭通市', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('420', '丽江市', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('421', '思茅市', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('422', '临沧市', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('423', '楚雄彝族自治州', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('424', '红河哈尼族彝族自治州', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('425', '文山壮族苗族自治州', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('426', '西双版纳傣族自治州', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('427', '大理白族自治州', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('428', '德宏傣族景颇族自治州', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('429', '怒江傈僳族自治州', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('430', '迪庆藏族自治州', '25', '0', '2');
INSERT INTO `osc_area` VALUES ('431', '拉萨市', '26', '0', '2');
INSERT INTO `osc_area` VALUES ('432', '昌都地区', '26', '0', '2');
INSERT INTO `osc_area` VALUES ('433', '山南地区', '26', '0', '2');
INSERT INTO `osc_area` VALUES ('434', '日喀则地区', '26', '0', '2');
INSERT INTO `osc_area` VALUES ('435', '那曲地区', '26', '0', '2');
INSERT INTO `osc_area` VALUES ('436', '阿里地区', '26', '0', '2');
INSERT INTO `osc_area` VALUES ('437', '林芝地区', '26', '0', '2');
INSERT INTO `osc_area` VALUES ('438', '西安市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('439', '铜川市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('440', '宝鸡市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('441', '咸阳市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('442', '渭南市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('443', '延安市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('444', '汉中市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('445', '榆林市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('446', '安康市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('447', '商洛市', '27', '0', '2');
INSERT INTO `osc_area` VALUES ('448', '兰州市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('449', '嘉峪关市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('450', '金昌市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('451', '白银市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('452', '天水市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('453', '武威市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('454', '张掖市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('455', '平凉市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('456', '酒泉市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('457', '庆阳市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('458', '定西市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('459', '陇南市', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('460', '临夏回族自治州', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('461', '甘南藏族自治州', '28', '0', '2');
INSERT INTO `osc_area` VALUES ('462', '西宁市', '29', '0', '2');
INSERT INTO `osc_area` VALUES ('463', '海东地区', '29', '0', '2');
INSERT INTO `osc_area` VALUES ('464', '海北藏族自治州', '29', '0', '2');
INSERT INTO `osc_area` VALUES ('465', '黄南藏族自治州', '29', '0', '2');
INSERT INTO `osc_area` VALUES ('466', '海南藏族自治州', '29', '0', '2');
INSERT INTO `osc_area` VALUES ('467', '果洛藏族自治州', '29', '0', '2');
INSERT INTO `osc_area` VALUES ('468', '玉树藏族自治州', '29', '0', '2');
INSERT INTO `osc_area` VALUES ('469', '海西蒙古族藏族自治州', '29', '0', '2');
INSERT INTO `osc_area` VALUES ('470', '银川市', '30', '0', '2');
INSERT INTO `osc_area` VALUES ('471', '石嘴山市', '30', '0', '2');
INSERT INTO `osc_area` VALUES ('472', '吴忠市', '30', '0', '2');
INSERT INTO `osc_area` VALUES ('473', '固原市', '30', '0', '2');
INSERT INTO `osc_area` VALUES ('474', '中卫市', '30', '0', '2');
INSERT INTO `osc_area` VALUES ('475', '乌鲁木齐市', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('476', '克拉玛依市', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('477', '吐鲁番地区', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('478', '哈密地区', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('479', '昌吉回族自治州', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('480', '博尔塔拉蒙古自治州', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('481', '巴音郭楞蒙古自治州', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('482', '阿克苏地区', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('483', '克孜勒苏柯尔克孜自治州', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('484', '喀什地区', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('485', '和田地区', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('486', '伊犁哈萨克自治州', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('487', '塔城地区', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('488', '阿勒泰地区', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('489', '石河子市', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('490', '阿拉尔市', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('491', '图木舒克市', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('492', '五家渠市', '31', '0', '2');
INSERT INTO `osc_area` VALUES ('493', '台北市', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('494', '高雄市', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('495', '基隆市', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('496', '台中市', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('497', '台南市', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('498', '新竹市', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('499', '嘉义市', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('500', '台北县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('501', '宜兰县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('502', '桃园县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('503', '新竹县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('504', '苗栗县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('505', '台中县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('506', '彰化县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('507', '南投县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('508', '云林县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('509', '嘉义县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('510', '台南县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('511', '高雄县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('512', '屏东县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('513', '澎湖县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('514', '台东县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('515', '花莲县', '32', '0', '2');
INSERT INTO `osc_area` VALUES ('516', '中西区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('517', '东区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('518', '九龙城区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('519', '观塘区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('520', '南区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('521', '深水埗区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('522', '黄大仙区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('523', '湾仔区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('524', '油尖旺区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('525', '离岛区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('526', '葵青区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('527', '北区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('528', '西贡区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('529', '沙田区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('530', '屯门区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('531', '大埔区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('532', '荃湾区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('533', '元朗区', '33', '0', '2');
INSERT INTO `osc_area` VALUES ('534', '澳门特别行政区', '34', '0', '2');
INSERT INTO `osc_area` VALUES ('535', '美国', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('536', '加拿大', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('537', '澳大利亚', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('538', '新西兰', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('539', '英国', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('540', '法国', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('541', '德国', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('542', '捷克', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('543', '荷兰', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('544', '瑞士', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('545', '希腊', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('546', '挪威', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('547', '瑞典', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('548', '丹麦', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('549', '芬兰', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('550', '爱尔兰', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('551', '奥地利', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('552', '意大利', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('553', '乌克兰', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('554', '俄罗斯', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('555', '西班牙', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('556', '韩国', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('557', '新加坡', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('558', '马来西亚', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('559', '印度', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('560', '泰国', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('561', '日本', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('562', '巴西', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('563', '阿根廷', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('564', '南非', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('565', '埃及', '45055', '0', '3');
INSERT INTO `osc_area` VALUES ('566', '其他', '36', '0', '3');
INSERT INTO `osc_area` VALUES ('1126', '井陉县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1127', '井陉矿区', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1128', '元氏县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1129', '平山县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1130', '新乐市', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1131', '新华区', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1132', '无极县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1133', '晋州市', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1134', '栾城县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1135', '桥东区', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1136', '桥西区', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1137', '正定县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1138', '深泽县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1139', '灵寿县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1140', '藁城市', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1141', '行唐县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1142', '裕华区', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1143', '赞皇县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1144', '赵县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1145', '辛集市', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1146', '长安区', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1147', '高邑县', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1148', '鹿泉市', '73', '0', '3');
INSERT INTO `osc_area` VALUES ('1149', '丰南区', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1150', '丰润区', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1151', '乐亭县', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1152', '古冶区', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1153', '唐海县', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1154', '开平区', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1155', '滦南县', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1156', '滦县', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1157', '玉田县', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1158', '路北区', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1159', '路南区', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1160', '迁安市', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1161', '迁西县', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1162', '遵化市', '74', '0', '3');
INSERT INTO `osc_area` VALUES ('1163', '北戴河区', '75', '0', '3');
INSERT INTO `osc_area` VALUES ('1164', '卢龙县', '75', '0', '3');
INSERT INTO `osc_area` VALUES ('1165', '山海关区', '75', '0', '3');
INSERT INTO `osc_area` VALUES ('1166', '抚宁县', '75', '0', '3');
INSERT INTO `osc_area` VALUES ('1167', '昌黎县', '75', '0', '3');
INSERT INTO `osc_area` VALUES ('1168', '海港区', '75', '0', '3');
INSERT INTO `osc_area` VALUES ('1169', '青龙满族自治县', '75', '0', '3');
INSERT INTO `osc_area` VALUES ('1170', '丛台区', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1171', '临漳县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1172', '复兴区', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1173', '大名县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1174', '峰峰矿区', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1175', '广平县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1176', '成安县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1177', '曲周县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1178', '武安市', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1179', '永年县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1180', '涉县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1181', '磁县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1182', '肥乡县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1183', '邯山区', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1184', '邯郸县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1185', '邱县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1186', '馆陶县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1187', '魏县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1188', '鸡泽县', '76', '0', '3');
INSERT INTO `osc_area` VALUES ('1189', '临城县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1190', '临西县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1191', '任县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1192', '内丘县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1193', '南和县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1194', '南宫市', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1195', '威县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1196', '宁晋县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1197', '巨鹿县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1198', '平乡县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1199', '广宗县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1200', '新河县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1201', '柏乡县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1202', '桥东区', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1203', '桥西区', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1204', '沙河市', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1205', '清河县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1206', '邢台县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1207', '隆尧县', '77', '0', '3');
INSERT INTO `osc_area` VALUES ('1208', '北市区', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1209', '南市区', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1210', '博野县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1211', '唐县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1212', '安国市', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1213', '安新县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1214', '定兴县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1215', '定州市', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1216', '容城县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1217', '徐水县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1218', '新市区', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1219', '易县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1220', '曲阳县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1221', '望都县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1222', '涞水县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1223', '涞源县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1224', '涿州市', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1225', '清苑县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1226', '满城县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1227', '蠡县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1228', '阜平县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1229', '雄县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1230', '顺平县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1231', '高碑店市', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1232', '高阳县', '78', '0', '3');
INSERT INTO `osc_area` VALUES ('1233', '万全县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1234', '下花园区', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1235', '宣化区', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1236', '宣化县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1237', '尚义县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1238', '崇礼县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1239', '康保县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1240', '张北县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1241', '怀安县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1242', '怀来县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1243', '桥东区', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1244', '桥西区', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1245', '沽源县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1246', '涿鹿县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1247', '蔚县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1248', '赤城县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1249', '阳原县', '79', '0', '3');
INSERT INTO `osc_area` VALUES ('1250', '丰宁满族自治县', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1251', '兴隆县', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1252', '双桥区', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1253', '双滦区', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1254', '围场满族蒙古族自治县', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1255', '宽城满族自治县', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1256', '平泉县', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1257', '承德县', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1258', '滦平县', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1259', '隆化县', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1260', '鹰手营子矿区', '80', '0', '3');
INSERT INTO `osc_area` VALUES ('1261', '冀州市', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1262', '安平县', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1263', '故城县', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1264', '景县', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1265', '枣强县', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1266', '桃城区', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1267', '武强县', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1268', '武邑县', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1269', '深州市', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1270', '阜城县', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1271', '饶阳县', '81', '0', '3');
INSERT INTO `osc_area` VALUES ('1272', '三河市', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1273', '固安县', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1274', '大厂回族自治县', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1275', '大城县', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1276', '安次区', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1277', '广阳区', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1278', '文安县', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1279', '永清县', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1280', '霸州市', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1281', '香河县', '82', '0', '3');
INSERT INTO `osc_area` VALUES ('1282', '东光县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1283', '任丘市', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1284', '南皮县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1285', '吴桥县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1286', '孟村回族自治县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1287', '新华区', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1288', '沧县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1289', '河间市', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1290', '泊头市', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1291', '海兴县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1292', '献县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1293', '盐山县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1294', '肃宁县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1295', '运河区', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1296', '青县', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1297', '黄骅市', '83', '0', '3');
INSERT INTO `osc_area` VALUES ('1298', '万柏林区', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1299', '古交市', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1300', '娄烦县', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1301', '小店区', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1302', '尖草坪区', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1303', '晋源区', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1304', '杏花岭区', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1305', '清徐县', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1306', '迎泽区', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1307', '阳曲县', '84', '0', '3');
INSERT INTO `osc_area` VALUES ('1308', '南郊区', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1309', '城区', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1310', '大同县', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1311', '天镇县', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1312', '左云县', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1313', '广灵县', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1314', '新荣区', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1315', '浑源县', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1316', '灵丘县', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1317', '矿区', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1318', '阳高县', '85', '0', '3');
INSERT INTO `osc_area` VALUES ('1319', '城区', '86', '0', '3');
INSERT INTO `osc_area` VALUES ('1320', '平定县', '86', '0', '3');
INSERT INTO `osc_area` VALUES ('1321', '盂县', '86', '0', '3');
INSERT INTO `osc_area` VALUES ('1322', '矿区', '86', '0', '3');
INSERT INTO `osc_area` VALUES ('1323', '郊区', '86', '0', '3');
INSERT INTO `osc_area` VALUES ('1324', '城区', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1325', '壶关县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1326', '屯留县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1327', '平顺县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1328', '武乡县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1329', '沁县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1330', '沁源县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1331', '潞城市', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1332', '襄垣县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1333', '郊区', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1334', '长子县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1335', '长治县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1336', '黎城县', '87', '0', '3');
INSERT INTO `osc_area` VALUES ('1337', '城区', '88', '0', '3');
INSERT INTO `osc_area` VALUES ('1338', '沁水县', '88', '0', '3');
INSERT INTO `osc_area` VALUES ('1339', '泽州县', '88', '0', '3');
INSERT INTO `osc_area` VALUES ('1340', '阳城县', '88', '0', '3');
INSERT INTO `osc_area` VALUES ('1341', '陵川县', '88', '0', '3');
INSERT INTO `osc_area` VALUES ('1342', '高平市', '88', '0', '3');
INSERT INTO `osc_area` VALUES ('1343', '右玉县', '89', '0', '3');
INSERT INTO `osc_area` VALUES ('1344', '山阴县', '89', '0', '3');
INSERT INTO `osc_area` VALUES ('1345', '平鲁区', '89', '0', '3');
INSERT INTO `osc_area` VALUES ('1346', '应县', '89', '0', '3');
INSERT INTO `osc_area` VALUES ('1347', '怀仁县', '89', '0', '3');
INSERT INTO `osc_area` VALUES ('1348', '朔城区', '89', '0', '3');
INSERT INTO `osc_area` VALUES ('1349', '介休市', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1350', '和顺县', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1351', '太谷县', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1352', '寿阳县', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1353', '左权县', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1354', '平遥县', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1355', '昔阳县', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1356', '榆次区', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1357', '榆社县', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1358', '灵石县', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1359', '祁县', '90', '0', '3');
INSERT INTO `osc_area` VALUES ('1360', '万荣县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1361', '临猗县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1362', '垣曲县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1363', '夏县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1364', '平陆县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1365', '新绛县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1366', '永济市', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1367', '河津市', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1368', '盐湖区', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1369', '稷山县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1370', '绛县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1371', '芮城县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1372', '闻喜县', '91', '0', '3');
INSERT INTO `osc_area` VALUES ('1373', '五台县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1374', '五寨县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1375', '代县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1376', '保德县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1377', '偏关县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1378', '原平市', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1379', '宁武县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1380', '定襄县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1381', '岢岚县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1382', '忻府区', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1383', '河曲县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1384', '神池县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1385', '繁峙县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1386', '静乐县', '92', '0', '3');
INSERT INTO `osc_area` VALUES ('1387', '乡宁县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1388', '侯马市', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1389', '古县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1390', '吉县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1391', '大宁县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1392', '安泽县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1393', '尧都区', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1394', '曲沃县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1395', '永和县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1396', '汾西县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1397', '洪洞县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1398', '浮山县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1399', '翼城县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1400', '蒲县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1401', '襄汾县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1402', '隰县', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1403', '霍州市', '93', '0', '3');
INSERT INTO `osc_area` VALUES ('1404', '中阳县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1405', '临县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1406', '交口县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1407', '交城县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1408', '兴县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1409', '孝义市', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1410', '岚县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1411', '文水县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1412', '方山县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1413', '柳林县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1414', '汾阳市', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1415', '石楼县', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1416', '离石区', '94', '0', '3');
INSERT INTO `osc_area` VALUES ('1417', '和林格尔县', '95', '0', '3');
INSERT INTO `osc_area` VALUES ('1418', '回民区', '95', '0', '3');
INSERT INTO `osc_area` VALUES ('1419', '土默特左旗', '95', '0', '3');
INSERT INTO `osc_area` VALUES ('1420', '托克托县', '95', '0', '3');
INSERT INTO `osc_area` VALUES ('1421', '新城区', '95', '0', '3');
INSERT INTO `osc_area` VALUES ('1422', '武川县', '95', '0', '3');
INSERT INTO `osc_area` VALUES ('1423', '清水河县', '95', '0', '3');
INSERT INTO `osc_area` VALUES ('1424', '玉泉区', '95', '0', '3');
INSERT INTO `osc_area` VALUES ('1425', '赛罕区', '95', '0', '3');
INSERT INTO `osc_area` VALUES ('1426', '东河区', '96', '0', '3');
INSERT INTO `osc_area` VALUES ('1427', '九原区', '96', '0', '3');
INSERT INTO `osc_area` VALUES ('1428', '固阳县', '96', '0', '3');
INSERT INTO `osc_area` VALUES ('1429', '土默特右旗', '96', '0', '3');
INSERT INTO `osc_area` VALUES ('1430', '昆都仑区', '96', '0', '3');
INSERT INTO `osc_area` VALUES ('1431', '白云矿区', '96', '0', '3');
INSERT INTO `osc_area` VALUES ('1432', '石拐区', '96', '0', '3');
INSERT INTO `osc_area` VALUES ('1433', '达尔罕茂明安联合旗', '96', '0', '3');
INSERT INTO `osc_area` VALUES ('1434', '青山区', '96', '0', '3');
INSERT INTO `osc_area` VALUES ('1435', '乌达区', '97', '0', '3');
INSERT INTO `osc_area` VALUES ('1436', '海勃湾区', '97', '0', '3');
INSERT INTO `osc_area` VALUES ('1437', '海南区', '97', '0', '3');
INSERT INTO `osc_area` VALUES ('1438', '元宝山区', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1439', '克什克腾旗', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1440', '喀喇沁旗', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1441', '宁城县', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1442', '巴林右旗', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1443', '巴林左旗', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1444', '敖汉旗', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1445', '松山区', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1446', '林西县', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1447', '红山区', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1448', '翁牛特旗', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1449', '阿鲁科尔沁旗', '98', '0', '3');
INSERT INTO `osc_area` VALUES ('1450', '奈曼旗', '99', '0', '3');
INSERT INTO `osc_area` VALUES ('1451', '库伦旗', '99', '0', '3');
INSERT INTO `osc_area` VALUES ('1452', '开鲁县', '99', '0', '3');
INSERT INTO `osc_area` VALUES ('1453', '扎鲁特旗', '99', '0', '3');
INSERT INTO `osc_area` VALUES ('1454', '科尔沁区', '99', '0', '3');
INSERT INTO `osc_area` VALUES ('1455', '科尔沁左翼中旗', '99', '0', '3');
INSERT INTO `osc_area` VALUES ('1456', '科尔沁左翼后旗', '99', '0', '3');
INSERT INTO `osc_area` VALUES ('1457', '霍林郭勒市', '99', '0', '3');
INSERT INTO `osc_area` VALUES ('1458', '东胜区', '100', '0', '3');
INSERT INTO `osc_area` VALUES ('1459', '乌审旗', '100', '0', '3');
INSERT INTO `osc_area` VALUES ('1460', '伊金霍洛旗', '100', '0', '3');
INSERT INTO `osc_area` VALUES ('1461', '准格尔旗', '100', '0', '3');
INSERT INTO `osc_area` VALUES ('1462', '杭锦旗', '100', '0', '3');
INSERT INTO `osc_area` VALUES ('1463', '达拉特旗', '100', '0', '3');
INSERT INTO `osc_area` VALUES ('1464', '鄂东胜区', '100', '0', '3');
INSERT INTO `osc_area` VALUES ('1465', '鄂托克前旗', '100', '0', '3');
INSERT INTO `osc_area` VALUES ('1466', '鄂托克旗', '100', '0', '3');
INSERT INTO `osc_area` VALUES ('1467', '扎兰屯市', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1468', '新巴尔虎右旗', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1469', '新巴尔虎左旗', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1470', '根河市', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1471', '海拉尔区', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1472', '满洲里市', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1473', '牙克石市', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1474', '莫力达瓦达斡尔族自治旗', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1475', '鄂伦春自治旗', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1476', '鄂温克族自治旗', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1477', '阿荣旗', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1478', '陈巴尔虎旗', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1479', '额尔古纳市', '101', '0', '3');
INSERT INTO `osc_area` VALUES ('1480', '临河区', '102', '0', '3');
INSERT INTO `osc_area` VALUES ('1481', '乌拉特中旗', '102', '0', '3');
INSERT INTO `osc_area` VALUES ('1482', '乌拉特前旗', '102', '0', '3');
INSERT INTO `osc_area` VALUES ('1483', '乌拉特后旗', '102', '0', '3');
INSERT INTO `osc_area` VALUES ('1484', '五原县', '102', '0', '3');
INSERT INTO `osc_area` VALUES ('1485', '杭锦后旗', '102', '0', '3');
INSERT INTO `osc_area` VALUES ('1486', '磴口县', '102', '0', '3');
INSERT INTO `osc_area` VALUES ('1487', '丰镇市', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1488', '兴和县', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1489', '凉城县', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1490', '化德县', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1491', '卓资县', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1492', '商都县', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1493', '四子王旗', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1494', '察哈尔右翼中旗', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1495', '察哈尔右翼前旗', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1496', '察哈尔右翼后旗', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1497', '集宁区', '103', '0', '3');
INSERT INTO `osc_area` VALUES ('1498', '乌兰浩特市', '104', '0', '3');
INSERT INTO `osc_area` VALUES ('1499', '扎赉特旗', '104', '0', '3');
INSERT INTO `osc_area` VALUES ('1500', '科尔沁右翼中旗', '104', '0', '3');
INSERT INTO `osc_area` VALUES ('1501', '科尔沁右翼前旗', '104', '0', '3');
INSERT INTO `osc_area` VALUES ('1502', '突泉县', '104', '0', '3');
INSERT INTO `osc_area` VALUES ('1503', '阿尔山市', '104', '0', '3');
INSERT INTO `osc_area` VALUES ('1504', '东乌珠穆沁旗', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1505', '二连浩特市', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1506', '多伦县', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1507', '太仆寺旗', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1508', '正蓝旗', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1509', '正镶白旗', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1510', '苏尼特右旗', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1511', '苏尼特左旗', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1512', '西乌珠穆沁旗', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1513', '锡林浩特市', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1514', '镶黄旗', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1515', '阿巴嘎旗', '105', '0', '3');
INSERT INTO `osc_area` VALUES ('1516', '阿拉善右旗', '106', '0', '3');
INSERT INTO `osc_area` VALUES ('1517', '阿拉善左旗', '106', '0', '3');
INSERT INTO `osc_area` VALUES ('1518', '额济纳旗', '106', '0', '3');
INSERT INTO `osc_area` VALUES ('1519', '东陵区', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1520', '于洪区', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1521', '和平区', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1522', '大东区', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1523', '康平县', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1524', '新民市', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1525', '沈北新区', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1526', '沈河区', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1527', '法库县', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1528', '皇姑区', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1529', '苏家屯区', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1530', '辽中县', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1531', '铁西区', '107', '0', '3');
INSERT INTO `osc_area` VALUES ('1532', '中山区', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1533', '庄河市', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1534', '旅顺口区', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1535', '普兰店市', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1536', '沙河口区', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1537', '瓦房店市', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1538', '甘井子区', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1539', '西岗区', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1540', '金州区', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1541', '长海县', '108', '0', '3');
INSERT INTO `osc_area` VALUES ('1542', '千山区', '109', '0', '3');
INSERT INTO `osc_area` VALUES ('1543', '台安县', '109', '0', '3');
INSERT INTO `osc_area` VALUES ('1544', '岫岩满族自治县', '109', '0', '3');
INSERT INTO `osc_area` VALUES ('1545', '海城市', '109', '0', '3');
INSERT INTO `osc_area` VALUES ('1546', '立山区', '109', '0', '3');
INSERT INTO `osc_area` VALUES ('1547', '铁东区', '109', '0', '3');
INSERT INTO `osc_area` VALUES ('1548', '铁西区', '109', '0', '3');
INSERT INTO `osc_area` VALUES ('1549', '东洲区', '110', '0', '3');
INSERT INTO `osc_area` VALUES ('1550', '抚顺县', '110', '0', '3');
INSERT INTO `osc_area` VALUES ('1551', '新宾满族自治县', '110', '0', '3');
INSERT INTO `osc_area` VALUES ('1552', '新抚区', '110', '0', '3');
INSERT INTO `osc_area` VALUES ('1553', '望花区', '110', '0', '3');
INSERT INTO `osc_area` VALUES ('1554', '清原满族自治县', '110', '0', '3');
INSERT INTO `osc_area` VALUES ('1555', '顺城区', '110', '0', '3');
INSERT INTO `osc_area` VALUES ('1556', '南芬区', '111', '0', '3');
INSERT INTO `osc_area` VALUES ('1557', '平山区', '111', '0', '3');
INSERT INTO `osc_area` VALUES ('1558', '明山区', '111', '0', '3');
INSERT INTO `osc_area` VALUES ('1559', '本溪满族自治县', '111', '0', '3');
INSERT INTO `osc_area` VALUES ('1560', '桓仁满族自治县', '111', '0', '3');
INSERT INTO `osc_area` VALUES ('1561', '溪湖区', '111', '0', '3');
INSERT INTO `osc_area` VALUES ('1562', '东港市', '112', '0', '3');
INSERT INTO `osc_area` VALUES ('1563', '元宝区', '112', '0', '3');
INSERT INTO `osc_area` VALUES ('1564', '凤城市', '112', '0', '3');
INSERT INTO `osc_area` VALUES ('1565', '宽甸满族自治县', '112', '0', '3');
INSERT INTO `osc_area` VALUES ('1566', '振兴区', '112', '0', '3');
INSERT INTO `osc_area` VALUES ('1567', '振安区', '112', '0', '3');
INSERT INTO `osc_area` VALUES ('1568', '义县', '113', '0', '3');
INSERT INTO `osc_area` VALUES ('1569', '凌河区', '113', '0', '3');
INSERT INTO `osc_area` VALUES ('1570', '凌海市', '113', '0', '3');
INSERT INTO `osc_area` VALUES ('1571', '北镇市', '113', '0', '3');
INSERT INTO `osc_area` VALUES ('1572', '古塔区', '113', '0', '3');
INSERT INTO `osc_area` VALUES ('1573', '太和区', '113', '0', '3');
INSERT INTO `osc_area` VALUES ('1574', '黑山县', '113', '0', '3');
INSERT INTO `osc_area` VALUES ('1575', '大石桥市', '114', '0', '3');
INSERT INTO `osc_area` VALUES ('1576', '盖州市', '114', '0', '3');
INSERT INTO `osc_area` VALUES ('1577', '站前区', '114', '0', '3');
INSERT INTO `osc_area` VALUES ('1578', '老边区', '114', '0', '3');
INSERT INTO `osc_area` VALUES ('1579', '西市区', '114', '0', '3');
INSERT INTO `osc_area` VALUES ('1580', '鲅鱼圈区', '114', '0', '3');
INSERT INTO `osc_area` VALUES ('1581', '太平区', '115', '0', '3');
INSERT INTO `osc_area` VALUES ('1582', '彰武县', '115', '0', '3');
INSERT INTO `osc_area` VALUES ('1583', '新邱区', '115', '0', '3');
INSERT INTO `osc_area` VALUES ('1584', '海州区', '115', '0', '3');
INSERT INTO `osc_area` VALUES ('1585', '清河门区', '115', '0', '3');
INSERT INTO `osc_area` VALUES ('1586', '细河区', '115', '0', '3');
INSERT INTO `osc_area` VALUES ('1587', '蒙古族自治县', '115', '0', '3');
INSERT INTO `osc_area` VALUES ('1588', '太子河区', '116', '0', '3');
INSERT INTO `osc_area` VALUES ('1589', '宏伟区', '116', '0', '3');
INSERT INTO `osc_area` VALUES ('1590', '弓长岭区', '116', '0', '3');
INSERT INTO `osc_area` VALUES ('1591', '文圣区', '116', '0', '3');
INSERT INTO `osc_area` VALUES ('1592', '灯塔市', '116', '0', '3');
INSERT INTO `osc_area` VALUES ('1593', '白塔区', '116', '0', '3');
INSERT INTO `osc_area` VALUES ('1594', '辽阳县', '116', '0', '3');
INSERT INTO `osc_area` VALUES ('1595', '兴隆台区', '117', '0', '3');
INSERT INTO `osc_area` VALUES ('1596', '双台子区', '117', '0', '3');
INSERT INTO `osc_area` VALUES ('1597', '大洼县', '117', '0', '3');
INSERT INTO `osc_area` VALUES ('1598', '盘山县', '117', '0', '3');
INSERT INTO `osc_area` VALUES ('1599', '开原市', '118', '0', '3');
INSERT INTO `osc_area` VALUES ('1600', '昌图县', '118', '0', '3');
INSERT INTO `osc_area` VALUES ('1601', '清河区', '118', '0', '3');
INSERT INTO `osc_area` VALUES ('1602', '西丰县', '118', '0', '3');
INSERT INTO `osc_area` VALUES ('1603', '调兵山市', '118', '0', '3');
INSERT INTO `osc_area` VALUES ('1604', '铁岭县', '118', '0', '3');
INSERT INTO `osc_area` VALUES ('1605', '银州区', '118', '0', '3');
INSERT INTO `osc_area` VALUES ('1606', '凌源市', '119', '0', '3');
INSERT INTO `osc_area` VALUES ('1607', '北票市', '119', '0', '3');
INSERT INTO `osc_area` VALUES ('1608', '双塔区', '119', '0', '3');
INSERT INTO `osc_area` VALUES ('1609', '喀喇沁左翼蒙古族自治县', '119', '0', '3');
INSERT INTO `osc_area` VALUES ('1610', '建平县', '119', '0', '3');
INSERT INTO `osc_area` VALUES ('1611', '朝阳县', '119', '0', '3');
INSERT INTO `osc_area` VALUES ('1612', '龙城区', '119', '0', '3');
INSERT INTO `osc_area` VALUES ('1613', '兴城市', '120', '0', '3');
INSERT INTO `osc_area` VALUES ('1614', '南票区', '120', '0', '3');
INSERT INTO `osc_area` VALUES ('1615', '建昌县', '120', '0', '3');
INSERT INTO `osc_area` VALUES ('1616', '绥中县', '120', '0', '3');
INSERT INTO `osc_area` VALUES ('1617', '连山区', '120', '0', '3');
INSERT INTO `osc_area` VALUES ('1618', '龙港区', '120', '0', '3');
INSERT INTO `osc_area` VALUES ('1619', '九台市', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1620', '二道区', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1621', '农安县', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1622', '南关区', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1623', '双阳区', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1624', '宽城区', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1625', '德惠市', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1626', '朝阳区', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1627', '榆树市', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1628', '绿园区', '121', '0', '3');
INSERT INTO `osc_area` VALUES ('1629', '丰满区', '122', '0', '3');
INSERT INTO `osc_area` VALUES ('1630', '昌邑区', '122', '0', '3');
INSERT INTO `osc_area` VALUES ('1631', '桦甸市', '122', '0', '3');
INSERT INTO `osc_area` VALUES ('1632', '永吉县', '122', '0', '3');
INSERT INTO `osc_area` VALUES ('1633', '磐石市', '122', '0', '3');
INSERT INTO `osc_area` VALUES ('1634', '舒兰市', '122', '0', '3');
INSERT INTO `osc_area` VALUES ('1635', '船营区', '122', '0', '3');
INSERT INTO `osc_area` VALUES ('1636', '蛟河市', '122', '0', '3');
INSERT INTO `osc_area` VALUES ('1637', '龙潭区', '122', '0', '3');
INSERT INTO `osc_area` VALUES ('1638', '伊通满族自治县', '123', '0', '3');
INSERT INTO `osc_area` VALUES ('1639', '公主岭市', '123', '0', '3');
INSERT INTO `osc_area` VALUES ('1640', '双辽市', '123', '0', '3');
INSERT INTO `osc_area` VALUES ('1641', '梨树县', '123', '0', '3');
INSERT INTO `osc_area` VALUES ('1642', '铁东区', '123', '0', '3');
INSERT INTO `osc_area` VALUES ('1643', '铁西区', '123', '0', '3');
INSERT INTO `osc_area` VALUES ('1644', '东丰县', '124', '0', '3');
INSERT INTO `osc_area` VALUES ('1645', '东辽县', '124', '0', '3');
INSERT INTO `osc_area` VALUES ('1646', '西安区', '124', '0', '3');
INSERT INTO `osc_area` VALUES ('1647', '龙山区', '124', '0', '3');
INSERT INTO `osc_area` VALUES ('1648', '东昌区', '125', '0', '3');
INSERT INTO `osc_area` VALUES ('1649', '二道江区', '125', '0', '3');
INSERT INTO `osc_area` VALUES ('1650', '柳河县', '125', '0', '3');
INSERT INTO `osc_area` VALUES ('1651', '梅河口市', '125', '0', '3');
INSERT INTO `osc_area` VALUES ('1652', '辉南县', '125', '0', '3');
INSERT INTO `osc_area` VALUES ('1653', '通化县', '125', '0', '3');
INSERT INTO `osc_area` VALUES ('1654', '集安市', '125', '0', '3');
INSERT INTO `osc_area` VALUES ('1655', '临江市', '126', '0', '3');
INSERT INTO `osc_area` VALUES ('1656', '八道江区', '126', '0', '3');
INSERT INTO `osc_area` VALUES ('1657', '抚松县', '126', '0', '3');
INSERT INTO `osc_area` VALUES ('1658', '江源区', '126', '0', '3');
INSERT INTO `osc_area` VALUES ('1659', '长白朝鲜族自治县', '126', '0', '3');
INSERT INTO `osc_area` VALUES ('1660', '靖宇县', '126', '0', '3');
INSERT INTO `osc_area` VALUES ('1661', '干安县', '127', '0', '3');
INSERT INTO `osc_area` VALUES ('1662', '前郭尔罗斯蒙古族自治县', '127', '0', '3');
INSERT INTO `osc_area` VALUES ('1663', '宁江区', '127', '0', '3');
INSERT INTO `osc_area` VALUES ('1664', '扶余县', '127', '0', '3');
INSERT INTO `osc_area` VALUES ('1665', '长岭县', '127', '0', '3');
INSERT INTO `osc_area` VALUES ('1666', '大安市', '128', '0', '3');
INSERT INTO `osc_area` VALUES ('1667', '洮北区', '128', '0', '3');
INSERT INTO `osc_area` VALUES ('1668', '洮南市', '128', '0', '3');
INSERT INTO `osc_area` VALUES ('1669', '通榆县', '128', '0', '3');
INSERT INTO `osc_area` VALUES ('1670', '镇赉县', '128', '0', '3');
INSERT INTO `osc_area` VALUES ('1671', '和龙市', '129', '0', '3');
INSERT INTO `osc_area` VALUES ('1672', '图们市', '129', '0', '3');
INSERT INTO `osc_area` VALUES ('1673', '安图县', '129', '0', '3');
INSERT INTO `osc_area` VALUES ('1674', '延吉市', '129', '0', '3');
INSERT INTO `osc_area` VALUES ('1675', '敦化市', '129', '0', '3');
INSERT INTO `osc_area` VALUES ('1676', '汪清县', '129', '0', '3');
INSERT INTO `osc_area` VALUES ('1677', '珲春市', '129', '0', '3');
INSERT INTO `osc_area` VALUES ('1678', '龙井市', '129', '0', '3');
INSERT INTO `osc_area` VALUES ('1679', '五常市', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1680', '依兰县', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1681', '南岗区', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1682', '双城市', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1683', '呼兰区', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1684', '哈尔滨市道里区', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1685', '宾县', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1686', '尚志市', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1687', '巴彦县', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1688', '平房区', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1689', '延寿县', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1690', '方正县', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1691', '木兰县', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1692', '松北区', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1693', '通河县', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1694', '道外区', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1695', '阿城区', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1696', '香坊区', '130', '0', '3');
INSERT INTO `osc_area` VALUES ('1697', '依安县', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1698', '克东县', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1699', '克山县', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1700', '富拉尔基区', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1701', '富裕县', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1702', '建华区', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1703', '拜泉县', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1704', '昂昂溪区', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1705', '梅里斯达斡尔族区', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1706', '泰来县', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1707', '甘南县', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1708', '碾子山区', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1709', '讷河市', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1710', '铁锋区', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1711', '龙江县', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1712', '龙沙区', '131', '0', '3');
INSERT INTO `osc_area` VALUES ('1713', '城子河区', '132', '0', '3');
INSERT INTO `osc_area` VALUES ('1714', '密山市', '132', '0', '3');
INSERT INTO `osc_area` VALUES ('1715', '恒山区', '132', '0', '3');
INSERT INTO `osc_area` VALUES ('1716', '梨树区', '132', '0', '3');
INSERT INTO `osc_area` VALUES ('1717', '滴道区', '132', '0', '3');
INSERT INTO `osc_area` VALUES ('1718', '虎林市', '132', '0', '3');
INSERT INTO `osc_area` VALUES ('1719', '鸡东县', '132', '0', '3');
INSERT INTO `osc_area` VALUES ('1720', '鸡冠区', '132', '0', '3');
INSERT INTO `osc_area` VALUES ('1721', '麻山区', '132', '0', '3');
INSERT INTO `osc_area` VALUES ('1722', '东山区', '133', '0', '3');
INSERT INTO `osc_area` VALUES ('1723', '兴安区', '133', '0', '3');
INSERT INTO `osc_area` VALUES ('1724', '兴山区', '133', '0', '3');
INSERT INTO `osc_area` VALUES ('1725', '南山区', '133', '0', '3');
INSERT INTO `osc_area` VALUES ('1726', '向阳区', '133', '0', '3');
INSERT INTO `osc_area` VALUES ('1727', '工农区', '133', '0', '3');
INSERT INTO `osc_area` VALUES ('1728', '绥滨县', '133', '0', '3');
INSERT INTO `osc_area` VALUES ('1729', '萝北县', '133', '0', '3');
INSERT INTO `osc_area` VALUES ('1730', '友谊县', '134', '0', '3');
INSERT INTO `osc_area` VALUES ('1731', '四方台区', '134', '0', '3');
INSERT INTO `osc_area` VALUES ('1732', '宝山区', '134', '0', '3');
INSERT INTO `osc_area` VALUES ('1733', '宝清县', '134', '0', '3');
INSERT INTO `osc_area` VALUES ('1734', '尖山区', '134', '0', '3');
INSERT INTO `osc_area` VALUES ('1735', '岭东区', '134', '0', '3');
INSERT INTO `osc_area` VALUES ('1736', '集贤县', '134', '0', '3');
INSERT INTO `osc_area` VALUES ('1737', '饶河县', '134', '0', '3');
INSERT INTO `osc_area` VALUES ('1738', '大同区', '135', '0', '3');
INSERT INTO `osc_area` VALUES ('1739', '杜尔伯特蒙古族自治县', '135', '0', '3');
INSERT INTO `osc_area` VALUES ('1740', '林甸县', '135', '0', '3');
INSERT INTO `osc_area` VALUES ('1741', '红岗区', '135', '0', '3');
INSERT INTO `osc_area` VALUES ('1742', '肇州县', '135', '0', '3');
INSERT INTO `osc_area` VALUES ('1743', '肇源县', '135', '0', '3');
INSERT INTO `osc_area` VALUES ('1744', '胡路区', '135', '0', '3');
INSERT INTO `osc_area` VALUES ('1745', '萨尔图区', '135', '0', '3');
INSERT INTO `osc_area` VALUES ('1746', '龙凤区', '135', '0', '3');
INSERT INTO `osc_area` VALUES ('1747', '上甘岭区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1748', '乌伊岭区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1749', '乌马河区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1750', '五营区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1751', '伊春区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1752', '南岔区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1753', '友好区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1754', '嘉荫县', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1755', '带岭区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1756', '新青区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1757', '汤旺河区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1758', '红星区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1759', '美溪区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1760', '翠峦区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1761', '西林区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1762', '金山屯区', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1763', '铁力市', '136', '0', '3');
INSERT INTO `osc_area` VALUES ('1764', '东风区', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1765', '前进区', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1766', '同江市', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1767', '向阳区', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1768', '富锦市', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1769', '抚远县', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1770', '桦南县', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1771', '桦川县', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1772', '汤原县', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1773', '郊区', '137', '0', '3');
INSERT INTO `osc_area` VALUES ('1774', '勃利县', '138', '0', '3');
INSERT INTO `osc_area` VALUES ('1775', '新兴区', '138', '0', '3');
INSERT INTO `osc_area` VALUES ('1776', '桃山区', '138', '0', '3');
INSERT INTO `osc_area` VALUES ('1777', '茄子河区', '138', '0', '3');
INSERT INTO `osc_area` VALUES ('1778', '东宁县', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1779', '东安区', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1780', '宁安市', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1781', '林口县', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1782', '海林市', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1783', '爱民区', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1784', '穆棱市', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1785', '绥芬河市', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1786', '西安区', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1787', '阳明区', '139', '0', '3');
INSERT INTO `osc_area` VALUES ('1788', '五大连池市', '140', '0', '3');
INSERT INTO `osc_area` VALUES ('1789', '北安市', '140', '0', '3');
INSERT INTO `osc_area` VALUES ('1790', '嫩江县', '140', '0', '3');
INSERT INTO `osc_area` VALUES ('1791', '孙吴县', '140', '0', '3');
INSERT INTO `osc_area` VALUES ('1792', '爱辉区', '140', '0', '3');
INSERT INTO `osc_area` VALUES ('1793', '车逊克县', '140', '0', '3');
INSERT INTO `osc_area` VALUES ('1794', '逊克县', '140', '0', '3');
INSERT INTO `osc_area` VALUES ('1795', '兰西县', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1796', '安达市', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1797', '庆安县', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1798', '明水县', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1799', '望奎县', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1800', '海伦市', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1801', '绥化市北林区', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1802', '绥棱县', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1803', '肇东市', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1804', '青冈县', '141', '0', '3');
INSERT INTO `osc_area` VALUES ('1805', '呼玛县', '142', '0', '3');
INSERT INTO `osc_area` VALUES ('1806', '塔河县', '142', '0', '3');
INSERT INTO `osc_area` VALUES ('1807', '大兴安岭地区加格达奇区', '142', '0', '3');
INSERT INTO `osc_area` VALUES ('1808', '大兴安岭地区呼中区', '142', '0', '3');
INSERT INTO `osc_area` VALUES ('1809', '大兴安岭地区新林区', '142', '0', '3');
INSERT INTO `osc_area` VALUES ('1810', '大兴安岭地区松岭区', '142', '0', '3');
INSERT INTO `osc_area` VALUES ('1811', '漠河县', '142', '0', '3');
INSERT INTO `osc_area` VALUES ('2027', '下关区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2028', '六合区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2029', '建邺区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2030', '栖霞区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2031', '江宁区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2032', '浦口区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2033', '溧水县', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2034', '玄武区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2035', '白下区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2036', '秦淮区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2037', '雨花台区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2038', '高淳县', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2039', '鼓楼区', '162', '0', '3');
INSERT INTO `osc_area` VALUES ('2040', '北塘区', '163', '0', '3');
INSERT INTO `osc_area` VALUES ('2041', '南长区', '163', '0', '3');
INSERT INTO `osc_area` VALUES ('2042', '宜兴市', '163', '0', '3');
INSERT INTO `osc_area` VALUES ('2043', '崇安区', '163', '0', '3');
INSERT INTO `osc_area` VALUES ('2044', '惠山区', '163', '0', '3');
INSERT INTO `osc_area` VALUES ('2045', '江阴市', '163', '0', '3');
INSERT INTO `osc_area` VALUES ('2046', '滨湖区', '163', '0', '3');
INSERT INTO `osc_area` VALUES ('2047', '锡山区', '163', '0', '3');
INSERT INTO `osc_area` VALUES ('2048', '丰县', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2049', '九里区', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2050', '云龙区', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2051', '新沂市', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2052', '沛县', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2053', '泉山区', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2054', '睢宁县', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2055', '贾汪区', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2056', '邳州市', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2057', '铜山县', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2058', '鼓楼区', '164', '0', '3');
INSERT INTO `osc_area` VALUES ('2059', '天宁区', '165', '0', '3');
INSERT INTO `osc_area` VALUES ('2060', '戚墅堰区', '165', '0', '3');
INSERT INTO `osc_area` VALUES ('2061', '新北区', '165', '0', '3');
INSERT INTO `osc_area` VALUES ('2062', '武进区', '165', '0', '3');
INSERT INTO `osc_area` VALUES ('2063', '溧阳市', '165', '0', '3');
INSERT INTO `osc_area` VALUES ('2064', '金坛市', '165', '0', '3');
INSERT INTO `osc_area` VALUES ('2065', '钟楼区', '165', '0', '3');
INSERT INTO `osc_area` VALUES ('2066', '吴中区', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2067', '吴江市', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2068', '太仓市', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2069', '常熟市', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2070', '平江区', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2071', '张家港市', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2072', '昆山市', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2073', '沧浪区', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2074', '相城区', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2075', '苏州工业园区', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2076', '虎丘区', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2077', '金阊区', '166', '0', '3');
INSERT INTO `osc_area` VALUES ('2078', '启东市', '167', '0', '3');
INSERT INTO `osc_area` VALUES ('2079', '如东县', '167', '0', '3');
INSERT INTO `osc_area` VALUES ('2080', '如皋市', '167', '0', '3');
INSERT INTO `osc_area` VALUES ('2081', '崇川区', '167', '0', '3');
INSERT INTO `osc_area` VALUES ('2082', '海安县', '167', '0', '3');
INSERT INTO `osc_area` VALUES ('2083', '海门市', '167', '0', '3');
INSERT INTO `osc_area` VALUES ('2084', '港闸区', '167', '0', '3');
INSERT INTO `osc_area` VALUES ('2085', '通州市', '167', '0', '3');
INSERT INTO `osc_area` VALUES ('2086', '东海县', '168', '0', '3');
INSERT INTO `osc_area` VALUES ('2087', '新浦区', '168', '0', '3');
INSERT INTO `osc_area` VALUES ('2088', '海州区', '168', '0', '3');
INSERT INTO `osc_area` VALUES ('2089', '灌云县', '168', '0', '3');
INSERT INTO `osc_area` VALUES ('2090', '灌南县', '168', '0', '3');
INSERT INTO `osc_area` VALUES ('2091', '赣榆县', '168', '0', '3');
INSERT INTO `osc_area` VALUES ('2092', '连云区', '168', '0', '3');
INSERT INTO `osc_area` VALUES ('2093', '楚州区', '169', '0', '3');
INSERT INTO `osc_area` VALUES ('2094', '洪泽县', '169', '0', '3');
INSERT INTO `osc_area` VALUES ('2095', '涟水县', '169', '0', '3');
INSERT INTO `osc_area` VALUES ('2096', '淮阴区', '169', '0', '3');
INSERT INTO `osc_area` VALUES ('2097', '清河区', '169', '0', '3');
INSERT INTO `osc_area` VALUES ('2098', '清浦区', '169', '0', '3');
INSERT INTO `osc_area` VALUES ('2099', '盱眙县', '169', '0', '3');
INSERT INTO `osc_area` VALUES ('2100', '金湖县', '169', '0', '3');
INSERT INTO `osc_area` VALUES ('2101', '东台市', '170', '0', '3');
INSERT INTO `osc_area` VALUES ('2102', '亭湖区', '170', '0', '3');
INSERT INTO `osc_area` VALUES ('2103', '响水县', '170', '0', '3');
INSERT INTO `osc_area` VALUES ('2104', '大丰市', '170', '0', '3');
INSERT INTO `osc_area` VALUES ('2105', '射阳县', '170', '0', '3');
INSERT INTO `osc_area` VALUES ('2106', '建湖县', '170', '0', '3');
INSERT INTO `osc_area` VALUES ('2107', '滨海县', '170', '0', '3');
INSERT INTO `osc_area` VALUES ('2108', '盐都区', '170', '0', '3');
INSERT INTO `osc_area` VALUES ('2109', '阜宁县', '170', '0', '3');
INSERT INTO `osc_area` VALUES ('2110', '仪征市', '171', '0', '3');
INSERT INTO `osc_area` VALUES ('2111', '宝应县', '171', '0', '3');
INSERT INTO `osc_area` VALUES ('2112', '广陵区', '171', '0', '3');
INSERT INTO `osc_area` VALUES ('2113', '江都市', '171', '0', '3');
INSERT INTO `osc_area` VALUES ('2114', '维扬区', '171', '0', '3');
INSERT INTO `osc_area` VALUES ('2115', '邗江区', '171', '0', '3');
INSERT INTO `osc_area` VALUES ('2116', '高邮市', '171', '0', '3');
INSERT INTO `osc_area` VALUES ('2117', '丹徒区', '172', '0', '3');
INSERT INTO `osc_area` VALUES ('2118', '丹阳市', '172', '0', '3');
INSERT INTO `osc_area` VALUES ('2119', '京口区', '172', '0', '3');
INSERT INTO `osc_area` VALUES ('2120', '句容市', '172', '0', '3');
INSERT INTO `osc_area` VALUES ('2121', '扬中市', '172', '0', '3');
INSERT INTO `osc_area` VALUES ('2122', '润州区', '172', '0', '3');
INSERT INTO `osc_area` VALUES ('2123', '兴化市', '173', '0', '3');
INSERT INTO `osc_area` VALUES ('2124', '姜堰市', '173', '0', '3');
INSERT INTO `osc_area` VALUES ('2125', '泰兴市', '173', '0', '3');
INSERT INTO `osc_area` VALUES ('2126', '海陵区', '173', '0', '3');
INSERT INTO `osc_area` VALUES ('2127', '靖江市', '173', '0', '3');
INSERT INTO `osc_area` VALUES ('2128', '高港区', '173', '0', '3');
INSERT INTO `osc_area` VALUES ('2129', '宿城区', '174', '0', '3');
INSERT INTO `osc_area` VALUES ('2130', '宿豫区', '174', '0', '3');
INSERT INTO `osc_area` VALUES ('2131', '沭阳县', '174', '0', '3');
INSERT INTO `osc_area` VALUES ('2132', '泗洪县', '174', '0', '3');
INSERT INTO `osc_area` VALUES ('2133', '泗阳县', '174', '0', '3');
INSERT INTO `osc_area` VALUES ('2134', '上城区', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2135', '下城区', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2136', '临安市', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2137', '余杭区', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2138', '富阳市', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2139', '建德市', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2140', '拱墅区', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2141', '桐庐县', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2142', '江干区', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2143', '淳安县', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2144', '滨江区', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2145', '萧山区', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2146', '西湖区', '175', '0', '3');
INSERT INTO `osc_area` VALUES ('2147', '余姚市', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2148', '北仑区', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2149', '奉化市', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2150', '宁海县', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2151', '慈溪市', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2152', '江东区', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2153', '江北区', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2154', '海曙区', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2155', '象山县', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2156', '鄞州区', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2157', '镇海区', '176', '0', '3');
INSERT INTO `osc_area` VALUES ('2158', '乐清市', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2159', '平阳县', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2160', '文成县', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2161', '永嘉县', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2162', '泰顺县', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2163', '洞头县', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2164', '瑞安市', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2165', '瓯海区', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2166', '苍南县', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2167', '鹿城区', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2168', '龙湾区', '177', '0', '3');
INSERT INTO `osc_area` VALUES ('2169', '南湖区', '178', '0', '3');
INSERT INTO `osc_area` VALUES ('2170', '嘉善县', '178', '0', '3');
INSERT INTO `osc_area` VALUES ('2171', '平湖市', '178', '0', '3');
INSERT INTO `osc_area` VALUES ('2172', '桐乡市', '178', '0', '3');
INSERT INTO `osc_area` VALUES ('2173', '海宁市', '178', '0', '3');
INSERT INTO `osc_area` VALUES ('2174', '海盐县', '178', '0', '3');
INSERT INTO `osc_area` VALUES ('2175', '秀洲区', '178', '0', '3');
INSERT INTO `osc_area` VALUES ('2176', '南浔区', '179', '0', '3');
INSERT INTO `osc_area` VALUES ('2177', '吴兴区', '179', '0', '3');
INSERT INTO `osc_area` VALUES ('2178', '安吉县', '179', '0', '3');
INSERT INTO `osc_area` VALUES ('2179', '德清县', '179', '0', '3');
INSERT INTO `osc_area` VALUES ('2180', '长兴县', '179', '0', '3');
INSERT INTO `osc_area` VALUES ('2181', '上虞市', '180', '0', '3');
INSERT INTO `osc_area` VALUES ('2182', '嵊州市', '180', '0', '3');
INSERT INTO `osc_area` VALUES ('2183', '新昌县', '180', '0', '3');
INSERT INTO `osc_area` VALUES ('2184', '绍兴县', '180', '0', '3');
INSERT INTO `osc_area` VALUES ('2185', '诸暨市', '180', '0', '3');
INSERT INTO `osc_area` VALUES ('2186', '越城区', '180', '0', '3');
INSERT INTO `osc_area` VALUES ('2187', '定海区', '181', '0', '3');
INSERT INTO `osc_area` VALUES ('2188', '岱山县', '181', '0', '3');
INSERT INTO `osc_area` VALUES ('2189', '嵊泗县', '181', '0', '3');
INSERT INTO `osc_area` VALUES ('2190', '普陀区', '181', '0', '3');
INSERT INTO `osc_area` VALUES ('2191', '常山县', '182', '0', '3');
INSERT INTO `osc_area` VALUES ('2192', '开化县', '182', '0', '3');
INSERT INTO `osc_area` VALUES ('2193', '柯城区', '182', '0', '3');
INSERT INTO `osc_area` VALUES ('2194', '江山市', '182', '0', '3');
INSERT INTO `osc_area` VALUES ('2195', '衢江区', '182', '0', '3');
INSERT INTO `osc_area` VALUES ('2196', '龙游县', '182', '0', '3');
INSERT INTO `osc_area` VALUES ('2197', '东阳市', '183', '0', '3');
INSERT INTO `osc_area` VALUES ('2198', '义乌市', '183', '0', '3');
INSERT INTO `osc_area` VALUES ('2199', '兰溪市', '183', '0', '3');
INSERT INTO `osc_area` VALUES ('2200', '婺城区', '183', '0', '3');
INSERT INTO `osc_area` VALUES ('2201', '武义县', '183', '0', '3');
INSERT INTO `osc_area` VALUES ('2202', '永康市', '183', '0', '3');
INSERT INTO `osc_area` VALUES ('2203', '浦江县', '183', '0', '3');
INSERT INTO `osc_area` VALUES ('2204', '磐安县', '183', '0', '3');
INSERT INTO `osc_area` VALUES ('2205', '金东区', '183', '0', '3');
INSERT INTO `osc_area` VALUES ('2206', '三门县', '184', '0', '3');
INSERT INTO `osc_area` VALUES ('2207', '临海市', '184', '0', '3');
INSERT INTO `osc_area` VALUES ('2208', '仙居县', '184', '0', '3');
INSERT INTO `osc_area` VALUES ('2209', '天台县', '184', '0', '3');
INSERT INTO `osc_area` VALUES ('2210', '椒江区', '184', '0', '3');
INSERT INTO `osc_area` VALUES ('2211', '温岭市', '184', '0', '3');
INSERT INTO `osc_area` VALUES ('2212', '玉环县', '184', '0', '3');
INSERT INTO `osc_area` VALUES ('2213', '路桥区', '184', '0', '3');
INSERT INTO `osc_area` VALUES ('2214', '黄岩区', '184', '0', '3');
INSERT INTO `osc_area` VALUES ('2215', '云和县', '185', '0', '3');
INSERT INTO `osc_area` VALUES ('2216', '庆元县', '185', '0', '3');
INSERT INTO `osc_area` VALUES ('2217', '景宁畲族自治县', '185', '0', '3');
INSERT INTO `osc_area` VALUES ('2218', '松阳县', '185', '0', '3');
INSERT INTO `osc_area` VALUES ('2219', '缙云县', '185', '0', '3');
INSERT INTO `osc_area` VALUES ('2220', '莲都区', '185', '0', '3');
INSERT INTO `osc_area` VALUES ('2221', '遂昌县', '185', '0', '3');
INSERT INTO `osc_area` VALUES ('2222', '青田县', '185', '0', '3');
INSERT INTO `osc_area` VALUES ('2223', '龙泉市', '185', '0', '3');
INSERT INTO `osc_area` VALUES ('2224', '包河区', '186', '0', '3');
INSERT INTO `osc_area` VALUES ('2225', '庐阳区', '186', '0', '3');
INSERT INTO `osc_area` VALUES ('2226', '瑶海区', '186', '0', '3');
INSERT INTO `osc_area` VALUES ('2227', '肥东县', '186', '0', '3');
INSERT INTO `osc_area` VALUES ('2228', '肥西县', '186', '0', '3');
INSERT INTO `osc_area` VALUES ('2229', '蜀山区', '186', '0', '3');
INSERT INTO `osc_area` VALUES ('2230', '长丰县', '186', '0', '3');
INSERT INTO `osc_area` VALUES ('2231', '三山区', '187', '0', '3');
INSERT INTO `osc_area` VALUES ('2232', '南陵县', '187', '0', '3');
INSERT INTO `osc_area` VALUES ('2233', '弋江区', '187', '0', '3');
INSERT INTO `osc_area` VALUES ('2234', '繁昌县', '187', '0', '3');
INSERT INTO `osc_area` VALUES ('2235', '芜湖县', '187', '0', '3');
INSERT INTO `osc_area` VALUES ('2236', '镜湖区', '187', '0', '3');
INSERT INTO `osc_area` VALUES ('2237', '鸠江区', '187', '0', '3');
INSERT INTO `osc_area` VALUES ('2238', '五河县', '188', '0', '3');
INSERT INTO `osc_area` VALUES ('2239', '固镇县', '188', '0', '3');
INSERT INTO `osc_area` VALUES ('2240', '怀远县', '188', '0', '3');
INSERT INTO `osc_area` VALUES ('2241', '淮上区', '188', '0', '3');
INSERT INTO `osc_area` VALUES ('2242', '禹会区', '188', '0', '3');
INSERT INTO `osc_area` VALUES ('2243', '蚌山区', '188', '0', '3');
INSERT INTO `osc_area` VALUES ('2244', '龙子湖区', '188', '0', '3');
INSERT INTO `osc_area` VALUES ('2245', '八公山区', '189', '0', '3');
INSERT INTO `osc_area` VALUES ('2246', '凤台县', '189', '0', '3');
INSERT INTO `osc_area` VALUES ('2247', '大通区', '189', '0', '3');
INSERT INTO `osc_area` VALUES ('2248', '潘集区', '189', '0', '3');
INSERT INTO `osc_area` VALUES ('2249', '田家庵区', '189', '0', '3');
INSERT INTO `osc_area` VALUES ('2250', '谢家集区', '189', '0', '3');
INSERT INTO `osc_area` VALUES ('2251', '当涂县', '190', '0', '3');
INSERT INTO `osc_area` VALUES ('2252', '花山区', '190', '0', '3');
INSERT INTO `osc_area` VALUES ('2253', '金家庄区', '190', '0', '3');
INSERT INTO `osc_area` VALUES ('2254', '雨山区', '190', '0', '3');
INSERT INTO `osc_area` VALUES ('2255', '杜集区', '191', '0', '3');
INSERT INTO `osc_area` VALUES ('2256', '濉溪县', '191', '0', '3');
INSERT INTO `osc_area` VALUES ('2257', '烈山区', '191', '0', '3');
INSERT INTO `osc_area` VALUES ('2258', '相山区', '191', '0', '3');
INSERT INTO `osc_area` VALUES ('2259', '狮子山区', '192', '0', '3');
INSERT INTO `osc_area` VALUES ('2260', '郊区', '192', '0', '3');
INSERT INTO `osc_area` VALUES ('2261', '铜官山区', '192', '0', '3');
INSERT INTO `osc_area` VALUES ('2262', '铜陵县', '192', '0', '3');
INSERT INTO `osc_area` VALUES ('2263', '大观区', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2264', '太湖县', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2265', '宜秀区', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2266', '宿松县', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2267', '岳西县', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2268', '怀宁县', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2269', '望江县', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2270', '枞阳县', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2271', '桐城市', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2272', '潜山县', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2273', '迎江区', '193', '0', '3');
INSERT INTO `osc_area` VALUES ('2274', '休宁县', '194', '0', '3');
INSERT INTO `osc_area` VALUES ('2275', '屯溪区', '194', '0', '3');
INSERT INTO `osc_area` VALUES ('2276', '徽州区', '194', '0', '3');
INSERT INTO `osc_area` VALUES ('2277', '歙县', '194', '0', '3');
INSERT INTO `osc_area` VALUES ('2278', '祁门县', '194', '0', '3');
INSERT INTO `osc_area` VALUES ('2279', '黄山区', '194', '0', '3');
INSERT INTO `osc_area` VALUES ('2280', '黟县', '194', '0', '3');
INSERT INTO `osc_area` VALUES ('2281', '全椒县', '195', '0', '3');
INSERT INTO `osc_area` VALUES ('2282', '凤阳县', '195', '0', '3');
INSERT INTO `osc_area` VALUES ('2283', '南谯区', '195', '0', '3');
INSERT INTO `osc_area` VALUES ('2284', '天长市', '195', '0', '3');
INSERT INTO `osc_area` VALUES ('2285', '定远县', '195', '0', '3');
INSERT INTO `osc_area` VALUES ('2286', '明光市', '195', '0', '3');
INSERT INTO `osc_area` VALUES ('2287', '来安县', '195', '0', '3');
INSERT INTO `osc_area` VALUES ('2288', '琅玡区', '195', '0', '3');
INSERT INTO `osc_area` VALUES ('2289', '临泉县', '196', '0', '3');
INSERT INTO `osc_area` VALUES ('2290', '太和县', '196', '0', '3');
INSERT INTO `osc_area` VALUES ('2291', '界首市', '196', '0', '3');
INSERT INTO `osc_area` VALUES ('2292', '阜南县', '196', '0', '3');
INSERT INTO `osc_area` VALUES ('2293', '颍东区', '196', '0', '3');
INSERT INTO `osc_area` VALUES ('2294', '颍州区', '196', '0', '3');
INSERT INTO `osc_area` VALUES ('2295', '颍泉区', '196', '0', '3');
INSERT INTO `osc_area` VALUES ('2296', '颖上县', '196', '0', '3');
INSERT INTO `osc_area` VALUES ('2297', '埇桥区', '197', '0', '3');
INSERT INTO `osc_area` VALUES ('2298', '泗县辖', '197', '0', '3');
INSERT INTO `osc_area` VALUES ('2299', '灵璧县', '197', '0', '3');
INSERT INTO `osc_area` VALUES ('2300', '砀山县', '197', '0', '3');
INSERT INTO `osc_area` VALUES ('2301', '萧县', '197', '0', '3');
INSERT INTO `osc_area` VALUES ('2302', '含山县', '198', '0', '3');
INSERT INTO `osc_area` VALUES ('2303', '和县', '198', '0', '3');
INSERT INTO `osc_area` VALUES ('2304', '居巢区', '198', '0', '3');
INSERT INTO `osc_area` VALUES ('2305', '庐江县', '198', '0', '3');
INSERT INTO `osc_area` VALUES ('2306', '无为县', '198', '0', '3');
INSERT INTO `osc_area` VALUES ('2307', '寿县', '199', '0', '3');
INSERT INTO `osc_area` VALUES ('2308', '舒城县', '199', '0', '3');
INSERT INTO `osc_area` VALUES ('2309', '裕安区', '199', '0', '3');
INSERT INTO `osc_area` VALUES ('2310', '金安区', '199', '0', '3');
INSERT INTO `osc_area` VALUES ('2311', '金寨县', '199', '0', '3');
INSERT INTO `osc_area` VALUES ('2312', '霍山县', '199', '0', '3');
INSERT INTO `osc_area` VALUES ('2313', '霍邱县', '199', '0', '3');
INSERT INTO `osc_area` VALUES ('2314', '利辛县', '200', '0', '3');
INSERT INTO `osc_area` VALUES ('2315', '涡阳县', '200', '0', '3');
INSERT INTO `osc_area` VALUES ('2316', '蒙城县', '200', '0', '3');
INSERT INTO `osc_area` VALUES ('2317', '谯城区', '200', '0', '3');
INSERT INTO `osc_area` VALUES ('2318', '东至县', '201', '0', '3');
INSERT INTO `osc_area` VALUES ('2319', '石台县', '201', '0', '3');
INSERT INTO `osc_area` VALUES ('2320', '贵池区', '201', '0', '3');
INSERT INTO `osc_area` VALUES ('2321', '青阳县', '201', '0', '3');
INSERT INTO `osc_area` VALUES ('2322', '宁国市', '202', '0', '3');
INSERT INTO `osc_area` VALUES ('2323', '宣州区', '202', '0', '3');
INSERT INTO `osc_area` VALUES ('2324', '广德县', '202', '0', '3');
INSERT INTO `osc_area` VALUES ('2325', '旌德县', '202', '0', '3');
INSERT INTO `osc_area` VALUES ('2326', '泾县', '202', '0', '3');
INSERT INTO `osc_area` VALUES ('2327', '绩溪县', '202', '0', '3');
INSERT INTO `osc_area` VALUES ('2328', '郎溪县', '202', '0', '3');
INSERT INTO `osc_area` VALUES ('2329', '仓山区', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2330', '台江区', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2331', '平潭县', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2332', '晋安区', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2333', '永泰县', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2334', '福清市', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2335', '罗源县', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2336', '连江县', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2337', '长乐市', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2338', '闽侯县', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2339', '闽清县', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2340', '马尾区', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2341', '鼓楼区', '203', '0', '3');
INSERT INTO `osc_area` VALUES ('2342', '同安区', '204', '0', '3');
INSERT INTO `osc_area` VALUES ('2343', '思明区', '204', '0', '3');
INSERT INTO `osc_area` VALUES ('2344', '海沧区', '204', '0', '3');
INSERT INTO `osc_area` VALUES ('2345', '湖里区', '204', '0', '3');
INSERT INTO `osc_area` VALUES ('2346', '翔安区', '204', '0', '3');
INSERT INTO `osc_area` VALUES ('2347', '集美区', '204', '0', '3');
INSERT INTO `osc_area` VALUES ('2348', '仙游县', '205', '0', '3');
INSERT INTO `osc_area` VALUES ('2349', '城厢区', '205', '0', '3');
INSERT INTO `osc_area` VALUES ('2350', '涵江区', '205', '0', '3');
INSERT INTO `osc_area` VALUES ('2351', '秀屿区', '205', '0', '3');
INSERT INTO `osc_area` VALUES ('2352', '荔城区', '205', '0', '3');
INSERT INTO `osc_area` VALUES ('2353', '三元区', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2354', '大田县', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2355', '宁化县', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2356', '将乐县', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2357', '尤溪县', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2358', '建宁县', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2359', '明溪县', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2360', '梅列区', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2361', '永安市', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2362', '沙县', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2363', '泰宁县', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2364', '清流县', '206', '0', '3');
INSERT INTO `osc_area` VALUES ('2365', '丰泽区', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2366', '南安市', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2367', '安溪县', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2368', '德化县', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2369', '惠安县', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2370', '晋江市', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2371', '永春县', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2372', '泉港区', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2373', '洛江区', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2374', '石狮市', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2375', '金门县', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2376', '鲤城区', '207', '0', '3');
INSERT INTO `osc_area` VALUES ('2377', '东山县', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2378', '云霄县', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2379', '华安县', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2380', '南靖县', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2381', '平和县', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2382', '漳浦县', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2383', '芗城区', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2384', '诏安县', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2385', '长泰县', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2386', '龙文区', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2387', '龙海市', '208', '0', '3');
INSERT INTO `osc_area` VALUES ('2388', '光泽县', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2389', '延平区', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2390', '建瓯市', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2391', '建阳市', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2392', '政和县', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2393', '松溪县', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2394', '武夷山市', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2395', '浦城县', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2396', '邵武市', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2397', '顺昌县', '209', '0', '3');
INSERT INTO `osc_area` VALUES ('2398', '上杭县', '210', '0', '3');
INSERT INTO `osc_area` VALUES ('2399', '新罗区', '210', '0', '3');
INSERT INTO `osc_area` VALUES ('2400', '武平县', '210', '0', '3');
INSERT INTO `osc_area` VALUES ('2401', '永定县', '210', '0', '3');
INSERT INTO `osc_area` VALUES ('2402', '漳平市', '210', '0', '3');
INSERT INTO `osc_area` VALUES ('2403', '连城县', '210', '0', '3');
INSERT INTO `osc_area` VALUES ('2404', '长汀县', '210', '0', '3');
INSERT INTO `osc_area` VALUES ('2405', '古田县', '211', '0', '3');
INSERT INTO `osc_area` VALUES ('2406', '周宁县', '211', '0', '3');
INSERT INTO `osc_area` VALUES ('2407', '寿宁县', '211', '0', '3');
INSERT INTO `osc_area` VALUES ('2408', '屏南县', '211', '0', '3');
INSERT INTO `osc_area` VALUES ('2409', '柘荣县', '211', '0', '3');
INSERT INTO `osc_area` VALUES ('2410', '福安市', '211', '0', '3');
INSERT INTO `osc_area` VALUES ('2411', '福鼎市', '211', '0', '3');
INSERT INTO `osc_area` VALUES ('2412', '蕉城区', '211', '0', '3');
INSERT INTO `osc_area` VALUES ('2413', '霞浦县', '211', '0', '3');
INSERT INTO `osc_area` VALUES ('2414', '东湖区', '212', '0', '3');
INSERT INTO `osc_area` VALUES ('2415', '南昌县', '212', '0', '3');
INSERT INTO `osc_area` VALUES ('2416', '安义县', '212', '0', '3');
INSERT INTO `osc_area` VALUES ('2417', '新建县', '212', '0', '3');
INSERT INTO `osc_area` VALUES ('2418', '湾里区', '212', '0', '3');
INSERT INTO `osc_area` VALUES ('2419', '西湖区', '212', '0', '3');
INSERT INTO `osc_area` VALUES ('2420', '进贤县', '212', '0', '3');
INSERT INTO `osc_area` VALUES ('2421', '青云谱区', '212', '0', '3');
INSERT INTO `osc_area` VALUES ('2422', '青山湖区', '212', '0', '3');
INSERT INTO `osc_area` VALUES ('2423', '乐平市', '213', '0', '3');
INSERT INTO `osc_area` VALUES ('2424', '昌江区', '213', '0', '3');
INSERT INTO `osc_area` VALUES ('2425', '浮梁县', '213', '0', '3');
INSERT INTO `osc_area` VALUES ('2426', '珠山区', '213', '0', '3');
INSERT INTO `osc_area` VALUES ('2427', '上栗县', '214', '0', '3');
INSERT INTO `osc_area` VALUES ('2428', '安源区', '214', '0', '3');
INSERT INTO `osc_area` VALUES ('2429', '湘东区', '214', '0', '3');
INSERT INTO `osc_area` VALUES ('2430', '芦溪县', '214', '0', '3');
INSERT INTO `osc_area` VALUES ('2431', '莲花县', '214', '0', '3');
INSERT INTO `osc_area` VALUES ('2432', '九江县', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2433', '修水县', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2434', '庐山区', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2435', '彭泽县', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2436', '德安县', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2437', '星子县', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2438', '武宁县', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2439', '永修县', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2440', '浔阳区', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2441', '湖口县', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2442', '瑞昌市', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2443', '都昌县', '215', '0', '3');
INSERT INTO `osc_area` VALUES ('2444', '分宜县', '216', '0', '3');
INSERT INTO `osc_area` VALUES ('2445', '渝水区', '216', '0', '3');
INSERT INTO `osc_area` VALUES ('2446', '余江县', '217', '0', '3');
INSERT INTO `osc_area` VALUES ('2447', '月湖区', '217', '0', '3');
INSERT INTO `osc_area` VALUES ('2448', '贵溪市', '217', '0', '3');
INSERT INTO `osc_area` VALUES ('2449', '上犹县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2450', '于都县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2451', '会昌县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2452', '信丰县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2453', '全南县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2454', '兴国县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2455', '南康市', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2456', '大余县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2457', '宁都县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2458', '安远县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2459', '定南县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2460', '寻乌县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2461', '崇义县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2462', '瑞金市', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2463', '石城县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2464', '章贡区', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2465', '赣县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2466', '龙南县', '218', '0', '3');
INSERT INTO `osc_area` VALUES ('2467', '万安县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2468', '井冈山市', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2469', '吉安县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2470', '吉州区', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2471', '吉水县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2472', '安福县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2473', '峡江县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2474', '新干县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2475', '永丰县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2476', '永新县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2477', '泰和县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2478', '遂川县', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2479', '青原区', '219', '0', '3');
INSERT INTO `osc_area` VALUES ('2480', '万载县', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2481', '上高县', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2482', '丰城市', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2483', '奉新县', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2484', '宜丰县', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2485', '樟树市', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2486', '袁州区', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2487', '铜鼓县', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2488', '靖安县', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2489', '高安市', '220', '0', '3');
INSERT INTO `osc_area` VALUES ('2490', '东乡县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2491', '临川区', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2492', '乐安县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2493', '南丰县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2494', '南城县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2495', '宜黄县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2496', '崇仁县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2497', '广昌县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2498', '资溪县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2499', '金溪县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2500', '黎川县', '221', '0', '3');
INSERT INTO `osc_area` VALUES ('2501', '万年县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2502', '上饶县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2503', '余干县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2504', '信州区', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2505', '婺源县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2506', '广丰县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2507', '弋阳县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2508', '德兴市', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2509', '横峰县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2510', '玉山县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2511', '鄱阳县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2512', '铅山县', '222', '0', '3');
INSERT INTO `osc_area` VALUES ('2513', '历下区', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2514', '历城区', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2515', '商河县', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2516', '天桥区', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2517', '市中区', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2518', '平阴县', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2519', '槐荫区', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2520', '济阳县', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2521', '章丘市', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2522', '长清区', '223', '0', '3');
INSERT INTO `osc_area` VALUES ('2523', '即墨市', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2524', '四方区', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2525', '城阳区', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2526', '崂山区', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2527', '市北区', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2528', '市南区', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2529', '平度市', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2530', '李沧区', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2531', '胶南市', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2532', '胶州市', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2533', '莱西市', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2534', '黄岛区', '224', '0', '3');
INSERT INTO `osc_area` VALUES ('2535', '临淄区', '225', '0', '3');
INSERT INTO `osc_area` VALUES ('2536', '博山区', '225', '0', '3');
INSERT INTO `osc_area` VALUES ('2537', '周村区', '225', '0', '3');
INSERT INTO `osc_area` VALUES ('2538', '张店区', '225', '0', '3');
INSERT INTO `osc_area` VALUES ('2539', '桓台县', '225', '0', '3');
INSERT INTO `osc_area` VALUES ('2540', '沂源县', '225', '0', '3');
INSERT INTO `osc_area` VALUES ('2541', '淄川区', '225', '0', '3');
INSERT INTO `osc_area` VALUES ('2542', '高青县', '225', '0', '3');
INSERT INTO `osc_area` VALUES ('2543', '台儿庄区', '226', '0', '3');
INSERT INTO `osc_area` VALUES ('2544', '山亭区', '226', '0', '3');
INSERT INTO `osc_area` VALUES ('2545', '峄城区', '226', '0', '3');
INSERT INTO `osc_area` VALUES ('2546', '市中区', '226', '0', '3');
INSERT INTO `osc_area` VALUES ('2547', '滕州市', '226', '0', '3');
INSERT INTO `osc_area` VALUES ('2548', '薛城区', '226', '0', '3');
INSERT INTO `osc_area` VALUES ('2549', '东营区', '227', '0', '3');
INSERT INTO `osc_area` VALUES ('2550', '利津县', '227', '0', '3');
INSERT INTO `osc_area` VALUES ('2551', '垦利县', '227', '0', '3');
INSERT INTO `osc_area` VALUES ('2552', '广饶县', '227', '0', '3');
INSERT INTO `osc_area` VALUES ('2553', '河口区', '227', '0', '3');
INSERT INTO `osc_area` VALUES ('2554', '招远市', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2555', '栖霞市', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2556', '海阳市', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2557', '牟平区', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2558', '福山区', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2559', '芝罘区', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2560', '莱山区', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2561', '莱州市', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2562', '莱阳市', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2563', '蓬莱市', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2564', '长岛县', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2565', '龙口市', '228', '0', '3');
INSERT INTO `osc_area` VALUES ('2566', '临朐县', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2567', '坊子区', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2568', '奎文区', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2569', '安丘市', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2570', '寒亭区', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2571', '寿光市', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2572', '昌乐县', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2573', '昌邑市', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2574', '潍城区', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2575', '诸城市', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2576', '青州市', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2577', '高密市', '229', '0', '3');
INSERT INTO `osc_area` VALUES ('2578', '任城区', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2579', '兖州市', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2580', '嘉祥县', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2581', '市中区', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2582', '微山县', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2583', '曲阜市', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2584', '梁山县', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2585', '汶上县', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2586', '泗水县', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2587', '邹城市', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2588', '金乡县', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2589', '鱼台县', '230', '0', '3');
INSERT INTO `osc_area` VALUES ('2590', '东平县', '231', '0', '3');
INSERT INTO `osc_area` VALUES ('2591', '宁阳县', '231', '0', '3');
INSERT INTO `osc_area` VALUES ('2592', '岱岳区', '231', '0', '3');
INSERT INTO `osc_area` VALUES ('2593', '新泰市', '231', '0', '3');
INSERT INTO `osc_area` VALUES ('2594', '泰山区', '231', '0', '3');
INSERT INTO `osc_area` VALUES ('2595', '肥城市', '231', '0', '3');
INSERT INTO `osc_area` VALUES ('2596', '乳山市', '232', '0', '3');
INSERT INTO `osc_area` VALUES ('2597', '文登市', '232', '0', '3');
INSERT INTO `osc_area` VALUES ('2598', '环翠区', '232', '0', '3');
INSERT INTO `osc_area` VALUES ('2599', '荣成市', '232', '0', '3');
INSERT INTO `osc_area` VALUES ('2600', '东港区', '233', '0', '3');
INSERT INTO `osc_area` VALUES ('2601', '五莲县', '233', '0', '3');
INSERT INTO `osc_area` VALUES ('2602', '岚山区', '233', '0', '3');
INSERT INTO `osc_area` VALUES ('2603', '莒县', '233', '0', '3');
INSERT INTO `osc_area` VALUES ('2604', '莱城区', '234', '0', '3');
INSERT INTO `osc_area` VALUES ('2605', '钢城区', '234', '0', '3');
INSERT INTO `osc_area` VALUES ('2606', '临沭县', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2607', '兰山区', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2608', '平邑县', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2609', '沂南县', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2610', '沂水县', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2611', '河东区', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2612', '罗庄区', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2613', '苍山县', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2614', '莒南县', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2615', '蒙阴县', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2616', '费县', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2617', '郯城县', '235', '0', '3');
INSERT INTO `osc_area` VALUES ('2618', '临邑县', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2619', '乐陵市', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2620', '夏津县', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2621', '宁津县', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2622', '平原县', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2623', '庆云县', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2624', '德城区', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2625', '武城县', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2626', '禹城市', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2627', '陵县', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2628', '齐河县', '236', '0', '3');
INSERT INTO `osc_area` VALUES ('2629', '东昌府区', '237', '0', '3');
INSERT INTO `osc_area` VALUES ('2630', '东阿县', '237', '0', '3');
INSERT INTO `osc_area` VALUES ('2631', '临清市', '237', '0', '3');
INSERT INTO `osc_area` VALUES ('2632', '冠县', '237', '0', '3');
INSERT INTO `osc_area` VALUES ('2633', '茌平县', '237', '0', '3');
INSERT INTO `osc_area` VALUES ('2634', '莘县', '237', '0', '3');
INSERT INTO `osc_area` VALUES ('2635', '阳谷县', '237', '0', '3');
INSERT INTO `osc_area` VALUES ('2636', '高唐县', '237', '0', '3');
INSERT INTO `osc_area` VALUES ('2637', '博兴县', '238', '0', '3');
INSERT INTO `osc_area` VALUES ('2638', '惠民县', '238', '0', '3');
INSERT INTO `osc_area` VALUES ('2639', '无棣县', '238', '0', '3');
INSERT INTO `osc_area` VALUES ('2640', '沾化县', '238', '0', '3');
INSERT INTO `osc_area` VALUES ('2641', '滨城区', '238', '0', '3');
INSERT INTO `osc_area` VALUES ('2642', '邹平县', '238', '0', '3');
INSERT INTO `osc_area` VALUES ('2643', '阳信县', '238', '0', '3');
INSERT INTO `osc_area` VALUES ('2644', '东明县', '239', '0', '3');
INSERT INTO `osc_area` VALUES ('2645', '单县', '239', '0', '3');
INSERT INTO `osc_area` VALUES ('2646', '定陶县', '239', '0', '3');
INSERT INTO `osc_area` VALUES ('2647', '巨野县', '239', '0', '3');
INSERT INTO `osc_area` VALUES ('2648', '成武县', '239', '0', '3');
INSERT INTO `osc_area` VALUES ('2649', '曹县', '239', '0', '3');
INSERT INTO `osc_area` VALUES ('2650', '牡丹区', '239', '0', '3');
INSERT INTO `osc_area` VALUES ('2651', '郓城县', '239', '0', '3');
INSERT INTO `osc_area` VALUES ('2652', '鄄城县', '239', '0', '3');
INSERT INTO `osc_area` VALUES ('2653', '上街区', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2654', '中原区', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2655', '中牟县', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2656', '二七区', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2657', '巩义市', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2658', '惠济区', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2659', '新密市', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2660', '新郑市', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2661', '登封市', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2662', '管城回族区', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2663', '荥阳市', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2664', '金水区', '240', '0', '3');
INSERT INTO `osc_area` VALUES ('2665', '兰考县', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2666', '尉氏县', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2667', '开封县', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2668', '杞县', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2669', '禹王台区', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2670', '通许县', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2671', '金明区', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2672', '顺河回族区', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2673', '鼓楼区', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2674', '龙亭区', '241', '0', '3');
INSERT INTO `osc_area` VALUES ('2675', '伊川县', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2676', '偃师市', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2677', '吉利区', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2678', '孟津县', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2679', '宜阳县', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2680', '嵩县', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2681', '新安县', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2682', '栾川县', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2683', '汝阳县', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2684', '洛宁县', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2685', '洛龙区', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2686', '涧西区', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2687', '瀍河回族区', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2688', '老城区', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2689', '西工区', '242', '0', '3');
INSERT INTO `osc_area` VALUES ('2690', '卫东区', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2691', '叶县', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2692', '宝丰县', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2693', '新华区', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2694', '汝州市', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2695', '湛河区', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2696', '石龙区', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2697', '舞钢市', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2698', '郏县', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2699', '鲁山县', '243', '0', '3');
INSERT INTO `osc_area` VALUES ('2700', '内黄县', '244', '0', '3');
INSERT INTO `osc_area` VALUES ('2701', '北关区', '244', '0', '3');
INSERT INTO `osc_area` VALUES ('2702', '安阳县', '244', '0', '3');
INSERT INTO `osc_area` VALUES ('2703', '文峰区', '244', '0', '3');
INSERT INTO `osc_area` VALUES ('2704', '林州市', '244', '0', '3');
INSERT INTO `osc_area` VALUES ('2705', '殷都区', '244', '0', '3');
INSERT INTO `osc_area` VALUES ('2706', '汤阴县', '244', '0', '3');
INSERT INTO `osc_area` VALUES ('2707', '滑县', '244', '0', '3');
INSERT INTO `osc_area` VALUES ('2708', '龙安区', '244', '0', '3');
INSERT INTO `osc_area` VALUES ('2709', '山城区', '245', '0', '3');
INSERT INTO `osc_area` VALUES ('2710', '浚县', '245', '0', '3');
INSERT INTO `osc_area` VALUES ('2711', '淇县', '245', '0', '3');
INSERT INTO `osc_area` VALUES ('2712', '淇滨区', '245', '0', '3');
INSERT INTO `osc_area` VALUES ('2713', '鹤山区', '245', '0', '3');
INSERT INTO `osc_area` VALUES ('2714', '凤泉区', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2715', '卫滨区', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2716', '卫辉市', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2717', '原阳县', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2718', '封丘县', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2719', '延津县', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2720', '新乡县', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2721', '牧野区', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2722', '红旗区', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2723', '获嘉县', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2724', '辉县市', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2725', '长垣县', '246', '0', '3');
INSERT INTO `osc_area` VALUES ('2726', '中站区', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2727', '修武县', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2728', '博爱县', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2729', '孟州市', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2730', '山阳区', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2731', '武陟县', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2732', '沁阳市', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2733', '温县', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2734', '解放区', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2735', '马村区', '247', '0', '3');
INSERT INTO `osc_area` VALUES ('2736', '华龙区', '248', '0', '3');
INSERT INTO `osc_area` VALUES ('2737', '南乐县', '248', '0', '3');
INSERT INTO `osc_area` VALUES ('2738', '台前县', '248', '0', '3');
INSERT INTO `osc_area` VALUES ('2739', '清丰县', '248', '0', '3');
INSERT INTO `osc_area` VALUES ('2740', '濮阳县', '248', '0', '3');
INSERT INTO `osc_area` VALUES ('2741', '范县', '248', '0', '3');
INSERT INTO `osc_area` VALUES ('2742', '禹州市', '249', '0', '3');
INSERT INTO `osc_area` VALUES ('2743', '襄城县', '249', '0', '3');
INSERT INTO `osc_area` VALUES ('2744', '许昌县', '249', '0', '3');
INSERT INTO `osc_area` VALUES ('2745', '鄢陵县', '249', '0', '3');
INSERT INTO `osc_area` VALUES ('2746', '长葛市', '249', '0', '3');
INSERT INTO `osc_area` VALUES ('2747', '魏都区', '249', '0', '3');
INSERT INTO `osc_area` VALUES ('2748', '临颍县', '250', '0', '3');
INSERT INTO `osc_area` VALUES ('2749', '召陵区', '250', '0', '3');
INSERT INTO `osc_area` VALUES ('2750', '源汇区', '250', '0', '3');
INSERT INTO `osc_area` VALUES ('2751', '舞阳县', '250', '0', '3');
INSERT INTO `osc_area` VALUES ('2752', '郾城区', '250', '0', '3');
INSERT INTO `osc_area` VALUES ('2753', '义马市', '251', '0', '3');
INSERT INTO `osc_area` VALUES ('2754', '卢氏县', '251', '0', '3');
INSERT INTO `osc_area` VALUES ('2755', '渑池县', '251', '0', '3');
INSERT INTO `osc_area` VALUES ('2756', '湖滨区', '251', '0', '3');
INSERT INTO `osc_area` VALUES ('2757', '灵宝市', '251', '0', '3');
INSERT INTO `osc_area` VALUES ('2758', '陕县', '251', '0', '3');
INSERT INTO `osc_area` VALUES ('2759', '内乡县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2760', '南召县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2761', '卧龙区', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2762', '唐河县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2763', '宛城区', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2764', '新野县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2765', '方城县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2766', '桐柏县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2767', '淅川县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2768', '社旗县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2769', '西峡县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2770', '邓州市', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2771', '镇平县', '252', '0', '3');
INSERT INTO `osc_area` VALUES ('2772', '夏邑县', '253', '0', '3');
INSERT INTO `osc_area` VALUES ('2773', '宁陵县', '253', '0', '3');
INSERT INTO `osc_area` VALUES ('2774', '柘城县', '253', '0', '3');
INSERT INTO `osc_area` VALUES ('2775', '民权县', '253', '0', '3');
INSERT INTO `osc_area` VALUES ('2776', '永城市', '253', '0', '3');
INSERT INTO `osc_area` VALUES ('2777', '睢县', '253', '0', '3');
INSERT INTO `osc_area` VALUES ('2778', '睢阳区', '253', '0', '3');
INSERT INTO `osc_area` VALUES ('2779', '粱园区', '253', '0', '3');
INSERT INTO `osc_area` VALUES ('2780', '虞城县', '253', '0', '3');
INSERT INTO `osc_area` VALUES ('2781', '光山县', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2782', '商城县', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2783', '固始县', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2784', '平桥区', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2785', '息县', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2786', '新县', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2787', '浉河区', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2788', '淮滨县', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2789', '潢川县', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2790', '罗山县', '254', '0', '3');
INSERT INTO `osc_area` VALUES ('2791', '商水县', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2792', '太康县', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2793', '川汇区', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2794', '扶沟县', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2795', '沈丘县', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2796', '淮阳县', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2797', '西华县', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2798', '郸城县', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2799', '项城市', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2800', '鹿邑县', '255', '0', '3');
INSERT INTO `osc_area` VALUES ('2801', '上蔡县', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2802', '平舆县', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2803', '新蔡县', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2804', '正阳县', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2805', '汝南县', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2806', '泌阳县', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2807', '确山县', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2808', '西平县', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2809', '遂平县', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2810', '驿城区', '256', '0', '3');
INSERT INTO `osc_area` VALUES ('2811', '济源市', '257', '0', '3');
INSERT INTO `osc_area` VALUES ('2812', '东西湖区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2813', '新洲区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2814', '武昌区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2815', '汉南区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2816', '汉阳区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2817', '江夏区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2818', '江岸区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2819', '江汉区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2820', '洪山区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2821', '硚口区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2822', '蔡甸区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2823', '青山区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2824', '黄陂区', '258', '0', '3');
INSERT INTO `osc_area` VALUES ('2825', '下陆区', '259', '0', '3');
INSERT INTO `osc_area` VALUES ('2826', '大冶市', '259', '0', '3');
INSERT INTO `osc_area` VALUES ('2827', '西塞山区', '259', '0', '3');
INSERT INTO `osc_area` VALUES ('2828', '铁山区', '259', '0', '3');
INSERT INTO `osc_area` VALUES ('2829', '阳新县', '259', '0', '3');
INSERT INTO `osc_area` VALUES ('2830', '黄石港区', '259', '0', '3');
INSERT INTO `osc_area` VALUES ('2831', '丹江口市', '260', '0', '3');
INSERT INTO `osc_area` VALUES ('2832', '张湾区', '260', '0', '3');
INSERT INTO `osc_area` VALUES ('2833', '房县', '260', '0', '3');
INSERT INTO `osc_area` VALUES ('2834', '竹山县', '260', '0', '3');
INSERT INTO `osc_area` VALUES ('2835', '竹溪县', '260', '0', '3');
INSERT INTO `osc_area` VALUES ('2836', '茅箭区', '260', '0', '3');
INSERT INTO `osc_area` VALUES ('2837', '郧县', '260', '0', '3');
INSERT INTO `osc_area` VALUES ('2838', '郧西县', '260', '0', '3');
INSERT INTO `osc_area` VALUES ('2839', '五峰土家族自治县', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2840', '伍家岗区', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2841', '兴山县', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2842', '夷陵区', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2843', '宜都市', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2844', '当阳市', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2845', '枝江市', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2846', '点军区', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2847', '秭归县', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2848', '虢亭区', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2849', '西陵区', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2850', '远安县', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2851', '长阳土家族自治县', '261', '0', '3');
INSERT INTO `osc_area` VALUES ('2852', '保康县', '262', '0', '3');
INSERT INTO `osc_area` VALUES ('2853', '南漳县', '262', '0', '3');
INSERT INTO `osc_area` VALUES ('2854', '宜城市', '262', '0', '3');
INSERT INTO `osc_area` VALUES ('2855', '枣阳市', '262', '0', '3');
INSERT INTO `osc_area` VALUES ('2856', '樊城区', '262', '0', '3');
INSERT INTO `osc_area` VALUES ('2857', '老河口市', '262', '0', '3');
INSERT INTO `osc_area` VALUES ('2858', '襄城区', '262', '0', '3');
INSERT INTO `osc_area` VALUES ('2859', '襄阳区', '262', '0', '3');
INSERT INTO `osc_area` VALUES ('2860', '谷城县', '262', '0', '3');
INSERT INTO `osc_area` VALUES ('2861', '华容区', '263', '0', '3');
INSERT INTO `osc_area` VALUES ('2862', '粱子湖', '263', '0', '3');
INSERT INTO `osc_area` VALUES ('2863', '鄂城区', '263', '0', '3');
INSERT INTO `osc_area` VALUES ('2864', '东宝区', '264', '0', '3');
INSERT INTO `osc_area` VALUES ('2865', '京山县', '264', '0', '3');
INSERT INTO `osc_area` VALUES ('2866', '掇刀区', '264', '0', '3');
INSERT INTO `osc_area` VALUES ('2867', '沙洋县', '264', '0', '3');
INSERT INTO `osc_area` VALUES ('2868', '钟祥市', '264', '0', '3');
INSERT INTO `osc_area` VALUES ('2869', '云梦县', '265', '0', '3');
INSERT INTO `osc_area` VALUES ('2870', '大悟县', '265', '0', '3');
INSERT INTO `osc_area` VALUES ('2871', '孝南区', '265', '0', '3');
INSERT INTO `osc_area` VALUES ('2872', '孝昌县', '265', '0', '3');
INSERT INTO `osc_area` VALUES ('2873', '安陆市', '265', '0', '3');
INSERT INTO `osc_area` VALUES ('2874', '应城市', '265', '0', '3');
INSERT INTO `osc_area` VALUES ('2875', '汉川市', '265', '0', '3');
INSERT INTO `osc_area` VALUES ('2876', '公安县', '266', '0', '3');
INSERT INTO `osc_area` VALUES ('2877', '松滋市', '266', '0', '3');
INSERT INTO `osc_area` VALUES ('2878', '江陵县', '266', '0', '3');
INSERT INTO `osc_area` VALUES ('2879', '沙市区', '266', '0', '3');
INSERT INTO `osc_area` VALUES ('2880', '洪湖市', '266', '0', '3');
INSERT INTO `osc_area` VALUES ('2881', '监利县', '266', '0', '3');
INSERT INTO `osc_area` VALUES ('2882', '石首市', '266', '0', '3');
INSERT INTO `osc_area` VALUES ('2883', '荆州区', '266', '0', '3');
INSERT INTO `osc_area` VALUES ('2884', '团风县', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2885', '武穴市', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2886', '浠水县', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2887', '红安县', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2888', '罗田县', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2889', '英山县', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2890', '蕲春县', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2891', '麻城市', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2892', '黄州区', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2893', '黄梅县', '267', '0', '3');
INSERT INTO `osc_area` VALUES ('2894', '咸安区', '268', '0', '3');
INSERT INTO `osc_area` VALUES ('2895', '嘉鱼县', '268', '0', '3');
INSERT INTO `osc_area` VALUES ('2896', '崇阳县', '268', '0', '3');
INSERT INTO `osc_area` VALUES ('2897', '赤壁市', '268', '0', '3');
INSERT INTO `osc_area` VALUES ('2898', '通城县', '268', '0', '3');
INSERT INTO `osc_area` VALUES ('2899', '通山县', '268', '0', '3');
INSERT INTO `osc_area` VALUES ('2900', '广水市', '269', '0', '3');
INSERT INTO `osc_area` VALUES ('2901', '曾都区', '269', '0', '3');
INSERT INTO `osc_area` VALUES ('2902', '利川市', '270', '0', '3');
INSERT INTO `osc_area` VALUES ('2903', '咸丰县', '270', '0', '3');
INSERT INTO `osc_area` VALUES ('2904', '宣恩县', '270', '0', '3');
INSERT INTO `osc_area` VALUES ('2905', '巴东县', '270', '0', '3');
INSERT INTO `osc_area` VALUES ('2906', '建始县', '270', '0', '3');
INSERT INTO `osc_area` VALUES ('2907', '恩施市', '270', '0', '3');
INSERT INTO `osc_area` VALUES ('2908', '来凤县', '270', '0', '3');
INSERT INTO `osc_area` VALUES ('2909', '鹤峰县', '270', '0', '3');
INSERT INTO `osc_area` VALUES ('2910', '仙桃市', '271', '0', '3');
INSERT INTO `osc_area` VALUES ('2911', '潜江市', '272', '0', '3');
INSERT INTO `osc_area` VALUES ('2912', '天门市', '273', '0', '3');
INSERT INTO `osc_area` VALUES ('2913', '神农架林区', '274', '0', '3');
INSERT INTO `osc_area` VALUES ('2914', '天心区', '275', '0', '3');
INSERT INTO `osc_area` VALUES ('2915', '宁乡县', '275', '0', '3');
INSERT INTO `osc_area` VALUES ('2916', '岳麓区', '275', '0', '3');
INSERT INTO `osc_area` VALUES ('2917', '开福区', '275', '0', '3');
INSERT INTO `osc_area` VALUES ('2918', '望城县', '275', '0', '3');
INSERT INTO `osc_area` VALUES ('2919', '浏阳市', '275', '0', '3');
INSERT INTO `osc_area` VALUES ('2920', '芙蓉区', '275', '0', '3');
INSERT INTO `osc_area` VALUES ('2921', '长沙县', '275', '0', '3');
INSERT INTO `osc_area` VALUES ('2922', '雨花区', '275', '0', '3');
INSERT INTO `osc_area` VALUES ('2923', '天元区', '276', '0', '3');
INSERT INTO `osc_area` VALUES ('2924', '攸县', '276', '0', '3');
INSERT INTO `osc_area` VALUES ('2925', '株洲县', '276', '0', '3');
INSERT INTO `osc_area` VALUES ('2926', '炎陵县', '276', '0', '3');
INSERT INTO `osc_area` VALUES ('2927', '石峰区', '276', '0', '3');
INSERT INTO `osc_area` VALUES ('2928', '芦淞区', '276', '0', '3');
INSERT INTO `osc_area` VALUES ('2929', '茶陵县', '276', '0', '3');
INSERT INTO `osc_area` VALUES ('2930', '荷塘区', '276', '0', '3');
INSERT INTO `osc_area` VALUES ('2931', '醴陵市', '276', '0', '3');
INSERT INTO `osc_area` VALUES ('2932', '岳塘区', '277', '0', '3');
INSERT INTO `osc_area` VALUES ('2933', '湘乡市', '277', '0', '3');
INSERT INTO `osc_area` VALUES ('2934', '湘潭县', '277', '0', '3');
INSERT INTO `osc_area` VALUES ('2935', '雨湖区', '277', '0', '3');
INSERT INTO `osc_area` VALUES ('2936', '韶山市', '277', '0', '3');
INSERT INTO `osc_area` VALUES ('2937', '南岳区', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2938', '常宁市', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2939', '珠晖区', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2940', '石鼓区', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2941', '祁东县', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2942', '耒阳市', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2943', '蒸湘区', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2944', '衡东县', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2945', '衡南县', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2946', '衡山县', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2947', '衡阳县', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2948', '雁峰区', '278', '0', '3');
INSERT INTO `osc_area` VALUES ('2949', '北塔区', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2950', '双清区', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2951', '城步苗族自治县', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2952', '大祥区', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2953', '新宁县', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2954', '新邵县', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2955', '武冈市', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2956', '洞口县', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2957', '绥宁县', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2958', '邵东县', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2959', '邵阳县', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2960', '隆回县', '279', '0', '3');
INSERT INTO `osc_area` VALUES ('2961', '临湘市', '280', '0', '3');
INSERT INTO `osc_area` VALUES ('2962', '云溪区', '280', '0', '3');
INSERT INTO `osc_area` VALUES ('2963', '华容县', '280', '0', '3');
INSERT INTO `osc_area` VALUES ('2964', '君山区', '280', '0', '3');
INSERT INTO `osc_area` VALUES ('2965', '岳阳县', '280', '0', '3');
INSERT INTO `osc_area` VALUES ('2966', '岳阳楼区', '280', '0', '3');
INSERT INTO `osc_area` VALUES ('2967', '平江县', '280', '0', '3');
INSERT INTO `osc_area` VALUES ('2968', '汨罗市', '280', '0', '3');
INSERT INTO `osc_area` VALUES ('2969', '湘阴县', '280', '0', '3');
INSERT INTO `osc_area` VALUES ('2970', '临澧县', '281', '0', '3');
INSERT INTO `osc_area` VALUES ('2971', '安乡县', '281', '0', '3');
INSERT INTO `osc_area` VALUES ('2972', '桃源县', '281', '0', '3');
INSERT INTO `osc_area` VALUES ('2973', '武陵区', '281', '0', '3');
INSERT INTO `osc_area` VALUES ('2974', '汉寿县', '281', '0', '3');
INSERT INTO `osc_area` VALUES ('2975', '津市市', '281', '0', '3');
INSERT INTO `osc_area` VALUES ('2976', '澧县', '281', '0', '3');
INSERT INTO `osc_area` VALUES ('2977', '石门县', '281', '0', '3');
INSERT INTO `osc_area` VALUES ('2978', '鼎城区', '281', '0', '3');
INSERT INTO `osc_area` VALUES ('2979', '慈利县', '282', '0', '3');
INSERT INTO `osc_area` VALUES ('2980', '桑植县', '282', '0', '3');
INSERT INTO `osc_area` VALUES ('2981', '武陵源区', '282', '0', '3');
INSERT INTO `osc_area` VALUES ('2982', '永定区', '282', '0', '3');
INSERT INTO `osc_area` VALUES ('2983', '南县', '283', '0', '3');
INSERT INTO `osc_area` VALUES ('2984', '安化县', '283', '0', '3');
INSERT INTO `osc_area` VALUES ('2985', '桃江县', '283', '0', '3');
INSERT INTO `osc_area` VALUES ('2986', '沅江市', '283', '0', '3');
INSERT INTO `osc_area` VALUES ('2987', '资阳区', '283', '0', '3');
INSERT INTO `osc_area` VALUES ('2988', '赫山区', '283', '0', '3');
INSERT INTO `osc_area` VALUES ('2989', '临武县', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2990', '北湖区', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2991', '嘉禾县', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2992', '安仁县', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2993', '宜章县', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2994', '桂东县', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2995', '桂阳县', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2996', '永兴县', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2997', '汝城县', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2998', '苏仙区', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('2999', '资兴市', '284', '0', '3');
INSERT INTO `osc_area` VALUES ('3000', '东安县', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3001', '冷水滩区', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3002', '双牌县', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3003', '宁远县', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3004', '新田县', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3005', '江华瑶族自治县', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3006', '江永县', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3007', '祁阳县', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3008', '蓝山县', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3009', '道县', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3010', '零陵区', '285', '0', '3');
INSERT INTO `osc_area` VALUES ('3011', '中方县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3012', '会同县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3013', '新晃侗族自治县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3014', '沅陵县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3015', '洪江市/洪江区', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3016', '溆浦县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3017', '芷江侗族自治县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3018', '辰溪县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3019', '通道侗族自治县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3020', '靖州苗族侗族自治县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3021', '鹤城区', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3022', '麻阳苗族自治县', '286', '0', '3');
INSERT INTO `osc_area` VALUES ('3023', '冷水江市', '287', '0', '3');
INSERT INTO `osc_area` VALUES ('3024', '双峰县', '287', '0', '3');
INSERT INTO `osc_area` VALUES ('3025', '娄星区', '287', '0', '3');
INSERT INTO `osc_area` VALUES ('3026', '新化县', '287', '0', '3');
INSERT INTO `osc_area` VALUES ('3027', '涟源市', '287', '0', '3');
INSERT INTO `osc_area` VALUES ('3028', '保靖县', '288', '0', '3');
INSERT INTO `osc_area` VALUES ('3029', '凤凰县', '288', '0', '3');
INSERT INTO `osc_area` VALUES ('3030', '古丈县', '288', '0', '3');
INSERT INTO `osc_area` VALUES ('3031', '吉首市', '288', '0', '3');
INSERT INTO `osc_area` VALUES ('3032', '永顺县', '288', '0', '3');
INSERT INTO `osc_area` VALUES ('3033', '泸溪县', '288', '0', '3');
INSERT INTO `osc_area` VALUES ('3034', '花垣县', '288', '0', '3');
INSERT INTO `osc_area` VALUES ('3035', '龙山县', '288', '0', '3');
INSERT INTO `osc_area` VALUES ('3036', '萝岗区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3037', '南沙区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3038', '从化市', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3039', '增城市', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3040', '天河区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3041', '海珠区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3042', '番禺区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3043', '白云区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3044', '花都区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3045', '荔湾区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3046', '越秀区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3047', '黄埔区', '289', '0', '3');
INSERT INTO `osc_area` VALUES ('3048', '乐昌市', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3049', '乳源瑶族自治县', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3050', '仁化县', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3051', '南雄市', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3052', '始兴县', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3053', '新丰县', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3054', '曲江区', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3055', '武江区', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3056', '浈江区', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3057', '翁源县', '290', '0', '3');
INSERT INTO `osc_area` VALUES ('3058', '南山区', '291', '0', '3');
INSERT INTO `osc_area` VALUES ('3059', '宝安区', '291', '0', '3');
INSERT INTO `osc_area` VALUES ('3060', '盐田区', '291', '0', '3');
INSERT INTO `osc_area` VALUES ('3061', '福田区', '291', '0', '3');
INSERT INTO `osc_area` VALUES ('3062', '罗湖区', '291', '0', '3');
INSERT INTO `osc_area` VALUES ('3063', '龙岗区', '291', '0', '3');
INSERT INTO `osc_area` VALUES ('3064', '斗门区', '292', '0', '3');
INSERT INTO `osc_area` VALUES ('3065', '金湾区', '292', '0', '3');
INSERT INTO `osc_area` VALUES ('3066', '香洲区', '292', '0', '3');
INSERT INTO `osc_area` VALUES ('3067', '南澳县', '293', '0', '3');
INSERT INTO `osc_area` VALUES ('3068', '潮南区', '293', '0', '3');
INSERT INTO `osc_area` VALUES ('3069', '潮阳区', '293', '0', '3');
INSERT INTO `osc_area` VALUES ('3070', '澄海区', '293', '0', '3');
INSERT INTO `osc_area` VALUES ('3071', '濠江区', '293', '0', '3');
INSERT INTO `osc_area` VALUES ('3072', '金平区', '293', '0', '3');
INSERT INTO `osc_area` VALUES ('3073', '龙湖区', '293', '0', '3');
INSERT INTO `osc_area` VALUES ('3074', '三水区', '294', '0', '3');
INSERT INTO `osc_area` VALUES ('3075', '南海区', '294', '0', '3');
INSERT INTO `osc_area` VALUES ('3076', '禅城区', '294', '0', '3');
INSERT INTO `osc_area` VALUES ('3077', '顺德区', '294', '0', '3');
INSERT INTO `osc_area` VALUES ('3078', '高明区', '294', '0', '3');
INSERT INTO `osc_area` VALUES ('3079', '台山市', '295', '0', '3');
INSERT INTO `osc_area` VALUES ('3080', '开平市', '295', '0', '3');
INSERT INTO `osc_area` VALUES ('3081', '恩平市', '295', '0', '3');
INSERT INTO `osc_area` VALUES ('3082', '新会区', '295', '0', '3');
INSERT INTO `osc_area` VALUES ('3083', '江海区', '295', '0', '3');
INSERT INTO `osc_area` VALUES ('3084', '蓬江区', '295', '0', '3');
INSERT INTO `osc_area` VALUES ('3085', '鹤山市', '295', '0', '3');
INSERT INTO `osc_area` VALUES ('3086', '吴川市', '296', '0', '3');
INSERT INTO `osc_area` VALUES ('3087', '坡头区', '296', '0', '3');
INSERT INTO `osc_area` VALUES ('3088', '廉江市', '296', '0', '3');
INSERT INTO `osc_area` VALUES ('3089', '徐闻县', '296', '0', '3');
INSERT INTO `osc_area` VALUES ('3090', '赤坎区', '296', '0', '3');
INSERT INTO `osc_area` VALUES ('3091', '遂溪县', '296', '0', '3');
INSERT INTO `osc_area` VALUES ('3092', '雷州市', '296', '0', '3');
INSERT INTO `osc_area` VALUES ('3093', '霞山区', '296', '0', '3');
INSERT INTO `osc_area` VALUES ('3094', '麻章区', '296', '0', '3');
INSERT INTO `osc_area` VALUES ('3095', '信宜市', '297', '0', '3');
INSERT INTO `osc_area` VALUES ('3096', '化州市', '297', '0', '3');
INSERT INTO `osc_area` VALUES ('3097', '电白县', '297', '0', '3');
INSERT INTO `osc_area` VALUES ('3098', '茂南区', '297', '0', '3');
INSERT INTO `osc_area` VALUES ('3099', '茂港区', '297', '0', '3');
INSERT INTO `osc_area` VALUES ('3100', '高州市', '297', '0', '3');
INSERT INTO `osc_area` VALUES ('3101', '四会市', '298', '0', '3');
INSERT INTO `osc_area` VALUES ('3102', '封开县', '298', '0', '3');
INSERT INTO `osc_area` VALUES ('3103', '广宁县', '298', '0', '3');
INSERT INTO `osc_area` VALUES ('3104', '德庆县', '298', '0', '3');
INSERT INTO `osc_area` VALUES ('3105', '怀集县', '298', '0', '3');
INSERT INTO `osc_area` VALUES ('3106', '端州区', '298', '0', '3');
INSERT INTO `osc_area` VALUES ('3107', '高要市', '298', '0', '3');
INSERT INTO `osc_area` VALUES ('3108', '鼎湖区', '298', '0', '3');
INSERT INTO `osc_area` VALUES ('3109', '博罗县', '299', '0', '3');
INSERT INTO `osc_area` VALUES ('3110', '惠东县', '299', '0', '3');
INSERT INTO `osc_area` VALUES ('3111', '惠城区', '299', '0', '3');
INSERT INTO `osc_area` VALUES ('3112', '惠阳区', '299', '0', '3');
INSERT INTO `osc_area` VALUES ('3113', '龙门县', '299', '0', '3');
INSERT INTO `osc_area` VALUES ('3114', '丰顺县', '300', '0', '3');
INSERT INTO `osc_area` VALUES ('3115', '五华县', '300', '0', '3');
INSERT INTO `osc_area` VALUES ('3116', '兴宁市', '300', '0', '3');
INSERT INTO `osc_area` VALUES ('3117', '大埔县', '300', '0', '3');
INSERT INTO `osc_area` VALUES ('3118', '平远县', '300', '0', '3');
INSERT INTO `osc_area` VALUES ('3119', '梅县', '300', '0', '3');
INSERT INTO `osc_area` VALUES ('3120', '梅江区', '300', '0', '3');
INSERT INTO `osc_area` VALUES ('3121', '蕉岭县', '300', '0', '3');
INSERT INTO `osc_area` VALUES ('3122', '城区', '301', '0', '3');
INSERT INTO `osc_area` VALUES ('3123', '海丰县', '301', '0', '3');
INSERT INTO `osc_area` VALUES ('3124', '陆丰市', '301', '0', '3');
INSERT INTO `osc_area` VALUES ('3125', '陆河县', '301', '0', '3');
INSERT INTO `osc_area` VALUES ('3126', '东源县', '302', '0', '3');
INSERT INTO `osc_area` VALUES ('3127', '和平县', '302', '0', '3');
INSERT INTO `osc_area` VALUES ('3128', '源城区', '302', '0', '3');
INSERT INTO `osc_area` VALUES ('3129', '紫金县', '302', '0', '3');
INSERT INTO `osc_area` VALUES ('3130', '连平县', '302', '0', '3');
INSERT INTO `osc_area` VALUES ('3131', '龙川县', '302', '0', '3');
INSERT INTO `osc_area` VALUES ('3132', '江城区', '303', '0', '3');
INSERT INTO `osc_area` VALUES ('3133', '阳东县', '303', '0', '3');
INSERT INTO `osc_area` VALUES ('3134', '阳春市', '303', '0', '3');
INSERT INTO `osc_area` VALUES ('3135', '阳西县', '303', '0', '3');
INSERT INTO `osc_area` VALUES ('3136', '佛冈县', '304', '0', '3');
INSERT INTO `osc_area` VALUES ('3137', '清城区', '304', '0', '3');
INSERT INTO `osc_area` VALUES ('3138', '清新县', '304', '0', '3');
INSERT INTO `osc_area` VALUES ('3139', '英德市', '304', '0', '3');
INSERT INTO `osc_area` VALUES ('3140', '连南瑶族自治县', '304', '0', '3');
INSERT INTO `osc_area` VALUES ('3141', '连山壮族瑶族自治县', '304', '0', '3');
INSERT INTO `osc_area` VALUES ('3142', '连州市', '304', '0', '3');
INSERT INTO `osc_area` VALUES ('3143', '阳山县', '304', '0', '3');
INSERT INTO `osc_area` VALUES ('3144', '东莞市', '305', '0', '3');
INSERT INTO `osc_area` VALUES ('3145', '中山市', '306', '0', '3');
INSERT INTO `osc_area` VALUES ('3146', '湘桥区', '307', '0', '3');
INSERT INTO `osc_area` VALUES ('3147', '潮安县', '307', '0', '3');
INSERT INTO `osc_area` VALUES ('3148', '饶平县', '307', '0', '3');
INSERT INTO `osc_area` VALUES ('3149', '惠来县', '308', '0', '3');
INSERT INTO `osc_area` VALUES ('3150', '揭东县', '308', '0', '3');
INSERT INTO `osc_area` VALUES ('3151', '揭西县', '308', '0', '3');
INSERT INTO `osc_area` VALUES ('3152', '普宁市', '308', '0', '3');
INSERT INTO `osc_area` VALUES ('3153', '榕城区', '308', '0', '3');
INSERT INTO `osc_area` VALUES ('3154', '云城区', '309', '0', '3');
INSERT INTO `osc_area` VALUES ('3155', '云安县', '309', '0', '3');
INSERT INTO `osc_area` VALUES ('3156', '新兴县', '309', '0', '3');
INSERT INTO `osc_area` VALUES ('3157', '罗定市', '309', '0', '3');
INSERT INTO `osc_area` VALUES ('3158', '郁南县', '309', '0', '3');
INSERT INTO `osc_area` VALUES ('3159', '上林县', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3160', '兴宁区', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3161', '宾阳县', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3162', '横县', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3163', '武鸣县', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3164', '江南区', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3165', '良庆区', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3166', '西乡塘区', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3167', '邕宁区', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3168', '隆安县', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3169', '青秀区', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3170', '马山县', '310', '0', '3');
INSERT INTO `osc_area` VALUES ('3171', '三江侗族自治县', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3172', '城中区', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3173', '柳北区', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3174', '柳南区', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3175', '柳城县', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3176', '柳江县', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3177', '融安县', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3178', '融水苗族自治县', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3179', '鱼峰区', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3180', '鹿寨县', '311', '0', '3');
INSERT INTO `osc_area` VALUES ('3181', '七星区', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3182', '临桂县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3183', '全州县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3184', '兴安县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3185', '叠彩区', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3186', '平乐县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3187', '恭城瑶族自治县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3188', '永福县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3189', '灌阳县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3190', '灵川县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3191', '秀峰区', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3192', '荔浦县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3193', '象山区', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3194', '资源县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3195', '阳朔县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3196', '雁山区', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3197', '龙胜各族自治县', '312', '0', '3');
INSERT INTO `osc_area` VALUES ('3198', '万秀区', '313', '0', '3');
INSERT INTO `osc_area` VALUES ('3199', '岑溪市', '313', '0', '3');
INSERT INTO `osc_area` VALUES ('3200', '苍梧县', '313', '0', '3');
INSERT INTO `osc_area` VALUES ('3201', '蒙山县', '313', '0', '3');
INSERT INTO `osc_area` VALUES ('3202', '藤县', '313', '0', '3');
INSERT INTO `osc_area` VALUES ('3203', '蝶山区', '313', '0', '3');
INSERT INTO `osc_area` VALUES ('3204', '长洲区', '313', '0', '3');
INSERT INTO `osc_area` VALUES ('3205', '合浦县', '314', '0', '3');
INSERT INTO `osc_area` VALUES ('3206', '海城区', '314', '0', '3');
INSERT INTO `osc_area` VALUES ('3207', '铁山港区', '314', '0', '3');
INSERT INTO `osc_area` VALUES ('3208', '银海区', '314', '0', '3');
INSERT INTO `osc_area` VALUES ('3209', '上思县', '315', '0', '3');
INSERT INTO `osc_area` VALUES ('3210', '东兴市', '315', '0', '3');
INSERT INTO `osc_area` VALUES ('3211', '港口区', '315', '0', '3');
INSERT INTO `osc_area` VALUES ('3212', '防城区', '315', '0', '3');
INSERT INTO `osc_area` VALUES ('3213', '浦北县', '316', '0', '3');
INSERT INTO `osc_area` VALUES ('3214', '灵山县', '316', '0', '3');
INSERT INTO `osc_area` VALUES ('3215', '钦北区', '316', '0', '3');
INSERT INTO `osc_area` VALUES ('3216', '钦南区', '316', '0', '3');
INSERT INTO `osc_area` VALUES ('3217', '平南县', '317', '0', '3');
INSERT INTO `osc_area` VALUES ('3218', '桂平市', '317', '0', '3');
INSERT INTO `osc_area` VALUES ('3219', '港北区', '317', '0', '3');
INSERT INTO `osc_area` VALUES ('3220', '港南区', '317', '0', '3');
INSERT INTO `osc_area` VALUES ('3221', '覃塘区', '317', '0', '3');
INSERT INTO `osc_area` VALUES ('3222', '兴业县', '318', '0', '3');
INSERT INTO `osc_area` VALUES ('3223', '北流市', '318', '0', '3');
INSERT INTO `osc_area` VALUES ('3224', '博白县', '318', '0', '3');
INSERT INTO `osc_area` VALUES ('3225', '容县', '318', '0', '3');
INSERT INTO `osc_area` VALUES ('3226', '玉州区', '318', '0', '3');
INSERT INTO `osc_area` VALUES ('3227', '陆川县', '318', '0', '3');
INSERT INTO `osc_area` VALUES ('3228', '乐业县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3229', '凌云县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3230', '右江区', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3231', '平果县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3232', '德保县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3233', '田东县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3234', '田林县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3235', '田阳县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3236', '西林县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3237', '那坡县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3238', '隆林各族自治县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3239', '靖西县', '319', '0', '3');
INSERT INTO `osc_area` VALUES ('3240', '八步区', '320', '0', '3');
INSERT INTO `osc_area` VALUES ('3241', '富川瑶族自治县', '320', '0', '3');
INSERT INTO `osc_area` VALUES ('3242', '昭平县', '320', '0', '3');
INSERT INTO `osc_area` VALUES ('3243', '钟山县', '320', '0', '3');
INSERT INTO `osc_area` VALUES ('3244', '东兰县', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3245', '凤山县', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3246', '南丹县', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3247', '大化瑶族自治县', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3248', '天峨县', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3249', '宜州市', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3250', '巴马瑶族自治县', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3251', '环江毛南族自治县', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3252', '罗城仫佬族自治县', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3253', '都安瑶族自治县', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3254', '金城江区', '321', '0', '3');
INSERT INTO `osc_area` VALUES ('3255', '兴宾区', '322', '0', '3');
INSERT INTO `osc_area` VALUES ('3256', '合山市', '322', '0', '3');
INSERT INTO `osc_area` VALUES ('3257', '忻城县', '322', '0', '3');
INSERT INTO `osc_area` VALUES ('3258', '武宣县', '322', '0', '3');
INSERT INTO `osc_area` VALUES ('3259', '象州县', '322', '0', '3');
INSERT INTO `osc_area` VALUES ('3260', '金秀瑶族自治县', '322', '0', '3');
INSERT INTO `osc_area` VALUES ('3261', '凭祥市', '323', '0', '3');
INSERT INTO `osc_area` VALUES ('3262', '大新县', '323', '0', '3');
INSERT INTO `osc_area` VALUES ('3263', '天等县', '323', '0', '3');
INSERT INTO `osc_area` VALUES ('3264', '宁明县', '323', '0', '3');
INSERT INTO `osc_area` VALUES ('3265', '扶绥县', '323', '0', '3');
INSERT INTO `osc_area` VALUES ('3266', '江州区', '323', '0', '3');
INSERT INTO `osc_area` VALUES ('3267', '龙州县', '323', '0', '3');
INSERT INTO `osc_area` VALUES ('3268', '琼山区', '324', '0', '3');
INSERT INTO `osc_area` VALUES ('3269', '秀英区', '324', '0', '3');
INSERT INTO `osc_area` VALUES ('3270', '美兰区', '324', '0', '3');
INSERT INTO `osc_area` VALUES ('3271', '龙华区', '324', '0', '3');
INSERT INTO `osc_area` VALUES ('3272', '三亚市', '325', '0', '3');
INSERT INTO `osc_area` VALUES ('3273', '五指山市', '326', '0', '3');
INSERT INTO `osc_area` VALUES ('3274', '琼海市', '327', '0', '3');
INSERT INTO `osc_area` VALUES ('3275', '儋州市', '328', '0', '3');
INSERT INTO `osc_area` VALUES ('3276', '文昌市', '329', '0', '3');
INSERT INTO `osc_area` VALUES ('3277', '万宁市', '330', '0', '3');
INSERT INTO `osc_area` VALUES ('3278', '东方市', '331', '0', '3');
INSERT INTO `osc_area` VALUES ('3279', '定安县', '332', '0', '3');
INSERT INTO `osc_area` VALUES ('3280', '屯昌县', '333', '0', '3');
INSERT INTO `osc_area` VALUES ('3281', '澄迈县', '334', '0', '3');
INSERT INTO `osc_area` VALUES ('3282', '临高县', '335', '0', '3');
INSERT INTO `osc_area` VALUES ('3283', '白沙黎族自治县', '336', '0', '3');
INSERT INTO `osc_area` VALUES ('3284', '昌江黎族自治县', '337', '0', '3');
INSERT INTO `osc_area` VALUES ('3285', '乐东黎族自治县', '338', '0', '3');
INSERT INTO `osc_area` VALUES ('3286', '陵水黎族自治县', '339', '0', '3');
INSERT INTO `osc_area` VALUES ('3287', '保亭黎族苗族自治县', '340', '0', '3');
INSERT INTO `osc_area` VALUES ('3288', '琼中黎族苗族自治县', '341', '0', '3');
INSERT INTO `osc_area` VALUES ('4209', '双流县', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4210', '大邑县', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4211', '崇州市', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4212', '彭州市', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4213', '成华区', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4214', '新津县', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4215', '新都区', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4216', '武侯区', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4217', '温江区', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4218', '蒲江县', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4219', '邛崃市', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4220', '郫县', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4221', '都江堰市', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4222', '金堂县', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4223', '金牛区', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4224', '锦江区', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4225', '青白江区', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4226', '青羊区', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4227', '龙泉驿区', '385', '0', '3');
INSERT INTO `osc_area` VALUES ('4228', '大安区', '386', '0', '3');
INSERT INTO `osc_area` VALUES ('4229', '富顺县', '386', '0', '3');
INSERT INTO `osc_area` VALUES ('4230', '沿滩区', '386', '0', '3');
INSERT INTO `osc_area` VALUES ('4231', '自流井区', '386', '0', '3');
INSERT INTO `osc_area` VALUES ('4232', '荣县', '386', '0', '3');
INSERT INTO `osc_area` VALUES ('4233', '贡井区', '386', '0', '3');
INSERT INTO `osc_area` VALUES ('4234', '东区', '387', '0', '3');
INSERT INTO `osc_area` VALUES ('4235', '仁和区', '387', '0', '3');
INSERT INTO `osc_area` VALUES ('4236', '盐边县', '387', '0', '3');
INSERT INTO `osc_area` VALUES ('4237', '米易县', '387', '0', '3');
INSERT INTO `osc_area` VALUES ('4238', '西区', '387', '0', '3');
INSERT INTO `osc_area` VALUES ('4239', '叙永县', '388', '0', '3');
INSERT INTO `osc_area` VALUES ('4240', '古蔺县', '388', '0', '3');
INSERT INTO `osc_area` VALUES ('4241', '合江县', '388', '0', '3');
INSERT INTO `osc_area` VALUES ('4242', '江阳区', '388', '0', '3');
INSERT INTO `osc_area` VALUES ('4243', '泸县', '388', '0', '3');
INSERT INTO `osc_area` VALUES ('4244', '纳溪区', '388', '0', '3');
INSERT INTO `osc_area` VALUES ('4245', '龙马潭区', '388', '0', '3');
INSERT INTO `osc_area` VALUES ('4246', '中江县', '389', '0', '3');
INSERT INTO `osc_area` VALUES ('4247', '什邡市', '389', '0', '3');
INSERT INTO `osc_area` VALUES ('4248', '广汉市', '389', '0', '3');
INSERT INTO `osc_area` VALUES ('4249', '旌阳区', '389', '0', '3');
INSERT INTO `osc_area` VALUES ('4250', '绵竹市', '389', '0', '3');
INSERT INTO `osc_area` VALUES ('4251', '罗江县', '389', '0', '3');
INSERT INTO `osc_area` VALUES ('4252', '三台县', '390', '0', '3');
INSERT INTO `osc_area` VALUES ('4253', '北川羌族自治县', '390', '0', '3');
INSERT INTO `osc_area` VALUES ('4254', '安县', '390', '0', '3');
INSERT INTO `osc_area` VALUES ('4255', '平武县', '390', '0', '3');
INSERT INTO `osc_area` VALUES ('4256', '梓潼县', '390', '0', '3');
INSERT INTO `osc_area` VALUES ('4257', '江油市', '390', '0', '3');
INSERT INTO `osc_area` VALUES ('4258', '涪城区', '390', '0', '3');
INSERT INTO `osc_area` VALUES ('4259', '游仙区', '390', '0', '3');
INSERT INTO `osc_area` VALUES ('4260', '盐亭县', '390', '0', '3');
INSERT INTO `osc_area` VALUES ('4261', '元坝区', '391', '0', '3');
INSERT INTO `osc_area` VALUES ('4262', '利州区', '391', '0', '3');
INSERT INTO `osc_area` VALUES ('4263', '剑阁县', '391', '0', '3');
INSERT INTO `osc_area` VALUES ('4264', '旺苍县', '391', '0', '3');
INSERT INTO `osc_area` VALUES ('4265', '朝天区', '391', '0', '3');
INSERT INTO `osc_area` VALUES ('4266', '苍溪县', '391', '0', '3');
INSERT INTO `osc_area` VALUES ('4267', '青川县', '391', '0', '3');
INSERT INTO `osc_area` VALUES ('4268', '大英县', '392', '0', '3');
INSERT INTO `osc_area` VALUES ('4269', '安居区', '392', '0', '3');
INSERT INTO `osc_area` VALUES ('4270', '射洪县', '392', '0', '3');
INSERT INTO `osc_area` VALUES ('4271', '船山区', '392', '0', '3');
INSERT INTO `osc_area` VALUES ('4272', '蓬溪县', '392', '0', '3');
INSERT INTO `osc_area` VALUES ('4273', '东兴区', '393', '0', '3');
INSERT INTO `osc_area` VALUES ('4274', '威远县', '393', '0', '3');
INSERT INTO `osc_area` VALUES ('4275', '市中区', '393', '0', '3');
INSERT INTO `osc_area` VALUES ('4276', '资中县', '393', '0', '3');
INSERT INTO `osc_area` VALUES ('4277', '隆昌县', '393', '0', '3');
INSERT INTO `osc_area` VALUES ('4278', '五通桥区', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4279', '井研县', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4280', '夹江县', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4281', '峨眉山市', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4282', '峨边彝族自治县', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4283', '市中区', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4284', '沐川县', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4285', '沙湾区', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4286', '犍为县', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4287', '金口河区', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4288', '马边彝族自治县', '394', '0', '3');
INSERT INTO `osc_area` VALUES ('4289', '仪陇县', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4290', '南充市嘉陵区', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4291', '南部县', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4292', '嘉陵区', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4293', '营山县', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4294', '蓬安县', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4295', '西充县', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4296', '阆中市', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4297', '顺庆区', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4298', '高坪区', '395', '0', '3');
INSERT INTO `osc_area` VALUES ('4299', '东坡区', '396', '0', '3');
INSERT INTO `osc_area` VALUES ('4300', '丹棱县', '396', '0', '3');
INSERT INTO `osc_area` VALUES ('4301', '仁寿县', '396', '0', '3');
INSERT INTO `osc_area` VALUES ('4302', '彭山县', '396', '0', '3');
INSERT INTO `osc_area` VALUES ('4303', '洪雅县', '396', '0', '3');
INSERT INTO `osc_area` VALUES ('4304', '青神县', '396', '0', '3');
INSERT INTO `osc_area` VALUES ('4305', '兴文县', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4306', '南溪县', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4307', '宜宾县', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4308', '屏山县', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4309', '江安县', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4310', '珙县', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4311', '筠连县', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4312', '翠屏区', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4313', '长宁县', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4314', '高县', '397', '0', '3');
INSERT INTO `osc_area` VALUES ('4315', '华蓥市', '398', '0', '3');
INSERT INTO `osc_area` VALUES ('4316', '岳池县', '398', '0', '3');
INSERT INTO `osc_area` VALUES ('4317', '广安区', '398', '0', '3');
INSERT INTO `osc_area` VALUES ('4318', '武胜县', '398', '0', '3');
INSERT INTO `osc_area` VALUES ('4319', '邻水县', '398', '0', '3');
INSERT INTO `osc_area` VALUES ('4320', '万源市', '399', '0', '3');
INSERT INTO `osc_area` VALUES ('4321', '大竹县', '399', '0', '3');
INSERT INTO `osc_area` VALUES ('4322', '宣汉县', '399', '0', '3');
INSERT INTO `osc_area` VALUES ('4323', '开江县', '399', '0', '3');
INSERT INTO `osc_area` VALUES ('4324', '渠县', '399', '0', '3');
INSERT INTO `osc_area` VALUES ('4325', '达县', '399', '0', '3');
INSERT INTO `osc_area` VALUES ('4326', '通川区', '399', '0', '3');
INSERT INTO `osc_area` VALUES ('4327', '名山县', '400', '0', '3');
INSERT INTO `osc_area` VALUES ('4328', '天全县', '400', '0', '3');
INSERT INTO `osc_area` VALUES ('4329', '宝兴县', '400', '0', '3');
INSERT INTO `osc_area` VALUES ('4330', '汉源县', '400', '0', '3');
INSERT INTO `osc_area` VALUES ('4331', '石棉县', '400', '0', '3');
INSERT INTO `osc_area` VALUES ('4332', '芦山县', '400', '0', '3');
INSERT INTO `osc_area` VALUES ('4333', '荥经县', '400', '0', '3');
INSERT INTO `osc_area` VALUES ('4334', '雨城区', '400', '0', '3');
INSERT INTO `osc_area` VALUES ('4335', '南江县', '401', '0', '3');
INSERT INTO `osc_area` VALUES ('4336', '巴州区', '401', '0', '3');
INSERT INTO `osc_area` VALUES ('4337', '平昌县', '401', '0', '3');
INSERT INTO `osc_area` VALUES ('4338', '通江县', '401', '0', '3');
INSERT INTO `osc_area` VALUES ('4339', '乐至县', '402', '0', '3');
INSERT INTO `osc_area` VALUES ('4340', '安岳县', '402', '0', '3');
INSERT INTO `osc_area` VALUES ('4341', '简阳市', '402', '0', '3');
INSERT INTO `osc_area` VALUES ('4342', '雁江区', '402', '0', '3');
INSERT INTO `osc_area` VALUES ('4343', '九寨沟县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4344', '壤塘县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4345', '小金县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4346', '松潘县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4347', '汶川县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4348', '理县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4349', '红原县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4350', '若尔盖县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4351', '茂县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4352', '金川县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4353', '阿坝县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4354', '马尔康县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4355', '黑水县', '403', '0', '3');
INSERT INTO `osc_area` VALUES ('4356', '丹巴县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4357', '乡城县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4358', '巴塘县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4359', '康定县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4360', '得荣县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4361', '德格县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4362', '新龙县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4363', '泸定县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4364', '炉霍县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4365', '理塘县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4366', '甘孜县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4367', '白玉县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4368', '石渠县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4369', '稻城县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4370', '色达县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4371', '道孚县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4372', '雅江县', '404', '0', '3');
INSERT INTO `osc_area` VALUES ('4373', '会东县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4374', '会理县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4375', '冕宁县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4376', '喜德县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4377', '宁南县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4378', '布拖县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4379', '德昌县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4380', '昭觉县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4381', '普格县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4382', '木里藏族自治县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4383', '甘洛县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4384', '盐源县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4385', '美姑县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4386', '西昌', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4387', '越西县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4388', '金阳县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4389', '雷波县', '405', '0', '3');
INSERT INTO `osc_area` VALUES ('4390', '乌当区', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4391', '云岩区', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4392', '修文县', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4393', '南明区', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4394', '小河区', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4395', '开阳县', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4396', '息烽县', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4397', '清镇市', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4398', '白云区', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4399', '花溪区', '406', '0', '3');
INSERT INTO `osc_area` VALUES ('4400', '六枝特区', '407', '0', '3');
INSERT INTO `osc_area` VALUES ('4401', '水城县', '407', '0', '3');
INSERT INTO `osc_area` VALUES ('4402', '盘县', '407', '0', '3');
INSERT INTO `osc_area` VALUES ('4403', '钟山区', '407', '0', '3');
INSERT INTO `osc_area` VALUES ('4404', '习水县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4405', '仁怀市', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4406', '余庆县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4407', '凤冈县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4408', '务川仡佬族苗族自治县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4409', '桐梓县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4410', '正安县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4411', '汇川区', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4412', '湄潭县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4413', '红花岗区', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4414', '绥阳县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4415', '赤水市', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4416', '道真仡佬族苗族自治县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4417', '遵义县', '408', '0', '3');
INSERT INTO `osc_area` VALUES ('4418', '关岭布依族苗族自治县', '409', '0', '3');
INSERT INTO `osc_area` VALUES ('4419', '平坝县', '409', '0', '3');
INSERT INTO `osc_area` VALUES ('4420', '普定县', '409', '0', '3');
INSERT INTO `osc_area` VALUES ('4421', '紫云苗族布依族自治县', '409', '0', '3');
INSERT INTO `osc_area` VALUES ('4422', '西秀区', '409', '0', '3');
INSERT INTO `osc_area` VALUES ('4423', '镇宁布依族苗族自治县', '409', '0', '3');
INSERT INTO `osc_area` VALUES ('4424', '万山特区', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4425', '印江土家族苗族自治县', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4426', '德江县', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4427', '思南县', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4428', '松桃苗族自治县', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4429', '江口县', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4430', '沿河土家族自治县', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4431', '玉屏侗族自治县', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4432', '石阡县', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4433', '铜仁市', '410', '0', '3');
INSERT INTO `osc_area` VALUES ('4434', '兴义市', '411', '0', '3');
INSERT INTO `osc_area` VALUES ('4435', '兴仁县', '411', '0', '3');
INSERT INTO `osc_area` VALUES ('4436', '册亨县', '411', '0', '3');
INSERT INTO `osc_area` VALUES ('4437', '安龙县', '411', '0', '3');
INSERT INTO `osc_area` VALUES ('4438', '普安县', '411', '0', '3');
INSERT INTO `osc_area` VALUES ('4439', '晴隆县', '411', '0', '3');
INSERT INTO `osc_area` VALUES ('4440', '望谟县', '411', '0', '3');
INSERT INTO `osc_area` VALUES ('4441', '贞丰县', '411', '0', '3');
INSERT INTO `osc_area` VALUES ('4442', '大方县', '412', '0', '3');
INSERT INTO `osc_area` VALUES ('4443', '威宁彝族回族苗族自治县', '412', '0', '3');
INSERT INTO `osc_area` VALUES ('4444', '毕节市', '412', '0', '3');
INSERT INTO `osc_area` VALUES ('4445', '纳雍县', '412', '0', '3');
INSERT INTO `osc_area` VALUES ('4446', '织金县', '412', '0', '3');
INSERT INTO `osc_area` VALUES ('4447', '赫章县', '412', '0', '3');
INSERT INTO `osc_area` VALUES ('4448', '金沙县', '412', '0', '3');
INSERT INTO `osc_area` VALUES ('4449', '黔西县', '412', '0', '3');
INSERT INTO `osc_area` VALUES ('4450', '三穗县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4451', '丹寨县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4452', '从江县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4453', '凯里市', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4454', '剑河县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4455', '台江县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4456', '天柱县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4457', '岑巩县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4458', '施秉县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4459', '榕江县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4460', '锦屏县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4461', '镇远县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4462', '雷山县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4463', '麻江县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4464', '黄平县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4465', '黎平县', '413', '0', '3');
INSERT INTO `osc_area` VALUES ('4466', '三都水族自治县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4467', '平塘县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4468', '惠水县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4469', '独山县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4470', '瓮安县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4471', '福泉市', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4472', '罗甸县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4473', '荔波县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4474', '贵定县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4475', '都匀市', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4476', '长顺县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4477', '龙里县', '414', '0', '3');
INSERT INTO `osc_area` VALUES ('4478', '东川区', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4479', '五华区', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4480', '呈贡县', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4481', '安宁市', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4482', '官渡区', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4483', '宜良县', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4484', '富民县', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4485', '寻甸回族彝族自治县', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4486', '嵩明县', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4487', '晋宁县', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4488', '盘龙区', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4489', '石林彝族自治县', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4490', '禄劝彝族苗族自治县', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4491', '西山区', '415', '0', '3');
INSERT INTO `osc_area` VALUES ('4492', '会泽县', '416', '0', '3');
INSERT INTO `osc_area` VALUES ('4493', '宣威市', '416', '0', '3');
INSERT INTO `osc_area` VALUES ('4494', '富源县', '416', '0', '3');
INSERT INTO `osc_area` VALUES ('4495', '师宗县', '416', '0', '3');
INSERT INTO `osc_area` VALUES ('4496', '沾益县', '416', '0', '3');
INSERT INTO `osc_area` VALUES ('4497', '罗平县', '416', '0', '3');
INSERT INTO `osc_area` VALUES ('4498', '陆良县', '416', '0', '3');
INSERT INTO `osc_area` VALUES ('4499', '马龙县', '416', '0', '3');
INSERT INTO `osc_area` VALUES ('4500', '麒麟区', '416', '0', '3');
INSERT INTO `osc_area` VALUES ('4501', '元江哈尼族彝族傣族自治县', '417', '0', '3');
INSERT INTO `osc_area` VALUES ('4502', '华宁县', '417', '0', '3');
INSERT INTO `osc_area` VALUES ('4503', '峨山彝族自治县', '417', '0', '3');
INSERT INTO `osc_area` VALUES ('4504', '新平彝族傣族自治县', '417', '0', '3');
INSERT INTO `osc_area` VALUES ('4505', '易门县', '417', '0', '3');
INSERT INTO `osc_area` VALUES ('4506', '江川县', '417', '0', '3');
INSERT INTO `osc_area` VALUES ('4507', '澄江县', '417', '0', '3');
INSERT INTO `osc_area` VALUES ('4508', '红塔区', '417', '0', '3');
INSERT INTO `osc_area` VALUES ('4509', '通海县', '417', '0', '3');
INSERT INTO `osc_area` VALUES ('4510', '施甸县', '418', '0', '3');
INSERT INTO `osc_area` VALUES ('4511', '昌宁县', '418', '0', '3');
INSERT INTO `osc_area` VALUES ('4512', '腾冲县', '418', '0', '3');
INSERT INTO `osc_area` VALUES ('4513', '隆阳区', '418', '0', '3');
INSERT INTO `osc_area` VALUES ('4514', '龙陵县', '418', '0', '3');
INSERT INTO `osc_area` VALUES ('4515', '大关县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4516', '威信县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4517', '巧家县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4518', '彝良县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4519', '昭阳区', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4520', '水富县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4521', '永善县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4522', '盐津县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4523', '绥江县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4524', '镇雄县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4525', '鲁甸县', '419', '0', '3');
INSERT INTO `osc_area` VALUES ('4526', '华坪县', '420', '0', '3');
INSERT INTO `osc_area` VALUES ('4527', '古城区', '420', '0', '3');
INSERT INTO `osc_area` VALUES ('4528', '宁蒗彝族自治县', '420', '0', '3');
INSERT INTO `osc_area` VALUES ('4529', '永胜县', '420', '0', '3');
INSERT INTO `osc_area` VALUES ('4530', '玉龙纳西族自治县', '420', '0', '3');
INSERT INTO `osc_area` VALUES ('4531', '临翔区', '422', '0', '3');
INSERT INTO `osc_area` VALUES ('4532', '云县', '422', '0', '3');
INSERT INTO `osc_area` VALUES ('4533', '凤庆县', '422', '0', '3');
INSERT INTO `osc_area` VALUES ('4534', '双江拉祜族佤族布朗族傣族自治县', '422', '0', '3');
INSERT INTO `osc_area` VALUES ('4535', '永德县', '422', '0', '3');
INSERT INTO `osc_area` VALUES ('4536', '沧源佤族自治县', '422', '0', '3');
INSERT INTO `osc_area` VALUES ('4537', '耿马傣族佤族自治县', '422', '0', '3');
INSERT INTO `osc_area` VALUES ('4538', '镇康县', '422', '0', '3');
INSERT INTO `osc_area` VALUES ('4539', '元谋县', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4540', '南华县', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4541', '双柏县', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4542', '大姚县', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4543', '姚安县', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4544', '楚雄市', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4545', '武定县', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4546', '永仁县', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4547', '牟定县', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4548', '禄丰县', '423', '0', '3');
INSERT INTO `osc_area` VALUES ('4549', '个旧市', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4550', '元阳县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4551', '屏边苗族自治县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4552', '建水县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4553', '开远市', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4554', '弥勒县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4555', '河口瑶族自治县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4556', '泸西县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4557', '石屏县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4558', '红河县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4559', '绿春县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4560', '蒙自县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4561', '金平苗族瑶族傣族自治县', '424', '0', '3');
INSERT INTO `osc_area` VALUES ('4562', '丘北县', '425', '0', '3');
INSERT INTO `osc_area` VALUES ('4563', '富宁县', '425', '0', '3');
INSERT INTO `osc_area` VALUES ('4564', '广南县', '425', '0', '3');
INSERT INTO `osc_area` VALUES ('4565', '文山县', '425', '0', '3');
INSERT INTO `osc_area` VALUES ('4566', '砚山县', '425', '0', '3');
INSERT INTO `osc_area` VALUES ('4567', '西畴县', '425', '0', '3');
INSERT INTO `osc_area` VALUES ('4568', '马关县', '425', '0', '3');
INSERT INTO `osc_area` VALUES ('4569', '麻栗坡县', '425', '0', '3');
INSERT INTO `osc_area` VALUES ('4570', '勐海县', '426', '0', '3');
INSERT INTO `osc_area` VALUES ('4571', '勐腊县', '426', '0', '3');
INSERT INTO `osc_area` VALUES ('4572', '景洪市', '426', '0', '3');
INSERT INTO `osc_area` VALUES ('4573', '云龙县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4574', '剑川县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4575', '南涧彝族自治县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4576', '大理市', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4577', '宾川县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4578', '巍山彝族回族自治县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4579', '弥渡县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4580', '永平县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4581', '洱源县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4582', '漾濞彝族自治县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4583', '祥云县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4584', '鹤庆县', '427', '0', '3');
INSERT INTO `osc_area` VALUES ('4585', '梁河县', '428', '0', '3');
INSERT INTO `osc_area` VALUES ('4586', '潞西市', '428', '0', '3');
INSERT INTO `osc_area` VALUES ('4587', '瑞丽市', '428', '0', '3');
INSERT INTO `osc_area` VALUES ('4588', '盈江县', '428', '0', '3');
INSERT INTO `osc_area` VALUES ('4589', '陇川县', '428', '0', '3');
INSERT INTO `osc_area` VALUES ('4590', '德钦县', '430', '0', '3');
INSERT INTO `osc_area` VALUES ('4591', '维西傈僳族自治县', '430', '0', '3');
INSERT INTO `osc_area` VALUES ('4592', '香格里拉县', '430', '0', '3');
INSERT INTO `osc_area` VALUES ('4593', '城关区', '431', '0', '3');
INSERT INTO `osc_area` VALUES ('4594', '堆龙德庆县', '431', '0', '3');
INSERT INTO `osc_area` VALUES ('4595', '墨竹工卡县', '431', '0', '3');
INSERT INTO `osc_area` VALUES ('4596', '尼木县', '431', '0', '3');
INSERT INTO `osc_area` VALUES ('4597', '当雄县', '431', '0', '3');
INSERT INTO `osc_area` VALUES ('4598', '曲水县', '431', '0', '3');
INSERT INTO `osc_area` VALUES ('4599', '林周县', '431', '0', '3');
INSERT INTO `osc_area` VALUES ('4600', '达孜县', '431', '0', '3');
INSERT INTO `osc_area` VALUES ('4601', '丁青县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4602', '八宿县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4603', '察雅县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4604', '左贡县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4605', '昌都县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4606', '江达县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4607', '洛隆县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4608', '类乌齐县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4609', '芒康县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4610', '贡觉县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4611', '边坝县', '432', '0', '3');
INSERT INTO `osc_area` VALUES ('4612', '乃东县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4613', '加查县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4614', '扎囊县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4615', '措美县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4616', '曲松县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4617', '桑日县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4618', '洛扎县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4619', '浪卡子县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4620', '琼结县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4621', '贡嘎县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4622', '错那县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4623', '隆子县', '433', '0', '3');
INSERT INTO `osc_area` VALUES ('4624', '亚东县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4625', '仁布县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4626', '仲巴县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4627', '南木林县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4628', '吉隆县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4629', '定日县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4630', '定结县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4631', '岗巴县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4632', '康马县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4633', '拉孜县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4634', '日喀则市', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4635', '昂仁县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4636', '江孜县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4637', '白朗县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4638', '聂拉木县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4639', '萨嘎县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4640', '萨迦县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4641', '谢通门县', '434', '0', '3');
INSERT INTO `osc_area` VALUES ('4642', '嘉黎县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4643', '安多县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4644', '尼玛县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4645', '巴青县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4646', '比如县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4647', '班戈县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4648', '申扎县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4649', '索县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4650', '聂荣县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4651', '那曲县', '435', '0', '3');
INSERT INTO `osc_area` VALUES ('4652', '噶尔县', '436', '0', '3');
INSERT INTO `osc_area` VALUES ('4653', '措勤县', '436', '0', '3');
INSERT INTO `osc_area` VALUES ('4654', '改则县', '436', '0', '3');
INSERT INTO `osc_area` VALUES ('4655', '日土县', '436', '0', '3');
INSERT INTO `osc_area` VALUES ('4656', '普兰县', '436', '0', '3');
INSERT INTO `osc_area` VALUES ('4657', '札达县', '436', '0', '3');
INSERT INTO `osc_area` VALUES ('4658', '革吉县', '436', '0', '3');
INSERT INTO `osc_area` VALUES ('4659', '墨脱县', '437', '0', '3');
INSERT INTO `osc_area` VALUES ('4660', '察隅县', '437', '0', '3');
INSERT INTO `osc_area` VALUES ('4661', '工布江达县', '437', '0', '3');
INSERT INTO `osc_area` VALUES ('4662', '朗县', '437', '0', '3');
INSERT INTO `osc_area` VALUES ('4663', '林芝县', '437', '0', '3');
INSERT INTO `osc_area` VALUES ('4664', '波密县', '437', '0', '3');
INSERT INTO `osc_area` VALUES ('4665', '米林县', '437', '0', '3');
INSERT INTO `osc_area` VALUES ('4666', '临潼区', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4667', '周至县', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4668', '户县', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4669', '新城区', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4670', '未央区', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4671', '灞桥区', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4672', '碑林区', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4673', '莲湖区', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4674', '蓝田县', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4675', '长安区', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4676', '阎良区', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4677', '雁塔区', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4678', '高陵县', '438', '0', '3');
INSERT INTO `osc_area` VALUES ('4679', '印台区', '439', '0', '3');
INSERT INTO `osc_area` VALUES ('4680', '宜君县', '439', '0', '3');
INSERT INTO `osc_area` VALUES ('4681', '王益区', '439', '0', '3');
INSERT INTO `osc_area` VALUES ('4682', '耀州区', '439', '0', '3');
INSERT INTO `osc_area` VALUES ('4683', '凤县', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4684', '凤翔县', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4685', '千阳县', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4686', '太白县', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4687', '岐山县', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4688', '扶风县', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4689', '渭滨区', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4690', '眉县', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4691', '金台区', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4692', '陇县', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4693', '陈仓区', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4694', '麟游县', '440', '0', '3');
INSERT INTO `osc_area` VALUES ('4695', '三原县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4696', '干县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4697', '兴平市', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4698', '彬县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4699', '旬邑县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4700', '杨陵区', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4701', '武功县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4702', '永寿县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4703', '泾阳县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4704', '淳化县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4705', '渭城区', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4706', '礼泉县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4707', '秦都区', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4708', '长武县', '441', '0', '3');
INSERT INTO `osc_area` VALUES ('4709', '临渭区', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4710', '华县', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4711', '华阴市', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4712', '合阳县', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4713', '大荔县', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4714', '富平县', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4715', '潼关县', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4716', '澄城县', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4717', '白水县', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4718', '蒲城县', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4719', '韩城市', '442', '0', '3');
INSERT INTO `osc_area` VALUES ('4720', '吴起县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4721', '子长县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4722', '安塞县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4723', '宜川县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4724', '宝塔区', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4725', '富县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4726', '延川县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4727', '延长县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4728', '志丹县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4729', '洛川县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4730', '甘泉县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4731', '黄陵县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4732', '黄龙县', '443', '0', '3');
INSERT INTO `osc_area` VALUES ('4733', '佛坪县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4734', '勉县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4735', '南郑县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4736', '城固县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4737', '宁强县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4738', '汉台区', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4739', '洋县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4740', '留坝县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4741', '略阳县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4742', '西乡县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4743', '镇巴县', '444', '0', '3');
INSERT INTO `osc_area` VALUES ('4744', '佳县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4745', '吴堡县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4746', '子洲县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4747', '定边县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4748', '府谷县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4749', '榆林市榆阳区', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4750', '横山县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4751', '清涧县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4752', '神木县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4753', '米脂县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4754', '绥德县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4755', '靖边县', '445', '0', '3');
INSERT INTO `osc_area` VALUES ('4756', '宁陕县', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4757', '岚皋县', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4758', '平利县', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4759', '旬阳县', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4760', '汉滨区', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4761', '汉阴县', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4762', '白河县', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4763', '石泉县', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4764', '紫阳县', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4765', '镇坪县', '446', '0', '3');
INSERT INTO `osc_area` VALUES ('4766', '丹凤县', '447', '0', '3');
INSERT INTO `osc_area` VALUES ('4767', '商南县', '447', '0', '3');
INSERT INTO `osc_area` VALUES ('4768', '商州区', '447', '0', '3');
INSERT INTO `osc_area` VALUES ('4769', '山阳县', '447', '0', '3');
INSERT INTO `osc_area` VALUES ('4770', '柞水县', '447', '0', '3');
INSERT INTO `osc_area` VALUES ('4771', '洛南县', '447', '0', '3');
INSERT INTO `osc_area` VALUES ('4772', '镇安县', '447', '0', '3');
INSERT INTO `osc_area` VALUES ('4773', '七里河区', '448', '0', '3');
INSERT INTO `osc_area` VALUES ('4774', '城关区', '448', '0', '3');
INSERT INTO `osc_area` VALUES ('4775', '安宁区', '448', '0', '3');
INSERT INTO `osc_area` VALUES ('4776', '榆中县', '448', '0', '3');
INSERT INTO `osc_area` VALUES ('4777', '永登县', '448', '0', '3');
INSERT INTO `osc_area` VALUES ('4778', '皋兰县', '448', '0', '3');
INSERT INTO `osc_area` VALUES ('4779', '红古区', '448', '0', '3');
INSERT INTO `osc_area` VALUES ('4780', '西固区', '448', '0', '3');
INSERT INTO `osc_area` VALUES ('4781', '嘉峪关市', '449', '0', '3');
INSERT INTO `osc_area` VALUES ('4782', '永昌县', '450', '0', '3');
INSERT INTO `osc_area` VALUES ('4783', '金川区', '450', '0', '3');
INSERT INTO `osc_area` VALUES ('4784', '会宁县', '451', '0', '3');
INSERT INTO `osc_area` VALUES ('4785', '平川区', '451', '0', '3');
INSERT INTO `osc_area` VALUES ('4786', '景泰县', '451', '0', '3');
INSERT INTO `osc_area` VALUES ('4787', '白银区', '451', '0', '3');
INSERT INTO `osc_area` VALUES ('4788', '靖远县', '451', '0', '3');
INSERT INTO `osc_area` VALUES ('4789', '张家川回族自治县', '452', '0', '3');
INSERT INTO `osc_area` VALUES ('4790', '武山县', '452', '0', '3');
INSERT INTO `osc_area` VALUES ('4791', '清水县', '452', '0', '3');
INSERT INTO `osc_area` VALUES ('4792', '甘谷县', '452', '0', '3');
INSERT INTO `osc_area` VALUES ('4793', '秦安县', '452', '0', '3');
INSERT INTO `osc_area` VALUES ('4794', '秦州区', '452', '0', '3');
INSERT INTO `osc_area` VALUES ('4795', '麦积区', '452', '0', '3');
INSERT INTO `osc_area` VALUES ('4796', '凉州区', '453', '0', '3');
INSERT INTO `osc_area` VALUES ('4797', '古浪县', '453', '0', '3');
INSERT INTO `osc_area` VALUES ('4798', '天祝藏族自治县', '453', '0', '3');
INSERT INTO `osc_area` VALUES ('4799', '民勤县', '453', '0', '3');
INSERT INTO `osc_area` VALUES ('4800', '临泽县', '454', '0', '3');
INSERT INTO `osc_area` VALUES ('4801', '山丹县', '454', '0', '3');
INSERT INTO `osc_area` VALUES ('4802', '民乐县', '454', '0', '3');
INSERT INTO `osc_area` VALUES ('4803', '甘州区', '454', '0', '3');
INSERT INTO `osc_area` VALUES ('4804', '肃南裕固族自治县', '454', '0', '3');
INSERT INTO `osc_area` VALUES ('4805', '高台县', '454', '0', '3');
INSERT INTO `osc_area` VALUES ('4806', '华亭县', '455', '0', '3');
INSERT INTO `osc_area` VALUES ('4807', '崆峒区', '455', '0', '3');
INSERT INTO `osc_area` VALUES ('4808', '崇信县', '455', '0', '3');
INSERT INTO `osc_area` VALUES ('4809', '庄浪县', '455', '0', '3');
INSERT INTO `osc_area` VALUES ('4810', '泾川县', '455', '0', '3');
INSERT INTO `osc_area` VALUES ('4811', '灵台县', '455', '0', '3');
INSERT INTO `osc_area` VALUES ('4812', '静宁县', '455', '0', '3');
INSERT INTO `osc_area` VALUES ('4813', '敦煌市', '456', '0', '3');
INSERT INTO `osc_area` VALUES ('4814', '玉门市', '456', '0', '3');
INSERT INTO `osc_area` VALUES ('4815', '瓜州县（原安西县）', '456', '0', '3');
INSERT INTO `osc_area` VALUES ('4816', '肃北蒙古族自治县', '456', '0', '3');
INSERT INTO `osc_area` VALUES ('4817', '肃州区', '456', '0', '3');
INSERT INTO `osc_area` VALUES ('4818', '金塔县', '456', '0', '3');
INSERT INTO `osc_area` VALUES ('4819', '阿克塞哈萨克族自治县', '456', '0', '3');
INSERT INTO `osc_area` VALUES ('4820', '华池县', '457', '0', '3');
INSERT INTO `osc_area` VALUES ('4821', '合水县', '457', '0', '3');
INSERT INTO `osc_area` VALUES ('4822', '宁县', '457', '0', '3');
INSERT INTO `osc_area` VALUES ('4823', '庆城县', '457', '0', '3');
INSERT INTO `osc_area` VALUES ('4824', '正宁县', '457', '0', '3');
INSERT INTO `osc_area` VALUES ('4825', '环县', '457', '0', '3');
INSERT INTO `osc_area` VALUES ('4826', '西峰区', '457', '0', '3');
INSERT INTO `osc_area` VALUES ('4827', '镇原县', '457', '0', '3');
INSERT INTO `osc_area` VALUES ('4828', '临洮县', '458', '0', '3');
INSERT INTO `osc_area` VALUES ('4829', '安定区', '458', '0', '3');
INSERT INTO `osc_area` VALUES ('4830', '岷县', '458', '0', '3');
INSERT INTO `osc_area` VALUES ('4831', '渭源县', '458', '0', '3');
INSERT INTO `osc_area` VALUES ('4832', '漳县', '458', '0', '3');
INSERT INTO `osc_area` VALUES ('4833', '通渭县', '458', '0', '3');
INSERT INTO `osc_area` VALUES ('4834', '陇西县', '458', '0', '3');
INSERT INTO `osc_area` VALUES ('4835', '两当县', '459', '0', '3');
INSERT INTO `osc_area` VALUES ('4836', '宕昌县', '459', '0', '3');
INSERT INTO `osc_area` VALUES ('4837', '康县', '459', '0', '3');
INSERT INTO `osc_area` VALUES ('4838', '徽县', '459', '0', '3');
INSERT INTO `osc_area` VALUES ('4839', '成县', '459', '0', '3');
INSERT INTO `osc_area` VALUES ('4840', '文县', '459', '0', '3');
INSERT INTO `osc_area` VALUES ('4841', '武都区', '459', '0', '3');
INSERT INTO `osc_area` VALUES ('4842', '礼县', '459', '0', '3');
INSERT INTO `osc_area` VALUES ('4843', '西和县', '459', '0', '3');
INSERT INTO `osc_area` VALUES ('4844', '东乡族自治县', '460', '0', '3');
INSERT INTO `osc_area` VALUES ('4845', '临夏县', '460', '0', '3');
INSERT INTO `osc_area` VALUES ('4846', '临夏市', '460', '0', '3');
INSERT INTO `osc_area` VALUES ('4847', '和政县', '460', '0', '3');
INSERT INTO `osc_area` VALUES ('4848', '广河县', '460', '0', '3');
INSERT INTO `osc_area` VALUES ('4849', '康乐县', '460', '0', '3');
INSERT INTO `osc_area` VALUES ('4850', '永靖县', '460', '0', '3');
INSERT INTO `osc_area` VALUES ('4851', '积石山保安族东乡族撒拉族自治县', '460', '0', '3');
INSERT INTO `osc_area` VALUES ('4852', '临潭县', '461', '0', '3');
INSERT INTO `osc_area` VALUES ('4853', '卓尼县', '461', '0', '3');
INSERT INTO `osc_area` VALUES ('4854', '合作市', '461', '0', '3');
INSERT INTO `osc_area` VALUES ('4855', '夏河县', '461', '0', '3');
INSERT INTO `osc_area` VALUES ('4856', '玛曲县', '461', '0', '3');
INSERT INTO `osc_area` VALUES ('4857', '碌曲县', '461', '0', '3');
INSERT INTO `osc_area` VALUES ('4858', '舟曲县', '461', '0', '3');
INSERT INTO `osc_area` VALUES ('4859', '迭部县', '461', '0', '3');
INSERT INTO `osc_area` VALUES ('4860', '城东区', '462', '0', '3');
INSERT INTO `osc_area` VALUES ('4861', '城中区', '462', '0', '3');
INSERT INTO `osc_area` VALUES ('4862', '城北区', '462', '0', '3');
INSERT INTO `osc_area` VALUES ('4863', '城西区', '462', '0', '3');
INSERT INTO `osc_area` VALUES ('4864', '大通回族土族自治县', '462', '0', '3');
INSERT INTO `osc_area` VALUES ('4865', '湟中县', '462', '0', '3');
INSERT INTO `osc_area` VALUES ('4866', '湟源县', '462', '0', '3');
INSERT INTO `osc_area` VALUES ('4867', '乐都县', '463', '0', '3');
INSERT INTO `osc_area` VALUES ('4868', '互助土族自治县', '463', '0', '3');
INSERT INTO `osc_area` VALUES ('4869', '化隆回族自治县', '463', '0', '3');
INSERT INTO `osc_area` VALUES ('4870', '平安县', '463', '0', '3');
INSERT INTO `osc_area` VALUES ('4871', '循化撒拉族自治县', '463', '0', '3');
INSERT INTO `osc_area` VALUES ('4872', '民和回族土族自治县', '463', '0', '3');
INSERT INTO `osc_area` VALUES ('4873', '刚察县', '464', '0', '3');
INSERT INTO `osc_area` VALUES ('4874', '海晏县', '464', '0', '3');
INSERT INTO `osc_area` VALUES ('4875', '祁连县', '464', '0', '3');
INSERT INTO `osc_area` VALUES ('4876', '门源回族自治县', '464', '0', '3');
INSERT INTO `osc_area` VALUES ('4877', '同仁县', '465', '0', '3');
INSERT INTO `osc_area` VALUES ('4878', '尖扎县', '465', '0', '3');
INSERT INTO `osc_area` VALUES ('4879', '河南蒙古族自治县', '465', '0', '3');
INSERT INTO `osc_area` VALUES ('4880', '泽库县', '465', '0', '3');
INSERT INTO `osc_area` VALUES ('4881', '共和县', '466', '0', '3');
INSERT INTO `osc_area` VALUES ('4882', '兴海县', '466', '0', '3');
INSERT INTO `osc_area` VALUES ('4883', '同德县', '466', '0', '3');
INSERT INTO `osc_area` VALUES ('4884', '贵南县', '466', '0', '3');
INSERT INTO `osc_area` VALUES ('4885', '贵德县', '466', '0', '3');
INSERT INTO `osc_area` VALUES ('4886', '久治县', '467', '0', '3');
INSERT INTO `osc_area` VALUES ('4887', '玛多县', '467', '0', '3');
INSERT INTO `osc_area` VALUES ('4888', '玛沁县', '467', '0', '3');
INSERT INTO `osc_area` VALUES ('4889', '班玛县', '467', '0', '3');
INSERT INTO `osc_area` VALUES ('4890', '甘德县', '467', '0', '3');
INSERT INTO `osc_area` VALUES ('4891', '达日县', '467', '0', '3');
INSERT INTO `osc_area` VALUES ('4892', '囊谦县', '468', '0', '3');
INSERT INTO `osc_area` VALUES ('4893', '曲麻莱县', '468', '0', '3');
INSERT INTO `osc_area` VALUES ('4894', '杂多县', '468', '0', '3');
INSERT INTO `osc_area` VALUES ('4895', '治多县', '468', '0', '3');
INSERT INTO `osc_area` VALUES ('4896', '玉树县', '468', '0', '3');
INSERT INTO `osc_area` VALUES ('4897', '称多县', '468', '0', '3');
INSERT INTO `osc_area` VALUES ('4898', '乌兰县', '469', '0', '3');
INSERT INTO `osc_area` VALUES ('4899', '冷湖行委', '469', '0', '3');
INSERT INTO `osc_area` VALUES ('4900', '大柴旦行委', '469', '0', '3');
INSERT INTO `osc_area` VALUES ('4901', '天峻县', '469', '0', '3');
INSERT INTO `osc_area` VALUES ('4902', '德令哈市', '469', '0', '3');
INSERT INTO `osc_area` VALUES ('4903', '格尔木市', '469', '0', '3');
INSERT INTO `osc_area` VALUES ('4904', '茫崖行委', '469', '0', '3');
INSERT INTO `osc_area` VALUES ('4905', '都兰县', '469', '0', '3');
INSERT INTO `osc_area` VALUES ('4906', '兴庆区', '470', '0', '3');
INSERT INTO `osc_area` VALUES ('4907', '永宁县', '470', '0', '3');
INSERT INTO `osc_area` VALUES ('4908', '灵武市', '470', '0', '3');
INSERT INTO `osc_area` VALUES ('4909', '西夏区', '470', '0', '3');
INSERT INTO `osc_area` VALUES ('4910', '贺兰县', '470', '0', '3');
INSERT INTO `osc_area` VALUES ('4911', '金凤区', '470', '0', '3');
INSERT INTO `osc_area` VALUES ('4912', '大武口区', '471', '0', '3');
INSERT INTO `osc_area` VALUES ('4913', '平罗县', '471', '0', '3');
INSERT INTO `osc_area` VALUES ('4914', '惠农区', '471', '0', '3');
INSERT INTO `osc_area` VALUES ('4915', '利通区', '472', '0', '3');
INSERT INTO `osc_area` VALUES ('4916', '同心县', '472', '0', '3');
INSERT INTO `osc_area` VALUES ('4917', '盐池县', '472', '0', '3');
INSERT INTO `osc_area` VALUES ('4918', '青铜峡市', '472', '0', '3');
INSERT INTO `osc_area` VALUES ('4919', '原州区', '473', '0', '3');
INSERT INTO `osc_area` VALUES ('4920', '彭阳县', '473', '0', '3');
INSERT INTO `osc_area` VALUES ('4921', '泾源县', '473', '0', '3');
INSERT INTO `osc_area` VALUES ('4922', '西吉县', '473', '0', '3');
INSERT INTO `osc_area` VALUES ('4923', '隆德县', '473', '0', '3');
INSERT INTO `osc_area` VALUES ('4924', '中宁县', '474', '0', '3');
INSERT INTO `osc_area` VALUES ('4925', '沙坡头区', '474', '0', '3');
INSERT INTO `osc_area` VALUES ('4926', '海原县', '474', '0', '3');
INSERT INTO `osc_area` VALUES ('4927', '东山区', '475', '0', '3');
INSERT INTO `osc_area` VALUES ('4928', '乌鲁木齐县', '475', '0', '3');
INSERT INTO `osc_area` VALUES ('4929', '天山区', '475', '0', '3');
INSERT INTO `osc_area` VALUES ('4930', '头屯河区', '475', '0', '3');
INSERT INTO `osc_area` VALUES ('4931', '新市区', '475', '0', '3');
INSERT INTO `osc_area` VALUES ('4932', '水磨沟区', '475', '0', '3');
INSERT INTO `osc_area` VALUES ('4933', '沙依巴克区', '475', '0', '3');
INSERT INTO `osc_area` VALUES ('4934', '达坂城区', '475', '0', '3');
INSERT INTO `osc_area` VALUES ('4935', '乌尔禾区', '476', '0', '3');
INSERT INTO `osc_area` VALUES ('4936', '克拉玛依区', '476', '0', '3');
INSERT INTO `osc_area` VALUES ('4937', '独山子区', '476', '0', '3');
INSERT INTO `osc_area` VALUES ('4938', '白碱滩区', '476', '0', '3');
INSERT INTO `osc_area` VALUES ('4939', '吐鲁番市', '477', '0', '3');
INSERT INTO `osc_area` VALUES ('4940', '托克逊县', '477', '0', '3');
INSERT INTO `osc_area` VALUES ('4941', '鄯善县', '477', '0', '3');
INSERT INTO `osc_area` VALUES ('4942', '伊吾县', '478', '0', '3');
INSERT INTO `osc_area` VALUES ('4943', '哈密市', '478', '0', '3');
INSERT INTO `osc_area` VALUES ('4944', '巴里坤哈萨克自治县', '478', '0', '3');
INSERT INTO `osc_area` VALUES ('4945', '吉木萨尔县', '479', '0', '3');
INSERT INTO `osc_area` VALUES ('4946', '呼图壁县', '479', '0', '3');
INSERT INTO `osc_area` VALUES ('4947', '奇台县', '479', '0', '3');
INSERT INTO `osc_area` VALUES ('4948', '昌吉市', '479', '0', '3');
INSERT INTO `osc_area` VALUES ('4949', '木垒哈萨克自治县', '479', '0', '3');
INSERT INTO `osc_area` VALUES ('4950', '玛纳斯县', '479', '0', '3');
INSERT INTO `osc_area` VALUES ('4951', '米泉市', '479', '0', '3');
INSERT INTO `osc_area` VALUES ('4952', '阜康市', '479', '0', '3');
INSERT INTO `osc_area` VALUES ('4953', '博乐市', '480', '0', '3');
INSERT INTO `osc_area` VALUES ('4954', '温泉县', '480', '0', '3');
INSERT INTO `osc_area` VALUES ('4955', '精河县', '480', '0', '3');
INSERT INTO `osc_area` VALUES ('4956', '博湖县', '481', '0', '3');
INSERT INTO `osc_area` VALUES ('4957', '和硕县', '481', '0', '3');
INSERT INTO `osc_area` VALUES ('4958', '和静县', '481', '0', '3');
INSERT INTO `osc_area` VALUES ('4959', '尉犁县', '481', '0', '3');
INSERT INTO `osc_area` VALUES ('4960', '库尔勒市', '481', '0', '3');
INSERT INTO `osc_area` VALUES ('4961', '焉耆回族自治县', '481', '0', '3');
INSERT INTO `osc_area` VALUES ('4962', '若羌县', '481', '0', '3');
INSERT INTO `osc_area` VALUES ('4963', '轮台县', '481', '0', '3');
INSERT INTO `osc_area` VALUES ('4964', '乌什县', '482', '0', '3');
INSERT INTO `osc_area` VALUES ('4965', '库车县', '482', '0', '3');
INSERT INTO `osc_area` VALUES ('4966', '拜城县', '482', '0', '3');
INSERT INTO `osc_area` VALUES ('4967', '新和县', '482', '0', '3');
INSERT INTO `osc_area` VALUES ('4968', '柯坪县', '482', '0', '3');
INSERT INTO `osc_area` VALUES ('4969', '沙雅县', '482', '0', '3');
INSERT INTO `osc_area` VALUES ('4970', '温宿县', '482', '0', '3');
INSERT INTO `osc_area` VALUES ('4971', '阿克苏市', '482', '0', '3');
INSERT INTO `osc_area` VALUES ('4972', '阿瓦提县', '482', '0', '3');
INSERT INTO `osc_area` VALUES ('4973', '乌恰县', '483', '0', '3');
INSERT INTO `osc_area` VALUES ('4974', '阿克陶县', '483', '0', '3');
INSERT INTO `osc_area` VALUES ('4975', '阿合奇县', '483', '0', '3');
INSERT INTO `osc_area` VALUES ('4976', '阿图什市', '483', '0', '3');
INSERT INTO `osc_area` VALUES ('4977', '伽师县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4978', '叶城县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4979', '喀什市', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4980', '塔什库尔干塔吉克自治县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4981', '岳普湖县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4982', '巴楚县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4983', '泽普县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4984', '疏勒县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4985', '疏附县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4986', '英吉沙县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4987', '莎车县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4988', '麦盖提县', '484', '0', '3');
INSERT INTO `osc_area` VALUES ('4989', '于田县', '485', '0', '3');
INSERT INTO `osc_area` VALUES ('4990', '和田县', '485', '0', '3');
INSERT INTO `osc_area` VALUES ('4991', '和田市', '485', '0', '3');
INSERT INTO `osc_area` VALUES ('4992', '墨玉县', '485', '0', '3');
INSERT INTO `osc_area` VALUES ('4993', '民丰县', '485', '0', '3');
INSERT INTO `osc_area` VALUES ('4994', '洛浦县', '485', '0', '3');
INSERT INTO `osc_area` VALUES ('4995', '皮山县', '485', '0', '3');
INSERT INTO `osc_area` VALUES ('4996', '策勒县', '485', '0', '3');
INSERT INTO `osc_area` VALUES ('4997', '伊宁县', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('4998', '伊宁市', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('4999', '奎屯市', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('5000', '察布查尔锡伯自治县', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('5001', '尼勒克县', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('5002', '巩留县', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('5003', '新源县', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('5004', '昭苏县', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('5005', '特克斯县', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('5006', '霍城县', '486', '0', '3');
INSERT INTO `osc_area` VALUES ('5007', '乌苏市', '487', '0', '3');
INSERT INTO `osc_area` VALUES ('5008', '和布克赛尔蒙古自治县', '487', '0', '3');
INSERT INTO `osc_area` VALUES ('5009', '塔城市', '487', '0', '3');
INSERT INTO `osc_area` VALUES ('5010', '托里县', '487', '0', '3');
INSERT INTO `osc_area` VALUES ('5011', '沙湾县', '487', '0', '3');
INSERT INTO `osc_area` VALUES ('5012', '裕民县', '487', '0', '3');
INSERT INTO `osc_area` VALUES ('5013', '额敏县', '487', '0', '3');
INSERT INTO `osc_area` VALUES ('5014', '吉木乃县', '488', '0', '3');
INSERT INTO `osc_area` VALUES ('5015', '哈巴河县', '488', '0', '3');
INSERT INTO `osc_area` VALUES ('5016', '富蕴县', '488', '0', '3');
INSERT INTO `osc_area` VALUES ('5017', '布尔津县', '488', '0', '3');
INSERT INTO `osc_area` VALUES ('5018', '福海县', '488', '0', '3');
INSERT INTO `osc_area` VALUES ('5019', '阿勒泰市', '488', '0', '3');
INSERT INTO `osc_area` VALUES ('5020', '青河县', '488', '0', '3');
INSERT INTO `osc_area` VALUES ('5021', '石河子市', '489', '0', '3');
INSERT INTO `osc_area` VALUES ('5022', '阿拉尔市', '490', '0', '3');
INSERT INTO `osc_area` VALUES ('5023', '图木舒克市', '491', '0', '3');
INSERT INTO `osc_area` VALUES ('5024', '五家渠市', '492', '0', '3');
INSERT INTO `osc_area` VALUES ('45055', '海外', '35', '0', '2');

-- ----------------------------
-- Table structure for osc_article
-- ----------------------------
DROP TABLE IF EXISTS `osc_article`;
CREATE TABLE `osc_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `gory_id` int(10) NOT NULL COMMENT '分类id',
  `title` varchar(128) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` text,
  `dateline` datetime DEFAULT NULL,
  `sort_order` tinyint(2) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL COMMENT '点击数',
  `image` varchar(255) NOT NULL COMMENT '封面图',
  `default` tinyint(2) NOT NULL COMMENT '是否头条',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_article
-- ----------------------------
INSERT INTO `osc_article` VALUES ('1', '3', '测试标题1', 'admin', 'wew ', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180818/2018081897514855-630x630.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;人行道的绿灯一亮，十字路口所有方向的机动车都要停下来等行人过马路，行人不仅可以走到马路对面，还可以沿着对角线走到马路斜对面。8月17日，北京市首个&amp;ldquo;全向十字路口&amp;rdquo;在石景山启用。这一路口设于鲁谷西街与政达路交叉路口，在全向十字路口，行人与机动车辆没有交叉，行人可以在某一固定时间周期内向所有方向自由穿越道路，减少了二次过街的等候时间。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;视点&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;首个全向十字路口启用&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;行人拥有专属通行时间&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;8月17日，石景山区的鲁谷西街与政达路交叉处的十字路口有了新样貌。与传统的十字路口不同，除了四条常规的人行道之外，路口处多出了两条交叉对角线作为人行斑马线。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;这是北京市首个全向十字路口，设于石景山区鲁谷西街与政达路交叉路口。在全向十字路口，行人有专属的通行时间，这一时间段内，十字路口四个角落针对行人的信号灯会同时为绿灯，此时所有车辆需停车等候，行人不仅可以走到道路的正对面，也可以穿越对角线通往道路的斜对面。也就是说，在全向十字路口，行人在某一固定时间周期内可以在所有方向上自由穿越道路，减少了二次过街的等候时间。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;作为全市首个全向十字路口，石景山区选取鲁谷西街与政达路交叉路口作为试点，是前期石景山交通支队反复研究、论证的结果。该路口位于石景山区东部，路口周边有万达商城等多个商厦和写字楼，上班人流密集，晚上及节假日到万达商城购物游玩的人流也十分集中。&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180818/2018081856979799-630x630.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;为减少行人二次过街，同时避免行人与机动车在路口发生交叉，石景山交通支队借鉴国际经验，采取施划交叉人行横道、增设斜角对向信号灯、设置语音提示装置、增设右转相位灯等优化措施，保障行人安全通过路口。这就形成了8月17日首个亮相北京市的全向十字路口&lt;/p&gt;\r\n', '2018-08-18 10:36:27', '22', '0', 'images/osc1/1/1.jpg', '2');
INSERT INTO `osc_article` VALUES ('2', '2', '标题2', 'admin', '', '&lt;p style=&quot;text-align: justify;&quot;&gt;人行道的绿灯一亮，十字路口所有方向的机动车都要停下来等行人过马路，行人不仅可以走到马路对面，还可以沿着对角线走到马路斜对面。8月17日，北京市首个&amp;ldquo;全向十字路口&amp;rdquo;在石景山启用。这一路口设于鲁谷西街与政达路交叉路口，在全向十字路口，行人与机动车辆没有交叉，行人可以在某一固定时间周期内向所有方向自由穿越道路，减少了二次过街的等候时间。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;视点&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;首个全向十字路口启用&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;行人拥有专属通行时间&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;8月17日，石景山区的鲁谷西街与政达路交叉处的十字路口有了新样貌。与传统的十字路口不同，除了四条常规的人行道之外，路口处多出了两条交叉对角线作为人行斑马线。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;这是北京市首个全向十字路口，设于石景山区鲁谷西街与政达路交叉路口。在全向十字路口，行人有专属的通行时间，这一时间段内，十字路口四个角落针对行人的信号灯会同时为绿灯，此时所有车辆需停车等候，行人不仅可以走到道路的正对面，也可以穿越对角线通往道路的斜对面。也就是说，在全向十字路口，行人在某一固定时间周期内可以在所有方向上自由穿越道路，减少了二次过街的等候时间。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;作为全市首个全向十字路口，石景山区选取鲁谷西街与政达路交叉路口作为试点，是前期石景山交通支队反复研究、论证的结果。该路口位于石景山区东部，路口周边有万达商城等多个商厦和写字楼，上班人流密集，晚上及节假日到万达商城购物游玩的人流也十分集中。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;为减少行人二次过街，同时避免行人与机动车在路口发生交叉，石景山交通支队借鉴国际经验，采取施划交叉人行横道、增设斜角对向信号灯、设置语音提示装置、增设右转相位灯等优化措施，保障行人安全通过路口。这就形成了8月17日首个亮相北京市的全向十字路口&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180818/2018081855101575-630x424.jpg&quot; /&gt;&lt;/p&gt;\r\n', '2018-08-18 10:35:54', '33', '0', 'images/osc1/6/1.jpg', '2');
INSERT INTO `osc_article` VALUES ('6', '2', '测试文章分类', 'admin', '文章简介', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180818/2018081849535197-630x1000.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;人行道的绿灯一亮，十字路口所有方向的机动车都要停下来等行人过马路，行人不仅可以走到马路对面，还可以沿着对角线走到马路斜对面。8月17日，北京市首个&amp;ldquo;全向十字路口&amp;rdquo;在石景山启用。这一路口设于鲁谷西街与政达路交叉路口，在全向十字路口，行人与机动车辆没有交叉，行人可以在某一固定时间周期内向所有方向自由穿越道路，减少了二次过街的等候时间。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;视点&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;首个全向十字路口启用&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;行人拥有专属通行时间&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;8月17日，石景山区的鲁谷西街与政达路交叉处的十字路口有了新样貌。与传统的十字路口不同，除了四条常规的人行道之外，路口处多出了两条交叉对角线作为人行斑马线。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;这是北京市首个全向十字路口，设于石景山区鲁谷西街与政达路交叉路口。在全向十字路口，行人有专属的通行时间，这一时间段内，十字路口四个角落针对行人的信号灯会同时为绿灯，此时所有车辆需停车等候，行人不仅可以走到道路的正对面，也可以穿越对角线通往道路的斜对面。也就是说，在全向十字路口，行人在某一固定时间周期内可以在所有方向上自由穿越道路，减少了二次过街的等候时间。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;作为全市首个全向十字路口，石景山区选取鲁谷西街与政达路交叉路口作为试点，是前期石景山交通支队反复研究、论证的结果。该路口位于石景山区东部，路口周边有万达商城等多个商厦和写字楼，上班人流密集，晚上及节假日到万达商城购物游玩的人流也十分集中。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;为减少行人二次过街，同时避免行人与机动车在路口发生交叉，石景山交通支队借鉴国际经验，采取施划交叉人行横道、增设斜角对向信号灯、设置语音提示装置、增设右转相位灯等优化措施，保障行人安全通过路口。这就形成了8月17日首个亮相北京市的全向十字路口&lt;/p&gt;\r\n', '2018-08-18 10:35:33', '11', '0', 'images/osc1/1/1.jpg', '2');

-- ----------------------------
-- Table structure for osc_article_category
-- ----------------------------
DROP TABLE IF EXISTS `osc_article_category`;
CREATE TABLE `osc_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '分类名称',
  `image` varchar(255) NOT NULL,
  `sort_order` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_article_category
-- ----------------------------
INSERT INTO `osc_article_category` VALUES ('2', 'PF系列新手教程', '', '3');
INSERT INTO `osc_article_category` VALUES ('3', 'PS系列使用教程', '', '1');

-- ----------------------------
-- Table structure for osc_attribute
-- ----------------------------
DROP TABLE IF EXISTS `osc_attribute`;
CREATE TABLE `osc_attribute` (
  `attribute_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `value` text,
  `update_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_attribute
-- ----------------------------
INSERT INTO `osc_attribute` VALUES ('1', '属性', '属性1,属性2', '1533114682');
INSERT INTO `osc_attribute` VALUES ('2', '属性测试2', '属性测试3,属性测试5', '1533114711');

-- ----------------------------
-- Table structure for osc_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `osc_attribute_value`;
CREATE TABLE `osc_attribute_value` (
  `attribute_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `attribute_id` int(11) NOT NULL DEFAULT '0',
  `value_name` varchar(128) DEFAULT NULL,
  `value_sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attribute_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='选项值';

-- ----------------------------
-- Records of osc_attribute_value
-- ----------------------------
INSERT INTO `osc_attribute_value` VALUES ('1', '属性', '1', '属性1', '1');
INSERT INTO `osc_attribute_value` VALUES ('2', '属性', '1', '属性2', '2');
INSERT INTO `osc_attribute_value` VALUES ('3', '属性测试2', '2', '属性测试3', '1');
INSERT INTO `osc_attribute_value` VALUES ('4', '属性测试2', '2', '属性测试5', '2');

-- ----------------------------
-- Table structure for osc_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `osc_auth_group`;
CREATE TABLE `osc_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `type` varchar(20) DEFAULT NULL,
  `title` char(20) DEFAULT NULL COMMENT '用户组中文名称',
  `description` varchar(80) DEFAULT NULL COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_auth_group
-- ----------------------------
INSERT INTO `osc_auth_group` VALUES ('2', 'admin', '超级管理员', '后台超级管理员', '1', '1,2,13,19,28,29,30,38,46,57,66,67,68,69,70,71,72,73,75,76,77,113,120,121,122,123,124,125,126,127,129,130,131,133,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,151,152,153,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,290,327,328,333,334,336,337,338');

-- ----------------------------
-- Table structure for osc_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `osc_auth_group_access`;
CREATE TABLE `osc_auth_group_access` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_auth_group_access
-- ----------------------------
INSERT INTO `osc_auth_group_access` VALUES ('2', '2');

-- ----------------------------
-- Table structure for osc_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `osc_auth_rule`;
CREATE TABLE `osc_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_auth_rule
-- ----------------------------
INSERT INTO `osc_auth_rule` VALUES ('120', '2', '1', 'admin/settings/general');
INSERT INTO `osc_auth_rule` VALUES ('121', '2', '2', 'admin/menu/index');
INSERT INTO `osc_auth_rule` VALUES ('122', '2', '13', '');
INSERT INTO `osc_auth_rule` VALUES ('123', '2', '19', 'admin/category/index');
INSERT INTO `osc_auth_rule` VALUES ('124', '2', '28', 'admin/goods/index');
INSERT INTO `osc_auth_rule` VALUES ('125', '2', '29', 'admin/goods/index');
INSERT INTO `osc_auth_rule` VALUES ('126', '2', '30', 'admin/weight_class/index');
INSERT INTO `osc_auth_rule` VALUES ('127', '2', '38', 'admin/settings/general');
INSERT INTO `osc_auth_rule` VALUES ('128', '2', '46', 'admin/config/index');
INSERT INTO `osc_auth_rule` VALUES ('129', '2', '57', 'admin/index/index');
INSERT INTO `osc_auth_rule` VALUES ('130', '2', '66', 'admin/goods/add');
INSERT INTO `osc_auth_rule` VALUES ('131', '2', '67', 'admin/goods/copy_goods');
INSERT INTO `osc_auth_rule` VALUES ('132', '2', '68', 'admin/goods/edit');
INSERT INTO `osc_auth_rule` VALUES ('133', '2', '69', 'admin/goods/del');
INSERT INTO `osc_auth_rule` VALUES ('134', '2', '70', 'admin/category/add');
INSERT INTO `osc_auth_rule` VALUES ('135', '2', '71', 'admin/category/edit');
INSERT INTO `osc_auth_rule` VALUES ('136', '2', '72', 'admin/category/del');
INSERT INTO `osc_auth_rule` VALUES ('137', '2', '73', 'admin/category/autocomplete');
INSERT INTO `osc_auth_rule` VALUES ('138', '2', '75', 'admin/weight_class/add');
INSERT INTO `osc_auth_rule` VALUES ('139', '2', '76', 'admin/weight_class/edit');
INSERT INTO `osc_auth_rule` VALUES ('140', '2', '77', 'admin/weight_class/del');
INSERT INTO `osc_auth_rule` VALUES ('141', '2', '113', 'admin/settings/save');
INSERT INTO `osc_auth_rule` VALUES ('142', '2', '120', 'admin/menu/add');
INSERT INTO `osc_auth_rule` VALUES ('143', '2', '121', 'admin/menu/edit');
INSERT INTO `osc_auth_rule` VALUES ('144', '2', '122', 'admin/menu/del');
INSERT INTO `osc_auth_rule` VALUES ('145', '2', '123', 'admin/menu/get_info');
INSERT INTO `osc_auth_rule` VALUES ('146', '2', '124', 'admin/module/index');
INSERT INTO `osc_auth_rule` VALUES ('147', '2', '125', 'admin/auth_manager/index');
INSERT INTO `osc_auth_rule` VALUES ('148', '2', '126', 'admin/user_action/index');
INSERT INTO `osc_auth_rule` VALUES ('149', '2', '127', 'admin/user/index');
INSERT INTO `osc_auth_rule` VALUES ('150', '2', '129', '');
INSERT INTO `osc_auth_rule` VALUES ('151', '2', '130', 'member/menu_backend/index');
INSERT INTO `osc_auth_rule` VALUES ('152', '2', '131', 'member/auth_backend/index');
INSERT INTO `osc_auth_rule` VALUES ('153', '2', '133', 'member/payment/index');
INSERT INTO `osc_auth_rule` VALUES ('154', '2', '135', 'admin/length_class/index');
INSERT INTO `osc_auth_rule` VALUES ('155', '2', '136', 'admin/brand/index');
INSERT INTO `osc_auth_rule` VALUES ('156', '2', '137', 'member/transport/index');
INSERT INTO `osc_auth_rule` VALUES ('157', '2', '138', 'member/order_backend/index');
INSERT INTO `osc_auth_rule` VALUES ('158', '2', '139', 'member/member_backend/index');
INSERT INTO `osc_auth_rule` VALUES ('159', '2', '140', 'admin/goods/set_status');
INSERT INTO `osc_auth_rule` VALUES ('160', '2', '141', 'admin/goods/update_price');
INSERT INTO `osc_auth_rule` VALUES ('161', '2', '142', 'admin/goods/update_quantity');
INSERT INTO `osc_auth_rule` VALUES ('162', '2', '143', 'admin/goods/update_sort');
INSERT INTO `osc_auth_rule` VALUES ('163', '2', '144', 'admin/goods/edit_general');
INSERT INTO `osc_auth_rule` VALUES ('164', '2', '145', 'admin/goods/edit_links');
INSERT INTO `osc_auth_rule` VALUES ('165', '2', '146', 'admin/goods/edit_option');
INSERT INTO `osc_auth_rule` VALUES ('166', '2', '147', 'admin/goods/edit_discount');
INSERT INTO `osc_auth_rule` VALUES ('167', '2', '148', 'admin/goods/edit_image');
INSERT INTO `osc_auth_rule` VALUES ('168', '2', '149', 'admin/goods/edit_mobile');
INSERT INTO `osc_auth_rule` VALUES ('169', '2', '151', 'admin/attribute/autocomplete');
INSERT INTO `osc_auth_rule` VALUES ('170', '2', '152', 'admin/brand/autocomplete');
INSERT INTO `osc_auth_rule` VALUES ('171', '2', '153', 'admin/category/update_sort');
INSERT INTO `osc_auth_rule` VALUES ('172', '2', '159', 'admin/length_class/add');
INSERT INTO `osc_auth_rule` VALUES ('173', '2', '160', 'admin/length_class/edit');
INSERT INTO `osc_auth_rule` VALUES ('174', '2', '161', 'admin/length_class/del');
INSERT INTO `osc_auth_rule` VALUES ('175', '2', '162', 'admin/brand/add');
INSERT INTO `osc_auth_rule` VALUES ('176', '2', '163', 'admin/brand/edit');
INSERT INTO `osc_auth_rule` VALUES ('177', '2', '164', 'admin/brand/del');
INSERT INTO `osc_auth_rule` VALUES ('178', '2', '165', 'admin/brand/autocomplete');
INSERT INTO `osc_auth_rule` VALUES ('179', '2', '166', 'member/menu_backend/add');
INSERT INTO `osc_auth_rule` VALUES ('180', '2', '167', 'member/menu_backend/edit');
INSERT INTO `osc_auth_rule` VALUES ('181', '2', '168', 'member/menu_backend/del');
INSERT INTO `osc_auth_rule` VALUES ('182', '2', '169', 'member/menu_backend/get_info');
INSERT INTO `osc_auth_rule` VALUES ('183', '2', '170', 'member/auth_backend/create_group');
INSERT INTO `osc_auth_rule` VALUES ('184', '2', '171', 'member/auth_backend/edit_group');
INSERT INTO `osc_auth_rule` VALUES ('185', '2', '172', 'member/auth_backend/del_group');
INSERT INTO `osc_auth_rule` VALUES ('186', '2', '173', 'member/auth_backend/access');
INSERT INTO `osc_auth_rule` VALUES ('187', '2', '174', 'member/auth_backend/write_group');
INSERT INTO `osc_auth_rule` VALUES ('188', '2', '175', 'member/auth_backend/set_status');
INSERT INTO `osc_auth_rule` VALUES ('189', '2', '176', 'member/order_backend/show_order');
INSERT INTO `osc_auth_rule` VALUES ('190', '2', '177', 'member/order_backend/print_order');
INSERT INTO `osc_auth_rule` VALUES ('191', '2', '178', 'member/order_backend/history');
INSERT INTO `osc_auth_rule` VALUES ('192', '2', '179', 'member/order_backend/update_order');
INSERT INTO `osc_auth_rule` VALUES ('193', '2', '180', 'member/order_backend/update_shipping');
INSERT INTO `osc_auth_rule` VALUES ('194', '2', '181', 'member/member_backend/add');
INSERT INTO `osc_auth_rule` VALUES ('195', '2', '182', 'member/member_backend/edit');
INSERT INTO `osc_auth_rule` VALUES ('196', '2', '183', 'member/payment/edit');
INSERT INTO `osc_auth_rule` VALUES ('197', '2', '184', 'member/payment/set_status');
INSERT INTO `osc_auth_rule` VALUES ('198', '2', '186', 'admin/module/del');
INSERT INTO `osc_auth_rule` VALUES ('199', '2', '187', 'admin/auth_manager/create_group');
INSERT INTO `osc_auth_rule` VALUES ('200', '2', '188', 'admin/auth_manager/edit_group');
INSERT INTO `osc_auth_rule` VALUES ('201', '2', '189', 'admin/auth_manager/del_group');
INSERT INTO `osc_auth_rule` VALUES ('202', '2', '190', 'admin/auth_manager/access');
INSERT INTO `osc_auth_rule` VALUES ('203', '2', '191', 'admin/auth_manager/write_group');
INSERT INTO `osc_auth_rule` VALUES ('204', '2', '192', 'admin/auth_manager/set_status');
INSERT INTO `osc_auth_rule` VALUES ('205', '2', '193', 'admin/user/add');
INSERT INTO `osc_auth_rule` VALUES ('206', '2', '194', 'admin/user/edit');
INSERT INTO `osc_auth_rule` VALUES ('207', '2', '195', 'admin/user/del');
INSERT INTO `osc_auth_rule` VALUES ('208', '2', '196', 'admin/user/set_status');
INSERT INTO `osc_auth_rule` VALUES ('209', '2', '197', 'admin/config/add');
INSERT INTO `osc_auth_rule` VALUES ('210', '2', '198', 'admin/config/edit');
INSERT INTO `osc_auth_rule` VALUES ('211', '2', '199', 'admin/config/del');
INSERT INTO `osc_auth_rule` VALUES ('212', '2', '200', 'admin/transport/add');
INSERT INTO `osc_auth_rule` VALUES ('213', '2', '201', 'admin/transport/clone_data');
INSERT INTO `osc_auth_rule` VALUES ('214', '2', '202', 'admin/transport/edit');
INSERT INTO `osc_auth_rule` VALUES ('215', '2', '203', 'admin/transport/save');
INSERT INTO `osc_auth_rule` VALUES ('216', '2', '204', 'admin/transport/del');
INSERT INTO `osc_auth_rule` VALUES ('217', '2', '205', 'admin/transport/getCity');
INSERT INTO `osc_auth_rule` VALUES ('218', '2', '206', 'member/order_status/index');
INSERT INTO `osc_auth_rule` VALUES ('219', '2', '207', 'member/order_status/add');
INSERT INTO `osc_auth_rule` VALUES ('220', '2', '208', 'member/order_status/edit');
INSERT INTO `osc_auth_rule` VALUES ('221', '2', '209', 'member/order_status/del');
INSERT INTO `osc_auth_rule` VALUES ('222', '2', '210', 'admin/settings/other');
INSERT INTO `osc_auth_rule` VALUES ('223', '2', '290', 'admin/index/logout');
INSERT INTO `osc_auth_rule` VALUES ('224', '2', '327', '');
INSERT INTO `osc_auth_rule` VALUES ('225', '2', '328', 'admin/article/index');
INSERT INTO `osc_auth_rule` VALUES ('226', '2', '333', '');
INSERT INTO `osc_auth_rule` VALUES ('227', '2', '334', 'admin/bluetooth/index');
INSERT INTO `osc_auth_rule` VALUES ('228', '2', '336', 'admin/article_gory/index');
INSERT INTO `osc_auth_rule` VALUES ('229', '2', '337', 'admin/helper/index');
INSERT INTO `osc_auth_rule` VALUES ('230', '2', '338', 'admin/teacher/index');

-- ----------------------------
-- Table structure for osc_banner
-- ----------------------------
DROP TABLE IF EXISTS `osc_banner`;
CREATE TABLE `osc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_url` text COMMENT '链接',
  `sort_order` tinyint(2) DEFAULT NULL COMMENT '排序',
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '是否停用',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_banner
-- ----------------------------
INSERT INTO `osc_banner` VALUES ('4', '', '12', 'images/osc1/14913587293622.jpg', '1', 'PS系列');
INSERT INTO `osc_banner` VALUES ('5', '', '12', 'images/osc1/1491358729362.jpg', '1', 'PF');

-- ----------------------------
-- Table structure for osc_bluetooth
-- ----------------------------
DROP TABLE IF EXISTS `osc_bluetooth`;
CREATE TABLE `osc_bluetooth` (
  `bluetooth_id` int(11) NOT NULL AUTO_INCREMENT,
  `bluename` varchar(255) NOT NULL COMMENT '蓝牙名称',
  `light` varchar(255) NOT NULL COMMENT '光效',
  `flashlight1` varchar(255) NOT NULL COMMENT '闪灯',
  `flashlight2` varchar(255) NOT NULL,
  `flashlight3` varchar(255) NOT NULL,
  `flashlight4` varchar(255) NOT NULL,
  `flashlight5` varchar(255) NOT NULL,
  `led1` varchar(255) NOT NULL COMMENT 'LED调整',
  `led2` varchar(255) NOT NULL,
  `led3` varchar(255) NOT NULL,
  `led4` varchar(255) NOT NULL,
  `led5` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `hot` int(11) NOT NULL COMMENT '热门使用',
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`bluetooth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_bluetooth
-- ----------------------------
INSERT INTO `osc_bluetooth` VALUES ('2', '4号灯光', '04', '01', '07', '01', '00', '00', '03', '08', '08', '01', '09', 'images/osc1/w5.jpg', '1', '0');
INSERT INTO `osc_bluetooth` VALUES ('3', '3号灯光', '03', '00', '00', '08', '00', '00', '01', '02', '03', '08', '10', 'images/osc1/w4.jpg', '1', '0');
INSERT INTO `osc_bluetooth` VALUES ('4', '2号灯光', '02', '00', '08', '00', '00', '00', '01', '10', '10', '01', '14', 'images/osc1/w3.jpg', '1', '3');
INSERT INTO `osc_bluetooth` VALUES ('5', '1号灯光', '01', '08', '00', '00', '00', '00', '12', '03', '02', '01', '10', 'images/osc1/w2.jpg', '1', '1');

-- ----------------------------
-- Table structure for osc_brand
-- ----------------------------
DROP TABLE IF EXISTS `osc_brand`;
CREATE TABLE `osc_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  `image` varchar(75) NOT NULL DEFAULT '',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_brand
-- ----------------------------
INSERT INTO `osc_brand` VALUES ('1', '昌大昌', 'images/osc1/pic3.jpg', '12', '1545896515', '0');
INSERT INTO `osc_brand` VALUES ('2', '趣士多', 'images/osc1/pic4.jpg', '16', '1545896545', '1545901249');
INSERT INTO `osc_brand` VALUES ('3', '测试', 'images/osc1/141066.gif', '0', '1546597040', '0');

-- ----------------------------
-- Table structure for osc_cart
-- ----------------------------
DROP TABLE IF EXISTS `osc_cart`;
CREATE TABLE `osc_cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'money' COMMENT 'money在线付款，points积分兑换',
  `uid` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `goods_option` text,
  `quantity` int(5) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`uid`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of osc_cart
-- ----------------------------

-- ----------------------------
-- Table structure for osc_category
-- ----------------------------
DROP TABLE IF EXISTS `osc_category`;
CREATE TABLE `osc_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '标题',
  `image` varchar(64) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `marvellous` mediumint(6) NOT NULL DEFAULT '0' COMMENT '精彩推荐',
  `hot` mediumint(6) DEFAULT '0' COMMENT '热门推荐',
  `works` mediumint(6) DEFAULT '0' COMMENT '名师作品',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of osc_category
-- ----------------------------
INSERT INTO `osc_category` VALUES ('44', '0', '男装', 'images/osc1/man.jpg', '', '', '0', '1534934448', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('45', '0', '女装', 'images/osc1/woman.jpg', '', '', '0', '1534934454', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('46', '44', '外套', 'images/osc1/uujjjj.jpg', '', '', '0', '1535015552', '1', '1', '1');
INSERT INTO `osc_category` VALUES ('47', '44', 'T恤', 'images/osc1/T.jpg', '', '', '0', '1534947452', '1', '0', '0');
INSERT INTO `osc_category` VALUES ('48', '44', '长袖', 'images/osc1/changxiu.jpg', '', '', '0', '1534947458', '1', '0', '0');
INSERT INTO `osc_category` VALUES ('50', '44', '裤子', 'images/osc1/ku.jpg', '', '', '0', '1534986726', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('52', '45', '卫衣', 'images/osc1/weiyinv.jpg', '', '', '0', '1534938673', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('53', '45', '连衣裙', 'images/osc1/weg.jpg', '', '', '0', '1534945468', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('54', '45', '针织衫', 'images/osc1/ttt.jpg', '', '', '0', '1534945687', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('55', '44', '卫衣', 'images/osc1/nanweiyi.jpg', '', '', '0', '1534939042', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('56', '45', '外套', 'images/osc1/11.jpg', '', '', '0', '1534938977', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('57', '45', '半身裙', 'images/osc1/banshenqun.jpg', '', '', '0', '1534939069', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('58', '45', '短袖', 'images/osc1/dffg.jpg', '', '', '0', '1534993265', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('59', '45', '裤子', 'images/osc1/kuzi.jpg', '', '', '0', '1534939334', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('61', '44', 'Polo衫A', 'images/osc1/polo.jpg', '', '', '0', '1534947481', '1', '0', '0');
INSERT INTO `osc_category` VALUES ('62', '44', '针织衫 ', 'images/osc1/polo11.jpg', '', '', '0', '1534941485', '0', '0', '0');
INSERT INTO `osc_category` VALUES ('63', '45', '连体裤', 'images/osc1/ef.jpg', '', '', '0', '1534945558', '1', '0', '0');
INSERT INTO `osc_category` VALUES ('65', '45', '套装', 'images/osc1/weg.jpg', '', '', '0', '1534989003', '0', '0', '0');

-- ----------------------------
-- Table structure for osc_category_to_attribute
-- ----------------------------
DROP TABLE IF EXISTS `osc_category_to_attribute`;
CREATE TABLE `osc_category_to_attribute` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL DEFAULT '0',
  `attribute_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类和属性关联';

-- ----------------------------
-- Records of osc_category_to_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for osc_category_to_brand
-- ----------------------------
DROP TABLE IF EXISTS `osc_category_to_brand`;
CREATE TABLE `osc_category_to_brand` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL DEFAULT '0',
  `brand_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类品牌关联';

-- ----------------------------
-- Records of osc_category_to_brand
-- ----------------------------

-- ----------------------------
-- Table structure for osc_collection
-- ----------------------------
DROP TABLE IF EXISTS `osc_collection`;
CREATE TABLE `osc_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品的id',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `datetime` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL COMMENT '状态，1为收藏，2为取消收藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Records of osc_collection
-- ----------------------------
INSERT INTO `osc_collection` VALUES ('1', '38', '7', '1534560820', '2');
INSERT INTO `osc_collection` VALUES ('2', '21', '4', '1534567020', '2');
INSERT INTO `osc_collection` VALUES ('3', '24', '4', '1534561959', '2');
INSERT INTO `osc_collection` VALUES ('4', '23', '4', '1534567102', '2');
INSERT INTO `osc_collection` VALUES ('5', '22', '4', '1534564110', '2');
INSERT INTO `osc_collection` VALUES ('6', '12', '4', '1534567007', '2');
INSERT INTO `osc_collection` VALUES ('7', '26', '4', '1534567057', '1');
INSERT INTO `osc_collection` VALUES ('8', '25', '4', '1534567061', '1');
INSERT INTO `osc_collection` VALUES ('9', '24', '5', '1534756425', '1');
INSERT INTO `osc_collection` VALUES ('10', '22', '5', '1534759778', '1');
INSERT INTO `osc_collection` VALUES ('11', '49', '4', '1534940482', '2');
INSERT INTO `osc_collection` VALUES ('12', '65', '7', '1534944396', '1');
INSERT INTO `osc_collection` VALUES ('13', '54', '4', '1534989256', '2');
INSERT INTO `osc_collection` VALUES ('14', '49', '5', '1534945121', '1');
INSERT INTO `osc_collection` VALUES ('15', '16', '4', '1534989262', '2');
INSERT INTO `osc_collection` VALUES ('16', '59', '4', '1534990201', '2');
INSERT INTO `osc_collection` VALUES ('17', '71', '4', '1534989451', '2');
INSERT INTO `osc_collection` VALUES ('18', '55', '4', '1534989220', '1');
INSERT INTO `osc_collection` VALUES ('19', '17', '4', '1534989439', '1');
INSERT INTO `osc_collection` VALUES ('20', '58', '4', '1534989445', '1');
INSERT INTO `osc_collection` VALUES ('21', '69', '4', '1534989468', '1');
INSERT INTO `osc_collection` VALUES ('22', '9', '4', '1534989499', '2');
INSERT INTO `osc_collection` VALUES ('23', '53', '8', '1534990328', '2');
INSERT INTO `osc_collection` VALUES ('24', '55', '7', '1535000941', '1');
INSERT INTO `osc_collection` VALUES ('25', '53', '23', '1535338801', '2');
INSERT INTO `osc_collection` VALUES ('26', '55', '23', '1535338844', '1');

-- ----------------------------
-- Table structure for osc_config
-- ----------------------------
DROP TABLE IF EXISTS `osc_config`;
CREATE TABLE `osc_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) DEFAULT NULL COMMENT '配置名称',
  `value` text COMMENT '配置值',
  `info` varchar(255) DEFAULT NULL COMMENT '描述',
  `module` varchar(40) DEFAULT NULL COMMENT '所属模块',
  `module_name` varchar(40) DEFAULT NULL COMMENT '模块名称',
  `extend_value` varchar(255) DEFAULT NULL COMMENT '扩展值',
  `use_for` varchar(32) DEFAULT NULL COMMENT '用于',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态，1启用，0禁用',
  `sort_order` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_config
-- ----------------------------
INSERT INTO `osc_config` VALUES ('13', 'SITE_TITLE', '昌大昌竞价服务平台', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('14', 'SITE_NAME', '昌大昌竞价服务平台', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('15', 'SITE_DESCRIPTION', '昌大昌竞价服务平台', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('16', 'SITE_KEYWORDS', '昌大昌竞价服务平台', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('17', 'SITE_URL', 'http://pf.dolphintechgz.com', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('19', 'SITE_ICP', '闽ICP备12345678号', 'ICP备案号', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('20', 'EMAIL', '', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('21', 'TELEPHONE', '', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('22', 'WEB_SITE_CLOSE', '0', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('48', 'SITE_SLOGAN', '昌大昌竞价服务平台', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('53', 'SITE_ICON', 'images/osc1/pic3.jpg', '网站图标', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('61', 'qq', '82944930', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('62', 'administrator', 'admin', '超级管理员账号', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('70', 'page_num', '5', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('71', 'SHORT_URL', 'oscshop.cn', '', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('73', 'account', '', '支付宝账号', 'member', '会员', 'alipay', 'payment', '1', '1');
INSERT INTO `osc_config` VALUES ('74', 'key', '', '支付宝key', 'member', '会员', 'alipay', 'payment', '1', '2');
INSERT INTO `osc_config` VALUES ('75', 'partner', '', '合作者身份（partner ID）', 'member', '会员', 'alipay', 'payment', '1', '3');
INSERT INTO `osc_config` VALUES ('76', 'appid', 'wxe4b2d5812c478994 ', 'appid', 'member', '会员', 'weixin', 'payment', '1', '1');
INSERT INTO `osc_config` VALUES ('77', 'token', '', 'token', 'member', '会员', 'weixin', 'payment', '1', '2');
INSERT INTO `osc_config` VALUES ('78', 'appsecret', '8a493ac3fa871d1e6b98e7682b0df6d3', 'appsecret', 'member', '会员', 'weixin', 'payment', '1', '3');
INSERT INTO `osc_config` VALUES ('79', 'encodingaeskey', '', 'encodingaeskey', 'member', '会员', 'weixin', 'payment', '1', '4');
INSERT INTO `osc_config` VALUES ('80', 'weixin_partner', '1511356781', 'partner（商户号）', 'member', '会员', 'weixin', 'payment', '1', '5');
INSERT INTO `osc_config` VALUES ('81', 'partnerkey', 'ZhiSheBaoVaBcBoHfQpNJxOml2SeOYG8', 'partnerkey', 'member', '会员', 'weixin', 'payment', '1', '6');
INSERT INTO `osc_config` VALUES ('82', 'storage_user_action', 'true', '保存用户行为', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('83', 'ck_image_width', '630', 'ck编辑器图片最大宽度', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('84', 'FRONTEND_USER', '网站会员', '前台用户', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('85', 'BACKEND_USER', '后台系统用户', '后台用户', 'common', '网站公共配置', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('86', 'member_login_type', 'cookie', '会员信息记录在(session/cookie)', 'member', '会员', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('87', 'default_group_id', '2', '默认会员组', 'member', '会员', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('88', 'reg_check', '0', '注册审核', 'member', '会员', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('89', 'weight_id', '1', '重量单位', 'member', '会员', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('90', 'length_id', '1', '长度单位', 'member', '会员', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('91', 'default_order_status_id', '3', '默认订单状态 ', 'member', '会员', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('92', 'paid_order_status_id', '1', '订单付款状态', 'member', '会员', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('93', 'complete_order_status_id', '4', '订单完成状态 ', 'member', '会员', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('94', 'cancel_order_status_id', '5', '订单取消状态 ', 'member', '会员', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('105', 'PWD_KEY', 'MF~V45|rI*7L]{SNtA?d:,j1w$<mJ(/f-0g\"83;&', '', '', '', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('106', 'default_transport_id', '1', '移动端默认运费模板', 'mobile', '移动端', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('107', 'cash_num', '500', '提现额度', 'mobile', '移动端', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('108', 'use_captcha', '0', '使用验证码', 'mobile', '移动端', '', '', '1', '0');
INSERT INTO `osc_config` VALUES ('109', 'hot', '', '', '移动端', '热搜关键词', null, null, '1', '0');
INSERT INTO `osc_config` VALUES ('110', 'notice_condition', '&lt;p&gt;1、申请须知&lt;/p&gt;\n\n&lt;p&gt;集团成立：昌大昌集团1996年成立于深圳，是总部设在肇庆的大型连锁零售企业，是2011年5月29日中央电视台曾专题介绍并推广的民族品牌。&lt;/p&gt;\n\n&lt;p&gt;发展规模：昌大昌集团专注大卖场、社区超市、便利店及城市综合体业态，目前已成功在广州、佛山、肇庆、湛江、江门、梅州、阳江、清远、&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;2、申请须知2&lt;/p&gt;\n\n&lt;p&gt;集团成立：昌大昌集团1996年成立于深圳，是总部设在肇庆的大型连锁零售企业，是2011年5月29日中央电视台曾专题介绍并推广的民族品牌。&lt;/p&gt;\n\n&lt;p&gt;发展规模：昌大昌集团专注大卖场、社区超市、便利店及城市综合体业态，目前已成功在广州、佛山、肇庆、湛江、江门、梅州、阳江、清远、&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;3、申请条件3&lt;/p&gt;\n\n&lt;p&gt;集团成立：昌大昌集团1996年成立于深圳，是总部设在肇庆的大型连锁零售企业，是2011年5月29日中央电视台曾专题介绍并推广的民族品牌。&lt;/p&gt;\n\n&lt;p&gt;发展规模：昌大昌集团专注大卖场、社区超市、便利店及城市综合体业态，目前已成功在广州、佛山、肇庆、湛江、江门、梅州、阳江、清远、&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;4、申请条件4&lt;/p&gt;\n\n&lt;p&gt;集团成立：昌大昌集团1996年成立于深圳，是总部设在肇庆的大型连锁零售企业，是2011年5月29日中央电视台曾专题介绍并推广的民族品牌。&lt;/p&gt;\n\n&lt;p&gt;发展规模：昌大昌集团专注大卖场、社区超市、便利店及城市综合体业态，目前已成功在广州、佛山、肇庆、湛江、江门、梅州、阳江、清远、&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;5、申请条件5&lt;/p&gt;\n\n&lt;p&gt;集团成立：昌大昌集团1996年成立于深圳，是总部设在肇庆的大型连锁零售企业，是2011年5月29日中央电视台曾专题介绍并推广的民族品牌。&lt;/p&gt;\n\n&lt;p&gt;发展规模：昌大昌集团专注大卖场、社区超市、便利店及城市综合体业态，目前已成功在广州、佛山、肇庆、湛江、江门、梅州、阳江、清远、&lt;/p&gt;', '', 'common', '首页', null, null, '1', '0');
INSERT INTO `osc_config` VALUES ('111', 'profile', '&lt;p&gt;1、昌大昌集团简介&lt;/p&gt;\n\n&lt;p&gt;集团成立：昌大昌集团1996年成立于深圳，是总部设在肇庆的大型连锁零售企业，是2011年5月29日中央电视台曾专题介绍并推广的民族品牌。&lt;/p&gt;\n\n&lt;p&gt;发展规模：昌大昌集团专注大卖场、社区超市、便利店及城市综合体业态，目前已成功在广州、佛山、肇庆、湛江、江门、梅州、阳江、清远、茂名、云浮地区开设大型连锁超市、趣士多连锁便利店，旗下大型城市综合体项目--台山昌大昌广场，员工超万人。&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;2、集团发展历程&lt;/p&gt;\n\n&lt;p&gt;专注专业：昌大昌集团经过20多年的发展，通过不断的学习创新，开拓市场，坚持诚信至上的经营理念，专注发展连锁超市，精心耕耘，经过不断探索，建立了具有竞争力的采购模式和营运体系，打造出符合地区市场需求的超市业态，为当地顾客提供了物美价廉的商品和舒适的购物享受，成为广东地区具有影响力的民族零售企业。&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;3、集团管理理念&lt;/p&gt;\n\n&lt;p&gt;以人为本：昌大昌集团坚持以人为本的管理理念，重视员工福利，关心员工生活，同时为员工搭建了宽阔的职业平台，在各个专业领域培养了一批专业人才，沉淀了一批同甘共苦的老员工，成为昌大昌最宝贵的财富。&lt;/p&gt;\n\n&lt;p&gt;和谐共赢：在昌大昌集团20年的发展历程中，坚持诚信经营，不仅赢得了广大消费者的信赖与支持，更赢得了一大批风雨相随的合作供货商，伴随着昌大昌稳健的拓展步伐，逐渐发展成为业内实力领先的优质供货商。&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;4、多业态发展&lt;/p&gt;\n\n&lt;p&gt;台山昌大昌广场：昌大昌集团旗下首个城市综合体项目台山昌大昌广场，于2017年10月正式盛大开幕。项目总建筑面积30万平方米，是台山首个集大型购物中心、风情步行街、高尚住宅、甲级写字楼、LOFT公寓和五星级标准酒店于一体的城市综合体。10万平方米购物中心完全自持，力求项目的业态品牌布局满足商业发展的需求。昌大昌广场团队以餐饮、零售、娱乐面积为&amp;quot;1:1:1&amp;quot;的黄金比例对项目业态进行整体布局规划。合作商家包括大地星幕旗舰影院、星巴克、优衣库、大海豚、肯德基、屈臣氏、百丽等国际知名品牌。&lt;/p&gt;\n\n&lt;p&gt;趣士多生活便利超市：2012年6月28日，昌大昌旗下生活便利超市Chain-store趣士多开业，标志着昌大昌正式涉足便利店领域。趣士多品牌采取稳健的发展战略，初期深耕肇庆地区，经过数年发展，已在肇庆发展到20多间直营店、加盟店。&lt;/p&gt;\n\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n\n&lt;p&gt;5、昌大昌超市&lt;/p&gt;\n\n&lt;p&gt;农超对接：昌大昌旗下超市在售商品达到5万种，以&amp;quot;接地气&amp;quot;为经营特色，以&amp;ldquo;天天平价，日日新鲜&amp;rdquo;为经营原则，打造新鲜、平价、健康、便利的百姓超市。采取&amp;quot;农超对接、基地直采&amp;quot;的生鲜经营模式，真正做到&amp;quot;菜篮子&amp;quot;与&amp;quot;菜园子&amp;quot;结合，将节省的中间费用直接让利给顾客。&lt;/p&gt;\n\n&lt;p&gt;资源共享：昌大昌旗下超市整合了各地原生态名优特产及国际一线品牌，给当地消费者带来丰富的购物选择，极大地提升当地市民的生活质量；同时将当地本土特色商品推向全省，惠及全省人民，为门店各地的经济发展做出积极的贡献。&lt;/p&gt;', null, null, null, null, null, '1', '0');

-- ----------------------------
-- Table structure for osc_contact_us
-- ----------------------------
DROP TABLE IF EXISTS `osc_contact_us`;
CREATE TABLE `osc_contact_us` (
  `contact_us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(155) NOT NULL DEFAULT '',
  `phone` char(11) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`contact_us_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_contact_us
-- ----------------------------
INSERT INTO `osc_contact_us` VALUES ('1', '验证某个字段的值是否为有效的URL地址', '13543121642', '56554@qq.com', '1', '1545636302');
INSERT INTO `osc_contact_us` VALUES ('2', '验证某个字段的值是否为有效的URL地址', '13543121642', '56554@qq.com', '1', '1545636337');
INSERT INTO `osc_contact_us` VALUES ('3', '验证某个字段的值是否为有效的URL地址', '13543121642', '56554@qq.com', '1', '1545636340');
INSERT INTO `osc_contact_us` VALUES ('4', '验证某个字段的值是否为有效的URL地址', '13543121642', '56554@qq.com', '1', '1545636342');
INSERT INTO `osc_contact_us` VALUES ('5', '一开始我不信', '13543121642', 'yjccw@china-mart.com.cn', '9', '1546361112');
INSERT INTO `osc_contact_us` VALUES ('6', '一开始我不信', '13543121642', '248441523@qq.com', '9', '1546361136');
INSERT INTO `osc_contact_us` VALUES ('7', '一开始我不信', '13543121642', 'yjccw@china-mart.com.cn', '9', '1546361170');
INSERT INTO `osc_contact_us` VALUES ('8', 'location.reload();', '13543121642', 'yjccw@china-mart.com.cn', '9', '1546361209');
INSERT INTO `osc_contact_us` VALUES ('9', '对于 WordPress ，Drupal， Joomla 到底选哪个这个问题，我不再中立，这可能会伤害到一些朋友的心情，简言之，尽可能的选择 WordPress 与 Drupal，放弃 Joomla 。放弃 Joomla 是自己使用的经验。对于一般的用户来说，WordPress 与 Drupal 是', '13543121642', '248441523@qq.com', '9', '1546756675');

-- ----------------------------
-- Table structure for osc_coupon
-- ----------------------------
DROP TABLE IF EXISTS `osc_coupon`;
CREATE TABLE `osc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type` tinyint(4) NOT NULL COMMENT '优惠类型',
  `coupon_name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `price` decimal(10,2) NOT NULL COMMENT '优惠券金额',
  `remark` varchar(255) NOT NULL COMMENT '优惠券说明',
  `status` tinyint(2) NOT NULL COMMENT '状态，1可使用，0不可使用',
  `limit_num` tinyint(4) NOT NULL COMMENT '没人限领，0表示不限制',
  `numb` int(11) NOT NULL COMMENT '总量',
  `sur_numb` int(11) NOT NULL COMMENT '剩余数量',
  `sort_order` int(11) NOT NULL,
  `rcode` varchar(64) NOT NULL COMMENT '兑换码',
  `shop` varchar(255) NOT NULL,
  `starttime` int(11) NOT NULL COMMENT '开始使用时间',
  `endtime` int(11) NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_coupon
-- ----------------------------
INSERT INTO `osc_coupon` VALUES ('2', '2', '优惠券名称', '5.00', '', '1', '1', '999', '998', '1', 'r2jGQcljyJybCSPlT2wD2sDkJ9iMYFFI', '', '1533484800', '1535731200');
INSERT INTO `osc_coupon` VALUES ('4', '1', '大白鲨22', '0.03', '', '1', '1', '88', '88', '8', 'NB49yMKQm8eTVgrSze4DhgSTNe55oOrT', '10,11,12', '1533484800', '1535644800');
INSERT INTO `osc_coupon` VALUES ('8', '1', '视频推荐位管理', '5.00', '', '1', '1', '3', '2', '1', 'H1KeSgPzNtZ9WWQleZh3kDd9Vc2VX15z', '10,11,12', '1533571200', '1533744000');
INSERT INTO `osc_coupon` VALUES ('9', '2', '大白鲨', '5.00', '', '1', '1', '66', '66', '1', 'BjSB6FlTtR77CBRVQxVx08gdFW7i4WNB', '', '0', '0');

-- ----------------------------
-- Table structure for osc_coupon_send
-- ----------------------------
DROP TABLE IF EXISTS `osc_coupon_send`;
CREATE TABLE `osc_coupon_send` (
  `send_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `type` int(11) NOT NULL COMMENT '优惠券类型',
  `status` tinyint(4) NOT NULL COMMENT '状态,1未使用，2已使用，3已过期',
  `rcode` varchar(64) NOT NULL COMMENT '兑换码',
  `sendtime` int(11) NOT NULL COMMENT '发放时间',
  `usetime` int(11) NOT NULL COMMENT '使用时间',
  PRIMARY KEY (`send_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_coupon_send
-- ----------------------------
INSERT INTO `osc_coupon_send` VALUES ('1', '2', '2', '4', '2', '1', '', '1533484800', '0');
INSERT INTO `osc_coupon_send` VALUES ('2', '3', '0', '4', '1', '2', '', '1533484810', '1533484988');
INSERT INTO `osc_coupon_send` VALUES ('3', '4', '0', '4', '1', '3', '', '1533484989', '0');
INSERT INTO `osc_coupon_send` VALUES ('4', '2', '0', '4', '2', '1', '', '0', '0');
INSERT INTO `osc_coupon_send` VALUES ('5', '2', '0', '5', '2', '3', '', '1533484800', '0');
INSERT INTO `osc_coupon_send` VALUES ('6', '8', '0', '5', '1', '1', '', '1533608662', '0');
INSERT INTO `osc_coupon_send` VALUES ('7', '8', '0', '5', '1', '1', '', '1533608677', '0');
INSERT INTO `osc_coupon_send` VALUES ('8', '8', '0', '5', '1', '1', '', '1533609058', '0');
INSERT INTO `osc_coupon_send` VALUES ('9', '8', '0', '5', '1', '2', '', '1533609136', '0');
INSERT INTO `osc_coupon_send` VALUES ('10', '8', '0', '4', '1', '1', '', '1533611694', '0');
INSERT INTO `osc_coupon_send` VALUES ('11', '8', '0', '4', '1', '1', '', '1533611740', '0');
INSERT INTO `osc_coupon_send` VALUES ('12', '8', '0', '4', '1', '1', '', '1533611854', '0');
INSERT INTO `osc_coupon_send` VALUES ('13', '2', '0', '5', '2', '1', 'r2jGQcljyJybCSPlT2wD2sDkJ9iMYFFI', '1533622124', '0');
INSERT INTO `osc_coupon_send` VALUES ('14', '8', '0', '4', '1', '1', 'H1KeSgPzNtZ9WWQleZh3kDd9Vc2VX15z', '1533623409', '0');

-- ----------------------------
-- Table structure for osc_feedback
-- ----------------------------
DROP TABLE IF EXISTS `osc_feedback`;
CREATE TABLE `osc_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 信息分类 1 功能异常 2 其他',
  `content` varchar(155) NOT NULL DEFAULT '' COMMENT '内容',
  `image` varchar(600) NOT NULL DEFAULT '',
  `phone` char(11) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_reply` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reply_time` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_content` varchar(210) NOT NULL DEFAULT '',
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_feedback
-- ----------------------------
INSERT INTO `osc_feedback` VALUES ('1', '1', '进度条组件使用了 CSS3 的 transition 和 animation 属性来完成一些特效。这些特性在 Internet Explorer 9 或以下版本中、Firefox 的老版本中没有被支持。Opera 12 不支持 animation 属性。', '', '13543121642', '0', '1', '1544758648', '1', '1545101020', '黄河是中国的母亲河', '0');
INSERT INTO `osc_feedback` VALUES ('2', '2', '通过这些简单、灵活的进度条，为当前工作流程或动作提供实时反馈。', '', '13543121643', '0', '4', '1544758648', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('3', '0', '警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险。', '', '13543121644', '0', '2', '1544758648', '1', '1545101201', '警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险。警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险。警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险', '0');
INSERT INTO `osc_feedback` VALUES ('4', '2', '警告框组件通过提供一些灵活的预定义消息，为常见的用户动作提供反馈消息。', '', '13543121645', '0', '3', '1544758648', '1', '1545100922', '黄健是一个仆街', '0');
INSERT INTO `osc_feedback` VALUES ('6', '2', '试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道海棠依旧试问卷帘人却道', '', '', '0', '1', '1545634293', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('7', '0', '11111111111111111', '', '', '0', '9', '1546366677', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('8', '0', 'aaaaaaaaaaaaaa', '', '13543121642', '0', '9', '1546366697', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('9', '0', '大厦', 'a:1:{i:0;s:77:\"/public/uploads/images/feedback/20190102/2897770327563ede8df9c564f81cdea2.png\";}', '13543121642', '0', '9', '1546414013', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('10', '0', '科技大vjj看了；第三方查看看了', 'a:2:{i:0;s:77:\"/public/uploads/images/feedback/20190102/a73d3abc061861d49b01aa67ef78e5aa.png\";i:1;s:77:\"/public/uploads/images/feedback/20190102/c0ee9a7c038ac2e4bc3993ef45fb33b6.png\";}', '13543121642', '0', '9', '1546414049', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('11', '0', '科技大vjj看了；第三方查看看了', 'a:2:{i:0;s:77:\"/public/uploads/images/feedback/20190102/a73d3abc061861d49b01aa67ef78e5aa.png\";i:1;s:77:\"/public/uploads/images/feedback/20190102/c0ee9a7c038ac2e4bc3993ef45fb33b6.png\";}', '13543121642', '0', '9', '1546414067', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('12', '0', '大家快速健康，否定规律来看看了。', 'a:2:{i:0;s:77:\"/public/uploads/images/feedback/20190102/d47c2860ffaad53b434e9132b6884d77.png\";i:1;s:77:\"/public/uploads/images/feedback/20190102/8de45409a101790d809127b72126e00b.png\";}', '13543121642', '0', '9', '1546414097', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('13', '0', '测试五张图片', '', '13543121642', '0', '9', '1546414669', '1', '1546595437', '啊是否长沙', '0');
INSERT INTO `osc_feedback` VALUES ('14', '0', '测试五张图片', 'a:5:{i:0;s:77:\"/public/uploads/images/feedback/20190102/230c529e814e0d910cccff2b959c568f.png\";i:1;s:77:\"/public/uploads/images/feedback/20190102/074a55449aa0c0c3419c2fd7a95a8335.png\";i:2;s:77:\"/public/uploads/images/feedback/20190102/51c346f079dd37610348f7ef58b76487.png\";i:3;s:77:\"/public/uploads/images/feedback/20190102/ff5173b4090faf274dfd7918b6e78819.png\";i:4;s:77:\"/public/uploads/images/feedback/20190102/12cb7a96c9802ed72fd6bc4905c8a42e.png\";}', '13543121642', '0', '9', '1546414779', '1', '1546595354', '侧睡', '0');
INSERT INTO `osc_feedback` VALUES ('15', '0', '对于 WordPress ，Drupal， Joomla 到底选哪个这个问题，我不再中立，这可能会伤害到一些朋友的心情，简言之，尽可能的选择 WordPress 与 Drupal，放弃 Joomla 。放弃 Joomla 是自己使用的经验', '', '13543121642', '0', '9', '1546761654', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('16', '0', '在当时，第一次接触到像 Joomla 这样的系统，对比国内的软件， Joomla 的管理界面简直太棒了，并且它的功能也让我感到震惊，居然能在后台直接安装扩展，这在当时前所未见，还能指定模块的显示位置，还有显示的页面，特兴奋', 'a:1:{i:0;s:77:\"/public/uploads/images/feedback/20190106/c267f872fde13634098ec33d31556be8.gif\";}', '13543121642', '0', '9', '1546765374', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('17', '0', '在当时，第一次接触到像 Joomla 这样的系统，对比国内的软件， Joomla 的管理界面简直太棒了，并且它的功能也让我感到震惊，居然能在后台直接安装扩展，这在当时前所未见，还能指定模块的显示位置，还有显示的页面，特兴奋', 'a:2:{i:0;s:77:\"/public/uploads/images/feedback/20190106/bf4ee028fe879342f85457f50d25a4a4.gif\";i:1;s:77:\"/public/uploads/images/feedback/20190106/e723dce0893ac537fa9521a15653f687.gif\";}', '18027259825', '0', '9', '1546765404', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('18', '0', '在当时，第一次接触到像 Joomla 这样的系统，对比国内的软件， Joomla 的管理界面简直太棒了，并且它的功能也让我感到震惊，居然能在后台直接安装扩展，这在当时前所未见，还能指定模块的显示位置，还有显示的页面，特兴奋', 'a:1:{i:0;s:77:\"/public/uploads/images/feedback/20190106/9055bc5b2bd85daa6aae20deb9da1b78.png\";}', '13543121642', '0', '9', '1546765427', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('19', '0', '在当时，第一次接触到像 Joomla 这样的系统，对比国内的软件， Joomla 的管理界面简直太棒了，并且它的功能也让我感到震惊，居然能在后台直接安装扩展，这在当时前所未见，还能指定模块的显示位置，还有显示的页面，特兴奋', 'a:5:{i:0;s:77:\"/public/uploads/images/feedback/20190106/6427d8560cfe545d6af1ef6b5a7ac31b.jpg\";i:1;s:77:\"/public/uploads/images/feedback/20190106/3b40d8da5cfc2287ba559ba59e51d986.gif\";i:2;s:77:\"/public/uploads/images/feedback/20190106/2b9eb144e940380473247bfb58e2dfa7.gif\";i:3;s:77:\"/public/uploads/images/feedback/20190106/c5cfcfd5dcdca8cd20e451e373cc7ab3.png\";i:4;s:77:\"/public/uploads/images/feedback/20190106/4de0fe457dc114fde012488b784a2338.jpg\";}', '13543121642', '0', '9', '1546765461', '0', '0', '', '0');
INSERT INTO `osc_feedback` VALUES ('20', '0', '在当时，第一次接触到像 Joomla 这样的系统，对比国内的软件， Joomla 的管理界面简直太棒了，并且它的功能也让我感到震惊，居然能在后台直接安装扩展，这在当时前所未见，还能指定模块的显示位置，还有显示的页面，特兴奋', 'a:2:{i:0;s:77:\"/public/uploads/images/feedback/20190106/fad24985caff3db73e71abd08ba15aec.png\";i:1;s:77:\"/public/uploads/images/feedback/20190106/79bda5b0abddaa5d6e8d165045a67a7c.jpg\";}', '13543121642', '0', '9', '1546765487', '0', '0', '', '0');

-- ----------------------------
-- Table structure for osc_goods
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods`;
CREATE TABLE `osc_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `model` varchar(40) DEFAULT NULL COMMENT '商品型号',
  `sku` varchar(40) DEFAULT NULL COMMENT '库存单元',
  `location` varchar(20) DEFAULT NULL COMMENT '产品所在地',
  `quantity` int(4) NOT NULL DEFAULT '0' COMMENT '商品数目',
  `sale_count` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `stock_status_id` int(11) NOT NULL DEFAULT '0' COMMENT '库存状态编号（关联stock_status主键）',
  `image` varchar(64) DEFAULT NULL,
  `brand_id` int(11) NOT NULL DEFAULT '0' COMMENT '品牌编号（关联brand主键）',
  `shipping` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要运送',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `points` int(8) NOT NULL DEFAULT '0' COMMENT '积分',
  `pay_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `is_points_goods` int(5) NOT NULL DEFAULT '0' COMMENT '是否是积分兑换商品',
  `date_available` int(11) NOT NULL DEFAULT '0' COMMENT '供货日期',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '重量',
  `weight_class_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '重量编号（关联weight_class主键）',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` smallint(5) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否扣除库存',
  `minimum` int(11) NOT NULL DEFAULT '1' COMMENT '最小起订数目',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` varchar(40) DEFAULT NULL COMMENT '加入时间',
  `date_modified` varchar(40) DEFAULT NULL COMMENT '修改的时间',
  `viewed` int(5) NOT NULL DEFAULT '0' COMMENT '点击量',
  `marvellous` tinyint(2) DEFAULT '1' COMMENT '精彩推荐',
  `hot` tinyint(2) DEFAULT '1' COMMENT '热门使用',
  `works` tinyint(2) DEFAULT '1' COMMENT '名师作品',
  `bluetooth_id` int(11) NOT NULL COMMENT '蓝牙id',
  `description` text NOT NULL COMMENT '详情',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of osc_goods
-- ----------------------------
INSERT INTO `osc_goods` VALUES ('1', '长裤', 'D2016031002', '件', '德化', '1000', '0', '0', 'images/osc1/hjju.jpg', '0', '0', '0.00', '50', '5000', '1', '0', '200.00000000', '2', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '11', '1', '2016-08-17 22:55:16', '0000-00-00 00:00:00', '32', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082257531005-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252102519-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248995550-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082256545797-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('5', '针织衫', 'D20151107', '套', '德化', '486', '0', '0', 'images/osc1/jhgd.jpg', '0', '1', '0.00', '50', '5000', '1', '0', '200.00000000', '2', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '5', '1', '2016-08-19 20:57:05', '0000-00-00 00:00:00', '58', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082257971015-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251100994-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299575551-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253541005-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210250100-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('6', '半身裙A', 'D20151107', '个', '德化', '500', '0', '0', 'images/osc1/oiu.jpg', '0', '1', '0.00', '50', '5000', '1', '0', '100.00000000', '2', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '6', '1', '2016-08-19 21:12:02', '0000-00-00 00:00:00', '25', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082256991005-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082250525655-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210052981-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253571005-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('7', '连衣裙', 'D20151107', '个', '德化', '200', '0', '0', 'images/osc1/uyt.jpg', '0', '1', '0.00', '50', '5000', '1', '0', '200.00000000', '2', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '7', '1', '2016-08-19 21:29:39', '0000-00-00 00:00:00', '0', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251534852-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299555554-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253521025-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210152102-630x780.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('9', '短袖A', 'D20151107', '套', '德化', '500', '0', '0', 'images/osc1/TB2dMKtG7CWBuNjy0FaXXXUlXXa_!!2228361831.jpg', '0', '1', '0.00', '50', '3000', '1', '0', '2.00000000', '1', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '9', '1', '2016-08-19 22:00:25', '0000-00-00 00:00:00', '1', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253505110-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248571025-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210052100-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255535451-630x780.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('10', '卫衣B', 'D20151107', '套', '德化', '1000', '0', '0', 'images/osc1/yyyyt.jpg', '0', '1', '0.00', '50', '5000', '1', '0', '2.00000000', '1', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '10', '1', '2016-08-19 22:08:17', '0000-00-00 00:00:00', '2', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248100519-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082256985648-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082250995149-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082298100515-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('11', '卫衣A', 'D20151107', '套', '德化', '498', '0', '0', 'images/osc1/wwwe.jpg', '0', '1', '0.00', '50', '5000', '1', '0', '2.00000000', '1', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '11', '1', '2016-08-19 22:15:27', '0000-00-00 00:00:00', '9', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253555398-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251505357-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082298975057-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252565298-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299515510-630x780.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('12', '短裤A', 'D20151107', '套', '德化', '497', '0', '0', 'images/osc1/kl.jpg', '0', '1', '0.00', '50', '5000', '1', '0', '2.00000000', '1', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '12', '1', '2016-08-19 22:24:54', '0000-00-00 00:00:00', '14', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082257541001-630x435.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251975751-630x435.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082257485049-630x976.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253515054-630x960.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('13', '长裤A', 'D20151107', '套', '德化', '0', '0', '0', 'images/osc1/hgf.jpg', '0', '1', '168.00', '50', '5000', '1', '0', '2.00000000', '1', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '12', '1', '2018-08-01 11:13:50', null, '0', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248529951-630x960.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082257101571-630x960.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253971009-630x976.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210256511-630x960.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210297975-630x960.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('16', '长袖A', 'D20151107', '套', '德化', '0', '0', '0', 'images/osc1/weu.jpg', '0', '1', '168.00', '50', '5000', '1', '0', '2.00000000', '1', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '12', '1', '2018-08-01 11:25:09', null, '0', null, null, null, '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255101519-630x867.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082297545356-630x867.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253999952-630x867.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210297565-630x867.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('17', 'T恤A', 'D20151107', '套', '德化', '0', '0', '0', 'images/osc1/IMG_0993.jpg', '0', '1', '168.00', '50', '5000', '1', '0', '2.00000000', '1', '20.00000000', '20.00000000', '20.00000000', '1', '1', '1', '12', '1', '2018-08-01 11:25:09', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251509810-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299101555-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255559852-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082250481015-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082298985355-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082257565299-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('49', '夹克A', '', '', '', '0', '0', '0', 'images/osc1/IMG_1093.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 18:44:52', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082257565149-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082254495151-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252555152-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299101545-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082298999752-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253555157-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('50', '外套A', '', '', '', '0', '0', '0', 'images/osc1/IMG_0063.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:23:58', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082297495349-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082298974810-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082256545298-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248100504-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210051554-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253561015-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('51', '针织衫A', '', '', '', '0', '0', '0', 'images/osc1/oxs.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:39:30', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082250571029-630x677.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299485749-630x677.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252100101-630x789.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210057101-630x821.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('52', 'POLO衫', '', '', '', '0', '0', '0', 'images/osc1/ouy.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:40:44', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248485510-630x1008.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082256541015-630x1008.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082254551021-630x1008.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('53', '夹克B', '', '', '', '0', '0', '0', 'images/osc1/judh.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:44:17', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248995555-630x1062.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082256579998-630x921.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252535757-630x874.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299102485-630x1196.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('54', '毛呢', '', '', '', '0', '0', '0', 'images/osc1/kjhd.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:47:02', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255985151-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251974954-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210149564-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210297569-630x780.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('55', '牛仔外套', '', '', '', '0', '0', '0', 'images/osc1/hhjkjc.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:48:51', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082256971011-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248545053-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082256565455-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210210248-630x780.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('56', 'T恤B', '', '', '', '0', '0', '0', 'images/osc1/IMG_0694.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:50:39', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350501001-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397529910-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082349985555-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('57', 'T恤C', '', '', '', '0', '0', '0', 'images/osc1/bcga.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:52:23', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253981009-630x534.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299535054-630x534.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255100100-630x534.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082250989798-630x534.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('58', 'T恤D', '', '', '', '0', '0', '0', 'images/osc1/bvg.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:55:24', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255575198-630x1008.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251985051-630x1008.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299534951-630x1008.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253551015-630x1008.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('59', '长袖b', '', '', '', '0', '0', '0', 'images/osc1/knb.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 20:58:19', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255525154-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248575748-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082297491011-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082254535351-630x780.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('60', '长袖c', '', '', '', '0', '0', '0', 'images/osc1/kmh.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:02:06', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082298575210-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082298481009-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251102499-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299515097-630x780.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('61', '裤子A', '', '', '', '0', '0', '0', 'images/osc1/kl.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:10:13', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299994998-630x976.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251555048-630x435.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299521025-630x435.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210148525-630x960.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('62', '裤子B', '', '', '', '0', '0', '0', 'images/osc1/kkki.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:12:30', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255525010-630x976.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252985010-630x960.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210057100-630x960.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255100504-630x960.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('63', '卫衣C', '', '', '', '0', '0', '0', 'images/osc1/yk.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:15:45', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251575410-630x680.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299551025-630x561.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252485755-630x680.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299531014-630x680.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('64', '卫衣D', '', '', '', '0', '0', '0', 'images/osc1/ypo.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:20:07', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210048102-630x527.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255489751-630x535.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210155102-630x535.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255531001-630x535.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('65', 'poloB', '', '', '', '0', '0', '0', 'images/osc1/yiuo.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:24:40', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251545510-630x737.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299565453-630x737.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252521025-630x737.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('66', 'POLO衫C', '', '', '', '0', '0', '0', 'images/osc1/yui.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:27:25', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299484810-630x1008.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252489710-630x1008.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082299971005-630x1008.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('67', '针织衫B', '', '', '', '0', '0', '0', 'images/osc1/yt.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:29:41', null, '0', '1', '1', '1', '2', '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082250485248-630x901.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082297534956-630x901.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082249101101-630x901.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248495598-630x316.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('68', '针织衫C', '', '', '', '0', '0', '0', 'images/osc1/yw.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:32:00', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210151505-630x976.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082254515656-630x960.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210110098-630x961.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082297519810-630x960.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('69', '卫衣E', '', '', '', '0', '0', '0', 'images/osc1/y12.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:35:15', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082252100529-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082298100501-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082250485510-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210248579-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('70', '卫衣F', '', '', '', '0', '0', '0', 'images/osc1/yyy.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:37:08', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251549854-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082297579899-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082251544954-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082298101529-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('71', '连衣裙A', '', '', '', '0', '0', '0', 'images/osc1/IMG_0374_1.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-22 21:54:12', null, '1', '1', '1', '1', '4', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210157504-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253495053-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082248505057-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082255525110-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210110251-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082254981021-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210256102-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210155101-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082253991025-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180822/2018082210249100-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('72', '牛仔裤', '', '', '', '0', '0', '0', 'images/osc1/IMG_0863.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 09:16:23', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310149101-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082353100549-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348565155-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397565054-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082354569952-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082349525299-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082356575755-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('73', '旗袍', '', '', '', '0', '0', '0', 'images/osc1/201808170539.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 09:20:29', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310249571-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082355985255-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082349495010-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397579956-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082353564997-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350515250-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082357491011-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('74', '连体裤', '', '', '', '100', '0', '0', 'images/osc1/IMG_0668.jpg', '0', '1', '0.10', '0', '0', '0', '0', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '0', '1', '2018-08-23 09:28:09', null, '16', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350994857-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398565452-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082351495598-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398484851-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('75', '套装A', '', '', '', '0', '0', '0', 'images/osc1/IMG_0080_3.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 09:56:38', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082399995648-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082399100549-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082354555698-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348579850-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397551029-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082353529948-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082355565351-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350975699-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082399505555-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082353995497-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310298991-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082356545310-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('76', '套装B', '', '', '', '0', '0', '1', 'images/osc1/IMG_0089_1.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.10000000', '0', '0.10000000', '0.10000000', '1.00000000', '0', '1', '1', '0', '1', '2018-08-23 10:01:17', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082399495710-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082352971025-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310056495-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082354555051-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348575756-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397100579-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348504856-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082399495510-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082353999710-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082355494856-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082353501001-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350565250-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('77', '套装c', '', '', '', '0', '0', '0', 'images/osc1/IMG_0372_1.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 10:07:20', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082349485597-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398485198-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350545557-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397569910-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082354515698-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082349575152-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('78', '西装外套', '', '', '', '0', '0', '0', 'images/osc1/IMG_0216.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 10:23:17', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398481015-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082352579856-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082399499750-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310151545-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310053555-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397485798-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082354515750-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('79', '皮衣外套', '', '', '', '0', '0', '0', 'images/osc1/piyi.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 10:32:17', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397515199-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082349565697-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082356102495-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082357505498-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('80', '牛仔外套', '', '', '', '0', '0', '0', 'images/osc1/5 (3).jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 10:37:16', null, '0', '1', '1', '1', '2', '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082349529752-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398100569-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082356495199-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310257515-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('81', '针织D', '', '', '', '0', '0', '0', 'images/osc1/a.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 10:43:53', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398495453-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350975253-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082357994910-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348989750-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('82', '针织衫E', '', '', '', '0', '0', '0', 'images/osc1/wwwww.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 10:48:09', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082353504852-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348525252-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082355505298-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350971004-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('83', '半身裙B', '', '', '', '0', '0', '0', 'images/osc1/1/1 (2).jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 10:52:32', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082355525056-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310252539-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082356975599-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348101102-630x780.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('84', '半身裙C', '', '', '', '0', '0', '0', 'images/osc1/2 (2).jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 10:57:02', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082355545610-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348489849-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082357549810-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350495457-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('85', '短袖B', '', '', '', '0', '0', '0', 'images/osc1/DSC00643.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 11:00:36', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398565010-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082355100561-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('86', '短袖C', '', '', '', '0', '0', '0', 'images/osc1/DSC00877B.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 11:08:59', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310151489-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397505455-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082354565154-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('87', '牛仔短裤', '', '', '', '0', '0', '0', 'images/osc1/6 (4).jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 11:12:44', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348545755-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397525152-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350519753-630x780.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082357525597-630x780.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('88', '长裤C', '', '', '', '0', '0', '0', 'images/osc1/4 (5).jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 11:16:22', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398515097-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082353525351-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310097505-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082355539857-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348985498-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('89', '紧身裤', '', '', '', '0', '0', '0', 'images/osc1/3 (4).jpg', '0', '1', '18.90', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 11:21:10', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350545498-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398975754-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082351485456-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310110051-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('90', '连体裤A', '', '', '', '0', '0', '0', 'images/osc1/O1CN011POde9tdZOa4Jh6_!!2228361831.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 11:24:41', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082349525348-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310250985-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082398484954-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082352494855-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('91', '连体裤B', '', '', '', '0', '0', '0', 'images/osc1/O1CN011POde7oJLHdAGbC_!!2228361831.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 11:31:12', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082354100100-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348519710-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082355579857-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082310251525-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');
INSERT INTO `osc_goods` VALUES ('92', '连体裤C', '', '', '', '0', '0', '0', 'images/osc1/O1CN011POde9tdZOa4Jh6_!!2228361831.jpg', '0', '1', '0.00', '0', '0', '0', '0', '0.00000000', '0', '0.00000000', '0.00000000', '0.00000000', '0', '1', '1', '0', '1', '2018-08-23 11:34:11', null, '0', '1', '1', '1', '2', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082350491024-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082397521021-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082348995610-630x945.jpg&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;http://pt.dolphintechgz.com/public/uploads/cache/images/ckeditor/20180823/2018082356495698-630x945.jpg&quot; /&gt;&lt;/p&gt;\r\n');

-- ----------------------------
-- Table structure for osc_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_attribute`;
CREATE TABLE `osc_goods_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `attribute_value_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性(标签)';

-- ----------------------------
-- Records of osc_goods_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for osc_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_brand`;
CREATE TABLE `osc_goods_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品品牌';

-- ----------------------------
-- Records of osc_goods_brand
-- ----------------------------

-- ----------------------------
-- Table structure for osc_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_category`;
CREATE TABLE `osc_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `bluetooth_id` int(11) NOT NULL COMMENT '蓝牙协议id',
  `name` varchar(64) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_goods_category
-- ----------------------------
INSERT INTO `osc_goods_category` VALUES ('1', '29', '0', '分类名称2', 'images/osc1/bingxiang.png', '3');
INSERT INTO `osc_goods_category` VALUES ('2', '29', '0', '分类名称', 'images/osc1/10/1.jpg', '2');
INSERT INTO `osc_goods_category` VALUES ('4', '30', '0', '名1', 'images/osc1/1/1.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('5', '30', '0', '名2', 'images/osc1/11/1.jpg', '1');
INSERT INTO `osc_goods_category` VALUES ('6', '30', '0', '名3', 'images/osc1/6/1.jpg', '2');
INSERT INTO `osc_goods_category` VALUES ('7', '31', '0', '名1', 'images/osc1/1/1.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('8', '32', '0', '名1详情', 'images/osc1/1/1.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('9', '33', '0', '名称1', 'images/osc1/1/2.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('10', '33', '0', '名称2222', 'images/osc1/1/1.jpg', '1');
INSERT INTO `osc_goods_category` VALUES ('11', '34', '0', '测试名称1', 'images/osc1/6/2.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('12', '34', '0', '测试名称2', 'images/osc1/bingxiang/1.jpg', '1');
INSERT INTO `osc_goods_category` VALUES ('13', '34', '0', '测试名称3', 'images/osc1/8/1.jpg', '10');
INSERT INTO `osc_goods_category` VALUES ('14', '34', '0', '分类4', 'images/osc1/nvbao/38683e02315fe3f9a4a8e47df31ddfa2.jpg', '12');
INSERT INTO `osc_goods_category` VALUES ('16', '34', '0', '嘿嘿', 'images/osc1/nvbao/434bcb90f3466e7926b40b031a541916.jpg', '20');
INSERT INTO `osc_goods_category` VALUES ('17', '35', '3', '分类女衣服绑定', 'images/osc1/nvbao/64eb74bcb72c28c294e01e4186ddd5e6.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('18', '36', '4', '', 'images/osc1/1/1.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('19', '37', '3', '分类1', 'images/osc1/10/3.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('20', '36', '5', '测试蓝牙', 'images/osc1/nvbao/6b453b506b38c31def9949d8e9bb1886.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('21', '38', '3', '分类1', 'images/osc1/6/1.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('22', '38', '5', '分类2', 'images/osc1/6/3.jpg', '1');
INSERT INTO `osc_goods_category` VALUES ('23', '38', '4', '分类3', 'images/osc1/6/m02.jpg', '2');
INSERT INTO `osc_goods_category` VALUES ('24', '38', '3', '分类4', 'images/osc1/6/m03.jpg', '10');
INSERT INTO `osc_goods_category` VALUES ('25', '37', '3', '分类2', 'images/osc1/10/m01.jpg', '0');
INSERT INTO `osc_goods_category` VALUES ('26', '37', '5', '分类3', 'images/osc1/11/1.jpg', '0');

-- ----------------------------
-- Table structure for osc_goods_category_image
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_category_image`;
CREATE TABLE `osc_goods_category_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_category_id` int(11) NOT NULL COMMENT '商品分类id',
  `image` varchar(255) NOT NULL,
  `sort_order` int(10) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_goods_category_image
-- ----------------------------
INSERT INTO `osc_goods_category_image` VALUES ('1', '1', 'images/osc1/1/2.jpg', '0', '名1-详情1');
INSERT INTO `osc_goods_category_image` VALUES ('2', '9', 'images/osc1/1/4.jpg', '1', '名称1详情');
INSERT INTO `osc_goods_category_image` VALUES ('3', '9', 'images/osc1/1/1.jpg', '0', '名称1详情');
INSERT INTO `osc_goods_category_image` VALUES ('4', '11', 'images/osc1/6/3.jpg', '2', '测试名称1_详情3');
INSERT INTO `osc_goods_category_image` VALUES ('5', '11', 'images/osc1/6/m01.jpg', '1', '测试名称1_详情2');
INSERT INTO `osc_goods_category_image` VALUES ('6', '11', 'images/osc1/6/m02.jpg', '0', '测试名称1_详情1');
INSERT INTO `osc_goods_category_image` VALUES ('7', '12', 'images/osc1/bingxiang/3.jpg', '9', '测试名称2_详情4');
INSERT INTO `osc_goods_category_image` VALUES ('8', '12', 'images/osc1/bingxiang/5.jpg', '8', '测试名称2_详情3');
INSERT INTO `osc_goods_category_image` VALUES ('9', '12', 'images/osc1/bingxiang/3.jpg', '4', '测试名称2_详情1');
INSERT INTO `osc_goods_category_image` VALUES ('10', '12', 'images/osc1/bingxiang/2.jpg', '3', '测试名称2_详情2');
INSERT INTO `osc_goods_category_image` VALUES ('12', '13', 'images/osc1/8/m04.jpg', '5', '测试名称3_详情2');
INSERT INTO `osc_goods_category_image` VALUES ('13', '16', 'images/osc1/1/2.jpg', '20', '嘿嘿--详情');
INSERT INTO `osc_goods_category_image` VALUES ('15', '24', 'images/osc1/1/5.jpg', '0', '分类4---详情3');
INSERT INTO `osc_goods_category_image` VALUES ('16', '24', 'images/osc1/1/1.jpg', '0', '分类4---详情2');
INSERT INTO `osc_goods_category_image` VALUES ('17', '24', 'images/osc1/1/4.jpg', '0', '分类4---详情1');
INSERT INTO `osc_goods_category_image` VALUES ('18', '23', 'images/osc1/7/1.jpg', '0', '分类3-详情1');
INSERT INTO `osc_goods_category_image` VALUES ('19', '23', 'images/osc1/7/3.jpg', '0', '分类3-详情2');
INSERT INTO `osc_goods_category_image` VALUES ('20', '22', 'images/osc1/9/1.jpg', '0', '分类2--详情1');
INSERT INTO `osc_goods_category_image` VALUES ('21', '22', 'images/osc1/9/2.jpg', '0', '分类2--详情2');
INSERT INTO `osc_goods_category_image` VALUES ('22', '21', 'images/osc1/bingxiang/1.jpg', '0', '分类1--详情1');
INSERT INTO `osc_goods_category_image` VALUES ('23', '21', 'images/osc1/bingxiang/2.jpg', '0', '分类1--详情2');
INSERT INTO `osc_goods_category_image` VALUES ('24', '26', 'images/osc1/11/5.jpg', '0', '分类3--详情3');
INSERT INTO `osc_goods_category_image` VALUES ('25', '26', 'images/osc1/11/4.jpg', '0', '分类3--详情2');
INSERT INTO `osc_goods_category_image` VALUES ('26', '26', 'images/osc1/11/2.jpg', '0', '分类3--详情1');
INSERT INTO `osc_goods_category_image` VALUES ('27', '25', 'images/osc1/12/3.jpg', '0', '分类2--详情2');
INSERT INTO `osc_goods_category_image` VALUES ('28', '25', 'images/osc1/12/2.jpg', '0', '分类2--详情1');
INSERT INTO `osc_goods_category_image` VALUES ('29', '19', 'images/osc1/2/9.jpg', '0', '分类1--详情5');
INSERT INTO `osc_goods_category_image` VALUES ('30', '19', 'images/osc1/2/8.jpg', '0', '分类1--详情3');
INSERT INTO `osc_goods_category_image` VALUES ('31', '19', 'images/osc1/2/7.jpg', '0', '分类1--详情2');
INSERT INTO `osc_goods_category_image` VALUES ('32', '19', 'images/osc1/2/3.jpg', '0', '分类1--详情4');
INSERT INTO `osc_goods_category_image` VALUES ('33', '19', 'images/osc1/2/1.jpg', '0', '分类1--详情1');

-- ----------------------------
-- Table structure for osc_goods_description
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_description`;
CREATE TABLE `osc_goods_description` (
  `goods_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `summary` varchar(255) DEFAULT NULL COMMENT '产品简介',
  `description` text COMMENT '商品详情',
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_description_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='产品信息描述表';

-- ----------------------------
-- Records of osc_goods_description
-- ----------------------------
INSERT INTO `osc_goods_description` VALUES ('1', '1', '艺创 青花甜白三才大盖碗功夫茶具敬茶陶瓷泡茶器', '', '艺创 青花甜白三才大盖碗功夫茶具敬茶陶瓷泡茶器', '艺创 青花甜白三才大盖碗功夫茶具敬茶陶瓷泡茶器');
INSERT INTO `osc_goods_description` VALUES ('5', '5', '旅行茶具套装便携式功夫茶具 车载 户外 手绘茶具', '', '旅行茶具套装便携式功夫茶具 车载 户外 手绘茶具', '旅行茶具套装便携式功夫茶具 车载 户外 手绘茶具');
INSERT INTO `osc_goods_description` VALUES ('6', '6', '艺创 品茗杯陶瓷功夫茶具 定窑白荷花大号茶个人主人杯', '', '艺创 品茗杯陶瓷功夫茶具 定窑白荷花大号茶个人主人杯', '艺创 品茗杯陶瓷功夫茶具 定窑白荷花大号茶个人主人杯');
INSERT INTO `osc_goods_description` VALUES ('7', '7', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', '', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧');
INSERT INTO `osc_goods_description` VALUES ('9', '9', '艺创 定窑白瓷手绘胭红整套功夫茶具陶瓷 盖碗 茶杯套组', '', '艺创 定窑白瓷手绘胭红整套功夫茶具陶瓷 盖碗 茶杯套组', '艺创 定窑白瓷手绘胭红整套功夫茶具陶瓷 盖碗 茶杯套组');
INSERT INTO `osc_goods_description` VALUES ('10', '10', '艺创 定窑白瓷手绘山水整套功夫茶具 盖碗 茶杯套组', '', '艺创 定窑白瓷手绘山水整套功夫茶具 盖碗 茶杯套组', '艺创 定窑白瓷手绘山水整套功夫茶具 盖碗 茶杯套组');
INSERT INTO `osc_goods_description` VALUES ('11', '11', '艺创 手工制作粗陶柴烧整套功夫木柄茶具 陶瓷 侧把 壶承礼盒', '', '艺创 手工制作粗陶柴烧整套功夫木柄茶具 陶瓷 侧把 壶承礼盒', '艺创 手工制作粗陶柴烧整套功夫木柄茶具 陶瓷 侧把 壶承礼盒');
INSERT INTO `osc_goods_description` VALUES ('12', '12', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒', '', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒');
INSERT INTO `osc_goods_description` VALUES ('13', '13', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒', '', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒');
INSERT INTO `osc_goods_description` VALUES ('16', '16', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒', '', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒');
INSERT INTO `osc_goods_description` VALUES ('17', '17', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒', '', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒', '艺创 青花白瓷手绘荷花整套功夫茶具陶瓷 盖碗 茶杯创意礼盒');
INSERT INTO `osc_goods_description` VALUES ('47', '49', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('48', '50', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('49', '51', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('50', '52', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('51', '53', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('52', '54', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('53', '55', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('54', '56', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('55', '57', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('56', '58', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('57', '59', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('58', '60', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('59', '61', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('60', '62', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('61', '63', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('62', '64', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('63', '65', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('64', '66', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('65', '67', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('66', '68', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('67', '69', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('68', '70', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('69', '71', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('70', '72', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('71', '73', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('72', '74', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('73', '75', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('74', '76', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('75', '77', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('76', '78', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('77', '79', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('78', '80', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('79', '81', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('80', '82', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('81', '83', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('82', '84', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('83', '85', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('84', '86', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('85', '87', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('86', '88', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('87', '89', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('88', '90', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('89', '91', '', '', '', '');
INSERT INTO `osc_goods_description` VALUES ('90', '92', '', '', '', '');

-- ----------------------------
-- Table structure for osc_goods_discount
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_discount`;
CREATE TABLE `osc_goods_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(4) NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='数量折扣';

-- ----------------------------
-- Records of osc_goods_discount
-- ----------------------------
INSERT INTO `osc_goods_discount` VALUES ('1', '12', '2', '0.20');
INSERT INTO `osc_goods_discount` VALUES ('2', '13', '2', '0.20');
INSERT INTO `osc_goods_discount` VALUES ('5', '16', '2', '0.20');
INSERT INTO `osc_goods_discount` VALUES ('6', '17', '2', '0.20');

-- ----------------------------
-- Table structure for osc_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_image`;
CREATE TABLE `osc_goods_image` (
  `goods_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- ----------------------------
-- Records of osc_goods_image
-- ----------------------------
INSERT INTO `osc_goods_image` VALUES ('1', '1', 'images/osc1/1/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('2', '1', 'images/osc1/1/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('3', '1', 'images/osc1/1/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('4', '1', 'images/osc1/1/4.jpg', '3');
INSERT INTO `osc_goods_image` VALUES ('5', '1', 'images/osc1/1/5.jpg', '4');
INSERT INTO `osc_goods_image` VALUES ('22', '5', 'images/osc1/5/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('23', '5', 'images/osc1/5/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('24', '5', 'images/osc1/5/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('25', '6', 'images/osc1/6/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('26', '6', 'images/osc1/6/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('27', '6', 'images/osc1/6/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('28', '7', 'images/osc1/7/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('29', '7', 'images/osc1/7/3.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('30', '7', 'images/osc1/7/4.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('31', '7', 'images/osc1/7/2.jpg', '3');
INSERT INTO `osc_goods_image` VALUES ('34', '9', 'images/osc1/9/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('35', '9', 'images/osc1/9/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('36', '9', 'images/osc1/9/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('37', '9', 'images/osc1/9/4.jpg', '3');
INSERT INTO `osc_goods_image` VALUES ('38', '9', 'images/osc1/9/6.jpg', '4');
INSERT INTO `osc_goods_image` VALUES ('39', '9', 'images/osc1/9/7.jpg', '5');
INSERT INTO `osc_goods_image` VALUES ('40', '9', 'images/osc1/9/8.jpg', '6');
INSERT INTO `osc_goods_image` VALUES ('41', '10', 'images/osc1/10/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('42', '10', 'images/osc1/10/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('43', '10', 'images/osc1/10/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('44', '11', 'images/osc1/11/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('45', '11', 'images/osc1/11/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('46', '11', 'images/osc1/11/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('47', '11', 'images/osc1/11/4.jpg', '3');
INSERT INTO `osc_goods_image` VALUES ('48', '11', 'images/osc1/11/5.jpg', '4');
INSERT INTO `osc_goods_image` VALUES ('49', '12', 'images/osc1/12/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('50', '12', 'images/osc1/12/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('51', '12', 'images/osc1/12/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('52', '12', 'images/osc1/12/4.jpg', '3');
INSERT INTO `osc_goods_image` VALUES ('53', '12', 'images/osc1/12/5.jpg', '4');
INSERT INTO `osc_goods_image` VALUES ('54', '12', 'images/osc1/bingxiang.png', '5');
INSERT INTO `osc_goods_image` VALUES ('55', '13', 'images/osc1/12/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('56', '13', 'images/osc1/12/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('57', '13', 'images/osc1/12/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('58', '13', 'images/osc1/12/4.jpg', '3');
INSERT INTO `osc_goods_image` VALUES ('59', '13', 'images/osc1/12/5.jpg', '4');
INSERT INTO `osc_goods_image` VALUES ('60', '13', 'images/osc1/bingxiang.png', '5');
INSERT INTO `osc_goods_image` VALUES ('73', '16', 'images/osc1/12/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('74', '16', 'images/osc1/12/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('75', '16', 'images/osc1/12/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('76', '16', 'images/osc1/12/4.jpg', '3');
INSERT INTO `osc_goods_image` VALUES ('77', '16', 'images/osc1/12/5.jpg', '4');
INSERT INTO `osc_goods_image` VALUES ('78', '16', 'images/osc1/bingxiang.png', '5');
INSERT INTO `osc_goods_image` VALUES ('79', '17', 'images/osc1/12/1.jpg', '0');
INSERT INTO `osc_goods_image` VALUES ('80', '17', 'images/osc1/12/2.jpg', '1');
INSERT INTO `osc_goods_image` VALUES ('81', '17', 'images/osc1/12/3.jpg', '2');
INSERT INTO `osc_goods_image` VALUES ('82', '17', 'images/osc1/12/4.jpg', '3');
INSERT INTO `osc_goods_image` VALUES ('83', '17', 'images/osc1/12/5.jpg', '4');
INSERT INTO `osc_goods_image` VALUES ('84', '17', 'images/osc1/bingxiang.png', '5');

-- ----------------------------
-- Table structure for osc_goods_mobile_description_image
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_mobile_description_image`;
CREATE TABLE `osc_goods_mobile_description_image` (
  `mdi_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL COMMENT '原图',
  `description` varchar(255) DEFAULT NULL,
  `sort_order` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mdi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COMMENT='手机商品描述图片';

-- ----------------------------
-- Records of osc_goods_mobile_description_image
-- ----------------------------
INSERT INTO `osc_goods_mobile_description_image` VALUES ('1', '1', 'images/osc1/1/d1.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('2', '1', 'images/osc1/1/d2.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('3', '1', 'images/osc1/1/d3.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('4', '1', 'images/osc1/1/d4.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('5', '1', 'images/osc1/1/d5.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('6', '1', 'images/osc1/1/d6.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('7', '1', 'images/osc1/1/d7.jpg', '', '6');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('40', '5', 'images/osc1/5/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('41', '5', 'images/osc1/5/m02.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('42', '5', 'images/osc1/5/m03.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('43', '5', 'images/osc1/5/m04.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('44', '5', 'images/osc1/5/m05.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('45', '6', 'images/osc1/6/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('46', '6', 'images/osc1/6/m02.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('47', '6', 'images/osc1/6/m03.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('48', '6', 'images/osc1/6/m04.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('49', '6', 'images/osc1/6/m05.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('50', '7', 'images/osc1/7/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('51', '7', 'images/osc1/7/m02.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('52', '7', 'images/osc1/7/m03.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('53', '7', 'images/osc1/7/m04.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('54', '7', 'images/osc1/7/m05.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('55', '7', 'images/osc1/7/m06.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('61', '9', 'images/osc1/9/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('62', '9', 'images/osc1/9/m02.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('63', '9', 'images/osc1/9/m03.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('64', '9', 'images/osc1/9/m04.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('65', '9', 'images/osc1/9/m05.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('66', '9', 'images/osc1/9/m06.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('67', '9', 'images/osc1/9/m07.jpg', '', '6');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('68', '9', 'images/osc1/9/m08.jpg', '', '7');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('69', '9', 'images/osc1/9/m09.jpg', '', '8');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('70', '9', 'images/osc1/9/m10.jpg', '', '9');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('71', '9', 'images/osc1/9/m11.jpg', '', '10');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('72', '9', 'images/osc1/9/m12.jpg', '', '11');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('73', '9', 'images/osc1/9/m13.jpg', '', '12');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('74', '9', 'images/osc1/9/m14.jpg', '', '13');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('75', '10', 'images/osc1/10/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('76', '10', 'images/osc1/10/m02.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('77', '10', 'images/osc1/10/m03.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('78', '10', 'images/osc1/10/m04.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('79', '10', 'images/osc1/10/m05.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('80', '10', 'images/osc1/10/m06.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('81', '10', 'images/osc1/10/m07.jpg', '', '6');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('82', '10', 'images/osc1/10/m08.jpg', '', '7');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('83', '10', 'images/osc1/10/m09.jpg', '', '8');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('84', '10', 'images/osc1/10/m10.jpg', '', '9');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('85', '10', 'images/osc1/10/m11.jpg', '', '10');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('86', '11', 'images/osc1/11/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('87', '11', 'images/osc1/11/m02.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('88', '11', 'images/osc1/11/m03.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('89', '11', 'images/osc1/11/m04.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('90', '11', 'images/osc1/11/m05.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('91', '11', 'images/osc1/11/m07.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('92', '11', 'images/osc1/11/m08.jpg', '', '6');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('93', '11', 'images/osc1/11/m09.jpg', '', '7');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('94', '11', 'images/osc1/11/m10.jpg', '', '8');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('95', '11', 'images/osc1/11/m11.jpg', '', '9');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('96', '11', 'images/osc1/11/m12.jpg', '', '10');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('97', '11', 'images/osc1/11/m6.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('98', '12', 'images/osc1/12/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('99', '12', 'images/osc1/12/m02.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('100', '12', 'images/osc1/12/m03.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('101', '12', 'images/osc1/12/m04.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('102', '12', 'images/osc1/12/m05.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('103', '12', 'images/osc1/12/m06.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('104', '12', 'images/osc1/12/m07.jpg', '', '6');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('105', '12', 'images/osc1/12/m08.jpg', '', '7');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('106', '12', 'images/osc1/12/m09.jpg', '', '8');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('107', '12', 'images/osc1/12/m10.jpg', '', '9');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('108', '12', 'images/osc1/12/m11.jpg', '', '10');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('109', '12', 'images/osc1/12/m12.jpg', '', '11');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('110', '12', 'images/osc1/12/m13.jpg', '', '12');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('111', '13', 'images/osc1/12/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('112', '13', 'images/osc1/12/m02.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('113', '13', 'images/osc1/12/m03.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('114', '13', 'images/osc1/12/m04.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('115', '13', 'images/osc1/12/m05.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('116', '13', 'images/osc1/12/m06.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('117', '13', 'images/osc1/12/m07.jpg', '', '6');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('118', '13', 'images/osc1/12/m08.jpg', '', '7');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('119', '13', 'images/osc1/12/m09.jpg', '', '8');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('120', '13', 'images/osc1/12/m10.jpg', '', '9');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('121', '13', 'images/osc1/12/m11.jpg', '', '10');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('122', '13', 'images/osc1/12/m12.jpg', '', '11');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('123', '13', 'images/osc1/12/m13.jpg', '', '12');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('150', '16', 'images/osc1/12/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('151', '16', 'images/osc1/12/m02.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('152', '16', 'images/osc1/12/m03.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('153', '16', 'images/osc1/12/m04.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('154', '16', 'images/osc1/12/m05.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('155', '16', 'images/osc1/12/m06.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('156', '16', 'images/osc1/12/m07.jpg', '', '6');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('157', '16', 'images/osc1/12/m08.jpg', '', '7');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('158', '16', 'images/osc1/12/m09.jpg', '', '8');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('159', '16', 'images/osc1/12/m10.jpg', '', '9');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('160', '16', 'images/osc1/12/m11.jpg', '', '10');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('161', '16', 'images/osc1/12/m12.jpg', '', '11');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('162', '16', 'images/osc1/12/m13.jpg', '', '12');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('163', '17', 'images/osc1/12/m01.jpg', '', '0');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('164', '17', 'images/osc1/12/m02.jpg', '', '1');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('165', '17', 'images/osc1/12/m03.jpg', '', '2');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('166', '17', 'images/osc1/12/m04.jpg', '', '3');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('167', '17', 'images/osc1/12/m05.jpg', '', '4');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('168', '17', 'images/osc1/12/m06.jpg', '', '5');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('169', '17', 'images/osc1/12/m07.jpg', '', '6');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('170', '17', 'images/osc1/12/m08.jpg', '', '7');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('171', '17', 'images/osc1/12/m09.jpg', '', '8');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('172', '17', 'images/osc1/12/m10.jpg', '', '9');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('173', '17', 'images/osc1/12/m11.jpg', '', '10');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('174', '17', 'images/osc1/12/m12.jpg', '', '11');
INSERT INTO `osc_goods_mobile_description_image` VALUES ('175', '17', 'images/osc1/12/m13.jpg', '', '12');

-- ----------------------------
-- Table structure for osc_goods_option
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_option`;
CREATE TABLE `osc_goods_option` (
  `goods_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(64) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_goods_option
-- ----------------------------

-- ----------------------------
-- Table structure for osc_goods_option_value
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_option_value`;
CREATE TABLE `osc_goods_option_value` (
  `goods_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_option_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `option_value_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(3) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `price_prefix` varchar(1) DEFAULT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_prefix` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`goods_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_goods_option_value
-- ----------------------------

-- ----------------------------
-- Table structure for osc_goods_to_category
-- ----------------------------
DROP TABLE IF EXISTS `osc_goods_to_category`;
CREATE TABLE `osc_goods_to_category` (
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品对应分类表';

-- ----------------------------
-- Records of osc_goods_to_category
-- ----------------------------
INSERT INTO `osc_goods_to_category` VALUES ('1', '59');
INSERT INTO `osc_goods_to_category` VALUES ('5', '54');
INSERT INTO `osc_goods_to_category` VALUES ('6', '57');
INSERT INTO `osc_goods_to_category` VALUES ('7', '53');
INSERT INTO `osc_goods_to_category` VALUES ('9', '58');
INSERT INTO `osc_goods_to_category` VALUES ('10', '52');
INSERT INTO `osc_goods_to_category` VALUES ('11', '55');
INSERT INTO `osc_goods_to_category` VALUES ('12', '0');
INSERT INTO `osc_goods_to_category` VALUES ('13', '50');
INSERT INTO `osc_goods_to_category` VALUES ('16', '48');
INSERT INTO `osc_goods_to_category` VALUES ('17', '47');
INSERT INTO `osc_goods_to_category` VALUES ('49', '46');
INSERT INTO `osc_goods_to_category` VALUES ('50', '0');
INSERT INTO `osc_goods_to_category` VALUES ('51', '0');
INSERT INTO `osc_goods_to_category` VALUES ('52', '61');
INSERT INTO `osc_goods_to_category` VALUES ('53', '46');
INSERT INTO `osc_goods_to_category` VALUES ('54', '46');
INSERT INTO `osc_goods_to_category` VALUES ('55', '46');
INSERT INTO `osc_goods_to_category` VALUES ('56', '47');
INSERT INTO `osc_goods_to_category` VALUES ('57', '47');
INSERT INTO `osc_goods_to_category` VALUES ('58', '47');
INSERT INTO `osc_goods_to_category` VALUES ('59', '48');
INSERT INTO `osc_goods_to_category` VALUES ('60', '48');
INSERT INTO `osc_goods_to_category` VALUES ('61', '50');
INSERT INTO `osc_goods_to_category` VALUES ('62', '50');
INSERT INTO `osc_goods_to_category` VALUES ('63', '55');
INSERT INTO `osc_goods_to_category` VALUES ('64', '55');
INSERT INTO `osc_goods_to_category` VALUES ('65', '61');
INSERT INTO `osc_goods_to_category` VALUES ('66', '61');
INSERT INTO `osc_goods_to_category` VALUES ('67', '62');
INSERT INTO `osc_goods_to_category` VALUES ('68', '62');
INSERT INTO `osc_goods_to_category` VALUES ('69', '52');
INSERT INTO `osc_goods_to_category` VALUES ('70', '52');
INSERT INTO `osc_goods_to_category` VALUES ('71', '53');
INSERT INTO `osc_goods_to_category` VALUES ('72', '50');
INSERT INTO `osc_goods_to_category` VALUES ('73', '53');
INSERT INTO `osc_goods_to_category` VALUES ('74', '63');
INSERT INTO `osc_goods_to_category` VALUES ('75', '65');
INSERT INTO `osc_goods_to_category` VALUES ('76', '65');
INSERT INTO `osc_goods_to_category` VALUES ('77', '65');
INSERT INTO `osc_goods_to_category` VALUES ('78', '56');
INSERT INTO `osc_goods_to_category` VALUES ('79', '56');
INSERT INTO `osc_goods_to_category` VALUES ('80', '56');
INSERT INTO `osc_goods_to_category` VALUES ('81', '54');
INSERT INTO `osc_goods_to_category` VALUES ('82', '54');
INSERT INTO `osc_goods_to_category` VALUES ('83', '57');
INSERT INTO `osc_goods_to_category` VALUES ('84', '57');
INSERT INTO `osc_goods_to_category` VALUES ('85', '58');
INSERT INTO `osc_goods_to_category` VALUES ('86', '58');
INSERT INTO `osc_goods_to_category` VALUES ('87', '59');
INSERT INTO `osc_goods_to_category` VALUES ('88', '59');
INSERT INTO `osc_goods_to_category` VALUES ('89', '59');
INSERT INTO `osc_goods_to_category` VALUES ('90', '0');
INSERT INTO `osc_goods_to_category` VALUES ('91', '63');
INSERT INTO `osc_goods_to_category` VALUES ('92', '63');

-- ----------------------------
-- Table structure for osc_helper
-- ----------------------------
DROP TABLE IF EXISTS `osc_helper`;
CREATE TABLE `osc_helper` (
  `help_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` text,
  `dateline` datetime DEFAULT NULL,
  `sort_order` tinyint(2) DEFAULT NULL,
  `image` varchar(255) NOT NULL COMMENT '封面图',
  PRIMARY KEY (`help_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_helper
-- ----------------------------
INSERT INTO `osc_helper` VALUES ('2', '标题2', 'admin1', '简介1', '&lt;p&gt;，个人可以收过桥费吗？什么桥可以自己占为己有，一起来看具体报道！&lt;/p&gt;\r\n\r\n&lt;p&gt;2018年8月17日讯，英国夫妇Maggie Taylor 和Grahame Penny在六年前买下了一座桥，名为&amp;ldquo;Whitney-on-Wye&amp;rdquo;，位于赫里福郡，是英国8座私人可以收费的桥梁之一。这对夫妻之所以能把这座桥占为己有，要感谢一个古老的国会法案。1797年，英国国会制订了一项法案，使得这座桥可以被私人买下然后收费。由于这座桥位于蒙默思郡和海依村之间，其间有著名的旅游区金谷，游客众多，所以收入十分可观，每年可以收益10万英镑。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;巴黎恐袭嫌犯宣判&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;中新网4月23日电 据外媒报道，当地时间23日，比利时一家法院对2015年巴黎恐袭案嫌犯萨拉赫&amp;middot;阿卜杜勒-萨拉姆作出判决。法院判决其犯有恐怖主义相关的企图谋杀罪名成立。他是这起系列恐袭案中最后一名活着的嫌疑人。&lt;/p&gt;\r\n\r\n&lt;p&gt;在2月的审判中，检察官控诉萨拉赫以及其共同被告阿亚里犯有恐怖主义相关的企图谋杀和拥有遭禁武器等罪名，如果罪名成立，他最高将被判处20年监禁。&lt;/p&gt;\r\n\r\n&lt;p&gt;2015年11月13日，法国巴黎发生恐怖袭击，造成130人死亡。制造这起袭击的十余名恐怖分子大多来自比利时，他们中仅萨拉赫存活。萨拉赫在犯案后逃回布鲁塞尔，2016年3月18日，他在比利时首都布鲁塞尔莫伦贝克区被捕。&lt;/p&gt;\r\n\r\n&lt;p&gt;法国检方怀疑，现年27岁的萨拉赫至少负责巴黎恐袭行动的后勤保障，如租用恐怖分子在巴黎落脚的公寓和发动袭击的车辆。&lt;/p&gt;\r\n', '2018-08-18 02:31:23', '21', 'images/osc1/1/2.jpg');
INSERT INTO `osc_helper` VALUES ('3', '标题2', 'admin2', '', '&lt;p&gt;，个人可以收过桥费吗？什么桥可以自己占为己有，一起来看具体报道！&lt;/p&gt;\r\n\r\n&lt;p&gt;2018年8月17日讯，英国夫妇Maggie Taylor 和Grahame Penny在六年前买下了一座桥，名为&amp;ldquo;Whitney-on-Wye&amp;rdquo;，位于赫里福郡，是英国8座私人可以收费的桥梁之一。这对夫妻之所以能把这座桥占为己有，要感谢一个古老的国会法案。1797年，英国国会制订了一项法案，使得这座桥可以被私人买下然后收费。由于这座桥位于蒙默思郡和海依村之间，其间有著名的旅游区金谷，游客众多，所以收入十分可观，每年可以收益10万英镑。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;巴黎恐袭嫌犯宣判&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;中新网4月23日电 据外媒报道，当地时间23日，比利时一家法院对2015年巴黎恐袭案嫌犯萨拉赫&amp;middot;阿卜杜勒-萨拉姆作出判决。法院判决其犯有恐怖主义相关的企图谋杀罪名成立。他是这起系列恐袭案中最后一名活着的嫌疑人。&lt;/p&gt;\r\n\r\n&lt;p&gt;在2月的审判中，检察官控诉萨拉赫以及其共同被告阿亚里犯有恐怖主义相关的企图谋杀和拥有遭禁武器等罪名，如果罪名成立，他最高将被判处20年监禁。&lt;/p&gt;\r\n\r\n&lt;p&gt;2015年11月13日，法国巴黎发生恐怖袭击，造成130人死亡。制造这起袭击的十余名恐怖分子大多来自比利时，他们中仅萨拉赫存活。萨拉赫在犯案后逃回布鲁塞尔，2016年3月18日，他在比利时首都布鲁塞尔莫伦贝克区被捕。&lt;/p&gt;\r\n\r\n&lt;p&gt;法国检方怀疑，现年27岁的萨拉赫至少负责巴黎恐袭行动的后勤保障，如租用恐怖分子在巴黎落脚的公寓和发动袭击的车辆。&lt;/p&gt;\r\n', '2018-08-18 02:32:19', '2', 'images/osc1/1/5.jpg');

-- ----------------------------
-- Table structure for osc_length_class
-- ----------------------------
DROP TABLE IF EXISTS `osc_length_class`;
CREATE TABLE `osc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `title` varchar(32) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='长度单位';

-- ----------------------------
-- Records of osc_length_class
-- ----------------------------
INSERT INTO `osc_length_class` VALUES ('1', '100.00000000', '厘米', 'cm');
INSERT INTO `osc_length_class` VALUES ('2', '1000.00000000', '毫米', 'mm');
INSERT INTO `osc_length_class` VALUES ('3', '0.01100000', '千米', 'km');

-- ----------------------------
-- Table structure for osc_member
-- ----------------------------
DROP TABLE IF EXISTS `osc_member`;
CREATE TABLE `osc_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reg_type` varchar(20) DEFAULT NULL,
  `wechat_openid` varchar(128) DEFAULT NULL,
  `username` char(20) DEFAULT NULL COMMENT '用户名',
  `password` char(128) DEFAULT NULL COMMENT '密码',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `address_id` int(8) NOT NULL DEFAULT '0',
  `nickname` char(20) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) NOT NULL DEFAULT '0',
  `userpic` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `is_agent` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否是代理商',
  `pid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '上级id',
  `agent_level` mediumint(8) NOT NULL DEFAULT '0' COMMENT '代理级别',
  `total_bonus` decimal(9,3) NOT NULL DEFAULT '0.000' COMMENT '代理商奖金',
  `points` mediumint(8) NOT NULL DEFAULT '0' COMMENT '积分',
  `cash_points` mediumint(8) NOT NULL DEFAULT '0' COMMENT '已经兑换积分',
  `wish` smallint(5) NOT NULL DEFAULT '0' COMMENT '收藏的数量',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `regip` char(15) DEFAULT NULL COMMENT '注册ip',
  `lastip` char(15) DEFAULT NULL COMMENT '上次登录ip',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `email` char(32) DEFAULT NULL COMMENT '电子邮箱',
  `telephone` varchar(20) DEFAULT NULL,
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '地区id',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有短消息',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `city` varchar(64) DEFAULT NULL,
  `language` varchar(64) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  `level` tinyint(4) DEFAULT '0' COMMENT '用户等级（0默认）',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '账户余额',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of osc_member
-- ----------------------------
INSERT INTO `osc_member` VALUES ('3', '0', null, 'obHUf5WDUC0AMvsbVvtc0yJqHsP0', null, null, '1', '0', '呼延灼', '0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL2JDCLUlC2znL8SC2fHOuKG4rwcjoWAIbHVeuiaBaAjf9mFhWFotFgB0Xz9TicJfPwhL7tB4lJIM0g/132', '0', '0', '0', '0.000', '0', '0', '0', '1537337981', '1537338045', '223.166.222.110', '223.166.222.110', '5', null, null, '2', '0', '0', '0', '', 'zh_CN', '', '0', '0.00');
INSERT INTO `osc_member` VALUES ('4', '0', null, 'obHUf5TvUM5teN04WCL6SYWKKCJg', null, null, '1', '0', '武松', '0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJM6ibmIw3FMvDfCYanCrvgoqGDwmeTvzyfwc5pLPWwjK2Ovs3B4jlELEZkMTTnGKZKJxVYy60K2icg/132', '0', '0', '0', '0.000', '0', '0', '0', '1537339511', '1537339566', '101.227.139.164', '101.227.139.164', '6', null, null, '2', '0', '0', '0', '', 'zh_CN', '', '0', '0.00');
INSERT INTO `osc_member` VALUES ('5', '0', null, 'obHUf5YRRJQG7qPUR5YmeaJ8tkr0', null, null, '1', '0', 'Saitama', '0', 'https://wx.qlogo.cn/mmopen/vi_32/EeIFAUp15R5MWqOibjGppl4IMiaUoYS0nRckqdTaNOuKJ47TpVN2OVhbqgXwicrUXdb0IZHVkMrUlLiag7AttuBmkQ/132', '0', '0', '0', '0.000', '0', '0', '0', '1537346887', '1537347217', '113.67.156.253', '113.67.156.253', '2', null, null, '2', '0', '0', '0', '', 'zh_CN', '', '0', '0.00');
INSERT INTO `osc_member` VALUES ('6', '0', null, 'obHUf5fLu8JNLLrnKdH06DxhRJd0', null, null, '1', '0', '小海豚科技广州有限公司', '0', 'https://wx.qlogo.cn/mmopen/vi_32/awo9e6qy7bBwYExy1rhMNe5IH3eI4WLRRqdW2OIs50ibSLjZCxiaRVWtymcK3gBicUIHnsY5EbQ1QhW0ib9xtm2faA/132', '0', '0', '0', '0.000', '0', '0', '0', '1537347032', '1537347172', '113.67.156.253', '113.67.156.253', '2', null, null, '2', '0', '0', '0', '', 'zh_CN', '', '0', '0.00');
INSERT INTO `osc_member` VALUES ('21', '0', null, 'obHUf5RMDH00ohgfR53mNVu0xkPA', null, null, '1', '0', '夏梦¥浅醉', '1', 'https://wx.qlogo.cn/mmopen/vi_32/HePqQDGbZJS4icRLGoxgtegvTG19wfic6zVTDb6mUgpAX3aBRTrLXF6hibIiaDbEJHxLLYlThLIeF8qKwpcwupX6vw/132', '0', '0', '0', '0.000', '0', '0', '0', '1537348507', '1540882740', '113.67.156.253', '117.136.79.35', '38', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('22', '0', null, 'obHUf5cj_AWiYizIn1CoOECrQMLA', null, null, '1', '0', '张旭东', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJUhTSEugheSTw05ZgfJ2wjBnAwzjW79E0SWmesrAZJtnCZfujplxZt8nibyXOtyx2Tw17ficIuVQzw/132', '0', '0', '0', '0.000', '0', '0', '0', '1537348612', '1539679646', '113.67.156.253', '58.62.93.213', '14', null, null, '2', '0', '0', '0', '周口', 'zh_CN', '河南', '0', '0.00');
INSERT INTO `osc_member` VALUES ('23', '0', null, 'obHUf5fizwuaM-DYJ8-MmeyCFKcE', null, null, '1', '0', '阿寶er-', '2', 'https://wx.qlogo.cn/mmopen/vi_32/U8aQekn60v6Eg06v18DRgWDktzTMW266Z6URlN2LeFrRgwjUTBYquicPMB6k5YfoicFCVmTLnWYhrrRNzlRKficKw/132', '0', '0', '0', '0.000', '0', '0', '0', '1537348665', '1537348665', '117.136.41.63', '117.136.41.63', '1', null, null, '2', '0', '0', '0', '', 'zh_CN', '马累', '0', '0.00');
INSERT INTO `osc_member` VALUES ('24', '0', null, 'obHUf5afeq25c6JJ3ZCu-vYRJiqA', null, null, '1', '0', '李世鹏', '1', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erp3Rna4GB6eLZDvCNqSbLxZbibccyPK5AhxLGPhdK4ur1nuaQ6FwK0AsvSzq7BmWXg1dzQB1ePTRQ/132', '0', '0', '0', '0.000', '0', '0', '0', '1537353409', '1541125659', '112.96.198.186', '58.62.53.58', '24', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('25', '0', null, 'obHUf5XplVXTbSI3AIOuDDaWw1U4', null, null, '1', '0', '范华', '1', 'https://wx.qlogo.cn/mmopen/vi_32/BoBCJW2fvaZXsyZJRUHGogJKvm3miaBO5WebVmUzibPwqmBKIovdLeoGLliaW0ciaicjBs7Eq8s6QNTlueHqIXrSQng/132', '0', '0', '0', '0.000', '0', '0', '0', '1537354243', '1540878960', '183.40.222.50', '119.129.51.230', '33', null, null, '2', '0', '0', '0', '', 'zh_CN', '', '0', '0.00');
INSERT INTO `osc_member` VALUES ('26', '0', null, 'obHUf5cGnk02Uzg9RWtCGZq_BczA', null, null, '1', '0', '南江河', '1', 'https://wx.qlogo.cn/mmopen/vi_32/C7TOORx7kpWBibHbom0dSibxzCnecbHGroDBN7GS6UgTQ6Sch8mbLOkEicvczoGpJNg0dPkrBpXibcoZprtuScuGZg/132', '0', '0', '0', '0.000', '0', '0', '0', '1537512037', '1539494548', '119.129.52.37', '117.136.40.134', '2', null, null, '2', '0', '0', '0', '清远', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('27', '0', null, 'obHUf5XzLoyofP0n0dL0e5Yh_VNk', null, null, '1', '0', '___冬天', '1', 'https://wx.qlogo.cn/mmopen/vi_32/dicYnIuz436fDBYnAUWPBLujV7RmlxTic3PVxeDn69mwrRdXj5N9LIfZRBJql5x7MQ2buDeeoxPcwkw1JpVKy3hQ/132', '0', '0', '0', '0.000', '0', '0', '0', '1537512245', '1541042677', '119.129.52.37', '119.129.51.154', '21', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('28', '0', null, 'obHUf5aVGTulsaRAc1UDOdbwawmI', null, null, '1', '0', 'Takako_M', '2', 'https://wx.qlogo.cn/mmopen/vi_32/J9ODOOJaYZaGVMxicpp2YyGybaWOD5iaEIO2UfufsCM1NjMuoJjibia5Z0PLkB1x6ZS3roRxia2K33lyLRvPJOjPVTw/132', '0', '0', '0', '0.000', '0', '0', '0', '1537853844', '1538114018', '119.129.51.2', '119.129.52.141', '5', null, null, '2', '0', '0', '0', 'Ashiya-shi', 'zh_CN', 'Hyogo-ken', '0', '0.00');
INSERT INTO `osc_member` VALUES ('29', '0', null, 'obHUf5aDuONjS_LgnxLYfomOR2to', null, null, '1', '0', null, '0', null, '0', '0', '0', '0.000', '0', '0', '0', '1539158567', '1539158567', '117.136.79.8', '117.136.79.8', '1', null, null, '2', '0', '0', '0', null, null, null, '0', '0.00');
INSERT INTO `osc_member` VALUES ('30', '0', null, 'obHUf5aDuONjS_LgnxLYfomOR2to', null, null, '1', '0', '吴昊Oscar', '1', 'https://wx.qlogo.cn/mmopen/vi_32/kQZuFXmKSU04CwFKqgwWnVFY4UNO0vQcHle7fNO6THfIVUm0DcbteqiaibP42pKR4A2gQDSHzbkiaVr4dlVxQJFQQ/132', '0', '0', '0', '0.000', '0', '0', '0', '1539158567', '1539158567', '117.136.79.8', '117.136.79.8', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('31', '0', null, 'obHUf5TAhw001KfBSsUaQQBDG6pI', null, null, '1', '0', '澄静之水', '1', 'https://wx.qlogo.cn/mmopen/vi_32/yvZwnuVYOB3LUpKCo1XCrRNWDO8lxlURlSAV2HJqH7iblkwx6jYIM6G6KDDeMRYDfibur2dh3yt2D2PZBzEW7rVg/132', '0', '0', '0', '0.000', '0', '0', '0', '1539236991', '1540631404', '113.119.164.77', '119.129.50.121', '4', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('32', '0', null, 'obHUf5efbjkqraghTP3bqNL-dg6E', null, null, '1', '0', '玄同', '0', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epqbGy6cciaA4O7Fwq4WmO1Owjzsoj4ghVY0hH4SaCWjdiatFSsC9VFs0VDQtVp2yBexKA87rtzztXw/132', '0', '0', '0', '0.000', '0', '0', '0', '1539595652', '1539595652', '117.136.40.131', '117.136.40.131', '1', null, null, '2', '0', '0', '0', '', 'zh_CN', '', '0', '0.00');
INSERT INTO `osc_member` VALUES ('33', '0', null, 'obHUf5cKyHpuq7VJyQl5dHDURKgQ', null, null, '1', '0', '林冲', '0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLEBvhAvhzoUokaNwCTcAiaXmMlEdLPTXKiaTttPdejhuDjwny8JgRiaO9HNKbd55aLx4ib6mDALBF90g/132', '0', '0', '0', '0.000', '0', '0', '0', '1539662437', '1539662437', '58.247.206.147', '58.247.206.147', '1', null, null, '2', '0', '0', '0', '', 'zh_CN', '', '0', '0.00');
INSERT INTO `osc_member` VALUES ('34', '0', null, 'obHUf5UCJ1UqNp8JLHuq5NqjlErQ', null, null, '1', '0', '廷', '1', 'https://wx.qlogo.cn/mmopen/vi_32/jj8GWibf6Rf1Ch0365QL4vtlSXtqY9ic1wicFNk6FB8ZGaEEvtCw51qBqo5iaicmx2bqTribuXGoNXerzuzkt3RXGfag/132', '0', '0', '0', '0.000', '0', '0', '0', '1540008202', '1540108646', '119.129.52.226', '117.136.40.153', '2', null, null, '2', '0', '0', '0', '佛山', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('35', '0', null, 'obHUf5b-yp-br0af95pQDUp7bIxs', null, null, '1', '0', '李不白', '1', 'https://wx.qlogo.cn/mmopen/vi_32/2UCQEQtXpkar9xpJeKHznjG7wiac4wADiaX0mPcr2yvIRQatuO8DnzvULPjwMXibnXGyFwOuVg8P56ibS7N60boWjw/132', '0', '0', '0', '0.000', '0', '0', '0', '1540011148', '1540011148', '112.96.176.180', '112.96.176.180', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('36', '0', null, 'obHUf5bUdbT3oMGydqqcIrFEOdZ4', null, null, '1', '0', 'Benny李炳华', '1', 'https://wx.qlogo.cn/mmopen/vi_32/8ymP8iaWtqQLfNzYlr0WvbGoXoP3g06oQC6UmGfgzDNCky3NobicEwF64VhTzBVyfvEiclrA2LfjAYjJdhe4SPovA/132', '0', '0', '0', '0.000', '0', '0', '0', '1540017919', '1541003236', '117.136.79.45', '59.41.116.252', '3', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('37', '0', null, 'obHUf5dsS2vCW7M6uTSQDMaZ1T3s', null, null, '1', '0', '黄文斌', '1', 'https://wx.qlogo.cn/mmopen/vi_32/gCNuz3QuaiaNZgqzSaKMljmLjpG9ak1qWpWegcT4pB4S0HUUZXQGVKujPp93byewMNv9xeg77klgEOXJgkcZawg/132', '0', '0', '0', '0.000', '0', '0', '0', '1540018246', '1540018246', '218.20.35.191', '218.20.35.191', '1', null, null, '2', '0', '0', '0', '河源', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('38', '0', null, 'obHUf5UwF1HLaL4PrGLg9P-aXBhU', null, null, '1', '0', '王烟云（五行策划创始人）', '1', 'https://wx.qlogo.cn/mmopen/vi_32/UdhP5EFBibO9AIyRoNNqyTU6vLhmbMM1RYiayicdXoicUZdyLQZjvoo56yANfw3LoPjChiaFe2JVY3p1lL8VibzKTebA/132', '0', '0', '0', '0.000', '0', '0', '0', '1540111646', '1540887212', '119.129.52.226', '119.129.51.230', '12', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('39', '0', null, 'obHUf5aUIliouT7PTQKcJYb76o98', null, null, '1', '0', '德克恩DECN 老胡', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ2bGfpyP7kFObkYbPtfovEsVJIWyvZAxhB9T0cQOfXiambnqeKyiad9QzRVVPYdpqY2bnajmms92sQ/132', '0', '0', '0', '0.000', '0', '0', '0', '1540172589', '1540172589', '115.197.109.64', '115.197.109.64', '1', null, null, '2', '0', '0', '0', '杭州', 'zh_CN', '浙江', '0', '0.00');
INSERT INTO `osc_member` VALUES ('40', '0', null, 'obHUf5YeudgJFRNvLfWU77CPDomA', null, null, '1', '0', '魂？…', '1', 'https://wx.qlogo.cn/mmopen/vi_32/EFFmWI6kOKhhsVmBrtYo1ts5FDh4icYxPVT9IjEY5ceArqJiaSrCd32eaiaRYicyNnzYK9q0iciaNY1MVP7lp5FOpbbg/132', '0', '0', '0', '0.000', '0', '0', '0', '1540196069', '1540883526', '119.129.50.151', '119.129.51.230', '2', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('41', '0', null, 'obHUf5fUaT_WJOKl4DiMrsGj1DNY', null, null, '1', '0', '肖泊龙', '1', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epBFG5CpuM000fIQTkt5ndmUruncU7bwqicYoKpzWQL2FBBUVNYoibNqqzd9wZ5lVukvsvYwEV8JXdA/132', '0', '0', '0', '0.000', '0', '0', '0', '1540204410', '1540204410', '27.47.7.237', '27.47.7.237', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('42', '0', null, 'obHUf5YQVs5Y6n7fj79vobzKC1x4', null, null, '1', '0', '陈虹博', '2', 'https://wx.qlogo.cn/mmopen/vi_32/X2iaDd0JeXhOuZgibazbchibARibmMoO9PbuyH08GFBkmorA4hHfMORbdGXr1r91zZdWTqOLX9Ks3eWF6Y1PfoyJ9w/132', '0', '0', '0', '0.000', '0', '0', '0', '1540204430', '1540204430', '117.136.40.164', '117.136.40.164', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('43', '0', null, 'obHUf5a7N13WwAVcO2OgE2yNNfpo', null, null, '1', '0', '龙国福', '1', 'https://wx.qlogo.cn/mmopen/vi_32/2l2thYmmF6FwxcmGSlHvdEGNcv0T3qhfF5Qv6Bfee0j16sI7cNosX6ftVl1GqiavKFxYX0pL5l5I1o6T8u7ianuA/132', '0', '0', '0', '0.000', '0', '0', '0', '1540298059', '1540298059', '112.96.109.94', '112.96.109.94', '1', null, null, '2', '0', '0', '0', '', 'zh_CN', '', '0', '0.00');
INSERT INTO `osc_member` VALUES ('44', '0', null, 'obHUf5UC0qE5g3XcMqdAW5HHuW1g', null, null, '1', '0', '张俊添（睿邦品牌设计）', '1', 'https://wx.qlogo.cn/mmopen/vi_32/ZvlDw8TfzByaVgzXNpDaIaJyR46xqJmBfibmiaV0wqq9kT5bicGuJKdlMV3S6PzTa0w7aiarIjic0lekVsya7VK7AVg/132', '0', '0', '0', '0.000', '0', '0', '0', '1540298200', '1540298200', '119.130.71.188', '119.130.71.188', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('45', '0', null, 'obHUf5f0P7C6rRc8150em2_9Odgk', null, null, '1', '0', 'Flora | 琳。', '2', 'https://wx.qlogo.cn/mmopen/vi_32/pHsldckgOl8dzdpnnoIsHCicvrubLcHwpaD26jAohNWBiagQyKQaj6bvjUgxceeGfA6ibCGKkQlpKjxsqGBCJMMsA/132', '0', '0', '0', '0.000', '0', '0', '0', '1540298391', '1540298391', '223.104.1.232', '223.104.1.232', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('46', '0', null, 'obHUf5Rf8y19nvvMPnKwraGRFvo8', null, null, '1', '0', '贵翔明志', '1', 'https://wx.qlogo.cn/mmopen/vi_32/NAA7ov3EoUTsicDoET2lL2z3Kvc474TCWmnFMDh7FuYQvrYWXCQ9sJGDgSsuMYkgQic28iaiaa31gPAd3XXibYJCubg/132', '0', '0', '0', '0.000', '0', '0', '0', '1540298700', '1540298700', '223.73.89.193', '223.73.89.193', '1', null, null, '2', '0', '0', '0', '佛山', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('47', '0', null, 'obHUf5b1A1x7GpgJVBDVBYdVX6tw', null, null, '1', '0', 'HOOOW\'S', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Lds081QPLYiafrwLq4iaMJr4Eud6emJ5g3oO3iavVuMXmbNZxfAy5IOicp51LGeqQO4K6Wyjg7gsknAibCGhZIAOocA/132', '0', '0', '0', '0.000', '0', '0', '0', '1540299848', '1540299848', '112.96.71.226', '112.96.71.226', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('48', '0', null, 'obHUf5R9L4p-FfF9Jalmz6SQc86w', null, null, '1', '0', 'Allen', '1', 'https://wx.qlogo.cn/mmopen/vi_32/XOJKDDJkeTgiavm5Vw9CwdImrxthQPsFoF6XLRjoRHEzFGb0OLoHvsjibrATic31ribS3jZyKxCagyibUUL9SYE5Fzg/132', '0', '0', '0', '0.000', '0', '0', '0', '1540300209', '1540300209', '121.32.154.29', '121.32.154.29', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('49', '0', null, 'obHUf5dr538F4WLgEpTPpjB4z3Kk', null, null, '1', '0', '大智', '1', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoXQ1E2dW0UM1uOvIlqDKTVc42YERgVbw4yr0WKc8zRL4m2icDOjAu5CGe2yUoItjm2Th8J1tibdE3w/132', '0', '0', '0', '0.000', '0', '0', '0', '1540300351', '1540300351', '223.104.63.86', '223.104.63.86', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('50', '0', null, 'obHUf5aBBDm5aFtDIfeQ-91ZMBXA', null, null, '1', '0', '王卫平', '1', 'https://wx.qlogo.cn/mmopen/vi_32/KbQbffBmFUYuebTVKOLIxrKKYwyFcnVwB0l3o3RdRNlrBKD357IKPtdibd6zWmz6dh9U7ZdjTAqLb3ibye3qAO5w/132', '0', '0', '0', '0.000', '0', '0', '0', '1540301455', '1540301455', '183.53.253.167', '183.53.253.167', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('51', '0', null, 'obHUf5aIxU2wYDHfJPWFEWChCzPQ', null, null, '1', '0', '纪开心', '2', 'https://wx.qlogo.cn/mmopen/vi_32/hUiarsvxiaX8toMrgKxnyVxMsfUuwrVickXOXFUyZALIpv6YIibltk1z2X2hzpILOKp1h29Ikh0icllyK3oJBpDNJWA/132', '0', '0', '0', '0.000', '0', '0', '0', '1540301647', '1540301647', '183.54.193.133', '183.54.193.133', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('52', '0', null, 'obHUf5UDOHRweCKUJ8OfXkNjkET0', null, null, '1', '0', '東方', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Z0jd6kA5A08voup5MLRIJo38IrItuBdl0MDblG4dibcNj66FuEu4fzGiaCxVrnaiaNvjUn6yMh3PKY8D5mTwGD7hw/132', '0', '0', '0', '0.000', '0', '0', '0', '1540301881', '1540301881', '223.104.63.79', '223.104.63.79', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('53', '0', null, 'obHUf5WGSgrmJ8DHV5754MONc4kw', null, null, '1', '0', '大地飞鹰', '1', 'https://wx.qlogo.cn/mmopen/vi_32/RaJ6lwjp0Ib5HgWCmZ8Ifeo9qxxXSLYSiagCMmaibSSsFR2gf564D70lZv5L0yaFRSnibeicibzA4picFNYAoEwn27RA/132', '0', '0', '0', '0.000', '0', '0', '0', '1540424635', '1540424635', '113.119.29.232', '113.119.29.232', '1', null, null, '2', '0', '0', '0', '', 'zh_CN', '', '0', '0.00');
INSERT INTO `osc_member` VALUES ('54', '0', null, 'obHUf5RvuUuIYPLA9xv6Dfj_OpHU', null, null, '1', '0', 'A001陆华浩', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL5EwxKXJG9rQGOaYlWJK8kuSiawe0Jf9KibLXDCZuIz15zkfXjeQU0now9yS0iaxdaPF0uZPgz3I8gA/132', '0', '0', '0', '0.000', '0', '0', '0', '1540453386', '1540453386', '119.129.50.95', '119.129.50.95', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('55', '0', null, 'obHUf5dPyRdWtCKdBnEzE00y7QVk', null, null, '1', '0', '淡然', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTId916UibgDibCDWpXvy44Uo78OkWCLMfAzpdNymyTh9V1E7vnJpcicU6n8O3KTI2EIgwYjib0qNnibaNw/132', '0', '0', '0', '0.000', '0', '0', '0', '1540809465', '1540809465', '1.144.111.45', '1.144.111.45', '1', null, null, '2', '0', '0', '0', '悉尼', 'zh_CN', '新南威尔士', '0', '0.00');
INSERT INTO `osc_member` VALUES ('56', '0', null, 'obHUf5VUIEdwb3jj3jPMgFGjnEck', null, null, '1', '0', '佳', '2', 'https://wx.qlogo.cn/mmopen/vi_32/IfFG7wl965j99iaibpzxz5K03r8nkuLAXLY3INDYzKtzcRMSJ1M5KicbNMCOtwqLjSwiccqVltJdRl1uoIF4ibv3ehw/132', '0', '0', '0', '0.000', '0', '0', '0', '1540883303', '1540893149', '112.96.70.52', '112.96.70.61', '3', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('57', '0', null, 'obHUf5azKjHlBckJpALoIy7VbHFY', null, null, '1', '0', 'polly', '2', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKmxeYD2Nd0pj5W9mLyYdIJjIZBryiaHsVgBtODkHxZt8ZSH8xQnt5RbE6S8vo0uEXDGKUFbbfgf0w/132', '0', '0', '0', '0.000', '0', '0', '0', '1540883314', '1541056471', '119.129.51.230', '119.129.51.154', '2', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('58', '0', null, 'obHUf5UDpieKCQWGg3Lgvm6Pkivc', null, null, '1', '0', '小麦', '1', 'https://wx.qlogo.cn/mmopen/vi_32/a5FMF6AyAo9qpN3yYMkoZB7NJKRMWCdziag4YibkPibOqpXMxAfeB5dEMlrl8iayQAWehsibAibsQpib75lvibRte30DLw/132', '0', '0', '0', '0.000', '0', '0', '0', '1540891403', '1540891403', '117.136.32.90', '117.136.32.90', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');
INSERT INTO `osc_member` VALUES ('59', '0', null, 'obHUf5THx0aM4ayqXJrbEtR719t4', null, null, '1', '0', '小妮子', '2', 'https://wx.qlogo.cn/mmopen/vi_32/PIibcwfzZxbe1lfFC6751ib9x5Dk1TqiaYAdKyXQmd40O0akDe5l3NVLC2F9iaAiasoic3wtneEeQ1nQfKpicHPCuBJAQ/132', '0', '0', '0', '0.000', '0', '0', '0', '1540893309', '1540893309', '124.78.5.2', '124.78.5.2', '1', null, null, '2', '0', '0', '0', '广州', 'zh_CN', '广东', '0', '0.00');

-- ----------------------------
-- Table structure for osc_member_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `osc_member_auth_group`;
CREATE TABLE `osc_member_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `type` varchar(20) DEFAULT NULL,
  `title` char(20) DEFAULT NULL COMMENT '用户组中文名称',
  `description` varchar(80) DEFAULT NULL COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_member_auth_group
-- ----------------------------
INSERT INTO `osc_member_auth_group` VALUES ('2', '', '普通用户', '普通用户', '1', '13,14,15,19,20,21,22,23,25,26,27,28');
INSERT INTO `osc_member_auth_group` VALUES ('3', null, '黄金用户', '', '1', null);

-- ----------------------------
-- Table structure for osc_member_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `osc_member_auth_group_access`;
CREATE TABLE `osc_member_auth_group_access` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_member_auth_group_access
-- ----------------------------
INSERT INTO `osc_member_auth_group_access` VALUES ('1', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('2', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('18', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('20', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('21', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('22', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('23', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('24', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('25', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('26', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('27', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('28', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('29', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('30', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('31', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('32', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('33', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('34', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('35', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('36', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('37', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('38', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('39', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('40', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('41', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('42', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('43', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('44', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('45', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('46', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('47', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('48', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('49', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('50', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('51', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('52', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('53', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('54', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('55', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('56', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('57', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('58', '2');
INSERT INTO `osc_member_auth_group_access` VALUES ('59', '2');

-- ----------------------------
-- Table structure for osc_member_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `osc_member_auth_rule`;
CREATE TABLE `osc_member_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_member_auth_rule
-- ----------------------------
INSERT INTO `osc_member_auth_rule` VALUES ('1', '2', '13', '');
INSERT INTO `osc_member_auth_rule` VALUES ('2', '2', '14', 'member/account/profile');
INSERT INTO `osc_member_auth_rule` VALUES ('3', '2', '15', 'member/account/password');
INSERT INTO `osc_member_auth_rule` VALUES ('4', '2', '19', '');
INSERT INTO `osc_member_auth_rule` VALUES ('5', '2', '20', 'member/account/address');
INSERT INTO `osc_member_auth_rule` VALUES ('6', '2', '21', 'member/order_member/index');
INSERT INTO `osc_member_auth_rule` VALUES ('7', '2', '22', 'member/order_member/show_order');
INSERT INTO `osc_member_auth_rule` VALUES ('8', '2', '23', 'member/order_member/history');
INSERT INTO `osc_member_auth_rule` VALUES ('9', '2', '25', 'member/account/add_address');
INSERT INTO `osc_member_auth_rule` VALUES ('10', '2', '26', 'member/account/edit_address');
INSERT INTO `osc_member_auth_rule` VALUES ('11', '2', '27', 'member/account/del_address');
INSERT INTO `osc_member_auth_rule` VALUES ('12', '2', '28', 'member/order_member/cancel');

-- ----------------------------
-- Table structure for osc_member_level
-- ----------------------------
DROP TABLE IF EXISTS `osc_member_level`;
CREATE TABLE `osc_member_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `buy_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '升级条件（消费金额）',
  `rebate` decimal(10,2) NOT NULL DEFAULT '10.00' COMMENT '享受权益（消费折扣）',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `people` int(11) NOT NULL DEFAULT '0' COMMENT '人数',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `description` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_member_level
-- ----------------------------
INSERT INTO `osc_member_level` VALUES ('1', '普通会员', '0.00', '10.00', '0', '0', '1', '0');
INSERT INTO `osc_member_level` VALUES ('2', '白银会员', '200.00', '9.90', '0', '0', '1', '0');
INSERT INTO `osc_member_level` VALUES ('3', '黄金会员', '2000.00', '8.80', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for osc_member_location
-- ----------------------------
DROP TABLE IF EXISTS `osc_member_location`;
CREATE TABLE `osc_member_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(30) NOT NULL DEFAULT '' COMMENT '纬度',
  `longitude` varchar(30) NOT NULL DEFAULT '' COMMENT '经度',
  `newtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户位置';

-- ----------------------------
-- Records of osc_member_location
-- ----------------------------

-- ----------------------------
-- Table structure for osc_member_menu
-- ----------------------------
DROP TABLE IF EXISTS `osc_member_menu`;
CREATE TABLE `osc_member_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `module` varchar(20) DEFAULT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `url` char(255) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(64) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `type` varchar(40) DEFAULT NULL COMMENT 'nav,auth',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='后台菜单';

-- ----------------------------
-- Records of osc_member_menu
-- ----------------------------
INSERT INTO `osc_member_menu` VALUES ('13', 'member', '0', '个人资料', '', 'fa-users fa-lg', '1', 'nav');
INSERT INTO `osc_member_menu` VALUES ('14', 'member', '13', '我的资料', 'member/account/profile', '', '1', 'nav');
INSERT INTO `osc_member_menu` VALUES ('15', 'member', '13', '修改密码', 'member/account/password', '', '2', 'nav');
INSERT INTO `osc_member_menu` VALUES ('19', 'member', '0', '我的订单', '', 'fa-credit-card fa-lg', '0', 'nav');
INSERT INTO `osc_member_menu` VALUES ('20', 'member', '13', '地址簿', 'member/account/address', '', '3', 'nav');
INSERT INTO `osc_member_menu` VALUES ('21', 'member', '19', '订单管理', 'member/order_member/index', '', '1', 'nav');
INSERT INTO `osc_member_menu` VALUES ('22', 'member', '21', '订单详情', 'member/order_member/show_order', '', '1', 'auth');
INSERT INTO `osc_member_menu` VALUES ('23', 'member', '21', '订单历史', 'member/order_member/history', '', '0', 'auth');
INSERT INTO `osc_member_menu` VALUES ('25', 'member', '20', '新增', 'member/account/add_address', '', '0', 'auth');
INSERT INTO `osc_member_menu` VALUES ('26', 'member', '20', '编辑', 'member/account/edit_address', '', '0', 'auth');
INSERT INTO `osc_member_menu` VALUES ('27', 'member', '20', '删除', 'member/account/del_address', '', '0', 'auth');
INSERT INTO `osc_member_menu` VALUES ('28', 'member', '21', '取消订单', 'member/order_member/cancel', '', '0', 'auth');

-- ----------------------------
-- Table structure for osc_member_recharge_log
-- ----------------------------
DROP TABLE IF EXISTS `osc_member_recharge_log`;
CREATE TABLE `osc_member_recharge_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `recharge_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '充值单号',
  `money` decimal(10,2) NOT NULL COMMENT '金额',
  `type` int(11) NOT NULL COMMENT '状态，1待付款，2已付款',
  `xdtime` int(11) NOT NULL COMMENT '下单时间',
  `fktime` int(11) NOT NULL COMMENT '付款时间',
  PRIMARY KEY (`id`),
  KEY `recharge_sn` (`recharge_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COMMENT='用户充值表';

-- ----------------------------
-- Records of osc_member_recharge_log
-- ----------------------------
INSERT INTO `osc_member_recharge_log` VALUES ('1', '5', '', '0.01', '1', '1534994480', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('2', '5', '', '0.01', '1', '1534994524', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('3', '5', '', '0.01', '1', '1534994525', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('4', '5', '', '0.01', '1', '1534994525', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('5', '5', '', '0.01', '1', '1534994686', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('6', '5', '', '0.01', '1', '1535009274', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('7', '5', '', '0.01', '1', '1535009297', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('8', '5', '', '0.01', '1', '1535009327', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('9', '5', '', '0.01', '1', '1535009408', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('10', '5', '', '0.01', '1', '1535009423', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('11', '5', '', '0.01', '1', '1535009603', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('12', '5', '', '0.01', '1', '1535009605', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('13', '5', '', '0.01', '1', '1535009606', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('14', '5', '', '0.01', '1', '1535009606', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('15', '5', '', '0.01', '1', '1535009606', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('16', '5', '', '0.01', '1', '1535009644', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('17', '5', '', '0.01', '1', '1535009644', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('18', '5', '', '0.01', '1', '1535009932', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('19', '5', '', '0.01', '1', '1535010045', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('20', '5', '', '0.01', '1', '1535010047', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('21', '5', '', '0.01', '1', '1535010047', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('22', '5', '', '0.01', '1', '1535010048', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('23', '5', '', '0.01', '1', '1535010048', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('24', '5', '', '0.01', '1', '1535010229', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('25', '5', '', '0.01', '1', '1535010440', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('26', '5', '', '0.01', '1', '1535010541', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('27', '5', '', '0.01', '1', '1535010544', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('28', '5', '', '0.01', '1', '1535010610', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('29', '5', '', '0.01', '1', '1535010915', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('30', '5', '', '0.01', '1', '1535010916', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('31', '5', '', '0.01', '1', '1535010917', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('32', '5', '', '0.01', '1', '1535012346', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('33', '5', '', '0.01', '1', '1535012597', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('34', '5', '', '0.01', '1', '1535012696', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('35', '5', '', '0.01', '1', '1535013074', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('36', '5', '', '0.01', '1', '1535013150', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('37', '5', '', '0.01', '1', '1535013164', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('38', '5', '', '0.01', '1', '1535013629', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('39', '5', '', '0.01', '1', '1535013912', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('40', '5', '', '0.01', '1', '1535013948', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('41', '5', '', '0.01', '1', '1535013948', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('42', '5', '', '0.01', '1', '1535014016', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('43', '5', '', '0.01', '1', '1535014033', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('44', '5', '', '0.01', '1', '1535014120', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('45', '5', '', '0.01', '1', '1535014136', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('46', '5', '', '0.01', '1', '1535014235', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('47', '5', '', '0.01', '1', '1535014254', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('48', '5', '', '0.01', '1', '1535103415', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('49', '5', '', '0.01', '1', '1535104279', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('50', '5', '', '0.01', '1', '1535104350', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('51', '5', '', '0.01', '1', '1535104522', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('52', '5', '', '0.01', '1', '1535104685', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('53', '5', '', '0.01', '1', '1535104728', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('54', '5', '', '0.01', '1', '1535104935', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('55', '5', '', '0.01', '1', '1535105012', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('56', '5', '', '0.01', '1', '1535105188', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('57', '5', '', '0.01', '1', '1535105231', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('58', '5', '', '0.01', '1', '1535105780', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('59', '5', '', '0.01', '1', '1535106232', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('60', '5', '', '0.01', '1', '1535106260', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('61', '5', '', '0.01', '1', '1535106261', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('62', '5', '', '0.01', '1', '1535106261', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('63', '5', '', '0.10', '1', '1535106357', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('64', '5', '', '0.10', '1', '1535106466', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('65', '5', '', '0.10', '1', '1535106467', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('66', '5', '', '0.10', '1', '1535106467', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('67', '5', '', '0.10', '1', '1535106467', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('68', '5', '', '0.10', '1', '1535106467', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('69', '5', '', '0.10', '1', '1535106569', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('70', '5', '', '0.10', '1', '1535106575', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('71', '5', '', '0.10', '1', '1535106629', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('72', '5', '', '0.10', '1', '1535106703', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('73', '5', '', '0.10', '1', '1535106733', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('74', '5', '', '0.10', '1', '1535107068', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('75', '5', '', '0.10', '1', '1535107508', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('76', '5', '', '0.10', '1', '1535107552', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('77', '5', '', '0.10', '1', '1535108037', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('78', '5', '', '0.10', '1', '1535331744', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('79', '5', '', '0.10', '1', '1535332894', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('80', '5', '', '0.10', '1', '1535332939', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('81', '5', '', '0.10', '1', '1535332968', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('82', '5', '', '0.10', '1', '1535333216', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('83', '5', '', '0.10', '1', '1535333387', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('84', '5', '', '0.10', '1', '1535333425', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('85', '5', '', '0.10', '1', '1535333427', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('86', '5', '', '0.10', '1', '1535333441', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('87', '5', '', '0.10', '1', '1535333664', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('88', '5', '', '0.10', '1', '1535333834', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('89', '5', '', '0.10', '1', '1535333846', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('90', '5', '', '0.10', '1', '1535333861', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('91', '5', '', '0.10', '1', '1535334021', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('92', '5', '', '0.10', '1', '1535334057', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('93', '5', '', '0.10', '1', '1535334423', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('94', '5', '', '0.10', '1', '1535334428', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('95', '5', '', '0.10', '1', '1535334429', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('96', '5', '', '0.10', '1', '1535334474', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('97', '5', '', '0.10', '1', '1535334493', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('98', '5', '', '0.10', '1', '1535334569', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('99', '5', '', '0.10', '1', '1535334590', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('100', '5', '', '0.10', '1', '1535334604', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('101', '5', '', '0.10', '1', '1535334687', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('102', '5', '', '0.10', '1', '1535334786', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('103', '5', '', '0.10', '1', '1535335327', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('104', '5', '', '0.10', '1', '1535335367', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('105', '5', '', '0.10', '1', '1535336120', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('106', '5', '', '0.10', '1', '1535336678', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('107', '5', '', '0.10', '1', '1535336724', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('108', '5', '', '0.10', '1', '1535337242', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('109', '5', '', '0.10', '1', '1535337292', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('110', '5', '', '0.10', '1', '1535337545', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('111', '5', '', '0.10', '1', '1535338016', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('112', '5', '', '0.10', '1', '1535338016', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('113', '5', '', '0.10', '1', '1535338019', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('114', '5', '', '0.10', '1', '1535338074', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('115', '5', '', '0.10', '1', '1535338074', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('116', '5', '', '0.10', '1', '1535338149', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('117', '5', '', '0.10', '1', '1535338524', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('118', '5', '', '0.10', '1', '1535338685', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('119', '5', '', '0.10', '1', '1535338688', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('120', '5', '', '0.10', '1', '1535338692', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('121', '5', '', '0.10', '1', '1535338740', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('122', '5', '', '0.10', '1', '1535338826', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('123', '5', '', '0.10', '1', '1535338894', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('124', '5', '', '0.10', '1', '1535338978', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('125', '5', '', '0.10', '1', '1535338982', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('126', '5', '', '0.10', '1', '1535339116', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('127', '5', '', '0.10', '1', '1535339134', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('128', '5', '', '0.10', '1', '1535339197', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('129', '5', '', '0.10', '1', '1535339729', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('130', '5', '', '0.10', '1', '1535339835', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('131', '5', '', '0.10', '1', '1535339880', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('132', '5', '', '0.10', '1', '1535339935', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('133', '5', '', '0.10', '1', '1535339971', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('134', '5', '', '0.10', '1', '1535339993', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('135', '5', '', '0.10', '1', '1535340064', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('136', '5', '', '0.10', '1', '1535340148', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('137', '5', '', '0.10', '1', '1535340218', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('138', '5', '', '0.10', '1', '1535340268', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('139', '5', '', '0.10', '1', '1535340298', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('140', '5', '', '0.10', '1', '1535340341', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('141', '5', '', '0.10', '1', '1535340385', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('142', '5', '', '0.10', '1', '1535340443', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('143', '5', '', '0.10', '1', '1535340447', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('144', '5', '', '0.10', '1', '1535340549', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('145', '5', '', '0.10', '1', '1535340622', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('146', '5', '', '0.10', '1', '1535340655', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('147', '5', '', '0.10', '1', '1535340687', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('148', '5', '', '0.10', '1', '1535340696', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('149', '5', '', '0.10', '1', '1535340742', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('150', '5', '', '0.10', '1', '1535340827', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('151', '5', '', '0.10', '1', '1535340830', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('152', '5', '', '0.10', '1', '1535340910', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('153', '5', '', '0.10', '1', '1535341140', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('154', '5', '', '0.10', '1', '1535341372', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('155', '5', '', '0.10', '1', '1535341385', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('156', '5', '', '0.10', '1', '1535341398', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('157', '5', '', '0.10', '1', '1535341441', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('158', '5', '', '0.10', '1', '1535341472', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('159', '5', '', '0.10', '1', '1535341517', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('160', '5', '', '0.10', '1', '1535341744', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('161', '5', '', '0.10', '1', '1535341770', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('162', '5', '', '0.10', '1', '1535341825', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('163', '5', '', '0.10', '1', '1535341853', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('164', '5', '', '0.10', '1', '1535341864', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('165', '5', '', '0.10', '1', '1535342071', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('166', '5', '', '0.10', '1', '1535342718', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('167', '5', '', '0.10', '1', '1535342745', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('168', '5', '', '0.10', '1', '1535342805', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('169', '5', '', '0.10', '1', '1535342837', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('170', '5', '', '0.10', '1', '1535342992', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('171', '5', '', '0.10', '1', '1535343008', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('172', '5', '', '0.10', '1', '1535343260', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('173', '5', '', '0.10', '1', '1535343291', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('174', '5', '', '0.10', '1', '1535343335', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('175', '5', '', '0.10', '1', '1535343366', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('176', '5', '', '0.10', '1', '1535343398', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('177', '5', '', '0.10', '1', '1535343449', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('178', '5', '', '0.10', '1', '1535343515', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('179', '5', '', '0.10', '1', '1535343535', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('180', '5', '', '0.10', '1', '1535343559', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('181', '5', '', '0.10', '1', '1535343630', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('182', '5', '', '0.10', '1', '1535343656', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('183', '5', '', '0.10', '1', '1535349054', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('184', '5', '', '0.10', '1', '1535349144', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('185', '5', '', '0.10', '1', '1535349175', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('186', '5', '', '0.10', '1', '1535349228', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('187', '5', '', '0.10', '1', '1535349264', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('188', '5', '', '0.10', '1', '1535349264', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('189', '5', '', '0.10', '1', '1535349279', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('190', '5', '', '0.10', '1', '1535353741', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('191', '5', '', '0.10', '1', '1535353767', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('192', '5', '', '0.10', '1', '1535353775', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('193', '5', '', '0.10', '1', '1535353805', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('194', '5', '', '0.10', '1', '1535355288', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('195', '5', '', '0.10', '1', '1535355681', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('196', '5', '', '0.10', '1', '1535355711', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('197', '5', '', '0.10', '1', '1535355785', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('198', '5', '', '0.10', '1', '1535355810', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('199', '5', '', '0.10', '1', '1535355850', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('200', '5', '', '0.01', '1', '1535356163', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('201', '5', '', '0.01', '1', '1535361767', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('202', '5', '', '0.01', '1', '1535361808', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('203', '5', '', '0.01', '1', '1535361876', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('204', '5', '', '0.01', '1', '1535361896', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('205', '5', '', '0.01', '1', '1535361924', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('206', '5', '', '0.01', '1', '1535361937', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('207', '5', '', '0.01', '1', '1535361975', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('208', '5', '', '0.01', '1', '1535362080', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('209', '5', '', '0.01', '1', '1535527780', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('210', '5', '', '0.01', '1', '1535530246', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('211', '5', '', '0.01', '1', '1535530262', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('212', '5', '', '0.01', '1', '1535530281', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('213', '5', '', '0.01', '1', '1535530333', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('214', '5', '', '0.01', '1', '1535530464', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('215', '5', '', '0.01', '1', '1535530488', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('216', '5', '', '0.01', '1', '1535530515', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('217', '5', '', '0.01', '1', '1535550752', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('218', '5', '', '0.01', '1', '1536134824', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('219', '5', '', '0.01', '1', '1536137637', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('220', '5', '', '0.01', '1', '1536161003', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('221', '5', '', '0.01', '1', '1537337808', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('222', '5', '', '0.01', '1', '1537338801', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('223', '5', '', '0.01', '1', '1539595823', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('224', '5', '', '0.01', '1', '1539595845', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('225', '5', '', '0.01', '1', '1539595922', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('226', '5', '', '0.01', '1', '1539595951', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('227', '5', '', '0.01', '1', '1539595983', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('228', '5', '', '0.01', '1', '1539597064', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('229', '5', '', '0.01', '1', '1539597097', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('230', '5', '', '0.01', '1', '1539597116', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('231', '5', '', '0.01', '1', '1539597169', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('232', '5', '', '0.01', '1', '1539597207', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('233', '5', '', '0.01', '1', '1539597278', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('234', '5', '', '0.01', '1', '1539597293', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('235', '5', '', '0.01', '1', '1539597755', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('236', '5', '', '0.01', '1', '1539597990', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('237', '5', '', '0.01', '1', '1539598052', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('238', '5', '', '0.01', '1', '1539598072', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('239', '5', '', '0.01', '1', '1539833774', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('240', '5', '', '0.01', '1', '1540882688', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('241', '5', '', '0.01', '1', '1540882701', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('242', '5', '', '0.01', '1', '1540882746', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('243', '5', '', '0.01', '1', '1540882766', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('244', '5', '', '0.01', '1', '1540882882', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('245', '5', '', '0.01', '1', '1540882907', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('246', '5', '', '0.01', '1', '1540882967', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('247', '5', '', '0.01', '1', '1541126010', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('248', '5', '', '0.01', '1', '1541126236', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('249', '5', '', '0.01', '1', '1541126512', '0');
INSERT INTO `osc_member_recharge_log` VALUES ('250', '5', '', '0.01', '1', '1541126751', '0');

-- ----------------------------
-- Table structure for osc_member_wishlist
-- ----------------------------
DROP TABLE IF EXISTS `osc_member_wishlist`;
CREATE TABLE `osc_member_wishlist` (
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `date_added` varchar(40) DEFAULT NULL,
  KEY `uid` (`uid`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏的商品';

-- ----------------------------
-- Records of osc_member_wishlist
-- ----------------------------

-- ----------------------------
-- Table structure for osc_menu
-- ----------------------------
DROP TABLE IF EXISTS `osc_menu`;
CREATE TABLE `osc_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `module` varchar(20) DEFAULT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(64) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `type` varchar(40) DEFAULT NULL COMMENT 'nav,auth',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8 COMMENT='后台菜单';

-- ----------------------------
-- Records of osc_menu
-- ----------------------------
INSERT INTO `osc_menu` VALUES ('1', 'admin', '0', '系统', 'admin/settings/general', 'fa-cog fa-lg', '7', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('2', 'admin', '1', '后台菜单管理', 'admin/menu/index', '', '10', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('13', 'admin', '0', '扩展', '', 'fa-puzzle-piece fa-lg', '6', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('19', 'admin', '28', '商品分类', 'admin/category/index', '', '2', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('28', 'admin', '0', '商品', 'admin/goods/index', 'fa-gift fa-lg', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('29', 'admin', '28', '商品管理', 'admin/goods/index', '', '1', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('30', 'admin', '28', '重量单位', 'admin/weight_class/index', '', '5', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('38', 'admin', '1', '基本信息', 'admin/settings/general', '', '1', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('46', 'admin', '1', '配置管理', 'admin/config/index', '', '5', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('57', 'admin', '0', '首页', 'admin/index/index', 'fa-home fa-lg', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('66', 'admin', '29', '新增', 'admin/goods/add', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('67', 'admin', '29', '复制', 'admin/goods/copy_goods', '', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('68', 'admin', '29', '编辑', 'admin/goods/edit', '', '3', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('69', 'admin', '29', '删除', 'admin/goods/del', '', '4', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('70', 'admin', '19', '新增', 'admin/category/add', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('71', 'admin', '19', '编辑', 'admin/category/edit', '', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('72', 'admin', '19', '删除', 'admin/category/del', '', '3', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('73', 'admin', '19', '自动完成', 'admin/category/autocomplete', '', '4', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('75', 'admin', '30', '新增', 'admin/weight_class/add', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('76', 'admin', '30', '编辑', 'admin/weight_class/edit', '', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('77', 'admin', '30', '删除', 'admin/weight_class/del', '', '3', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('113', 'admin', '38', '保存配置', 'admin/settings/save', '', '8', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('120', 'admin', '2', '新增', 'admin/menu/add', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('121', 'admin', '2', '编辑', 'admin/menu/edit', '', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('122', 'admin', '2', '删除', 'admin/menu/del', '', '3', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('123', 'admin', '2', '获取信息', 'admin/menu/get_info', '', '4', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('124', 'admin', '13', '模块管理', 'admin/module/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('125', 'admin', '1', '权限管理', 'admin/auth_manager/index', '', '2', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('126', 'admin', '1', '管理员日志', 'admin/user_action/index', 'admin', '3', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('127', 'admin', '1', '系统用户', 'admin/user/index', '', '4', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('129', 'member', '0', '会员', '', 'fa-users fa-lg', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('130', 'member', '129', '会员菜单', 'member/menu_backend/index', '', '1', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('131', 'member', '129', '会员权限', 'member/auth_backend/index', '', '2', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('133', 'member', '129', '支付接口', 'member/payment/index', '', '8', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('135', 'admin', '28', '长度单位', 'admin/length_class/index', '', '6', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('136', 'admin', '28', '商品品牌', 'admin/brand/index', '', '7', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('137', 'member', '129', '运费模板', 'member/transport/index', '', '7', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('138', 'member', '129', '会员订单', 'member/order_backend/index', '', '3', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('139', 'member', '129', '会员管理', 'member/member_backend/index', '', '4', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('140', 'admin', '29', '设置商品状态', 'admin/goods/set_status', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('141', 'admin', '29', '修改商品价格', 'admin/goods/update_price', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('142', 'admin', '29', '修改商品数量', 'admin/goods/update_quantity', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('143', 'admin', '29', '修改商品排序', 'admin/goods/update_sort', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('144', 'admin', '29', '编辑基本信息', 'admin/goods/edit_general', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('145', 'admin', '29', '编辑关联', 'admin/goods/edit_links', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('146', 'admin', '29', '编辑选项', 'admin/goods/edit_option', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('147', 'admin', '29', '编辑折扣', 'admin/goods/edit_discount', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('148', 'admin', '29', '编辑相册', 'admin/goods/edit_image', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('149', 'admin', '29', '编辑手机端描述', 'admin/goods/edit_mobile', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('151', 'admin', '29', '取得商品属性', 'admin/attribute/autocomplete', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('152', 'admin', '29', '取得商品品牌', 'admin/brand/autocomplete', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('153', 'admin', '19', '更新排序', 'admin/category/update_sort', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('159', 'admin', '135', '新增', 'admin/length_class/add', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('160', 'admin', '135', '编辑', 'admin/length_class/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('161', 'admin', '135', '删除', 'admin/length_class/del', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('162', 'admin', '136', '新增', 'admin/brand/add', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('163', 'admin', '136', '编辑', 'admin/brand/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('164', 'admin', '136', '删除', 'admin/brand/del', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('165', 'admin', '136', '自动完成', 'admin/brand/autocomplete', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('166', 'member', '130', '新增', 'member/menu_backend/add', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('167', 'member', '130', '编辑', 'member/menu_backend/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('168', 'member', '130', '删除', 'member/menu_backend/del', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('169', 'member', '130', '取得菜单信息', 'member/menu_backend/get_info', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('170', 'member', '131', '添加用户组', 'member/auth_backend/create_group', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('171', 'member', '131', '编辑用户组', 'member/auth_backend/edit_group', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('172', 'member', '131', '删除用户组', 'member/auth_backend/del_group', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('173', 'member', '131', '查看访问权限', 'member/auth_backend/access', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('174', 'member', '131', '编辑权限', 'member/auth_backend/write_group', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('175', 'member', '131', '设置用户组状态', 'member/auth_backend/set_status', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('176', 'member', '138', '查看订单', 'member/order_backend/show_order', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('177', 'member', '138', '打印订单', 'member/order_backend/print_order', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('178', 'member', '138', '订单历史', 'member/order_backend/history', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('179', 'member', '138', '更新订单', 'member/order_backend/update_order', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('180', 'member', '138', '更新运费', 'member/order_backend/update_shipping', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('181', 'member', '139', '新增', 'member/member_backend/add', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('182', 'member', '139', '编辑', 'member/member_backend/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('183', 'member', '133', '编辑支付接口', 'member/payment/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('184', 'member', '133', '设置状态', 'member/payment/set_status', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('186', 'admin', '124', '删除模块', 'admin/module/del', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('187', 'admin', '125', '新增用户组', 'admin/auth_manager/create_group', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('188', 'admin', '125', '编辑用户组', 'admin/auth_manager/edit_group', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('189', 'admin', '125', '删除用户组', 'admin/auth_manager/del_group', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('190', 'admin', '125', '查看权限', 'admin/auth_manager/access', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('191', 'admin', '125', '编辑权限', 'admin/auth_manager/write_group', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('192', 'admin', '125', '设置状态', 'admin/auth_manager/set_status', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('193', 'admin', '127', '新增', 'admin/user/add', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('194', 'admin', '127', '编辑', 'admin/user/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('195', 'admin', '127', '删除', 'admin/user/del', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('196', 'admin', '127', '设置状态', 'admin/user/set_status', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('197', 'admin', '46', '新增', 'admin/config/add', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('198', 'admin', '46', '编辑', 'admin/config/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('199', 'admin', '46', '删除', 'admin/config/del', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('200', 'admin', '137', '新增', 'admin/transport/add', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('201', 'admin', '137', '复制', 'admin/transport/clone_data', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('202', 'admin', '137', '编辑', 'admin/transport/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('203', 'admin', '137', '保存', 'admin/transport/save', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('204', 'admin', '137', '删除', 'admin/transport/del', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('205', 'admin', '137', '获取地区', 'admin/transport/getCity', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('206', 'member', '129', '订单状态', 'member/order_status/index', '', '5', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('207', 'member', '206', '新增', 'member/order_status/add', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('208', 'member', '206', '编辑', 'member/order_status/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('209', 'member', '206', '删除', 'member/order_status/del', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('210', 'member', '1', '其他配置', 'admin/settings/other', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('290', 'admin', '57', '退出系统', 'admin/index/logout', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('292', 'mobile', '0', '移动端', '', 'fa-mobile  fa-lg', '8', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('293', 'mobile', '292', '代理分销', '', '', '1', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('294', 'mobile', '293', '代理管理', 'mobile/agent_backend/agent_list', '', '2', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('295', 'mobile', '294', '编辑', 'mobile/agent_backend/edit_agent', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('296', 'mobile', '293', '代理审核', 'mobile/agent_backend/index', '', '1', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('297', 'mobile', '296', '审核', 'mobile/agent_backend/pass', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('298', 'mobile', '293', '代理级别', 'mobile/agent_backend/level', '', '3', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('299', 'mobile', '298', '新增', 'mobile/agent_backend/add_level', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('300', 'mobile', '298', '编辑', 'mobile/agent_backend/edit_level', '', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('301', 'mobile', '298', '删除', 'mobile/agent_backend/del_level', '', '3', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('302', 'mobile', '293', '提现申请', 'mobile/cash_backend/cash_apply', '', '4', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('303', 'mobile', '302', '通过', 'mobile/cash_backend/pass_cash_apply', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('304', 'mobile', '293', '提现记录', 'mobile/cash_backend/cash_record', '', '5', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('305', 'mobile', '293', '分享记录', 'mobile/agent_backend/share', '', '6', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('306', 'mobile', '292', '自动回复', '', '', '2', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('307', 'mobile', '306', '文字回复', 'mobile/reply_backend/text', '', '1', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('308', 'mobile', '307', '新增', 'mobile/reply_backend/text_add', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('309', 'mobile', '307', '编辑', 'mobile/reply_backend/text_edit', '', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('310', 'mobile', '307', '删除', 'mobile/reply_backend/text_del', '', '3', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('311', 'mobile', '306', '图文回复', 'mobile/reply_backend/news', '', '2', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('312', 'mobile', '311', '新增', 'mobile/reply_backend/news_add', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('313', 'mobile', '311', '编辑', 'mobile/reply_backend/news_edit', '', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('314', 'mobile', '311', '删除', 'mobile/reply_backend/news_del', '', '3', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('315', 'mobile', '292', '自定义菜单', 'mobile/custom_menu/index', '', '3', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('316', 'mobile', '315', '生成菜单', 'mobile/custom_menu/create_menu', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('317', 'mobile', '315', '清空菜单', 'mobile/custom_menu/delete_menu', '', '2', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('318', 'mobile', '292', '配置管理', 'mobile/settings_backend/mobile', '', '4', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('319', '广告', '0', '广告', '', 'fa fa-list fa-lg', '3', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('320', '广告管理', '319', '广告管理', 'admin/banner/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('322', '商家', '0', '商家', '', 'fa-chain fa-lg', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('323', '商家管理', '322', '商家管理', 'admin/shop/index', '', '2', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('324', '商家待审核', '322', '商家待审核', 'admin/shop/checkshop', '', '3', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('326', '商家设置', '322', '商家设置', 'admin/shop/setting', '', '1', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('327', '使用教程', '0', '使用教程', '', 'fa-lg fa-book', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('328', '教程管理', '327', '教程管理', 'admin/article/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('329', '优惠券', '0', '优惠券', '', 'fa-ticket fa-lg', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('330', '优惠券管理', '329', '优惠券管理', 'admin/coupon/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('331', '已领取优惠券', '329', '已领取优惠券', 'admin/cousend/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('332', '优惠券统计', '329', '优惠券统计', 'admin/couponcount/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('333', '蓝牙', '0', '蓝牙', '', 'fa-tumblr-square  fa-lg', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('334', '蓝牙管理', '333', '蓝牙管理', 'admin/bluetooth/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('336', '教程分类', '327', '教程分类', 'admin/article_gory/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('337', '帮助中心', '327', '帮助中心', 'admin/helper/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('338', '名师推荐', '327', '名师推荐', 'admin/teacher/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('339', '产品管理', '322', '产品管理', 'admin/product/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('340', '预约订单', '322', '预约订单', 'admin/shop/yuyue', '', '3', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('341', '', '322', '商家等级', '/admin/shopLevel/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('342', '', '341', '添加商家等级', '/admin/shopLevel/add', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('343', '', '341', '编辑商家等级', '/admin/shopLevel/edit', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('345', '', '129', '会员等级', 'member/level/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('346', '', '345', '添加会员等级', 'member/level/add', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('347', '', '345', '编辑会员等级', 'member/level/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('349', '', '322', '商家产品管理', 'admin/productShop/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('350', '', '349', '编辑商家产品', 'admin/productShop/edit', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('351', '', '323', '添加商家产品', 'admin/productShop/add', '', '0', 'auth', '1');
INSERT INTO `osc_menu` VALUES ('355', '', '0', '会员管理', '', 'fa fa-user', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('356', '', '355', '供应商列表', 'admin/supplier/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('357', '', '0', '项目管理', '', 'fa fa-bars', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('358', 'admin', '357', '发布项目', 'admin/project/add', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('360', 'admin', '355', '待审核供应商列表', 'admin/supplier/audit_list', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('361', '', '357', '竞价项目列表', 'admin/project/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('362', '', '357', '竞价项目分类', 'admin/user_classify/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('363', '', '0', '统计中心', '', 'fa fa-bar-chart', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('364', '', '363', '项目统计', 'admin/project_count/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('365', '', '363', '供应商统计', 'admin/supplier_count/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('366', '', '1', '意见箱', 'admin/suggest/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('367', '', '0', '公司设置', '', 'fa fa-bug', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('368', 'admin', '367', '须知及条件', 'admin/company/notice', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('369', '', '367', '公司简介', 'admin/company/profile', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('370', 'admin', '367', '旗下品牌', 'admin/company/brand', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('371', 'admin', '367', '分店网络', 'admin/company/store', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('372', 'admin', '367', '公司新闻', 'admin/company/news', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('373', '', '367', '新闻分类', 'admin/news_type/index', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('374', 'admin', '367', '常见问题', 'admin/company/problems', '', '0', 'nav', '1');
INSERT INTO `osc_menu` VALUES ('375', 'admin', '374', '新增', 'admin/company/add_problem', '', '0', 'auth', '1');

-- ----------------------------
-- Table structure for osc_messages
-- ----------------------------
DROP TABLE IF EXISTS `osc_messages`;
CREATE TABLE `osc_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1  投标公告   2 系统公告',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_messages
-- ----------------------------
INSERT INTO `osc_messages` VALUES ('23', '你投注的《采购新鲜牛奶35000L项目》项目，广州市999有限公司出了比你还要低的价格&yen;35.56，你是否进行加价？', '1', '1546968198', '11', '27');
INSERT INTO `osc_messages` VALUES ('24', '恭喜，你在《采购新鲜牛奶35000L项目》成功中标', '2', '1546968275', '9', '27');
INSERT INTO `osc_messages` VALUES ('25', '你投注的《采购新鲜牛奶25000L项目》项目，广州市999有限公司出了比你还要低的价格&yen;12.5，你是否进行加价？', '1', '1546968942', '11', '26');
INSERT INTO `osc_messages` VALUES ('26', '你投注的《采购新鲜牛奶25000L项目》项目，广州粒粒收有限公司出了比你还要低的价格&yen;10，你是否进行加价？', '1', '1546969447', '11', '26');
INSERT INTO `osc_messages` VALUES ('27', '你投注的《采购新鲜牛奶25000L项目》项目，广州粒粒收有限公司出了比你还要低的价格&yen;10，你是否进行加价？', '1', '1546969447', '9', '26');
INSERT INTO `osc_messages` VALUES ('28', '你投注的《采购新鲜牛奶25000L项目》项目，广州市999有限公司出了比你还要低的价格&yen;9.5，你是否进行加价？', '1', '1546969478', '11', '26');
INSERT INTO `osc_messages` VALUES ('29', '你投注的《采购新鲜牛奶25000L项目》项目，广州市999有限公司出了比你还要低的价格&yen;9.5，你是否进行加价？', '1', '1546969478', '12', '26');
INSERT INTO `osc_messages` VALUES ('30', '你投注的《采购新鲜牛奶25000L项目》项目，广州粒粒收有限公司出了比你还要低的价格&yen;9，你是否进行加价？', '1', '1546969503', '11', '26');
INSERT INTO `osc_messages` VALUES ('31', '你投注的《采购新鲜牛奶25000L项目》项目，广州粒粒收有限公司出了比你还要低的价格&yen;9，你是否进行加价？', '1', '1546969503', '9', '26');
INSERT INTO `osc_messages` VALUES ('32', '你投注的《采购新鲜牛奶25000L项目》项目，深圳市汗滴禾下土有限公司出了比你还要低的价格&yen;7.5，你是否进行加价？', '1', '1546969608', '9', '26');
INSERT INTO `osc_messages` VALUES ('33', '你投注的《采购新鲜牛奶25000L项目》项目，深圳市汗滴禾下土有限公司出了比你还要低的价格&yen;7.5，你是否进行加价？', '1', '1546969608', '12', '26');
INSERT INTO `osc_messages` VALUES ('34', '恭喜，你在《采购新鲜牛奶25000L项目》成功中标', '2', '1546969627', '11', '26');

-- ----------------------------
-- Table structure for osc_module
-- ----------------------------
DROP TABLE IF EXISTS `osc_module`;
CREATE TABLE `osc_module` (
  `module` varchar(15) NOT NULL COMMENT '模块',
  `modulename` varchar(20) DEFAULT NULL COMMENT '模块名称',
  `base_module` varchar(64) DEFAULT NULL COMMENT '依赖的模块',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '内置模块',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `version` varchar(50) DEFAULT NULL COMMENT '版本',
  `author` varchar(40) DEFAULT NULL,
  `setting` mediumtext COMMENT '设置信息',
  `description` varchar(255) DEFAULT NULL COMMENT '模块描述',
  `installtime` varchar(20) DEFAULT NULL COMMENT '安装时间',
  `updatetime` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`module`),
  KEY `sign` (`sign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已安装模块列表';

-- ----------------------------
-- Records of osc_module
-- ----------------------------
INSERT INTO `osc_module` VALUES ('api', '小程序接口', '无', null, '0', '1', '1', 'caiyq', null, '小程序接口', '2018-08-01', null, '0');
INSERT INTO `osc_module` VALUES ('index', '电脑端', '无', '', '0', '1', '1', '李梓钿', '', '包含商品分类，商品展示，商品详情', '2016-08-16', '2016-09-20', '0');
INSERT INTO `osc_module` VALUES ('member', '会员系统', '无', '', '0', '1', '1', '李梓钿', '', '包含会员，会员权限，收货地址，区域表，购物车，运费模板，结算，支付接口，订单系统', '2016-08-16', '2016-09-20', '0');
INSERT INTO `osc_module` VALUES ('mobile', '移动端', 'member', null, '0', '1', '1', '李梓钿', null, '手机微信二合一，包含商品展示，会员系统，支付，订单', '2017-09-13', '2017-09-13', '0');
INSERT INTO `osc_module` VALUES ('payment', '支付模块', 'member', '', '0', '1', '1', '李梓钿', '', '支付接口调用，回调处理', '2016-08-16', '2016-09-20', '0');
INSERT INTO `osc_module` VALUES ('wap', '微信端', null, null, '0', '1', '1', 'zhuch', null, null, null, null, '0');

-- ----------------------------
-- Table structure for osc_money_log_0
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_0`;
CREATE TABLE `osc_money_log_0` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_0
-- ----------------------------

-- ----------------------------
-- Table structure for osc_money_log_1
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_1`;
CREATE TABLE `osc_money_log_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_1
-- ----------------------------

-- ----------------------------
-- Table structure for osc_money_log_2
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_2`;
CREATE TABLE `osc_money_log_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_2
-- ----------------------------

-- ----------------------------
-- Table structure for osc_money_log_3
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_3`;
CREATE TABLE `osc_money_log_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_3
-- ----------------------------

-- ----------------------------
-- Table structure for osc_money_log_4
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_4`;
CREATE TABLE `osc_money_log_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_4
-- ----------------------------

-- ----------------------------
-- Table structure for osc_money_log_5
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_5`;
CREATE TABLE `osc_money_log_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_5
-- ----------------------------

-- ----------------------------
-- Table structure for osc_money_log_6
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_6`;
CREATE TABLE `osc_money_log_6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_6
-- ----------------------------

-- ----------------------------
-- Table structure for osc_money_log_7
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_7`;
CREATE TABLE `osc_money_log_7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_7
-- ----------------------------

-- ----------------------------
-- Table structure for osc_money_log_8
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_8`;
CREATE TABLE `osc_money_log_8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_8
-- ----------------------------

-- ----------------------------
-- Table structure for osc_money_log_9
-- ----------------------------
DROP TABLE IF EXISTS `osc_money_log_9`;
CREATE TABLE `osc_money_log_9` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1增加2减少',
  `content` varchar(50) NOT NULL DEFAULT '',
  `after_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '操作后的余额',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变化的余额数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额记录表';

-- ----------------------------
-- Records of osc_money_log_9
-- ----------------------------

-- ----------------------------
-- Table structure for osc_news
-- ----------------------------
DROP TABLE IF EXISTS `osc_news`;
CREATE TABLE `osc_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text COMMENT '内容',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `type_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类别id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_id` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_news
-- ----------------------------
INSERT INTO `osc_news` VALUES ('11', '昌大昌清远店2018年下半年消防演练', '&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练昌大昌清远店2018年下半年消防演练&lt;/p&gt;', '65', '11', '1545966672', '1', '1545967031', '1');
INSERT INTO `osc_news` VALUES ('14', '趣士多1', '&lt;p&gt;哦万峰山村1&lt;/p&gt;', '12', '14', '1545967368', '1', '1545967957', '1');
INSERT INTO `osc_news` VALUES ('15', '趣士多', '&lt;p&gt;阿斯顿发大厦&lt;/p&gt;', '0', '11', '1545978410', '1', '0', '0');
INSERT INTO `osc_news` VALUES ('16', '趣士多123', '&lt;p&gt;撒旦发茶树的`1&lt;/p&gt;', '0', '14', '1545978444', '1', '0', '0');
INSERT INTO `osc_news` VALUES ('17', '测试', '&lt;p&gt;啊啊啊啊啊&lt;/p&gt;', '0', '11', '1546597211', '1', '0', '0');

-- ----------------------------
-- Table structure for osc_news_type
-- ----------------------------
DROP TABLE IF EXISTS `osc_news_type`;
CREATE TABLE `osc_news_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0 停用 1 启用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_news_type
-- ----------------------------
INSERT INTO `osc_news_type` VALUES ('11', '公司新闻', '0', '1', '1545965046', '0');
INSERT INTO `osc_news_type` VALUES ('14', '活动反馈', '0', '1', '1545965350', '0');
INSERT INTO `osc_news_type` VALUES ('16', '测', '0', '1', '1545967355', '1546597409');
INSERT INTO `osc_news_type` VALUES ('17', '   ', '0', '1', '1546597652', '0');

-- ----------------------------
-- Table structure for osc_option
-- ----------------------------
DROP TABLE IF EXISTS `osc_option`;
CREATE TABLE `osc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `value` text,
  `update_time` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品选项';

-- ----------------------------
-- Records of osc_option
-- ----------------------------
INSERT INTO `osc_option` VALUES ('1', 'checkbox', '口味', '巧克力,薄荷,柠檬,香味', '2018-08-01 16:19:05');
INSERT INTO `osc_option` VALUES ('2', 'radio', '颜色', '白色,黑色,红色', '2018-08-02 09:02:49');

-- ----------------------------
-- Table structure for osc_option_value
-- ----------------------------
DROP TABLE IF EXISTS `osc_option_value`;
CREATE TABLE `osc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL DEFAULT '0',
  `value_name` varchar(128) DEFAULT NULL,
  `value_sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='选项值';

-- ----------------------------
-- Records of osc_option_value
-- ----------------------------
INSERT INTO `osc_option_value` VALUES ('7', '1', '巧克力', '1');
INSERT INTO `osc_option_value` VALUES ('8', '1', '薄荷', '2');
INSERT INTO `osc_option_value` VALUES ('9', '1', '柠檬', '3');
INSERT INTO `osc_option_value` VALUES ('10', '1', '香味', '4');
INSERT INTO `osc_option_value` VALUES ('26', '2', '白色', '1');
INSERT INTO `osc_option_value` VALUES ('27', '2', '黑色', '2');
INSERT INTO `osc_option_value` VALUES ('28', '2', '红色', '3');

-- ----------------------------
-- Table structure for osc_order
-- ----------------------------
DROP TABLE IF EXISTS `osc_order`;
CREATE TABLE `osc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num_alias` varchar(40) DEFAULT NULL COMMENT '订单编号',
  `pay_subject` varchar(255) DEFAULT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `return_points` int(11) NOT NULL DEFAULT '0' COMMENT '可得积分',
  `pay_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换需要的积分',
  `points_order` int(11) NOT NULL DEFAULT '0' COMMENT '是否是积分兑换订单',
  `name` varchar(32) DEFAULT NULL COMMENT '购买的会员名字',
  `email` varchar(64) DEFAULT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `shipping_name` varchar(32) DEFAULT NULL COMMENT '收货人姓名',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `shipping_tel` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `shipping_city_id` int(11) NOT NULL DEFAULT '0',
  `shipping_country_id` int(11) NOT NULL DEFAULT '0',
  `shipping_province_id` int(11) NOT NULL DEFAULT '0',
  `shipping_method` varchar(128) DEFAULT NULL COMMENT '货运方式',
  `payment_code` varchar(128) DEFAULT NULL COMMENT '支付方式',
  `comment` text,
  `total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户系统信息',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `date_modified` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '付款时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_order
-- ----------------------------
INSERT INTO `osc_order` VALUES ('1', '2018080110048541', '旅行茶具套装便携式功夫茶具 车载 户外 手绘茶具', '1', '50', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'weixin', '', '22.21', '3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '1533112157', '0', '0');
INSERT INTO `osc_order` VALUES ('2', '2018080299100525', '旅行茶具套装便携式功夫茶具 车载 户外 手绘茶具等商品', '1', '100', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'alipay', '', '29.41', '3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '1533195580', '0', '0');
INSERT INTO `osc_order` VALUES ('3', '2018082210049509', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', '1', '50', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'weixin', '', '30.01', '3', '58.62.53.3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1534902045', '0', '0');
INSERT INTO `osc_order` VALUES ('4', '2018082252561011', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', '1', '50', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'alipay', '', '30.01', '3', '58.62.53.3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1534902084', '0', '0');
INSERT INTO `osc_order` VALUES ('5', '2018082252575052', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', '1', '50', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'weixin', '', '30.01', '3', '58.62.53.3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1534903348', '0', '0');
INSERT INTO `osc_order` VALUES ('6', '2018082252101505', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', '1', '50', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'weixin', '', '30.01', '3', '58.62.53.3', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1534904356', '0', '0');
INSERT INTO `osc_order` VALUES ('7', '2018082350991025', '连体裤', '1', '0', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'alipay', '', '0.20', '3', '58.62.52.199', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1534995650', '0', '0');
INSERT INTO `osc_order` VALUES ('8', '2018082352975410', '连体裤', '1', '0', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'weixin', '', '0.10', '3', '58.62.52.199', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1534995892', '0', '0');
INSERT INTO `osc_order` VALUES ('9', '2018082310257515', '连体裤', '1', '0', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'alipay', '', '0.10', '3', '58.62.52.199', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1535007535', '0', '0');
INSERT INTO `osc_order` VALUES ('10', '2018082310099515', '连体裤', '1', '0', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'weixin', '', '0.10', '3', '58.62.52.199', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1535007581', '0', '0');
INSERT INTO `osc_order` VALUES ('11', '2018082910053525', '连体裤', '1', '0', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'alipay', '', '0.20', '3', '58.62.92.33', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1535534381', '0', '0');
INSERT INTO `osc_order` VALUES ('12', '2018082953555697', '连体裤', '1', '0', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'weixin', '', '0.10', '3', '58.62.92.33', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1535534405', '0', '0');
INSERT INTO `osc_order` VALUES ('13', '2018082951545698', '连体裤', '1', '0', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'weixin', '', '0.10', '3', '58.62.92.33', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1535534515', '0', '0');
INSERT INTO `osc_order` VALUES ('14', '2018082948985310', '连体裤', '1', '0', '0', '0', 'admin', '', null, '大白鲨', '1', '15099999999', '36', '38', '1', '1', 'weixin', '', '0.10', '3', '58.62.92.33', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '1535534576', '0', '0');

-- ----------------------------
-- Table structure for osc_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `osc_order_goods`;
CREATE TABLE `osc_order_goods` (
  `order_goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0' COMMENT '数量',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `reward` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_order_goods
-- ----------------------------
INSERT INTO `osc_order_goods` VALUES ('1', '1', '24', '旅行茶具套装便携式功夫茶具 车载 户外 手绘茶具', 'D20151107', '1', '22.20', '22.20', '0');
INSERT INTO `osc_order_goods` VALUES ('2', '2', '24', '旅行茶具套装便携式功夫茶具 车载 户外 手绘茶具', 'D20151107', '1', '14.20', '14.20', '0');
INSERT INTO `osc_order_goods` VALUES ('3', '2', '24', '旅行茶具套装便携式功夫茶具 车载 户外 手绘茶具', 'D20151107', '1', '15.20', '15.20', '0');
INSERT INTO `osc_order_goods` VALUES ('4', '3', '22', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', 'D20151107', '1', '30.00', '30.00', '0');
INSERT INTO `osc_order_goods` VALUES ('5', '4', '22', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', 'D20151107', '1', '30.00', '30.00', '0');
INSERT INTO `osc_order_goods` VALUES ('6', '5', '22', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', 'D20151107', '1', '30.00', '30.00', '0');
INSERT INTO `osc_order_goods` VALUES ('7', '6', '22', '艺创 个人杯 品茗杯 功夫茶具茶杯 手拉坯柴烧', 'D20151107', '1', '30.00', '30.00', '0');
INSERT INTO `osc_order_goods` VALUES ('8', '7', '74', '连体裤', '', '2', '0.10', '0.20', '0');
INSERT INTO `osc_order_goods` VALUES ('9', '8', '74', '连体裤', '', '1', '0.10', '0.10', '0');
INSERT INTO `osc_order_goods` VALUES ('10', '9', '74', '连体裤', '', '1', '0.10', '0.10', '0');
INSERT INTO `osc_order_goods` VALUES ('11', '10', '74', '连体裤', '', '1', '0.10', '0.10', '0');
INSERT INTO `osc_order_goods` VALUES ('12', '11', '74', '连体裤', '', '2', '0.10', '0.20', '0');
INSERT INTO `osc_order_goods` VALUES ('13', '12', '74', '连体裤', '', '1', '0.10', '0.10', '0');
INSERT INTO `osc_order_goods` VALUES ('14', '13', '74', '连体裤', '', '1', '0.10', '0.10', '0');
INSERT INTO `osc_order_goods` VALUES ('15', '14', '74', '连体裤', '', '1', '0.10', '0.10', '0');

-- ----------------------------
-- Table structure for osc_order_history
-- ----------------------------
DROP TABLE IF EXISTS `osc_order_history`;
CREATE TABLE `osc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_status_id` int(5) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text,
  `date_added` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_order_history
-- ----------------------------
INSERT INTO `osc_order_history` VALUES ('1', '1', '3', '0', '', '1533112157');
INSERT INTO `osc_order_history` VALUES ('2', '2', '3', '0', '', '1533195580');
INSERT INTO `osc_order_history` VALUES ('3', '3', '3', '0', '', '1534902045');
INSERT INTO `osc_order_history` VALUES ('4', '4', '3', '0', '', '1534902084');
INSERT INTO `osc_order_history` VALUES ('5', '5', '3', '0', '', '1534903348');
INSERT INTO `osc_order_history` VALUES ('6', '6', '3', '0', '', '1534904356');
INSERT INTO `osc_order_history` VALUES ('7', '7', '3', '0', '', '1534995650');
INSERT INTO `osc_order_history` VALUES ('8', '8', '3', '0', '', '1534995892');
INSERT INTO `osc_order_history` VALUES ('9', '9', '3', '0', '', '1535007535');
INSERT INTO `osc_order_history` VALUES ('10', '10', '3', '0', '', '1535007581');
INSERT INTO `osc_order_history` VALUES ('11', '11', '3', '0', '', '1535534381');
INSERT INTO `osc_order_history` VALUES ('12', '12', '3', '0', '', '1535534405');
INSERT INTO `osc_order_history` VALUES ('13', '13', '3', '0', '', '1535534515');
INSERT INTO `osc_order_history` VALUES ('14', '14', '3', '0', '', '1535534576');

-- ----------------------------
-- Table structure for osc_order_option
-- ----------------------------
DROP TABLE IF EXISTS `osc_order_option`;
CREATE TABLE `osc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `order_goods_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_order_option
-- ----------------------------
INSERT INTO `osc_order_option` VALUES ('1', '1', '24', '1', '1', '7', '口味', '巧克力', 'checkbox');
INSERT INTO `osc_order_option` VALUES ('2', '1', '24', '1', '1', '9', '口味', '柠檬', 'checkbox');
INSERT INTO `osc_order_option` VALUES ('3', '1', '24', '1', '2', '20', '颜色', '白色', 'radio');
INSERT INTO `osc_order_option` VALUES ('4', '2', '24', '2', '1', '7', '口味', '巧克力', 'checkbox');
INSERT INTO `osc_order_option` VALUES ('5', '2', '24', '2', '2', '20', '颜色', '', 'radio');
INSERT INTO `osc_order_option` VALUES ('6', '2', '24', '3', '1', '7', '口味', '巧克力', 'checkbox');
INSERT INTO `osc_order_option` VALUES ('7', '2', '24', '3', '2', '22', '颜色', '', 'radio');

-- ----------------------------
-- Table structure for osc_order_status
-- ----------------------------
DROP TABLE IF EXISTS `osc_order_status`;
CREATE TABLE `osc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='订单状态';

-- ----------------------------
-- Records of osc_order_status
-- ----------------------------
INSERT INTO `osc_order_status` VALUES ('1', '已付款待发货');
INSERT INTO `osc_order_status` VALUES ('3', '待付款');
INSERT INTO `osc_order_status` VALUES ('4', '已发货');
INSERT INTO `osc_order_status` VALUES ('5', '取消订单');

-- ----------------------------
-- Table structure for osc_order_total
-- ----------------------------
DROP TABLE IF EXISTS `osc_order_total`;
CREATE TABLE `osc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_order_total
-- ----------------------------
INSERT INTO `osc_order_total` VALUES ('1', '1', 'sub_total', '商品价格', '￥22.2', '22.20', '0');
INSERT INTO `osc_order_total` VALUES ('2', '1', 'shipping', '运费', '￥0.01', '0.01', '0');
INSERT INTO `osc_order_total` VALUES ('3', '1', 'total', '总价', '￥22.21', '22.21', '0');
INSERT INTO `osc_order_total` VALUES ('4', '2', 'sub_total', '商品价格', '￥29.4', '29.40', '0');
INSERT INTO `osc_order_total` VALUES ('5', '2', 'shipping', '运费', '￥0.01', '0.01', '0');
INSERT INTO `osc_order_total` VALUES ('6', '2', 'total', '总价', '￥29.41', '29.41', '0');
INSERT INTO `osc_order_total` VALUES ('7', '3', 'sub_total', '商品价格', '￥30', '30.00', '0');
INSERT INTO `osc_order_total` VALUES ('8', '3', 'shipping', '运费', '￥0.01', '0.01', '0');
INSERT INTO `osc_order_total` VALUES ('9', '3', 'total', '总价', '￥30.01', '30.01', '0');
INSERT INTO `osc_order_total` VALUES ('10', '4', 'sub_total', '商品价格', '￥30', '30.00', '0');
INSERT INTO `osc_order_total` VALUES ('11', '4', 'shipping', '运费', '￥0.01', '0.01', '0');
INSERT INTO `osc_order_total` VALUES ('12', '4', 'total', '总价', '￥30.01', '30.01', '0');
INSERT INTO `osc_order_total` VALUES ('13', '5', 'sub_total', '商品价格', '￥30', '30.00', '0');
INSERT INTO `osc_order_total` VALUES ('14', '5', 'shipping', '运费', '￥0.01', '0.01', '0');
INSERT INTO `osc_order_total` VALUES ('15', '5', 'total', '总价', '￥30.01', '30.01', '0');
INSERT INTO `osc_order_total` VALUES ('16', '6', 'sub_total', '商品价格', '￥30', '30.00', '0');
INSERT INTO `osc_order_total` VALUES ('17', '6', 'shipping', '运费', '￥0.01', '0.01', '0');
INSERT INTO `osc_order_total` VALUES ('18', '6', 'total', '总价', '￥30.01', '30.01', '0');
INSERT INTO `osc_order_total` VALUES ('19', '7', 'sub_total', '商品价格', '￥0.2', '0.20', '0');
INSERT INTO `osc_order_total` VALUES ('20', '7', 'shipping', '运费', '￥', '0.00', '0');
INSERT INTO `osc_order_total` VALUES ('21', '7', 'total', '总价', '￥0.2', '0.20', '0');
INSERT INTO `osc_order_total` VALUES ('22', '8', 'sub_total', '商品价格', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('23', '8', 'shipping', '运费', '￥', '0.00', '0');
INSERT INTO `osc_order_total` VALUES ('24', '8', 'total', '总价', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('25', '9', 'sub_total', '商品价格', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('26', '9', 'shipping', '运费', '￥', '0.00', '0');
INSERT INTO `osc_order_total` VALUES ('27', '9', 'total', '总价', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('28', '10', 'sub_total', '商品价格', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('29', '10', 'shipping', '运费', '￥', '0.00', '0');
INSERT INTO `osc_order_total` VALUES ('30', '10', 'total', '总价', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('31', '11', 'sub_total', '商品价格', '￥0.2', '0.20', '0');
INSERT INTO `osc_order_total` VALUES ('32', '11', 'shipping', '运费', '￥', '0.00', '0');
INSERT INTO `osc_order_total` VALUES ('33', '11', 'total', '总价', '￥0.2', '0.20', '0');
INSERT INTO `osc_order_total` VALUES ('34', '12', 'sub_total', '商品价格', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('35', '12', 'shipping', '运费', '￥', '0.00', '0');
INSERT INTO `osc_order_total` VALUES ('36', '12', 'total', '总价', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('37', '13', 'sub_total', '商品价格', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('38', '13', 'shipping', '运费', '￥', '0.00', '0');
INSERT INTO `osc_order_total` VALUES ('39', '13', 'total', '总价', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('40', '14', 'sub_total', '商品价格', '￥0.1', '0.10', '0');
INSERT INTO `osc_order_total` VALUES ('41', '14', 'shipping', '运费', '￥', '0.00', '0');
INSERT INTO `osc_order_total` VALUES ('42', '14', 'total', '总价', '￥0.1', '0.10', '0');

-- ----------------------------
-- Table structure for osc_points
-- ----------------------------
DROP TABLE IF EXISTS `osc_points`;
CREATE TABLE `osc_points` (
  `points_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_num_alias` varchar(64) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `description` varchar(64) DEFAULT NULL,
  `prefix` int(5) NOT NULL DEFAULT '0' COMMENT '1增加，2减少',
  `creat_time` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.下单2.管理员操作',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`points_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分记录';

-- ----------------------------
-- Records of osc_points
-- ----------------------------

-- ----------------------------
-- Table structure for osc_problem
-- ----------------------------
DROP TABLE IF EXISTS `osc_problem`;
CREATE TABLE `osc_problem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `content` text COMMENT '内容',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_id` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_problem
-- ----------------------------

-- ----------------------------
-- Table structure for osc_product
-- ----------------------------
DROP TABLE IF EXISTS `osc_product`;
CREATE TABLE `osc_product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `series` varchar(128) NOT NULL COMMENT '产品系列',
  `productpic` varchar(255) NOT NULL COMMENT '产品缩略图',
  `price` decimal(10,2) NOT NULL COMMENT '价格(元/小时)',
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_product
-- ----------------------------
INSERT INTO `osc_product` VALUES ('2', 'PF-2000A', 'images/osc1/232323434.jpg', '200.00', '10');
INSERT INTO `osc_product` VALUES ('3', 'PS-9000A', 'images/osc1/1111212121212.jpg', '100.00', '1');
INSERT INTO `osc_product` VALUES ('4', 'PS-6000A', 'images/osc1/1111212121212.jpg', '100.00', '10');

-- ----------------------------
-- Table structure for osc_product_shop
-- ----------------------------
DROP TABLE IF EXISTS `osc_product_shop`;
CREATE TABLE `osc_product_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `let_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出租价格',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0禁用',
  `usertime` int(11) NOT NULL DEFAULT '0',
  `recharge_total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累积充值金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商家产品表';

-- ----------------------------
-- Records of osc_product_shop
-- ----------------------------
INSERT INTO `osc_product_shop` VALUES ('2', '2', '10', '201.00', '1', '1541403976', '0.00');
INSERT INTO `osc_product_shop` VALUES ('3', '4', '8', '21.00', '1', '1541347200', '0.00');

-- ----------------------------
-- Table structure for osc_project
-- ----------------------------
DROP TABLE IF EXISTS `osc_project`;
CREATE TABLE `osc_project` (
  `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) NOT NULL DEFAULT '' COMMENT '项目名称',
  `project_number` varchar(20) NOT NULL DEFAULT '' COMMENT '项目编号',
  `classify_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目分类',
  `number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `unit` varchar(10) NOT NULL DEFAULT '' COMMENT '单位',
  `bar_code` varchar(20) NOT NULL DEFAULT '' COMMENT '条码',
  `balance_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '结算方式',
  `content` varchar(10000) NOT NULL DEFAULT '' COMMENT '需求详情',
  `username` varchar(25) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '联系方式',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截止竞价日期',
  `is_audit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核通过',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `brand` varchar(25) NOT NULL DEFAULT '' COMMENT '品牌',
  `after_sale_service` varchar(155) NOT NULL DEFAULT '' COMMENT '售后服务',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `province` varchar(25) NOT NULL DEFAULT '',
  `city` varchar(25) NOT NULL DEFAULT '',
  `county_area` varchar(25) NOT NULL DEFAULT '',
  `bid_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '中标者id',
  `bid_price` decimal(16,2) unsigned NOT NULL DEFAULT '0.00',
  `bid_reason` varchar(155) NOT NULL DEFAULT '' COMMENT '中标原因',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_project
-- ----------------------------
INSERT INTO `osc_project` VALUES ('20', '采购新鲜牛奶50000L项目', 'M1234567890123', '20', '50000', 'L', '1234567890123', '0', '&lt;p&gt;使用事务处理的话，需要数据库引擎支持事务处理。比如 MySQL 的 MyISAM 不支持事务处理，需要使用 InnoDB 引擎。&lt;/p&gt;\r\n\r\n&lt;p&gt;使用 transaction 方法操作数据库事务，当发生异常会自动回滚，例如：&lt;/p&gt;\r\n\r\n&lt;p&gt;自动控制事务处理&lt;/p&gt;\r\n', '萧峰', '13543121642', '1546617599', '0', '1546591756', '0', '伊利', 'ThinkPHP是一个免费开源的，快速、简单的面向对象的轻量级PHP开发框架，是为了敏捷WEB应用开发和简化企业应用开发而诞生的。ThinkPHP从诞生以来一直秉承简洁实用的设计原则，在保持出色的性能和至简的代码的同时，也注重易用性。遵循Apache2开源许可协议发布，意味着你可以免费使用Think', '0', '广东省', '广州市', '天河区', '0', '0.00', '');
INSERT INTO `osc_project` VALUES ('21', '大量采购新鲜鸡肉5000斤', 'M1234567890123', '2', '5000', '斤', '1234567890123', '0', '&lt;p&gt;&lt;span style=&quot;color:rgb(82, 82, 82); font-size:15px&quot;&gt;ThinkPHP是一个免费开源的，快速、简单的面向对象的轻量级PHP开发框架，是为了敏捷WEB应用开发和简化企业应用开发而诞生的。ThinkPHP从诞生以来一直秉承简洁实用的设计原则，在保持出色的性能和至简的代码的同时，也注重易用性。遵循&lt;/span&gt;Apache2&lt;span style=&quot;color:rgb(82, 82, 82); font-size:15px&quot;&gt;开源许可协议发布，意味着你可以免费使用ThinkPHP，甚至允许把你基于ThinkPHP开发的应用开源或商业产品发布/销售。&lt;/span&gt;&lt;/p&gt;\r\n', '虚竹', '18027259825', '1546703999', '0', '1546591964', '0', '钱大妈', '我们的团队10年来一直在坚持不懈地努力，并坚持开源和免费提供使用，帮助开发人员更加方便的进行WEB应用的快速开发，如果您对我们的成果表示认同并且觉得对你有所帮助我们愿意接受来自各方面的捐赠^_^。', '0', '广东省', '广州市', '天河区', '10', '0.00', '竞标价格最低！');
INSERT INTO `osc_project` VALUES ('22', '采购新鲜牛奶5000L项目', 'M1234567890123', '27', '5000', 'L', '1234567890123', '0', '&lt;p&gt;&amp;nbsp; 额外夫为恶&lt;/p&gt;\r\n', '朱昌豪', '13543121642', '1547135999', '0', '1546596493', '0', '伊利', '我们的团队10年来一直在坚持不懈地努力，并坚持开源和免费提供使用。', '1550050513', '广东省', '广州市', '天河区', '0', '0.00', '');
INSERT INTO `osc_project` VALUES ('23', '采购新鲜牛奶10000L项目', 'M1234567890123', '26', '10000', 'L', '1234567890123', '0', '&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;span style=&quot;color:rgb(82, 82, 82); font-size:15px&quot;&gt;您的帮助是对我们最大的支持和动力！您的帮助是对我们最大的支持和动力！您的帮助是对我们最大的支持和动力！您的帮助是对我们最大的支持和动力！您的帮助是对我们最大的支持和动力！您的帮助是对我们最大的支持和动力！您的帮助是对我们最大的支持和动力！&lt;/span&gt;&lt;/p&gt;\r\n', '段誉', '13543121654', '1548431999', '0', '1546596729', '1', '伊利', '您的帮助是对我们最大的支持和动力！', '1550050496', '北京市', '市辖区', '东城区', '11', '0.00', '截止目前为止，竞价价格最低！');
INSERT INTO `osc_project` VALUES ('24', '采购新鲜牛奶20000L项目', 'M1234567890123', '20', '20000', 'L', '1234567890123', '0', '&lt;p&gt;Switch 聚焦时不显示轮廓，#12771&lt;/p&gt;\r\n\r\n&lt;p&gt;修复 Dropdown 在 ButtonGroup 中样式问题，#12819&amp;nbsp;（by&amp;nbsp;@bluejfox）&lt;/p&gt;\r\n\r\n&lt;p&gt;Dialog 新增 opened 事件，#12828&lt;/p&gt;\r\n\r\n&lt;p&gt;修复 TabNav 显示顺序不正确的问题，#12846&lt;/p&gt;\r\n\r\n&lt;p&gt;修复 Tabs 没有滑动到选中 tab 的问题，#12948&lt;/p&gt;\r\n\r\n&lt;p&gt;修复 Tree 节点在拖拽时标识符不显示的问题，#12854&lt;/p&gt;\r\n\r\n&lt;p&gt;Form 的 validate 事件参数中包含了校验的信息，#12860&amp;nbsp;（by&amp;nbsp;@YamenSharaf）&lt;/p&gt;\r\n\r\n&lt;p&gt;修复 DatePicker 没有校验用户输入时间的合法性问题，#12898&lt;/p&gt;\r\n\r\n&lt;p&gt;修复 Table 表头的&amp;nbsp;render-header属性不生效的问题，#12914&lt;/p&gt;\r\n', '郭襄', '13543121666', '1548431999', '0', '1546602363', '0', '蒙牛', '惰性加载，及路由、配置和自动加载的缓存机制；', '0', '北京市', '市辖区', '朝阳区', '11', '0.00', '竞标价格最低！');
INSERT INTO `osc_project` VALUES ('25', '采购大量新鲜牛奶100000L', 'M1234567890123', '20', '100000', 'L', '1234567890123', '0', '&lt;p&gt;&lt;span style=&quot;color:rgb(68, 68, 68); font-size:15px&quot;&gt;iView admin是基于Vue.js，搭配使用&lt;/span&gt;iView&lt;span style=&quot;color:rgb(68, 68, 68); font-size:15px&quot;&gt;&amp;nbsp;UI组件库形成的一套后台集成解决方案，由TalkingData前端可视化团队部分成员开发维护。iView admin遵守iView设计和开发约定，风格统一，设计考究，并且更多功能在不停开发中。&lt;/span&gt;&lt;/p&gt;\r\n', '安安', '18027259826', '1546876799', '0', '1546851175', '0', '伊利', 'Layui 是一款带着浓烈情怀的前端UI框架，她追求极简，又不失丰盈的内在，说她是史上最轻量的结晶，似乎并不为过。一切都源自于她对原生态的执着，对前端社区的那些噪杂声音的过滤，以及她本身的精心雕琢。', '0', '广东省', '广州市', '天河区', '0', '0.00', '');
INSERT INTO `osc_project` VALUES ('26', '采购新鲜牛奶25000L项目', 'M1234567890123', '20', '25000', 'L', '1234567890123', '0', '&lt;p&gt;大厦风格但是&lt;/p&gt;\r\n', '朱昌豪', '13543121642', '1547049599', '0', '1546937894', '1', '伊利', '使得公司的', '0', '北京市', '市辖区', '东城区', '11', '7.50', '单价最低~~~');
INSERT INTO `osc_project` VALUES ('27', '采购新鲜牛奶35000L项目', 'M1234567890123', '20', '35000', 'L', '1234567890123', '0', '&lt;p&gt;读书方法撒旦发&lt;/p&gt;\r\n', '朱昌豪', '13543121642', '1550159999', '0', '1550052115', '0', '伊利', '好办法一个家庭公寓建设费', '0', '湖南省', '长沙市', '望城县', '9', '35.56', '竞价最低!');
INSERT INTO `osc_project` VALUES ('28', '采购新鲜牛肉1000斤', 'M1234567890123', '13', '1000', '斤', '1234567890123', '0', '&lt;p&gt;&lt;span style=&quot;background-color:rgb(248, 248, 248); font-size:17px&quot;&gt;对于 WordPress ，Drupal， Joomla 到底选哪个这个问题，我不再中立，这可能会伤害到一些朋友的心情，简言之，尽可能的选择 WordPress 与 Drupal，放弃 Joomla 。放弃 Joomla 是自己使用的经验。对于一般的用户来说，WordPress 与 Drupal 是更好的选择。&lt;/span&gt;&lt;/p&gt;\r\n', '朱昌豪', '13543121642', '1547654399', '0', '1546970710', '0', '钱大妈', '在当时，第一次接触到像 Joomla 这样的系统，对比国内的软件， Joomla 的管理界面简直太棒了，并且它的功能也让我感到震惊，居然能在后台直接安装扩展，这在当时前所未见，还能指定模块的显示位置，还有显示的页面，特兴奋。', '0', '广东省', '广州市', '天河区', '0', '0.00', '');
INSERT INTO `osc_project` VALUES ('29', '采购新鲜牛肉1500斤', 'M1234567890123', '13', '1500', '斤', '1234567890123', '0', '&lt;p&gt;&lt;span style=&quot;background-color:rgb(248, 248, 248); font-size:17px&quot;&gt;就是在这一年前后，&lt;/span&gt;我计划跟朋友开个公司&lt;span style=&quot;background-color:rgb(248, 248, 248); font-size:17px&quot;&gt;，在开公司的前后接触到了 Drupal 。当时是 Drupal 6 ，之前我也听说过 Drupal ，但从末真正了解过，去过 Drupal 的官方网站，也觉得不好看，所以放弃了试用 Drupal 的想法。后来因为要做一个特殊的网站，比较复杂，听说 Drupal 可以解决这些问题，从那开始学习 Drupal 。&lt;/span&gt;&lt;/p&gt;\r\n', '萧峰', '18027259825', '1548431999', '0', '1546970822', '0', '钱大妈', '接触 Joomla 是从它的前身 Mambo 开始的，后来 Joomla 诞生了，第一个版本的 Joomla 其实就是 Mambo 换了个名字，Joomla 的诞生应该是 Mambo 团队的内部矛盾。刚开始，切换到 Joomla 也有一些犹豫，后来还是选了 Joomla ，选择它的原因不详。', '0', '山东省', '济南市', '市中区', '0', '0.00', '');

-- ----------------------------
-- Table structure for osc_project_bid
-- ----------------------------
DROP TABLE IF EXISTS `osc_project_bid`;
CREATE TABLE `osc_project_bid` (
  `project_bid_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(300) NOT NULL DEFAULT '' COMMENT '驳回原因',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_bid_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_project_bid
-- ----------------------------
INSERT INTO `osc_project_bid` VALUES ('36', '27', '11', '1546968141', '50.00', '0', '', '0');
INSERT INTO `osc_project_bid` VALUES ('37', '27', '9', '1546968198', '35.56', '1', '竞价最低!', '1546968275');
INSERT INTO `osc_project_bid` VALUES ('38', '26', '11', '1546969608', '7.50', '1', '单价最低~~~', '1546969627');
INSERT INTO `osc_project_bid` VALUES ('39', '26', '9', '1546969478', '9.50', '0', '', '0');
INSERT INTO `osc_project_bid` VALUES ('40', '26', '12', '1546969503', '9.00', '0', '', '0');

-- ----------------------------
-- Table structure for osc_project_collect
-- ----------------------------
DROP TABLE IF EXISTS `osc_project_collect`;
CREATE TABLE `osc_project_collect` (
  `project_collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_collect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_project_collect
-- ----------------------------
INSERT INTO `osc_project_collect` VALUES ('30', '27', '11', '1546968146');
INSERT INTO `osc_project_collect` VALUES ('31', '27', '9', '1546968213');
INSERT INTO `osc_project_collect` VALUES ('32', '26', '11', '1546968908');
INSERT INTO `osc_project_collect` VALUES ('33', '26', '9', '1546968929');

-- ----------------------------
-- Table structure for osc_shop
-- ----------------------------
DROP TABLE IF EXISTS `osc_shop`;
CREATE TABLE `osc_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0' COMMENT '店铺等级',
  `name` varchar(128) DEFAULT '' COMMENT '店铺名称',
  `shoppic` varchar(255) DEFAULT '' COMMENT '店铺图片',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `address` varchar(50) DEFAULT '' COMMENT '地址',
  `province` varchar(50) DEFAULT '' COMMENT '省份',
  `city` varchar(50) DEFAULT '',
  `area` varchar(50) DEFAULT '' COMMENT '区/县',
  `longitude` varchar(50) DEFAULT '' COMMENT '经度',
  `latitude` varchar(50) DEFAULT '' COMMENT '纬度',
  `datetime` int(11) NOT NULL DEFAULT '0' COMMENT '加入时间',
  `work_up` varchar(64) NOT NULL,
  `work_off` varchar(64) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_shop
-- ----------------------------
INSERT INTO `osc_shop` VALUES ('8', '4', '0', '智摄宝水荫路店', '', '1', '020-82510480', '广州市越秀区水荫路35号6栋101室', '', '', '', null, null, '1539831545', '10:00', '17:00', '10');
INSERT INTO `osc_shop` VALUES ('10', '10', '0', '测试商家', '', '1', '15099859030', '详细', '安徽', '蚌埠市', '蚌山区', null, null, '1539152156', '08:00', '17:00', '0');
INSERT INTO `osc_shop` VALUES ('9', '2', '0', 'name', '', '1', '', '', '---省---', '---市---', '---区/县---', null, null, '1539152168', '', '', '0');
INSERT INTO `osc_shop` VALUES ('11', '120', '0', 'ces', '', '1', '18319929076', '广东省深圳市南山区蛇口美年广场4栋102', '---省---', '---市---', '---区/县---', null, null, '1539222774', '09:30', '22:25', '12');

-- ----------------------------
-- Table structure for osc_shop_level
-- ----------------------------
DROP TABLE IF EXISTS `osc_shop_level`;
CREATE TABLE `osc_shop_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `buy_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '升级条件（充值金额）',
  `buy_totalmoney` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '升级条件（累积充值金额）',
  `rebate` decimal(10,2) NOT NULL DEFAULT '10.00' COMMENT '享受权益（充值折扣）',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `people` int(11) NOT NULL DEFAULT '0' COMMENT '人数',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `description` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of osc_shop_level
-- ----------------------------
INSERT INTO `osc_shop_level` VALUES ('1', '普通会员', '0.00', '0.00', '10.00', '0', '0', '1', '0');
INSERT INTO `osc_shop_level` VALUES ('2', '白银会员', '5000.00', '0.00', '8.80', '0', '0', '1', '0');
INSERT INTO `osc_shop_level` VALUES ('3', '黄金店铺', '15000.00', '0.00', '7.70', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for osc_sms
-- ----------------------------
DROP TABLE IF EXISTS `osc_sms`;
CREATE TABLE `osc_sms` (
  `sms_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` char(11) NOT NULL DEFAULT '',
  `code` char(4) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_use` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1新增 2找回或重置',
  PRIMARY KEY (`sms_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_sms
-- ----------------------------
INSERT INTO `osc_sms` VALUES ('33', '13543121642', '9292', '1546054405', '0', '1');
INSERT INTO `osc_sms` VALUES ('34', '13543121642', '4156', '1546055123', '0', '1');
INSERT INTO `osc_sms` VALUES ('35', '13543121642', '5263', '1546055473', '0', '1');
INSERT INTO `osc_sms` VALUES ('36', '13543121642', '5797', '1546055819', '0', '1');
INSERT INTO `osc_sms` VALUES ('37', '13543121642', '6272', '1546056005', '0', '1');
INSERT INTO `osc_sms` VALUES ('38', '13543121642', '9186', '1546058897', '0', '1');
INSERT INTO `osc_sms` VALUES ('39', '13543121642', '6577', '1546430432', '0', '1');
INSERT INTO `osc_sms` VALUES ('40', '13543121642', '2965', '1546433155', '0', '1');
INSERT INTO `osc_sms` VALUES ('41', '18566226261', '9556', '1546573009', '0', '1');
INSERT INTO `osc_sms` VALUES ('42', '18027259825', '5708', '1546573428', '0', '1');
INSERT INTO `osc_sms` VALUES ('43', '13543121642', '2672', '1546677224', '0', '1');
INSERT INTO `osc_sms` VALUES ('44', '13543121642', '5493', '1546677297', '0', '1');
INSERT INTO `osc_sms` VALUES ('45', '13543121642', '8221', '1546677328', '0', '1');
INSERT INTO `osc_sms` VALUES ('46', '13543121642', '7649', '1546687128', '1', '1');
INSERT INTO `osc_sms` VALUES ('47', '18566226261', '6991', '1546677684', '0', '1');
INSERT INTO `osc_sms` VALUES ('48', '18566226261', '4338', '1546683209', '0', '1');

-- ----------------------------
-- Table structure for osc_store
-- ----------------------------
DROP TABLE IF EXISTS `osc_store`;
CREATE TABLE `osc_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  `image` varchar(75) NOT NULL DEFAULT '',
  `address` varchar(55) NOT NULL DEFAULT '',
  `tel` varchar(15) NOT NULL DEFAULT '',
  `email` varchar(35) NOT NULL DEFAULT '',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_id` int(10) unsigned NOT NULL DEFAULT '0',
  `update_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_store
-- ----------------------------
INSERT INTO `osc_store` VALUES ('1', '昌大昌高州店', 'images/osc1/pic2.jpg', '高州市桂园路33号康泰又一城', '0668-6680222', 'yjccw@china-mart.com.cn', '15', '1545905393', '1545910338', '1', '1');
INSERT INTO `osc_store` VALUES ('4', '昌大昌高州店', 'images/osc1/pic2.jpg', '高州市桂园路33号康泰又一城', '0668-6680222', 'yjccw@china-mart.com.cn', '17', '1545909976', '1545910342', '1', '1');
INSERT INTO `osc_store` VALUES ('5', '昌大昌高州店23', 'images/osc1/pic3.jpg', '高州市桂园路33号康泰又一城', '0668-6680222', 'yjccw@china-mart.com.cn', '0', '1545964135', '0', '1', '0');
INSERT INTO `osc_store` VALUES ('6', '趣士多', 'images/osc1/pic4.jpg', '高州市桂园路33号康泰又一城', '0668-6680222', 'yjccw@china-mart.com.cn', '0', '1546597182', '0', '1', '0');

-- ----------------------------
-- Table structure for osc_supplier_collect
-- ----------------------------
DROP TABLE IF EXISTS `osc_supplier_collect`;
CREATE TABLE `osc_supplier_collect` (
  `supplier_collect_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplier_collect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_supplier_collect
-- ----------------------------

-- ----------------------------
-- Table structure for osc_test
-- ----------------------------
DROP TABLE IF EXISTS `osc_test`;
CREATE TABLE `osc_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text,
  `create_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调试测试';

-- ----------------------------
-- Records of osc_test
-- ----------------------------

-- ----------------------------
-- Table structure for osc_token
-- ----------------------------
DROP TABLE IF EXISTS `osc_token`;
CREATE TABLE `osc_token` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `dateline` int(11) NOT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_token
-- ----------------------------
INSERT INTO `osc_token` VALUES ('1', '3', '4ae1f1e5809b87fc720c688db921b2d3', '1537345262');
INSERT INTO `osc_token` VALUES ('2', '1', 'aada298fdc5024eb7ef0518bd1879326', '1537354420');
INSERT INTO `osc_token` VALUES ('3', '4', 'afdc170dc02b45b7d5a372344abaf2c3', '1537346768');
INSERT INTO `osc_token` VALUES ('4', '5', 'e762c19fe4f3be7fc0024e1c9789b507', '1537354525');
INSERT INTO `osc_token` VALUES ('5', '6', 'ba98328e87670aee52cfae0123165609', '1537354373');
INSERT INTO `osc_token` VALUES ('6', '7', '3c1baab7913e1d12e0f0e53a61de61a0', '1537332067');
INSERT INTO `osc_token` VALUES ('7', '8', '4bdc5b4be5f1ff3017ecbd51ba1024d9', '1534997547');
INSERT INTO `osc_token` VALUES ('8', '9', '282bc1147b3a41a33c954b3ab884b686', '1537354808');
INSERT INTO `osc_token` VALUES ('9', '10', '3ab636004e9cd76d4007ea5ef1f50a12', '1537354887');
INSERT INTO `osc_token` VALUES ('10', '11', '6425b3f6a7fade7a632762e18f217d6e', '1535005047');
INSERT INTO `osc_token` VALUES ('11', '12', 'df485610b7ce42322d3405404531fdd6', '1537355138');
INSERT INTO `osc_token` VALUES ('12', '13', 'a653a032cf68f15572bea8e7d9b77b9c', '1535100286');
INSERT INTO `osc_token` VALUES ('13', '14', '5dcfa099f886325def845d30cd7d0496', '1535178097');
INSERT INTO `osc_token` VALUES ('14', '15', '986884ee521c39e68d4edcb8d8111e87', '1536919871');
INSERT INTO `osc_token` VALUES ('15', '16', 'f04343c2b4a0b6d751424f947cba17ed', '1537355380');
INSERT INTO `osc_token` VALUES ('16', '17', 'c9264dd0dc59f115fe1eaa6c2244bbaf', '1535743077');
INSERT INTO `osc_token` VALUES ('17', '19', '6989ac6d4c797ceb8b0f795c0bbd5f52', '1535215422');
INSERT INTO `osc_token` VALUES ('18', '20', '836ee99e924c371e7caaf52ab7fdf232', '1537355695');
INSERT INTO `osc_token` VALUES ('19', '21', 'bc622eab8b4ed52aa2f70d996dbffc7c', '1540889941');
INSERT INTO `osc_token` VALUES ('20', '22', '0fa03f95e26853f98a2afbc33eae9a51', '1539686861');
INSERT INTO `osc_token` VALUES ('21', '23', '507a27883856de7c8dae1940f1fe251f', '1537355866');
INSERT INTO `osc_token` VALUES ('22', '24', 'ee59cdb17e6c2ac6edf4b0825037b9dd', '1541133701');
INSERT INTO `osc_token` VALUES ('23', '25', '1bc1c1606f7c8f5b6419fabc3ef96d47', '1540886193');
INSERT INTO `osc_token` VALUES ('24', '26', 'd701e0ec652127e98719567a8b9182c2', '1539501845');
INSERT INTO `osc_token` VALUES ('25', '27', '8d87626e31ef7b453261dee1c818f0c5', '1541049905');
INSERT INTO `osc_token` VALUES ('26', '28', 'd6754dbb36c082096191093de0792175', '1538121222');
INSERT INTO `osc_token` VALUES ('27', '30', '14c9400255421dd56911168b66fb5487', '1539165810');
INSERT INTO `osc_token` VALUES ('28', '31', '094e46ec9162cf0b61e26a69be2387d1', '1540638623');
INSERT INTO `osc_token` VALUES ('29', '32', '0d849aca4e0a703cdfa4e816810557cd', '1539602853');
INSERT INTO `osc_token` VALUES ('30', '35', '3d2ece3e4f954bd820f826ee101c25e0', '1540018422');
INSERT INTO `osc_token` VALUES ('31', '36', '01cd2989c122f8a1f2547e4ed54ea506', '1541010439');
INSERT INTO `osc_token` VALUES ('32', '37', '51ccafbcbcd8a0c20d33daea46b9c155', '1540025479');
INSERT INTO `osc_token` VALUES ('33', '38', '65cf949f71d380bcb2db956fbd136b3b', '1540894413');
INSERT INTO `osc_token` VALUES ('34', '39', '0bf2833383cf4f36277f45ca17ce88ec', '1540179810');
INSERT INTO `osc_token` VALUES ('35', '40', '0ab301db740a40050fb58aad39b3a692', '1540890727');
INSERT INTO `osc_token` VALUES ('36', '41', 'd4457054f7049adc08e5467a69ed7b21', '1540211627');
INSERT INTO `osc_token` VALUES ('37', '42', 'be1de15bcdb05c48602b5a6bbcac43a8', '1540211662');
INSERT INTO `osc_token` VALUES ('38', '43', 'f2a1313e6817aa8e007f6990afae57aa', '1540305260');
INSERT INTO `osc_token` VALUES ('39', '44', 'd7af6e574d5f188b5f9b08c16f74df10', '1540305435');
INSERT INTO `osc_token` VALUES ('40', '45', '0f5c6049eb5b6ee5a55e259c7cfe57bc', '1540305657');
INSERT INTO `osc_token` VALUES ('41', '46', '4ba1c3a3e0ff213ee1704b90370723d2', '1540305984');
INSERT INTO `osc_token` VALUES ('42', '47', 'ee269f4db2c3784d6e8584b1c1108b42', '1540307080');
INSERT INTO `osc_token` VALUES ('43', '48', '927b0a97e2cc61663af175922bffd96e', '1540307430');
INSERT INTO `osc_token` VALUES ('44', '49', 'c1baf0a54c9e3a91ad6a43c51bb45de5', '1540307551');
INSERT INTO `osc_token` VALUES ('45', '50', '8bf0488eed2ad7b1c5efceefa934dd55', '1540308704');
INSERT INTO `osc_token` VALUES ('46', '52', '8fb4835be360904a905e8c2cd8edabc3', '1540309097');
INSERT INTO `osc_token` VALUES ('47', '53', '41bda5e3791a928ef7f5eb39e402a349', '1540431880');
INSERT INTO `osc_token` VALUES ('48', '54', 'd205f528fafe12dd052afd0a65323e4c', '1540460587');
INSERT INTO `osc_token` VALUES ('49', '55', '0f3a3e24d383aedbaa13999131cc31e0', '1540816912');
INSERT INTO `osc_token` VALUES ('50', '56', 'eadb7330af14a195df373d794c47e045', '1540900349');
INSERT INTO `osc_token` VALUES ('51', '57', '0394d69563f646c7476d435838d48ac7', '1541063844');
INSERT INTO `osc_token` VALUES ('52', '58', 'd068555b217e30f7f589ba185debcdf5', '1540898641');
INSERT INTO `osc_token` VALUES ('53', '59', '8762a68b0b5c502328c660b1c6b758e1', '1540900552');
INSERT INTO `osc_token` VALUES ('54', '60', 'c305a83dbe396a1cb9c5f923ad67381f', '1535700199');
INSERT INTO `osc_token` VALUES ('55', '61', 'a9b8a1e54aa72761bcc56129c87f33d2', '1535751315');
INSERT INTO `osc_token` VALUES ('56', '64', '9c7e2e9926cf6d6326dc78dcca94673c', '1535802329');
INSERT INTO `osc_token` VALUES ('57', '65', 'c4164351eda43f4c404821836fe8aada', '1535816307');
INSERT INTO `osc_token` VALUES ('58', '66', 'b701b6b6c6d856b5305e75de60b72171', '1535963081');
INSERT INTO `osc_token` VALUES ('59', '67', '8dfe7ec77bc7c6e80470d1f8e37df83e', '1536050344');
INSERT INTO `osc_token` VALUES ('60', '68', 'e37dd6eea6f9f7386f1f3cea75de3aa0', '1536743170');
INSERT INTO `osc_token` VALUES ('61', '70', '48a21c8bb1b1b707950ec8c3571e1641', '1536312544');
INSERT INTO `osc_token` VALUES ('62', '71', '46404252b4a81860151f2ca2a5bbe420', '1536214292');
INSERT INTO `osc_token` VALUES ('63', '72', '388e57ddc84c59ecbb6622bf7c0ae728', '1536233582');
INSERT INTO `osc_token` VALUES ('64', '73', '062f6ef4d51fe209e5517f225042ebf6', '1536293780');
INSERT INTO `osc_token` VALUES ('65', '74', 'e562a22c888d62025ca6c89f24664b0f', '1536297297');
INSERT INTO `osc_token` VALUES ('66', '75', 'bb0fcebe5bc6e1b3ee97bf2891f4359f', '1536306369');
INSERT INTO `osc_token` VALUES ('67', '76', '94cd30439f5a6b3d237b9b3c7ee3e02f', '1536414853');
INSERT INTO `osc_token` VALUES ('68', '77', '54b85ac147ea8714070bacc56f6d4762', '1536516424');
INSERT INTO `osc_token` VALUES ('69', '78', '8a27dab73a0547ef7668425315a0b19c', '1536939541');
INSERT INTO `osc_token` VALUES ('70', '79', 'b5ab02593dbc641fbc2c8adbed8c0636', '1536576598');
INSERT INTO `osc_token` VALUES ('71', '80', '15c0c5355248d59880f55e17ad6db312', '1536634933');
INSERT INTO `osc_token` VALUES ('72', '81', '8e56f71cb031b5300d3d0dfc16ae4d68', '1536725766');
INSERT INTO `osc_token` VALUES ('73', '82', '2ba5fe2f14a07d34e054031107784bca', '1536856660');
INSERT INTO `osc_token` VALUES ('74', '83', 'b61197ca793c0ddde0453f5a0263bbdf', '1536866873');
INSERT INTO `osc_token` VALUES ('75', '84', '3ee5d91c52cdbd2cb6d042ddc6105cd5', '1536943979');
INSERT INTO `osc_token` VALUES ('76', '87', '354bb13c88bd03c3ecf83cf6578763ba', '1537295644');
INSERT INTO `osc_token` VALUES ('77', '2', '4b267ae81cf104b15cab737804b55de7', '1537354351');
INSERT INTO `osc_token` VALUES ('78', '18', 'd444bf87aa57820e6e2cfb4bab6a4e3b', '1537355630');
INSERT INTO `osc_token` VALUES ('79', '29', 'bcb66005a24caf6ee1a7eb344406c31a', '1539165767');
INSERT INTO `osc_token` VALUES ('80', '33', 'a1a64e6c5c06e356cca8bb98622ed512', '1539669666');
INSERT INTO `osc_token` VALUES ('81', '34', 'bad47a42b8377408942ee6827706f27a', '1540115847');
INSERT INTO `osc_token` VALUES ('82', '51', 'd97f9e404c22951819325af2c0e4d748', '1540308916');

-- ----------------------------
-- Table structure for osc_transport
-- ----------------------------
DROP TABLE IF EXISTS `osc_transport`;
CREATE TABLE `osc_transport` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `title` varchar(30) DEFAULT NULL COMMENT '运费模板名称',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='运费模板';

-- ----------------------------
-- Records of osc_transport
-- ----------------------------
INSERT INTO `osc_transport` VALUES ('1', '圆通', '1473319103');

-- ----------------------------
-- Table structure for osc_transport_extend
-- ----------------------------
DROP TABLE IF EXISTS `osc_transport_extend`;
CREATE TABLE `osc_transport_extend` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板扩展ID',
  `area_id` text COMMENT '市级地区ID组成的串，以，隔开，两端也有，',
  `top_area_id` text COMMENT '省级地区ID组成的串，以，隔开，两端也有，',
  `area_name` text COMMENT '地区name组成的串，以，隔开',
  `snum` mediumint(8) unsigned DEFAULT '1' COMMENT '首重',
  `sprice` decimal(10,2) DEFAULT '0.00' COMMENT '首重运费',
  `xnum` mediumint(8) unsigned DEFAULT '1' COMMENT '续重',
  `xprice` decimal(10,2) DEFAULT '0.00' COMMENT '续重运费',
  `is_default` enum('1','2') DEFAULT '2' COMMENT '是否默认运费1是2否',
  `transport_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `transport_title` varchar(60) DEFAULT NULL COMMENT '运费模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='运费模板扩展表';

-- ----------------------------
-- Records of osc_transport_extend
-- ----------------------------
INSERT INTO `osc_transport_extend` VALUES ('9', '', '', '全国', '1', '0.01', '1', '0.01', '1', '1', '圆通');
INSERT INTO `osc_transport_extend` VALUES ('10', ',11,180,181,182,183,184,185,179,178,177,175,176,14,212,213,214,215,216,217,218,219,220,221,222,12,186,187,188,189,190,191,202,192,193,194,195,196,197,198,199,200,201,10,162,163,164,165,166,167,168,169,170,171,172,173,174,9,39,15,231,232,233,234,235,236,237,238,239,230,229,228,223,224,225,226,227,5,95,106,96,97,98,99,100,101,102,103,104,105,4,84,85,86,87,88,89,90,91,92,93,94,1,36,3,83,82,81,80,73,74,75,76,77,78,79,2,40,', ',11,14,12,10,9,15,5,4,1,3,2,', '浙江,江西,安徽,江苏,上海,山东,内蒙古,山西,北京,河北,天津', '1', '0.01', '1', '0.01', '2', '1', '圆通');
INSERT INTO `osc_transport_extend` VALUES ('11', ',17,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,16,243,257,256,255,254,244,245,246,247,248,249,250,251,252,253,242,240,241,18,283,284,285,286,287,288,282,281,280,275,276,277,278,279,20,310,311,312,313,314,315,316,317,318,319,320,321,322,323,21,334,335,336,337,338,339,340,341,342,343,333,332,331,324,325,326,327,328,329,330,344,19,294,308,309,307,306,305,295,296,297,298,299,300,301,302,303,304,289,290,291,292,293,13,205,206,207,208,209,210,211,204,203,', ',17,16,18,20,21,19,13,', '湖北,河南,湖南,广西,海南,广东,福建', '1', '0.01', '1', '0.01', '2', '1', '圆通');
INSERT INTO `osc_transport_extend` VALUES ('12', ',30,474,470,471,472,473,31,489,490,491,492,488,477,478,479,480,481,482,483,484,485,486,476,475,487,29,462,463,464,465,466,467,468,469,28,451,452,453,454,455,456,457,458,459,460,450,449,448,461,27,438,439,440,441,442,443,444,445,446,447,24,406,407,408,409,410,411,412,413,414,26,431,432,433,434,435,436,437,25,426,427,428,429,430,425,424,423,415,416,417,418,419,420,421,422,23,399,400,401,402,403,404,405,398,397,386,387,388,389,390,391,392,393,394,395,396,385,22,62,', ',30,31,29,28,27,24,26,25,23,22,', '宁夏,新疆,青海,甘肃,陕西,贵州,西藏,云南,四川,重庆', '1', '0.01', '1', '0.01', '2', '1', '圆通');

-- ----------------------------
-- Table structure for osc_user
-- ----------------------------
DROP TABLE IF EXISTS `osc_user`;
CREATE TABLE `osc_user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(35) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `password` varchar(128) NOT NULL DEFAULT '',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(30) NOT NULL DEFAULT '',
  `classify_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户类别',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `bid_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参与竞价数',
  `succeed_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成交数',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '登录ip',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 封禁',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_audit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态',
  `business_license` varchar(30) NOT NULL DEFAULT '' COMMENT '营业执照',
  `supplier_name` varchar(35) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `reason` varchar(300) NOT NULL DEFAULT '' COMMENT '供应商审核不通过的原因',
  `province` varchar(25) NOT NULL DEFAULT '',
  `city` varchar(25) NOT NULL DEFAULT '',
  `county_area` varchar(25) NOT NULL DEFAULT '',
  `full_address` varchar(75) NOT NULL DEFAULT '',
  `related_data` varchar(65) NOT NULL DEFAULT '',
  `type_ids` varchar(35) NOT NULL DEFAULT '',
  `is_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `legal_person` varchar(15) NOT NULL DEFAULT '' COMMENT '法人姓名',
  `business_licence_number` varchar(20) NOT NULL DEFAULT '' COMMENT '营业执照号码',
  `organizational_code_img` varchar(255) NOT NULL DEFAULT '' COMMENT '组织机构代码',
  `certificate_img` varchar(255) NOT NULL DEFAULT '' COMMENT '税务登记证',
  `business_license_img` varchar(255) NOT NULL DEFAULT '' COMMENT '营业执照',
  `contact_address` varchar(35) NOT NULL DEFAULT '' COMMENT '商家联系地址',
  `home_page` varchar(55) NOT NULL,
  `sku_num` int(10) unsigned NOT NULL DEFAULT '0',
  `product_type` varchar(25) NOT NULL DEFAULT '' COMMENT '产品类型',
  `brand_name` varchar(20) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `is_invoice` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `seller_fund` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seller_number` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `corporation_id_number` varchar(20) NOT NULL DEFAULT '' COMMENT '法人证件号码',
  `corporation_name` varchar(15) NOT NULL DEFAULT '' COMMENT '商家法人姓名',
  `corporation_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1身份证',
  `is_update_base` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否提交基本信息 0 木有 1 提交了 0时不能竞价项目',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_user
-- ----------------------------
INSERT INTO `osc_user` VALUES ('1', '路人甲', 'MDAwMDAwMDAwMLO6e6+AebiU', '13543121661', '13543121661@163.com', '1', '/public/static/avatar/1169088.gif', '5', '2', '1545202863', '1544680399', '1545624655', '127.0.0.1', '0', '9', '1', 'E1234567890123', '供应商甲', '', '广州市', '天河区', '', '', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '0', '0', '0', '', '', '1', '0');
INSERT INTO `osc_user` VALUES ('2', '路人乙', 'MDAwMDAwMDAwMLO6e6+AebiU', '13543121643', '13543121643@163.com', '2', '/public/static/avatar/141066.gif', '6', '3', '1544680399', '1544680399', '0', '', '0', '5', '1', 'E1234567890124', '供应商乙', '', '广州市', '黄埔区', '', '', '', '', '0', '', '', '', '', '', '', '', '0', '', '', '0', '0', '0', '', '', '1', '0');
INSERT INTO `osc_user` VALUES ('3', '路人丙', 'MDAwMDAwMDAwMLO6e6+AebiU', '13543121644', '13543121644@163.com', '3', '/public/static/avatar/936999.jpg', '7', '4', '1544680399', '1544690399', '0', '', '0', '6', '1', 'E1234567890125', '供应商丙', '', '广州市', '白云区', '', '', '', '', '0', '', '', '', '', '', '', '', '0', '', '', '0', '0', '0', '', '', '1', '0');
INSERT INTO `osc_user` VALUES ('4', '路人丁', 'MDAwMDAwMDAwMLO6e6+AebiU', '13543121645', '13543121645@163.com', '4', '/public/static/avatar/user1.png', '0', '0', '1544680399', '1544889600', '0', '', '0', '12', '1', 'E1234567890126', '供应商丁', '', '广州市', '萝岗区', '', '', '', '', '1', '', '', '', '', '', '', '', '0', '', '', '0', '0', '0', '', '', '1', '0');
INSERT INTO `osc_user` VALUES ('5', '萧峰', 'MDAwMDAwMDAwMLO6e6+AebiU', '13543121646', '13543121646@163.com', '2', '/public/static/avatar/user1.jpg', '0', '0', '1544680399', '1545026482', '0', '', '1', '0', '0', 'E1234567890127', '供应商萧峰', '如果需要 &lt;label&gt; 内没有文字，输入框（input）正是你所期望的。 目前只适用于非内联的 checkbox 和 radio。 请记住，仍然需要为使用辅助技术的用户提供某种形式的 label（例如，使用 aria-label）。', '广州市', '越秀区', '', '', '', '', '0', '', '', '', '', '', '', '', '0', '', '', '0', '0', '0', '', '', '1', '0');
INSERT INTO `osc_user` VALUES ('9', '朱昌豪', 'MDAwMDAwMDAwMLO6e6+AebiU', '13543121642', '13543121642@163.com', '25', '/public/uploads/images/avatar/20181229/09631785a1a56d5e0787b66cf1b72ba7.png', '0', '1', '1546969462', '1546069424', '0', '127.0.0.1', '1', '0', '1', '', '广州市999有限公司', '', '广东省', '广州市', '天河区', '999深刻的肌肤健康', '/public/uploads/images/attachment/20181229/49a108f774b2ace3ff58b8', '', '0', '', 'test123456', '/public/uploads/images/organizational_code/20190107/f6939eea8a3c0b7af99a2360867be086.png', '/public/uploads/images/certificate/20190107/f0cd62353ca7716c751d6c6000894217.jpg', '/public/uploads/images/business_license/20190107/072a5c60dc7c889909c744c312b5540f.gif', '广州市天河区岑村9527号楼', 'www.baidu.com', '65', '食品', '666', '0', '4', '5', '441523199008156665', '黄健', '1', '1');
INSERT INTO `osc_user` VALUES ('10', '左冷禅', 'MDAwMDAwMDAwMLO6e6+AebiU', '18566226262', '18566226261@163.com', '14', '/public/uploads/images/avatar/20190104/c686116c7a734bf66770aa47efdaa164.gif', '0', '1', '1546603433', '1546573211', '0', '127.0.0.1', '1', '0', '1', '', '广州市南农有限公司', '', '广东省', '广州市', '天河区', '岑村9527号楼', '/public/uploads/images/attachment/20190104/f9ab3c1d3316bbcf2ab4e8', '', '0', '', '1234567890123', '/public/uploads/images/organizational_code/20190104/2723fd3b7432d06706a920de33bb1880.png', '/public/uploads/images/certificate/20190104/8179addd337dffd613a8ffb0e795dc0b.png', '/public/uploads/images/business_license/20190104/1203f33dd8d723125a567050d972589a.jpg', '广州市天河区岑村9527号楼', '', '65', '饮料', '优乐美', '1', '4', '5', '441523199008156313', '郭靖', '1', '1');
INSERT INTO `osc_user` VALUES ('11', '慕容复', 'MDAwMDAwMDAwMLO6e6+AebiU', '18027259825', '18027259825@189.com', '15', '/public/uploads/images/avatar/20190104/c27bc7399e9ba284999ae3e54832c5ce.jpg', '0', '5', '1546969514', '1546573591', '0', '127.0.0.1', '1', '0', '1', '', '深圳市汗滴禾下土有限公司', '测试驳回', '广东省', '深圳市', '罗湖区', '神舟路9527号楼', '/public/uploads/images/attachment/20190104/04007e458f1d1d72af9cd6', '', '0', '', '1234567890123', '/public/uploads/images/organizational_code/20190104/ded0c7fe9c2e14bb34be28ccdab64e66.png', '/public/uploads/images/certificate/20190104/41696a3d7bfdf12cdc1affbcc08788fa.gif', '/public/uploads/images/business_license/20190104/e6ca0886d6b4eef79a2b2bf934d54081.jpg', '广州市越秀区水荫路', '', '56', '农产品', '优农', '1', '3', '3', '441523111111111111', '黄健', '1', '1');
INSERT INTO `osc_user` VALUES ('12', 'lucy', 'MDAwMDAwMDAwMLO6e6+AebiU', '18566226261', '18566226261@162.com', '16', '/public/uploads/images/avatar/20190105/f2c2a345b2668d25e6f7cec5e37c0fc2.gif', '0', '0', '1546969489', '1546683252', '0', '127.0.0.1', '1', '0', '1', '', '广州粒粒收有限公司', '', '广东省', '广州市', '市辖区', '广州市天河区岑村9527号楼', '/public/uploads/images/related_data/20190105/06aa3ca64f36a2e1b27d', '', '0', '', 'CS1234567890123', '/public/uploads/images/organizational_code/20190109/3a0c54e18928f0a9b2e122bbced99b18.jpg', '/public/uploads/images/certificate/20190109/50908d34927cc2dbb99f9f2102f42999.png', '/public/uploads/images/business_license/20190109/450e6308d00af01522736bcf80ebf342.png', '广州市天河区', '', '56', '服装', 'ck plus', '1', '2', '2', '441523199008156315', '安安', '1', '1');

-- ----------------------------
-- Table structure for osc_user_action
-- ----------------------------
DROP TABLE IF EXISTS `osc_user_action`;
CREATE TABLE `osc_user_action` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `uname` varchar(40) DEFAULT NULL COMMENT '用户名',
  `type` varchar(40) DEFAULT NULL COMMENT 'frontend,backend',
  `info` varchar(255) DEFAULT NULL COMMENT '行为描述',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '加入时间',
  PRIMARY KEY (`ua_id`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8 COMMENT='用户行为';

-- ----------------------------
-- Records of osc_user_action
-- ----------------------------
INSERT INTO `osc_user_action` VALUES ('1', '1', 'admin', '后台系统用户', '登录了后台系统', '1535438512');
INSERT INTO `osc_user_action` VALUES ('2', '1', 'admin', '后台系统用户', '更新商品价格', '1535449963');
INSERT INTO `osc_user_action` VALUES ('3', '1', 'admin', '后台系统用户', '修改了后台菜单，移动端', '1535450458');
INSERT INTO `osc_user_action` VALUES ('4', '1', 'admin', '后台系统用户', '登录了后台系统', '1535503415');
INSERT INTO `osc_user_action` VALUES ('5', '1', 'admin', '后台系统用户', '修改了后台菜单，支付接口', '1535524223');
INSERT INTO `osc_user_action` VALUES ('6', '1', 'admin', '后台系统用户', '修改了后台菜单，运费模板', '1535524227');
INSERT INTO `osc_user_action` VALUES ('7', '1', 'admin', '后台系统用户', '修改了后台菜单，订单状态', '1535524261');
INSERT INTO `osc_user_action` VALUES ('8', '1', 'admin', '后台系统用户', '修改了后台菜单，订单状态', '1535524275');
INSERT INTO `osc_user_action` VALUES ('9', '1', 'admin', '后台系统用户', '编辑了会员', '1535532621');
INSERT INTO `osc_user_action` VALUES ('10', '1', 'admin', '网站会员', '登录了网站', '1535534362');
INSERT INTO `osc_user_action` VALUES ('11', '1', 'admin', '网站会员', '加入商品到购物车', '1535534370');
INSERT INTO `osc_user_action` VALUES ('12', '1', 'admin', '网站会员', '下了订单，未支付', '1535534381');
INSERT INTO `osc_user_action` VALUES ('13', '1', 'admin', '网站会员', '加入商品到购物车', '1535534391');
INSERT INTO `osc_user_action` VALUES ('14', '1', 'admin', '网站会员', '下了订单，未支付', '1535534405');
INSERT INTO `osc_user_action` VALUES ('15', '1', 'admin', '网站会员', '下了订单，未支付', '1535534515');
INSERT INTO `osc_user_action` VALUES ('16', '1', 'admin', '网站会员', '加入商品到购物车', '1535534562');
INSERT INTO `osc_user_action` VALUES ('17', '1', 'admin', '网站会员', '下了订单，未支付', '1535534576');
INSERT INTO `osc_user_action` VALUES ('18', '1', 'admin', '后台系统用户', '更新系统基本配置', '1535535573');
INSERT INTO `osc_user_action` VALUES ('19', '1', 'admin', '后台系统用户', '登录了后台系统', '1535536102');
INSERT INTO `osc_user_action` VALUES ('20', '1', 'admin', '后台系统用户', '退出了系统', '1535536130');
INSERT INTO `osc_user_action` VALUES ('21', '2', 'adminx', '后台系统用户', '登录了后台系统', '1535536137');
INSERT INTO `osc_user_action` VALUES ('22', '1', 'admin', '后台系统用户', '编辑了用户权限', '1535536178');
INSERT INTO `osc_user_action` VALUES ('23', '1', 'admin', '后台系统用户', '编辑了用户权限', '1535536209');
INSERT INTO `osc_user_action` VALUES ('24', '1', 'admin', '后台系统用户', '更新系统基本配置', '1535536388');
INSERT INTO `osc_user_action` VALUES ('25', '2', 'adminx', '后台系统用户', '退出了系统', '1535536392');
INSERT INTO `osc_user_action` VALUES ('26', '1', 'admin', '后台系统用户', '登录了后台系统', '1535538900');
INSERT INTO `osc_user_action` VALUES ('27', '1', 'admin', '后台系统用户', '添加了后台菜单，游戏', '1535539116');
INSERT INTO `osc_user_action` VALUES ('28', '1', 'admin', '后台系统用户', '修改了后台菜单，游戏', '1535539144');
INSERT INTO `osc_user_action` VALUES ('29', '1', 'admin', '后台系统用户', '删除了后台菜单，id=339', '1535539204');
INSERT INTO `osc_user_action` VALUES ('30', '1', 'admin', '后台系统用户', '登录了后台系统', '1535611544');
INSERT INTO `osc_user_action` VALUES ('31', '1', 'admin', '后台系统用户', '登录了后台系统', '1535619501');
INSERT INTO `osc_user_action` VALUES ('32', '1', 'admin', '后台系统用户', '登录了后台系统', '1535680199');
INSERT INTO `osc_user_action` VALUES ('33', '1', 'admin', '后台系统用户', '登录了后台系统', '1536046207');
INSERT INTO `osc_user_action` VALUES ('34', '1', 'admin', '后台系统用户', '登录了后台系统', '1536046218');
INSERT INTO `osc_user_action` VALUES ('35', '1', 'admin', '后台系统用户', '登录了后台系统', '1536046486');
INSERT INTO `osc_user_action` VALUES ('36', '1', 'admin', '后台系统用户', '登录了后台系统', '1536053069');
INSERT INTO `osc_user_action` VALUES ('37', '1', 'admin', '后台系统用户', '新增了蓝牙', '1536054747');
INSERT INTO `osc_user_action` VALUES ('38', '1', 'admin', '后台系统用户', '删除蓝牙', '1536054773');
INSERT INTO `osc_user_action` VALUES ('39', '1', 'admin', '后台系统用户', '编辑了蓝牙', '1536057235');
INSERT INTO `osc_user_action` VALUES ('40', '1', 'admin', '后台系统用户', '编辑了蓝牙', '1536057249');
INSERT INTO `osc_user_action` VALUES ('41', '1', 'admin', '后台系统用户', '编辑了蓝牙', '1536057253');
INSERT INTO `osc_user_action` VALUES ('42', '1', 'admin', '后台系统用户', '编辑了蓝牙', '1536057257');
INSERT INTO `osc_user_action` VALUES ('43', '1', 'admin', '后台系统用户', '编辑了蓝牙', '1536057792');
INSERT INTO `osc_user_action` VALUES ('44', '1', 'admin', '后台系统用户', '编辑了蓝牙', '1536057825');
INSERT INTO `osc_user_action` VALUES ('45', '1', 'admin', '后台系统用户', '编辑了蓝牙', '1536057944');
INSERT INTO `osc_user_action` VALUES ('46', '1', 'admin', '后台系统用户', '编辑了蓝牙', '1536058041');
INSERT INTO `osc_user_action` VALUES ('47', '1', 'admin', '后台系统用户', '登录了后台系统', '1536126981');
INSERT INTO `osc_user_action` VALUES ('48', '1', 'admin', '后台系统用户', '登录了后台系统', '1537176123');
INSERT INTO `osc_user_action` VALUES ('49', '1', 'admin', '后台系统用户', '登录了后台系统', '1537337719');
INSERT INTO `osc_user_action` VALUES ('50', '1', 'obHUf5WDUC0AMvsbVvtc0yJqHsP0', '网站会员', '注册成为会员', '1537337981');
INSERT INTO `osc_user_action` VALUES ('51', '1', 'obHUf5TvUM5teN04WCL6SYWKKCJg', '网站会员', '注册成为会员', '1537339511');
INSERT INTO `osc_user_action` VALUES ('52', '1', 'obHUf5YRRJQG7qPUR5YmeaJ8tkr0', '网站会员', '注册成为会员', '1537346887');
INSERT INTO `osc_user_action` VALUES ('53', '1', 'obHUf5fLu8JNLLrnKdH06DxhRJd0', '网站会员', '注册成为会员', '1537347032');
INSERT INTO `osc_user_action` VALUES ('54', '1', 'obHUf5fizwuaM-DYJ8-MmeyCFKcE', '网站会员', '注册成为会员', '1537347271');
INSERT INTO `osc_user_action` VALUES ('55', '1', 'admin', '后台系统用户', '修改了会员用户组状态', '1537347759');
INSERT INTO `osc_user_action` VALUES ('56', '1', 'admin', '后台系统用户', '修改了会员用户组状态', '1537347760');
INSERT INTO `osc_user_action` VALUES ('57', '1', 'admin', '后台系统用户', '更新系统基本配置', '1537347814');
INSERT INTO `osc_user_action` VALUES ('58', '1', 'admin', '后台系统用户', '更新系统基本配置', '1537348637');
INSERT INTO `osc_user_action` VALUES ('59', '1', 'admin', '后台系统用户', '登录了后台系统', '1537521949');
INSERT INTO `osc_user_action` VALUES ('60', '1', 'admin', '后台系统用户', '登录了后台系统', '1537837604');
INSERT INTO `osc_user_action` VALUES ('61', '1', 'admin', '后台系统用户', '登录了后台系统', '1537853425');
INSERT INTO `osc_user_action` VALUES ('62', '1', 'admin', '后台系统用户', '更新商品', '1537854061');
INSERT INTO `osc_user_action` VALUES ('63', '1', 'admin', '后台系统用户', '登录了后台系统', '1537857465');
INSERT INTO `osc_user_action` VALUES ('64', '1', 'admin', '后台系统用户', '登录了后台系统', '1537862699');
INSERT INTO `osc_user_action` VALUES ('65', '1', 'admin', '后台系统用户', '登录了后台系统', '1537866023');
INSERT INTO `osc_user_action` VALUES ('66', '1', 'admin', '后台系统用户', '登录了后台系统', '1537928701');
INSERT INTO `osc_user_action` VALUES ('67', '1', 'admin', '后台系统用户', '登录了后台系统', '1537930508');
INSERT INTO `osc_user_action` VALUES ('68', '1', 'admin', '后台系统用户', '登录了后台系统', '1538014365');
INSERT INTO `osc_user_action` VALUES ('69', '1', 'admin', '后台系统用户', '登录了后台系统', '1538019014');
INSERT INTO `osc_user_action` VALUES ('70', '1', 'admin', '后台系统用户', '登录了后台系统', '1538035542');
INSERT INTO `osc_user_action` VALUES ('71', '1', 'admin', '后台系统用户', '登录了后台系统', '1538117496');
INSERT INTO `osc_user_action` VALUES ('72', '1', 'admin', '后台系统用户', '登录了后台系统', '1539592642');
INSERT INTO `osc_user_action` VALUES ('73', '1', 'admin', '后台系统用户', '修改了后台菜单，商家', '1539592655');
INSERT INTO `osc_user_action` VALUES ('74', '1', 'admin', '后台系统用户', '添加了后台菜单，产品管理', '1539592691');
INSERT INTO `osc_user_action` VALUES ('75', '1', 'admin', '后台系统用户', '添加了后台菜单，预约订单', '1539594811');
INSERT INTO `osc_user_action` VALUES ('76', '1', 'admin', '后台系统用户', '修改了后台菜单，预约订单', '1539594827');
INSERT INTO `osc_user_action` VALUES ('77', '1', 'admin', '后台系统用户', '修改了产品', '1539594909');
INSERT INTO `osc_user_action` VALUES ('78', '1', 'admin', '后台系统用户', '修改了产品', '1539594919');
INSERT INTO `osc_user_action` VALUES ('79', '1', 'admin', '后台系统用户', '新增了产品', '1539594942');
INSERT INTO `osc_user_action` VALUES ('80', '1', 'admin', '后台系统用户', '修改了商家', '1539596661');
INSERT INTO `osc_user_action` VALUES ('81', '1', 'admin', '后台系统用户', '修改了商家', '1539596670');
INSERT INTO `osc_user_action` VALUES ('82', '1', 'admin', '后台系统用户', '登录了后台系统', '1539660448');
INSERT INTO `osc_user_action` VALUES ('83', '1', 'admin', '后台系统用户', '登录了后台系统', '1539741752');
INSERT INTO `osc_user_action` VALUES ('84', '1', 'admin', '后台系统用户', '修改了产品', '1539742368');
INSERT INTO `osc_user_action` VALUES ('85', '1', 'admin', '后台系统用户', '修改了产品', '1539742386');
INSERT INTO `osc_user_action` VALUES ('86', '1', 'admin', '后台系统用户', '修改了产品', '1539742410');
INSERT INTO `osc_user_action` VALUES ('87', '1', 'admin', '后台系统用户', '修改了商家', '1539742472');
INSERT INTO `osc_user_action` VALUES ('88', '1', 'admin', '后台系统用户', '登录了后台系统', '1539759601');
INSERT INTO `osc_user_action` VALUES ('89', '1', 'admin', '后台系统用户', '修改了商家', '1539759773');
INSERT INTO `osc_user_action` VALUES ('90', '1', 'admin', '后台系统用户', '登录了后台系统', '1539831532');
INSERT INTO `osc_user_action` VALUES ('91', '1', 'admin', '后台系统用户', '修改了商家', '1539831545');
INSERT INTO `osc_user_action` VALUES ('92', '1', 'admin', '后台系统用户', '登录了后台系统', '1541148807');
INSERT INTO `osc_user_action` VALUES ('93', '1', 'admin', '后台系统用户', '登录了后台系统', '1541381182');
INSERT INTO `osc_user_action` VALUES ('94', '1', 'admin', '后台系统用户', '添加了会员会员等级', '1541385339');
INSERT INTO `osc_user_action` VALUES ('95', '1', 'admin', '后台系统用户', '修改了会员用户组状态', '1541385453');
INSERT INTO `osc_user_action` VALUES ('96', '1', 'admin', '后台系统用户', '修改了会员用户组状态', '1541385459');
INSERT INTO `osc_user_action` VALUES ('97', '1', 'admin', '后台系统用户', '添加了会员会员等级', '1541385563');
INSERT INTO `osc_user_action` VALUES ('98', '1', 'admin', '后台系统用户', '添加了会员会员等级', '1541385582');
INSERT INTO `osc_user_action` VALUES ('99', '1', 'admin', '后台系统用户', '添加了商家等级', '1541386763');
INSERT INTO `osc_user_action` VALUES ('100', '1', 'admin', '后台系统用户', '修改了商家等级', '1541386843');
INSERT INTO `osc_user_action` VALUES ('101', '1', 'admin', '后台系统用户', '修改了商家等级', '1541386852');
INSERT INTO `osc_user_action` VALUES ('102', '1', 'admin', '后台系统用户', '添加了商家等级', '1541386873');
INSERT INTO `osc_user_action` VALUES ('103', '1', 'admin', '后台系统用户', '添加了商家等级', '1541387169');
INSERT INTO `osc_user_action` VALUES ('104', '1', 'admin', '后台系统用户', '添加了后台菜单，商家等级', '1541388150');
INSERT INTO `osc_user_action` VALUES ('105', '1', 'admin', '后台系统用户', '添加了后台菜单，添加商家等级', '1541388209');
INSERT INTO `osc_user_action` VALUES ('106', '1', 'admin', '后台系统用户', '添加了后台菜单，编辑商家等级', '1541388236');
INSERT INTO `osc_user_action` VALUES ('107', '1', 'admin', '后台系统用户', '添加了后台菜单，删除商家等级', '1541388250');
INSERT INTO `osc_user_action` VALUES ('108', '1', 'admin', '后台系统用户', '添加了后台菜单，会员等级', '1541388308');
INSERT INTO `osc_user_action` VALUES ('109', '1', 'admin', '后台系统用户', '添加了后台菜单，添加会员等级', '1541388324');
INSERT INTO `osc_user_action` VALUES ('110', '1', 'admin', '后台系统用户', '添加了后台菜单，编辑会员等级', '1541388332');
INSERT INTO `osc_user_action` VALUES ('111', '1', 'admin', '后台系统用户', '添加了后台菜单，删除会员等级', '1541388342');
INSERT INTO `osc_user_action` VALUES ('112', '1', 'admin', '后台系统用户', '删除了会员等级', '1541388365');
INSERT INTO `osc_user_action` VALUES ('113', '1', 'admin', '后台系统用户', '删除了后台菜单，id=344', '1541388404');
INSERT INTO `osc_user_action` VALUES ('114', '1', 'admin', '后台系统用户', '删除了后台菜单，id=348', '1541388415');
INSERT INTO `osc_user_action` VALUES ('115', '1', 'admin', '后台系统用户', '新增了产品', '1541404401');
INSERT INTO `osc_user_action` VALUES ('116', '1', 'admin', '后台系统用户', '新增了产品', '1541404479');
INSERT INTO `osc_user_action` VALUES ('117', '1', 'admin', '后台系统用户', '新增了产品', '1541404521');
INSERT INTO `osc_user_action` VALUES ('118', '1', 'admin', '后台系统用户', '删除了产品', '1541404536');
INSERT INTO `osc_user_action` VALUES ('119', '1', 'admin', '后台系统用户', '添加了后台菜单，商家产品管理', '1541470645');
INSERT INTO `osc_user_action` VALUES ('120', '1', 'admin', '后台系统用户', '添加了后台菜单，编辑商家产品', '1541470686');
INSERT INTO `osc_user_action` VALUES ('121', '1', 'admin', '后台系统用户', '添加了后台菜单，添加商家产品', '1541470784');
INSERT INTO `osc_user_action` VALUES ('122', '1', 'admin', '后台系统用户', '新增了产品', '1541471815');
INSERT INTO `osc_user_action` VALUES ('123', '1', 'admin', '后台系统用户', '修改了后台菜单，编辑会员等级', '1541580688');
INSERT INTO `osc_user_action` VALUES ('124', '1', 'admin', '后台系统用户', '修改了后台菜单，编辑会员等级', '1541580779');
INSERT INTO `osc_user_action` VALUES ('125', '1', 'admin', '后台系统用户', '登录了后台系统', '1544673578');
INSERT INTO `osc_user_action` VALUES ('126', '1', 'admin', '后台系统用户', '更新系统基本配置', '1544673918');
INSERT INTO `osc_user_action` VALUES ('127', '1', 'admin', '后台系统用户', '添加了后台菜单，用户类别', '1544680455');
INSERT INTO `osc_user_action` VALUES ('128', '1', 'admin', '后台系统用户', '修改了后台菜单，用户类别', '1544680667');
INSERT INTO `osc_user_action` VALUES ('129', '1', 'admin', '后台系统用户', '添加了后台菜单，类别列表', '1544680847');
INSERT INTO `osc_user_action` VALUES ('130', '1', 'admin', '后台系统用户', '修改了后台菜单，类别列表', '1544681995');
INSERT INTO `osc_user_action` VALUES ('131', '1', 'admin', '后台系统用户', '更新用户类别排序', '1544682707');
INSERT INTO `osc_user_action` VALUES ('132', '1', 'admin', '后台系统用户', '更新用户类别状态', '1544682710');
INSERT INTO `osc_user_action` VALUES ('133', '1', 'admin', '后台系统用户', '更新用户类别状态', '1544682712');
INSERT INTO `osc_user_action` VALUES ('134', '1', 'admin', '后台系统用户', '更新用户类别状态', '1544682873');
INSERT INTO `osc_user_action` VALUES ('135', '1', 'admin', '后台系统用户', '新增了用户类别', '1544683843');
INSERT INTO `osc_user_action` VALUES ('136', '1', 'admin', '后台系统用户', '删除用户类别5', '1544684002');
INSERT INTO `osc_user_action` VALUES ('137', '1', 'admin', '后台系统用户', '更新用户类别状态', '1544684093');
INSERT INTO `osc_user_action` VALUES ('138', '1', 'admin', '后台系统用户', '更新用户类别状态', '1544685017');
INSERT INTO `osc_user_action` VALUES ('139', '1', 'admin', '后台系统用户', '新增了用户类别', '1544685026');
INSERT INTO `osc_user_action` VALUES ('140', '1', 'admin', '后台系统用户', '新增了用户类别', '1544685091');
INSERT INTO `osc_user_action` VALUES ('141', '1', 'admin', '后台系统用户', '编辑了用户类别', '1544685161');
INSERT INTO `osc_user_action` VALUES ('142', '1', 'admin', '后台系统用户', '删除用户类别6', '1544685168');
INSERT INTO `osc_user_action` VALUES ('143', '1', 'admin', '后台系统用户', '编辑了用户类别', '1544685178');
INSERT INTO `osc_user_action` VALUES ('144', '1', 'admin', '后台系统用户', '删除用户类别7', '1544685183');
INSERT INTO `osc_user_action` VALUES ('145', '1', 'admin', '后台系统用户', '添加了后台菜单，会员管理', '1544685340');
INSERT INTO `osc_user_action` VALUES ('146', '1', 'admin', '后台系统用户', '删除了后台菜单，id=354', '1544685376');
INSERT INTO `osc_user_action` VALUES ('147', '1', 'admin', '后台系统用户', '添加了后台菜单，会员管理', '1544688937');
INSERT INTO `osc_user_action` VALUES ('148', '1', 'admin', '后台系统用户', '添加了后台菜单，供应商列表', '1544689098');
INSERT INTO `osc_user_action` VALUES ('149', '1', 'admin', '后台系统用户', '修改了后台菜单，供应商列表', '1544690045');
INSERT INTO `osc_user_action` VALUES ('150', '1', 'admin', '后台系统用户', '新增了用户类别', '1544695120');
INSERT INTO `osc_user_action` VALUES ('151', '1', 'admin', '后台系统用户', '删除用户类别8', '1544695128');
INSERT INTO `osc_user_action` VALUES ('152', '1', 'admin', '后台系统用户', '更新供应商排序', '1544695231');
INSERT INTO `osc_user_action` VALUES ('153', '1', 'admin', '后台系统用户', '更新供应商状态', '1544695234');
INSERT INTO `osc_user_action` VALUES ('154', '1', 'admin', '后台系统用户', '更新供应商状态', '1544695285');
INSERT INTO `osc_user_action` VALUES ('155', '1', 'admin', '后台系统用户', '更新供应商状态', '1544695366');
INSERT INTO `osc_user_action` VALUES ('156', '1', 'admin', '后台系统用户', '更新供应商状态', '1544695370');
INSERT INTO `osc_user_action` VALUES ('157', '1', 'admin', '后台系统用户', '更新供应商状态', '1544695373');
INSERT INTO `osc_user_action` VALUES ('158', '1', 'admin', '后台系统用户', '更新供应商排序', '1544700655');
INSERT INTO `osc_user_action` VALUES ('159', '1', 'admin', '后台系统用户', '更新供应商排序', '1544700658');
INSERT INTO `osc_user_action` VALUES ('160', '1', 'admin', '后台系统用户', '更新供应商排序', '1544700660');
INSERT INTO `osc_user_action` VALUES ('161', '1', 'admin', '后台系统用户', '添加了后台菜单，项目管理', '1544703153');
INSERT INTO `osc_user_action` VALUES ('162', '1', 'admin', '后台系统用户', '添加了后台菜单，发布项目', '1544703336');
INSERT INTO `osc_user_action` VALUES ('163', '1', 'admin', '后台系统用户', '发布了项目', '1544758649');
INSERT INTO `osc_user_action` VALUES ('164', '1', 'admin', '后台系统用户', '发布了项目', '1544760405');
INSERT INTO `osc_user_action` VALUES ('165', '1', 'admin', '后台系统用户', '发布了项目', '1544760631');
INSERT INTO `osc_user_action` VALUES ('166', '1', 'admin', '后台系统用户', '发布了项目', '1544762078');
INSERT INTO `osc_user_action` VALUES ('167', '1', 'admin', '后台系统用户', '添加了后台菜单，待审核项目列表', '1544762138');
INSERT INTO `osc_user_action` VALUES ('168', '1', 'admin', '后台系统用户', '添加了后台菜单，待审核供应商列表', '1544773513');
INSERT INTO `osc_user_action` VALUES ('169', '1', 'admin', '后台系统用户', '审核了供应商id5', '1544777450');
INSERT INTO `osc_user_action` VALUES ('170', '1', 'admin', '后台系统用户', '审核了供应商id5', '1544777509');
INSERT INTO `osc_user_action` VALUES ('171', '1', 'admin', '后台系统用户', '审核了供应商id5', '1544777579');
INSERT INTO `osc_user_action` VALUES ('172', '1', 'admin', '后台系统用户', '审核了供应商id5', '1544777673');
INSERT INTO `osc_user_action` VALUES ('173', '1', 'admin', '后台系统用户', '添加了后台菜单，竞价项目列表', '1544783117');
INSERT INTO `osc_user_action` VALUES ('174', '1', 'admin', '后台系统用户', '添加了后台菜单，竞价项目分类', '1544784578');
INSERT INTO `osc_user_action` VALUES ('175', '1', 'admin', '后台系统用户', '删除了后台菜单，id=353', '1544784682');
INSERT INTO `osc_user_action` VALUES ('176', '1', 'admin', '后台系统用户', '删除了后台菜单，id=352', '1544784685');
INSERT INTO `osc_user_action` VALUES ('177', '1', 'admin', '后台系统用户', '编辑了用户类别', '1544787173');
INSERT INTO `osc_user_action` VALUES ('178', '1', 'admin', '后台系统用户', '编辑了用户类别', '1544787178');
INSERT INTO `osc_user_action` VALUES ('179', '1', 'admin', '后台系统用户', '审核了供应商id5', '1544789225');
INSERT INTO `osc_user_action` VALUES ('180', '1', 'admin', '后台系统用户', '审核了竞价项目', '1544790454');
INSERT INTO `osc_user_action` VALUES ('181', '1', 'admin', '后台系统用户', '审核了竞价项目', '1544791822');
INSERT INTO `osc_user_action` VALUES ('182', '1', 'admin', '后台系统用户', '审核了竞价项目', '1544791832');
INSERT INTO `osc_user_action` VALUES ('183', '1', 'admin', '后台系统用户', '审核了竞价项目', '1544791835');
INSERT INTO `osc_user_action` VALUES ('184', '1', 'admin', '后台系统用户', '审核了竞价项目', '1544791969');
INSERT INTO `osc_user_action` VALUES ('185', '1', 'admin', '后台系统用户', '修改了后台菜单，商家', '1544841888');
INSERT INTO `osc_user_action` VALUES ('186', '1', 'admin', '后台系统用户', '修改了后台菜单，使用教程', '1544841894');
INSERT INTO `osc_user_action` VALUES ('187', '1', 'admin', '后台系统用户', '修改了后台菜单，优惠券', '1544841898');
INSERT INTO `osc_user_action` VALUES ('188', '1', 'admin', '后台系统用户', '修改了后台菜单，蓝牙', '1544841903');
INSERT INTO `osc_user_action` VALUES ('189', '1', 'admin', '后台系统用户', '修改了后台菜单，会员管理', '1544841909');
INSERT INTO `osc_user_action` VALUES ('190', '1', 'admin', '后台系统用户', '修改了后台菜单，商品', '1544841918');
INSERT INTO `osc_user_action` VALUES ('191', '1', 'admin', '后台系统用户', '修改了后台菜单，会员', '1544841930');
INSERT INTO `osc_user_action` VALUES ('192', '1', 'admin', '后台系统用户', '修改了后台菜单，广告', '1544841944');
INSERT INTO `osc_user_action` VALUES ('193', '1', 'admin', '后台系统用户', '修改了后台菜单，会员管理', '1544841955');
INSERT INTO `osc_user_action` VALUES ('194', '1', 'admin', '后台系统用户', '审核了竞价项目', '1544842616');
INSERT INTO `osc_user_action` VALUES ('195', '1', 'admin', '后台系统用户', '审核了竞价项目', '1544842618');
INSERT INTO `osc_user_action` VALUES ('196', '1', 'admin', '后台系统用户', '发布了项目', '1544852045');
INSERT INTO `osc_user_action` VALUES ('197', '1', 'admin', '后台系统用户', '添加了后台菜单，统计中心', '1544862966');
INSERT INTO `osc_user_action` VALUES ('198', '1', 'admin', '后台系统用户', '添加了后台菜单，项目统计', '1544863441');
INSERT INTO `osc_user_action` VALUES ('199', '1', 'admin', '后台系统用户', '添加了后台菜单，供应商统计', '1544863452');
INSERT INTO `osc_user_action` VALUES ('200', '1', 'admin', '后台系统用户', '修改了后台菜单，项目统计', '1544868851');
INSERT INTO `osc_user_action` VALUES ('201', '1', 'admin', '后台系统用户', '新增了用户类别', '1544876686');
INSERT INTO `osc_user_action` VALUES ('202', '1', 'admin', '后台系统用户', '发布了项目', '1544876804');
INSERT INTO `osc_user_action` VALUES ('203', '1', 'admin', '后台系统用户', '修改了后台菜单，供应商统计', '1544877226');
INSERT INTO `osc_user_action` VALUES ('204', '1', 'admin', '后台系统用户', '修改了后台菜单，商品', '1545038149');
INSERT INTO `osc_user_action` VALUES ('205', '1', 'admin', '后台系统用户', '添加了后台菜单，意见箱', '1545047654');
INSERT INTO `osc_user_action` VALUES ('206', '1', 'admin', '后台系统用户', '阅读了意见4', '1545102708');
INSERT INTO `osc_user_action` VALUES ('207', '1', 'admin', '后台系统用户', '阅读了意见1', '1545103011');
INSERT INTO `osc_user_action` VALUES ('208', '1', 'admin', '后台系统用户', '阅读了意见3', '1545103227');
INSERT INTO `osc_user_action` VALUES ('209', '1', 'admin', '后台系统用户', '修改了后台菜单，商品', '1545103470');
INSERT INTO `osc_user_action` VALUES ('210', '1', 'admin', '后台系统用户', '修改了后台菜单，管理员日志', '1545104044');
INSERT INTO `osc_user_action` VALUES ('211', '1', 'admin', '后台系统用户', '修改了后台菜单，配置管理', '1545104064');
INSERT INTO `osc_user_action` VALUES ('212', '1', 'admin', '后台系统用户', '修改了供应商首页推荐状态', '1545275791');
INSERT INTO `osc_user_action` VALUES ('213', '1', 'admin', '后台系统用户', '修改了供应商首页推荐状态', '1545275792');
INSERT INTO `osc_user_action` VALUES ('214', '1', 'admin', '后台系统用户', '修改了供应商首页推荐状态', '1545275793');
INSERT INTO `osc_user_action` VALUES ('215', '1', 'admin', '后台系统用户', '修改了供应商首页推荐状态', '1545275797');
INSERT INTO `osc_user_action` VALUES ('216', '1', 'admin', '后台系统用户', '修改了供应商首页推荐状态', '1545286576');
INSERT INTO `osc_user_action` VALUES ('217', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545286604');
INSERT INTO `osc_user_action` VALUES ('218', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545286605');
INSERT INTO `osc_user_action` VALUES ('219', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545286606');
INSERT INTO `osc_user_action` VALUES ('220', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545286609');
INSERT INTO `osc_user_action` VALUES ('221', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545291154');
INSERT INTO `osc_user_action` VALUES ('222', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545291157');
INSERT INTO `osc_user_action` VALUES ('223', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545291158');
INSERT INTO `osc_user_action` VALUES ('224', '1', 'admin', '后台系统用户', '更新系统基本配置', '1545379487');
INSERT INTO `osc_user_action` VALUES ('225', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545380723');
INSERT INTO `osc_user_action` VALUES ('226', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545380727');
INSERT INTO `osc_user_action` VALUES ('227', '1', 'admin', '后台系统用户', '发布了项目', '1545451854');
INSERT INTO `osc_user_action` VALUES ('228', '1', 'admin', '后台系统用户', '登录了后台系统', '1545725894');
INSERT INTO `osc_user_action` VALUES ('229', '1', 'admin', '后台系统用户', '更新系统基本配置', '1545727979');
INSERT INTO `osc_user_action` VALUES ('230', '1', 'admin', '后台系统用户', '发布了项目', '1545740444');
INSERT INTO `osc_user_action` VALUES ('231', '1', 'admin', '后台系统用户', '发布了项目', '1545742684');
INSERT INTO `osc_user_action` VALUES ('232', '1', 'admin', '后台系统用户', '发布了项目', '1545804481');
INSERT INTO `osc_user_action` VALUES ('233', '1', 'admin', '后台系统用户', '发布了项目', '1545804481');
INSERT INTO `osc_user_action` VALUES ('234', '1', 'admin', '后台系统用户', '发布了项目', '1545805094');
INSERT INTO `osc_user_action` VALUES ('235', '1', 'admin', '后台系统用户', '发布了项目', '1545805272');
INSERT INTO `osc_user_action` VALUES ('236', '1', 'admin', '后台系统用户', '删除项目', '1545805755');
INSERT INTO `osc_user_action` VALUES ('237', '1', 'admin', '后台系统用户', '删除项目', '1545805759');
INSERT INTO `osc_user_action` VALUES ('238', '1', 'admin', '后台系统用户', '删除项目', '1545805763');
INSERT INTO `osc_user_action` VALUES ('239', '1', 'admin', '后台系统用户', '删除项目', '1545805767');
INSERT INTO `osc_user_action` VALUES ('240', '1', 'admin', '后台系统用户', '删除项目', '1545805771');
INSERT INTO `osc_user_action` VALUES ('241', '1', 'admin', '后台系统用户', '发布了项目', '1545806922');
INSERT INTO `osc_user_action` VALUES ('242', '1', 'admin', '后台系统用户', '删除项目', '1545806944');
INSERT INTO `osc_user_action` VALUES ('243', '1', 'admin', '后台系统用户', '发布了项目', '1545806948');
INSERT INTO `osc_user_action` VALUES ('244', '1', 'admin', '后台系统用户', '编辑了项目', '1545807016');
INSERT INTO `osc_user_action` VALUES ('245', '1', 'admin', '后台系统用户', '编辑了项目', '1545807152');
INSERT INTO `osc_user_action` VALUES ('246', '1', 'admin', '后台系统用户', '编辑了项目', '1545807169');
INSERT INTO `osc_user_action` VALUES ('247', '1', 'admin', '后台系统用户', '新增了用户类别', '1545812354');
INSERT INTO `osc_user_action` VALUES ('248', '1', 'admin', '后台系统用户', '发布了项目', '1545812512');
INSERT INTO `osc_user_action` VALUES ('249', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545812659');
INSERT INTO `osc_user_action` VALUES ('250', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545812662');
INSERT INTO `osc_user_action` VALUES ('251', '1', 'admin', '后台系统用户', '发布了项目', '1545880013');
INSERT INTO `osc_user_action` VALUES ('252', '1', 'admin', '后台系统用户', '编辑了项目', '1545880472');
INSERT INTO `osc_user_action` VALUES ('253', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545880493');
INSERT INTO `osc_user_action` VALUES ('254', '1', 'admin', '后台系统用户', '退出了系统', '1545882333');
INSERT INTO `osc_user_action` VALUES ('255', '1', 'admin', '后台系统用户', '登录了后台系统', '1545882340');
INSERT INTO `osc_user_action` VALUES ('256', '1', 'admin', '后台系统用户', '修改了后台菜单，配置管理', '1545882426');
INSERT INTO `osc_user_action` VALUES ('257', '1', 'admin', '后台系统用户', '修改了系统配置', '1545882462');
INSERT INTO `osc_user_action` VALUES ('258', '1', 'admin', '后台系统用户', '修改了系统配置', '1545882474');
INSERT INTO `osc_user_action` VALUES ('259', '1', 'admin', '后台系统用户', '添加了后台菜单，公司设置', '1545889375');
INSERT INTO `osc_user_action` VALUES ('260', '1', 'admin', '后台系统用户', '修改了后台菜单，公司设置', '1545889505');
INSERT INTO `osc_user_action` VALUES ('261', '1', 'admin', '后台系统用户', '添加了后台菜单，须知及条件', '1545889576');
INSERT INTO `osc_user_action` VALUES ('262', '1', 'admin', '后台系统用户', '添加了后台菜单，公司简介', '1545891646');
INSERT INTO `osc_user_action` VALUES ('263', '1', 'admin', '后台系统用户', '添加了后台菜单，旗下品牌', '1545894454');
INSERT INTO `osc_user_action` VALUES ('264', '1', 'admin', '后台系统用户', '删除项目', '1545900174');
INSERT INTO `osc_user_action` VALUES ('265', '1', 'admin', '后台系统用户', '删除品牌', '1545900220');
INSERT INTO `osc_user_action` VALUES ('266', '1', 'admin', '后台系统用户', '删除品牌', '1545900227');
INSERT INTO `osc_user_action` VALUES ('267', '1', 'admin', '后台系统用户', '删除品牌', '1545900229');
INSERT INTO `osc_user_action` VALUES ('268', '1', 'admin', '后台系统用户', '新增品牌', '1545900266');
INSERT INTO `osc_user_action` VALUES ('269', '1', 'admin', '后台系统用户', '删除品牌6', '1545900272');
INSERT INTO `osc_user_action` VALUES ('270', '1', 'admin', '后台系统用户', '更新品牌2的排序', '1545900451');
INSERT INTO `osc_user_action` VALUES ('271', '1', 'admin', '后台系统用户', '更新了品牌2信息', '1545901211');
INSERT INTO `osc_user_action` VALUES ('272', '1', 'admin', '后台系统用户', '更新了品牌2信息', '1545901234');
INSERT INTO `osc_user_action` VALUES ('273', '1', 'admin', '后台系统用户', '更新了品牌2信息', '1545901243');
INSERT INTO `osc_user_action` VALUES ('274', '1', 'admin', '后台系统用户', '更新了品牌2信息', '1545901250');
INSERT INTO `osc_user_action` VALUES ('275', '1', 'admin', '后台系统用户', '添加了后台菜单，分店网络', '1545903552');
INSERT INTO `osc_user_action` VALUES ('276', '1', 'admin', '后台系统用户', '新增分店', '1545905393');
INSERT INTO `osc_user_action` VALUES ('277', '1', 'admin', '后台系统用户', '更新分店1排序', '1545905502');
INSERT INTO `osc_user_action` VALUES ('278', '1', 'admin', '后台系统用户', '更新分店1排序', '1545905555');
INSERT INTO `osc_user_action` VALUES ('279', '1', 'admin', '后台系统用户', '更新分店1排序', '1545905630');
INSERT INTO `osc_user_action` VALUES ('280', '1', 'admin', '后台系统用户', '更新分店1排序', '1545905716');
INSERT INTO `osc_user_action` VALUES ('281', '1', 'admin', '后台系统用户', '更新分店1排序', '1545905726');
INSERT INTO `osc_user_action` VALUES ('282', '1', 'admin', '后台系统用户', '新增分店', '1545905755');
INSERT INTO `osc_user_action` VALUES ('283', '1', 'admin', '后台系统用户', '删除分店2', '1545905797');
INSERT INTO `osc_user_action` VALUES ('284', '1', 'admin', '后台系统用户', '新增分店', '1545909877');
INSERT INTO `osc_user_action` VALUES ('285', '1', 'admin', '后台系统用户', '新增分店', '1545909976');
INSERT INTO `osc_user_action` VALUES ('286', '1', 'admin', '后台系统用户', '更新了分店3信息', '1545910232');
INSERT INTO `osc_user_action` VALUES ('287', '1', 'admin', '后台系统用户', '更新分店3排序', '1545910239');
INSERT INTO `osc_user_action` VALUES ('288', '1', 'admin', '后台系统用户', '删除分店3', '1545910284');
INSERT INTO `osc_user_action` VALUES ('289', '1', 'admin', '后台系统用户', '更新了分店1信息', '1545910338');
INSERT INTO `osc_user_action` VALUES ('290', '1', 'admin', '后台系统用户', '更新了分店4信息', '1545910343');
INSERT INTO `osc_user_action` VALUES ('291', '1', 'admin', '后台系统用户', '添加了后台菜单，公司新闻', '1545910471');
INSERT INTO `osc_user_action` VALUES ('292', '1', 'admin', '后台系统用户', '添加了后台菜单，新闻分类', '1545964077');
INSERT INTO `osc_user_action` VALUES ('293', '1', 'admin', '后台系统用户', '新增分店', '1545964135');
INSERT INTO `osc_user_action` VALUES ('294', '1', 'admin', '后台系统用户', '新增了用户类别', '1545964935');
INSERT INTO `osc_user_action` VALUES ('295', '1', 'admin', '后台系统用户', '新增了用户类别', '1545965046');
INSERT INTO `osc_user_action` VALUES ('296', '1', 'admin', '后台系统用户', '新增了用户类别', '1545965272');
INSERT INTO `osc_user_action` VALUES ('297', '1', 'admin', '后台系统用户', '新增了用户类别', '1545965278');
INSERT INTO `osc_user_action` VALUES ('298', '1', 'admin', '后台系统用户', '更新新闻类别排序', '1545965284');
INSERT INTO `osc_user_action` VALUES ('299', '1', 'admin', '后台系统用户', '更新新闻类别排序', '1545965287');
INSERT INTO `osc_user_action` VALUES ('300', '1', 'admin', '后台系统用户', '删除新闻类别13', '1545965291');
INSERT INTO `osc_user_action` VALUES ('301', '1', 'admin', '后台系统用户', '编辑了新闻类别', '1545965324');
INSERT INTO `osc_user_action` VALUES ('302', '1', 'admin', '后台系统用户', '删除新闻类别12', '1545965333');
INSERT INTO `osc_user_action` VALUES ('303', '1', 'admin', '后台系统用户', '新增了用户类别', '1545965352');
INSERT INTO `osc_user_action` VALUES ('304', '1', 'admin', '后台系统用户', '新增新闻', '1545966673');
INSERT INTO `osc_user_action` VALUES ('305', '1', 'admin', '后台系统用户', '新增新闻', '1545966753');
INSERT INTO `osc_user_action` VALUES ('306', '1', 'admin', '后台系统用户', '更新新闻12排序', '1545967028');
INSERT INTO `osc_user_action` VALUES ('307', '1', 'admin', '后台系统用户', '更新新闻11排序', '1545967031');
INSERT INTO `osc_user_action` VALUES ('308', '1', 'admin', '后台系统用户', '删除新闻12', '1545967128');
INSERT INTO `osc_user_action` VALUES ('309', '1', 'admin', '后台系统用户', '新增了用户类别', '1545967141');
INSERT INTO `osc_user_action` VALUES ('310', '1', 'admin', '后台系统用户', '新增新闻', '1545967164');
INSERT INTO `osc_user_action` VALUES ('311', '1', 'admin', '后台系统用户', '新增了用户类别', '1545967355');
INSERT INTO `osc_user_action` VALUES ('312', '1', 'admin', '后台系统用户', '新增新闻', '1545967368');
INSERT INTO `osc_user_action` VALUES ('313', '1', 'admin', '后台系统用户', '编辑了新闻14', '1545967958');
INSERT INTO `osc_user_action` VALUES ('314', '1', 'admin', '后台系统用户', '编辑了用户类别', '1545969047');
INSERT INTO `osc_user_action` VALUES ('315', '1', 'admin', '后台系统用户', '编辑了用户类别', '1545969057');
INSERT INTO `osc_user_action` VALUES ('316', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969080');
INSERT INTO `osc_user_action` VALUES ('317', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969092');
INSERT INTO `osc_user_action` VALUES ('318', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969107');
INSERT INTO `osc_user_action` VALUES ('319', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969122');
INSERT INTO `osc_user_action` VALUES ('320', '1', 'admin', '后台系统用户', '删除用户类别4', '1545969134');
INSERT INTO `osc_user_action` VALUES ('321', '1', 'admin', '后台系统用户', '删除用户类别11', '1545969143');
INSERT INTO `osc_user_action` VALUES ('322', '1', 'admin', '后台系统用户', '删除用户类别10', '1545969146');
INSERT INTO `osc_user_action` VALUES ('323', '1', 'admin', '后台系统用户', '删除用户类别9', '1545969149');
INSERT INTO `osc_user_action` VALUES ('324', '1', 'admin', '后台系统用户', '删除用户类别3', '1545969153');
INSERT INTO `osc_user_action` VALUES ('325', '1', 'admin', '后台系统用户', '删除用户类别1', '1545969157');
INSERT INTO `osc_user_action` VALUES ('326', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969191');
INSERT INTO `osc_user_action` VALUES ('327', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969215');
INSERT INTO `osc_user_action` VALUES ('328', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969228');
INSERT INTO `osc_user_action` VALUES ('329', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969238');
INSERT INTO `osc_user_action` VALUES ('330', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969249');
INSERT INTO `osc_user_action` VALUES ('331', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969260');
INSERT INTO `osc_user_action` VALUES ('332', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969269');
INSERT INTO `osc_user_action` VALUES ('333', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969282');
INSERT INTO `osc_user_action` VALUES ('334', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969337');
INSERT INTO `osc_user_action` VALUES ('335', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969348');
INSERT INTO `osc_user_action` VALUES ('336', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969363');
INSERT INTO `osc_user_action` VALUES ('337', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969377');
INSERT INTO `osc_user_action` VALUES ('338', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969389');
INSERT INTO `osc_user_action` VALUES ('339', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969401');
INSERT INTO `osc_user_action` VALUES ('340', '1', 'admin', '后台系统用户', '新增了用户类别', '1545969412');
INSERT INTO `osc_user_action` VALUES ('341', '1', 'admin', '后台系统用户', '删除新闻13', '1545978349');
INSERT INTO `osc_user_action` VALUES ('342', '1', 'admin', '后台系统用户', '新增新闻', '1545978410');
INSERT INTO `osc_user_action` VALUES ('343', '1', 'admin', '后台系统用户', '新增新闻', '1545978445');
INSERT INTO `osc_user_action` VALUES ('344', '1', 'admin', '后台系统用户', '更新系统基本配置', '1545978740');
INSERT INTO `osc_user_action` VALUES ('345', '1', 'admin', '后台系统用户', '编辑了项目', '1545980471');
INSERT INTO `osc_user_action` VALUES ('346', '1', 'admin', '后台系统用户', '编辑了项目', '1545980501');
INSERT INTO `osc_user_action` VALUES ('347', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545985627');
INSERT INTO `osc_user_action` VALUES ('348', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545985629');
INSERT INTO `osc_user_action` VALUES ('349', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545986506');
INSERT INTO `osc_user_action` VALUES ('350', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1545986511');
INSERT INTO `osc_user_action` VALUES ('351', '1', 'admin', '后台系统用户', '编辑了项目', '1545988523');
INSERT INTO `osc_user_action` VALUES ('352', '1', 'admin', '后台系统用户', '登录了后台系统', '1546066841');
INSERT INTO `osc_user_action` VALUES ('353', '1', 'admin', '后台系统用户', '审核了供应商id9', '1546071835');
INSERT INTO `osc_user_action` VALUES ('354', '1', 'admin', '后台系统用户', '添加了后台菜单，常见问题', '1546415373');
INSERT INTO `osc_user_action` VALUES ('355', '1', 'admin', '后台系统用户', '添加了后台菜单，新增', '1546415821');
INSERT INTO `osc_user_action` VALUES ('356', '1', 'admin', '后台系统用户', '新增新闻', '1546416449');
INSERT INTO `osc_user_action` VALUES ('357', '1', 'admin', '后台系统用户', '更新新闻17排序', '1546416520');
INSERT INTO `osc_user_action` VALUES ('358', '1', 'admin', '后台系统用户', '新增新闻', '1546416529');
INSERT INTO `osc_user_action` VALUES ('359', '1', 'admin', '后台系统用户', '更新常见问题17排序', '1546416702');
INSERT INTO `osc_user_action` VALUES ('360', '1', 'admin', '后台系统用户', '删除常见问题18', '1546416832');
INSERT INTO `osc_user_action` VALUES ('361', '1', 'admin', '后台系统用户', '编辑了新闻17', '1546417159');
INSERT INTO `osc_user_action` VALUES ('362', '1', 'admin', '后台系统用户', '编辑了常见问题17', '1546417200');
INSERT INTO `osc_user_action` VALUES ('363', '1', 'admin', '后台系统用户', '编辑了常见问题17', '1546417245');
INSERT INTO `osc_user_action` VALUES ('364', '1', 'admin', '后台系统用户', '新增常见问题', '1546418570');
INSERT INTO `osc_user_action` VALUES ('365', '1', 'admin', '后台系统用户', '新增常见问题', '1546418584');
INSERT INTO `osc_user_action` VALUES ('366', '1', 'admin', '后台系统用户', '编辑了项目', '1546449568');
INSERT INTO `osc_user_action` VALUES ('367', '1', 'admin', '后台系统用户', '更新系统基本配置', '1546452770');
INSERT INTO `osc_user_action` VALUES ('368', '1', 'admin', '后台系统用户', '发布了项目', '1546499505');
INSERT INTO `osc_user_action` VALUES ('369', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1546499514');
INSERT INTO `osc_user_action` VALUES ('370', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1546499794');
INSERT INTO `osc_user_action` VALUES ('371', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1546499815');
INSERT INTO `osc_user_action` VALUES ('372', '1', 'admin', '后台系统用户', '编辑了项目', '1546499827');
INSERT INTO `osc_user_action` VALUES ('373', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1546499851');
INSERT INTO `osc_user_action` VALUES ('374', '1', 'admin', '后台系统用户', '发布了项目', '1546514250');
INSERT INTO `osc_user_action` VALUES ('375', '1', 'admin', '后台系统用户', '更新系统基本配置', '1546572561');
INSERT INTO `osc_user_action` VALUES ('376', '1', 'admin', '后台系统用户', '更新系统基本配置', '1546572576');
INSERT INTO `osc_user_action` VALUES ('377', '1', 'admin', '后台系统用户', '修改了后台菜单，待审核竞价列表', '1546572658');
INSERT INTO `osc_user_action` VALUES ('378', '1', 'admin', '后台系统用户', '删除了后台菜单，id=359', '1546572758');
INSERT INTO `osc_user_action` VALUES ('379', '1', 'admin', '后台系统用户', '删除项目', '1546572785');
INSERT INTO `osc_user_action` VALUES ('380', '1', 'admin', '后台系统用户', '删除项目', '1546572789');
INSERT INTO `osc_user_action` VALUES ('381', '1', 'admin', '后台系统用户', '删除项目', '1546572792');
INSERT INTO `osc_user_action` VALUES ('382', '1', 'admin', '后台系统用户', '删除项目', '1546572795');
INSERT INTO `osc_user_action` VALUES ('383', '1', 'admin', '后台系统用户', '删除项目', '1546572798');
INSERT INTO `osc_user_action` VALUES ('384', '1', 'admin', '后台系统用户', '删除项目', '1546572801');
INSERT INTO `osc_user_action` VALUES ('385', '1', 'admin', '后台系统用户', '删除项目', '1546572807');
INSERT INTO `osc_user_action` VALUES ('386', '1', 'admin', '后台系统用户', '更新系统基本配置', '1546572814');
INSERT INTO `osc_user_action` VALUES ('387', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1546572865');
INSERT INTO `osc_user_action` VALUES ('388', '1', 'admin', '后台系统用户', '编辑了项目', '1546572897');
INSERT INTO `osc_user_action` VALUES ('389', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1546572936');
INSERT INTO `osc_user_action` VALUES ('390', '1', 'admin', '后台系统用户', '审核了供应商id10', '1546573228');
INSERT INTO `osc_user_action` VALUES ('391', '1', 'admin', '后台系统用户', '审核了供应商id11', '1546573615');
INSERT INTO `osc_user_action` VALUES ('392', '1', 'admin', '后台系统用户', '发布了项目', '1546588049');
INSERT INTO `osc_user_action` VALUES ('393', '1', 'admin', '后台系统用户', '编辑了项目', '1546588126');
INSERT INTO `osc_user_action` VALUES ('394', '1', 'admin', '后台系统用户', '删除项目', '1546591599');
INSERT INTO `osc_user_action` VALUES ('395', '1', 'admin', '后台系统用户', '删除项目', '1546591601');
INSERT INTO `osc_user_action` VALUES ('396', '1', 'admin', '后台系统用户', '删除项目', '1546591603');
INSERT INTO `osc_user_action` VALUES ('397', '1', 'admin', '后台系统用户', '删除项目', '1546591605');
INSERT INTO `osc_user_action` VALUES ('398', '1', 'admin', '后台系统用户', '发布了项目', '1546591756');
INSERT INTO `osc_user_action` VALUES ('399', '1', 'admin', '后台系统用户', '发布了项目', '1546591964');
INSERT INTO `osc_user_action` VALUES ('400', '1', 'admin', '后台系统用户', '阅读了意见14', '1546594362');
INSERT INTO `osc_user_action` VALUES ('401', '1', 'admin', '后台系统用户', '回复了意见14', '1546595354');
INSERT INTO `osc_user_action` VALUES ('402', '1', 'admin', '后台系统用户', '回复了意见13', '1546595437');
INSERT INTO `osc_user_action` VALUES ('403', '1', 'admin', '后台系统用户', '发布了项目', '1546596494');
INSERT INTO `osc_user_action` VALUES ('404', '1', 'admin', '后台系统用户', '发布了项目', '1546596729');
INSERT INTO `osc_user_action` VALUES ('405', '1', 'admin', '后台系统用户', '新增品牌', '1546597041');
INSERT INTO `osc_user_action` VALUES ('406', '1', 'admin', '后台系统用户', '新增分店', '1546597182');
INSERT INTO `osc_user_action` VALUES ('407', '1', 'admin', '后台系统用户', '新增新闻', '1546597211');
INSERT INTO `osc_user_action` VALUES ('408', '1', 'admin', '后台系统用户', '编辑了新闻类别', '1546597409');
INSERT INTO `osc_user_action` VALUES ('409', '1', 'admin', '后台系统用户', '新增了用户类别', '1546597652');
INSERT INTO `osc_user_action` VALUES ('410', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1546598184');
INSERT INTO `osc_user_action` VALUES ('411', '1', 'admin', '后台系统用户', '更新供应商状态', '1546598302');
INSERT INTO `osc_user_action` VALUES ('412', '1', 'admin', '后台系统用户', '更新供应商状态', '1546598303');
INSERT INTO `osc_user_action` VALUES ('413', '1', 'admin', '后台系统用户', '更新供应商状态', '1546598305');
INSERT INTO `osc_user_action` VALUES ('414', '1', 'admin', '后台系统用户', '更新供应商状态', '1546598307');
INSERT INTO `osc_user_action` VALUES ('415', '1', 'admin', '后台系统用户', '更新供应商状态', '1546598407');
INSERT INTO `osc_user_action` VALUES ('416', '1', 'admin', '后台系统用户', '更新供应商状态', '1546601347');
INSERT INTO `osc_user_action` VALUES ('417', '1', 'admin', '后台系统用户', '发布了项目', '1546602363');
INSERT INTO `osc_user_action` VALUES ('418', '1', 'admin', '后台系统用户', '登录了后台系统', '1546667498');
INSERT INTO `osc_user_action` VALUES ('419', '1', 'admin', '后台系统用户', '登录了后台系统', '1546831168');
INSERT INTO `osc_user_action` VALUES ('420', '1', 'admin', '后台系统用户', '退出了系统', '1546831940');
INSERT INTO `osc_user_action` VALUES ('421', '1', 'admin', '后台系统用户', '登录了后台系统', '1546832304');
INSERT INTO `osc_user_action` VALUES ('422', '1', 'admin', '后台系统用户', '退出了系统', '1546832309');
INSERT INTO `osc_user_action` VALUES ('423', '1', 'admin', '后台系统用户', '登录了后台系统', '1546832326');
INSERT INTO `osc_user_action` VALUES ('424', '1', 'admin', '后台系统用户', '退出了系统', '1546833375');
INSERT INTO `osc_user_action` VALUES ('425', '1', 'admin', '后台系统用户', '登录了后台系统', '1546833388');
INSERT INTO `osc_user_action` VALUES ('426', '1', 'admin', '后台系统用户', '退出了系统', '1546833668');
INSERT INTO `osc_user_action` VALUES ('427', '1', 'admin', '后台系统用户', '登录了后台系统', '1546833679');
INSERT INTO `osc_user_action` VALUES ('428', '1', 'admin', '后台系统用户', '发布了项目', '1546851175');
INSERT INTO `osc_user_action` VALUES ('429', '1', 'admin', '后台系统用户', '更新系统基本配置', '1546863233');
INSERT INTO `osc_user_action` VALUES ('430', '1', 'admin', '后台系统用户', '登录了后台系统', '1559370470');
INSERT INTO `osc_user_action` VALUES ('431', '1', 'admin', '后台系统用户', '新增了用户类别', '1559370519');
INSERT INTO `osc_user_action` VALUES ('432', '1', 'admin', '后台系统用户', '发布了项目', '1546937894');
INSERT INTO `osc_user_action` VALUES ('433', '1', 'admin', '后台系统用户', '编辑了项目', '1550050496');
INSERT INTO `osc_user_action` VALUES ('434', '1', 'admin', '后台系统用户', '编辑了项目', '1550050513');
INSERT INTO `osc_user_action` VALUES ('435', '1', 'admin', '后台系统用户', '发布了项目', '1550052116');
INSERT INTO `osc_user_action` VALUES ('436', '1', 'admin', '后台系统用户', '审核了供应商id12', '1546968967');
INSERT INTO `osc_user_action` VALUES ('437', '1', 'admin', '后台系统用户', '修改了竞价项目热门状态', '1546969587');
INSERT INTO `osc_user_action` VALUES ('438', '1', 'admin', '后台系统用户', '发布了项目', '1546970710');
INSERT INTO `osc_user_action` VALUES ('439', '1', 'admin', '后台系统用户', '发布了项目', '1546970822');

-- ----------------------------
-- Table structure for osc_user_classify
-- ----------------------------
DROP TABLE IF EXISTS `osc_user_classify`;
CREATE TABLE `osc_user_classify` (
  `classify_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classify_name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0 停用 1 启用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`classify_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_user_classify
-- ----------------------------
INSERT INTO `osc_user_classify` VALUES ('2', '食品', '5', '1', '1544680399', '1545969057', '0');
INSERT INTO `osc_user_classify` VALUES ('12', '日用品', '0', '1', '1545969080', '0', '0');
INSERT INTO `osc_user_classify` VALUES ('13', '生鲜', '0', '1', '1545969092', '0', '0');
INSERT INTO `osc_user_classify` VALUES ('14', '百货', '0', '1', '1545969107', '0', '0');
INSERT INTO `osc_user_classify` VALUES ('15', '家电文', '0', '1', '1545969122', '0', '0');
INSERT INTO `osc_user_classify` VALUES ('16', '酱油面', '0', '1', '1545969190', '0', '2');
INSERT INTO `osc_user_classify` VALUES ('17', '冲饮', '0', '1', '1545969214', '0', '2');
INSERT INTO `osc_user_classify` VALUES ('18', '休食', '0', '1', '1545969228', '0', '2');
INSERT INTO `osc_user_classify` VALUES ('19', '烟酒', '0', '1', '1545969238', '0', '2');
INSERT INTO `osc_user_classify` VALUES ('20', '饮料', '0', '1', '1545969249', '0', '2');
INSERT INTO `osc_user_classify` VALUES ('21', '低温食品', '0', '1', '1545969260', '0', '2');
INSERT INTO `osc_user_classify` VALUES ('22', '进口食品', '0', '1', '1545969269', '0', '2');
INSERT INTO `osc_user_classify` VALUES ('23', '散装', '0', '1', '1545969282', '0', '0');
INSERT INTO `osc_user_classify` VALUES ('24', '纸品', '0', '1', '1545969337', '0', '12');
INSERT INTO `osc_user_classify` VALUES ('25', '五谷', '0', '1', '1545969348', '0', '13');
INSERT INTO `osc_user_classify` VALUES ('26', '男装', '0', '1', '1545969363', '0', '14');
INSERT INTO `osc_user_classify` VALUES ('27', '床品', '0', '1', '1545969376', '0', '14');
INSERT INTO `osc_user_classify` VALUES ('28', '五金', '0', '1', '1545969388', '0', '15');
INSERT INTO `osc_user_classify` VALUES ('29', '家电', '0', '1', '1545969401', '0', '15');
INSERT INTO `osc_user_classify` VALUES ('30', '文体', '0', '1', '1545969412', '0', '15');
INSERT INTO `osc_user_classify` VALUES ('31', '果仁', '0', '1', '1559370518', '0', '23');

-- ----------------------------
-- Table structure for osc_wechat_news_reply
-- ----------------------------
DROP TABLE IF EXISTS `osc_wechat_news_reply`;
CREATE TABLE `osc_wechat_news_reply` (
  `nr_id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` text,
  `thumb` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_time` varchar(40) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图文回复';

-- ----------------------------
-- Records of osc_wechat_news_reply
-- ----------------------------

-- ----------------------------
-- Table structure for osc_wechat_rule
-- ----------------------------
DROP TABLE IF EXISTS `osc_wechat_rule`;
CREATE TABLE `osc_wechat_rule` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键字',
  `module` varchar(64) DEFAULT NULL COMMENT '模块',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` varchar(40) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`rid`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信回复关键字';

-- ----------------------------
-- Records of osc_wechat_rule
-- ----------------------------

-- ----------------------------
-- Table structure for osc_wechat_share
-- ----------------------------
DROP TABLE IF EXISTS `osc_wechat_share`;
CREATE TABLE `osc_wechat_share` (
  `ws_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(128) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ws_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_wechat_share
-- ----------------------------

-- ----------------------------
-- Table structure for osc_wechat_text_reply
-- ----------------------------
DROP TABLE IF EXISTS `osc_wechat_text_reply`;
CREATE TABLE `osc_wechat_text_reply` (
  `tr_id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(255) DEFAULT NULL,
  `content` text,
  `create_time` varchar(40) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文字回复';

-- ----------------------------
-- Records of osc_wechat_text_reply
-- ----------------------------

-- ----------------------------
-- Table structure for osc_weight_class
-- ----------------------------
DROP TABLE IF EXISTS `osc_weight_class`;
CREATE TABLE `osc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `title` varchar(32) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`weight_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='重量单位';

-- ----------------------------
-- Records of osc_weight_class
-- ----------------------------
INSERT INTO `osc_weight_class` VALUES ('1', '1.00000000', '千克', 'kg');
INSERT INTO `osc_weight_class` VALUES ('2', '1000.00000000', '克', 'g');

-- ----------------------------
-- Table structure for osc_yuyue
-- ----------------------------
DROP TABLE IF EXISTS `osc_yuyue`;
CREATE TABLE `osc_yuyue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员id',
  `je` decimal(10,2) NOT NULL COMMENT '总价',
  `status` tinyint(3) NOT NULL COMMENT '状态，1待付款2已付款3正在使用，4已使用，5已取消',
  `xingming` varchar(64) NOT NULL COMMENT '使用者姓名',
  `phone` varchar(64) NOT NULL COMMENT '电话',
  `shopid` int(11) NOT NULL COMMENT '商家id',
  `productid` int(11) NOT NULL COMMENT '产品id',
  `day` date NOT NULL COMMENT '具体到天',
  `sex` tinyint(2) NOT NULL COMMENT '性别，1男2女',
  `birthday` varchar(64) NOT NULL COMMENT '生日',
  `xdtime` int(11) NOT NULL COMMENT '下单时间',
  `fktime` int(11) NOT NULL COMMENT '付款时间',
  `wctime` int(11) NOT NULL COMMENT '完成时间',
  `qxtime` int(11) NOT NULL COMMENT '取消时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_yuyue
-- ----------------------------
INSERT INTO `osc_yuyue` VALUES ('1', '21', '22.00', '1', '1', '15099999999', '8', '2', '2018-10-16', '0', 'null ', '1539659384', '0', '0', '0');
INSERT INTO `osc_yuyue` VALUES ('2', '21', '22.00', '1', '1', '15099999999', '8', '2', '2018-10-16', '0', 'null ', '1539659529', '0', '0', '0');
INSERT INTO `osc_yuyue` VALUES ('3', '21', '33.00', '1', '10', '15099999999', '8', '2', '2018-10-16', '0', 'null ', '1539660422', '0', '0', '0');
INSERT INTO `osc_yuyue` VALUES ('4', '21', '55.00', '1', '1', '15099999999', '8', '2', '2018-10-16', '0', 'null ', '1539660676', '0', '0', '0');
INSERT INTO `osc_yuyue` VALUES ('5', '21', '55.00', '1', '1', '15099999999', '8', '2', '2018-10-16', '0', 'null ', '1539660698', '0', '0', '0');

-- ----------------------------
-- Table structure for osc_yuyue_item
-- ----------------------------
DROP TABLE IF EXISTS `osc_yuyue_item`;
CREATE TABLE `osc_yuyue_item` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `yuyueid` int(11) NOT NULL COMMENT 'yuyue表 id',
  `day` date NOT NULL COMMENT '具体到某天',
  `time` varchar(64) NOT NULL COMMENT '具体到时；如10：00',
  `status` tinyint(3) NOT NULL COMMENT '状态',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_yuyue_item
-- ----------------------------
INSERT INTO `osc_yuyue_item` VALUES ('1', '21', '8', '2', '11.00', '1', '2018-10-16', '18:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('2', '21', '8', '2', '11.00', '1', '2018-10-16', '15:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('3', '21', '8', '2', '11.00', '2', '2018-10-16', '18:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('4', '21', '8', '2', '11.00', '2', '2018-10-16', '15:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('5', '21', '8', '2', '11.00', '3', '2018-10-16', '19:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('6', '21', '8', '2', '11.00', '3', '2018-10-16', '20:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('7', '21', '8', '2', '11.00', '3', '2018-10-16', '17:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('8', '21', '8', '2', '11.00', '5', '2018-10-16', '19:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('9', '21', '8', '2', '11.00', '5', '2018-10-16', '20:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('10', '21', '8', '2', '11.00', '5', '2018-10-16', '17:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('11', '21', '8', '2', '11.00', '5', '2018-10-16', '13:00', '1');
INSERT INTO `osc_yuyue_item` VALUES ('12', '21', '8', '2', '11.00', '5', '2018-10-16', '16:00', '1');

-- ----------------------------
-- Table structure for osc_yycart
-- ----------------------------
DROP TABLE IF EXISTS `osc_yycart`;
CREATE TABLE `osc_yycart` (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `day` date NOT NULL,
  `time` varchar(64) NOT NULL,
  `datetime` int(11) NOT NULL,
  PRIMARY KEY (`cartid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of osc_yycart
-- ----------------------------
INSERT INTO `osc_yycart` VALUES ('23', '3', '8', '22', '2018-10-16', '19:00', '1539661411');
INSERT INTO `osc_yycart` VALUES ('24', '2', '8', '22', '2018-10-16', '14:00', '1539679661');
INSERT INTO `osc_yycart` VALUES ('25', '2', '8', '22', '2018-10-16', '15:00', '1539679661');
INSERT INTO `osc_yycart` VALUES ('35', '2', '8', '25', '2018-10-29', '13:00', '1540639362');
INSERT INTO `osc_yycart` VALUES ('36', '2', '8', '25', '2018-10-29', '14:00', '1540639362');
INSERT INTO `osc_yycart` VALUES ('37', '2', '8', '25', '2018-10-29', '15:00', '1540639362');
INSERT INTO `osc_yycart` VALUES ('40', '2', '8', '38', '2018-10-31', '10:00', '1540875702');
INSERT INTO `osc_yycart` VALUES ('41', '3', '8', '24', '2018-11-02', '09:00', '1541125718');
INSERT INTO `osc_yycart` VALUES ('42', '3', '8', '24', '2018-11-02', '10:00', '1541125718');
INSERT INTO `osc_yycart` VALUES ('43', '3', '8', '24', '2018-11-02', '11:00', '1541125718');
INSERT INTO `osc_yycart` VALUES ('44', '2', '8', '24', '2018-11-02', '09:00', '1541126080');
INSERT INTO `osc_yycart` VALUES ('45', '2', '8', '24', '2018-11-02', '10:00', '1541126080');
INSERT INTO `osc_yycart` VALUES ('46', '2', '8', '24', '2018-11-02', '11:00', '1541126080');
