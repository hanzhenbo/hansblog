/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : hansblog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-06-13 18:32:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for edu_task
-- ----------------------------
DROP TABLE IF EXISTS `edu_task`;
CREATE TABLE `edu_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `allDay` int(1) DEFAULT '0' COMMENT '0 全天 1 非全天',
  `color` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edu_task
-- ----------------------------
INSERT INTO `edu_task` VALUES ('1', '数学', '1528174800', '1528275600', '0', 'blue', null);
INSERT INTO `edu_task` VALUES ('2', '语文', '1528308000', '1528315200', '0', '#99ccff', null);
INSERT INTO `edu_task` VALUES ('3', '租赁配置', '1528930800', '1528938000', '0', 'black', null);
INSERT INTO `edu_task` VALUES ('21', '试试', '1528678920', '1528687920', '0', '', null);
INSERT INTO `edu_task` VALUES ('22', '是的', '1528905600', '1528560000', '1', '', null);
INSERT INTO `edu_task` VALUES ('23', '大法师', '1529197200', '1529629200', '0', '', null);
INSERT INTO `edu_task` VALUES ('24', '韩震波去不去', '1528920000', '1528927200', '0', '#000050', null);
INSERT INTO `edu_task` VALUES ('25', '谁说的', '1528925400', '1528932600', '0', '#215239', null);
INSERT INTO `edu_task` VALUES ('26', '韩震波要不要', '1528905600', '1528905601', '0', '#567782', null);
INSERT INTO `edu_task` VALUES ('27', '李传新', '1528912801', '1528912810', '0', '#211078', null);
INSERT INTO `edu_task` VALUES ('28', '梅晨要不要', '1529424000', '1529510400', '1', '#723206', null);
INSERT INTO `edu_task` VALUES ('29', '全天事件', '1528905600', '1529078400', '1', '#660269', null);

-- ----------------------------
-- Table structure for hans_article
-- ----------------------------
DROP TABLE IF EXISTS `hans_article`;
CREATE TABLE `hans_article` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `user_id` int(8) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `type` int(1) DEFAULT '0' COMMENT '文章类型 0原创 1转载',
  `label` varchar(50) DEFAULT NULL COMMENT '文章标签',
  `title` varchar(100) DEFAULT NULL COMMENT '文章标题',
  `abstracts` varchar(200) DEFAULT NULL COMMENT '摘要',
  `content` varchar(1000) DEFAULT NULL COMMENT '文章内容',
  `img` varchar(50) DEFAULT NULL COMMENT '文章图片',
  `status` int(1) DEFAULT '0' COMMENT '文章状态 0审核中 1审核通过 2审核不通过',
  `create_at` varchar(20) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hans_article
-- ----------------------------
INSERT INTO `hans_article` VALUES ('1', '1', 'hans', '0', null, '我本楚狂人，凤歌笑孔丘', '我们一直在坚持着，不是为了改变世界，而是希望不被这个世界所改变。', '我遇见了你，你一直觉得自己不够美好，充满惊慌与卑微，但是，你即使那样害怕，却守在我的身后，不曾后退。人们总是崇拜英雄，惊喜与他们随时随地的光芒，但是最真实的事情永远是我们都会恐惧都会失败，有时受尽打击，又是无能为力。你说我是英雄，其实我不敢告诉你，如果不是你，你傻傻地倔强地站在那里，我一回头就能看见你，那么，或许，我早就做了命运的逃兵。<br><br>\r\n        红衣佳人白衣友，朝与同歌暮同酒，世人谓我恋长安，其实只恋长安某。 ——殊同 <br>\r\n\r\n水银泻地的时候，忧愁穿过墙壁，又和着嘶哑的音乐，使我羞惭、灰心。整个夏季，仿佛一场，没有主题的游戏。 ——赵野 <br>\r\n\r\n我感到自己仿佛变得蔚蓝，变得无边无际，眼睛和指尖上，栖息着无数的星辰。 ——马林·索雷斯库 <br>\r\n\r\n手中的书页犹如薄薄的剃刀片白亮亮闪着寒光。在凌晨四时寂寞的时刻里，我可以听到孤独之根正一点点伸长的声音。 ——村上春树 <br>\r\n\r\n你的明眸是映现我灵魂颤动的湖，我那成群结队的梦想，为寻求解脱，而纷纷投入你这秋波深处。 ——波德莱尔  <br>\r\n\r\n当我们只剩下虚无，唯有沉默的太阳够好，是你的静寂，是无声的声音。 ——佩索阿', '/static/assets/i/f10.jpg', '0', '1514447666');
INSERT INTO `hans_article` VALUES ('2', '1', 'hans', '0', null, '世间所有的相遇，都是久别重逢。', '你可以选择在原处不停地跟周遭不解的人解释你为何这么做，让他们理解你，你可以选择什么都不讲，自顾自往前走。', '十分温柔环节卡蓝色大海发将输入为非vV型导出到VB水电费环境和后一唯一荣获兰姐的v那些成本v环境说的法拉', '/static/assets/i/f6.jpg', '0', '1514450673');
INSERT INTO `hans_article` VALUES ('3', '1', 'hans', '0', null, '陌上花开，可缓缓归矣。', '那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。我们就在骑楼下躲雨，看绿色的邮筒孤独地站在街的对面。', '无诶人意识到v会拉开惊世毒妃就好地方亚欧诶有人请我IE的空间发喝咖啡东方红来看', '/static/assets/i/f12.jpg', '0', '1514444400');
INSERT INTO `hans_article` VALUES ('4', '1', 'hans', '0', null, '爱自己是终生浪漫的开始', 'the whole of life becomes an act of letting go, but what always hurts the most is not taking a moment to say goodbye', '你可以选择在原处不停地跟周遭不解的人解释你为何这么做，让他们理解你，你可以选择什么都不讲，自顾自往前走。', '/static/assets/i/f22.jpg', '0', '1514448000');
INSERT INTO `hans_article` VALUES ('5', '1', 'hans', '0', null, 'Hello, My dear', '那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。我们就在骑楼下躲雨，看绿色的邮筒孤独地站在街的对面。', '对方回复济公活佛副阳台有电放保函几个库， 觥筹交错购房合同官方那个发热体育', '/static/assets/i/f18.jpg', '0', '1514448120');
INSERT INTO `hans_article` VALUES ('6', '1', 'hans', '0', null, 'My way or the highway', 'A big wind rises， clouds are driven away. Home am Inow the world is under my sway. Where are brave men to guard the four frontiers today！', '对方回复济公活佛副阳台有电放保函几个库， 觥筹交错购房合同官方那个发热体育', '/static/assets/i/f20.jpg', '0', '1514449200');
INSERT INTO `hans_article` VALUES ('7', '1', 'hans', '0', null, '一想到你，我这张丑脸上就泛起微笑', '那一天我二十一岁，在我一生的黄金时代。我有好多奢望。我想爱，想吃，还想在一瞬间变成天上半明半暗的云。', '食发鬼陶渊明你还没v奉公如法的沟通你发让他脱衣服忽高忽低索菲特金地方共和国返回', '/static/assets/i/f19.jpg', '0', '1514450700');
INSERT INTO `hans_article` VALUES ('8', '1', 'hans', '0', null, 'han', 'hahahhahahahhahahahahahahha', '席不好土方回填人家女包你发大鱼海棠改不好 额问题人生巅峰GV地方', null, '0', null);
INSERT INTO `hans_article` VALUES ('9', '1', 'hans', '0', null, 'kjhewkrjh', 'wiuwehjksdhgkwyeruiyhjksdhfkjfhsdkjthfdkasrf', '收到了氛围进入汉王科技发送给看链接会儿玩阿拉山口任务', null, '0', null);
INSERT INTO `hans_article` VALUES ('10', '1', 'hans', '0', null, '昆仑决', '收到了氛围进入汉王科技发送给看链接会儿玩阿拉山口任务', '快捷登录时候我就二环日维护卡精神可嘉是的发生的回复', null, '0', null);
INSERT INTO `hans_article` VALUES ('11', '1', 'hans', '0', null, '我看了·', '快捷登录时候我就二环日维护卡精神可嘉是的发生的回复', '昆仑决够狠玛瑙么，是否是否问候日推哦如恶女答非所问 a3e2r3we4在大事发生的人人', null, '0', null);
INSERT INTO `hans_article` VALUES ('12', '1', 'hans', '0', null, '刷卡机会', ' 时代峰峻污染和咖啡已汇入二维忽然看见合肥市大法师卡绥芬河骷髅巨人和', '杀戮空间业务我人很不v高科技暗示的温柔好看靠拢就好司法考试地方', null, '0', null);
INSERT INTO `hans_article` VALUES ('13', '1', 'hans', '0', null, '啥过分接口', '杀戮空间业务我人很不v高科技暗示的温柔好看靠拢就好司法考试地方', '讽德诵功借款人hi维护IPOUI阿我惹他要不下次看几个空间撒谎了UR一u', null, '0', null);
INSERT INTO `hans_article` VALUES ('14', '1', 'hans', '0', null, '框架', '昆仑决奢望和美女门把手健康水文化报下次吧女包个慢三步  ', 'the whole of life becomes an act of letting go, but what always hurts the most is not taking a moment to say goodbye', null, '0', null);
INSERT INTO `hans_article` VALUES ('15', '1', 'hans', '0', null, '电饭锅', '加工费开发他问卡时即为UR我，名字', '昆仑决够狠玛瑙么，是否是否问候日推哦如恶女答非所问 a3e2r3we4在大事发生的人人淡饭黄齑你们个有机会那些大润发同一人特然人我一会通过你加油', null, '0', null);
INSERT INTO `hans_article` VALUES ('16', '1', 'hans', '0', null, '三分毒', '昆仑决够狠玛瑙么，是否是否问候日推哦如恶女答非所问 a3e2r3we4在大事发生的人人', '淡饭黄齑你们个有机会那些大润发同一人特然人我一会通过你加油', null, '0', null);
INSERT INTO `hans_article` VALUES ('17', '1', 'hans', '0', null, '生无可恋', '讽德诵功借款人hi维护IPOUI阿我惹他要不下次看几个空间撒谎了UR一u', '萨日天沃特股份女不女发过火于同一一个火你就从v官方更符合人体姑获鸟', null, '0', null);
INSERT INTO `hans_article` VALUES ('18', '1', 'hans', '0', null, '萨达', '萨日天沃特股份女不女发过火于同一一个火你就从v官方更符合人体姑获鸟', '东方花园框架v撑杆跳二胎发个画法几何具体有和你同意让她有', null, '0', null);
INSERT INTO `hans_article` VALUES ('19', '1', 'hans', '0', null, '输入法的', '席不好土方回填人家女包你发大鱼海棠改不好 额问题人生巅峰GV地方', '收到了氛围进入汉王科技发送给看链接会儿玩阿拉山口任务', null, '0', null);
INSERT INTO `hans_article` VALUES ('20', '1', 'hans', '0', null, '东风股份', '东方花园框架v撑杆跳二胎发个画法几何具体有和你同意让她有', '那一天我二十一岁，在我一生的黄金时代。我有好多奢望。我想爱，想吃，还想在一瞬间变成天上半明半暗的云。', null, '0', null);
INSERT INTO `hans_article` VALUES ('21', '1', 'hans', '0', null, '深入访谈', '食发鬼陶渊明你还没v奉公如法的沟通你发让他脱衣服忽高忽低索菲特金地方共和国返回', '那一天我二十一岁，在我一生的黄金时代。我有好多奢望。我想爱，想吃，还想在一瞬间变成天上半明半暗的云。', null, '0', null);
INSERT INTO `hans_article` VALUES ('22', '1', 'hans', '0', null, '萨达', '对方回复济公活佛副阳台有电放保函几个库， 觥筹交错购房合同官方那个发热体育', 'A big wind rises， clouds are driven away. Home am Inow the world is under my sway. Where are brave men to guard the four frontiers today！', null, '0', null);
INSERT INTO `hans_article` VALUES ('23', '1', 'hans', '0', null, '都有人同意', '淡饭黄齑你们个有机会那些大润发同一人特然人我一会通过你加油', '那时候刚好下着雨，柏油路面湿冷冷的，还闪烁着青、黄、红颜色的灯火。我们就在骑楼下躲雨，看绿色的邮筒孤独地站在街的对面。', null, '0', null);
INSERT INTO `hans_article` VALUES ('24', '2', 'guoguo', '0', null, '的十分温柔', '大商股份人', '<p>萨德入味儿及还款宏发科技如何去诶无人看是否打包v电饭锅看链接机也日趋我王亚茹IQ唯一开了几个缓过来大富科技哈喽&nbsp; 卡德加首付款建安费<span style=\"font-size: 24px;\">额认为和区位依然</span></p>', null, '0', '1516092761');

-- ----------------------------
-- Table structure for hans_discuse
-- ----------------------------
DROP TABLE IF EXISTS `hans_discuse`;
CREATE TABLE `hans_discuse` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(50) DEFAULT NULL COMMENT '评论人id',
  `article_id` int(50) DEFAULT NULL COMMENT '文章id',
  `content` varchar(200) DEFAULT NULL COMMENT '评论内容',
  `addtime` varchar(10) DEFAULT NULL COMMENT '评论添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hans_discuse
-- ----------------------------
INSERT INTO `hans_discuse` VALUES ('1', '2', '1', '这是测试的第一条数据', '1516176219');
INSERT INTO `hans_discuse` VALUES ('2', '1', '1', '我觉得楼上说的对', '1516177271');
INSERT INTO `hans_discuse` VALUES ('3', '1', '1', '你们是在互相吹捧吗？？？', '1516177419');
INSERT INTO `hans_discuse` VALUES ('4', '2', '1', '大放松的', '1516180749');
INSERT INTO `hans_discuse` VALUES ('5', '2', '1', '电饭锅东方红返回结果', '1516180989');
INSERT INTO `hans_discuse` VALUES ('6', '2', '3', '+655电热毯个人头', '1516181662');
INSERT INTO `hans_discuse` VALUES ('7', '2', '3', '代扣逻辑分散度佛如我怄气及代扣风继续吹女客服法鲁尔的v框架光辉岁月天气网和v继续吧小猪宝啊啊UI绕一圈 按计划副科级阿什顿发啊看的机会发的是衣服无法啊看极寒风暴V字形那边v阿斯加德分积分可以日文', '1516181714');

-- ----------------------------
-- Table structure for hans_user
-- ----------------------------
DROP TABLE IF EXISTS `hans_user`;
CREATE TABLE `hans_user` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `sex` int(1) DEFAULT NULL COMMENT '性别 0 女  1 男',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `exhibit` text COMMENT '我的形象',
  `addtime` int(12) DEFAULT NULL COMMENT '注册时间',
  `birthday` varchar(20) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '用户状态  0 正常 1 封号',
  `pass_question` varchar(50) DEFAULT NULL COMMENT '密保问题',
  `pass_answer` varchar(20) DEFAULT NULL COMMENT '密保答案',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `addtime` (`addtime`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of hans_user
-- ----------------------------
INSERT INTO `hans_user` VALUES ('1', 'hans', 'e10adc3949ba59abbe56e057f20f883e', null, '110@qq.com', null, null, null, null, null, '19921204', '0', null, null);
INSERT INTO `hans_user` VALUES ('2', 'guoguo', 'e10adc3949ba59abbe56e057f20f883e', null, '1017897955@qq.com', null, null, null, null, null, '19921210', '0', null, null);

-- ----------------------------
-- Table structure for store_express
-- ----------------------------
DROP TABLE IF EXISTS `store_express`;
CREATE TABLE `store_express` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `express_title` varchar(50) DEFAULT '' COMMENT '快递公司名称',
  `express_code` varchar(50) DEFAULT '' COMMENT '快递公司代码',
  `express_desc` text COMMENT '快递公司描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0.无效,1.有效)',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='商城快递配置';

-- ----------------------------
-- Records of store_express
-- ----------------------------
INSERT INTO `store_express` VALUES ('5', 'AAE全球专递', 'aae', '顺丰快递公司', '0', '0', '0', '2017-09-12 11:53:40');
INSERT INTO `store_express` VALUES ('6', '安捷快递', 'anjie', '', '0', '0', '0', '2017-09-13 15:27:26');
INSERT INTO `store_express` VALUES ('7', '安信达快递', 'anxindakuaixi', null, '0', '0', '0', '2017-09-13 16:05:19');
INSERT INTO `store_express` VALUES ('8', '彪记快递', 'biaojikuaidi', null, '0', '0', '0', '2017-09-13 16:05:26');
INSERT INTO `store_express` VALUES ('9', 'BHT', 'bht', '', '0', '0', '0', '2017-09-13 16:05:37');
INSERT INTO `store_express` VALUES ('10', '百福东方国际物流', 'baifudongfang', null, '0', '0', '0', '2017-09-13 16:05:41');
INSERT INTO `store_express` VALUES ('11', '中国东方（COE）', 'coe', null, '0', '0', '0', '2017-09-13 16:05:48');
INSERT INTO `store_express` VALUES ('12', '长宇物流', 'changyuwuliu', null, '0', '0', '0', '2017-09-13 16:05:58');
INSERT INTO `store_express` VALUES ('13', '大田物流', 'datianwuliu', null, '0', '0', '0', '2017-09-13 16:06:06');
INSERT INTO `store_express` VALUES ('14', '德邦物流', 'debangwuliu', null, '1', '1', '0', '2017-09-13 16:06:14');
INSERT INTO `store_express` VALUES ('15', 'DHL', 'dhl', null, '0', '0', '0', '2017-09-13 16:06:24');
INSERT INTO `store_express` VALUES ('16', 'DPEX', 'dpex', null, '0', '0', '0', '2017-09-13 16:06:29');
INSERT INTO `store_express` VALUES ('17', 'd速快递', 'dsukuaidi', null, '0', '0', '0', '2017-09-13 16:06:34');
INSERT INTO `store_express` VALUES ('18', '递四方', 'disifang', null, '0', '0', '0', '2017-09-13 16:06:40');
INSERT INTO `store_express` VALUES ('19', 'EMS快递', 'ems', '', '1', '0', '0', '2017-09-13 16:06:47');
INSERT INTO `store_express` VALUES ('20', 'FEDEX（国外）', 'fedex', null, '0', '0', '0', '2017-09-13 16:06:56');
INSERT INTO `store_express` VALUES ('21', '飞康达物流', 'feikangda', null, '0', '0', '0', '2017-09-13 16:07:03');
INSERT INTO `store_express` VALUES ('22', '凤凰快递', 'fenghuangkuaidi', null, '0', '0', '0', '2017-09-13 16:07:10');
INSERT INTO `store_express` VALUES ('23', '飞快达', 'feikuaida', null, '0', '0', '0', '2017-09-13 16:07:16');
INSERT INTO `store_express` VALUES ('24', '国通快递', 'guotongkuaidi', null, '0', '0', '0', '2017-09-13 16:07:27');
INSERT INTO `store_express` VALUES ('25', '港中能达物流', 'ganzhongnengda', null, '0', '0', '0', '2017-09-13 16:07:33');
INSERT INTO `store_express` VALUES ('26', '广东邮政物流', 'guangdongyouzhengwuliu', null, '0', '0', '0', '2017-09-13 16:08:22');
INSERT INTO `store_express` VALUES ('27', '共速达', 'gongsuda', null, '0', '0', '0', '2017-09-13 16:08:48');
INSERT INTO `store_express` VALUES ('28', '汇通快运', 'huitongkuaidi', null, '0', '0', '0', '2017-09-13 16:08:56');
INSERT INTO `store_express` VALUES ('29', '恒路物流', 'hengluwuliu', null, '0', '0', '0', '2017-09-13 16:09:02');
INSERT INTO `store_express` VALUES ('30', '华夏龙物流', 'huaxialongwuliu', null, '0', '0', '0', '2017-09-13 16:09:12');
INSERT INTO `store_express` VALUES ('31', '海红', 'haihongwangsong', null, '0', '0', '0', '2017-09-13 16:09:20');
INSERT INTO `store_express` VALUES ('32', '海外环球', 'haiwaihuanqiu', null, '0', '0', '0', '2017-09-13 16:09:27');
INSERT INTO `store_express` VALUES ('33', '佳怡物流', 'jiayiwuliu', null, '0', '0', '0', '2017-09-13 16:09:35');
INSERT INTO `store_express` VALUES ('34', '京广速递', 'jinguangsudikuaijian', null, '0', '0', '0', '2017-09-13 16:09:42');
INSERT INTO `store_express` VALUES ('35', '急先达', 'jixianda', null, '0', '0', '0', '2017-09-13 16:09:49');
INSERT INTO `store_express` VALUES ('36', '佳吉物流', 'jjwl', null, '0', '0', '0', '2017-09-13 16:10:01');
INSERT INTO `store_express` VALUES ('37', '加运美物流', 'jymwl', null, '0', '0', '0', '2017-09-13 16:10:13');
INSERT INTO `store_express` VALUES ('38', '金大物流', 'jindawuliu', null, '0', '0', '0', '2017-09-13 16:10:22');
INSERT INTO `store_express` VALUES ('39', '嘉里大通', 'jialidatong', null, '0', '0', '0', '2017-09-13 16:10:33');
INSERT INTO `store_express` VALUES ('40', '晋越快递', 'jykd', null, '0', '0', '0', '2017-09-13 16:10:40');
INSERT INTO `store_express` VALUES ('41', '快捷速递', 'kuaijiesudi', null, '0', '0', '0', '2017-09-13 16:10:49');
INSERT INTO `store_express` VALUES ('42', '联邦快递（国内）', 'lianb', null, '0', '0', '0', '2017-09-13 16:10:58');
INSERT INTO `store_express` VALUES ('43', '联昊通物流', 'lianhaowuliu', null, '0', '0', '0', '2017-09-13 16:11:07');
INSERT INTO `store_express` VALUES ('44', '龙邦物流', 'longbanwuliu', null, '0', '0', '0', '2017-09-13 16:11:15');
INSERT INTO `store_express` VALUES ('45', '立即送', 'lijisong', null, '0', '0', '0', '2017-09-13 16:11:25');
INSERT INTO `store_express` VALUES ('46', '乐捷递', 'lejiedi', null, '0', '0', '0', '2017-09-13 16:11:36');
INSERT INTO `store_express` VALUES ('47', '民航快递', 'minghangkuaidi', null, '0', '0', '0', '2017-09-13 16:11:45');
INSERT INTO `store_express` VALUES ('48', '美国快递', 'meiguokuaidi', null, '0', '0', '0', '2017-09-13 16:11:53');
INSERT INTO `store_express` VALUES ('49', '门对门', 'menduimen', null, '0', '0', '0', '2017-09-13 16:12:01');
INSERT INTO `store_express` VALUES ('50', 'OCS', 'ocs', null, '0', '0', '0', '2017-09-13 16:12:10');
INSERT INTO `store_express` VALUES ('51', '配思货运', 'peisihuoyunkuaidi', null, '0', '0', '0', '2017-09-13 16:12:18');
INSERT INTO `store_express` VALUES ('52', '全晨快递', 'quanchenkuaidi', null, '0', '0', '0', '2017-09-13 16:12:26');
INSERT INTO `store_express` VALUES ('53', '全峰快递', 'quanfengkuaidi', null, '0', '0', '0', '2017-09-13 16:12:34');
INSERT INTO `store_express` VALUES ('54', '全际通物流', 'quanjitong', null, '0', '0', '0', '2017-09-13 16:12:41');
INSERT INTO `store_express` VALUES ('55', '全日通快递', 'quanritongkuaidi', null, '0', '0', '0', '2017-09-13 16:12:49');
INSERT INTO `store_express` VALUES ('56', '全一快递', 'quanyikuaidi', null, '0', '0', '0', '2017-09-13 16:12:56');
INSERT INTO `store_express` VALUES ('57', '如风达', 'rufengda', null, '0', '0', '0', '2017-09-13 16:13:03');
INSERT INTO `store_express` VALUES ('58', '三态速递', 'santaisudi', null, '0', '0', '0', '2017-09-13 16:13:15');
INSERT INTO `store_express` VALUES ('59', '盛辉物流', 'shenghuiwuliu', null, '0', '0', '0', '2017-09-13 16:13:22');
INSERT INTO `store_express` VALUES ('60', '申通', 'shentong', null, '0', '0', '0', '2017-09-13 16:13:34');
INSERT INTO `store_express` VALUES ('61', '顺丰', 'shunfeng', '', '1', '0', '0', '2017-09-13 16:13:41');
INSERT INTO `store_express` VALUES ('62', '速尔物流', 'sue', null, '0', '0', '0', '2017-09-13 16:13:48');
INSERT INTO `store_express` VALUES ('63', '盛丰物流', 'shengfeng', null, '0', '0', '0', '2017-09-13 16:13:55');
INSERT INTO `store_express` VALUES ('64', '赛澳递', 'saiaodi', null, '0', '0', '0', '2017-09-13 16:14:02');
INSERT INTO `store_express` VALUES ('65', '天地华宇', 'tiandihuayu', null, '0', '0', '0', '2017-09-13 16:14:11');
INSERT INTO `store_express` VALUES ('66', '天天快递', 'tiantian', null, '0', '0', '0', '2017-09-13 16:14:19');
INSERT INTO `store_express` VALUES ('67', 'TNT', 'tnt', null, '0', '0', '0', '2017-09-13 16:14:26');
INSERT INTO `store_express` VALUES ('68', 'UPS', 'ups', null, '0', '0', '0', '2017-09-13 16:14:29');
INSERT INTO `store_express` VALUES ('69', '万家物流', 'wanjiawuliu', null, '0', '0', '0', '2017-09-13 16:14:37');
INSERT INTO `store_express` VALUES ('70', '文捷航空速递', 'wenjiesudi', null, '0', '0', '0', '2017-09-13 16:14:46');
INSERT INTO `store_express` VALUES ('71', '伍圆', 'wuyuan', null, '0', '0', '0', '2017-09-13 16:14:52');
INSERT INTO `store_express` VALUES ('72', '万象物流', 'wxwl', null, '0', '0', '0', '2017-09-13 16:15:00');
INSERT INTO `store_express` VALUES ('73', '新邦物流', 'xinbangwuliu', null, '0', '0', '0', '2017-09-13 16:15:06');
INSERT INTO `store_express` VALUES ('74', '信丰物流', 'xinfengwuliu', null, '0', '0', '0', '2017-09-13 16:15:15');
INSERT INTO `store_express` VALUES ('75', '亚风速递', 'yafengsudi', null, '0', '0', '0', '2017-09-13 16:15:23');
INSERT INTO `store_express` VALUES ('76', '一邦速递', 'yibangwuliu', null, '0', '0', '0', '2017-09-13 16:15:30');
INSERT INTO `store_express` VALUES ('77', '优速物流', 'youshuwuliu', null, '0', '0', '0', '2017-09-13 16:15:36');
INSERT INTO `store_express` VALUES ('78', '邮政包裹挂号信', 'youzhengguonei', null, '0', '3', '0', '2017-09-13 16:15:44');
INSERT INTO `store_express` VALUES ('79', '邮政国际包裹挂号信', 'youzhengguoji', null, '0', '2', '0', '2017-09-13 16:15:51');
INSERT INTO `store_express` VALUES ('80', '远成物流', 'yuanchengwuliu', null, '0', '0', '0', '2017-09-13 16:15:57');
INSERT INTO `store_express` VALUES ('81', '圆通速递', 'yuantong', null, '1', '1', '0', '2017-09-13 16:16:03');
INSERT INTO `store_express` VALUES ('82', '源伟丰快递', 'yuanweifeng', null, '0', '0', '0', '2017-09-13 16:16:10');
INSERT INTO `store_express` VALUES ('83', '元智捷诚快递', 'yuanzhijiecheng', null, '0', '0', '0', '2017-09-13 16:16:17');
INSERT INTO `store_express` VALUES ('84', '韵达快运', 'yunda', null, '0', '0', '0', '2017-09-13 16:16:24');
INSERT INTO `store_express` VALUES ('85', '运通快递', 'yuntongkuaidi', null, '0', '0', '0', '2017-09-13 16:16:33');
INSERT INTO `store_express` VALUES ('86', '越丰物流', 'yuefengwuliu', null, '0', '0', '0', '2017-09-13 16:16:40');
INSERT INTO `store_express` VALUES ('87', '源安达', 'yad', null, '0', '0', '0', '2017-09-13 16:16:47');
INSERT INTO `store_express` VALUES ('88', '银捷速递', 'yinjiesudi', null, '0', '0', '0', '2017-09-13 16:16:56');
INSERT INTO `store_express` VALUES ('89', '宅急送', 'zhaijisong', null, '0', '0', '0', '2017-09-13 16:17:03');
INSERT INTO `store_express` VALUES ('90', '中铁快运', 'zhongtiekuaiyun', null, '0', '0', '0', '2017-09-13 16:17:10');
INSERT INTO `store_express` VALUES ('91', '中通速递', 'zhongtong', '', '0', '0', '0', '2017-09-13 16:17:16');
INSERT INTO `store_express` VALUES ('92', '中邮物流', 'zhongyouwuliu', null, '0', '0', '0', '2017-09-13 16:17:27');
INSERT INTO `store_express` VALUES ('93', '忠信达', 'zhongxinda', null, '0', '0', '0', '2017-09-13 16:17:34');
INSERT INTO `store_express` VALUES ('94', '芝麻开门', 'zhimakaimen', null, '0', '0', '0', '2017-09-13 16:17:41');

-- ----------------------------
-- Table structure for store_goods
-- ----------------------------
DROP TABLE IF EXISTS `store_goods`;
CREATE TABLE `store_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) unsigned DEFAULT '0' COMMENT '品牌ID',
  `cate_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品分类id',
  `unit_id` bigint(20) DEFAULT NULL COMMENT '商品单位ID',
  `spec_id` bigint(20) unsigned DEFAULT '0' COMMENT '规格ID',
  `tags_id` varchar(255) DEFAULT '' COMMENT '商品标签ID',
  `is_code` bigint(1) DEFAULT '1' COMMENT '是否有码商品',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品标签',
  `goods_content` text COMMENT '商品内容',
  `goods_logo` varchar(255) DEFAULT '' COMMENT '商品LOGO',
  `goods_image` text COMMENT '商品图片地址',
  `goods_video` varchar(500) DEFAULT '' COMMENT '商品视频URL',
  `goods_desc` varchar(500) DEFAULT '' COMMENT '商品描述',
  `package_stock` bigint(20) unsigned DEFAULT '0' COMMENT '总库存数量',
  `package_sale` bigint(20) unsigned DEFAULT '0' COMMENT '已销售数量',
  `favorite_num` bigint(20) unsigned DEFAULT '0' COMMENT '收藏次数',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '数据排序',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城商品主表';

-- ----------------------------
-- Records of store_goods
-- ----------------------------

-- ----------------------------
-- Table structure for store_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_brand`;
CREATE TABLE `store_goods_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_logo` varchar(1024) DEFAULT '' COMMENT '品牌logo',
  `brand_cover` varchar(1024) DEFAULT '' COMMENT '品牌封面',
  `brand_title` varchar(255) DEFAULT '' COMMENT '商品品牌名称',
  `brand_desc` text COMMENT '商品品牌描述',
  `brand_detail` text COMMENT '品牌图文信息',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '商品分类排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品品牌';

