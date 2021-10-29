/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : smart-parking

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 23/10/2021 22:53:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_car_manage
-- ----------------------------
DROP TABLE IF EXISTS `app_car_manage`;
CREATE TABLE `app_car_manage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `org_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `park_manage_id` bigint(20) NOT NULL,
  `park_manage_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parking_lot` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plate_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `type` smallint(6) NULL DEFAULT NULL,
  `user_id_create` bigint(20) NULL DEFAULT NULL,
  `validity_time` datetime(0) NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_car_manage
-- ----------------------------
INSERT INTO `app_car_manage` VALUES (1, '1', '2021-04-11 21:58:50', '2021-04-19 19:49:35', NULL, '212112', 36, '青岛海信', 2, '海克斯康', '2121', '212121', NULL, 1, 1, NULL, '2021-04-26 00:00:00', '17762018584');

-- ----------------------------
-- Table structure for app_car_park_manage
-- ----------------------------
DROP TABLE IF EXISTS `app_car_park_manage`;
CREATE TABLE `app_car_park_manage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `free_time` int(11) NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  `max_money` decimal(18, 2) NULL DEFAULT NULL,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `org_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parking_space_number` int(11) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `time_unit` int(11) NULL DEFAULT NULL,
  `unit_cost` decimal(18, 2) NULL DEFAULT NULL,
  `user_id_create` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_car_park_manage
-- ----------------------------
INSERT INTO `app_car_park_manage` VALUES (2, 60, '2021-03-27 21:52:08', '2021-03-27 21:52:08', 100.00, '海克斯康', 36, '青岛海信', 12, 1, 30, 5.00, NULL);

-- ----------------------------
-- Table structure for app_car_parking_record
-- ----------------------------
DROP TABLE IF EXISTS `app_car_parking_record`;
CREATE TABLE `app_car_parking_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cost` decimal(18, 2) NULL DEFAULT NULL,
  `gmt_into` datetime(0) NULL DEFAULT NULL,
  `gmt_out` datetime(0) NULL DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `org_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `park_manage_id` bigint(20) NOT NULL,
  `park_manage_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plate_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` smallint(6) NULL DEFAULT NULL,
  `order_no` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_car_parking_record
-- ----------------------------
INSERT INTO `app_car_parking_record` VALUES (1, NULL, '2021-04-19 21:43:41', NULL, 36, '青岛海信', 2, '海克斯康', '苏E05EV8', 2, NULL);

