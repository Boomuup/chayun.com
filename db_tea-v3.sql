/*
 Navicat Premium Data Transfer

 Source Server         : mysql8.0.16
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : db_tea

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 06/04/2021 11:02:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id,外键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话\r\n',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `detailinfo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreign_key_to_user`(`uid`) USING BTREE,
  CONSTRAINT `foreign_key_to_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 10, '张三', '18493048594', '辽宁省', '沈阳市', '和平区', 'XXXX街道XXX34号');
INSERT INTO `address` VALUES (2, 10, '李四', '15039884732', '江苏省', '南京市', '玄武区', 'XXX街道XXX楼22号');
INSERT INTO `address` VALUES (3, 1, '王五', '12574458623', '浙江省', '杭州市', '下城区', 'XXX街道XXX3142号');
INSERT INTO `address` VALUES (4, 10, '李逵', '13599403459', '湖南省', '长沙市', '芙蓉区', 'xxx街道 323号');
INSERT INTO `address` VALUES (5, 10, '啊啊啊', '23424324', '内蒙古自治区', '呼和浩特市', '新城区', '广泛大概法国发过');
INSERT INTO `address` VALUES (6, 10, '打算点', '343454543', '广东省', '广州市', '从化区', '法国大使馆');
INSERT INTO `address` VALUES (7, 10, '金发科技', '23432432', '天津市', '天津市市辖区', '和平区', '23434的方法法国');
INSERT INTO `address` VALUES (8, 10, '打发士', '2334342324', '山东省', '济南市', '历下区', '2343433423梵蒂冈的规格');
INSERT INTO `address` VALUES (9, 10, '12', '23231', '广东省', '广州市', '从化区', '123');
INSERT INTO `address` VALUES (10, 10, '小红', '14324343343', '广东省', '广州市', '从化区', '数据分类看啥');
INSERT INTO `address` VALUES (11, 10, '卢小布', '1456565767', '广东省', '广州市', '从化区', '啊吧街道454号');
INSERT INTO `address` VALUES (13, 2, 'tom', '149658596054', '辽宁省', '抚顺市', '新抚区', 'xxx街道xx号楼');
INSERT INTO `address` VALUES (14, 2, 'ho', '145878765454', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '阿图什市', 'dfdsfdsdf');
INSERT INTO `address` VALUES (15, 7, 'coco', '15948456341', '山东省', '济南市', '历下区', 'xxx街道23号');
INSERT INTO `address` VALUES (16, 7, 'lily', '13458395542', '辽宁省', '沈阳市', '和平区', 'xxx街道xxxx小区344号');
INSERT INTO `address` VALUES (17, 8, 'lily', '146455656667', '天津市', '天津市市辖区', '和平区', 'djfkdfjk');
INSERT INTO `address` VALUES (18, 9, 'huo', '135553344544', '河北省', '邯郸市', '邯山区', 'dsjfkfjksfjslk');
INSERT INTO `address` VALUES (19, 9, '张三', '16345644685', '广东省', '广州市', '白云区', 'xxx街道x\'x\'x232号');
INSERT INTO `address` VALUES (20, 11, '宗盛', '18475933443', '广东省', '广州市', '花都区', 'xxxx街道xxx号xxx');
INSERT INTO `address` VALUES (21, 11, '黎明', '15867533456', '广东省', '广州市', '从化区', 'xxxx街道xxx号');
INSERT INTO `address` VALUES (22, 11, 'kiki', '15856455455', '广东省', '广州市', '越秀区', 'xxxx街道xxx小区xxx号');
INSERT INTO `address` VALUES (23, 5, 'tont', '15948586923', '山西省', '太原市', '杏花岭区', 'xxx街道xxxx号');
INSERT INTO `address` VALUES (24, 12, 'chen', '13857593213', '广东省', '珠海市', '香洲区', 'xxx街道xxx号111');
INSERT INTO `address` VALUES (44, 8, '佳豪', '18402057856', '河北省', '保定市', '竞秀区', '某个街道光明小区23号');
INSERT INTO `address` VALUES (45, 1, '李四', '1445654345', '广东省', '广州市', '从化区', 'xxxxx街道xxx号');
INSERT INTO `address` VALUES (46, 13, '盛二', '16455667676', '河北省', '石家庄市', '行唐县', 'xxx街道xxx号');
INSERT INTO `address` VALUES (49, 8, 'hua c', '18402057856', '广东省', '深圳市', '罗湖区', 'dsdsdsdss');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `role` int(1) NOT NULL DEFAULT 0 COMMENT '1代表超级管理员，0代表普通管理管理员',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `login_num` int(6) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `last_login` int(11) NOT NULL DEFAULT 0 COMMENT '上一次登录的时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (2, 'cjh', '96e79218965eb72c92a549dd5a330112', 'kaljkljkldj@qq.com', 0, 1, 33, 1617457962, 1607337687, 1617457962);
INSERT INTO `admin` VALUES (3, 'tony', '96e79218965eb72c92a549dd5a330112', 'qqq12323@dd.com', 1, 1, 3, 1613799893, 1607344357, 1613799893);
INSERT INTO `admin` VALUES (6, 'king', '96e79218965eb72c92a549dd5a330112', 'king@qq.com', 1, 1, 1, 1607596312, 1607504075, 1613815642);
INSERT INTO `admin` VALUES (8, 'lucy', '96e79218965eb72c92a549dd5a330112', 'lucy@163.com', 1, 1, 31, 1617462595, 1607605077, 1617462595);
INSERT INTO `admin` VALUES (10, 'kiti', '96e79218965eb72c92a549dd5a330112', 'kiti@126.com', 1, 1, 0, 0, 1607605975, 1614153293);
INSERT INTO `admin` VALUES (11, 'jun', '96e79218965eb72c92a549dd5a330112', '2798848393@qq.com', 0, 1, 5, 1616425515, 1607606019, 1616425515);
INSERT INTO `admin` VALUES (17, 'admin', '96e79218965eb72c92a549dd5a330112', 'mml1015@163.com', 1, 0, 2, 1617244973, 1617237526, 1617458230);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(60) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(2) NOT NULL,
  `create_time` int(11) NULL DEFAULT 0,
  `update_time` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, '20210328\\50613984ab6db0da149d75f81ff3d6c1.jpg', 'http://www.baidu.com', 0, 1613810998, 1616932221);
INSERT INTO `banner` VALUES (2, '20210401\\864dbf325e45ce8138c307710b10ab56.jpg', 'http://chayun.com/detail/index/id/3.html', 1, 1613812380, 1617245107);
INSERT INTO `banner` VALUES (8, '20210220\\a2cc4439acaef6a2ac887beb50b07fa5.jpg', 'http://chayun.com/detail/index/id/3.html', 0, 1613813599, 1615800549);
INSERT INTO `banner` VALUES (10, '20210309\\195d0c853bfec8efd632ccdffc6fea97.jpg', 'baidu.com', 0, 1615275800, 1615275800);
INSERT INTO `banner` VALUES (11, '20210314\\3285bdba7c01ef91ae244da5736c8387.jpg', 'baidu.com', 0, 1615687861, 1615800562);
INSERT INTO `banner` VALUES (15, '20210315\\4ac1fbe0ae9a704ce5340fbd49e49d5a.jpg', 'http://chayun.com/detail/index/id/3.html', 1, 1615800651, 1615800651);
INSERT INTO `banner` VALUES (16, '20210315\\f0a92710c84e53ab59bf6d6000a13644.jpg', 'http://chayun.com/detail/index/id/13.html', 0, 1615800794, 1616932200);
INSERT INTO `banner` VALUES (17, '20210322\\948fb683a7e10ebfc459dcac417632a9.jpg', 'http://chayun.com/detail/index/id/3.html', 1, 1615800854, 1616423830);
INSERT INTO `banner` VALUES (18, '20210322\\f3be1c0e74e63d7733c845e27e53bdf3.jpg', 'http://chayun.com/detail/index/id/3.html', 1, 1615801025, 1616424082);
INSERT INTO `banner` VALUES (19, '20210315\\efc00fe3512bf465540fc7e4a1549d4c.jpg', 'http://chayun.com/detail/index/id/3.html', 0, 1615801049, 1615801105);
INSERT INTO `banner` VALUES (20, '20210315\\96689d60dc05146d841693efc4af2382.jpg', 'http://chayun.com/detail/index/id/3.html', 1, 1615801128, 1615801128);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `uid` int(8) NOT NULL COMMENT '用户id',
  `shopid` int(8) NOT NULL COMMENT '商品',
  `num` int(8) NOT NULL COMMENT '数量',
  `create_time` int(11) NULL DEFAULT 0,
  `update_time` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (83, 9, 3, 1, 1615430303, 1615430303);
INSERT INTO `cart` VALUES (95, 11, 1, 75, 1615781912, 1615781912);
INSERT INTO `cart` VALUES (105, 1, 3, 71, 1616463636, 1616463636);
INSERT INTO `cart` VALUES (113, 2, 15, 2, 1617236005, 1617236005);
INSERT INTO `cart` VALUES (117, 12, 4, 1, 1617376076, 1617376076);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(3) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  `pid` int(3) NOT NULL DEFAULT 0 COMMENT '父级id',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态1启用0禁用',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '特级红茶', 0, 1, 1607673413);
INSERT INTO `category` VALUES (2, '苏红', 1, 1, 1607673609);
INSERT INTO `category` VALUES (3, '乌龙茶', 0, 1, 1607673643);
INSERT INTO `category` VALUES (4, '大红袍', 3, 1, 1607679631);
INSERT INTO `category` VALUES (6, '越红茶', 1, 1, 1607679711);
INSERT INTO `category` VALUES (7, '英德红茶', 1, 1, 1607679731);
INSERT INTO `category` VALUES (8, '安溪铁观音', 3, 1, 1607679863);
INSERT INTO `category` VALUES (9, '凤凰单丛', 3, 1, 1607680507);
INSERT INTO `category` VALUES (12, '清香绿茶', 0, 1, 1607688117);
INSERT INTO `category` VALUES (13, '西湖龙井', 12, 1, 1607688155);
INSERT INTO `category` VALUES (15, '都匀毛尖', 12, 1, 1607688207);
INSERT INTO `category` VALUES (17, '黄山毛峰', 12, 1, 1608042903);
INSERT INTO `category` VALUES (18, '阿里山红茶', 1, 1, 1614753692);
INSERT INTO `category` VALUES (19, '花茶', 0, 1, 1615689619);
INSERT INTO `category` VALUES (20, '茉莉花茶', 19, 1, 1615689652);
INSERT INTO `category` VALUES (21, '白兰花茶', 19, 1, 1615689677);
INSERT INTO `category` VALUES (22, '碧螺春', 12, 1, 1616326888);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `shopid` int(11) NOT NULL COMMENT '商品id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `orderid` int(11) NOT NULL COMMENT '订单id',
  `score` int(2) NOT NULL COMMENT '评分',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `comment_time` int(11) NOT NULL COMMENT '评论时间',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述',
  `reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家回复',
  `reply_time` int(11) NULL DEFAULT NULL COMMENT '回复时间',
  `isreply` int(2) NULL DEFAULT 0 COMMENT '是否回复',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreign_key_for_orders`(`orderid`) USING BTREE,
  CONSTRAINT `foreign_key_for_orders` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 5, 11, 28, 5, 'aaa', 1615737772, '20210315\\798b0e3ee0586e1c6f3f24fbd71e380d.jpg', '欢迎下次光临', 1615820810, 1);
INSERT INTO `comment` VALUES (2, 3, 11, 27, 4, 'ccc', 1615738169, '20210315\\c644b540f75a5c188d6b8bd8c781cc47.jpg', '谢谢您的肯定！', 1615820813, 1);
INSERT INTO `comment` VALUES (8, 3, 8, 50, 3, '茶叶非常的不错，下午收到的，不得不说快递真的很快。今天下午休息的时候就泡了一杯尝尝，味道不错，茶叶很香，而且能看到很多的嫩芽，泡的时候特地用的玻璃杯泡。喝起来口感相当的好，茶叶很香，喝的出来是今年的新茶，而且我买了2份店家送了好多的礼品，相当的好啊。', 1615824663, '20210316\\3749cbaadea85ae715e97bb47e4dddb3.jpg', NULL, NULL, 0);
INSERT INTO `comment` VALUES (9, 9, 8, 44, 2, '包装精美冲泡简单口感，就一般般吧', 1615824721, '20210316\\9ab4d6a5f1c8905aac7a3e96e5f31df6.jpg', '我们一定会做得更好的', 1615856968, 1);
INSERT INTO `comment` VALUES (10, 3, 8, 51, 2, '包装精美冲泡简单口感，就一般', 1615824819, '20210316\\2a1392d615460338cd6e8803006a69ef.jpg', NULL, NULL, 0);
INSERT INTO `comment` VALUES (11, 3, 8, 52, 3, '物流很快，罐子很精美，里面的宣传单拿在手上，也很好看。茶叶分量给的很足。很实惠的一款茶，喜欢喝碧螺春，搜索了下，竟然还有这么实惠的，茶叶买到就是赚到了，喜欢这种罐装，大气，抛开卖家的成本，这款茶真的是物超所值呢', 1615824842, '20210316\\9c9133c9c6cf97ce29f2018980bd4b41.jpg', NULL, NULL, 0);
INSERT INTO `comment` VALUES (12, 3, 7, 11, 5, '罐子打开马上泡了一杯喝，喝完再来评价的，口感非常不错，是我想要的茶叶，性价比很高，这个茶叶比较嫩，很绿，泡开的茶叶都是很新鲜的样子，喝到嘴里就有那种茶香。各方面都很不错！五分好评 ， 泡一杯喝着挺好的，家人朋友们尝了尝都说不错，给店主点赞，买对了才是最好的', 1615826659, '20210316\\27e5ae7b056f567b3eb8d62e0cfd22e2.jpg', '   ', 1616463494, 1);
INSERT INTO `comment` VALUES (13, 3, 5, 54, 4, '好喝，孩子特别喜欢，下次还会再来~~', 1615856816, '20210316\\0f2fd1faeff44bd0c994eb908510140c.jpg', NULL, NULL, 0);
INSERT INTO `comment` VALUES (14, 3, 5, 55, 5, '第二次购买了，爸爸很喜欢', 1615859470, '20210316\\c85c7c94db425aee98c6725cbf7c7e02.jpg', NULL, NULL, 0);
INSERT INTO `comment` VALUES (15, 3, 12, 56, 5, '真不错！下次还会回购的', 1615876144, '20210316\\d1b3a3f4041e5be84de09bc40830e440.jpg', NULL, NULL, 0);
INSERT INTO `comment` VALUES (16, 4, 12, 57, 3, '还可以，清香，但是价格有点小贵', 1615882352, '20210316\\846ddeb18f1de96b1bb6a2e8cd38064f.jpg', NULL, NULL, 0);
INSERT INTO `comment` VALUES (17, 3, 7, 16, 5, '可以可以，口感还是一如即往的好！！！', 1616241897, '20210320\\51693f1e797742ef7259bfc87a0aab41.png', NULL, NULL, 0);
INSERT INTO `comment` VALUES (18, 4, 1, 24, 4, '真的很不错哦，下次再来，希望老板多点优惠！', 1616398545, '20210322\\8016485a405277c8283a6bceb9b07070.jpg', NULL, NULL, 0);
INSERT INTO `comment` VALUES (20, 3, 2, 39, 5, '可以可以，终于买到口感不错的铁观音了', 1616980422, '20210329\\b792b182d818a296ab2244f2b5a5d6ca.png', NULL, NULL, 0);
INSERT INTO `comment` VALUES (21, 3, 12, 77, 3, 'sddsada', 1617245346, '20210401\\5a4887e9d5cda1b6a675d749ac287cc6.jpg', 'qwwq', 1617245401, 1);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cate_id` int(3) NOT NULL COMMENT '分类id',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `cost` float(8, 2) NOT NULL COMMENT '成本价',
  `original` float(8, 2) NOT NULL COMMENT '原价',
  `price` float(8, 2) NOT NULL COMMENT '现售价',
  `weight` int(6) NOT NULL COMMENT '重量',
  `unit` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
  `store` int(8) NOT NULL COMMENT '库存',
  `sales` int(8) NOT NULL DEFAULT 0 COMMENT '销量',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0为下架1为上架',
  `hot` int(1) NOT NULL DEFAULT 0 COMMENT '是否热销',
  `softdel` int(1) NOT NULL DEFAULT 0 COMMENT '软删除标志',
  `introduction` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `picture` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品描述',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 13, '名茶之首 绿茶 远致龙井3号 150g 清爽甘醇', 80.00, 148.00, 9.00, 150, 'g', 65, 35, 1, 1, 0, '雨前采摘 传统栗香 汤色微黄透亮 口感清爽甘醇 叶底均匀成朵', '20201215\\9046c1d7d9475affa26916791c5733bc.jpg', '<p>&nbsp; &nbsp; &nbsp; &nbsp;西湖龙井是中国十大名茶之一，属绿茶，其产于浙江省杭州市西湖龙井村周围群山，并因此得名，具有1200多年历史&nbsp;。清乾隆游览杭州西湖时，盛赞西湖龙井茶，把狮峰山下胡公庙前的十八棵茶树封为“御茶”。西湖龙井按外形和内质的优次分作1～8级。特级西湖龙井茶扁平光滑挺直，色泽嫩绿光润，香气鲜嫩清高，滋味鲜爽甘醇，叶底细嫩呈朵。清明节前采制的龙井茶简称明前龙井，美称女儿红，“院外风荷西子笑，明前龙井女儿红。”</p>', 1608039374, 1617245582);
INSERT INTO `goods` VALUES (2, 4, '纯正岩香 正宗大红袍 1号256g', 55.00, 122.00, 99.00, 256, 'g', 86, 10, 1, 1, 0, '口粮茶，中火焙制，传统岩茶风味，半斤足量，8泡有余香，丹岩产区，使其获得价格优势，茶师精制，口感达到半岩水准。', '20201215\\e9b14bf15ffc1b660adf9361e315a739.jpg', '<p>&nbsp; &nbsp; &nbsp; &nbsp;大红袍，产于福建武夷山，属乌龙茶，品质优异。中国特种名茶。其外形条索紧结，色泽绿褐鲜润，冲泡后汤色橙黄明亮，叶片红绿相间。品质最突出之处是香气馥郁有兰花香，香高而持久，“岩韵”明显。除与一般茶叶具有提神益思，消除疲劳、生津利尿、解热防暑、杀菌消炎、解毒防病、消食去腻、减肥健美等保健功能外，还具有防癌症、降血脂、抗衰老、等特殊功效。大红袍很耐冲泡，冲泡七、八次仍有香味。品饮“大红袍”茶，必须按“工夫茶”小壶小杯细品慢饮的程式，才能真正品尝到岩茶之颠的禅茶韵味。注重活 、甘、清、香</p>', 1608041931, 1616464623);
INSERT INTO `goods` VALUES (3, 8, '浓香铁观音 1号500g 消青工艺', 88.00, 169.00, 130.00, 500, 'g', 69, 39, 1, 1, 0, '大分量 工作茶首选', '20201215\\9b6d50888cd5ce0fb5813563d607e9fa.jpg', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">铁观音（tiě guān yīn）茶，中国传统名茶，属于</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9D%92%E8%8C%B6\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">青茶</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">类，是中国</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%81%E5%A4%A7%E5%90%8D%E8%8C%B6\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">十大名茶</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">之一。原产于福建</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B3%89%E5%B7%9E%E5%B8%82/607673\" data-lemmaid=\"607673\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">泉州市</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AE%89%E6%BA%AA%E5%8E%BF\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">安溪县</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%A5%BF%E5%9D%AA%E9%95%87/3435488\" data-lemmaid=\"3435488\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">西坪镇</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">，发现于1723—1735年。“铁观音”既是茶名，也是茶树品种名，铁观音茶介于</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BB%BF%E8%8C%B6/13497\" data-lemmaid=\"13497\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">绿茶</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">和</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BA%A2%E8%8C%B6/185424\" data-lemmaid=\"185424\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">红茶</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">之间，属于半</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%91%E9%85%B5\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">发酵</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">茶类，铁观音独具“</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%A7%82%E9%9F%B3%E9%9F%B5/1156769\" data-lemmaid=\"1156769\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">观音韵</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">”，清香雅韵，冲泡后有天然的兰花香，滋味纯浓,香气馥郁持久，有“七泡有余香”之誉 。除具有一般茶叶的保健功能外，还具有抗衰老、抗动脉硬化、防治</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%B3%96%E5%B0%BF%E7%97%85/100969\" data-lemmaid=\"100969\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">糖尿病</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">、减肥健美、防治龋齿、清热降火，敌烟</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%86%92%E9%85%92/6386628\" data-lemmaid=\"6386628\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">醒酒</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">等功效。</span></p>', 1608042805, 1616464626);
INSERT INTO `goods` VALUES (4, 17, '高性价比历史名茶 黄山毛峰 1号 180克', 66.00, 88.00, 75.00, 120, 'g', 57, 23, 1, 1, 0, '口感鲜爽，有板栗香,性价比超高', '20201215\\7c4783a51e8ea57ee7c92563c29f34a9.jpg', '<p>毛尖，属于<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BB%BF%E8%8C%B6/13497\" data-lemmaid=\"13497\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">绿茶</a>或黄茶的一个子<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%A7%E5%93%81/105875\" data-lemmaid=\"105875\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">产品</a>，一芽一叶、一芽两叶茶青炒制后命名为毛尖。较著名的有<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%A4%E4%B8%88%E6%AF%9B%E5%B0%96/1205937\" data-lemmaid=\"1205937\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">古丈毛尖</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%99%BD%E9%A9%AC%E6%AF%9B%E5%B0%96/1207231\" data-lemmaid=\"1207231\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">白马毛尖</a>、沩山毛尖、都匀毛尖、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BF%A1%E9%98%B3%E6%AF%9B%E5%B0%96/548774\" data-lemmaid=\"548774\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">信阳毛尖</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A7%E5%BA%B8%E6%AF%9B%E5%B0%96/7586949\" data-lemmaid=\"7586949\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">大庸毛尖</a>、 合箩毛尖、秀山毛尖、赣州上犹毛尖。外形比较细直、圆润光滑，茶叶全身遍布着白毫，茶汤的味道十分的鲜浓甘爽独特。</p><p>毛尖，冲泡出来的茶汤颜色碧绿，茶叶舒张开来，慢慢沉入杯底，茶叶片片匀整，柔嫩鲜绿光滑。毛尖的色、香、味、形均有独特个性，其颜色鲜润、干净，不含杂质，香气高雅、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B8%85%E6%96%B0/33348\" data-lemmaid=\"33348\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">清新</a>，味道鲜爽、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%86%87%E9%A6%99/6810777\" data-lemmaid=\"6810777\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">醇香</a>、回甘。</p><p><br/></p>', 1608043002, 1616598146);
INSERT INTO `goods` VALUES (5, 8, '铁观音 清香型特级500g', 355.00, 600.00, 188.00, 500, 'g', 185, 37, 1, 1, 0, '性价比高', '20201216\\acd7f7ddf1ba7aac5f3cad830b0827ba.jpg', '<p>产品参数：储藏方法：防潮、避光、防异味、冷藏保质期：365 天食品添加剂：无净含量:&nbsp;500g外包装类型:&nbsp;散茶茶种类:&nbsp;铁观音生长季节:&nbsp;秋季级别:&nbsp;特级产地:&nbsp;中国大陆省份:&nbsp;福建省乌龙茶干茶形状:&nbsp;蜻蜓头品牌:&nbsp;鼓浪听涛系列:&nbsp;280口味:&nbsp;清香型口感:&nbsp;醇厚甘爽价格段:&nbsp;200-299元是否进口:&nbsp;国产</p>', 1608132677, 1616598149);
INSERT INTO `goods` VALUES (6, 9, '春茶明前凤凰单从炒青散装250g', 135.00, 180.00, 160.00, 150, 'g', 71, 19, 1, 1, 0, '最受欢迎凤凰单从，春天喝好茶  早春采摘', '20201216\\ed88bf495396691586e6019a6b9809c5.jpg', '&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 14px; white-space: normal; word-spacing: normal; background-color: rgb(255, 255, 255); line-height: 1.5; word-break: break-all; overflow-wrap: break-word; color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif;&quot;&gt;&lt;span style=&quot;font-weight: bold; padding: 0px; margin: 0px;&quot;&gt;产品参数：&lt;/span&gt;&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p&gt;储藏方法：干燥 冷藏&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;保质期：540 天&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;食品添加剂：无添加剂&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;净含量:&amp;nbsp;250g&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;系列:&amp;nbsp;碧螺春250g&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;外包装类型:&amp;nbsp;包装&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;包装种类:&amp;nbsp;罐装&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;食品工艺:&amp;nbsp;炒青绿茶&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;采摘时间:&amp;nbsp;明前&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;级别:&amp;nbsp;一级&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;产地:&amp;nbsp;中国大陆&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;生长季节:&amp;nbsp;春季&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;茶种类:&amp;nbsp;碧螺春&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;形状:&amp;nbsp;条形&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;是否进口:&amp;nbsp;国产&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1608132847, 1616598154);
INSERT INTO `goods` VALUES (8, 13, '112222g', 12121.00, 1212.00, 121.00, 1212, 'g', 900, 312, 1, 1, 1, '12121212121', '20210302\\3a2fba91d02a325cc92ca13f8caa4a69.png', '<p>adsadasdassd</p>', 1614672806, 1617461107);
INSERT INTO `goods` VALUES (9, 18, 'xxxxx阿里山红茶xxxxx150g 清香型', 120.00, 150.00, 116.00, 150, 'g', 74, 26, 1, 1, 0, '。。。', '20210310\\a4d1098f27709ba774950b5d90b6d1d9.jpg', '&lt;p&gt;快速了解分厘卡撒酒疯道路喀什角动量反馈啊螺丝扣搭街坊拉萨扩大发链接ask砥砺奋进拉萨看得见flak事件的发生率雕刻技法爱丽丝砥砺奋进阿喀琉斯的就发上来大家垃圾的离开房间啊流口水的技法卢卡斯大家爱丽丝打开房间啊深刻搭街坊&lt;img src=&quot;http://img.baidu.com/hi/jx2/j_0003.gif&quot;/&gt;&lt;/p&gt;', 1615345481, 1615345481);
INSERT INTO `goods` VALUES (10, 21, '兴科玉兰花茶100g 采用白兰鲜花与绿茶窨薰制作 健康花草茶', 56.00, 88.00, 77.00, 100, 'g', 66, 14, 1, 1, 0, '。。。', '20210314\\3285bdba7c01ef91ae244da5736c8387.jpg', '<h3 style=\"margin: 0px; padding: 0px; font-weight: 400; font-size: 12px; float: left; width: 110px; text-align: right;\">主体</h3><ul style=\"margin: 0px 0px 0px 110px; padding: 0px;\" class=\" list-paddingleft-2\"><ul class=\"clearfix list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>净含量</p></li><li><p>100</p></li><li><p>产品标准号</p></li><li><p>Q/HNXK 0002S</p></li><li><p>保质期</p></li><li><p>540天</p></li><li><p>生产许可证号</p></li><li><p>SC10646900600049</p></li></ul><ul class=\"clearfix list-paddingleft-2\" style=\"list-style-type: square;\"></ul></ul><h3 style=\"margin: 0px; padding: 0px; font-weight: 400; font-size: 12px; float: left; width: 130px; text-align: right;\">包装清单</h3><p style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 155px; padding: 0px 50px 0px 0px;\">暂无</p><p><br/></p>', 1615689948, 1615689948);
INSERT INTO `goods` VALUES (11, 20, '意源茉莉花茶特级浓香 花草茶茶叶 甄选花茶茶叶 茉莉花茶-茉莉玉螺 250g', 233.00, 250.00, 240.00, 250, 'g', 87, 12, 1, 1, 0, '', '20210314\\d1e00dae02c77dbe7ab0ee90f16504bf.jpg', '&lt;h3 style=&quot;margin: 0px; padding: 0px; font-weight: 400; font-size: 12px; float: left; width: 110px; text-align: right;&quot;&gt;主体&lt;/h3&gt;&lt;ul style=&quot;margin: 0px 0px 0px 110px; padding: 0px;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;ul class=&quot;clearfix list-paddingleft-2&quot; style=&quot;list-style-type: square;&quot;&gt;&lt;li&gt;&lt;p&gt;建议茶具&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;盖碗及紫砂壶最佳&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;加工工艺&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;杀青、揉捻、凉晒&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;产品标准号&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;GB/T22292&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;ul class=&quot;clearfix list-paddingleft-2&quot; style=&quot;list-style-type: square;&quot;&gt;&lt;li&gt;&lt;p&gt;存储方式&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;干燥、避光&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;口感&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;五泡以后甘甜味显&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;ul class=&quot;clearfix list-paddingleft-2&quot; style=&quot;list-style-type: square;&quot;&gt;&lt;li&gt;&lt;p&gt;香味&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;陈香及花香&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;净含量&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;250g&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;ul class=&quot;clearfix list-paddingleft-2&quot; style=&quot;list-style-type: square;&quot;&gt;&lt;li&gt;&lt;p&gt;保质期&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;18个月&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;生产许可证号&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;SC11445012702146&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;ul class=&quot;clearfix list-paddingleft-2&quot; style=&quot;list-style-type: square;&quot;&gt;&lt;li&gt;&lt;p&gt;冲泡方法&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;水温100&bull;C&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;ul class=&quot;clearfix list-paddingleft-2&quot; style=&quot;list-style-type: square;&quot;&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;h3 style=&quot;margin: 0px; padding: 0px; font-weight: 400; font-size: 12px; float: left; width: 130px; text-align: right;&quot;&gt;包装清单&lt;/h3&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; margin-left: 155px; padding: 0px 50px 0px 0px;&quot;&gt;暂无&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1615690165, 1615690165);
INSERT INTO `goods` VALUES (12, 13, '名茶之首 靠谱龙井1号 250g 高性价比', 50.00, 68.00, 60.00, 250, 'g', 116, 4, 1, 1, 0, '', '20210321\\5fe07c14f1e7d1c4dd7d14cef8278360.jpg', '&lt;table width=&quot;664&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;品级:&lt;/td&gt;&lt;td title=&quot;登堂入室&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;登堂入室&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;用途:&lt;/td&gt;&lt;td title=&quot;自饮&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;自饮&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;品牌:&lt;/td&gt;&lt;td title=&quot;远致&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;远致&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;香型:&lt;/td&gt;&lt;td title=&quot;熟栗香&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;熟栗香&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;产地:&lt;/td&gt;&lt;td title=&quot;浙江&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;浙江&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;包装:&lt;/td&gt;&lt;td title=&quot;方铁罐&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;方铁罐&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;保质期:&lt;/td&gt;&lt;td title=&quot;18个月&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;18个月&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;储藏方式:&lt;/td&gt;&lt;td title=&quot;防潮湿、防异味、避光、冷藏为宜&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;防潮湿、防异味、避光、冷藏为宜&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;泡饮方法:&lt;/td&gt;&lt;td title=&quot;用85度开水冲泡2分钟左右即可品饮&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;用85度开水冲泡2分钟左右即可品饮&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1616326826, 1616326826);
INSERT INTO `goods` VALUES (13, 22, '十大名茶 靠谱碧螺春1号 250g 高性价比', 30.00, 45.00, 40.00, 250, 'g', 115, 7, 1, 1, 0, '', '20210321\\9d7df32a6caf0d0fbf00740bbd3ae78e.jpg', '&lt;table width=&quot;664&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;品级:&lt;/td&gt;&lt;td title=&quot;登堂入室&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;登堂入室&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;用途:&lt;/td&gt;&lt;td title=&quot;自饮&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;自饮&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;品牌:&lt;/td&gt;&lt;td title=&quot;远致&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;远致&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;年份:&lt;/td&gt;&lt;td title=&quot;2018春&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;2018春&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;香型:&lt;/td&gt;&lt;td title=&quot;花果香&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;花果香&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;产地:&lt;/td&gt;&lt;td title=&quot;浙江&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;浙江&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;包装:&lt;/td&gt;&lt;td title=&quot;方铁罐&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;方铁罐&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;保质期:&lt;/td&gt;&lt;td title=&quot;18个月&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;18个月&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;储藏方式:&lt;/td&gt;&lt;td title=&quot;防潮湿、防异味、避光、冷藏为宜&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;防潮湿、防异味、避光、冷藏为宜&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;l&quot; style=&quot;margin: 0px; padding-top: 6px; padding-right: 5px; padding-bottom: 6px; font-size: 14px; text-align: right; background-color: rgb(244, 244, 244);&quot; width=&quot;96&quot;&gt;泡饮方法:&lt;/td&gt;&lt;td title=&quot;用85度开水冲泡2分钟左右即可品饮&quot; style=&quot;margin: 0px; padding-top: 6px; padding-bottom: 6px; font-size: 14px;&quot;&gt;用85度开水冲泡2分钟左右即可品饮&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1616326945, 1616326945);
INSERT INTO `goods` VALUES (14, 2, '红茶皇后 经典祁门红茶 祁门香螺 250g', 88.00, 99.00, 90.00, 250, 'g', 219, 4, 1, 1, 0, '', '20210321\\118df63f89659ae39b66dd37277aeeb3.jpg', '&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20210321/1616327930168936.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20210321/1616327951822147.jpg&quot;/&gt;&lt;/p&gt;', 1616327956, 1616465647);
INSERT INTO `goods` VALUES (15, 6, '简盒装 武夷山原产地 全芽灰芽花香金骏眉 3號150g', 121.00, 155.00, 130.00, 150, 'g', 215, 7, 1, 1, 0, '', '20210321\\5ca748fd6b9656ec10317c0fac68ae3a.jpg', '&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20210321/1616328073975050.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20210321/1616328087550450.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1616328090, 1616465649);
INSERT INTO `goods` VALUES (16, 18, '礼盒装-滇红-臻品竹纹木盒金螺300g(含提袋）', 112.00, 139.00, 125.00, 300, 'g', 434, 10, 1, 1, 0, '', '20210321\\fe81915573278f0e440db3a8f03305ed.jpg', '&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20210321/1616328176714307.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/ueditor/php/upload/image/20210321/1616328189290042.jpg&quot;/&gt;&lt;/p&gt;', 1616328192, 1616465655);
INSERT INTO `goods` VALUES (20, 20, 'ggggggggggggggggggggggggggggggggg', 121.00, 322.00, 232.00, 122, 'g', 12, 0, 1, 1, 0, '1111111111111111111111111111111111', '20210401\\f60b34f270aea30b3ef65fb9fa1d42b7.jpg', '<p>111111111111111</p>', 1617237600, 1617237600);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shopid` int(11) NOT NULL COMMENT '商品id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `addressid` int(11) NOT NULL COMMENT '地址id',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `total` float(12, 2) NOT NULL COMMENT '总价',
  `ordernumber` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '订单状态，0未发货，1已发货，2待评价，3交易完成',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '交易时间',
  `softdelete` int(1) NULL DEFAULT 0 COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreign_to_user`(`uid`) USING BTREE,
  INDEX `foreign_to_goods`(`shopid`) USING BTREE,
  INDEX `foreign_to_address`(`addressid`) USING BTREE,
  CONSTRAINT `foreign_to_address` FOREIGN KEY (`addressid`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreign_to_goods` FOREIGN KEY (`shopid`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foreign_to_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (9, 8, 1, 3, 98, 11858.00, '2021031015064067536', 1, 1615360000, 0);
INSERT INTO `orders` VALUES (10, 1, 7, 15, 1, 118.00, '2021031020354108260', 2, 1615379741, 0);
INSERT INTO `orders` VALUES (11, 3, 7, 16, 1, 130.00, '2021031020430989948', 3, 1615380189, 1);
INSERT INTO `orders` VALUES (12, 1, 7, 16, 1, 118.00, '2021031020430953002', 1, 1615380189, 0);
INSERT INTO `orders` VALUES (13, 9, 7, 15, 1, 116.00, '2021031020442853929', 1, 1615380268, 0);
INSERT INTO `orders` VALUES (14, 9, 7, 15, 1, 116.00, '2021031020470366736', 1, 1615380423, 0);
INSERT INTO `orders` VALUES (15, 1, 7, 15, 1, 118.00, '2021031023141874987', 1, 1615389258, 0);
INSERT INTO `orders` VALUES (16, 3, 7, 15, 1, 130.00, '2021031023141850345', 3, 1615389258, 0);
INSERT INTO `orders` VALUES (17, 3, 7, 15, 1, 130.00, '2021031100111159636', 1, 1615392671, 0);
INSERT INTO `orders` VALUES (18, 4, 7, 15, 1, 79.00, '2021031100134787282', 1, 1615392827, 0);
INSERT INTO `orders` VALUES (19, 5, 7, 15, 1, 550.00, '2021031100134702419', 1, 1615392827, 0);
INSERT INTO `orders` VALUES (20, 1, 7, 15, 1, 118.00, '2021031100134789405', 1, 1615392827, 0);
INSERT INTO `orders` VALUES (21, 3, 7, 15, 1, 130.00, '2021031100285381115', 1, 1615393733, 0);
INSERT INTO `orders` VALUES (22, 3, 7, 15, 1, 130.00, '2021031100285416812', 1, 1615393734, 0);
INSERT INTO `orders` VALUES (23, 3, 9, 19, 1, 130.00, '2021031110390987004', 1, 1615430349, 0);
INSERT INTO `orders` VALUES (24, 4, 1, 3, 1, 79.00, '2021031111012301990', 3, 1615431683, 1);
INSERT INTO `orders` VALUES (25, 3, 1, 3, 1, 130.00, '2021031111012390601', 3, 1615431683, 0);
INSERT INTO `orders` VALUES (26, 1, 1, 3, 2, 236.00, '2021031111012327901', 2, 1615431683, 0);
INSERT INTO `orders` VALUES (27, 3, 11, 20, 1, 130.00, '2021031114385739492', 3, 1615444737, 0);
INSERT INTO `orders` VALUES (28, 5, 11, 20, 1, 550.00, '2021031116040464770', 3, 1615449844, 0);
INSERT INTO `orders` VALUES (29, 5, 8, 13, 1, 200.00, '2021031123280221154', 3, 1615476482, 0);
INSERT INTO `orders` VALUES (30, 5, 11, 20, 1, 200.00, '2021031209310322250', 3, 1615512663, 0);
INSERT INTO `orders` VALUES (31, 3, 1, 3, 1, 130.00, '2021031313164204313', 1, 1615612602, 0);
INSERT INTO `orders` VALUES (32, 5, 1, 3, 1, 188.00, '2021031313164327291', 1, 1615612603, 0);
INSERT INTO `orders` VALUES (33, 1, 1, 3, 1, 9.90, '2021031313164367520', 1, 1615612603, 0);
INSERT INTO `orders` VALUES (34, 4, 11, 20, 1, 75.00, '2021031313571743926', 3, 1615615037, 0);
INSERT INTO `orders` VALUES (35, 1, 11, 20, 1, 9.90, '2021031313571706646', 3, 1614528022, 0);
INSERT INTO `orders` VALUES (36, 5, 11, 20, 1, 188.00, '2021031313571747188', 1, 1615615037, 0);
INSERT INTO `orders` VALUES (37, 6, 11, 20, 1, 160.00, '2021031313571762906', 2, 1615615037, 0);
INSERT INTO `orders` VALUES (38, 9, 11, 20, 8, 928.00, '2021031314053551425', 1, 1615615535, 0);
INSERT INTO `orders` VALUES (39, 3, 2, 13, 1, 130.00, '2021031315432891807', 3, 1614441623, 0);
INSERT INTO `orders` VALUES (40, 2, 2, 13, 1, 99.00, '2021031315433969480', 2, 1615621419, 0);
INSERT INTO `orders` VALUES (41, 4, 7, 15, 1, 75.00, '2021031315442405808', 1, 1614355200, 0);
INSERT INTO `orders` VALUES (42, 4, 11, 20, 4, 300.00, '2021031319521768104', 1, 1615636337, 0);
INSERT INTO `orders` VALUES (43, 5, 11, 20, 3, 564.00, '2021031319521787146', 0, 1615636337, 0);
INSERT INTO `orders` VALUES (44, 9, 8, 17, 2, 232.00, '2021031409251088543', 3, 1615685110, 0);
INSERT INTO `orders` VALUES (45, 5, 11, 21, 10, 1880.00, '2021031410292100967', 0, 1615688961, 0);
INSERT INTO `orders` VALUES (46, 10, 11, 20, 10, 770.00, '2021031410473774758', 0, 1615690057, 0);
INSERT INTO `orders` VALUES (47, 11, 11, 20, 12, 2880.00, '2021031410494267319', 0, 1615690182, 0);
INSERT INTO `orders` VALUES (48, 4, 11, 22, 1, 75.00, '2021031511050871457', 0, 1615777508, 0);
INSERT INTO `orders` VALUES (50, 3, 8, 17, 3, 390.00, '2021031600080345868', 3, 1615824483, 0);
INSERT INTO `orders` VALUES (51, 3, 8, 17, 1, 130.00, '2021031600121712334', 3, 1615824737, 0);
INSERT INTO `orders` VALUES (52, 3, 8, 17, 1, 130.00, '2021031600121883687', 3, 1615824738, 0);
INSERT INTO `orders` VALUES (53, 3, 7, 15, 1, 130.00, '2021031600420586445', 1, 1615826525, 0);
INSERT INTO `orders` VALUES (54, 3, 5, 23, 1, 130.00, '2021031609002686478', 3, 1615856426, 0);
INSERT INTO `orders` VALUES (55, 3, 5, 23, 1, 130.00, '2021031609021135242', 3, 1615856531, 0);
INSERT INTO `orders` VALUES (56, 3, 12, 24, 3, 390.00, '2021031614280853627', 3, 1615876088, 0);
INSERT INTO `orders` VALUES (57, 4, 12, 24, 1, 75.00, '2021031614402078232', 3, 1615876820, 0);
INSERT INTO `orders` VALUES (58, 5, 8, 17, 1, 188.00, '2021031616244092940', 0, 1615883080, 0);
INSERT INTO `orders` VALUES (59, 1, 7, 16, 2, 19.80, '2021032020031778991', 0, 1616241797, 0);
INSERT INTO `orders` VALUES (60, 5, 7, 16, 3, 564.00, '2021032020031760087', 0, 1616241797, 0);
INSERT INTO `orders` VALUES (61, 9, 8, 17, 1, 116.00, '2021032119064426748', 0, 1616324804, 0);
INSERT INTO `orders` VALUES (62, 1, 8, 17, 2, 19.80, '2021032119064455201', 0, 1616324804, 0);
INSERT INTO `orders` VALUES (63, 12, 8, 17, 4, 240.00, '2021032120142019756', 0, 1616328860, 0);
INSERT INTO `orders` VALUES (64, 16, 8, 17, 3, 375.00, '2021032120171519088', 0, 1616329035, 0);
INSERT INTO `orders` VALUES (65, 13, 8, 44, 3, 120.00, '2021032200091704153', 0, 1616342957, 0);
INSERT INTO `orders` VALUES (66, 10, 8, 44, 2, 154.00, '2021032200091730773', 0, 1616342957, 0);
INSERT INTO `orders` VALUES (67, 15, 1, 45, 1, 130.00, '2021032216011730244', 1, 1616400077, 0);
INSERT INTO `orders` VALUES (68, 13, 1, 45, 2, 80.00, '2021032220510157713', 0, 1616417461, 0);
INSERT INTO `orders` VALUES (69, 4, 13, 46, 1, 75.00, '2021032221003070091', 0, 1616418030, 0);
INSERT INTO `orders` VALUES (70, 14, 7, 15, 3, 270.00, '2021032323402445639', 0, 1616514024, 0);
INSERT INTO `orders` VALUES (71, 9, 8, 17, 3, 348.00, '2021032819472345931', 0, 1616932043, 0);
INSERT INTO `orders` VALUES (72, 3, 8, 44, 1, 130.00, '2021032819542426068', 0, 1616932464, 0);
INSERT INTO `orders` VALUES (73, 13, 8, 44, 2, 80.00, '2021032819542459229', 0, 1616932464, 0);
INSERT INTO `orders` VALUES (74, 9, 2, 13, 1, 116.00, '2021032909121948068', 0, 1616980339, 0);
INSERT INTO `orders` VALUES (75, 16, 2, 13, 2, 250.00, '2021032909122097262', 0, 1616980340, 0);
INSERT INTO `orders` VALUES (76, 10, 2, 13, 2, 154.00, '2021032909122077492', 0, 1616980340, 0);
INSERT INTO `orders` VALUES (77, 3, 12, 24, 1, 130.00, '2021040110394349153', 3, 1617244783, 0);
INSERT INTO `orders` VALUES (78, 3, 12, 24, 3, 390.00, '2021040110414066752', 0, 1617244900, 0);
INSERT INTO `orders` VALUES (79, 2, 12, 24, 1, 99.00, '2021040110414093007', 0, 1617244900, 0);
INSERT INTO `orders` VALUES (80, 5, 12, 24, 2, 376.00, '2021040110414012000', 0, 1617244900, 0);
INSERT INTO `orders` VALUES (81, 1, 12, 24, 6, 54.00, '2021040111120178651', 0, 1617246721, 0);
INSERT INTO `orders` VALUES (82, 15, 8, 17, 1, 130.00, '2021040322081774644', 0, 1617458897, 0);
INSERT INTO `orders` VALUES (83, 15, 8, 17, 1, 130.00, '2021040322084436286', 0, 1617458924, 0);
INSERT INTO `orders` VALUES (84, 15, 8, 17, 1, 130.00, '2021040322140927268', 0, 1617459249, 0);
INSERT INTO `orders` VALUES (85, 3, 8, 17, 1, 130.00, '2021040322160713037', 0, 1617459367, 0);
INSERT INTO `orders` VALUES (86, 6, 8, 17, 1, 160.00, '2021040322173540176', 0, 1617459455, 0);
INSERT INTO `orders` VALUES (87, 9, 8, 17, 1, 116.00, '2021040322190544463', 0, 1617459545, 0);
INSERT INTO `orders` VALUES (88, 4, 7, 15, 1, 75.00, '2021040322195333420', 0, 1617459593, 0);
INSERT INTO `orders` VALUES (89, 2, 7, 15, 1, 99.00, '2021040322234282612', 0, 1617459822, 0);
INSERT INTO `orders` VALUES (90, 9, 7, 15, 1, 116.00, '2021040322281040812', 0, 1617460090, 0);
INSERT INTO `orders` VALUES (91, 4, 7, 15, 1, 75.00, '2021040322292326119', 0, 1617460163, 0);
INSERT INTO `orders` VALUES (92, 16, 7, 15, 1, 125.00, '2021040322292393933', 0, 1617460163, 0);
INSERT INTO `orders` VALUES (93, 16, 7, 15, 1, 125.00, '2021040322301943611', 0, 1617460219, 0);
INSERT INTO `orders` VALUES (94, 16, 7, 15, 1, 125.00, '2021040322303304690', 0, 1617460233, 0);
INSERT INTO `orders` VALUES (95, 14, 7, 15, 1, 90.00, '2021040322320644140', 0, 1617460326, 0);
INSERT INTO `orders` VALUES (96, 16, 7, 15, 2, 250.00, '2021040322335329053', 0, 1617460433, 0);
INSERT INTO `orders` VALUES (97, 15, 7, 15, 3, 390.00, '2021040322335313103', 0, 1617460433, 0);
INSERT INTO `orders` VALUES (98, 2, 7, 15, 1, 99.00, '2021040322365273986', 0, 1617460612, 0);

-- ----------------------------
-- Table structure for smscode
-- ----------------------------
DROP TABLE IF EXISTS `smscode`;
CREATE TABLE `smscode`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `code` int(4) NOT NULL COMMENT '验证码',
  `sendtime` int(11) NOT NULL COMMENT '发送时间',
  `expiration` int(11) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smscode
-- ----------------------------
INSERT INTO `smscode` VALUES (1, '18402057856', 3387, 1609313015, 1609313315);
INSERT INTO `smscode` VALUES (2, '18402057856', 7587, 1609313335, 1609313635);
INSERT INTO `smscode` VALUES (3, '18402057856', 2303, 1609314004, 1609314304);
INSERT INTO `smscode` VALUES (4, '15919697073', 1226, 1609314293, 1609314593);
INSERT INTO `smscode` VALUES (5, '18402057856', 3550, 1609315754, 1609316054);
INSERT INTO `smscode` VALUES (6, '18402057856', 2609, 1609315823, 1609316123);
INSERT INTO `smscode` VALUES (7, '18402057856', 2102, 1609316075, 1609316375);
INSERT INTO `smscode` VALUES (8, '18402057856', 1465, 1609316325, 1609316625);
INSERT INTO `smscode` VALUES (9, '18402057856', 6282, 1609316434, 1609316734);
INSERT INTO `smscode` VALUES (10, '15919697073', 5069, 1609316886, 1609317186);
INSERT INTO `smscode` VALUES (11, '15919697073', 8080, 1609316977, 1609317277);
INSERT INTO `smscode` VALUES (12, '15919696781', 5996, 1609317074, 1609317374);
INSERT INTO `smscode` VALUES (13, '15919697073', 5153, 1609317314, 1609317614);
INSERT INTO `smscode` VALUES (14, '15919696781', 2999, 1609317382, 1609317682);
INSERT INTO `smscode` VALUES (15, '15919696781', 7257, 1609317484, 1609317784);
INSERT INTO `smscode` VALUES (16, '15919696781', 1217, 1609317692, 1609317992);
INSERT INTO `smscode` VALUES (17, '15919697073', 3268, 1609317788, 1609318088);
INSERT INTO `smscode` VALUES (18, '15919696781', 8748, 1609318165, 1609318465);
INSERT INTO `smscode` VALUES (19, '15919696781', 6758, 1609318845, 1609319145);
INSERT INTO `smscode` VALUES (20, '15919696781', 1439, 1609318897, 1609319197);
INSERT INTO `smscode` VALUES (21, '15919696781', 4212, 1609318962, 1609319262);
INSERT INTO `smscode` VALUES (22, '15919696781', 3537, 1609319315, 1609319615);
INSERT INTO `smscode` VALUES (23, '15919697073', 3490, 1609319369, 1609319669);
INSERT INTO `smscode` VALUES (24, '18402057856', 5235, 1609326447, 1609326747);
INSERT INTO `smscode` VALUES (25, '18402057856', 1444, 1609405280, 1609405580);
INSERT INTO `smscode` VALUES (26, '18402057856', 5843, 1609555255, 1609555555);
INSERT INTO `smscode` VALUES (27, '18402057856', 8282, 1609555524, 1609555824);
INSERT INTO `smscode` VALUES (28, '18402057856', 7443, 1609555738, 1609556038);
INSERT INTO `smscode` VALUES (29, '18402057856', 5511, 1609556381, 1609556681);
INSERT INTO `smscode` VALUES (30, '18402057856', 5264, 1609576721, 1609577021);
INSERT INTO `smscode` VALUES (31, '18402057856', 3406, 1609577328, 1609577628);
INSERT INTO `smscode` VALUES (32, '18402057856', 4450, 1609577471, 1609577771);
INSERT INTO `smscode` VALUES (33, '18402057856', 4176, 1609578237, 1609578537);
INSERT INTO `smscode` VALUES (34, '18402057856', 8072, 1609579421, 1609579721);
INSERT INTO `smscode` VALUES (35, '18402057856', 1066, 1609580762, 1609581062);
INSERT INTO `smscode` VALUES (36, '15919697073', 4535, 1609581817, 1609582117);
INSERT INTO `smscode` VALUES (37, '18402057856', 3100, 1609663007, 1609663307);
INSERT INTO `smscode` VALUES (38, '18402057856', 2498, 1609769899, 1609770199);
INSERT INTO `smscode` VALUES (39, '18402057856', 5746, 1609843849, 1609844149);
INSERT INTO `smscode` VALUES (40, '18402057856', 3894, 1609942120, 1609942420);
INSERT INTO `smscode` VALUES (41, '18402057856', 9574, 1610275788, 1610276088);
INSERT INTO `smscode` VALUES (42, '18402057856', 4527, 1611932681, 1611932981);
INSERT INTO `smscode` VALUES (43, '18402057856', 7034, 1612500475, 1612500775);
INSERT INTO `smscode` VALUES (44, '18402057856', 3738, 1612937708, 1612938008);
INSERT INTO `smscode` VALUES (45, '18402057856', 5219, 1613800359, 1613800659);
INSERT INTO `smscode` VALUES (46, '18402057856', 5394, 1613882327, 1613882627);
INSERT INTO `smscode` VALUES (47, '18402057856', 2171, 1613913220, 1613913520);
INSERT INTO `smscode` VALUES (48, '18402057856', 4323, 1614230763, 1614231063);
INSERT INTO `smscode` VALUES (49, '18402057856', 7758, 1614561602, 1614561902);
INSERT INTO `smscode` VALUES (50, '18402057856', 2882, 1614753790, 1614754090);
INSERT INTO `smscode` VALUES (51, '18402057856', 3774, 1615344677, 1615344977);
INSERT INTO `smscode` VALUES (52, '18402057856', 2099, 1615430189, 1615430489);
INSERT INTO `smscode` VALUES (53, '18402057856', 9407, 1615430225, 1615430525);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像url',
  `login_time` int(11) NULL DEFAULT NULL COMMENT '登录时间',
  `create_time` int(11) NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT 0 COMMENT '修改时间',
  `status` int(2) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'jsh', 'e10adc3949ba59abbe56e057f20f883e', '258506552011@qq.com', '18402057850', '20210323\\e148f020719d9d63cd2eb9d144553ac1.jpg', 1616463780, 0, 0, 1);
INSERT INTO `user` VALUES (2, 'tom', 'e10adc3949ba59abbe56e057f20f883e', 'ahua0710@126.com', '1395969494', '20210329\\c2cf66d6021ad92cecbd0108fb7cc5c8.jpg', 1617235965, 1609392626, 1609392626, 1);
INSERT INTO `user` VALUES (5, 'tony', '96e79218965eb72c92a549dd5a330112', 'mml1015@163.com', '18402057852', '20210316\\c3b70a08858ef4c758b0c112684a0b3b.png', 1615856698, 1609555284, 1609555284, 1);
INSERT INTO `user` VALUES (6, 'cjh1', '96e79218965eb72c92a549dd5a330112', 'mml1015@163.com', '1840205783', '', NULL, 1609555600, 1609555600, 1);
INSERT INTO `user` VALUES (7, 'coco', '96e79218965eb72c92a549dd5a330112', 'mml1015@163.com', '18402057858', '20210320\\0cd51ec8e1f0918ac093827c43efc77f.jpg', 1617460079, 1609555863, 1609555863, 1);
INSERT INTO `user` VALUES (8, 'lily', 'b59c67bf196a4758191e42f76670ceba', 'mml1015@163.com', '18402057853', '20210315\\4a4ca720273f4fc2eed1572cb5b2f4b5.jpg', 1617458884, 1609556397, 1609556397, 1);
INSERT INTO `user` VALUES (9, 'cjh12222', '96e79218965eb72c92a549dd5a330112', 'mml1015@163.com', '18402057852', '', NULL, 1609578251, 1609578251, 1);
INSERT INTO `user` VALUES (10, 'nan', '96e79218965eb72c92a549dd5a330112', 'qqq12323@dd.com', '15919697073', '', NULL, 1609581846, 1609581846, 1);
INSERT INTO `user` VALUES (11, 'sheng', '96e79218965eb72c92a549dd5a330112', 'mml1015@163.com', '15919696780', '20210315\\258021aae4fa232d7cd7ee08bd84e072.png', 1615776874, 1615439992, 1615439992, 1);
INSERT INTO `user` VALUES (12, 'chen', '96e79218965eb72c92a549dd5a330112', 'mml1015@163.com', '18402057856', '20210401\\958ca5f4c896c81fc6723c38c79161e0.jpg', 1617376061, 1615742245, 1615742245, 1);
INSERT INTO `user` VALUES (13, 'shengsheng', '96e79218965eb72c92a549dd5a330112', 'mml1015@163.com', '15919696781', '20210315\\e1a7fad09726d7c5671f043df9b1943b.jpg', 1616417951, 1616417928, 1616417928, 1);

SET FOREIGN_KEY_CHECKS = 1;