-- ----------------------------
-- Records of store_goods_brand
-- ----------------------------

-- ----------------------------
-- Table structure for store_goods_cate
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_cate`;
CREATE TABLE `store_goods_cate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '上级分类编号',
  `brand_id` bigint(20) DEFAULT '0' COMMENT '品牌ID',
  `cate_title` varchar(255) DEFAULT '' COMMENT '商品分类名称',
  `cate_desc` text COMMENT '商品分类',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '商品分类排序',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城商品分类';

-- ----------------------------
-- Records of store_goods_cate
-- ----------------------------

-- ----------------------------
-- Table structure for store_goods_list
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_list`;
CREATE TABLE `store_goods_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(255) DEFAULT '' COMMENT '商品规格名称',
  `goods_number` bigint(20) unsigned DEFAULT '0' COMMENT '商品礼品-商品数量',
  `market_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '销售价格',
  `selling_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品价格',
  `goods_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存统计',
  `goods_sale` bigint(20) unsigned DEFAULT '0' COMMENT '已销售数量',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城商品列表';

-- ----------------------------
-- Records of store_goods_list
-- ----------------------------

-- ----------------------------
-- Table structure for store_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_spec`;
CREATE TABLE `store_goods_spec` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mch_id` bigint(20) unsigned DEFAULT '0' COMMENT '商户ID',
  `spec_title` varchar(255) DEFAULT '' COMMENT '商品规格名称',
  `spec_param` varchar(255) DEFAULT '' COMMENT '商品规格参数',
  `spec_desc` varchar(255) DEFAULT '' COMMENT '商品规格描述',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '商品规格排序',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_store_goods_spec_mch_id` (`mch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城商品规格';

-- ----------------------------
-- Records of store_goods_spec
-- ----------------------------

-- ----------------------------
-- Table structure for store_goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `store_goods_stock`;
CREATE TABLE `store_goods_stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) unsigned DEFAULT '0' COMMENT '商品ID',
  `goods_spec` varchar(255) DEFAULT '' COMMENT '商品属性',
  `goods_stock` bigint(20) unsigned DEFAULT '0' COMMENT '商品库存',
  `stock_desc` varchar(255) DEFAULT '' COMMENT '商品库存描述',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '数据排序',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城商品库存';

