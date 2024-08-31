/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : kazeadmin

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 31/08/2024 18:08:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keepAlive` tinyint(4) NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否展示在页面菜单',
  `enable` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_30e166e8c6359970755c5727a2`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '侧边菜单', 'Resource_Mgt', 'MENU', 2, '/pms/resource', NULL, 'i-fe:list', '/src/views/pms/resource/index.vue', NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (2, '管理', 'SysMgt', 'MENU', NULL, NULL, NULL, 'i-fe:settings', NULL, NULL, NULL, NULL, NULL, 1, 1, 50);
INSERT INTO `permission` VALUES (3, '权限管理', 'RoleMgt', 'MENU', 2, '/pms/role', NULL, 'i-fe:user-check', '/src/views/pms/role/index.vue', NULL, NULL, NULL, NULL, 1, 1, 2);
INSERT INTO `permission` VALUES (4, '用户管理', 'UserMgt', 'MENU', 2, '/pms/user', NULL, 'i-fe:user', '/src/views/pms/user/index.vue', NULL, 1, NULL, NULL, 1, 1, 3);
INSERT INTO `permission` VALUES (5, '分配用户', 'RoleUser', 'MENU', 3, '/pms/role/user/:roleId', NULL, 'i-fe:user-plus', '/src/views/pms/role/role-user.vue', 'full', NULL, NULL, NULL, 0, 1, 1);
INSERT INTO `permission` VALUES (6, '示例', 'Demo', 'MENU', NULL, NULL, NULL, 'i-fe:trello', NULL, NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO `permission` VALUES (7, '图片上传', 'ImgUpload', 'MENU', 6, '/demo/upload', NULL, 'i-fe:image', '/src/views/demo/upload/index.vue', '', 1, NULL, NULL, 1, 1, 2);
INSERT INTO `permission` VALUES (8, '个人资料', 'UserProfile', 'MENU', NULL, '/profile', NULL, 'i-fe:user', '/src/views/profile/index.vue', NULL, NULL, NULL, NULL, 0, 1, 99);
INSERT INTO `permission` VALUES (9, '组件', 'Base', 'MENU', NULL, '', NULL, 'i-fe:package', NULL, '', NULL, NULL, NULL, 1, 1, 3);
INSERT INTO `permission` VALUES (10, '基础组件', 'BaseComponents', 'MENU', 9, '/base/components', NULL, 'i-me:awesome', '/src/views/base/index.vue', NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (11, 'Unocss', 'Unocss', 'MENU', 9, '/base/unocss', NULL, 'i-me:awesome', '/src/views/base/unocss.vue', NULL, NULL, NULL, NULL, 1, 1, 2);
INSERT INTO `permission` VALUES (12, 'KeepAlive', 'KeepAlive', 'MENU', 9, '/base/keep-alive', NULL, 'i-me:awesome', '/src/views/base/keep-alive.vue', NULL, 1, NULL, NULL, 1, 1, 3);
INSERT INTO `permission` VALUES (13, '创建新用户', 'AddUser', 'BUTTON', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (14, '图标 Icon', 'Icon', 'MENU', 9, '/base/icon', NULL, 'i-fe:feather', '/src/views/base/unocss-icon.vue', '', NULL, NULL, NULL, 1, 1, 0);
INSERT INTO `permission` VALUES (15, 'MeModal', 'TestModal', 'MENU', 9, '/testModal', NULL, 'i-me:dialog', '/src/views/base/test-modal.vue', NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO `permission` VALUES (21, '项目', 'Project', 'MENU', NULL, NULL, NULL, 'i-fe:zap', NULL, '', NULL, NULL, NULL, 1, 1, 0);
INSERT INTO `permission` VALUES (22, 'NekoSQL', 'NekoSQL', 'MENU', 21, '/nekosql', NULL, 'i-fe:database', '/src/views/nekosql/index.vue', '', NULL, NULL, NULL, 1, 1, 0);

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` int(11) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `nickName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_a24972ebd73b106250713dcddd`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, 1, 'https://testingcf.jsdelivr.net/gh/4444TENSEI/CDN@master/img/avatar/AngelDog/AngelDog-square.png', NULL, NULL, 1, 'Yokaze');
INSERT INTO `profile` VALUES (2, 2, 'https://cravatar.cn/avatar/86179613331c868f65ca34a84a221bc4?d=identicon&s=96', NULL, NULL, 2, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enable` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_ee999bb389d7ac0fd967172c41`(`code`) USING BTREE,
  UNIQUE INDEX `IDX_ae4578dcaed5adff96595e6166`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'SUPER_ADMIN', '熊二', 1);
INSERT INTO `role` VALUES (2, 'ROLE_QA', '熊大', 1);

-- ----------------------------
-- Table structure for role_permissions_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions_permission`;
CREATE TABLE `role_permissions_permission`  (
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`, `permissionId`) USING BTREE,
  INDEX `IDX_b36cb2e04bc353ca4ede00d87b`(`roleId`) USING BTREE,
  INDEX `IDX_bfbc9e263d4cea6d7a8c9eb3ad`(`permissionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permissions_permission
-- ----------------------------
INSERT INTO `role_permissions_permission` VALUES (2, 1);
INSERT INTO `role_permissions_permission` VALUES (2, 2);
INSERT INTO `role_permissions_permission` VALUES (2, 3);
INSERT INTO `role_permissions_permission` VALUES (2, 4);
INSERT INTO `role_permissions_permission` VALUES (2, 5);
INSERT INTO `role_permissions_permission` VALUES (2, 6);
INSERT INTO `role_permissions_permission` VALUES (2, 7);
INSERT INTO `role_permissions_permission` VALUES (2, 8);
INSERT INTO `role_permissions_permission` VALUES (2, 9);
INSERT INTO `role_permissions_permission` VALUES (2, 10);
INSERT INTO `role_permissions_permission` VALUES (2, 11);
INSERT INTO `role_permissions_permission` VALUES (2, 12);
INSERT INTO `role_permissions_permission` VALUES (2, 13);
INSERT INTO `role_permissions_permission` VALUES (2, 14);
INSERT INTO `role_permissions_permission` VALUES (2, 15);
INSERT INTO `role_permissions_permission` VALUES (2, 21);
INSERT INTO `role_permissions_permission` VALUES (2, 22);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enable` tinyint(4) NOT NULL DEFAULT 1,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_78a916df40e02a9deb1c4b75ed`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$H4dW4yOoINCQxXYooIJN9uIDs7gQcMjLmN./1/JFFxj65DnyO3Hpe', 1, '2024-08-31 00:00:00.000000', '2024-08-31 17:07:01.000000');
INSERT INTO `user` VALUES (2, 'hcat', '$2a$10$vxGPPbVZh.wSQdyskiOmCuEwgYSd1yqkk01409Sah1Xlsyg9yFkL6', 1, '2024-08-31 02:20:35.183152', '2024-08-31 02:20:35.183152');

-- ----------------------------
-- Table structure for user_roles_role
-- ----------------------------
DROP TABLE IF EXISTS `user_roles_role`;
CREATE TABLE `user_roles_role`  (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `IDX_5f9286e6c25594c6b88c108db7`(`userId`) USING BTREE,
  INDEX `IDX_4be2f7adf862634f5f803d246b`(`roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_roles_role
-- ----------------------------
INSERT INTO `user_roles_role` VALUES (1, 1);
INSERT INTO `user_roles_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
