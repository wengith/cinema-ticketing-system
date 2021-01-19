/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : movie_system

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2021-01-19 23:58:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('zxl', '++Ws6KPVrGLTEHNsCMmUKQ==', 'tprCNibIS9sTDj8CgeEqoQ==', '2021-01-16 20:38:46');
INSERT INTO `persistent_logins` VALUES ('zm', '74QNfx/hSr+pza3UTdxdKQ==', 'mihQAm1+rkaaIsstfe1KtA==', '2020-10-26 18:46:26');
INSERT INTO `persistent_logins` VALUES ('admin', 'q/SCrBuuh5Xh8hapBiebAA==', 'llzEurUkhuEFbMZbpjlUrQ==', '2020-12-26 19:42:58');
INSERT INTO `persistent_logins` VALUES ('zxl', 'RlCjOcb1FYyRdkl9TwEtuQ==', 'FANl4Sl++mUdxogubHOIyw==', '2021-01-18 22:49:01');
INSERT INTO `persistent_logins` VALUES ('zxl', 'z5BZA2usEMge0eufVtqAvA==', 'pTa7ccBScXnYhmNFys5z5w==', '2021-01-18 17:01:33');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ӱ??id',
  `movieObj` int(11) NOT NULL COMMENT '??Ӱ',
  `content` text NOT NULL COMMENT 'Ӱ',
  `userObj` varchar(20) NOT NULL COMMENT '?????û?',
  `commentTime` varchar(20) DEFAULT NULL COMMENT '????ʱ??',
  PRIMARY KEY (`commentId`),
  KEY `movieObj` (`movieObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`movieObj`) REFERENCES `t_movie` (`movieId`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('4', '1', '真不错', 'zxl', '2020-10-09 13');
INSERT INTO `t_comment` VALUES ('5', '6', '好看，强烈推荐', 'zxl', '2020-10-09 13');
INSERT INTO `t_comment` VALUES ('6', '5', '特效很震撼', 'zxl', '2020-10-09 13');
INSERT INTO `t_comment` VALUES ('7', '5', '尽快了解', 'zxl', '2020-10-09 13');
INSERT INTO `t_comment` VALUES ('9', '3', '打斗场面真实', 'zxl', '2020-10-09 13');
INSERT INTO `t_comment` VALUES ('10', '2', '剧情感人', 'zxl', '2020-10-09 13');
INSERT INTO `t_comment` VALUES ('11', '4', '结局很好', 'zxl', '2020-10-09 13');
INSERT INTO `t_comment` VALUES ('12', '4', '强烈推荐\r\n', 'zxl', '2020-10-10 15');
INSERT INTO `t_comment` VALUES ('14', '1', '1', 'zxl', '2020-10-12 16');
INSERT INTO `t_comment` VALUES ('19', '25', '感人\r\n', 'admin', '2020-10-22 16');
INSERT INTO `t_comment` VALUES ('21', '8', '666', 'zm', '2020-10-26 18');
INSERT INTO `t_comment` VALUES ('22', '44', '', 'zxl', '2020-10-26 19');
INSERT INTO `t_comment` VALUES ('23', '1', '韩寒的第三部电影，依旧很好笑，但笑过之后听《一半人生》哭成泪人，我知道这辈子自己再也不可能像张驰那样不顾一切踩脚下的油门，我才26岁，就接受自己平凡逐流的人生。韩寒用喜剧掩盖无数人的失意落寞，触碰他们内心最深处的痛感，虽是喜剧但有灵魂有情感温度。韩寒和他的电影都更加成熟，必须二刷', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('24', '6', '夏洛一梦，笑成麻花。笙歌散尽凄凉甚，不如惜取眼前人。\r\n', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('25', '6', '比《煎饼侠》更接地气的情怀，因为没有沾上理想。可能是年度最佳国产喜剧。在东北看这片的好处就是全场一起开怀大笑，谁也不嫌弃谁，谁也不讨厌谁。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('26', '11', '放在豆瓣语境下，是部时至今日终于拍出来的国产“高分韩国电影”。拿现实题材拍商业类型片，社会意义摆在那，群戏也处理得相当不错。对我们国家而言，这样的电影多一部是一部，走一步是一步。\r\n', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('27', '11', '禁不住整个票圈的安利，今天去看了 《我不是药神》，全程泪目。\r\n评价一部好电影的标准是什么，或许没有固定答案，观影途中一直在想，如果我是程勇会怎么办，我在不停的假设，然后自我否定，便越发被电影吸引，每个电影中平凡的人物闪光点在这短短的几十分钟得到诠释。\r\n对错在现实中的界限没那么清楚，或许放过对错和答案，希望才能穿透一切阻碍。\r\n', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('28', '8', '《北京好人》简直梦回我和我的祖国里的《北京你好》，葛优要给我笑吐了，陈思诚的《天上掉下个 UFO》实在没想到会是这么个走向，都有手工耿那味儿了。。。里面的方言都还蛮好的，不出戏，王源的陕西话不得不说真的学的很像啊。总体来说还是值回票价，细节看得出是蛮用心的，全明星联盟诚不我欺！\r\n', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('29', '8', '“最后一课”节奏很棒，范伟演技惊人，把我的泪点掐住了。“神笔马亮”最惊艳，笑点很高级，从笑到泪的情绪转换自然恰当，看得很舒服，麻花做喜剧还是厉害，超越了以前的自己。\r\n', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('30', '34', '导演团队的前作《驴得水》同样改编自开心麻花的舞台剧，被观众诟病的因素正是强烈的舞台风格、缺乏电影感的影像。《驴得水》尽管在影像处理上捉襟见肘，却能凭借扎实的故事，过硬的内核，鲜明的批判性，为其因经验匮乏造成的缺陷扳回一城。\r\n', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('31', '34', '最终这一段落以任素汐撕心裂肺的痛哭收尾，这个情节十分夸张，仔细想想一夜情受挫的起因根本不至于此。这种劈头盖脸的、强烈迅速的情感传递是十分生硬和不克制的，在观众刚刚熟悉复杂的环境就安排如此激烈的戏份也是冒失和不合理的，这样的表达会让我产生强烈的不适感和疑惑感。\r\n', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('32', '34', '即便抛开这些笨拙的编排，单看男女主之间的故事也是不尽如人意的', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('33', '47', '每一帧都充满了网络电影的味道，但好在有一个较好的故事，用大话西游无厘头的方式重新了猪八戒的过去现在和未来。如果后期特效和打斗场面再好点，就能再好看点了。\r\n', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('34', '47', '因为主题曲才看的电影，刚开始没觉得好看，但到了后面看到天蓬和自己本命兵器相恋，是多么浪漫啊！就好比杰克船长对黑珍珠号的痴迷一般，作为武将，自己的兵器可谓是最心爱的宝物，曾经，天蓬和宝儿是最亲密的战友，宝儿幻化成人形后，对天蓬如此迷恋也合乎情理，他们缘分颇深，他们的的恋情也是是冥冥之中注定，这对CP，我认了', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('35', '47', '本来不知道这部电影，是突然听到这首大天蓬主题曲才注意到这部电影的，看完之后真心觉得故事不错。很有感触，宝儿和天蓬真的贱让人意难平。唯独不足的就是服道化不太好，可能资金有限吧，但也不耽误看影，一部好电影故事情节和里边的人物才是重点。大家可以看看欧。推荐。怕什么天道轮回，魄散魂飞，没有你那才叫可悲，主题曲也挺对应人物的感情。非常好', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('36', '46', '我真的是南笙的影迷了，演的每一部网络大电影我都看过', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('37', '46', '谢苗演反派，不适应。反转太突兀，有点立不住啊', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('38', '45', '吃螃蟹的秋后，上演蜘蛛蟹？一众好演员就此扑街。#主动刷剧为众人避雷#', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('39', '45', '阵容不错 特效欠佳 故事一般', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('40', '44', '看了两集。很可以！', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('41', '43', '军事题材。安保队，解救人质、护送春播种子&净水器到村子、途中遭遇匪徒伪装的政府军、村子遇埋伏+队里俩人背叛+暗中偷运生化武器橙剂、队长牺牲、狙击手徒弟领队阻击橙剂。主题落在世界和平稳定上，太大，如果落在师徒传承与情感上，会不会更接地气一点呢', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('42', '43', '看完以后“我是谁我在哪儿我为什么会浪费我并不宝贵的一个小时” 剧情硬伤，女主智障，还有十分奇怪的感情线。就直男拍电影就不要搞感情了，大家都挺尴尬的。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('43', '42', '尼斯湖里有水怪，神农架中有野人，喜马拉雅山顶有群居的雪人。大人都当它们是怪物，只有孩子把它们当朋友。穿越蓝莓果林，油菜花海，它有腾云御风控制大自然的神力，能让毁掉的小提琴复原，却不能让父亲复生。他不敢在巨大的蒲公英上乘风，不是因为不够勇敢；你能在逆流的鲤鱼上驾雾，只因你不肯放弃。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('44', '42', '故事稍差了些，但动画制作仍然没得说。大毛哼唱起来的声音实在太动人了，而且这个动画对小朋友来说说不定还是小提琴入坑动画…小提琴演奏时乐山大佛开满鲜花以及因为魔法荡起的平地波浪带着地面上的油菜花田，实在是太美了。最惊叹的还是抓着变巨大的蒲公英飞翔那一段，想象力实在是太太太惊人了', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('45', '41', '好饭不怕晚，青春年少和终期将至的反差制造泪点，羞涩心事和脱线友情制造笑点。起点为实现死党私人隐秘的梦想，但终点还是落在友情这个人类大命题上，普世的情感价值才能引起共鸣。彭昱畅、王大陆和魏大勋三个国民好感度超高的年轻人合在一起更是赏心悦目，尤其是彭昱畅，这种轻体量喜剧对于这位年轻影帝候选人已经信手拈来，毫无压力，就算为了他这个又萌又丧又有些沙雕的角色走进影院也值了', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('46', '41', '挺好的，彭彭演的好，干裂嘴唇让人心疼。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('47', '40', '非常不错，挺搞笑的。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('48', '40', '陈翔六点半现在已经是每天都坚持看的片子了', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('49', '40', '内容很紧凑，很有趣。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('50', '39', '用郭德纲的话说：这回我们欠谦儿哥一个影帝和一辆自行车。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('51', '39', '于谦老师在电影里旗帜鲜明地反对了抽烟，喝酒，烫头等不良爱好。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('52', '39', '真·青春成长题材，教师视觉展现上世纪80年代拘谨的校园教育氛围，幽默不俗、叛逆放纵，残酷真实，笑中伤感，唯有以梦落幕。每个人都想做最完美的自己，可惜追求完美需要承受巨大压力，当醒悟后才懂得只需找准自己的合适位置的道理之时，光阴不再了。影片质量黑马，但票房不看好，毕竟片名不讨巧，需要自来水灌溉。透露个看点：客串阵容数量和质量比主演彪悍数十倍！', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('53', '25', '多加一星敬英灵。希望有一天我们的艺术作品能够不被意识形态所束缚，升旗升得堂堂正正。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('54', '25', '电影结束，全场静默，仿佛所有的观众还沉浸在那种悲壮的氛围中没有回神', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('55', '22', '我以前是不怎么感冒献礼片的，这次因为朱一龙的缘故关注了我和我的祖国，才发现我比自己想象中更爱这个国家。这部献礼片的意义，是串联，是纪念，是传承，非常适合全家一起观看', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('56', '22', '我和我的祖国》回归篇真实再现了香港回归的场景，青年演员朱一龙在其中饰演了一名护旗手，当他迈着坚定的步伐走向升旗台时，我好像也到了那个庄严肃穆的现场，那种澎湃激动的心情难以言表。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('57', '7', '叫《夺冠》也可叫《郎平》，巩俐四个字：君临天下。和之前《中国合伙人》类似，找真实存在的社会名人，让演员用适当的方法派表演还原其神态和举止', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('58', '7', '【年前观影团】“为什么我们那么在意一场排球赛的输赢？因为他们太看重赢”能借郎平之口说出这句话我觉得够了，中国银幕上应该听到一些不同的声音。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('59', '5', '三体迷们不用担心电影版会拍的稀烂啦！章北海船长，面壁人希恩斯，高维碎片，青铜时代和万有引力舰太空大战，冬眠和星际航行，三体世界的荒芜，高维世界的样貌，云天明的童话，诺兰新作中一次性看完！#刚刚看完星际穿越interstellar，感觉自己萌萌哒#', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('60', '4', '开篇长镜头惊险大气引人入胜 结合了水平不俗的快剪下实打实的真刀真枪 让人不禁热血沸腾 特别弹簧床架挡炸弹 空手接碎玻璃 弹匣割喉等帅得飞起！就算前半段铺垫节奏散漫主角光环开太大等也不怕 作为一个中国人 两个小时弥漫着中国强大得不可侵犯的氛围 还是让那颗民族自豪心砰砰砰跳个不停。', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('61', '3', '春节档最好！最好不是战狼而是战争，有点类似黑鹰坠落，主旋律色彩下，真实又残酷的战争渲染。故事性不强，文戏不超20分钟，从头打到尾，林超贤场面调度极佳，巷战、偷袭、突击有条不紊，军械武器展示效果不错。尺度超大，钢锯岭式血肉横飞，还给你看特写！敌人如丧尸一般打不完，双方的狙击手都是亮点', 'HyMan', '2020-10-26 20');
INSERT INTO `t_comment` VALUES ('62', '3', '超前点映场。场面真实，剧情紧凑。中间其实很想上厕所，但是愣是没有找到任何尿点…作为战争片，已超额完成任务，在真实度还原上，达到了国产影片从未有过的高度。细节处理也很妙，剥糖纸的那一段看的揪心。被海清和蒋璐霞的演技圈粉…看到最后，感觉自己整个人都在燃烧。准备春节的时候带着爸妈二刷。', 'HyMan', '2020-10-26 21');
INSERT INTO `t_comment` VALUES ('63', '2', '好男儿保家卫国不是口号，好电影感同身受才是王道！这部《战狼》可打造成国产片品牌系列开山之作。吴京的个人魅力应转化为巨大的票房号召力。在银幕上一战到底，用国产敢死队阳刚之美，成就一部铁血传奇！', 'HyMan', '2020-10-26 21');
INSERT INTO `t_comment` VALUES ('64', '2', '犯我中华者，虽远必诛！！！剧里听到这句台词差点哭惹！没想到会这么燃这么热血！中国军人太帅了！！！虐的地方也刚刚好！吴京帅爆了！余男真是英气又妩媚！其他演员也帅帅帅！！真的只有感叹号能表达我的心潮澎湃！', 'HyMan', '2020-10-26 21');

-- ----------------------------
-- Table structure for t_movie
-- ----------------------------
DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie` (
  `movieId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ӰƬid',
  `movieName` varchar(40) NOT NULL COMMENT 'ӰƬ????',
  `moviePhoto` varchar(60) NOT NULL COMMENT 'ӰƬͼƬ',
  `director` varchar(20) NOT NULL COMMENT '????',
  `mainPerformer` varchar(50) NOT NULL COMMENT '????',
  `duration` varchar(20) NOT NULL COMMENT 'ʱ??',
  `area` varchar(20) NOT NULL COMMENT '????',
  `releaseDate` varchar(20) DEFAULT NULL COMMENT '??ӳ????',
  `price` float NOT NULL COMMENT 'Ʊ??',
  `hit` int(5) DEFAULT '0',
  `opera` text NOT NULL,
  PRIMARY KEY (`movieId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_movie
-- ----------------------------
INSERT INTO `t_movie` VALUES ('1', '沐浴之王', '/static/image/001.jpg', '叫兽易小星', '彭昱畅 / 乔杉 / 苇青卜 / 冠今', '120', '中国大陆', '2020-08-06', '35', '66', '在一次搓澡服务中，富二代肖翔和搓澡工周东海发生矛盾，让周东海面临生活困境。肖翔因跳伞事故被送到医院记忆全失，周东海恰巧撞见，心生一计，骗肖翔是自己的弟弟并骗回周家澡堂当搓澡工，于是一个富二代开始了一段啼笑皆非的搓澡生涯……');
INSERT INTO `t_movie` VALUES ('2', '战狼1', '/static/image/003.jpg', '吴京', '吴京 / 余男 / 斯科特·阿金斯', '90', '中国大陆', '2015-04-02', '40', '19', '痞性十足的冷锋（吴京 饰）屡屡惹祸，有人说他是流氓，是痞子， 也有人说他是英雄，是传奇，一次行动中冷锋违抗军令打死了恐怖分子，要被开除出队，却意外得到了神秘部队战狼的接纳，但本想换个地方继续惹祸的他却跳进了另外一个深渊，冷傲的战狼副队长，擦出暧昧火花的性感女队长，心计颇 深腹黑的毒枭，枉死的队友，雇佣兵跨过边境线入侵中国……一切都使他陷入了麻烦中。一切都在考验这个团队的毒瘤冷锋，他又该何去何从？');
INSERT INTO `t_movie` VALUES ('3', '狼群行动', '/static/image/002.jpg', '尹晨阳', '于震宇 / 李俊瑶 / 谢恺予 / 陈星羽', '138', '中国大陆', '2018-02-06', '40', '19', '医疗志愿者李瑶在某国艾都力的某个村落给当地村民提供医疗帮助，突遭绑匪袭击成为俘虏，其父亲得知消息联系张震、吴优其安保小队前往，成功救出李瑶后因仍有同胞被困,返回并夺取交通工具去往高地寻求救援信号，安保队员与绑匪之间展开了一场轰烈的追逐，张震、雷霆、武鸣相继牺牲后，吴优护着李瑶和幸存者终于等到了救援....');
INSERT INTO `t_movie` VALUES ('4', '花木兰', '/static/image/004.jpg', '妮基·卡罗', '刘亦菲 / 甄子丹 / 巩俐 / 李连杰', '123', '中国大陆', '2017-07-27', '45', '22', '影片讲述了一位无所畏惧的年轻女子义无反顾为家国而战，成为中国史上最著名的伟大勇士之一。当皇帝下令境内每个家庭必须有一位男丁应召出征，抵御北方来犯者入侵，出身军戎之家的长女花木兰，挺身而出，替病痛缠身的父亲应征入伍。她女扮男装化名“花军”，一路历经磨练，驾驭自己内心的力量，激发真正的潜能。通过这段传奇历程，她将成为一名光荣的勇士，不仅赢得国家的认可，更博得父亲的骄傲。');
INSERT INTO `t_movie` VALUES ('5', '星际穿越', '/static/image/006.jpg', '克里斯托弗·诺兰', ' 马修·麦康纳 / 安妮·海瑟薇 / 杰西卡·查斯坦 / 麦肯吉·弗依 / 卡西·阿弗莱克 /', '169', '美国 / 英国 / 加拿大 / 冰岛', '2020-08-02', '35', '39', '近未来的地球黄沙遍野，小麦、秋葵等基础农作物相继因枯萎病灭绝，人类不再像从前那样仰望星空，放纵想象力和灵感的迸发，而是每日在沙尘暴的肆虐下倒数着所剩不多的光景。在家务农的前NASA宇航员库珀（马修·麦康纳 Matthew McConaughey 饰）接连在女儿墨菲（麦肯吉·弗依 Mackenzie Foy 饰）的书房发现奇怪的重力场现象，随即得知在某个未知区域内前NASA成员仍秘密进行一个拯救人类的计划。多年以前土星附近出现神秘虫洞，NASA借机将数名宇航员派遣到遥远的星系寻找适合居住的星球。在布兰德教授（迈克尔·凯恩 Michael Caine 饰）的劝说下，库珀忍痛告别了女儿，和其他三名专家教授女儿艾米莉亚·布兰德（安妮·海瑟薇 Anne Hathaway 饰）、罗米利（大卫·吉雅西 David Gyasi 饰）、多伊尔（韦斯·本特利 Wes Bentley 饰）搭乘宇宙飞船前往目前已知的最有希望的三颗星球考察。\r\n　　他们穿越遥远的星系银河，感受了一小时七年光阴的沧海桑田，窥见了未知星球和黑洞的壮伟与神秘。在浩瀚宇宙的绝望而孤独角落，总有一份超越了时空的笃定情怀将他们紧紧相连……');
INSERT INTO `t_movie` VALUES ('6', '一出好戏', '/static/image/005.jpg', '黄渤', '黄渤 / 舒淇 / 王宝强 / 张艺兴', '104', '中国大陆', '2015-09-30', '39', '30', '马进欠下债务，与远房表弟小兴在底层社会摸爬滚打，习惯性的买彩票，企图一夜爆富，并迎娶自己的同事姗姗。一日，公司全体员工出海团建，途中，马进收到了彩票中头奖的信息，六千万！就在马进狂喜自己翻身的日子终于到来之际，一场突如其来的滔天巨浪打破了一切。苏醒过来的众人发现身处荒岛，丧失了一切与外界的联系');
INSERT INTO `t_movie` VALUES ('7', '除暴', '/static/image/p2620083313.jpg', '刘浩良', '王千源 / 吴彦祖 / 春夏 / 卫诗雅', '135', '中国大陆 / 中国香港', '2020-9-25', '39', '43', '上世纪90年代，刑警钟诚受命追捕悍匪集团“老鹰帮”。这群悍匪犯下惊天连环劫案，训练有素且纪律严明，首领张隼更屡次恶意挑衅，矛头直指钟诚。为将“老鹰帮”捉拿归案，钟诚带领刑警小队咬死不放，誓与恶势力斗争到底。数年间，警匪上演了一次次紧张刺激的较量，悍匪愈加猖獗，警方步步逼近，双方展开殊死对决……');
INSERT INTO `t_movie` VALUES ('8', '西虹市首富', '/static/image/p2620453443.jpg', '闫非', '沈腾 / 宋芸桦 / 张一鸣 / 张晨光', '153', '中国大陆', '2020-10-01', '25', '22', '《西虹市首富》的故事发生在《夏洛特烦恼》中的“特烦恼”之城“西虹市”。混迹于丙级业余足球队的守门员王多鱼（沈腾饰演），因比赛失利被开除离队。正处于人生最低谷的他接受了神秘台湾财团“一个月花光十亿资金”的挑战。本以为快乐生活就此开始，王多鱼却第一次感到“花钱特烦恼”！想要人生反转走上巅峰，真的没有那么简单。');
INSERT INTO `t_movie` VALUES ('11', '人间喜剧', '/static/image/p2561305376.jpg', '孙周', '艾伦 / 王智鲁 / 诺金 / 士杰', '117', '中国大陆', '2020-08-15', '40', '29', '平凡夫妻濮通（艾伦饰）和米粒（王智饰）因被公司拖欠工资导致交不起房租；富二代杨小伟（鲁诺饰）不被亲爹宠爱，欠下巴爷（任达华饰）一笔巨款无处偿还。被钱逼到绝路的三人相遇，索性上演了一出富二代绑架案，一路认怂的夫妻变身假绑匪，最穷富二代变身假人质…… 　　一番折腾下，杨小伟的首富爸爸杨台竣（金士杰饰）最终承诺了1000万的“赎金”。但事情远不止这么简单，狡猾的杨台竣并不想真的付钱，黑帮老大巴爷也气势汹汹上门要债。面对大佬们的四面夹击，濮通、米粒和杨小伟三人会如何应对？');
INSERT INTO `t_movie` VALUES ('22', '我和我的祖国', '/static/image/p2567998580.jpg', ' 陈凯歌 / 张一白···', '黄渤 / 张译 / 韩昊霖 / 杜江 / 葛优', '155', '中国大陆', '2019-09-30 00:00:00', '30', '4', '七位导演分别取材新中国成立70周年以来，祖国经历的无数个历史性经典瞬间。讲述普通人与国家之间息息相关密不可分的动人故事。聚焦大时代大事件下，小人物和国家之间，看似遥远实则密切的关联，唤醒全球华人共同回忆。');
INSERT INTO `t_movie` VALUES ('25', '八佰', '/static/image/p2615992304.jpg', '管虎', '王千源 / 张译 / 姜武 / 黄志忠 / 张俊', '147', '中国大陆', '2020-08-21 00:00:00', '45', '78', '1937年淞沪会战的最后一役，“八百壮士”奉命坚守上海四行仓库，以少敌多顽强抵抗四天四夜。电影《八佰》由管虎导演，是亚洲首部全片使用IMAX摄影机拍摄的商业电影，将于2020年8月21日全国影院上映。');
INSERT INTO `t_movie` VALUES ('34', '半个喜剧 ', '/static/image/a_half _comedy.jpg', ' 周申 刘露', '任素汐 饰 莫默 吴昱翰 饰 孙同 刘迅 饰 郑多多 汤敏 饰 高璐', '111', '中国大陆', '2020-10-25 19:56:00', '35', '8', '三个自由浪漫的年轻人，过着各怀心思的人生：有人急着摆脱单身，有人想在结婚前放荡一番，有人想在 大城市站稳脚跟。因为一次情感出轨，三人扭结成了一团“嬉笑怒骂”的乱麻。当各种价值观碰撞在一起， 当一个人需要平衡亲情友情与爱情......他们慌乱的生活，就像是半个喜剧。');
INSERT INTO `t_movie` VALUES ('37', '鼠胆英雄', '/static/image/shudanyingxiong.jpg', ' 束焕 邵丹', ' 岳云鹏 饰 闫大海 佟丽娅 饰 杜卿 田雨 饰 赵瀚青 袁弘 饰 邢铁城 大鹏 饰 枪神', '105', '中国大陆', '2020-10-07 14:00:00', '40', '4', '三十年代的上海滩，胆小如鼠的青龙帮小弟闫大海发现自己身患绝症之际，竟阴差阳错当上了警察。为了给梦中女神--飞乐门舞女杜卿挣赎身钱，他计划在自己生命中所剩不多的时间里因公殉职，从而拿到抚恤金拯救女神。然而，在他疯狂执行铲除“黑帮”、“毒枭”任务以身赴死期间，却总是事与愿违求死不得死，反而得到屡屡升迁。然而，纸醉金迷的上海滩，还隐藏着更大的危机…\r\n ');
INSERT INTO `t_movie` VALUES ('39', '老师好', '/static/image/laoshihao.jpg', ' 张栾', ' 于谦 饰 苗宛秋 汤梦佳 饰 安静 秦鸣悦 饰 关婷婷 ', '113', '中国大陆', '2020-10-14 21:00:00', '56', '6', '1985年的南宿一中，苗宛秋老师推自行车昂首走在校园，接受着人们艳羡的目光和纷至沓来的恭维。桀傲不驯的洛小乙、温婉可人的安静、新潮前卫的关婷婷、大智若愚的脑袋、舞痴兄弟文明建设、八婆海燕、奸商耗子……三班是一个永远也不缺故事的集体。苗宛秋怎么也不会想到，他即将走进的这个三班将会成为他以及他身边这辆自行车的噩梦。三班的同学也没有想到，这位新来的老师改变了他们的一生。');
INSERT INTO `t_movie` VALUES ('40', '陈翔六点半', '/static/image/chongloubie.jpg', ' 陈翔', ' 毛台 饰 刘君山 冷檬 饰 段晓蓝 妹大爷 饰 姜大爷 陈翔 饰 鼓手', '121', '中国大陆', '2020-10-14 17:00:00', '47', '4', '地方戏曲演员刘馆长和几个弟子一起经营着一家戏馆，戏馆收入微薄，每天只有几个逃票进来的老头，为了维持戏馆生存，刘馆长想尽办法，但收效甚微，他们的生活也陷入了窘境。 有一天，戏馆出现了一个年轻漂亮的姑娘段晓蓝，她是戏馆唯一的年轻观众，也成为了戏馆的希望。这期间，因为偶然事件，段晓蓝身上有了解开戏馆困局的办法，为了能让戏馆延续下去，他们带上这唯一的年轻女观众，开始了一段妙趣横生又曲折离奇的疗伤之旅……');
INSERT INTO `t_movie` VALUES ('41', '小小的愿望', '/static/image/little_wish.jpg', ' 田羽生', '彭昱畅 饰 高远 王大陆 饰 徐浩 魏大勋 饰 张正阳', '98', '中国大陆', '2019-10-23 00:00:00', '23', '4', '突然患上肌肉萎缩症的高中生高远，被医生告知时日不多，决心在临死之前完成一个愿望，那就是成为一个真正的男人！得知这个消息的身边两位好兄弟徐浩和张正阳，为了兄弟最后的愿望，不惜一切奋战到底！');
INSERT INTO `t_movie` VALUES ('42', '雪人奇缘', '/static/image/xuierenqiyuan.jpg', 'Claire Carleton', '汪可盈 饰 小艺 莎拉·保罗森 饰 扎拉博士 阿尔伯特·蔡 饰 小鹏 艾迪·伊扎德 饰 博尼士', '118', '中国大陆', '2018-08-16 00:00:00', '34', '5', '珠穆朗玛峰的雪人是传说吗？不是！不仅不是传说，它还拥有令人着迷的魔力！少女小艺在天台上目睹了雪人大毛即将被抓的惨况，决定亲自护送大毛回家，她的小伙伴阿俊和鹏鹏也加入了护送队伍，一场关于“回家”的中华大冒险就此开始。');
INSERT INTO `t_movie` VALUES ('43', '地质灾难', '/static/image/jujishou.jpg', 'Thunder Levin', 'M· Steven FeltyMatthew Pohlkamp', '118', '中国大陆', '2019-10-08 00:00:00', '33', '20', '洛杉矶的一个家庭在历史上最大的灾难的汇合中分开了：一个超级火山、一次特大地震和一次大规模龙卷风。当世界经受住这场几乎世界末日的事件时，我们的英雄们必须坚持自己的技能和智慧来团结和生存下去。');
INSERT INTO `t_movie` VALUES ('44', '未来杀手', '/static/image/guichuideng.jpg', 'Titus Paar', '萨沙·杰克逊  / 史蒂文·西格尔', '99', '中国大陆', '2019-06-11 00:00:00', '33', '12', '在未来时空里，社会动荡，权利集中在“首领”的独裁政府手中，所有人的生活都被密切监视，人们没有自由、没有隐私。“首领”秘密培养杀手铲除异己，掌控杀手头脑是首领的左膀右臂，代号“控制者”。而“秃鹫”是这些杀手中的佼佼者。秃鹫在一次执行任务的时候遇到了一个酷似他亡妻的女子妮娜，一时手软的秃鹫放过了妮娜。但违背命令的秃鹫被首领放弃了，但控制者提出通过给秃鹫植入“记忆”，把他改造成完美武器。术后的秃鹫逃离了组织，并救下妮娜一起逃亡。但是，随着阴谋一个个揭穿，真相逐渐浮出水面。关于妮娜的记忆都是虚假的，控制者打算利用秃鹫刺杀首领并取而代之。秃鹫的妻子也没有死去，而是作为控制他的工具被囚禁。经过几番激烈对抗，秃鹫最终实现了对控制者和首领的复仇。');
INSERT INTO `t_movie` VALUES ('45', '英伦对决', '/static/image/nuhaikuangzhu.jpg', '马丁·坎贝尔', '成龙 / 皮尔斯·布鲁斯南 / 刘涛 / 梁佩诗', '139', '中国大陆', '2019-05-08 00:00:00', '30', '9', '关玉明（成龙 饰）年轻时打过越战,当过特种兵。但如今,他敛尽锋芒，在英国伦敦唐人街开了一家小餐馆,与女儿（梁佩诗 饰）相依为命。在一次恐怖袭击中，女儿不幸遇难。英国有关部门的不作为更使他悲愤莫名，这时，关键人物汉尼斯（皮尔斯·布鲁斯南 饰）出现在他的视野之中，担任政府高官的他当年曾与恐怖分子有千丝万缕联系。曾经在战争中出生入死的经验，让关玉明敏锐地察觉，汉尼斯手中一定有此次恐怖袭击的资料。于是，关玉明几次登门请求汉尼斯为自己提供线索，但遭到汉尼斯的拒绝。万念俱灰的关玉明决定用自己的方式为女儿报仇雪恨。为此，他拒绝了爱人林宝怡（刘涛 饰）的挽留，独自踏上向恐怖组织以牙还牙以血还血的复仇之路。但他并不知道的是，一个错综复杂的大阴谋正在他面前徐徐展开');
INSERT INTO `t_movie` VALUES ('46', '破神录', '/static/image/poshenlu.jpg', '秦鹏飞', '谢苗 饰 杨烈钧 南笙 饰 孙瑾 王文杰（演员） 饰 黎叔文', '114', '中国大陆', '2019-08-07 00:00:00', '35', '5', '民国初年，依靠邪魅幻术蛊惑人心的教派轮番登场，奇人异士“风火雷电大变活人”、“女娲娘娘徒手掏心”荼毒百姓不得安宁。大家闺秀孙瑾（南笙饰）欲揭穿无量老祖骗局却险遭恶徒侮辱，关键时刻人狼镖师黎叔文（王文杰饰）赶到将其救下，与此同时');
INSERT INTO `t_movie` VALUES ('47', '佣兵战争2', '/static/image/tian_peng.jpg', '甄煜飞', '苗韵桐 / 石雨晴 / 巴萨', '115', '中国大陆', '2019-08-07 00:00:00', '34', '12', 'M国内战失控，叛军引发种族屠杀，国际社会密切关注，但是联合国安理会并未授权军事干预。子安接受委托，任务是率雇佣兵小队深入叛军腹地，找到红十字医疗小组的凌月医生，并将她送抵安全地点。子安率佣兵小队血战丛林，一路闯关拔寨，终于赶到医疗小组驻地，找到凌月。但是凌月坚持：除非把她照看下的70位难民一起带出险境，否则她誓死也不会离开这里。子安在成为佣兵的第一天起，首先学会以任务为重的处事原则，而现在则可能要带上一批与任务无关甚至会彷碍他们顺利完成任务的人，这些训练精良的佣兵必须在天职和道德之间作出选择。子安还未来得及做出决定，新的危机迅速到来。');
INSERT INTO `t_movie` VALUES ('48', '测试', '/static/image/微信图片_20191231111153.jpg', '文', '文/文', '111', '中国', '2021-01-12 00:00:00', '11', '1', '测试水水水水水水水水水水');
INSERT INTO `t_movie` VALUES ('49', 'aaa', '/static/image/Hydrangeas.jpg', 'xxx', 'xxx', '120', '东北', '2021-01-18 00:00:00', '50', '1', 'vvvvv');

-- ----------------------------
-- Table structure for t_moviehall
-- ----------------------------
DROP TABLE IF EXISTS `t_moviehall`;
CREATE TABLE `t_moviehall` (
  `movieHallId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ӱ??id',
  `movieHallName` varchar(20) NOT NULL COMMENT 'Ӱ??????',
  `rows` int(11) NOT NULL COMMENT '??λ????',
  `cols` int(11) NOT NULL COMMENT '??λ????',
  `status` int(255) DEFAULT '0' COMMENT '状态 1开放 0关闭',
  PRIMARY KEY (`movieHallId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_moviehall
-- ----------------------------
INSERT INTO `t_moviehall` VALUES ('1', '1号放映厅', '7', '10', '1');
INSERT INTO `t_moviehall` VALUES ('2', '2号放映厅', '7', '10', '1');
INSERT INTO `t_moviehall` VALUES ('4', '测试放映厅', '1', '1', '1');
INSERT INTO `t_moviehall` VALUES ('8', '影厅3', '5', '8', null);
INSERT INTO `t_moviehall` VALUES ('9', '影厅10', '3', '8', null);

-- ----------------------------
-- Table structure for t_movieorder
-- ----------------------------
DROP TABLE IF EXISTS `t_movieorder`;
CREATE TABLE `t_movieorder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `scheduleObj` int(11) NOT NULL COMMENT '????',
  `rowsIndex` int(11) NOT NULL COMMENT '??λ?к?',
  `cols` int(11) NOT NULL COMMENT '??λ?к?',
  `price` float NOT NULL COMMENT 'Ʊ??',
  `userObj` varchar(20) NOT NULL COMMENT '?û?',
  `status` int(5) NOT NULL DEFAULT '0',
  `orderTime` varchar(20) DEFAULT NULL COMMENT 'Ԥ',
  PRIMARY KEY (`orderId`),
  KEY `scheduleObj` (`scheduleObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_movieorder_ibfk_1` FOREIGN KEY (`scheduleObj`) REFERENCES `t_schedule` (`scheduleId`),
  CONSTRAINT `t_movieorder_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_movieorder
-- ----------------------------
INSERT INTO `t_movieorder` VALUES ('4', '3', '3', '4', '40', 'zxl', '1', '2020-10-14 09:10');
INSERT INTO `t_movieorder` VALUES ('5', '3', '3', '5', '40', 'zxl', '3', '2020-10-14 09:11');
INSERT INTO `t_movieorder` VALUES ('47', '1', '2', '8', '35', 'zxl', '3', '2020-10-19 10');
INSERT INTO `t_movieorder` VALUES ('53', '6', '4', '7', '39', 'admin', '1', '2020-10-19 17');
INSERT INTO `t_movieorder` VALUES ('54', '6', '4', '8', '39', 'admin', '1', '2020-10-19 17');
INSERT INTO `t_movieorder` VALUES ('55', '4', '3', '6', '45', 'admin', '1', '2020-10-19 20');
INSERT INTO `t_movieorder` VALUES ('56', '4', '3', '7', '45', 'admin', '1', '2020-10-19 20');
INSERT INTO `t_movieorder` VALUES ('57', '4', '3', '8', '45', 'admin', '3', '2020-10-19 20');
INSERT INTO `t_movieorder` VALUES ('58', '14', '4', '6', '45', 'admin', '1', '2020-10-21 16');
INSERT INTO `t_movieorder` VALUES ('62', '2', '3', '5', '40', 'zxl', '1', '2020-10-27 08');
INSERT INTO `t_movieorder` VALUES ('66', '1', '4', '4', '35', 'xjs', '3', '2020-10-28 14');
INSERT INTO `t_movieorder` VALUES ('67', '1', '4', '5', '35', 'xjs', '1', '2020-10-28 14');
INSERT INTO `t_movieorder` VALUES ('68', '10', '5', '5', '40', 'zxl', '1', '2020-10-29 23');
INSERT INTO `t_movieorder` VALUES ('69', '1', '4', '6', '35', 'zxl', '3', '2020-10-30 08');
INSERT INTO `t_movieorder` VALUES ('70', '4', '5', '5', '45', 'zxl', '0', '2020-12-26 19');
INSERT INTO `t_movieorder` VALUES ('71', '1', '1', '1', '35', 'zxl', '0', '2020-12-26 19');
INSERT INTO `t_movieorder` VALUES ('72', '10', '1', '6', '40', 'zxl', '0', '2020-12-26 19');
INSERT INTO `t_movieorder` VALUES ('73', '27', '7', '10', '11', 'zxl', '0', '2021-01-15 23');
INSERT INTO `t_movieorder` VALUES ('74', '1', '1', '5', '35', 'zxl', '0', '2021-01-16 14');

-- ----------------------------
-- Table structure for t_schedule
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule` (
  `scheduleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '????id',
  `movieObj` int(11) NOT NULL COMMENT '??Ӱ',
  `hallObj` int(11) NOT NULL COMMENT '????Ӱ??',
  `scheduleDate` varchar(20) DEFAULT NULL COMMENT '??ӳ????',
  `scheduleTime` varchar(20) NOT NULL COMMENT '??ӳʱ??',
  `seatRule` int(8) DEFAULT '1' COMMENT '选座规则 1-都可选 2-单排单号可选 3-单排双号可选',
  PRIMARY KEY (`scheduleId`),
  KEY `movieObj` (`movieObj`),
  KEY `hallObj` (`hallObj`),
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`movieObj`) REFERENCES `t_movie` (`movieId`),
  CONSTRAINT `t_schedule_ibfk_2` FOREIGN KEY (`hallObj`) REFERENCES `t_moviehall` (`movieHallId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES ('1', '1', '1', '2020-08-15', '8:00', null);
INSERT INTO `t_schedule` VALUES ('2', '2', '1', '2020-08-15', '10:00', null);
INSERT INTO `t_schedule` VALUES ('3', '3', '2', '2020-08-15', '9:00', null);
INSERT INTO `t_schedule` VALUES ('4', '4', '1', '2020-0815', '15:00', null);
INSERT INTO `t_schedule` VALUES ('5', '5', '2', '2020-08-15', '14:00', null);
INSERT INTO `t_schedule` VALUES ('6', '6', '2', '2020-08-15', '18:00', null);
INSERT INTO `t_schedule` VALUES ('7', '8', '1', '2020-10-18', '20:00:00', null);
INSERT INTO `t_schedule` VALUES ('9', '7', '1', '2020-10-20', '15:00:00', null);
INSERT INTO `t_schedule` VALUES ('10', '11', '2', '2020-10-23', '16:00:00', null);
INSERT INTO `t_schedule` VALUES ('13', '22', '1', '2020-10-29', '00:00:00', null);
INSERT INTO `t_schedule` VALUES ('14', '25', '1', '2020-10-30', '00:00:00', null);
INSERT INTO `t_schedule` VALUES ('16', '47', '2', '2020-11-26', '14:00:00', null);
INSERT INTO `t_schedule` VALUES ('17', '46', '2', '2020-11-26', '20:00:00', null);
INSERT INTO `t_schedule` VALUES ('18', '45', '2', '2020-10-30', '11:00:00', null);
INSERT INTO `t_schedule` VALUES ('19', '44', '2', '2020-11-27', '21:00:00', null);
INSERT INTO `t_schedule` VALUES ('20', '43', '2', '2020-10-26', '10:29:36', null);
INSERT INTO `t_schedule` VALUES ('21', '42', '2', '2020-10-26', '08:00:00', null);
INSERT INTO `t_schedule` VALUES ('22', '41', '2', '2020-10-26', '10:30:29', null);
INSERT INTO `t_schedule` VALUES ('23', '40', '2', '2020-11-26', '20:00:00', null);
INSERT INTO `t_schedule` VALUES ('24', '39', '2', '2020-10-26', '10:31:13', null);
INSERT INTO `t_schedule` VALUES ('25', '37', '2', '2020-12-26', '00:00:00', null);
INSERT INTO `t_schedule` VALUES ('27', '48', '4', '2021-01-15', '00:00:00', null);
INSERT INTO `t_schedule` VALUES ('28', '34', '1', '2021-01-18', '00:00:00', '2');
INSERT INTO `t_schedule` VALUES ('29', '49', '1', '2021-01-18', '00:00:00', '2');

-- ----------------------------
-- Table structure for t_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_sort`;
CREATE TABLE `t_sort` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `sorts` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sort
-- ----------------------------
INSERT INTO `t_sort` VALUES ('1', '喜剧');
INSERT INTO `t_sort` VALUES ('2', '动作');
INSERT INTO `t_sort` VALUES ('3', '科幻');
INSERT INTO `t_sort` VALUES ('4', '冒险');
INSERT INTO `t_sort` VALUES ('5', '剧情');
INSERT INTO `t_sort` VALUES ('7', '运动');
INSERT INTO `t_sort` VALUES ('13', '历史');
INSERT INTO `t_sort` VALUES ('14', '战争');
INSERT INTO `t_sort` VALUES ('15', '爱情');

-- ----------------------------
-- Table structure for t_sort_movie
-- ----------------------------
DROP TABLE IF EXISTS `t_sort_movie`;
CREATE TABLE `t_sort_movie` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `movieid` int(5) NOT NULL,
  `sortsid` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sort_movie
-- ----------------------------
INSERT INTO `t_sort_movie` VALUES ('1', '1', '1');
INSERT INTO `t_sort_movie` VALUES ('2', '2', '2');
INSERT INTO `t_sort_movie` VALUES ('3', '3', '2');
INSERT INTO `t_sort_movie` VALUES ('4', '4', '2');
INSERT INTO `t_sort_movie` VALUES ('5', '5', '3');
INSERT INTO `t_sort_movie` VALUES ('6', '5', '4');
INSERT INTO `t_sort_movie` VALUES ('17', '7', '2');
INSERT INTO `t_sort_movie` VALUES ('18', '7', '7');
INSERT INTO `t_sort_movie` VALUES ('19', '8', '1');
INSERT INTO `t_sort_movie` VALUES ('20', '8', '5');
INSERT INTO `t_sort_movie` VALUES ('21', '6', '1');
INSERT INTO `t_sort_movie` VALUES ('28', '11', '1');
INSERT INTO `t_sort_movie` VALUES ('29', '11', '5');
INSERT INTO `t_sort_movie` VALUES ('39', '22', '5');
INSERT INTO `t_sort_movie` VALUES ('52', '25', '5');
INSERT INTO `t_sort_movie` VALUES ('53', '25', '13');
INSERT INTO `t_sort_movie` VALUES ('54', '25', '14');
INSERT INTO `t_sort_movie` VALUES ('62', '34', '1');
INSERT INTO `t_sort_movie` VALUES ('63', '34', '5');
INSERT INTO `t_sort_movie` VALUES ('68', '37', '1');
INSERT INTO `t_sort_movie` VALUES ('70', '39', '1');
INSERT INTO `t_sort_movie` VALUES ('71', '40', '1');
INSERT INTO `t_sort_movie` VALUES ('72', '41', '1');
INSERT INTO `t_sort_movie` VALUES ('73', '42', '1');
INSERT INTO `t_sort_movie` VALUES ('74', '43', '2');
INSERT INTO `t_sort_movie` VALUES ('75', '44', '2');
INSERT INTO `t_sort_movie` VALUES ('76', '45', '2');
INSERT INTO `t_sort_movie` VALUES ('77', '46', '2');
INSERT INTO `t_sort_movie` VALUES ('81', '47', '2');
INSERT INTO `t_sort_movie` VALUES ('82', '47', '15');
INSERT INTO `t_sort_movie` VALUES ('83', '48', '1');
INSERT INTO `t_sort_movie` VALUES ('84', '49', '2');

-- ----------------------------
-- Table structure for t_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(20) NOT NULL COMMENT 'user_name',
  `password` varchar(255) NOT NULL,
  `userPhoto` varchar(60) NOT NULL DEFAULT '/static/image/user.jpg',
  `userType` varchar(20) NOT NULL DEFAULT 'ROLE_USER',
  `regTime` varchar(20) DEFAULT NULL COMMENT 'ע??ʱ??',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('', '$2a$10$r0qWZ9PtcodkDTAiQBI6lOot1dX5FEiVhS/KfBV3WnsbNUvrjOBeS', '/static/image/', 'ROLE_USER', '2020-12-26 19');
INSERT INTO `t_userinfo` VALUES ('admin', '$2a$10$6aU/81ZSN.o68DteGwz7DOqoB7/RaUvKDqpNtn6Q0JHi1VR7.xQkm', '/static/image/user2.jpg', 'ROLE_ADMIN', '2020-10-19 15');
INSERT INTO `t_userinfo` VALUES ('gzp', '$2a$10$V.Asz3FX1bYqxKfi8TlYIeLb9moovfDYcJ71WRhjMDKklhQpwWgTq', '/static/image/头像.png', 'ROLE_ADMIN', '2020-10-29 23');
INSERT INTO `t_userinfo` VALUES ('HyMan', '$2a$10$dakReq0y44nV/oxlI.ptsOAzbYsTZBctiefaLaf6PbMIrxYE74Iru', '/static/image/user.jpg', 'ROLE_USER', '2020-10-26 20');
INSERT INTO `t_userinfo` VALUES ('hzm', '$2a$10$WyauoecFeuKVT2ZFtApNIuZuCXJfEQ4vIvUSExcochWQY9WtU5neq', '/static/image/user.jpg', 'ROLE_USER', '2020-10-23 14');
INSERT INTO `t_userinfo` VALUES ('test', '$2a$10$G4BqyAERL/6NMhjWj30nGeewnsyAttjkgiFFSQTb7IT4jUKPE3RY.', '/static/image/雪.jpg', 'ROLE_ADMIN', '2020-10-18 16');
INSERT INTO `t_userinfo` VALUES ('wd', '$2a$10$jHrW5YkrRUYHMCQmW2c7teMtXPvqrNEK7wkGIdsfwXaB3ad7rsJey', '/static/image/user.jpg', 'ROLE_USER', '2020-10-26 11');
INSERT INTO `t_userinfo` VALUES ('xjs', '$2a$10$GwjvmeBrKhMstXur3BMN.OxeRM.KCYtKKcLx17ntitVr3o4Mu7PjS', '/static/image/user.jpg', 'ROLE_USER', '2020-10-28 14');
INSERT INTO `t_userinfo` VALUES ('zm', '$2a$10$GqgLkP2Nr1HBVV2U3nrUXOQ5dZjhkCDUTDYPEDe7DN6UTWzjrXrSi', '/static/image/user.jpg', 'ROLE_USER', '2020-10-26 18');
INSERT INTO `t_userinfo` VALUES ('zxl', '$2a$10$RiPlffqmSg9P633YjQ7/Q./t3Sr.i8oI60Ks0.uQ3mTsDlaxSqcJK', '/static/image/user.jpg', 'ROLE_ADMIN', '2020');
SET FOREIGN_KEY_CHECKS=1;