-- ----------------------------
-- Records of store_goods_stock
-- ----------------------------

-- ----------------------------
-- Table structure for store_member
-- ----------------------------
DROP TABLE IF EXISTS `store_member`;
CREATE TABLE `store_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT '' COMMENT '会员微信OPENID',
  `phone` varchar(16) DEFAULT '' COMMENT '会员手机号',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码',
  `nickname` varchar(20) DEFAULT '' COMMENT '会员昵称',
  `headimg` varchar(500) DEFAULT '' COMMENT '会员头像',
  `sex` char(2) DEFAULT '' COMMENT '性别',
  `level` tinyint(2) unsigned DEFAULT '1' COMMENT '会员级别',
  `remark` varchar(500) DEFAULT '' COMMENT '会员个性签名',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '会员状态(1有效,0无效)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_store_member_openid` (`openid`) USING BTREE,
  KEY `index_store_member_phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城会员信息';

-- ----------------------------
-- Records of store_member
-- ----------------------------

-- ----------------------------
-- Table structure for store_member_address
-- ----------------------------
DROP TABLE IF EXISTS `store_member_address`;
CREATE TABLE `store_member_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `username` varchar(20) DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) DEFAULT '' COMMENT '收货手机号',
  `province` varchar(50) DEFAULT '' COMMENT '收货地址省份',
  `city` varchar(50) DEFAULT '' COMMENT '收货地址城市',
  `area` varchar(255) DEFAULT '' COMMENT '收货地址区域',
  `address` varchar(255) DEFAULT '' COMMENT '收货详细地址',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0无效, 1新快递)',
  `is_default` tinyint(1) unsigned DEFAULT '1' COMMENT '默认收货地址',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城会员收货地址';