-- ----------------------------
-- Table structure for app_car_safemenu
-- ----------------------------
DROP TABLE IF EXISTS `app_car_safemenu`;
CREATE TABLE `app_car_safemenu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_car_safemenu
-- ----------------------------
INSERT INTO `app_car_safemenu` VALUES (1, '道路隔离要求', '严格隔离机动车道和非机动车道，保证车道的专用性，这样的好处是：即保证不让行人和非机动车等遮挡一体机所抓拍到的车牌图像，影响车牌识别结果。也保证了车辆的行驶的轨迹，在行驶到触发地感线圈时，车牌识别一体机识别的有效性。');
INSERT INTO `app_car_safemenu` VALUES (2, '立柱距离岛边距离', '立柱中心距收费岛边沿距离要求小于0.5米，推荐0.3米。相机应安装在被监控车道的边侧，但应尽量使相机靠近车道，相机与车道的夹角应尽量小。因为相机离车道越远，相机与车道的夹角会越大，这会使视频中的车牌倾斜或者扭曲，不利于识别抓拍。\r\n立柱中心距收费岛边沿距离要求小于0.5米，推荐0.3米。相机应安装在被监控车道的边侧，但应尽量使相机靠近车道，相机与车道的夹角应尽量小。因为相机离车道越远，相机与车道的夹角会越大，这会使视频中的车牌倾斜或者扭曲，不利于识别抓拍。\r\n立柱中心距收费岛边沿距离要求小于0.5米，推荐0.3米。相机应安装在被监控车道的边侧，但应尽量使相机靠近车道，相机与车道的夹角应尽量小。因为相机离车道越远，相机与车道的夹角会越大，这会使视频中的车牌倾斜或者扭曲，不利于识别抓拍。');
INSERT INTO `app_car_safemenu` VALUES (3, '相机安装高度', '相机距车道路面的高度不应低于1.1米。一般相机支架安装在车道旁边的台阶上，所以对支架高度要求不会太高，视具体情况而定。相机过低，视频中车辆没有一个从上到下的移动过程，影响抓拍和识别。');
INSERT INTO `app_car_safemenu` VALUES (4, '相机安装位置', '若识别一体机用于收费车道上做视频监控和防盗卡检测，需要将其安装在路侧停车收费系统上。立柱距离前线圈前沿的距离要比安装在同侧时远1米。');
INSERT INTO `app_car_safemenu` VALUES (5, '视频不能有遮挡', '车牌抓拍机前面不应有遮挡物，以保证车辆视频画面的完整性，否则会影响抓拍识别。对于有栏杆机的车道，相机要安装在栏杆机的前面，以保证通行车辆的车牌不会被栏杆机的起落杆遮挡； 但相机要尽量靠近栏杆机，这样能保证车停时车牌在检测区内，且车牌不会因太靠近相机而变得太大。相机安装的具体位置应根据现场环境，镜头调焦等情况来调整。');
INSERT INTO `app_car_safemenu` VALUES (6, '布管穿线', '为了方便各设备之间走线即整个系统外观的美观，要将所有设备之间的连线通过管道进行连接，并将连接各设备之间的管道预埋在岛面之下。要预埋在混凝土安全岛的穿线管建议使用PVC电线管，不仅不会腐蚀，而且壁滑方便穿线。');
INSERT INTO `app_car_safemenu` VALUES (7, '调整镜头保证车牌清晰', '当以上设备安装好后，就开始对车辆进出场时调整抓拍机镜头了，直到在清晰度和焦距调到最好的状态。\r\n\r\n1、旋转调焦环，调整到合适的焦距(汽车在整个图像中尽可能大)。\r\n\r\n2、 旋转对焦环，图像边缘会逐渐变清晰，此时放慢调整速度，直至变模糊。然后在稍微反向旋转到最清晰处时对焦完成。\r\n\r\n3、将光圈调整到最大位置，光圈调太小则图像亮度太暗。\r\n\r\n4、在最后调整完成后，先将抓拍机和衬板一起从防护罩取出，锁死调焦环和对焦环。然后将相机和衬板放置在防护罩内，在用自攻钉固定在防护罩内，放置由于震动造成对焦和调焦环微调，造成拍摄图片不清晰。对焦过程需要反复调整，拍摄图片对比，直至车牌识别一体机抓拍到最清晰图像。');

-- ----------------------------
-- Table structure for app_order
-- ----------------------------
DROP TABLE IF EXISTS `app_order`;
CREATE TABLE `app_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `order_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_Id` bigint(20) NOT NULL,
  `park_manage_id` bigint(20) NOT NULL,
  `plate_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `total_Fee` decimal(18, 2) NULL DEFAULT NULL,
  `type` smallint(6) NULL DEFAULT NULL,
  `user_create` bigint(20) NULL DEFAULT NULL,
  `validity_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_order
-- ----------------------------

-- ----------------------------
-- Table structure for app_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `app_pay_config`;
CREATE TABLE `app_pay_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_park_id` bigint(20) NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  `mch_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secret_key` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id_create` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_pay_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `config_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一标识',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
  `config_remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `user_id_create` bigint(20) NOT NULL COMMENT '创建人',
  `gmt_create` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL COMMENT '状态 0 禁用 1 可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基础配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_interface
-- ----------------------------
DROP TABLE IF EXISTS `sys_interface`;
CREATE TABLE `sys_interface`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `query` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id_create` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_interface
-- ----------------------------

