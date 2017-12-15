# SQL Manager 2007 Lite for MySQL 4.4.2.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : shopping_book


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `shopping_book`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `shopping_book`;

#
# Structure for the `admin` table : 
#

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  `admin_img` varchar(20) DEFAULT NULL,
  `admin_sex` varchar(20) DEFAULT NULL,
  `admin_tel` varchar(20) DEFAULT NULL,
  `admin_introduce` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `book` table : 
#

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(40) DEFAULT NULL,
  `book_image` varchar(20) NOT NULL,
  `book_auth` varchar(20) NOT NULL,
  `book_price` int(11) DEFAULT NULL,
  `book_publisher` varchar(50) NOT NULL,
  `book_introduce` varchar(500) DEFAULT NULL,
  `type_name` varchar(20) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `order` table : 
#

CREATE TABLE `order` (
  `user_name` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Structure for the `order_detail` table : 
#

CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `book_name` varchar(20) NOT NULL,
  `book_price` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`book_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Structure for the `type` table : 
#

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `user` table : 
#

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_sex` varchar(20) NOT NULL,
  `user_hobby` varchar(100) DEFAULT NULL,
  `user_introduce` varchar(200) DEFAULT NULL,
  `user_birthday` date DEFAULT NULL,
  UNIQUE KEY `id` (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for the `admin` table  (LIMIT 0,500)
#

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_password`, `admin_img`, `admin_sex`, `admin_tel`, `admin_introduce`) VALUES 
  (1,'zhao','z','1.jpg','男','18332163936','河北师大'),
  (2,'qian','q','2.jpg','女','18332163936','河北师大软件学院2015级1班');
COMMIT;

#
# Data for the `book` table  (LIMIT 0,500)
#

INSERT INTO `book` (`book_id`, `book_name`, `book_image`, `book_auth`, `book_price`, `book_publisher`, `book_introduce`, `type_name`, `type_id`) VALUES 
  (1,'肖秀荣2018考研政治','肖秀荣2018考研政治.jpg','肖秀荣',29,'北京航空航天大学出版社','北京航空航天吗大学','教育',4),
  (2,'高等数学','高等数学.jpg','同济大学数学系',34,'高等教学与出版社','高等数学课程包括微积分、微分方程、向量代数与空间解析几何、无穷级数等内容。从17世纪60年代牛顿、莱布尼茨创立微积分起，逐步形成了一门逻辑严密、系统完整的学科，它不仅成为其他许多数学分支的重要基础','教育',4),
  (3,'新东方四级词汇','cet4.jpg','俞敏洪',34,'浙江教育出版社','新东方四级词汇绿宝书，俞敏洪“词根+联想”经典记忆法，词汇乱序编排，全场畅销的四级词汇书！――新东方大愚英语学习丛书','教育',4),
  (4,'C语言程序设计','c.jpg','张建军',21,'海洋出版社','C语言是目前流行的通用程序设计语言，是许多计算机专业人员和计算机的爱好者学习程序设计语言的*。本书针对初学者的需求，从零开始、系统全面地讲解了C语言的专业内容与编程技巧。','教育',4),
  (5,'飞鸟集(泰戈尔英汉双语诗集)','飞鸟集.jpg','（印）泰戈尔 著，郑振铎 译',33,'外语教学与研究出版社','《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一，它包括300余首清丽的小诗。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合二为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。《飞鸟集》为中英文对照读本。','教育',4),
  (6,'新概念英语1','新概念英语1.jpg','英）亚历山大，何其莘　著',30,'外语教学与研究出版社','《新概念英语1：英语初阶（新版）》是一套世界闻名的英语教程，《新概念英语》以其全新的教学理念，有趣的课文内容和全面的技能训练，深受广大英语学习者的欢迎和喜爱。进入中国以后，《新概念英语》历经数次重印，而为了满足不同层次、不同类型英语学习者的需求，与本教程相配套的系列辅导用书和音像产品也是林林总总，不一而足。','教育',4),
  (7,'林学概论','林学概论.jog','陈祥伟，胡海波 主编',28,'中国林业出版社','本教材以森林植被恢复、重建与保护以及生态环境建设为主线，从林业发展的历史、现状与发展趋势入手，系统介绍了林学的基本概念、基本理论和基本技术与方法。本教材不仅能够帮助读者概括地了解和掌握林学的知识体系，而且有助于读者树立环境意识，更有利于科学指导森林资源的培育、经营和保护，实现资源与环境协调发展。 ','教育',4),
  (8,'诗经','诗经.jpg','曲黎敏',25,'江苏文艺出版社','唤醒现代人沉睡的诗性和情感,百万畅销书作家曲黎敏再掀国学狂飚，解读《诗经》隐藏的人生之谜！','文学',3),
  (9,'查令十字街84号','查令十字街84号.jpg','海莲·汉芙',34,'译林出版社','爱书人的圣经，平装本畅销十余年，累计超五万条读者好评','文学',3),
  (10,'四世同堂','四世同堂.jpg','老舍',65,'东方出版中心','《四世同堂》是中国现代文学*重要的长篇小说之一，也是老舍先生一生文学创作的*成就。小说以北平城内“小羊圈胡同”中的祁家四世同堂的生活为主线','文学',3),
  (11,'暖暖心绘本（全四辑19本）','暖暖心绘本.jpg','伊朗）米拦弗特毕',92,'湖南少儿出A版社','冰心儿童图书奖，为3-7岁处在性格形成关键期的孩子准备的一份心理自助礼物，让孩子学会倾诉与聆听、感恩与知足、友善与互助、给予和分享、团结和协作、独立与勇敢、成长和自信儿童绘本3-6岁 ','少儿',1),
  (12,'星星与蒲公英','星星与蒲公英.jpg','〔日〕金子美铃',23,'新星出版社','金子美铃诗集绘本版。被誉为诗坛巨星的她，纯真，深邃；总是向着明亮那方的她，真挚、温暖。这就是金子美铃！《可爱的鼠小弟》作者上野纪子倾心绘作，适合孩子的诗集。','少儿',1),
  (13,'安徒生童话全集','安徒生.jpg','（丹麦）安徒生',108,'浙江少年儿童出版社','200年前，童话大师安徒生的诞生成就了这个世界*令人惊奇的童话之一。这位鞋匠、洗衣妇的儿子在贫困潦倒中创作了“丑小鸭”、“卖火柴的小女孩”、“皇帝的新装”等经典之作，在实现自己梦想的同时，给世界留下了发人深省的思考，感动了一代又一代的读者','少儿',1),
  (14,'怪兽国','怪兽国.jpg','（德）卡塔琳娜?克兰普',89,'新星出版社','孩子在阅读本套奇幻儿童文学时，既能够从主人公身上汲取成长所必须的智慧、胆量、力量，又可以从惊心动魄、离奇曲折的情节中学会冷静、乐观、坚强、真诚的处世态度。','少儿',1),
  (15,'一禅小和尚','一禅小和尚.jpg','一禅小和尚',38,' 江苏凤凰文艺出版社','幅幅萌到爆棚！独特的水墨彩绘，可爱到喷血的人物形象，真挚的情感共鸣，暖萌减压的诚意之作~ 微博每条漫画转发量平均三万+的国民IP作品，人民日报等主流媒体都纷纷转发的“忒可爱了”作品。','漫画',2),
  (16,'就喜欢你看不惯我又干不掉我的样子','就喜欢.jpg','白茶',46,'北京长江新世纪文化传媒有限公','这是在微博上被数百万次转发的名猫“吾皇”的故事。在书中，少年讲述了与吾皇相遇的故事，和一家三口在家中的日常。在书中，不仅有白茶老爹乱入，隔壁老王躺枪，还有编辑对少年的超长篇采访记。惊喜不容错过(*￣︶￣)y','漫画',2),
  (17,'哑舍（叁）','哑舍.jpg','晓泊，玄色',20,'中国致公出版社','哑舍·叁（漫画版）围绕帝王的十二件古董展开，借老板的寻古之旅揭秘皇族之间的亲情纠葛：天钺斧所引起的猜疑、独玉佛所粉饰的残缺、龙纹铎所预示的控制、玉带钩所展现的野心……更牵涉到老板、扶苏、医生、胡亥一系列人物的命运，情节跌宕起伏，情感真挚细腻，令人读来不忍释手。','漫画',2),
  (18,'父与子全集','父与子.jpg','[德]卜劳恩（图）',30,'北方妇女儿童出版社','父亲在教育孩子的过程中是不能缺失的角色。父亲的教养不仅带给孩子更多的帮助，也给自己和家庭带来幸福和快乐。然而，又有多少人能像卜劳恩笔下的父亲一样，满怀一颗爱的种子，在与儿子建造的爱的天堂享受其乐呢？一幅幅小而精湛的画面里跳跃着的是智慧的光芒，简单线条里流淌出的是纯真的父子之情与融融天伦之乐','漫画',2),
  (19,'窝在角落好安心','窝在角落好安心.jpg','（日）横沟百合 著',32,'接力出版社','来自北极却非常怕冷的“小白熊”，觉得自己浑身绿色不像真企鹅的小企鹅，被人丢弃后带着淡淡忧伤和自卑情绪的炸猪排及炸虾尾，还有不管遭遇什么挫折内心都充满乐观和希望的小杂草……每个小萌物的身上都有些与众不同的地方，也正是因为这些与众不同，让小萌物们聚到了一起。读者能感受到角落小伙伴们性格中的自怜、自卑，甚至有些许自闭，却乐观地从不放弃追逐希望的美好一面。','漫画',2),
  (20,'阿衰套装','阿衰套装.jpg','猫小乐',100,'云南教育出版社','《阿衰online》描写一个超级糗蛋——一位14岁初二男生阿衰的搞笑生活，深受学生读者的喜爱，阿衰已经成为颇具商业潜力的卡通人物。《阿衰online》系列漫画书以每年4本的速度不断推出，该漫画是内地幽默漫画商业上取得成功的典范。 ','漫画',2),
  (21,'你今天真好看','你今天真好看.jpg','[美]莉兹克里莫',38,'天津人民出版社','《你今天真好看》是一本清新暖萌的漫画集，收录了莉兹·克里莫150多张逗趣漫画。书中集结了所有你能想到的各种萌物，恐龙、*、兔子、企鹅，甚至还有伞蜥、獾、土拨鼠、狐獴……在诙谐的对话中，它们展现出一种与生俱来的幽默感和令人艳羡的生活情趣。','漫画',2),
  (22,'世说新语(精)上下册','世说新语.jpg','朱碧莲，沈海波',45,'中华书局','《世说新语》是我国古代志人笔记的代表作，作者为刘宋临川王刘义庆。全书共36篇1130则，主要记载了东汉末年至刘宋初年近三百年间的人物故事，内容涉及政治、经济、文学、思想、习俗、民生等各个方面。文笔简洁明快，语言含蓄隽永，只言片语即可刻画出鲜活的人物形象，是我国古典文学名著之一。','文学',3),
  (23,'明朝那些事儿全集','明朝那些事.jpg','当年明月 著',98,':浙江人民出版社','《明朝那些事儿》这篇文主要讲述的是从1344年到1644年这三百年间关于明朝的一些事情，以史料为基础，以年代和具体人物为主线，并加入了小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多，并加入对当时政治经济制度、人伦道德的演义。','文学',3),
  (24,'你是人间四月天','你是人间四月天.jpg','林徽因　著',28,'北京联合出版公司','《你是人间四月天》收录了林徽因几乎所有的诗歌、散文、小说。包括诗歌《谁爱这不息的变幻》《你是人间的四月天》《激昂》，散文《悼志摩》《一片阳光》，小说《九十九度中》《模影零篇》等脍炙人口的名篇，内容含量大且丰富，一本书即可了解全部的林徽因。','文学',3),
  (25,'白夜行','白夜行.jpg','[日]东野圭吾',39,'南海出版公司','《白夜行》是东野圭吾当之无愧的鸿篇巨制，全书故事跨越19年时间，登场人物超过50个，草蛇灰线伏脉千里，情节线索纵横交错又丝丝入扣，用一桩离奇命案牵出案件相关人跨越19年惊心动魄的故事、悲凉的爱情、吊诡的命运、令人发指的犯罪、白描又生动的社会图景、复杂人性的对决与救赎，读来令人叹为观止。','小说',5),
  (26,'我在未来等你','我在未来等你.jpg','刘同',25,'北京联合出版有限公司','你会不会偶尔产生那种“如果能回到那一年就好了”的念头？觉得回到那一年，以我们当下的见识和心态，很多事都能被改变。','小说',5),
  (27,'小王子','小王子.jpg','(法)安托万·德·圣埃克苏佩里',32,'天津人民出版社','这是一本足以让人永葆童心的不朽经典，被全球亿万读者誉为非常值得收藏的书。','小说',5);
COMMIT;

#
# Data for the `order` table  (LIMIT 0,500)
#

INSERT INTO `order` (`user_name`, `user_id`, `order_id`) VALUES 
  ('赵',1,1),
  ('赵',1,2);
COMMIT;

#
# Data for the `order_detail` table  (LIMIT 0,500)
#

INSERT INTO `order_detail` (`order_id`, `book_id`, `book_name`, `book_price`, `user_id`) VALUES 
  (1,8,'诗经',25,1),
  (2,14,'怪兽国',89,1),
  (3,15,'一禅小和尚',38,1),
  (4,8,'诗经',25,1),
  (5,15,'一禅小和尚',38,1),
  (6,8,'诗经',25,1),
  (7,8,'诗经',25,1),
  (8,15,'一禅小和尚',38,1),
  (9,8,'诗经',25,1),
  (10,22,'世说新语(精)上下册',45,1);
COMMIT;

#
# Data for the `type` table  (LIMIT 0,500)
#

INSERT INTO `type` (`type_id`, `type_name`) VALUES 
  (1,'少儿'),
  (2,'漫画'),
  (3,'文学'),
  (4,'教育'),
  (5,'小说');
COMMIT;

#
# Data for the `user` table  (LIMIT 0,500)
#

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_sex`, `user_hobby`, `user_introduce`, `user_birthday`) VALUES 
  (1,'赵','z','男','运动','河北师大软件学院','1997-01-01'),
  (2,'钱','q','男','读书','河北师大软件学院','1997-01-02'),
  (3,'sun','s','å¥³',NULL,'123 ','2017-10-01'),
  (4,'æ','l','ç·',NULL,'123 ','2017-06-01');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;