-- ----------------------------
-- Records of store_member_address
-- ----------------------------

-- ----------------------------
-- Table structure for store_order
-- ----------------------------
DROP TABLE IF EXISTS `store_order`;
CREATE TABLE `store_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '订单类型(1普通订单,2积分订单)',
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `order_no` char(10) DEFAULT '' COMMENT '订单号',
  `freight_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '快递费',
  `goods_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品总金额(不含快递费)',
  `real_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '真实支付金额(商品金额+快递金额)',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '订单支付状态(0.未支付,1.已支付)',
  `pay_type` varchar(255) DEFAULT '' COMMENT '支付方式 (wechat微信支付, alipay支付宝支付)',
  `pay_no` varchar(100) DEFAULT '' COMMENT '商户交易号',
  `pay_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '实际支付金额',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `desc` text COMMENT '订单描述',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '订单状态(0.无效,1.新订单,2.待发货,3.已发货,4.已收货,5.已完成,6.已退货及退款)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_store_order_order_no` (`order_no`) USING BTREE,
  KEY `index_store_order_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城订单主表';

-- ----------------------------
-- Records of store_order
-- ----------------------------

-- ----------------------------
-- Table structure for store_order_express
-- ----------------------------
DROP TABLE IF EXISTS `store_order_express`;
CREATE TABLE `store_order_express` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `type` tinyint(1) unsigned DEFAULT '0' COMMENT '快递类型(0.订单快递,1.退货快递)',
  `order_no` char(10) DEFAULT '' COMMENT '订单编号',
  `company_title` varchar(50) DEFAULT '' COMMENT '物流公司名称',
  `company_code` varchar(50) DEFAULT '' COMMENT '物流公司编码',
  `username` varchar(20) DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) DEFAULT '' COMMENT '收货手机号',
  `province` varchar(50) DEFAULT NULL COMMENT '收货地址省份',
  `city` varchar(50) DEFAULT '' COMMENT '收货地址城市',
  `area` varchar(255) DEFAULT '' COMMENT '收货地址区域',
  `address` varchar(255) DEFAULT '' COMMENT '收货详细地址',
  `send_no` varchar(50) DEFAULT '' COMMENT '实际物流公司单号',
  `send_company_title` varchar(50) DEFAULT '' COMMENT '实际发货快递公司',
  `send_company_code` varchar(50) DEFAULT '' COMMENT '实际发货快递代码',
  `send_username` varchar(255) DEFAULT '' COMMENT '寄件人名称',
  `send_phone` varchar(16) DEFAULT '' COMMENT '寄件人手机号',
  `send_province` varchar(50) DEFAULT '' COMMENT '寄件人地址省份',
  `send_city` varchar(50) DEFAULT '' COMMENT '寄件人地址城市',
  `send_area` varchar(255) DEFAULT '' COMMENT '寄件人地址区域',
  `send_address` varchar(255) DEFAULT '' COMMENT '寄件人详细地址',
  `send_at` datetime DEFAULT NULL COMMENT '快递发货时间',
  `desc` text COMMENT '发货描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0.无效,1.新快递,2.已签收,3.签收失败)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城订单快递';

-- ----------------------------
-- Records of store_order_express
-- ----------------------------

-- ----------------------------
-- Table structure for store_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `store_order_goods`;
CREATE TABLE `store_order_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) unsigned DEFAULT '0' COMMENT '会员ID',
  `order_no` char(10) DEFAULT '' COMMENT '订单编号',
  `goods_id` bigint(20) DEFAULT '0' COMMENT '商品ID',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品标签',
  `goods_spec` varchar(255) DEFAULT '' COMMENT '商品规格',
  `goods_logo` varchar(255) DEFAULT '' COMMENT '商品LOGO',
  `goods_image` text COMMENT '商品图片地址',
  `market_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '市场价格',
  `selling_price` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '商品销售价格',
  `price_field` varchar(20) DEFAULT 'selling_price' COMMENT '计价字段',
  `number` bigint(20) unsigned DEFAULT '0' COMMENT '订单商品数量',
  `status` bigint(1) unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint(1) unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_store_order_list_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城订单关联商品';

-- ----------------------------
-- Records of store_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(11) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_auth_title` (`title`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统权限表';

-- ----------------------------
-- Records of system_auth
-- ----------------------------

-- ----------------------------
-- Table structure for system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) DEFAULT NULL COMMENT '节点路径',
  PRIMARY KEY (`id`),
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色与节点绑定';

