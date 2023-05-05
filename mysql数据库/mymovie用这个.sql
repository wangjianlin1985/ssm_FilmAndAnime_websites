/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.6
 Source Server Type    : MySQL
 Source Server Version : 50620
 Source Host           : localhost:3306
 Source Schema         : mymovie

 Target Server Type    : MySQL
 Target Server Version : 50620
 File Encoding         : 65001

 Date: 15/12/2020 22:58:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '系统管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123', '视频管理员');
INSERT INTO `admin` VALUES (2, 'sa', 'sa', '系统管理员');
INSERT INTO `admin` VALUES (3, 'sheep', '123', '用户管理员');
INSERT INTO `admin` VALUES (4, 'ych', '123', '系统管理员');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '电影', '2018-01-18 12:29:32');
INSERT INTO `category` VALUES (2, '电视剧', '2018-01-18 12:30:43');
INSERT INTO `category` VALUES (3, '动漫', '2018-01-18 12:30:53');
INSERT INTO `category` VALUES (4, '综艺', '2018-01-18 12:31:41');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(10) NOT NULL,
  `movie_id` bigint(10) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment _date` datetime(0) NULL DEFAULT NULL,
  `creator` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_comment_pk`(`creator`) USING BTREE,
  CONSTRAINT `user_comment_pk` FOREIGN KEY (`creator`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `movie_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movie_country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_year` int(10) NULL DEFAULT NULL,
  `show_time` datetime(0) NULL DEFAULT NULL,
  `director` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `actors` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `options` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` double NULL DEFAULT 0,
  `downloads` bigint(50) NULL DEFAULT 0,
  `plays` bigint(50) NULL DEFAULT 0,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `mv_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` bigint(10) NOT NULL,
  `slider_image` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `admin_id` int(2) NULL DEFAULT NULL,
  `isplay` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_movie_pk`(`user_id`) USING BTREE,
  INDEX `category_movie_fk`(`category_id`) USING BTREE,
  INDEX `admin_pk`(`admin_id`) USING BTREE,
  CONSTRAINT `admin_pk` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `category_movie_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_movie_pk` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '陈可辛-三分钟', '中国', 2018, '2018-01-31 00:00:00', '陈可辛', '陈可辛等', '00:07:11', 'iPhone X 拍摄的三分钟', 4, 0, 2165, NULL, '.mp4', '.png', 1, '.jpg', 1, 1);