-- ----------------------------
-- Table structure for sys_landing_records
-- ----------------------------
DROP TABLE IF EXISTS `sys_landing_records`;
CREATE TABLE `sys_landing_records`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户ID',
  `login_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最近登录时间',
  `place` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最近登录地点',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最近登录IP',
  `login_way` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_landing_records
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int(11) NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `device_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '访问方式 0:PC 1:手机 2:未知',
  `log_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型 0: 一般日志记录 1: 异常错误日志',
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常详细信息',
  `gmt_create` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-03-08 19:58:39');
INSERT INTO `sys_log` VALUES (2, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-03-16 20:26:27');
INSERT INTO `sys_log` VALUES (3, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-03-26 20:51:14');
INSERT INTO `sys_log` VALUES (4, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-03-26 21:10:51');
INSERT INTO `sys_log` VALUES (5, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-04-11 20:45:05');
INSERT INTO `sys_log` VALUES (6, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-04-13 20:15:18');
INSERT INTO `sys_log` VALUES (7, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-04-13 20:15:21');
INSERT INTO `sys_log` VALUES (8, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-04-19 19:47:39');
INSERT INTO `sys_log` VALUES (9, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-04-19 20:17:24');
INSERT INTO `sys_log` VALUES (10, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-04-19 20:46:12');
INSERT INTO `sys_log` VALUES (11, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-09 17:21:55');
INSERT INTO `sys_log` VALUES (12, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-09 18:23:31');
INSERT INTO `sys_log` VALUES (13, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-09 19:17:59');
INSERT INTO `sys_log` VALUES (14, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-09 19:19:10');
INSERT INTO `sys_log` VALUES (15, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-19 17:12:55');
INSERT INTO `sys_log` VALUES (16, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-19 17:28:55');
INSERT INTO `sys_log` VALUES (17, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-19 17:35:25');
INSERT INTO `sys_log` VALUES (18, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-20 08:07:48');
INSERT INTO `sys_log` VALUES (19, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 13:04:52');
INSERT INTO `sys_log` VALUES (20, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 13:48:22');
INSERT INTO `sys_log` VALUES (21, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 13:51:21');
INSERT INTO `sys_log` VALUES (22, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 14:05:02');
INSERT INTO `sys_log` VALUES (23, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 14:11:10');
INSERT INTO `sys_log` VALUES (24, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 14:37:30');
INSERT INTO `sys_log` VALUES (25, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 14:53:07');
INSERT INTO `sys_log` VALUES (26, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 15:27:41');
INSERT INTO `sys_log` VALUES (27, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 15:35:30');
INSERT INTO `sys_log` VALUES (28, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 15:39:41');
INSERT INTO `sys_log` VALUES (29, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 15:42:32');
INSERT INTO `sys_log` VALUES (30, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 16:05:30');
INSERT INTO `sys_log` VALUES (31, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 16:10:46');
INSERT INTO `sys_log` VALUES (32, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 17:16:29');
INSERT INTO `sys_log` VALUES (33, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 19:57:55');
INSERT INTO `sys_log` VALUES (34, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 20:38:14');
INSERT INTO `sys_log` VALUES (35, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 20:50:08');
INSERT INTO `sys_log` VALUES (36, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 20:56:29');
INSERT INTO `sys_log` VALUES (37, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 21:00:13');
INSERT INTO `sys_log` VALUES (38, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:13:33');
INSERT INTO `sys_log` VALUES (39, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:16:14');
INSERT INTO `sys_log` VALUES (40, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:17:47');
INSERT INTO `sys_log` VALUES (41, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:19:30');
INSERT INTO `sys_log` VALUES (42, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:21:02');
INSERT INTO `sys_log` VALUES (43, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:22:36');
INSERT INTO `sys_log` VALUES (44, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:24:17');
INSERT INTO `sys_log` VALUES (45, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:26:28');
INSERT INTO `sys_log` VALUES (46, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:29:40');
INSERT INTO `sys_log` VALUES (47, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:30:27');
INSERT INTO `sys_log` VALUES (48, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:36:28');
INSERT INTO `sys_log` VALUES (49, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:38:13');
INSERT INTO `sys_log` VALUES (50, 1, 'admin', '登录', 10, '', '', '0:0:0:0:0:0:0:1', 0, 0, '', '2021-10-23 22:41:39');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 310 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, '', 0, 'layui-icon layui-icon-template-1', 5, '2017-08-09 22:49:47', '2017-09-11 17:25:22');
INSERT INTO `sys_menu` VALUES (2, 1, '系统菜单', 'sys/menu/list.html', NULL, 1, 'layui-icon layui-icon-spread-left', 10, '2017-08-09 22:55:15', '2017-08-17 10:00:12');
INSERT INTO `sys_menu` VALUES (6, 299, '用户管理', 'sys/user/list.html', '', 1, 'layui-icon layui-icon-username', 2, '2017-08-10 14:12:11', '2017-09-05 12:57:42');
INSERT INTO `sys_menu` VALUES (7, 1, '角色管理', 'sys/role/list.html', '', 1, 'layui-icon layui-icon-tree', 1, '2017-08-10 14:13:19', '2017-09-05 12:57:30');
INSERT INTO `sys_menu` VALUES (11, 6, '刷新', '/sys/user/list', 'sys:user:list', 2, NULL, 0, '2017-08-14 10:51:05', '2017-09-05 12:47:23');
INSERT INTO `sys_menu` VALUES (12, 6, '新增', '/sys/user/save', 'sys:user:save', 2, NULL, 0, '2017-08-14 10:51:35', '2017-09-05 12:47:34');
INSERT INTO `sys_menu` VALUES (13, 6, '编辑', '/sys/user/update', 'sys:user:edit', 2, NULL, 0, '2017-08-14 10:52:06', '2017-09-05 12:47:46');
INSERT INTO `sys_menu` VALUES (14, 6, '删除', '/sys/user/remove', 'sys:user:remove', 2, NULL, 0, '2017-08-14 10:52:24', '2017-09-05 12:48:03');
INSERT INTO `sys_menu` VALUES (15, 7, '刷新', '/sys/role/list', 'sys:role:list', 2, NULL, 0, '2017-08-14 10:56:37', '2017-09-05 12:44:04');
INSERT INTO `sys_menu` VALUES (16, 7, '新增', '/sys/role/save', 'sys:role:save', 2, NULL, 0, '2017-08-14 10:57:02', '2017-09-05 12:44:23');
INSERT INTO `sys_menu` VALUES (17, 7, '编辑', '/sys/role/update', 'sys:role:edit', 2, NULL, 0, '2017-08-14 10:57:31', '2017-09-05 12:44:48');
INSERT INTO `sys_menu` VALUES (18, 7, '删除', '/sys/role/remove', 'sys:role:remove', 2, NULL, 0, '2017-08-14 10:57:50', '2017-09-05 12:45:02');
INSERT INTO `sys_menu` VALUES (19, 7, '操作权限', '/sys/role/authorize/opt', 'sys:role:authorizeOpt', 2, NULL, 0, '2017-08-14 10:58:55', '2017-09-05 12:45:29');
INSERT INTO `sys_menu` VALUES (20, 2, '刷新', '/sys/menu/list', 'sys:menu:list', 2, NULL, 0, '2017-08-14 10:59:32', '2017-09-05 13:06:24');
INSERT INTO `sys_menu` VALUES (21, 2, '新增', '/sys/menu/save', 'sys:menu:save', 2, NULL, 0, '2017-08-14 10:59:56', '2017-09-05 13:06:35');
INSERT INTO `sys_menu` VALUES (22, 2, '编辑', '/sys/menu/update', 'sys:menu:edit', 2, NULL, 0, '2017-08-14 11:00:26', '2017-09-05 13:06:48');
INSERT INTO `sys_menu` VALUES (23, 2, '删除', '/sys/menu/remove', 'sys:menu:remove', 2, NULL, 0, '2017-08-14 11:00:58', '2017-09-05 13:07:00');
INSERT INTO `sys_menu` VALUES (24, 6, '启用', '/sys/user/enable', 'sys:user:enable', 2, NULL, 0, '2017-08-14 17:27:18', '2017-09-05 12:48:30');
INSERT INTO `sys_menu` VALUES (25, 6, '停用', '/sys/user/disable', 'sys:user:disable', 2, NULL, 0, '2017-08-14 17:27:43', '2017-09-05 12:48:49');
INSERT INTO `sys_menu` VALUES (26, 6, '重置密码', '/sys/user/rest', 'sys:user:resetPassword', 2, NULL, 0, '2017-08-14 17:28:34', '2017-09-05 12:49:17');
INSERT INTO `sys_menu` VALUES (27, 267, '系统日志', 'sys/log/list.html', NULL, 1, 'fa fa-warning', 3, '2017-08-14 22:11:53', '2017-08-17 09:55:19');
INSERT INTO `sys_menu` VALUES (28, 27, '刷新', '/sys/log/list', 'sys:log:list', 2, NULL, 0, '2017-08-14 22:30:22', '2017-09-05 13:05:24');
INSERT INTO `sys_menu` VALUES (29, 27, '删除', '/sys/log/remove', 'sys:log:remove', 2, NULL, 0, '2017-08-14 22:30:43', '2017-09-05 13:05:37');
INSERT INTO `sys_menu` VALUES (30, 27, '清空', '/sys/log/clear', 'sys:log:clear', 2, NULL, 0, '2017-08-14 22:31:02', '2017-09-05 13:05:53');
INSERT INTO `sys_menu` VALUES (42, 261, '刷新', '/sys/org/list', 'sys:org:list', 2, NULL, 0, '2017-08-17 10:03:36', '2017-09-05 11:47:37');
INSERT INTO `sys_menu` VALUES (43, 261, '新增', '/sys/org/save', 'sys:org:save', 2, NULL, 0, '2017-08-17 10:03:54', '2017-09-05 12:40:55');
INSERT INTO `sys_menu` VALUES (44, 261, '编辑', '/sys/org/update', 'sys:org:edit', 2, NULL, 0, '2017-08-17 10:04:11', '2017-09-05 12:43:06');
INSERT INTO `sys_menu` VALUES (45, 261, '删除', '/sys/org/remove', 'sys:org:remove', 2, NULL, 0, '2017-08-17 10:04:30', '2017-09-05 12:42:19');
INSERT INTO `sys_menu` VALUES (46, 7, '数据权限', '/sys/role/authorize/data', 'sys:role:authorizeData', 2, NULL, 0, '2017-08-17 13:48:11', '2017-09-05 12:45:54');
INSERT INTO `sys_menu` VALUES (261, 299, '合作单位', '/sys/org/list.html', NULL, 1, 'layui-icon layui-icon-friends', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (264, 1, '全局配置', 'sys/config/list.html', NULL, 1, 'layui-icon layui-icon-templeate-1', 40, NULL, NULL);
INSERT INTO `sys_menu` VALUES (267, 0, '系统监控', NULL, NULL, 0, 'layui-icon layui-icon-camera', 40, NULL, NULL);
INSERT INTO `sys_menu` VALUES (295, 0, '停车场管理', NULL, NULL, 0, 'layui-icon layui-icon-diamond', 0, NULL, NULL);
INSERT INTO `sys_menu` VALUES (296, 295, '停车场管理', 'car/parkManage/list.html', NULL, 1, 'layui-icon layui-icon-set', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (299, 0, '账户管理', NULL, NULL, 0, 'layui-icon layui-icon-username', 10, NULL, NULL);
INSERT INTO `sys_menu` VALUES (300, 0, '车场管理', NULL, NULL, 0, 'layui-icon layui-icon-release', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (301, 300, '车辆管理', 'car/carManage/list.html', NULL, 1, 'layui-icon layui-icon-release', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (302, 0, '停车记录', NULL, NULL, 0, 'layui-icon layui-icon-file-b', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (303, 302, '停车记录', 'car/parkingRecord/list.html', NULL, 1, 'layui-icon layui-icon-location', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (304, 0, '车牌识别', '', NULL, 0, 'layui-icon layui-icon-camera-fill', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (305, 304, '车牌识别', 'car/distinguish/list.html', NULL, 1, 'layui-icon layui-icon-camera-fill', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (306, 0, '安全事项', '', NULL, 0, 'layui-icon layui-icon-help', 41, NULL, NULL);
INSERT INTO `sys_menu` VALUES (307, 306, '安全事项', 'car/safemenu/list.html', NULL, 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (308, 0, '关于', '', NULL, 0, 'layui-icon layui-icon-about', 42, NULL, NULL);
INSERT INTO `sys_menu` VALUES (309, 308, '关于', 'car/about/list.html', NULL, 1, '', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`  (
  `org_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级机构ID，一级机构为0',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `full_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称(全称)',
  `director` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构负责人',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '可用标识  1：可用  0：不可用',
  `gmt_create` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES (36, 0, '00006', '青岛海信', '青岛海信', '海信', NULL, NULL, NULL, NULL, 1, '2020-05-08 22:06:58', '2020-05-08 22:07:03');
INSERT INTO `sys_org` VALUES (38, 0, '00005', '青岛海尔', '青岛海尔', NULL, NULL, NULL, NULL, NULL, 1, '2020-05-08 22:17:32', '2020-11-07 10:44:25');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `org_id` bigint(255) NULL DEFAULT NULL COMMENT '所属机构',
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 17, '超级管理员', 'admin', '【系统内置】', 2, '2017-08-12 00:43:52', '2017-11-21 10:19:08');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14895 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (14850, 1, 295);
INSERT INTO `sys_role_menu` VALUES (14851, 1, 296);
INSERT INTO `sys_role_menu` VALUES (14852, 1, 304);
INSERT INTO `sys_role_menu` VALUES (14853, 1, 305);
INSERT INTO `sys_role_menu` VALUES (14854, 1, 300);
INSERT INTO `sys_role_menu` VALUES (14855, 1, 301);
INSERT INTO `sys_role_menu` VALUES (14856, 1, 302);
INSERT INTO `sys_role_menu` VALUES (14857, 1, 303);
INSERT INTO `sys_role_menu` VALUES (14858, 1, 1);
INSERT INTO `sys_role_menu` VALUES (14859, 1, 7);
INSERT INTO `sys_role_menu` VALUES (14860, 1, 15);
INSERT INTO `sys_role_menu` VALUES (14861, 1, 16);
INSERT INTO `sys_role_menu` VALUES (14862, 1, 17);
INSERT INTO `sys_role_menu` VALUES (14863, 1, 18);
INSERT INTO `sys_role_menu` VALUES (14864, 1, 19);
INSERT INTO `sys_role_menu` VALUES (14865, 1, 46);
INSERT INTO `sys_role_menu` VALUES (14866, 1, 2);
INSERT INTO `sys_role_menu` VALUES (14867, 1, 20);
INSERT INTO `sys_role_menu` VALUES (14868, 1, 21);
INSERT INTO `sys_role_menu` VALUES (14869, 1, 22);
INSERT INTO `sys_role_menu` VALUES (14870, 1, 23);
INSERT INTO `sys_role_menu` VALUES (14871, 1, 264);
INSERT INTO `sys_role_menu` VALUES (14872, 1, 299);
INSERT INTO `sys_role_menu` VALUES (14873, 1, 6);
INSERT INTO `sys_role_menu` VALUES (14874, 1, 11);
INSERT INTO `sys_role_menu` VALUES (14875, 1, 12);
INSERT INTO `sys_role_menu` VALUES (14876, 1, 13);
INSERT INTO `sys_role_menu` VALUES (14877, 1, 14);
INSERT INTO `sys_role_menu` VALUES (14878, 1, 24);
INSERT INTO `sys_role_menu` VALUES (14879, 1, 25);
INSERT INTO `sys_role_menu` VALUES (14880, 1, 26);
INSERT INTO `sys_role_menu` VALUES (14881, 1, 261);
INSERT INTO `sys_role_menu` VALUES (14882, 1, 42);
INSERT INTO `sys_role_menu` VALUES (14883, 1, 43);
INSERT INTO `sys_role_menu` VALUES (14884, 1, 44);
INSERT INTO `sys_role_menu` VALUES (14885, 1, 45);
INSERT INTO `sys_role_menu` VALUES (14886, 1, 267);
INSERT INTO `sys_role_menu` VALUES (14887, 1, 27);
INSERT INTO `sys_role_menu` VALUES (14888, 1, 28);
INSERT INTO `sys_role_menu` VALUES (14889, 1, 29);
INSERT INTO `sys_role_menu` VALUES (14890, 1, 30);
INSERT INTO `sys_role_menu` VALUES (14891, 1, 306);
INSERT INTO `sys_role_menu` VALUES (14892, 1, 307);
INSERT INTO `sys_role_menu` VALUES (14893, 1, 308);
INSERT INTO `sys_role_menu` VALUES (14894, 1, 309);

-- ----------------------------
-- Table structure for sys_role_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_org`;
CREATE TABLE `sys_role_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '机构ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与机构对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_org
-- ----------------------------
INSERT INTO `sys_role_org` VALUES (17, 1, 17);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `org_id` bigint(20) NOT NULL COMMENT '所属机构',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名(昵称)',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `avatar_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '头像上传 0:未上传 1:上传',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_modify_pwd` tinyint(4) NULL DEFAULT 0 COMMENT '是否修改过初始密码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 36, 'admin', '4cf28b576b2af52c9441d653e5a79917', 'admin', '100000@qq.com', '17788888888', 1, 0, NULL, 1, '2017-08-15 21:40:39', '2021-03-08 21:04:16', 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 266 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (265, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