-- ----------------------------
-- Records of system_auth_node
-- ----------------------------

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置编码',
  `value` varchar(500) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`),
  KEY `index_system_config_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='系统参数配置';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', 'app_name', 'ThinkAdmin');
INSERT INTO `system_config` VALUES ('2', 'site_name', 'ThinkAdmin');
INSERT INTO `system_config` VALUES ('3', 'app_version', '3.0 dev');
INSERT INTO `system_config` VALUES ('4', 'site_copy', '©版权所有 2014-2018 楚才科技');
INSERT INTO `system_config` VALUES ('5', 'browser_icon', 'http://localhost/ThinkAdmin/static/upload/f47b8fe06e38ae99/08e8398da45583b9.png');
INSERT INTO `system_config` VALUES ('6', 'tongji_baidu_key', '');
INSERT INTO `system_config` VALUES ('7', 'miitbeian', '粤ICP备16006642号-2');
INSERT INTO `system_config` VALUES ('8', 'storage_type', 'local');
INSERT INTO `system_config` VALUES ('9', 'storage_local_exts', 'png,jpg,rar,doc,icon,mp4');
INSERT INTO `system_config` VALUES ('10', 'storage_qiniu_bucket', '');
INSERT INTO `system_config` VALUES ('11', 'storage_qiniu_domain', '');
INSERT INTO `system_config` VALUES ('12', 'storage_qiniu_access_key', '');
INSERT INTO `system_config` VALUES ('13', 'storage_qiniu_secret_key', '');
INSERT INTO `system_config` VALUES ('14', 'storage_oss_bucket', 'cuci');
INSERT INTO `system_config` VALUES ('15', 'storage_oss_endpoint', 'oss-cn-beijing.aliyuncs.com');
INSERT INTO `system_config` VALUES ('16', 'storage_oss_domain', 'cuci.oss-cn-beijing.aliyuncs.com');
INSERT INTO `system_config` VALUES ('17', 'storage_oss_keyid', '用你自己的吧');
INSERT INTO `system_config` VALUES ('18', 'storage_oss_secret', '用你自己的吧');
INSERT INTO `system_config` VALUES ('34', 'wechat_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('35', 'wechat_appkey', '9890a0d7c91801a609d151099e95b61a');
INSERT INTO `system_config` VALUES ('36', 'storage_oss_is_https', 'http');
INSERT INTO `system_config` VALUES ('37', 'wechat_type', 'thr');
INSERT INTO `system_config` VALUES ('38', 'wechat_token', 'test');
INSERT INTO `system_config` VALUES ('39', 'wechat_appsecret', 'a041bec98ed015d52b99acea5c6a16ef');
INSERT INTO `system_config` VALUES ('40', 'wechat_encodingaeskey', 'BJIUzE0gqlWy0GxfPp4J1oPTBmOrNDIGPNav1YFH5Z5');
INSERT INTO `system_config` VALUES ('41', 'wechat_thr_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('42', 'wechat_thr_appkey', '05db2aa335382c66ab56d69b1a9ad0ee');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2018-05-31 11:21:22');
INSERT INTO `system_log` VALUES ('2', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '2018-05-31 17:04:31');
INSERT INTO `system_log` VALUES ('3', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2018-05-31 17:12:32');
INSERT INTO `system_log` VALUES ('4', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2018-06-05 08:55:12');
INSERT INTO `system_log` VALUES ('5', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2018-06-06 09:01:35');
INSERT INTO `system_log` VALUES ('6', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '2018-06-06 09:02:30');
INSERT INTO `system_log` VALUES ('7', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2018-06-06 09:07:57');
INSERT INTO `system_log` VALUES ('8', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '2018-06-06 09:09:31');
INSERT INTO `system_log` VALUES ('9', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2018-06-06 15:19:50');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '0', '系统设置', '', '', '#', '', '_self', '9000', '1', '10000', '2018-01-19 15:27:00');
INSERT INTO `system_menu` VALUES ('2', '10', '后台菜单', '', 'fa fa-leaf', 'admin/menu/index', '', '_self', '10', '1', '10000', '2018-01-19 15:27:17');
INSERT INTO `system_menu` VALUES ('3', '10', '系统参数', '', 'fa fa-modx', 'admin/config/index', '', '_self', '20', '1', '10000', '2018-01-19 15:27:57');
INSERT INTO `system_menu` VALUES ('4', '11', '访问授权', '', 'fa fa-group', 'admin/auth/index', '', '_self', '20', '1', '10000', '2018-01-22 11:13:02');
INSERT INTO `system_menu` VALUES ('5', '11', '用户管理', '', 'fa fa-user', 'admin/user/index', '', '_self', '10', '1', '0', '2018-01-23 12:15:12');
INSERT INTO `system_menu` VALUES ('6', '11', '访问节点', '', 'fa fa-fort-awesome', 'admin/node/index', '', '_self', '30', '1', '0', '2018-01-23 12:36:54');
INSERT INTO `system_menu` VALUES ('7', '0', '后台首页', '', '', 'admin/index/main', '', '_self', '1000', '1', '0', '2018-01-23 13:42:30');
INSERT INTO `system_menu` VALUES ('8', '16', '系统日志', '', 'fa fa-code', 'admin/log/index', '', '_self', '10', '1', '0', '2018-01-24 13:52:58');
INSERT INTO `system_menu` VALUES ('9', '10', '文件存储', '', 'fa fa-stop-circle', 'admin/config/file', '', '_self', '30', '1', '0', '2018-01-25 10:54:28');
INSERT INTO `system_menu` VALUES ('10', '1', '系统管理', '', '', '#', '', '_self', '200', '1', '0', '2018-01-25 18:14:28');
INSERT INTO `system_menu` VALUES ('11', '1', '访问权限', '', '', '#', '', '_self', '300', '1', '0', '2018-01-25 18:15:08');
INSERT INTO `system_menu` VALUES ('16', '1', '日志管理', '', '', '#', '', '_self', '400', '1', '0', '2018-02-10 16:31:15');
INSERT INTO `system_menu` VALUES ('17', '0', '微信管理', '', '', '#', '', '_self', '8000', '1', '0', '2018-03-06 14:42:49');
INSERT INTO `system_menu` VALUES ('18', '17', '公众号配置', '', '', '#', '', '_self', '0', '1', '0', '2018-03-06 14:43:05');
INSERT INTO `system_menu` VALUES ('19', '18', '微信授权绑定', '', 'fa fa-cog', 'wechat/config/index', '', '_self', '0', '1', '0', '2018-03-06 14:43:26');
INSERT INTO `system_menu` VALUES ('20', '18', '关注默认回复', '', 'fa fa-comment-o', 'wechat/keys/subscribe', '', '_self', '0', '1', '0', '2018-03-06 14:44:45');
INSERT INTO `system_menu` VALUES ('21', '18', '无反馈默认回复', '', 'fa fa-commenting', 'wechat/keys/defaults', '', '_self', '0', '1', '0', '2018-03-06 14:45:55');
INSERT INTO `system_menu` VALUES ('22', '18', '微信关键字管理', '', 'fa fa-hashtag', 'wechat/keys/index', '', '_self', '0', '1', '0', '2018-03-06 14:46:23');
INSERT INTO `system_menu` VALUES ('23', '17', '微信服务定制', '', '', '#', '', '_self', '0', '1', '0', '2018-03-06 14:47:11');
INSERT INTO `system_menu` VALUES ('24', '23', '微信菜单管理', '', 'fa fa-gg-circle', 'wechat/menu/index', '', '_self', '0', '1', '0', '2018-03-06 14:47:39');
INSERT INTO `system_menu` VALUES ('25', '23', '微信图文管理', '', 'fa fa-map-o', 'wechat/news/index', '', '_self', '0', '1', '0', '2018-03-06 14:48:14');
INSERT INTO `system_menu` VALUES ('26', '17', '微信粉丝管理', '', 'fa fa-user', '#', '', '_self', '0', '1', '0', '2018-03-06 14:48:33');
INSERT INTO `system_menu` VALUES ('27', '26', '微信粉丝列表', '', 'fa fa-users', 'wechat/fans/index', '', '_self', '20', '1', '0', '2018-03-06 14:49:04');
INSERT INTO `system_menu` VALUES ('28', '26', '微信黑名单管理', '', 'fa fa-user-times', 'wechat/fans_block/index', '', '_self', '30', '1', '0', '2018-03-06 14:49:22');
INSERT INTO `system_menu` VALUES ('29', '26', '微信标签管理', '', 'fa fa-tags', 'wechat/tags/index', '', '_self', '10', '1', '0', '2018-03-06 14:49:39');
INSERT INTO `system_menu` VALUES ('32', '0', '商城管理', '', '', '#', '', '_self', '2000', '0', '0', '2018-03-20 16:46:07');
INSERT INTO `system_menu` VALUES ('33', '32', '商品管理', '', '', '#', '', '_self', '0', '0', '0', '2018-03-20 16:46:21');
INSERT INTO `system_menu` VALUES ('34', '33', '产品管理', '', 'fa fa-modx', 'store/goods/index', '', '_self', '0', '0', '0', '2018-03-20 16:46:45');
INSERT INTO `system_menu` VALUES ('35', '33', '规格管理', '', 'fa fa-hashtag', 'store/goods_spec/index', '', '_self', '0', '0', '0', '2018-03-20 16:47:08');
INSERT INTO `system_menu` VALUES ('36', '33', '分类管理', '', 'fa fa-product-hunt', 'store/goods_cate/index', '', '_self', '0', '0', '0', '2018-03-20 16:47:50');
INSERT INTO `system_menu` VALUES ('37', '33', '品牌管理', '', 'fa fa-scribd', 'store/goods_brand/index', '', '_self', '0', '0', '0', '2018-03-20 16:48:05');
INSERT INTO `system_menu` VALUES ('38', '32', '订单管理', '', '', '#', '', '_self', '0', '0', '0', '2018-04-21 15:07:36');
INSERT INTO `system_menu` VALUES ('39', '38', '订单列表', '', 'fa fa-adjust', 'store/order/index', '', '_self', '0', '0', '0', '2018-04-21 15:07:54');
INSERT INTO `system_menu` VALUES ('40', '32', '商城配置', '', '', '#', '', '_self', '0', '0', '0', '2018-04-21 15:08:17');
INSERT INTO `system_menu` VALUES ('41', '40', '参数管理', '', '', '#', '', '_self', '0', '0', '0', '2018-04-21 15:08:25');
INSERT INTO `system_menu` VALUES ('42', '40', '快递公司', '', 'fa fa-mixcloud', 'store/express/index', '', '_self', '0', '0', '0', '2018-04-21 15:08:50');
INSERT INTO `system_menu` VALUES ('43', '0', '博客管理', '', 'fa fa-coffee', '#', '', '_self', '8000', '1', '0', '2018-05-31 11:23:03');
INSERT INTO `system_menu` VALUES ('44', '43', '文章管理', '', 'fa fa-reddit-alien', 'blog/article/index', '', '_self', '0', '1', '0', '2018-05-31 11:27:06');
INSERT INTO `system_menu` VALUES ('45', '43', '新闻展示', '', 'fa fa-book', '/blog/article/news', '', '_self', '0', '1', '0', '2018-06-06 15:21:58');

-- ----------------------------
-- Table structure for system_node
-- ----------------------------
DROP TABLE IF EXISTS `system_node`;
CREATE TABLE `system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `is_menu` tinyint(1) unsigned DEFAULT '0' COMMENT '是否可设置为菜单',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `is_login` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动登录控制',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_node_node` (`node`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='系统节点表';

-- ----------------------------
-- Records of system_node
-- ----------------------------
INSERT INTO `system_node` VALUES ('13', 'admin', '系统设置', '0', '1', '1', '2018-05-04 11:02:34');
INSERT INTO `system_node` VALUES ('14', 'admin/auth', '权限管理', '0', '1', '1', '2018-05-04 11:06:55');
INSERT INTO `system_node` VALUES ('15', 'admin/auth/index', '权限列表', '1', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('16', 'admin/auth/apply', '权限配置', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('17', 'admin/auth/add', '添加权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('18', 'admin/auth/edit', '编辑权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('19', 'admin/auth/forbid', '禁用权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('20', 'admin/auth/resume', '启用权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('21', 'admin/auth/del', '删除权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('22', 'admin/config', '系统配置', '0', '1', '1', '2018-05-04 11:08:18');
INSERT INTO `system_node` VALUES ('23', 'admin/config/index', '系统参数', '1', '1', '1', '2018-05-04 11:08:25');
INSERT INTO `system_node` VALUES ('24', 'admin/config/file', '文件存储', '1', '1', '1', '2018-05-04 11:08:27');
INSERT INTO `system_node` VALUES ('25', 'admin/log', '日志管理', '0', '1', '1', '2018-05-04 11:08:43');
INSERT INTO `system_node` VALUES ('26', 'admin/log/index', '日志管理', '1', '1', '1', '2018-05-04 11:08:43');
INSERT INTO `system_node` VALUES ('28', 'admin/log/del', '日志删除', '0', '1', '1', '2018-05-04 11:08:43');
INSERT INTO `system_node` VALUES ('29', 'admin/menu', '系统菜单', '0', '1', '1', '2018-05-04 11:09:54');
INSERT INTO `system_node` VALUES ('30', 'admin/menu/index', '菜单列表', '1', '1', '1', '2018-05-04 11:09:54');
INSERT INTO `system_node` VALUES ('31', 'admin/menu/add', '添加菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('32', 'admin/menu/edit', '编辑菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('33', 'admin/menu/del', '删除菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('34', 'admin/menu/forbid', '禁用菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('35', 'admin/menu/resume', '启用菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('36', 'admin/node', '节点管理', '0', '1', '1', '2018-05-04 11:10:20');
INSERT INTO `system_node` VALUES ('37', 'admin/node/index', '节点列表', '1', '1', '1', '2018-05-04 11:10:20');
INSERT INTO `system_node` VALUES ('38', 'admin/node/clear', '清理节点', '0', '1', '1', '2018-05-04 11:10:21');
INSERT INTO `system_node` VALUES ('39', 'admin/node/save', '更新节点', '0', '1', '1', '2018-05-04 11:10:21');
INSERT INTO `system_node` VALUES ('40', 'admin/user', '系统用户', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('41', 'admin/user/index', '用户列表', '1', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('42', 'admin/user/auth', '用户授权', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('43', 'admin/user/add', '添加用户', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('44', 'admin/user/edit', '编辑用户', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('45', 'admin/user/pass', '修改密码', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('46', 'admin/user/del', '删除用户', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('47', 'admin/user/forbid', '禁用启用', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('48', 'admin/user/resume', '启用用户', '0', '1', '1', '2018-05-04 11:10:44');
INSERT INTO `system_node` VALUES ('49', 'store', '商城管理', '0', '1', '1', '2018-05-04 11:11:28');
INSERT INTO `system_node` VALUES ('50', 'store/express', '快递公司管理', '0', '1', '1', '2018-05-04 11:11:39');
INSERT INTO `system_node` VALUES ('51', 'store/express/index', '快递公司列表', '1', '1', '1', '2018-05-04 11:11:39');
INSERT INTO `system_node` VALUES ('52', 'store/express/add', '添加快递公司', '0', '1', '1', '2018-05-04 11:11:39');
INSERT INTO `system_node` VALUES ('53', 'store/express/edit', '编辑快递公司', '0', '1', '1', '2018-05-04 11:11:39');
INSERT INTO `system_node` VALUES ('54', 'store/express/del', '删除快递公司', '0', '1', '1', '2018-05-04 11:11:39');
INSERT INTO `system_node` VALUES ('55', 'store/express/forbid', '禁用快递公司', '0', '1', '1', '2018-05-04 11:11:39');
INSERT INTO `system_node` VALUES ('56', 'store/express/resume', '启用快递公司', '0', '1', '1', '2018-05-04 11:11:40');
INSERT INTO `system_node` VALUES ('57', 'store/order', '订单管理', '0', '1', '1', '2018-05-04 11:12:14');
INSERT INTO `system_node` VALUES ('58', 'store/order/index', '订单列表', '1', '1', '1', '2018-05-04 11:12:17');
INSERT INTO `system_node` VALUES ('59', 'store/order/address', '修改地址', '0', '1', '1', '2018-05-04 11:12:19');
INSERT INTO `system_node` VALUES ('76', 'wechat', '微信管理', '0', '1', '1', '2018-05-04 11:14:59');
INSERT INTO `system_node` VALUES ('78', 'wechat/config', '微信对接管理', '0', '1', '1', '2018-05-04 11:16:20');
INSERT INTO `system_node` VALUES ('79', 'wechat/config/index', '微信对接配置', '1', '1', '1', '2018-05-04 11:16:23');
INSERT INTO `system_node` VALUES ('80', 'wechat/fans', '微信粉丝管理', '0', '1', '1', '2018-05-04 11:16:31');
INSERT INTO `system_node` VALUES ('81', 'wechat/fans/index', '微信粉丝列表', '1', '1', '1', '2018-05-04 11:16:32');
INSERT INTO `system_node` VALUES ('82', 'wechat/fans/backadd', '微信粉丝拉黑', '0', '1', '1', '2018-05-04 11:16:32');
INSERT INTO `system_node` VALUES ('83', 'wechat/fans/tagset', '设置粉丝标签', '0', '1', '1', '2018-05-04 11:16:32');
INSERT INTO `system_node` VALUES ('84', 'wechat/fans/tagadd', '添加粉丝标签', '0', '1', '1', '2018-05-04 11:16:32');
INSERT INTO `system_node` VALUES ('85', 'wechat/fans/tagdel', '删除粉丝标签', '0', '1', '1', '2018-05-04 11:16:32');
INSERT INTO `system_node` VALUES ('86', 'wechat/fans/sync', '同步粉丝列表', '0', '1', '1', '2018-05-04 11:16:32');
INSERT INTO `system_node` VALUES ('87', 'wechat/fans_block', '粉丝黑名单管理', '0', '1', '1', '2018-05-04 11:17:25');
INSERT INTO `system_node` VALUES ('88', 'wechat/fans_block/index', '粉丝黑名单列表', '1', '1', '1', '2018-05-04 11:17:50');
INSERT INTO `system_node` VALUES ('89', 'wechat/fans_block/backdel', '移除粉丝黑名单', '0', '1', '1', '2018-05-04 11:17:51');
INSERT INTO `system_node` VALUES ('90', 'wechat/keys', '微信关键字', '0', '1', '1', '2018-05-04 11:18:09');
INSERT INTO `system_node` VALUES ('91', 'wechat/keys/index', '关键字列表', '1', '1', '1', '2018-05-04 11:18:09');
INSERT INTO `system_node` VALUES ('92', 'wechat/keys/add', '添加关键字', '0', '1', '1', '2018-05-04 11:18:09');
INSERT INTO `system_node` VALUES ('93', 'wechat/keys/edit', '编辑关键字', '0', '1', '1', '2018-05-04 11:18:09');
INSERT INTO `system_node` VALUES ('94', 'wechat/keys/del', '删除关键字', '0', '1', '1', '2018-05-04 11:18:09');
INSERT INTO `system_node` VALUES ('95', 'wechat/keys/forbid', '禁用关键字', '0', '1', '1', '2018-05-04 11:18:09');
INSERT INTO `system_node` VALUES ('96', 'wechat/keys/resume', '启用关键字', '0', '1', '1', '2018-05-04 11:18:09');
INSERT INTO `system_node` VALUES ('97', 'wechat/keys/subscribe', '关注回复', '1', '1', '1', '2018-05-04 11:18:09');
INSERT INTO `system_node` VALUES ('98', 'wechat/keys/defaults', '默认回复', '1', '1', '1', '2018-05-04 11:18:09');
INSERT INTO `system_node` VALUES ('99', 'wechat/menu', '微信菜单管理', '0', '1', '1', '2018-05-04 11:18:57');
INSERT INTO `system_node` VALUES ('100', 'wechat/menu/index', '微信菜单展示', '1', '1', '1', '2018-05-04 11:19:10');
INSERT INTO `system_node` VALUES ('101', 'wechat/menu/edit', '编辑微信菜单', '0', '1', '1', '2018-05-04 11:19:22');
INSERT INTO `system_node` VALUES ('102', 'wechat/menu/cancel', '取消微信菜单', '0', '1', '1', '2018-05-04 11:19:26');
INSERT INTO `system_node` VALUES ('103', 'wechat/news/index', '微信图文列表', '1', '1', '1', '2018-05-04 11:19:28');
INSERT INTO `system_node` VALUES ('104', 'wechat/news/select', '微信图文选择', '0', '1', '1', '2018-05-04 11:19:28');
INSERT INTO `system_node` VALUES ('105', 'wechat/news/image', '微信图片选择', '0', '1', '1', '2018-05-04 11:19:28');
INSERT INTO `system_node` VALUES ('106', 'wechat/news/add', '添加微信图文', '0', '1', '1', '2018-05-04 11:19:28');
INSERT INTO `system_node` VALUES ('107', 'wechat/news/edit', '编辑微信图文', '0', '1', '1', '2018-05-04 11:19:28');
INSERT INTO `system_node` VALUES ('108', 'wechat/news/del', '删除微信图文', '0', '1', '1', '2018-05-04 11:19:28');
INSERT INTO `system_node` VALUES ('109', 'wechat/news/push', '推送微信图文', '0', '1', '1', '2018-05-04 11:19:28');
INSERT INTO `system_node` VALUES ('110', 'wechat/news', '微信图文管理', '0', '1', '1', '2018-05-04 11:19:35');
INSERT INTO `system_node` VALUES ('111', 'wechat/tags', '微信粉丝标签管理', '0', '1', '1', '2018-05-04 11:20:28');
INSERT INTO `system_node` VALUES ('112', 'wechat/tags/index', '粉丝标签列表', '1', '1', '1', '2018-05-04 11:20:28');
INSERT INTO `system_node` VALUES ('113', 'wechat/tags/add', '添加粉丝标签', '0', '1', '1', '2018-05-04 11:20:28');
INSERT INTO `system_node` VALUES ('114', 'wechat/tags/edit', '编辑粉丝标签', '0', '1', '1', '2018-05-04 11:20:29');
INSERT INTO `system_node` VALUES ('115', 'wechat/tags/del', '删除粉丝标签', '0', '1', '1', '2018-05-04 11:20:29');
INSERT INTO `system_node` VALUES ('116', 'wechat/tags/sync', '同步粉丝标签', '0', '1', '1', '2018-05-04 11:20:29');
INSERT INTO `system_node` VALUES ('117', 'store/goods', '商品管理', '0', '1', '1', '2018-05-04 11:29:55');
INSERT INTO `system_node` VALUES ('118', 'store/goods/index', '商品列表', '1', '1', '1', '2018-05-04 11:29:56');
INSERT INTO `system_node` VALUES ('119', 'store/goods/add', '添加商品', '0', '1', '1', '2018-05-04 11:29:56');
INSERT INTO `system_node` VALUES ('120', 'store/goods/edit', '编辑商品', '0', '1', '1', '2018-05-04 11:29:56');
INSERT INTO `system_node` VALUES ('121', 'store/goods/del', '删除商品', '0', '1', '1', '2018-05-04 11:29:56');
INSERT INTO `system_node` VALUES ('122', 'store/goods/forbid', '下架商品', '0', '1', '1', '2018-05-04 11:29:56');
INSERT INTO `system_node` VALUES ('123', 'store/goods/resume', '上架商品', '0', '1', '1', '2018-05-04 11:29:57');
INSERT INTO `system_node` VALUES ('124', 'store/goods_brand', '商品品牌管理', '0', '1', '1', '2018-05-04 11:30:44');
INSERT INTO `system_node` VALUES ('125', 'store/goods_brand/index', '商品品牌列表', '1', '1', '1', '2018-05-04 11:30:52');
INSERT INTO `system_node` VALUES ('126', 'store/goods_brand/add', '添加商品品牌', '0', '1', '1', '2018-05-04 11:30:55');
INSERT INTO `system_node` VALUES ('127', 'store/goods_brand/edit', '编辑商品品牌', '0', '1', '1', '2018-05-04 11:30:56');
INSERT INTO `system_node` VALUES ('128', 'store/goods_brand/del', '删除商品品牌', '0', '1', '1', '2018-05-04 11:30:56');
INSERT INTO `system_node` VALUES ('129', 'store/goods_brand/forbid', '禁用商品品牌', '0', '1', '1', '2018-05-04 11:30:56');
INSERT INTO `system_node` VALUES ('130', 'store/goods_brand/resume', '启用商品品牌', '0', '1', '1', '2018-05-04 11:30:56');
INSERT INTO `system_node` VALUES ('131', 'store/goods_cate', '商品分类管理', '0', '1', '1', '2018-05-04 11:31:19');
INSERT INTO `system_node` VALUES ('132', 'store/goods_cate/index', '商品分类列表', '1', '1', '1', '2018-05-04 11:31:23');
INSERT INTO `system_node` VALUES ('133', 'store/goods_cate/add', '添加商品分类', '0', '1', '1', '2018-05-04 11:31:23');
INSERT INTO `system_node` VALUES ('134', 'store/goods_cate/edit', '编辑商品分类', '0', '1', '1', '2018-05-04 11:31:23');
INSERT INTO `system_node` VALUES ('135', 'store/goods_cate/del', '删除商品分类', '0', '1', '1', '2018-05-04 11:31:24');
INSERT INTO `system_node` VALUES ('136', 'store/goods_cate/forbid', '禁用商品分类', '0', '1', '1', '2018-05-04 11:31:24');
INSERT INTO `system_node` VALUES ('137', 'store/goods_cate/resume', '启用商品分类', '0', '1', '1', '2018-05-04 11:31:24');
INSERT INTO `system_node` VALUES ('138', 'store/goods_spec', '商品规格管理', '0', '1', '1', '2018-05-04 11:31:47');
INSERT INTO `system_node` VALUES ('139', 'store/goods_spec/index', '商品规格列表', '1', '1', '1', '2018-05-04 11:31:47');
INSERT INTO `system_node` VALUES ('140', 'store/goods_spec/add', '添加商品规格', '0', '1', '1', '2018-05-04 11:31:47');
INSERT INTO `system_node` VALUES ('141', 'store/goods_spec/edit', '编辑商品规格', '0', '1', '1', '2018-05-04 11:31:48');
INSERT INTO `system_node` VALUES ('142', 'store/goods_spec/del', '删除商品规格', '0', '1', '1', '2018-05-04 11:31:48');
INSERT INTO `system_node` VALUES ('143', 'store/goods_spec/forbid', '禁用商品规格', '0', '1', '1', '2018-05-04 11:31:48');
INSERT INTO `system_node` VALUES ('144', 'store/goods_spec/resume', '启用商品规格', '0', '1', '1', '2018-05-04 11:31:48');
INSERT INTO `system_node` VALUES ('145', 'blog/article/index', '', '1', '1', '1', '2018-06-06 09:01:49');

-- ----------------------------
-- Table structure for system_sequence
-- ----------------------------
DROP TABLE IF EXISTS `system_sequence`;
CREATE TABLE `system_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '序号类型',
  `sequence` char(50) NOT NULL COMMENT '序号值',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_sequence_unique` (`type`,`sequence`) USING BTREE,
  KEY `index_system_sequence_type` (`type`),
  KEY `index_system_sequence_number` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统序号表';

-- ----------------------------
-- Records of system_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` datetime DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('10000', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '22222222', 'hanqwa@163.com', '18292080097', '', '22979', '2018-06-06 15:19:50', '1', '', '0', null, '2015-11-13 15:14:22');

-- ----------------------------
-- Table structure for wechat_fans
-- ----------------------------
DROP TABLE IF EXISTS `wechat_fans`;
CREATE TABLE `wechat_fans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT '' COMMENT '公众号Appid',
  `unionid` char(100) DEFAULT '' COMMENT 'unionid',
  `openid` char(100) DEFAULT '' COMMENT '用户的标识,对当前公众号唯一',
  `spread_openid` char(100) DEFAULT '' COMMENT '推荐人OPENID',
  `spread_at` datetime DEFAULT NULL COMMENT '推荐时间',
  `tagid_list` varchar(100) DEFAULT '' COMMENT '标签id',
  `is_black` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为黑名单用户',
  `subscribe` tinyint(1) unsigned DEFAULT '0' COMMENT '用户是否关注该公众号(0:未关注, 1:已关注)',
  `nickname` varchar(200) DEFAULT '' COMMENT '用户的昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '用户的性别,值为1时是男性,值为2时是女性,值为0时是未知',
  `country` varchar(50) DEFAULT '' COMMENT '用户所在国家',
  `province` varchar(50) DEFAULT '' COMMENT '用户所在省份',
  `city` varchar(50) DEFAULT '' COMMENT '用户所在城市',
  `language` varchar(50) DEFAULT '' COMMENT '用户的语言,简体中文为zh_CN',
  `headimgurl` varchar(500) DEFAULT '' COMMENT '用户头像',
  `subscribe_time` bigint(20) unsigned DEFAULT '0' COMMENT '用户关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `expires_in` bigint(20) unsigned DEFAULT '0' COMMENT '有效时间',
  `refresh_token` varchar(200) DEFAULT '' COMMENT '刷新token',
  `access_token` varchar(200) DEFAULT '' COMMENT '访问token',
  `subscribe_scene` varchar(200) DEFAULT '' COMMENT '扫码关注场景',
  `qr_scene` varchar(100) DEFAULT '' COMMENT '二维码场景值',
  `qr_scene_str` varchar(200) DEFAULT '' COMMENT '二维码场景内容',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_fans_spread_openid` (`spread_openid`) USING BTREE,
  KEY `index_wechat_fans_openid` (`openid`) USING BTREE,
  KEY `index_wechat_fans_unionid` (`unionid`),
  KEY `index_wechat_fans_is_back` (`is_black`),
  KEY `index_wechat_fans_subscribe` (`subscribe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信粉丝';

-- ----------------------------
-- Records of wechat_fans
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_fans_tags
-- ----------------------------
DROP TABLE IF EXISTS `wechat_fans_tags`;
CREATE TABLE `wechat_fans_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `count` int(11) unsigned DEFAULT NULL COMMENT '总数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  KEY `index_wechat_fans_tags_id` (`id`) USING BTREE,
  KEY `index_wechat_fans_tags_appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信会员标签';

-- ----------------------------
-- Records of wechat_fans_tags
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_keys
-- ----------------------------
DROP TABLE IF EXISTS `wechat_keys`;
CREATE TABLE `wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` char(100) DEFAULT '' COMMENT '公众号APPID',
  `type` varchar(20) DEFAULT '' COMMENT '类型，text 文件消息，image 图片消息，news 图文消息',
  `keys` varchar(100) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '文本内容',
  `image_url` varchar(255) DEFAULT '' COMMENT '图片链接',
  `voice_url` varchar(255) DEFAULT '' COMMENT '语音链接',
  `music_title` varchar(100) DEFAULT '' COMMENT '音乐标题',
  `music_url` varchar(255) DEFAULT '' COMMENT '音乐链接',
  `music_image` varchar(255) DEFAULT '' COMMENT '音乐缩略图链接',
  `music_desc` varchar(255) DEFAULT '' COMMENT '音乐描述',
  `video_title` varchar(100) DEFAULT '' COMMENT '视频标题',
  `video_url` varchar(255) DEFAULT '' COMMENT '视频URL',
  `video_desc` varchar(255) DEFAULT '' COMMENT '视频描述',
  `news_id` bigint(20) unsigned DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '0 禁用，1 启用',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_keys_appid` (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信关键字';

-- ----------------------------
-- Records of wechat_keys
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS `wechat_menu`;
CREATE TABLE `wechat_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `index` bigint(20) DEFAULT NULL,
  `pindex` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `type` varchar(24) NOT NULL DEFAULT '' COMMENT '菜单类型 null主菜单 link链接 keys关键字',
  `name` varchar(256) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `content` text NOT NULL COMMENT '文字内容',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用1启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_menu_pindex` (`pindex`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信菜单配置';

-- ----------------------------
-- Records of wechat_menu
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_news
-- ----------------------------
DROP TABLE IF EXISTS `wechat_news`;
CREATE TABLE `wechat_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` varchar(100) DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT '' COMMENT '永久素材显示URL',
  `article_id` varchar(60) DEFAULT '' COMMENT '关联图文ID，用，号做分割',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `index_wechat_news_artcle_id` (`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文表';

-- ----------------------------
-- Records of wechat_news
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_news_article
-- ----------------------------
DROP TABLE IF EXISTS `wechat_news_article`;
CREATE TABLE `wechat_news_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '' COMMENT '素材标题',
  `local_url` varchar(300) DEFAULT '' COMMENT '永久素材显示URL',
  `show_cover_pic` tinyint(4) unsigned DEFAULT '0' COMMENT '是否显示封面 0不显示，1 显示',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `digest` varchar(300) DEFAULT '' COMMENT '摘要内容',
  `content` longtext COMMENT '图文内容',
  `content_source_url` varchar(200) DEFAULT '' COMMENT '图文消息原文地址',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';

-- ----------------------------
-- Records of wechat_news_article
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_news_image
-- ----------------------------
DROP TABLE IF EXISTS `wechat_news_image`;
CREATE TABLE `wechat_news_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `md5` varchar(32) DEFAULT '' COMMENT '文件md5',
  `local_url` varchar(300) DEFAULT '' COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT '' COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_news_image_md5` (`md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信服务器图片';

-- ----------------------------
-- Records of wechat_news_image
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_news_media
-- ----------------------------
DROP TABLE IF EXISTS `wechat_news_media`;
CREATE TABLE `wechat_news_media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(100) DEFAULT '' COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT '' COMMENT '文件md5',
  `type` varchar(20) DEFAULT '' COMMENT '媒体类型',
  `media_id` varchar(100) DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT '' COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT '' COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';

-- ----------------------------
-- Records of wechat_news_media
-- ----------------------------
