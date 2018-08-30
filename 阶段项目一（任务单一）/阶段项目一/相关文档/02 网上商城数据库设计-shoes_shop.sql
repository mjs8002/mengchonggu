/*
 Navicat MySQL Data Transfer

 Source Server         : mysql4Java
 Source Server Type    : MySQL
 Source Server Version : 50024
 Source Host           : localhost:3306
 Source Schema         : shoes_shop

 Target Server Type    : MySQL
 Target Server Version : 50024
 File Encoding         : 65001

 Date: 29/08/2018 14:23:59
*/


SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int(11) NOT NULL    ,
  `cust_id` int(255) NULL DEFAULT NULL,
  `shoes_detail_id` int(11) NULL DEFAULT NULL,
  `quality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` date NULL DEFAULT NULL,
  `update_time` date NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`cart_id`),
  INDEX `fk_cust_cart` USING BTREE(`cust_id`),
  INDEX `fk_cart_shoes_detail` USING BTREE(`shoes_detail_id`),
  CONSTRAINT `fk_cart_shooes_detail` FOREIGN KEY (`shoes_detail_id`) REFERENCES `shoes_detail` (`shoes_detail_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cust_cart` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`shoes_detail_id`) REFER `shoes_shop/shoes_detail`(`shoe' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL    ,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_create_time` date NULL DEFAULT NULL,
  `category_update_time` date NULL DEFAULT NULL,
  `category_status` tinyint(10) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`category_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cust_login
-- ----------------------------
DROP TABLE IF EXISTS `cust_login`;
CREATE TABLE `cust_login`  (
  `login_id` int(11) NOT NULL     COMMENT '登录id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录用户名（注册的手机号或邮箱）',
  `login_pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `login_time` date NULL DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `login_status` int(255) NULL DEFAULT NULL COMMENT '登录状态（0：已登录，1：已下限）',
  `cust_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`login_id`),
  INDEX `fk_cust_login` USING BTREE(`cust_id`),
  CONSTRAINT `cust_login_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`cust_id`) REFER `shoes_shop/customer`(`cust_id`) ON UPD' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cust_id` int(11) NOT NULL DEFAULT 0,
  `cust_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_age` int(11) NULL DEFAULT NULL,
  `cust_phone` int(11) NULL DEFAULT NULL,
  `cust_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_create_time` datetime NULL DEFAULT NULL,
  `cust_update_time` datetime NULL DEFAULT NULL,
  `cust_profile` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`cust_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for myorder
-- ----------------------------
DROP TABLE IF EXISTS `myorder`;
CREATE TABLE `myorder`  (
  `order_id` int(11) NOT NULL    ,
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_id` int(255) NULL DEFAULT NULL,
  `order_time` date NULL DEFAULT NULL,
  `order_price` date NULL DEFAULT NULL,
  `order_address_id` int(255) NULL DEFAULT NULL,
  `order_status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`order_id`),
  INDEX `fk_order_cust` USING BTREE(`cust_id`),
  INDEX `fk_ordder_addess` USING BTREE(`order_address_id`),
  CONSTRAINT `fk_ordder_addess` FOREIGN KEY (`order_address_id`) REFERENCES `receive_address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_order_cust` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`order_address_id`) REFER `shoes_shop/receive_address`(`' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `order_id` int(11) NOT NULL    ,
  `shoes_detail_id` int(11) NOT NULL    ,
  `quality` int(255) NULL DEFAULT NULL,
  `order_shoes_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鞋子颜色',
  `order_shoes_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鞋子尺码',
  PRIMARY KEY USING BTREE (`order_id`, `shoes_detail_id`),
  INDEX `fk_detail_order` USING BTREE(`shoes_detail_id`),
  CONSTRAINT `fk_detail_order` FOREIGN KEY (`shoes_detail_id`) REFERENCES `shoes_detail` (`shoes_detail_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `myorder` (`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`shoes_detail_id`) REFER `shoes_shop/shoes_detail`(`shoe' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for receive_address
-- ----------------------------
DROP TABLE IF EXISTS `receive_address`;
CREATE TABLE `receive_address`  (
  `address_id` int(11) NOT NULL     COMMENT '收件地址id',
  `address_province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `address_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `address_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `address_street` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
  `address_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `address_post_code` int(10) NULL DEFAULT NULL COMMENT '邮政编码',
  `address_recipient_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `address_recipient_telno` bigint(11) NULL DEFAULT NULL COMMENT '收件人电话',
  `is_default_address` int(1) NULL DEFAULT NULL COMMENT '是否设置为默认收件地址',
  `cust_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY USING BTREE (`address_id`),
  INDEX `fk_addr_cust` USING BTREE(`cust_id`),
  CONSTRAINT `receive_address_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`cust_id`) REFER `shoes_shop/customer`(`cust_id`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shoes
-- ----------------------------
DROP TABLE IF EXISTS `shoes`;
CREATE TABLE `shoes`  (
  `shoes_id` int(11) NOT NULL     COMMENT '鞋ID',
  `shoes_number` int(11) NULL DEFAULT NULL COMMENT '鞋款号',
  `shoes_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鞋名称',
  `shoes_price_sale` float(10, 2) NULL DEFAULT NULL COMMENT '吊牌价',
  `shoes_discount` float(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `shoes_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鞋描述',
  `shoes_onsale_time` date NULL DEFAULT NULL COMMENT '上架时间',
  `shoes_offsale_time` date NULL DEFAULT NULL COMMENT '下架时间',
  `shoes_sale_count` int(10) NULL DEFAULT NULL COMMENT '鞋销量',
  `shoes_gender` tinyint(255) NULL DEFAULT NULL COMMENT '适用性别（0：男性，1：女性，2：通用）',
  `shoes_status` tinyint(255) NULL DEFAULT NULL COMMENT '鞋状态（0：在售，1：下架）',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '鞋类别ID',
  PRIMARY KEY USING BTREE (`shoes_id`),
  INDEX `fk_category_shoes` USING BTREE(`category_id`),
  CONSTRAINT `fk_category_shoes` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`category_id`) REFER `shoes_shop/category`(`category_id`' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shoes_color
-- ----------------------------
DROP TABLE IF EXISTS `shoes_color`;
CREATE TABLE `shoes_color`  (
  `shoes_color_id` int(11) NOT NULL    ,
  `shoes_color_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shoes_color_status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`shoes_color_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shoes_detail
-- ----------------------------
DROP TABLE IF EXISTS `shoes_detail`;
CREATE TABLE `shoes_detail`  (
  `shoes_detail_id` int(255) NOT NULL    ,
  `shoes_id` int(11) NULL DEFAULT NULL,
  `shoes_color_id` int(255) NULL DEFAULT NULL,
  `shoes_size_id` int(11) NULL DEFAULT NULL,
  `shoes_inventory` int(255) NULL DEFAULT NULL,
  `shoes_sale_count` int(255) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`shoes_detail_id`),
  INDEX `fk_detail_color` USING BTREE(`shoes_color_id`),
  INDEX `fk_detail_size` USING BTREE(`shoes_size_id`),
  INDEX `fk_detail_shoes` USING BTREE(`shoes_id`),
  CONSTRAINT `fk_detail_color` FOREIGN KEY (`shoes_color_id`) REFERENCES `shoes_color` (`shoes_color_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_detail_shoes` FOREIGN KEY (`shoes_id`) REFERENCES `shoes` (`shoes_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_detail_size` FOREIGN KEY (`shoes_size_id`) REFERENCES `shoes_size` (`shoes_size_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`shoes_color_id`) REFER `shoes_shop/shoes_color`(`shoes_' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shoes_img
-- ----------------------------
DROP TABLE IF EXISTS `shoes_img`;
CREATE TABLE `shoes_img`  (
  `img_id` int(11) NOT NULL DEFAULT 0,
  `shoes_id` int(11) NULL DEFAULT NULL,
  `img_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_no` int(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`img_id`),
  INDEX `fk_img_shooes` USING BTREE(`shoes_id`),
  CONSTRAINT `fk_img_shooes` FOREIGN KEY (`shoes_id`) REFERENCES `shoes` (`shoes_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 11264 kB; (`shoes_id`) REFER `shoes_shop/shoes`(`shoes_id`) ON UPDA' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shoes_size
-- ----------------------------
DROP TABLE IF EXISTS `shoes_size`;
CREATE TABLE `shoes_size`  (
  `shoes_size_id` int(11) NOT NULL    ,
  `shoes_size` float NULL DEFAULT NULL,
  `shoes_state` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`shoes_size_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