INSERT INTO `movie` VALUES ('2', '心理罪之城市之光', '中国大陆', 2017, '2017-12-27 10:50:39', '刘诗诗', '刘诗诗、阮经天、邓超', '1：30：21', '刘诗诗、邓超、阮经天联袂主演', 5, 2312, 1225, NULL, '.MP4', '.jpg', 1, '.jpg', 1, 1);
INSERT INTO `movie` VALUES ('2f378c82-95cc-43d2-a84c-26493a2c5431', '测试bbc', '中国', NULL, '2020-12-28 00:00:00', '13', 'cc', '135', '大神aa', 5, 0, 4, 10, '.mp4', '.jpg', 3, '', NULL, 1);
INSERT INTO `movie` VALUES ('58e3bc3a-b4ca-42bb-a195-8d04570cea5d', '测试', '中国', 2020, '2020-12-25 00:00:00', '13', 'bb', '12', '大神', 4, 0, 11, 5, '.mp4', '.jpg', 1, '', NULL, 0);
INSERT INTO `movie` VALUES ('6ea298ea-8fb2-4271-a5fa-45e2f25367cd', '罪途2之救赎代', '中国大陆', NULL, '2018-04-30 00:00:00', '马小刚', '韩朴俊、尹航、朱颜曼滋、何索、李心敏、韩秋池', '63:49', '罪途2之救赎代', 5, 0, 8, 1, '.mp4', '.jpg', 1, '', NULL, 1);
INSERT INTO `movie` VALUES ('7e22843b-05bc-488a-adfd-e1154a5b3302', '国家宝藏', '中国大陆', NULL, '2018-02-18 00:00:00', '张国立', '张国立、刘烨等', '1:10:31', '[国家宝藏]1210期：“越王勾践剑”真容再现', 4, 0, 6, 9, '.mp4', '.jpg', 4, '', NULL, 1);
INSERT INTO `movie` VALUES ('bb8f84b5-4084-4497-b008-61b28ad2730f', '无敌精钢', '中国', NULL, '2020-12-29 00:00:00', '王进', '郑伊健', '100分钟', '经典武打片测试', 5, 0, 2, 9, '.mp4', '.jpg', 1, '', NULL, 1);
INSERT INTO `movie` VALUES ('fa86b47d-b377-4758-93f6-ef703ba6ffab', '罪途1之死亡列车', '中国大陆', NULL, '2018-01-31 00:00:00', '马小刚', '韩朴俊、朱颜曼滋、李心敏、何索、韩秋池、红花、尹航、刘鹏、荆民强、穆梦娇、吴雨珏等', '1:11:08', '罪途1之死亡列车', 5, 0, 1, 1, '.mp4', '.jpg', 1, '', NULL, 1);
INSERT INTO `movie` VALUES ('hz01', '海贼王01', '日本', 1999, '1999-10-20 00:00:00', '尾田荣一郎', '草帽', '00:30:21', '海贼王', 5, 3, 225, NULL, '.mp4', '.jpg', 3, '', 1, 1);
INSERT INTO `movie` VALUES ('hz02', '海贼王02', '日本', 1999, '1999-10-20 00:00:00', '尾田荣一郎', '草帽', '00:30:21', '海贼王', 5, 3, 223, NULL, '.mp4', '.jpg', 3, '', 1, 1);
INSERT INTO `movie` VALUES ('hz03', '海贼王03', '日本', 1999, '1999-10-20 00:00:00', '尾田荣一郎', '草帽', '00:30:21', '海贼王', 5, 3, 221, NULL, '.mp4', '.jpg', 3, '', 1, 1);
INSERT INTO `movie` VALUES ('hz04', '海贼王04', '日本', 1999, '1999-10-20 00:00:00', '尾田荣一郎', '草帽', '00:30:21', '海贼王', 5, 3, 222, NULL, '.mp4', '.jpg', 3, '', 1, 1);
INSERT INTO `movie` VALUES ('hz05', '海贼王05', '日本', 1999, '1999-10-20 00:00:00', '尾田荣一郎', '草帽', '00:30:21', '海贼王', 5, 3, 222, NULL, '.mp4', '.jpg', 3, '', 1, 1);
INSERT INTO `movie` VALUES ('jy', '记忆大师', '中国大陆', 2017, '2017-11-25 14:39:58', '杨江', '黄渤、段奕宏', '1:50:09', '记忆大师', 4, 0, 26, NULL, '.MP4', '.jpg', 1, '', 1, 1);
INSERT INTO `movie` VALUES ('lc01', '猎场01', '中国大陆', 2017, '2017-12-01 13:23:51', '胡歌', '胡歌、陈龙、宋茜', '0:45:00', '猎场', 4, 0, 1346, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('lc02', '猎场02', '中国大陆', 2017, '2017-12-01 13:23:51', '胡歌', '胡歌、陈龙、宋茜', '0:45:00', '猎场', 4, 0, 5, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('lc03', '猎场03', '中国大陆', 2017, '2017-12-01 13:23:51', '胡歌', '胡歌、陈龙、宋茜', '0:45:00', '猎场', 4, 0, 1, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('lc04', '猎场04', '中国大陆', 2017, '2017-12-01 13:23:51', '胡歌', '胡歌、陈龙、宋茜', '0:45:00', '猎场', 4, 0, 1, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('lc05', '猎场05', '中国大陆', 2017, '2017-12-01 13:23:51', '胡歌', '胡歌、陈龙、宋茜', '0:45:00', '猎场', 4, 0, 0, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('lj', '蓝精灵', '比利时', 2017, '2017-11-25 14:46:45', '蓝精灵', '蓝精灵', '1:49:03', '蓝精灵', 4, 0, 14, NULL, '.mp4', '.jpg', 1, '', 1, 1);
INSERT INTO `movie` VALUES ('mf', '麻烦家族', '中国大陆', 2017, '2017-06-24 00:00:00', '吴刚', '武钢、陈好', '1:32:08', '麻烦家族', 3, 0, 25, 1, '.mp4', '.jpg', 1, '', NULL, 1);
INSERT INTO `movie` VALUES ('ms01', '莫斯科行动01', '中国大陆', 2018, '2018-01-25 13:40:45', '王刚刚', '夏雨、吴优', '00:41:21', '莫斯科行动', 3, 0, 126, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('ms02', '莫斯科行动02', '中国大陆', 2018, '2018-01-25 13:40:45', '王刚刚', '夏雨、吴优', '00:41:21', '莫斯科行动', 3, 0, 124, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('ms03', '莫斯科行动03', '中国大陆', 2018, '2018-01-25 13:40:45', '王刚刚', '夏雨、吴优', '00:41:21', '莫斯科行动', 3, 0, 124, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('ms04', '莫斯科行动04', '中国大陆', 2018, '2018-01-25 13:40:45', '王刚刚', '夏雨、吴优', '00:41:21', '莫斯科行动', 3, 0, 124, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('ms05', '莫斯科行动05', '中国大陆', 2018, '2018-01-25 13:40:45', '王刚刚', '夏雨、吴优', '00:41:21', '莫斯科行动', 3, 0, 125, NULL, '.mp4', '.jpg', 2, '', 1, 1);
INSERT INTO `movie` VALUES ('mz01', '名侦探柯南01', '日本', 1996, '1996-01-08 00:00:00', '山本太一郞', '高山南、山口胜平', '00:31:09', '名侦探柯南', 5, 0, 216, 1, '.mp4', '.jpg', 3, '', NULL, 1);
INSERT INTO `movie` VALUES ('mz02', '名侦探柯南02', '日本', 1996, '1996-01-08 00:00:00', '山本太一郞', '高山南、山口胜平', '00:31:09', '名侦探柯南', 5, 0, 213, 1, '.mp4', '.jpg', 3, '', NULL, 1);
INSERT INTO `movie` VALUES ('mz03', '名侦探柯南03', '日本', 1996, '1996-01-08 00:00:00', '山本太一郞', '高山南、山口胜平', '00:31:09', '名侦探柯南', 5, 0, 211, 1, '.mp4', '.jpg', 3, '', NULL, 1);
INSERT INTO `movie` VALUES ('mz04', '名侦探柯南04', '日本', 1996, '1996-01-08 00:00:00', '山本太一郞', '高山南、山口胜平', '00:31:09', '名侦探柯南', 5, 0, 213, 1, '.mp4', '.jpg', 3, '', NULL, 1);
INSERT INTO `movie` VALUES ('qc01', '青春旅社01', '中国大陆', 2017, '2017-12-25 14:14:35', '秦春', '景田等', '1:31:35', '青春旅社', 5, 0, 12346, NULL, '.MP4', '.jpg', 4, '', 1, 1);
INSERT INTO `movie` VALUES ('sl01', '声临其境01', '中国大陆', 2018, '2018-01-25 14:10:27', '徐晴', '郭京飞、王珞丹等', '01:30:21', '声临其境', 3, 0, 30, 1, '.mp4', '.jpg', 4, '', NULL, 1);
INSERT INTO `movie` VALUES ('sl02', '声临其境02', '中国大陆', 2018, '2018-01-25 14:10:27', '徐晴', '郭京飞、王珞丹等', '01:30:21', '声临其境', 3, 0, 23, NULL, '.mp4', '.jpg', 4, '', 1, 1);
INSERT INTO `movie` VALUES ('sl03', '声临其境03', '中国大陆', 2018, '2018-01-25 14:10:27', '徐晴', '郭京飞、王珞丹等', '01:30:21', '声临其境', 3, 0, 23, NULL, '.mp4', '.jpg', 4, '', 1, 1);
INSERT INTO `movie` VALUES ('sq', '神奇女侠', '欧美', 2017, '2017-08-25 15:12:01', '神奇女侠', '神奇女侠', '1:42:31', '神奇女侠', 5, 0, 23130, NULL, '.mp4', '.jpg', 1, '.jpg', 1, 1);
INSERT INTO `movie` VALUES ('wdtzwdt1', '我的团长我的团10', '中国大陆', NULL, '2009-03-21 00:00:00', '康洪雷', '段奕宏、张译、张国强、邢佳栋等', '45:51', '我的团长我的团', 5, 0, 7, 1, '.mp4', '.jpg', 2, '', NULL, 1);
INSERT INTO `movie` VALUES ('yy01', '演员的诞生01', '中国大陆', 2017, '2017-08-25 14:27:13', '章子怡', '章子怡、刘烨等', '1:39:01', '演员的诞生', 4, 0, 33, NULL, '.mp4', '.jpg', 4, '', 1, 1);
INSERT INTO `movie` VALUES ('yy02', '演员的诞生02', '中国大陆', 2017, '2017-08-25 14:27:13', '章子怡', '章子怡、刘烨等', '1:39:01', '演员的诞生', 4, 0, 32, NULL, '.mp4', '.jpg', 4, '', 1, 1);
INSERT INTO `movie` VALUES ('zq01', '最强大脑01', '中国大陆', 2017, '2017-01-25 14:21:05', '最强大脑', '最强大脑', '1:09:41', '最强大脑', 5, 0, 27, NULL, '.mp4', '.jpg', 4, '.jpg', 1, 1);
INSERT INTO `movie` VALUES ('zq02', '最强大脑02', '中国大陆', 2017, '2017-01-25 14:21:05', '最强大脑', '最强大脑', '1:09:41', '最强大脑', 5, 0, 23, NULL, '.mp4', '.jpg', 4, '', 1, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_price` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register_date` datetime(0) NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'sheep', '0526sheep@S', '杨先森', '.jpg', '2018-01-13 17:33:57', '18776819804');
INSERT INTO `sys_user` VALUES (3, 'sheepych', '123456', '杨先森', '.jpg', '2018-01-14 20:02:54', '18776819804');
INSERT INTO `sys_user` VALUES (4, 'blue', '123456', '杨先森', '.jpg', '2018-01-15 10:05:27', '18776819805');
INSERT INTO `sys_user` VALUES (5, 'sheepblue', '123456', '王先生', '.jpg', '2018-01-15 10:17:41', '18776819806');
INSERT INTO `sys_user` VALUES (6, 'tx', '0526sheep@A', '泄题', '.png', '2018-01-15 10:19:56', '18776819845');
INSERT INTO `sys_user` VALUES (7, 'blueych', '123sheep@A', 'blueych', '.jpg', '2018-01-25 20:10:40', '18776819804');
INSERT INTO `sys_user` VALUES (8, 'ych123', '123sheep@A', '杨同学', '.png', '2018-01-27 10:40:35', '13132804881');
INSERT INTO `sys_user` VALUES (9, 'sheePlay', '123456', 'sheepPlay', '.jpg', '2018-04-05 20:18:07', '13132804881');
INSERT INTO `sys_user` VALUES (10, 'lingege', '123456', 'lingege', '.jpg', '2020-12-15 17:28:33', '13508329423');

SET FOREIGN_KEY_CHECKS = 1;
