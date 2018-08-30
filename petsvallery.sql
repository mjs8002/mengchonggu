/*
 Navicat MySQL Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : petsvallery

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 25/08/2018 15:19:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for after_sale_service
-- ----------------------------
DROP TABLE IF EXISTS `after_sale_service`;
CREATE TABLE `after_sale_service`  (
  `ass_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '售后服务ID',
  `cust_id` int(11) NOT NULL COMMENT '用户ID',
  `ass_details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务内容',
  `ass_state` int(11) NOT NULL DEFAULT 0 COMMENT '服务状态',
  `ass_evaluate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务结果评价',
  PRIMARY KEY (`ass_id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  CONSTRAINT `after_sale_service_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for appeal
-- ----------------------------
DROP TABLE IF EXISTS `appeal`;
CREATE TABLE `appeal`  (
  `apl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申诉ID',
  `apl_time` datetime NOT NULL COMMENT '申诉时间',
  `pun_id` int(11) NOT NULL COMMENT '处罚ID',
  `apl_result` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '受理结果',
  `result_time` datetime NULL DEFAULT NULL COMMENT '受理时间',
  `cust_id` int(11) NULL DEFAULT NULL COMMENT '受理人',
  `apl_state` int(11) NOT NULL DEFAULT 0 COMMENT '受理状态',
  PRIMARY KEY (`apl_id`) USING BTREE,
  INDEX `pun_id`(`pun_id`) USING BTREE,
  CONSTRAINT `appeal_ibfk_1` FOREIGN KEY (`pun_id`) REFERENCES `punishment` (`pun_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请表ID',
  `service_id` int(11) NULL DEFAULT NULL COMMENT '服务ID',
  `foster_id` int(11) NULL DEFAULT NULL COMMENT '领养寄养宠物ID',
  `apply_cust_id` int(11) NOT NULL COMMENT '申请用户ID',
  `apply_state` int(11) NOT NULL DEFAULT 0 COMMENT '申请审批状态',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `apply_classify` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请类别',
  `apply_schedule` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '完成进度',
  PRIMARY KEY (`apply_id`) USING BTREE,
  INDEX `service_id`(`service_id`) USING BTREE,
  INDEX `apply_cust_id`(`apply_cust_id`) USING BTREE,
  INDEX `apply_ibfk_3`(`foster_id`) USING BTREE,
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`apply_cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apply_ibfk_3` FOREIGN KEY (`foster_id`) REFERENCES `foster` (`foster_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for beauty_room
-- ----------------------------
DROP TABLE IF EXISTS `beauty_room`;
CREATE TABLE `beauty_room`  (
  `br_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '美容室ID',
  `br_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美容室名',
  `br_tele` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `br_place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美容室位置',
  `beauty_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '美容室照片',
  `beauty_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '美容室简介',
  `cust_id` int(11) NOT NULL COMMENT '美容师ID',
  `beauty_state` int(11) NOT NULL DEFAULT 0 COMMENT '美容室状态',
  PRIMARY KEY (`br_id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  CONSTRAINT `beauty_room_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for claim
-- ----------------------------
DROP TABLE IF EXISTS `claim`;
CREATE TABLE `claim`  (
  `claim_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '认领ID',
  `cust_id` int(11) NOT NULL COMMENT '用户ID',
  `claim_time` datetime NOT NULL COMMENT '捡到时间',
  `claim_place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '捡到地方',
  `claim_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细信息',
  `claim_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物照片',
  `claim_tele` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `claim_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`claim_id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  CONSTRAINT `claim_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `post_id` int(11) NOT NULL COMMENT '帖子ID',
  `cust_id` int(11) NOT NULL COMMENT '用户ID',
  `comm_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `comm_time` datetime NOT NULL COMMENT '评论时间',
  `comm_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`comm_id`) USING BTREE,
  INDEX `post_id`(`post_id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for community_dynamics
-- ----------------------------
DROP TABLE IF EXISTS `community_dynamics`;
CREATE TABLE `community_dynamics`  (
  `cd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '健康表ID',
  `pet_id` int(11) NOT NULL COMMENT '宠物ID',
  `doc_id` int(11) NULL DEFAULT NULL COMMENT '就医ID',
  `vacc_id` int(11) NULL DEFAULT NULL COMMENT '疫苗ID',
  `cd_detatil` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '健康情况',
  PRIMARY KEY (`cd_id`) USING BTREE,
  INDEX `pet_id`(`pet_id`) USING BTREE,
  INDEX `doc_id`(`doc_id`) USING BTREE,
  INDEX `vacc_id`(`vacc_id`) USING BTREE,
  CONSTRAINT `community_dynamics_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `community_dynamics_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `community_dynamics_ibfk_3` FOREIGN KEY (`vacc_id`) REFERENCES `vaccine` (`vacc_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `cust_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cust_pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 用户密码',
  `cust_age` int(11) NULL DEFAULT NULL COMMENT '用户年龄',
  `cust_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `cus_gender` int(11) NOT NULL COMMENT '用户性别',
  `cust_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `cust_create_time` date NOT NULL COMMENT '用户注册时间',
  `cust_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `cust_integral` int(11) NOT NULL COMMENT '用户积分',
  `cust_role` int(11) NOT NULL COMMENT '用户角色',
  `cust_state` int(11) NOT NULL COMMENT '用户状态',
  PRIMARY KEY (`cust_id`) USING BTREE,
  UNIQUE INDEX `cust_id`(`cust_id`, `cust_name`, `cust_phone`, `cust_email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for disc
-- ----------------------------
DROP TABLE IF EXISTS `disc`;
CREATE TABLE `disc`  (
  `disc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科类ID',
  `disc_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科类名',
  `disc_state` int(11) NOT NULL DEFAULT 0 COMMENT '科类状态',
  PRIMARY KEY (`disc_id`) USING BTREE,
  UNIQUE INDEX `disc_id`(`disc_id`, `disc_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '就医ID',
  `doc_pet_id` int(11) NOT NULL COMMENT '就医宠物ID',
  `doc_time` datetime NOT NULL COMMENT '就医时间',
  `doc_loc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '就医地点',
  `doc_detalis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '就医细节',
  `doc_state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`doc_id`) USING BTREE,
  INDEX `doc_pet_id`(`doc_pet_id`) USING BTREE,
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doc_pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for find_pet
-- ----------------------------
DROP TABLE IF EXISTS `find_pet`;
CREATE TABLE `find_pet`  (
  `fp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '寻宠ID',
  `pet_id` int(11) NOT NULL COMMENT '宠物ID',
  `fp_time` datetime NOT NULL COMMENT '丢失时间',
  `fp_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '丢失信息',
  `fp_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '丢失地点',
  `fp_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物照片',
  `fp_reward` int(11) NULL DEFAULT 0 COMMENT '悬赏金额',
  `fp_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `fp_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`fp_id`) USING BTREE,
  INDEX `pet_id`(`pet_id`) USING BTREE,
  CONSTRAINT `find_pet_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for foster
-- ----------------------------
DROP TABLE IF EXISTS `foster`;
CREATE TABLE `foster`  (
  `foster_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '寄养ID',
  `foster_cust_id` int(11) NOT NULL COMMENT '寄养用户ID',
  `foster_pet_id` int(11) NOT NULL COMMENT '寄养宠物ID',
  `foster_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄养宠物信息',
  `foster_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '寄养原因',
  `foster_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 寄养宠物图片',
  `foster_state` int(11) NOT NULL DEFAULT 0 COMMENT '寄养状态',
  PRIMARY KEY (`foster_id`) USING BTREE,
  INDEX `foster_cust_id`(`foster_cust_id`) USING BTREE,
  INDEX `foster_pet_id`(`foster_pet_id`) USING BTREE,
  CONSTRAINT `foster_ibfk_1` FOREIGN KEY (`foster_cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foster_ibfk_2` FOREIGN KEY (`foster_pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital`  (
  `hos_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医疗室ID',
  `hos_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医疗室名字',
  `hos_tele` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `hos_place` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医疗室地址',
  `cust_id` int(11) NOT NULL COMMENT '宠物医生ID',
  `hos_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医疗室照片',
  `hos_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医疗室简介',
  `hos_state` int(11) NOT NULL DEFAULT 0 COMMENT '医疗室状态',
  PRIMARY KEY (`hos_id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for insurance
-- ----------------------------
DROP TABLE IF EXISTS `insurance`;
CREATE TABLE `insurance`  (
  `ins_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '保险ID',
  `pet_id` int(11) NOT NULL COMMENT '宠物ID',
  `ic_id` int(11) NOT NULL COMMENT '保险类别ID',
  `ins_time` datetime NOT NULL COMMENT '投保时间',
  `ins_money` double NOT NULL COMMENT '投保金额',
  `ins_com_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司名称',
  `ins_state` int(11) NOT NULL DEFAULT 0 COMMENT '投保状态',
  PRIMARY KEY (`ins_id`) USING BTREE,
  INDEX `cust_id`(`pet_id`) USING BTREE,
  INDEX `ic_id`(`ic_id`) USING BTREE,
  CONSTRAINT `insurance_ibfk_2` FOREIGN KEY (`ic_id`) REFERENCES `insurance_category` (`ic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `insurance_ibfk_3` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for insurance_category
-- ----------------------------
DROP TABLE IF EXISTS `insurance_category`;
CREATE TABLE `insurance_category`  (
  `ic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '保险类别ID',
  `ic_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险类别名称',
  `ic_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险内容',
  `ic_EFFtime` datetime NOT NULL COMMENT '有效时间',
  `ic_state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`ic_id`) USING BTREE,
  UNIQUE INDEX `ic_type_name`(`ic_type_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for match
-- ----------------------------
DROP TABLE IF EXISTS `match`;
CREATE TABLE `match`  (
  `match_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '匹配ID',
  `pet_id` int(11) NOT NULL COMMENT '宠物ID',
  `couple_pet_id` int(11) NULL DEFAULT NULL COMMENT '配偶ID',
  `partner_pet_id` int(11) NULL DEFAULT NULL COMMENT '伙伴ID',
  `match_state` int(11) NOT NULL DEFAULT 0 COMMENT '匹配状态',
  PRIMARY KEY (`match_id`) USING BTREE,
  UNIQUE INDEX `pet_id`(`pet_id`) USING BTREE,
  INDEX `couple_pet_id`(`couple_pet_id`) USING BTREE,
  INDEX `partner_pet_id`(`partner_pet_id`) USING BTREE,
  CONSTRAINT `match_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `match_ibfk_2` FOREIGN KEY (`couple_pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `match_ibfk_3` FOREIGN KEY (`partner_pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet`  (
  `pet_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物ID',
  `cust_id` int(11) NOT NULL COMMENT '用户ID',
  `pet_mate_state` int(11) NOT NULL DEFAULT 0 COMMENT '配偶状态',
  `pet_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物姓名',
  `pet_gender` int(11) NOT NULL COMMENT '宠物性别',
  `pet_age` int(11) NULL DEFAULT NULL COMMENT '宠物年龄',
  `pet_type_id` int(11) NOT NULL COMMENT '种类ID',
  `pet_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物图片',
  `pet_weight` double NULL DEFAULT NULL COMMENT '宠物体重',
  `pet_state` int(11) NOT NULL DEFAULT 0 COMMENT '宠物状态',
  PRIMARY KEY (`pet_id`) USING BTREE,
  UNIQUE INDEX `pet_id`(`pet_id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  INDEX `pet_type_id`(`pet_type_id`) USING BTREE,
  CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pet_ibfk_2` FOREIGN KEY (`pet_type_id`) REFERENCES `pet_type` (`type_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pet_type
-- ----------------------------
DROP TABLE IF EXISTS `pet_type`;
CREATE TABLE `pet_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '种类ID',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类名称',
  `type_state` int(11) NOT NULL DEFAULT 0 COMMENT '种类状态',
  `disc_id` int(11) NOT NULL COMMENT '科类ID',
  PRIMARY KEY (`type_id`) USING BTREE,
  UNIQUE INDEX `type_id`(`type_id`, `type_name`) USING BTREE,
  INDEX `disc_id`(`disc_id`) USING BTREE,
  CONSTRAINT `pet_type_ibfk_1` FOREIGN KEY (`disc_id`) REFERENCES `disc` (`disc_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for physicals
-- ----------------------------
DROP TABLE IF EXISTS `physicals`;
CREATE TABLE `physicals`  (
  `phy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '体检ID',
  `pet_id` int(11) NOT NULL COMMENT '宠物ID',
  `phy_time` datetime NOT NULL COMMENT '体检时间',
  `phy_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '体检类型',
  `phy_loc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '体检地点',
  `phy_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '体检结果信息',
  `phy_state` int(11) NOT NULL DEFAULT 0 COMMENT '体检状态',
  PRIMARY KEY (`phy_id`) USING BTREE,
  INDEX `pet_id`(`pet_id`) USING BTREE,
  CONSTRAINT `physicals_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `cust_id` int(11) NOT NULL COMMENT '用户ID',
  `post_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子标题',
  `post_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子内容',
  `post_time` datetime NOT NULL COMMENT '发表时间',
  `post_count` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `post_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `post_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for protuct
-- ----------------------------
DROP TABLE IF EXISTS `protuct`;
CREATE TABLE `protuct`  (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品推荐ID',
  `pro_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `pro_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类型',
  `pro_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品信息',
  `pro_price` double NOT NULL COMMENT '商品市场价格',
  `pro_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `pro_buy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买方式',
  `pro_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`pro_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for punishment
-- ----------------------------
DROP TABLE IF EXISTS `punishment`;
CREATE TABLE `punishment`  (
  `pun_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '处罚ID',
  `cust_id` int(11) NOT NULL COMMENT '用户ID',
  `reg_id` int(11) NOT NULL COMMENT '规定ID',
  `irregularities_time` datetime NOT NULL COMMENT '违规时间',
  `pun_time` datetime NOT NULL COMMENT '处罚时间',
  `pun_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处罚内容',
  `pun_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处罚结果',
  `pun_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`pun_id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  INDEX `reg_id`(`reg_id`) USING BTREE,
  CONSTRAINT `punishment_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `punishment_ibfk_2` FOREIGN KEY (`reg_id`) REFERENCES `regulations` (`reg_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for regulations
-- ----------------------------
DROP TABLE IF EXISTS `regulations`;
CREATE TABLE `regulations`  (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规定ID',
  `reg_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规定内容',
  `reg_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '法规标题',
  `reg_department` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关部门',
  `pun_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处罚内容',
  `reg_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`reg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service`  (
  `service_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务ID',
  `service_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务标题',
  `service_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务内容',
  `service_reward` int(11) NOT NULL COMMENT '积分奖励',
  `service_no` int(11) NOT NULL COMMENT '需求人数',
  `service_time` datetime NOT NULL COMMENT '发布日期',
  `service_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`service_id`) USING BTREE,
  UNIQUE INDEX `service_id`(`service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy`  (
  `stra_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '攻略ID',
  `stra_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '攻略类型',
  `stra_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '攻略标题',
  `stra_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '攻略内容',
  `stra_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '攻略照片',
  `stra_time` datetime NOT NULL COMMENT '发布日期',
  `stra_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`stra_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for system_message
-- ----------------------------
DROP TABLE IF EXISTS `system_message`;
CREATE TABLE `system_message`  (
  `system_message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `system_message_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `system_message_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `system_message_time` datetime NOT NULL COMMENT '发送消息时间',
  PRIMARY KEY (`system_message_id`) USING BTREE,
  UNIQUE INDEX `system_message_id`(`system_message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vaccine
-- ----------------------------
DROP TABLE IF EXISTS `vaccine`;
CREATE TABLE `vaccine`  (
  `vacc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '疫苗ID',
  `pet_id` int(11) NOT NULL COMMENT '宠物ID',
  `vacc_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '疫苗类型',
  `vacc_time` datetime NOT NULL COMMENT '注射时间',
  `vacc_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体信息',
  `vacc_state` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`vacc_id`) USING BTREE,
  INDEX `pet_id`(`pet_id`) USING BTREE,
  CONSTRAINT `vaccine_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
