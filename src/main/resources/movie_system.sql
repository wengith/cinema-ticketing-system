/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : movie_system

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2021-01-16 15:35:17
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
INSERT INTO `persistent_logins` VALUES ('zxl', '++Ws6KPVrGLTEHNsCMmUKQ==', 'mcOCq6Qng7zSgkEnqgjTZQ==', '2021-01-16 15:26:47');
INSERT INTO `persistent_logins` VALUES ('zm', '74QNfx/hSr+pza3UTdxdKQ==', 'mihQAm1+rkaaIsstfe1KtA==', '2020-10-26 18:46:26');
INSERT INTO `persistent_logins` VALUES ('admin', 'q/SCrBuuh5Xh8hapBiebAA==', 'llzEurUkhuEFbMZbpjlUrQ==', '2020-12-26 19:42:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_movie
-- ----------------------------
INSERT INTO `t_movie` VALUES ('1', '飞驰人生', '/static/image/001.jpg', '韩寒', '沈腾 / 尹正', '120', '中国大陆', '2020-08-06', '35', '65', '曾经叱咤风云的拉力赛车手张驰（沈腾 饰），五年前因私自赛车而被禁赛。从天堂跌落谷底，张驰饱尝生活的艰辛。他忍辱负重，洗心革面，终于争取到了解禁的判决。在此之后，他重新找到亲如兄弟的领航员孙宇强（尹正 饰），决心共同冲击本年度的巴音布鲁克拉力赛。然而在此之前，张驰必须重考驾照，改装赛车，拉到赞助。每一步都充满艰难，他忍受着旁人的奚落嘲讽，忍受着现实的冰冷残酷，无论如何都不改变前进的目标。当他好不容易走到了赛场，还将面对禁赛这几年崛起的新秀林臻东（黄景瑜 饰）的挑战。\r\n　　张驰的时代是否就此远去…… ');
INSERT INTO `t_movie` VALUES ('2', '战狼1', '/static/image/003.jpg', '吴京', '吴京 / 余男 / 斯科特·阿金斯', '90', '中国大陆', '2015-04-02', '40', '19', '在南疆围捕贩毒分子的行动中，特种部队狙击手冷锋（吴京 饰）公然违抗上级的命令，开枪射杀伤害了战友的暴徒武吉（周晓鸥 饰）。这一行动令冷锋遭到军方禁闭甚至强制退伍的处罚，不过各特种部队精英组成超级特种部队战狼中队的中队长龙小云（余男 饰），却十分欣赏这个敢作敢为且业务过硬的血性男儿，于是将其召入自己的麾下。在新近的一次演习中，冷锋凭借冷静的判断力从老首长处拔得一城，并且成功击退了突然出现的狼群。谁知在毫无准备的情况下，战狼遭到了一伙荷枪实弹分子的袭击。原来武吉的哥哥敏登（倪大红 饰）是一个冷酷无情的国际通缉犯，他手下豢养了一大批身怀绝技的雇佣兵。\r\n　　为了给弟弟报仇，敏登派出雇佣兵千里迢迢奔着冷锋而来……');
INSERT INTO `t_movie` VALUES ('3', '红海行动', '/static/image/002.jpg', '林超贤', '张译 / 黄景瑜 / 海清 / 杜江 / 蒋璐霞 /', '138', '中国大陆', '2018-02-06', '40', '19', '中东国家伊维亚共和国发生政变，武装冲突不断升级。刚刚在索马里执行完解救人质任务的海军护卫舰临沂号，受命前往伊维亚执行撤侨任务。舰长高云（张涵予 饰）派出杨锐（张译 饰）率领的蛟龙突击队登陆战区，护送华侨安全撤离。谁知恐怖组织扎卡却将撤侨部队逼入交火区，一场激烈的战斗在所难免。与此同时，法籍华人记者夏楠（海清 饰）正在伊维亚追查威廉·柏森博士贩卖核原料的事实，而扎卡则突袭柏森博士所在的公司，意图抢走核原料。混战中，一名隶属柏森博士公司的中国员工成为人质。为了解救该人质，八名蛟龙队员必须潜入有150名恐怖分子的聚集点，他们用自己的信念和鲜血铸成中国军人顽强不屈的丰碑！\r\n　　本片根据也门撤侨事件改编。');
INSERT INTO `t_movie` VALUES ('4', '战狼2', '/static/image/004.jpg', '吴京', '吴京 / 弗兰克·格里罗 / 吴刚 / 张翰 / 卢靖姗 /', '123', '中国大陆', '2017-07-27', '45', '22', '由于一怒杀害了强拆牺牲战友房子的恶霸，屡立功勋的冷锋（吴京 饰）受到军事法庭的判决。在押期间，亲密爱人龙小云壮烈牺牲。出狱后，冷锋辗转来到非洲，他辗转各地，只为寻找杀害小云的凶手。在此期间，冷锋逗留的国家发生叛乱，叛徒红巾军大开杀戒，血流成河。中国派出海军执行撤侨任务，期间冷锋得知有一位陈博士被困在五十五公里外的医院，而叛军则试图抓住这位博士。而从另一位华侨（于谦 饰）口中得知，杀害小云的凶手正待在这个国家。\r\n　　在无法得到海军支援的情况下，冷锋只身闯入硝烟四起的战场。不屈不挠的战狼，与冷酷无情的敌人展开悬殊之战…… ');
INSERT INTO `t_movie` VALUES ('5', '星际穿越', '/static/image/006.jpg', '克里斯托弗·诺兰', ' 马修·麦康纳 / 安妮·海瑟薇 / 杰西卡·查斯坦 / 麦肯吉·弗依 / 卡西·阿弗莱克 /', '169', '美国 / 英国 / 加拿大 / 冰岛', '2020-08-02', '35', '39', '近未来的地球黄沙遍野，小麦、秋葵等基础农作物相继因枯萎病灭绝，人类不再像从前那样仰望星空，放纵想象力和灵感的迸发，而是每日在沙尘暴的肆虐下倒数着所剩不多的光景。在家务农的前NASA宇航员库珀（马修·麦康纳 Matthew McConaughey 饰）接连在女儿墨菲（麦肯吉·弗依 Mackenzie Foy 饰）的书房发现奇怪的重力场现象，随即得知在某个未知区域内前NASA成员仍秘密进行一个拯救人类的计划。多年以前土星附近出现神秘虫洞，NASA借机将数名宇航员派遣到遥远的星系寻找适合居住的星球。在布兰德教授（迈克尔·凯恩 Michael Caine 饰）的劝说下，库珀忍痛告别了女儿，和其他三名专家教授女儿艾米莉亚·布兰德（安妮·海瑟薇 Anne Hathaway 饰）、罗米利（大卫·吉雅西 David Gyasi 饰）、多伊尔（韦斯·本特利 Wes Bentley 饰）搭乘宇宙飞船前往目前已知的最有希望的三颗星球考察。\r\n　　他们穿越遥远的星系银河，感受了一小时七年光阴的沧海桑田，窥见了未知星球和黑洞的壮伟与神秘。在浩瀚宇宙的绝望而孤独角落，总有一份超越了时空的笃定情怀将他们紧紧相连……');
INSERT INTO `t_movie` VALUES ('6', '夏洛特烦恼', '/static/image/005.jpg', '闫非 / 彭大魔', ' 沈腾 / 马丽 / 尹正 / 艾伦 / 王智 /', '104', '中国大陆', '2015-09-30', '39', '26', '在学生时代的初恋秋雅（王智 饰）的婚礼上，毕业后吃软饭靠老婆养的夏洛（沈腾 饰）假充大款，出尽其丑，中间还被老婆马冬梅（马丽 饰）戳穿暴捶。混乱之中，夏洛意外穿越时空，回到了1997年的学生时代的课堂里。他懵懵懂懂，以为是场真实感极强的梦，于是痛揍王老师，强吻秋雅，还尝试跳楼让自己醒来。当受伤的他从病床上苏醒时，他意识到自己真的穿越了时空。既然有机会重新来过，那不如好好折腾一回。他勇敢追求秋雅、奚落优等生袁华（尹正 饰）、拒绝马冬梅的死缠烂打。后来夏洛凭借“创作”朴树、窦唯等人的成名曲而进入娱乐圈。\r\n　　他的人生发生翻天覆地的巨变，但是内心某个地方却越来越感到空虚……');
INSERT INTO `t_movie` VALUES ('7', '夺冠', '/static/image/p2620083313.jpg', ' 陈可辛', '巩俐 / 黄渤 / 吴刚 / 彭昱畅 / 白浪 ', '135', '中国大陆 / 中国香港', '2020-9-25', '39', '42', '2008年8月15日，北京奥运会女排比赛，中国VS美国。戴着金丝框眼镜的郎平（巩俐 饰）坐在美国队教练席上，大气沉稳，目光如电；中国队教练（黄渤 饰）站在场边，全神贯注，面带笑容。中国队教练望向郎平，目光充满深意，不断经过的人影遮蔽了他的视线，中国女排三十余年的沉浮图景被缓缓打开……');
INSERT INTO `t_movie` VALUES ('8', '我和我的家乡', '/static/image/p2620453443.jpg', ' 宁浩 / 徐峥.....', ' 葛优 / 黄渤 / 范伟 / 邓超 / 沈腾', '153', '中国大陆', '2020-10-01', '25', '22', '电影《我和我的家乡》定档2020年国庆，延续《我和我的祖国》集体创作的方式，由张艺谋担当总监制，宁浩担任总导演，张一白担任总策划，宁浩、徐峥、陈思诚、闫非&彭大魔、邓超&俞白眉分别执导五个故事。');
INSERT INTO `t_movie` VALUES ('11', '我不是药神', '/static/image/p2561305376.jpg', '文牧野', ' 徐峥 / 王传君 / 周一围 / 谭卓 / 章宇 /', '117', '中国大陆', '2020-08-15', '40', '27', '普通中年男子程勇（徐峥 饰）经营着一家保健品店，失意又失婚。不速之客吕受益（王传君 饰）的到来，让他开辟了一条去印度买药做“代购”的新事业，虽然困难重重，但他在这条“买药之路”上发现了商机，一发不可收拾地做起了治疗慢粒白血病的印度仿制药独家代理商。赚钱的同时，他也认识了几个病患及家属，为救女儿被迫做舞女的思慧（谭卓 饰）、说一口流利“神父腔”英语的刘牧师（杨新鸣 饰），以及脾气暴烈的“黄毛”（章宇 饰），几个人合伙做起了生意，利润倍增的同时也危机四伏。程勇昔日的小舅子曹警官（周一围 饰）奉命调查仿制药的源头，假药贩子张长林（王砚辉 饰）和瑞士正牌医药代表（李乃文 饰）也对其虎视眈眈，生意逐渐变成了一场关于救赎的拉锯战。\r\n　　本片改编自慢粒白血病患者陆勇代购抗癌药的真实事迹。');
INSERT INTO `t_movie` VALUES ('22', '我和我的祖国', '/static/image/p2567998580.jpg', ' 陈凯歌 / 张一白···', '黄渤 / 张译 / 韩昊霖 / 杜江 / 葛优', '155', '中国大陆', '2019-09-30 00:00:00', '30', '4', '七位导演分别取材新中国成立70周年以来，祖国经历的无数个历史性经典瞬间。讲述普通人与国家之间息息相关密不可分的动人故事。聚焦大时代大事件下，小人物和国家之间，看似遥远实则密切的关联，唤醒全球华人共同回忆。');
INSERT INTO `t_movie` VALUES ('25', '八佰', '/static/image/p2615992304.jpg', '管虎', '王千源 / 张译 / 姜武 / 黄志忠 / 张俊', '147', '中国大陆', '2020-08-21 00:00:00', '45', '78', '1937年淞沪会战的最后一役，“八百壮士”奉命坚守上海四行仓库，以少敌多顽强抵抗四天四夜。电影《八佰》由管虎导演，是亚洲首部全片使用IMAX摄影机拍摄的商业电影，将于2020年8月21日全国影院上映。');
INSERT INTO `t_movie` VALUES ('34', '半个喜剧 ', '/static/image/a_half _comedy.jpg', ' 周申 刘露', '任素汐 饰 莫默 吴昱翰 饰 孙同 刘迅 饰 郑多多 汤敏 饰 高璐', '111', '中国大陆', '2020-10-25 19:56:00', '35', '7', '三个自由浪漫的年轻人，过着各怀心思的人生：有人急着摆脱单身，有人想在结婚前放荡一番，有人想在 大城市站稳脚跟。因为一次情感出轨，三人扭结成了一团“嬉笑怒骂”的乱麻。当各种价值观碰撞在一起， 当一个人需要平衡亲情友情与爱情......他们慌乱的生活，就像是半个喜剧。');
INSERT INTO `t_movie` VALUES ('37', '鼠胆英雄', '/static/image/shudanyingxiong.jpg', ' 束焕 邵丹', ' 岳云鹏 饰 闫大海 佟丽娅 饰 杜卿 田雨 饰 赵瀚青 袁弘 饰 邢铁城 大鹏 饰 枪神', '105', '中国大陆', '2020-10-07 14:00:00', '40', '4', '三十年代的上海滩，胆小如鼠的青龙帮小弟闫大海发现自己身患绝症之际，竟阴差阳错当上了警察。为了给梦中女神--飞乐门舞女杜卿挣赎身钱，他计划在自己生命中所剩不多的时间里因公殉职，从而拿到抚恤金拯救女神。然而，在他疯狂执行铲除“黑帮”、“毒枭”任务以身赴死期间，却总是事与愿违求死不得死，反而得到屡屡升迁。然而，纸醉金迷的上海滩，还隐藏着更大的危机…\r\n ');
INSERT INTO `t_movie` VALUES ('39', '老师好', '/static/image/laoshihao.jpg', ' 张栾', ' 于谦 饰 苗宛秋 汤梦佳 饰 安静 秦鸣悦 饰 关婷婷 ', '113', '中国大陆', '2020-10-14 21:00:00', '56', '6', '1985年的南宿一中，苗宛秋老师推自行车昂首走在校园，接受着人们艳羡的目光和纷至沓来的恭维。桀傲不驯的洛小乙、温婉可人的安静、新潮前卫的关婷婷、大智若愚的脑袋、舞痴兄弟文明建设、八婆海燕、奸商耗子……三班是一个永远也不缺故事的集体。苗宛秋怎么也不会想到，他即将走进的这个三班将会成为他以及他身边这辆自行车的噩梦。三班的同学也没有想到，这位新来的老师改变了他们的一生。');
INSERT INTO `t_movie` VALUES ('40', '陈翔六点半', '/static/image/chongloubie.jpg', ' 陈翔', ' 毛台 饰 刘君山 冷檬 饰 段晓蓝 妹大爷 饰 姜大爷 陈翔 饰 鼓手', '121', '中国大陆', '2020-10-14 17:00:00', '47', '4', '地方戏曲演员刘馆长和几个弟子一起经营着一家戏馆，戏馆收入微薄，每天只有几个逃票进来的老头，为了维持戏馆生存，刘馆长想尽办法，但收效甚微，他们的生活也陷入了窘境。 有一天，戏馆出现了一个年轻漂亮的姑娘段晓蓝，她是戏馆唯一的年轻观众，也成为了戏馆的希望。这期间，因为偶然事件，段晓蓝身上有了解开戏馆困局的办法，为了能让戏馆延续下去，他们带上这唯一的年轻女观众，开始了一段妙趣横生又曲折离奇的疗伤之旅……');
INSERT INTO `t_movie` VALUES ('41', '小小的愿望', '/static/image/little_wish.jpg', ' 田羽生', '彭昱畅 饰 高远 王大陆 饰 徐浩 魏大勋 饰 张正阳', '98', '中国大陆', '2019-10-23 00:00:00', '23', '4', '突然患上肌肉萎缩症的高中生高远，被医生告知时日不多，决心在临死之前完成一个愿望，那就是成为一个真正的男人！得知这个消息的身边两位好兄弟徐浩和张正阳，为了兄弟最后的愿望，不惜一切奋战到底！');
INSERT INTO `t_movie` VALUES ('42', '雪人奇缘', '/static/image/xuierenqiyuan.jpg', 'Claire Carleton', '汪可盈 饰 小艺 莎拉·保罗森 饰 扎拉博士 阿尔伯特·蔡 饰 小鹏 艾迪·伊扎德 饰 博尼士', '118', '中国大陆', '2018-08-16 00:00:00', '34', '5', '珠穆朗玛峰的雪人是传说吗？不是！不仅不是传说，它还拥有令人着迷的魔力！少女小艺在天台上目睹了雪人大毛即将被抓的惨况，决定亲自护送大毛回家，她的小伙伴阿俊和鹏鹏也加入了护送队伍，一场关于“回家”的中华大冒险就此开始。');
INSERT INTO `t_movie` VALUES ('43', '狙击手', '/static/image/jujishou.jpg', '黄照盛', '任天野 饰 高瞻 是之 饰 罗星烈 张冬 饰 陈璐茜', '118', '中国大陆', '2019-10-08 00:00:00', '33', '20', '地处东非资源富饶的萨基亚，是21世纪初非洲大陆屈指可数的增长经济体。因为政治利益，3年前的总统大选结果遭到军方否认，国家陷入了战争的深渊。 萨基亚被由总统的秩序军和军阀的自由军一分为二。常年的战争使得人民的生活陷入水深火热之中，滥用的生化武器让原本肥沃的土地变得贫瘠。 战争也带来了外国军队、恐怖分子、军火公司、私人武装。');
INSERT INTO `t_movie` VALUES ('44', '鬼吹灯之龙岭迷窟', '/static/image/guichuideng.jpg', '朴成淑', '林雨申 饰 胡八一 康宁 饰 雪莉杨', '99', '中国大陆', '2019-06-11 00:00:00', '33', '12', '传闻龙岭迷窟中出土过龙骨异文，Shirley杨前往调查遇到胡八一等人，在幽灵空冢一探究竟，胡八一询问红斑之事，Shirley杨道出当年鹧鸪哨的故事。自精绝古城回来Shirley杨带陈教授回美国治疗，发现背上长出眼球状的红斑。胡八一与王胖子、大金牙前往古蓝县进货，遇到Shirley杨。随后四人进到一座幽灵冢寻找无果，险些葬于人面蜘蛛的果腹。出来后，胡八一和王胖子也长出红斑，');
INSERT INTO `t_movie` VALUES ('45', '怒海狂蛛', '/static/image/nuhaikuangzhu.jpg', ' 钱人豪', '王阳明 饰 阿杰 郑人硕 饰 阿泰 柯佳嬿 饰 小菁 李李仁 饰 阿丁', '139', '中国大陆', '2019-05-08 00:00:00', '30', '9', '救难队员阿杰（王阳明 饰）冒着生命危险跟队友在狂风暴雨中救援一艘触礁油轮，为了营救不愿放弃的游轮船长，阿杰的队长不幸被一个从深海出没“黑影”拖进海里。幸存的阿杰从此背负着同僚死亡的阴影，颓废丧志。 多年后，阿杰为谋生克服阴影再次登上渔船，却被船员阿泰（郑人硕 饰）、副船长阿丁(李李仁 饰)等人视为不详不停挑衅。某天，众人救起因游艇翻覆落海的小菁（柯佳嬿 饰）');
INSERT INTO `t_movie` VALUES ('46', '破神录', '/static/image/poshenlu.jpg', '秦鹏飞', '谢苗 饰 杨烈钧 南笙 饰 孙瑾 王文杰（演员） 饰 黎叔文', '114', '中国大陆', '2019-08-07 00:00:00', '35', '5', '民国初年，依靠邪魅幻术蛊惑人心的教派轮番登场，奇人异士“风火雷电大变活人”、“女娲娘娘徒手掏心”荼毒百姓不得安宁。大家闺秀孙瑾（南笙饰）欲揭穿无量老祖骗局却险遭恶徒侮辱，关键时刻人狼镖师黎叔文（王文杰饰）赶到将其救下，与此同时');
INSERT INTO `t_movie` VALUES ('47', '大天蓬', '/static/image/tian_peng.jpg', '代艺霖', '应昊茗 饰 天蓬 王艺哲 饰 宝儿 张玉轩 饰 孙悟空 连凯 饰 护天神将', '115', '中国大陆', '2019-08-07 00:00:00', '34', '12', '孙悟空大闹天宫，天蓬与之交战打成平手，孙悟空被压五指山后，天蓬元帅领命下界击杀孙悟空以绝后患。在人间的天蓬巧遇捉妖师宝儿与她的捉妖团，几人一行上路寻找五指山，过程一波三折，天蓬大起大落，历尽劫难后悟得大爱');
INSERT INTO `t_movie` VALUES ('48', '测试', '/static/image/微信图片_20191231111153.jpg', '文', '文/文', '111', '中国', '2021-01-12 00:00:00', '11', '1', '测试水水水水水水水水水水');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_moviehall
-- ----------------------------
INSERT INTO `t_moviehall` VALUES ('1', '1号放映厅', '7', '10', '1');
INSERT INTO `t_moviehall` VALUES ('2', '2号放映厅', '7', '10', '1');
INSERT INTO `t_moviehall` VALUES ('4', '测试放映厅', '1', '1', '1');

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
  PRIMARY KEY (`scheduleId`),
  KEY `movieObj` (`movieObj`),
  KEY `hallObj` (`hallObj`),
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`movieObj`) REFERENCES `t_movie` (`movieId`),
  CONSTRAINT `t_schedule_ibfk_2` FOREIGN KEY (`hallObj`) REFERENCES `t_moviehall` (`movieHallId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES ('1', '1', '1', '2020-08-15', '8:00');
INSERT INTO `t_schedule` VALUES ('2', '2', '1', '2020-08-15', '10:00');
INSERT INTO `t_schedule` VALUES ('3', '3', '2', '2020-08-15', '9:00');
INSERT INTO `t_schedule` VALUES ('4', '4', '1', '2020-0815', '15:00');
INSERT INTO `t_schedule` VALUES ('5', '5', '2', '2020-08-15', '14:00');
INSERT INTO `t_schedule` VALUES ('6', '6', '2', '2020-08-15', '18:00');
INSERT INTO `t_schedule` VALUES ('7', '8', '1', '2020-10-18', '20:00:00');
INSERT INTO `t_schedule` VALUES ('9', '7', '1', '2020-10-20', '15:00:00');
INSERT INTO `t_schedule` VALUES ('10', '11', '2', '2020-10-23', '16:00:00');
INSERT INTO `t_schedule` VALUES ('13', '22', '1', '2020-10-29', '00:00:00');
INSERT INTO `t_schedule` VALUES ('14', '25', '1', '2020-10-30', '00:00:00');
INSERT INTO `t_schedule` VALUES ('16', '47', '2', '2020-11-26', '14:00:00');
INSERT INTO `t_schedule` VALUES ('17', '46', '2', '2020-11-26', '20:00:00');
INSERT INTO `t_schedule` VALUES ('18', '45', '2', '2020-10-30', '11:00:00');
INSERT INTO `t_schedule` VALUES ('19', '44', '2', '2020-11-27', '21:00:00');
INSERT INTO `t_schedule` VALUES ('20', '43', '2', '2020-10-26', '10:29:36');
INSERT INTO `t_schedule` VALUES ('21', '42', '2', '2020-10-26', '08:00:00');
INSERT INTO `t_schedule` VALUES ('22', '41', '2', '2020-10-26', '10:30:29');
INSERT INTO `t_schedule` VALUES ('23', '40', '2', '2020-11-26', '20:00:00');
INSERT INTO `t_schedule` VALUES ('24', '39', '2', '2020-10-26', '10:31:13');
INSERT INTO `t_schedule` VALUES ('25', '37', '2', '2020-12-26', '00:00:00');
INSERT INTO `t_schedule` VALUES ('27', '48', '4', '2021-01-15', '00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

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
