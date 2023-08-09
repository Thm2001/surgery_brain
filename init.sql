/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50741
 Source Host           : localhost:3306
 Source Schema         : zhihuishoshudanao

 Target Server Type    : MySQL
 Target Server Version : 50741
 File Encoding         : 65001

 Date: 13/05/2023 16:25:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrative_office
-- ----------------------------
DROP TABLE IF EXISTS `administrative_office`;
CREATE TABLE `administrative_office`  (
  `id` int(12) NOT NULL,
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrative_office
-- ----------------------------
INSERT INTO `administrative_office` VALUES (1, '产科');
INSERT INTO `administrative_office` VALUES (2, '妇科');
INSERT INTO `administrative_office` VALUES (3, '耳鼻咽喉头颈外科');
INSERT INTO `administrative_office` VALUES (4, '骨科关节');
INSERT INTO `administrative_office` VALUES (5, '骨科脊柱');
INSERT INTO `administrative_office` VALUES (6, '泌尿外科');
INSERT INTO `administrative_office` VALUES (7, '普外肝胆胰外科');
INSERT INTO `administrative_office` VALUES (8, '普外甲乳外科');
INSERT INTO `administrative_office` VALUES (9, '普外胃肠外科');
INSERT INTO `administrative_office` VALUES (10, '胸外科');
INSERT INTO `administrative_office` VALUES (11, '普外疝儿外科');
INSERT INTO `administrative_office` VALUES (12, '肾脏内科');
INSERT INTO `administrative_office` VALUES (13, '口腔科');
INSERT INTO `administrative_office` VALUES (14, '创伤中心');
INSERT INTO `administrative_office` VALUES (15, '骨科创伤');

-- ----------------------------
-- Table structure for doctor_info  医生信息表
-- ----------------------------
DROP TABLE IF EXISTS `doctor_info`;
CREATE TABLE `doctor_info`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `doctor` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subordinate_medical_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor_info
-- ----------------------------
INSERT INTO `doctor_info` VALUES (1, '佘程晨', '产科', '产科孔祥医疗组');
INSERT INTO `doctor_info` VALUES (2, '宋晶哲', '产科', '产科孔祥医疗组');
INSERT INTO `doctor_info` VALUES (3, '孔祥', '产科', '产科孔祥医疗组');
INSERT INTO `doctor_info` VALUES (4, '周玲', '产科', '产科卢丹医疗组');
INSERT INTO `doctor_info` VALUES (5, '张艳馨', '产科', '产科卢丹医疗组');
INSERT INTO `doctor_info` VALUES (6, '卢丹', '产科', '产科卢丹医疗组');
INSERT INTO `doctor_info` VALUES (7, '高鹰', '产科', '产科张立英医疗组');
INSERT INTO `doctor_info` VALUES (8, '陈晓娟', '产科', '产科张立英医疗组');
INSERT INTO `doctor_info` VALUES (9, '张立英', '产科', '产科张立英医疗组');
INSERT INTO `doctor_info` VALUES (10, '赵季伟', '创伤中心', '创伤中心王骅医疗组');
INSERT INTO `doctor_info` VALUES (11, '孙浩', '创伤中心', '创伤中心王骅医疗组');
INSERT INTO `doctor_info` VALUES (12, '施学强', '创伤中心', '创伤中心王骅医疗组');
INSERT INTO `doctor_info` VALUES (13, '胡金龙', '创伤中心', '创伤中心王骅医疗组');
INSERT INTO `doctor_info` VALUES (14, '王旭', '创伤中心', '创伤中心王骅医疗组');
INSERT INTO `doctor_info` VALUES (15, '张富荣', '创伤中心', '创伤中心王骅医疗组');
INSERT INTO `doctor_info` VALUES (16, '韩洋', '创伤中心', '创伤中心王骅医疗组');
INSERT INTO `doctor_info` VALUES (17, '王骅', '创伤中心', '创伤中心王骅医疗组');
INSERT INTO `doctor_info` VALUES (18, '简雪梅', '耳鼻咽喉头颈外科', '耳鼻喉科公共医疗组');
INSERT INTO `doctor_info` VALUES (19, '袁玲', '耳鼻咽喉头颈外科', '耳鼻喉科公共医疗组');
INSERT INTO `doctor_info` VALUES (20, '刘葆', '耳鼻咽喉头颈外科', '耳鼻喉科公共医疗组');
INSERT INTO `doctor_info` VALUES (21, '罗兰', '耳鼻咽喉头颈外科', '耳鼻喉科公共医疗组');
INSERT INTO `doctor_info` VALUES (22, '曹诗瑶', '耳鼻咽喉头颈外科', '耳鼻喉科公共医疗组');
INSERT INTO `doctor_info` VALUES (23, '严齐', '耳鼻咽喉头颈外科', '耳鼻喉科关兵医疗组');
INSERT INTO `doctor_info` VALUES (24, '常玲美', '耳鼻咽喉头颈外科', '耳鼻喉科关兵医疗组');
INSERT INTO `doctor_info` VALUES (25, '关兵', '耳鼻咽喉头颈外科', '耳鼻喉科关兵医疗组');
INSERT INTO `doctor_info` VALUES (26, '马伟', '耳鼻咽喉头颈外科', '耳鼻喉科关兵医疗组');
INSERT INTO `doctor_info` VALUES (27, '王树伦', '耳鼻咽喉头颈外科', '耳鼻喉科关兵医疗组');
INSERT INTO `doctor_info` VALUES (28, '王鹏', '耳鼻咽喉头颈外科', '耳鼻喉科关兵医疗组');
INSERT INTO `doctor_info` VALUES (29, '朱斌', '耳鼻咽喉头颈外科', '耳鼻喉科徐丽医疗组');
INSERT INTO `doctor_info` VALUES (30, '张俊中', '耳鼻咽喉头颈外科', '耳鼻喉科徐丽医疗组');
INSERT INTO `doctor_info` VALUES (31, '徐丽', '耳鼻咽喉头颈外科', '耳鼻喉科徐丽医疗组');
INSERT INTO `doctor_info` VALUES (32, '于爱民', '耳鼻咽喉头颈外科', '耳鼻喉科于爱民医疗组');
INSERT INTO `doctor_info` VALUES (33, '居富年', '耳鼻咽喉头颈外科', '耳鼻喉科于爱民医疗组');
INSERT INTO `doctor_info` VALUES (34, '张文韬', '耳鼻咽喉头颈外科', '耳鼻喉科于爱民医疗组');
INSERT INTO `doctor_info` VALUES (35, '孙海勇', '耳鼻咽喉头颈外科', '耳鼻喉科于爱民医疗组');
INSERT INTO `doctor_info` VALUES (36, '董乃俊', '妇科', '妇科董乃俊医疗组');
INSERT INTO `doctor_info` VALUES (37, '曹孟', '妇科', '妇科董乃俊医疗组');
INSERT INTO `doctor_info` VALUES (38, '杨春霞', '妇科', '妇科董乃俊医疗组');
INSERT INTO `doctor_info` VALUES (39, '顾扬', '妇科', '妇科公共医疗组');
INSERT INTO `doctor_info` VALUES (40, '张赛男', '妇科', '妇科顾建娟医疗组');
INSERT INTO `doctor_info` VALUES (41, '吴静怡', '妇科', '妇科顾建娟医疗组');
INSERT INTO `doctor_info` VALUES (42, '顾建娟', '妇科', '妇科顾建娟医疗组');
INSERT INTO `doctor_info` VALUES (43, '蒋敏', '妇科', '妇科黄永生医疗组');
INSERT INTO `doctor_info` VALUES (44, '黄永生', '妇科', '妇科黄永生医疗组');
INSERT INTO `doctor_info` VALUES (45, '陈蓉蓉', '妇科', '妇科黄永生医疗组');
INSERT INTO `doctor_info` VALUES (46, '刘萍', '妇科', '妇科潘九林医疗组');
INSERT INTO `doctor_info` VALUES (47, '潘九林', '妇科', '妇科潘九林医疗组');
INSERT INTO `doctor_info` VALUES (48, '吴雅娟', '妇科', '妇科孙桂芳医疗组');
INSERT INTO `doctor_info` VALUES (49, '孙桂芳', '妇科', '妇科孙桂芳医疗组');
INSERT INTO `doctor_info` VALUES (50, '王倩', '妇科', '妇科孙桂芳医疗组');
INSERT INTO `doctor_info` VALUES (51, '王卫杰', '妇科', '妇科王志学医疗组');
INSERT INTO `doctor_info` VALUES (52, '高玲玲', '妇科', '妇科王志学医疗组');
INSERT INTO `doctor_info` VALUES (53, '徐建波', '妇科', '妇科王志学医疗组');
INSERT INTO `doctor_info` VALUES (54, '刘雅雯', '妇科', '妇科王志学医疗组');
INSERT INTO `doctor_info` VALUES (55, '王志学', '妇科', '妇科王志学医疗组');
INSERT INTO `doctor_info` VALUES (56, '高俊', '妇科', '妇科尹香花医疗组');
INSERT INTO `doctor_info` VALUES (57, '尹香花', '妇科', '妇科尹香花医疗组');
INSERT INTO `doctor_info` VALUES (58, '韩奎敬', '骨科创伤', '骨科创伤陈鹏涛医疗组');
INSERT INTO `doctor_info` VALUES (59, '陈鹏涛', '骨科创伤', '骨科创伤陈鹏涛医疗组');
INSERT INTO `doctor_info` VALUES (60, '张文东', '骨科创伤', '骨科创伤陈鹏涛医疗组');
INSERT INTO `doctor_info` VALUES (61, '朱磊', '骨科创伤', '骨科创伤方永超医疗组');
INSERT INTO `doctor_info` VALUES (62, '方永超', '骨科创伤', '骨科创伤方永超医疗组');
INSERT INTO `doctor_info` VALUES (63, '杨立勋', '骨科创伤', '骨科创伤高红伟医疗组');
INSERT INTO `doctor_info` VALUES (64, '高红伟', '骨科创伤', '骨科创伤高红伟医疗组');
INSERT INTO `doctor_info` VALUES (65, '何金山', '骨科创伤', '骨科创伤公共医疗组');
INSERT INTO `doctor_info` VALUES (66, '陈佳鑫', '骨科创伤', '骨科创伤公共医疗组');
INSERT INTO `doctor_info` VALUES (67, '梁远', '骨科创伤', '骨科创伤公共医疗组');
INSERT INTO `doctor_info` VALUES (68, '胡乐', '骨科创伤', '骨科创伤周岳来医疗组');
INSERT INTO `doctor_info` VALUES (69, '李洪达', '骨科创伤', '骨科创伤周岳来医疗组');
INSERT INTO `doctor_info` VALUES (70, '王卓', '骨科创伤', '骨科创伤周岳来医疗组');
INSERT INTO `doctor_info` VALUES (71, '周岳来', '骨科创伤', '骨科创伤周岳来医疗组');
INSERT INTO `doctor_info` VALUES (72, '陈岗', '骨科关节', '骨科关节陈岗医疗组');
INSERT INTO `doctor_info` VALUES (73, '颜连启', '骨科关节', '骨科关节公共医疗组');
INSERT INTO `doctor_info` VALUES (74, '孙钰', '骨科关节', '骨科关节孙钰医疗组');
INSERT INTO `doctor_info` VALUES (75, '陈辉', '骨科关节', '骨科关节孙钰医疗组');
INSERT INTO `doctor_info` VALUES (76, '冯新民', '骨科脊柱', '骨科脊柱公共医疗组');
INSERT INTO `doctor_info` VALUES (77, '张圣飞', '骨科脊柱', '骨科脊柱公共医疗组');
INSERT INTO `doctor_info` VALUES (78, '孙灰灰', '骨科脊柱', '骨科脊柱公共医疗组');
INSERT INTO `doctor_info` VALUES (79, '蔡俊', '骨科脊柱', '骨科脊柱陶玉平医疗组');
INSERT INTO `doctor_info` VALUES (80, '陶玉平', '骨科脊柱', '骨科脊柱陶玉平医疗组');
INSERT INTO `doctor_info` VALUES (81, '黄吉军', '骨科脊柱', '骨科脊柱陶玉平医疗组');
INSERT INTO `doctor_info` VALUES (82, '杨建东', '骨科脊柱', '骨科脊柱杨建东医疗组');
INSERT INTO `doctor_info` VALUES (83, '张亮', '骨科脊柱', '骨科脊柱杨建东医疗组');
INSERT INTO `doctor_info` VALUES (84, '顾加祥', '骨科手足', '骨科手足公共医疗组');
INSERT INTO `doctor_info` VALUES (85, '王斌', '骨科手足', '骨科手足公共医疗组');
INSERT INTO `doctor_info` VALUES (86, '薛孝威', '骨科手足', '骨科手足公共医疗组');
INSERT INTO `doctor_info` VALUES (87, '张文忠', '骨科手足', '骨科手足刘宏君医疗组');
INSERT INTO `doctor_info` VALUES (88, '许涛', '骨科手足', '骨科手足刘宏君医疗组');
INSERT INTO `doctor_info` VALUES (89, '刘宏君', '骨科手足', '骨科手足刘宏君医疗组');
INSERT INTO `doctor_info` VALUES (90, '王天亮', '骨科手足', '骨科手足张乃臣医疗组');
INSERT INTO `doctor_info` VALUES (91, '武文杰', '骨科手足', '骨科手足张乃臣医疗组');
INSERT INTO `doctor_info` VALUES (92, '陆一鸣', '骨科手足', '骨科手足张乃臣医疗组');
INSERT INTO `doctor_info` VALUES (93, '张乃臣', '骨科手足', '骨科手足张乃臣医疗组');
INSERT INTO `doctor_info` VALUES (94, '周渊', '口腔科', '口腔科何海波医疗组');
INSERT INTO `doctor_info` VALUES (95, '杭东跃', '口腔科', '口腔科何海波医疗组');
INSERT INTO `doctor_info` VALUES (96, '吴健', '口腔科', '口腔科何海波医疗组');
INSERT INTO `doctor_info` VALUES (97, '何海波', '口腔科', '口腔科何海波医疗组');
INSERT INTO `doctor_info` VALUES (98, '滕荣林', '口腔科', '口腔科何海波医疗组');
INSERT INTO `doctor_info` VALUES (99, '邱建平', '口腔科', '口腔科邱建平医疗组');
INSERT INTO `doctor_info` VALUES (100, '薛雨', '口腔科', '口腔科邱建平医疗组');
INSERT INTO `doctor_info` VALUES (101, '闫周', '口腔科', '口腔科邱建平医疗组');
INSERT INTO `doctor_info` VALUES (102, '储伟明', '口腔科', '口腔科邱建平医疗组');
INSERT INTO `doctor_info` VALUES (103, '李施园', '口腔科', '口腔科邱建平医疗组');
INSERT INTO `doctor_info` VALUES (104, '朱良勇', '泌尿外科', '泌尿外科丁雪飞医疗组');
INSERT INTO `doctor_info` VALUES (105, '柳长坤', '泌尿外科', '泌尿外科丁雪飞医疗组');
INSERT INTO `doctor_info` VALUES (106, '齐小康', '泌尿外科', '泌尿外科丁雪飞医疗组');
INSERT INTO `doctor_info` VALUES (107, '王业华', '泌尿外科', '泌尿外科丁雪飞医疗组');
INSERT INTO `doctor_info` VALUES (108, '丁雪飞', '泌尿外科', '泌尿外科丁雪飞医疗组');
INSERT INTO `doctor_info` VALUES (109, '黄凯', '泌尿外科', '泌尿外科杨进医疗组');
INSERT INTO `doctor_info` VALUES (110, '姚浩', '泌尿外科', '泌尿外科杨进医疗组');
INSERT INTO `doctor_info` VALUES (111, '顾晓', '泌尿外科', '泌尿外科杨进医疗组');
INSERT INTO `doctor_info` VALUES (112, '栾阳', '泌尿外科', '泌尿外科杨进医疗组');
INSERT INTO `doctor_info` VALUES (113, '杨进', '泌尿外科', '泌尿外科杨进医疗组');
INSERT INTO `doctor_info` VALUES (114, '周广臣', '泌尿外科', '泌尿外科俞俊杰医疗组');
INSERT INTO `doctor_info` VALUES (115, '黄天宝', '泌尿外科', '泌尿外科俞俊杰医疗组');
INSERT INTO `doctor_info` VALUES (116, '俞俊杰', '泌尿外科', '泌尿外科俞俊杰医疗组');
INSERT INTO `doctor_info` VALUES (117, '陶华志', '泌尿外科', '泌尿外科俞俊杰医疗组');
INSERT INTO `doctor_info` VALUES (118, '杜拥军', '泌尿外科', '泌尿外科俞俊杰医疗组');
INSERT INTO `doctor_info` VALUES (119, '卢圣铭', '泌尿外科', '泌尿外科俞俊杰医疗组');
INSERT INTO `doctor_info` VALUES (120, '李振南', '普外肝胆胰外科', '胆胰外科钱建军医疗组');
INSERT INTO `doctor_info` VALUES (121, '钱建军', '普外肝胆胰外科', '胆胰外科钱建军医疗组');
INSERT INTO `doctor_info` VALUES (122, '王小东', '普外肝胆胰外科', '胆胰外科姚捷医疗组');
INSERT INTO `doctor_info` VALUES (123, '姚捷', '普外肝胆胰外科', '胆胰外科姚捷医疗组');
INSERT INTO `doctor_info` VALUES (124, '丁向民', '普外肝胆胰外科', '肝脾外科柏斗胜医疗组');
INSERT INTO `doctor_info` VALUES (125, '金圣杰', '普外肝胆胰外科', '肝脾外科柏斗胜医疗组');
INSERT INTO `doctor_info` VALUES (126, '蒋国庆', '普外肝胆胰外科', '肝脾外科蒋国庆医疗组');
INSERT INTO `doctor_info` VALUES (127, '符德元', '普外甲乳外科', '甲乳外科符德元医疗组');
INSERT INTO `doctor_info` VALUES (128, '徐向楠', '普外甲乳外科', '甲乳外科符德元医疗组');
INSERT INTO `doctor_info` VALUES (129, '汪成成', '普外甲乳外科', '甲乳外科何春兰医疗组');
INSERT INTO `doctor_info` VALUES (130, '何春兰', '普外甲乳外科', '甲乳外科何春兰医疗组');
INSERT INTO `doctor_info` VALUES (131, '邵稳喜', '普外甲乳外科', '甲乳外科邵稳喜医疗组');
INSERT INTO `doctor_info` VALUES (132, '李春莲', '普外甲乳外科', '甲乳外科邵稳喜医疗组');
INSERT INTO `doctor_info` VALUES (133, '章佳新', '普外甲乳外科', '甲乳外科章佳新医疗组');
INSERT INTO `doctor_info` VALUES (134, '蔡凤林', '普外甲乳外科', '甲乳外科章佳新医疗组');
INSERT INTO `doctor_info` VALUES (135, '王雪莹', '普外甲乳外科', '甲乳外科祝玉祥医疗组');
INSERT INTO `doctor_info` VALUES (136, '祝玉祥', '普外甲乳外科', '甲乳外科祝玉祥医疗组');
INSERT INTO `doctor_info` VALUES (137, '李东升', '普外疝儿外科', '疝儿外科公共医疗组');
INSERT INTO `doctor_info` VALUES (138, '姚曳', '普外疝儿外科', '疝儿外科公共医疗组');
INSERT INTO `doctor_info` VALUES (139, '王绘楠', '普外疝儿外科', '疝儿外科李东升医疗组');
INSERT INTO `doctor_info` VALUES (140, '汤劲松', '普外疝儿外科', '疝儿外科李东升医疗组');
INSERT INTO `doctor_info` VALUES (141, '戚腾', '普外疝儿外科', '疝儿外科李东升医疗组');
INSERT INTO `doctor_info` VALUES (142, '陈嘉', '普外疝儿外科', '疝儿外科屠义梅医疗组');
INSERT INTO `doctor_info` VALUES (143, '屠义梅', '普外疝儿外科', '疝儿外科屠义梅医疗组');
INSERT INTO `doctor_info` VALUES (144, '朱远方', '普外胃肠外科', '胃肠外科公共医疗组');
INSERT INTO `doctor_info` VALUES (145, '乔唐', '普外胃肠外科', '胃肠外科乔唐医疗组');
INSERT INTO `doctor_info` VALUES (146, '柳千帆', '普外胃肠外科', '胃肠外科乔唐医疗组');
INSERT INTO `doctor_info` VALUES (147, '陈平', '普外胃肠外科', '胃肠外科石磊医疗组');
INSERT INTO `doctor_info` VALUES (148, '石磊', '普外胃肠外科', '胃肠外科石磊医疗组');
INSERT INTO `doctor_info` VALUES (149, '夏玉健', '普外胃肠外科', '胃肠外科石磊医疗组');
INSERT INTO `doctor_info` VALUES (150, '汤东', '普外胃肠外科', '胃肠外科汤东医疗组');
INSERT INTO `doctor_info` VALUES (151, '任俊', '普外胃肠外科', '胃肠外科汤东医疗组');
INSERT INTO `doctor_info` VALUES (152, '王伟', '普外胃肠外科', '胃肠外科王道荣医疗组');
INSERT INTO `doctor_info` VALUES (153, '汪刘华', '普外胃肠外科', '胃肠外科王道荣医疗组');
INSERT INTO `doctor_info` VALUES (154, '王道荣', '普外胃肠外科', '胃肠外科王道荣医疗组');
INSERT INTO `doctor_info` VALUES (155, '夏浩', '普外胃肠外科', '胃肠外科王道荣医疗组');
INSERT INTO `doctor_info` VALUES (156, '赵伟', '普外胃肠外科', '胃肠外科赵伟医疗组');
INSERT INTO `doctor_info` VALUES (157, '孟庆洋', '普外胃肠外科', '胃肠外科赵伟医疗组');
INSERT INTO `doctor_info` VALUES (158, '华如衡', '普外胃肠外科', '胃肠外科赵伟医疗组');
INSERT INTO `doctor_info` VALUES (159, '王磊', '普外血管外科', '血管外科公共医疗组');
INSERT INTO `doctor_info` VALUES (160, '陈兆雷', '普外血管外科', '血管外科公共医疗组');
INSERT INTO `doctor_info` VALUES (161, '韦润泽', '普外血管外科', '血管外科公共医疗组');
INSERT INTO `doctor_info` VALUES (162, '徐淼', '普外血管外科', '血管外科公共医疗组');
INSERT INTO `doctor_info` VALUES (163, '孙元', '普外血管外科', '血管外科孙元医疗组');
INSERT INTO `doctor_info` VALUES (164, '刘晓光', '神经外科', 'NICU董伦组');
INSERT INTO `doctor_info` VALUES (165, '董伦', '神经外科', 'NICU董伦组');
INSERT INTO `doctor_info` VALUES (166, '祁雅婕', '神经外科', 'NICU董伦组');
INSERT INTO `doctor_info` VALUES (167, '李育平', '神经外科', 'NICU董伦组');
INSERT INTO `doctor_info` VALUES (168, '马强', '神经外科', 'NICU董伦组');
INSERT INTO `doctor_info` VALUES (169, '张恒柱', '神经外科', '神经外科公共医疗组');
INSERT INTO `doctor_info` VALUES (170, '魏民', '神经外科', '神经外科佘磊医疗组');
INSERT INTO `doctor_info` VALUES (171, '佘磊', '神经外科', '神经外科佘磊医疗组');
INSERT INTO `doctor_info` VALUES (172, '严正村', '神经外科', '神经外科佘磊医疗组');
INSERT INTO `doctor_info` VALUES (173, '闻金坤', '神经外科', '神经外科王存祖组');
INSERT INTO `doctor_info` VALUES (174, '王存祖', '神经外科', '神经外科王存祖组');
INSERT INTO `doctor_info` VALUES (175, '王东东', '神经外科', '神经外科王存祖组');
INSERT INTO `doctor_info` VALUES (176, '于波', '神经外科', '神经外科王存祖组');
INSERT INTO `doctor_info` VALUES (177, '王晓东', '神经外科', '神经外科王晓东医疗组');
INSERT INTO `doctor_info` VALUES (178, '汤灿', '神经外科', '神经外科王晓东医疗组');
INSERT INTO `doctor_info` VALUES (179, '甄勇', '神经外科', '神经外科甄勇组');
INSERT INTO `doctor_info` VALUES (180, '申林海', '神经外科', '神经外科甄勇组');
INSERT INTO `doctor_info` VALUES (181, '何亮', '神经外科', '神经外科甄勇组');
INSERT INTO `doctor_info` VALUES (182, '陈蕊', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (183, '邹如凯', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (184, '朱颖', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (185, '杨明瑜', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (186, '赵传燕', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (187, '马悦', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (188, '刘若楠', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (189, '何大锋', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (190, '李钦', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (191, '李亚年', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (192, '于洋', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (193, '邓毅凡', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (194, '毕光宇', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (195, '张杨淇', '肾脏内科', '肾脏内科毕光宇医疗组');
INSERT INTO `doctor_info` VALUES (196, '鲁春蕾', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (197, '徐军', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (198, '聂日', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (199, '王凤蕾', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (200, '王媞', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (201, '王秋阳', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (202, '王荣', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (203, '梁书瑾', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (204, '顾达', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (205, '黄晶', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (206, '包金环', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (207, '张佳炜', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (208, '高波', '肾脏内科', '肾脏内科高波医疗组');
INSERT INTO `doctor_info` VALUES (209, '张谊', '肾脏内科', '肾脏内科牟洪宾医疗组');
INSERT INTO `doctor_info` VALUES (210, '牟洪宾', '肾脏内科', '肾脏内科牟洪宾医疗组');
INSERT INTO `doctor_info` VALUES (211, '刘昌华', '肾脏内科', '肾脏内科牟洪宾医疗组');
INSERT INTO `doctor_info` VALUES (212, '杨媛媛', '肾脏内科', '肾脏内科伍刚医疗组');
INSERT INTO `doctor_info` VALUES (213, '张胜民', '生殖医学中心', '男科刘凯峰医疗组');
INSERT INTO `doctor_info` VALUES (214, '刘凯峰', '生殖医学中心', '男科刘凯峰医疗组');
INSERT INTO `doctor_info` VALUES (215, '张辰望', '生殖医学中心', '男科刘凯峰医疗组');
INSERT INTO `doctor_info` VALUES (216, '曹天庆', '心内科206', 'CCU徐日新医疗组');
INSERT INTO `doctor_info` VALUES (217, '刘晓东', '心内科206', 'CCU徐日新医疗组');
INSERT INTO `doctor_info` VALUES (218, '梅宏斌', '心内科206', 'CCU徐日新医疗组');
INSERT INTO `doctor_info` VALUES (219, '徐日新', '心内科206', 'CCU徐日新医疗组');
INSERT INTO `doctor_info` VALUES (220, '刘宁', '心内科206', '心内科陈述医疗组');
INSERT INTO `doctor_info` VALUES (221, '汪华玲', '心内科206', '心内科陈述医疗组');
INSERT INTO `doctor_info` VALUES (222, '陈述', '心内科206', '心内科陈述医疗组');
INSERT INTO `doctor_info` VALUES (223, '方震', '心内科206', '心内科纪军医疗组');
INSERT INTO `doctor_info` VALUES (224, '纪军', '心内科206', '心内科纪军医疗组');
INSERT INTO `doctor_info` VALUES (225, '张晶', '心内科206', '心内科纪军医疗组');
INSERT INTO `doctor_info` VALUES (226, '邓敏', '心内科206', '心内科廖清池医疗组');
INSERT INTO `doctor_info` VALUES (227, '廖清池', '心内科206', '心内科廖清池医疗组');
INSERT INTO `doctor_info` VALUES (228, '柳芳美', '心内科206', '心内科廖清池医疗组');
INSERT INTO `doctor_info` VALUES (229, '程铖', '心内科206', '心内科谢勇医疗组');
INSERT INTO `doctor_info` VALUES (230, '谢勇', '心内科206', '心内科谢勇医疗组');
INSERT INTO `doctor_info` VALUES (231, '刘亚聪', '心内科206', '心内科谢勇医疗组');
INSERT INTO `doctor_info` VALUES (232, '常小乾', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (233, '张冬舒', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (234, '王秋爽', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (235, '汪礼娴', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (236, '黄天宇', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (237, '黄路', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (238, '朱业', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (239, '刘睿瑶', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (240, '鲍正宇', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (241, '王睿智', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (242, '王婷婷', '心内科306', '心内科鲍正宇医疗组');
INSERT INTO `doctor_info` VALUES (243, '朱取萍', '心内科306', '心内科孙磊医疗组');
INSERT INTO `doctor_info` VALUES (244, '张维', '心内科306', '心内科孙磊医疗组');
INSERT INTO `doctor_info` VALUES (245, '李梦', '心内科306', '心内科孙磊医疗组');
INSERT INTO `doctor_info` VALUES (246, '陈雨', '心内科306', '心内科孙磊医疗组');
INSERT INTO `doctor_info` VALUES (247, '孙思阳', '心内科306', '心内科孙磊医疗组');
INSERT INTO `doctor_info` VALUES (248, '胡浩', '心内科306', '心内科孙磊医疗组');
INSERT INTO `doctor_info` VALUES (249, '李铭辉', '心内科306', '心内科孙磊医疗组');
INSERT INTO `doctor_info` VALUES (250, '孙磊', '心内科306', '心内科孙磊医疗组');
INSERT INTO `doctor_info` VALUES (251, '孙小林', '心内科306', '心内科孙磊医疗组');
INSERT INTO `doctor_info` VALUES (252, '周阳', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (253, '程建欣', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (254, '李红校', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (255, '谷慧阳', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (256, '张薏', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (257, '任悦', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (258, '王欣', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (259, '陈从改', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (260, '陈福坤', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (261, '张震', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (262, '曹平平', '心内科306', '心内科张薏医疗组');
INSERT INTO `doctor_info` VALUES (263, '张国中', '心脏大血管病中心', 'CICU邵俊医疗组');
INSERT INTO `doctor_info` VALUES (264, '邵俊', '心脏大血管病中心', 'CICU邵俊医疗组');
INSERT INTO `doctor_info` VALUES (265, '朱继高', '心脏大血管病中心', 'CICU邵俊医疗组');
INSERT INTO `doctor_info` VALUES (266, '陈瑞', '心脏大血管病中心', '心脏大血管陈瑞医疗组');
INSERT INTO `doctor_info` VALUES (267, '叶敬霆', '心脏大血管病中心', '心脏大血管陈涛医疗组');
INSERT INTO `doctor_info` VALUES (268, '陈涛', '心脏大血管病中心', '心脏大血管陈涛医疗组');
INSERT INTO `doctor_info` VALUES (269, '朱韬', '心脏大血管病中心', '心脏大血管陈涛医疗组');
INSERT INTO `doctor_info` VALUES (270, '杨岷', '心脏大血管病中心', '心脏大血管杨岷医疗组');
INSERT INTO `doctor_info` VALUES (271, '马涵', '胸外科', '胸外科贺建胜医疗组');
INSERT INTO `doctor_info` VALUES (272, '贺建胜', '胸外科', '胸外科贺建胜医疗组');
INSERT INTO `doctor_info` VALUES (273, '王康', '胸外科', '胸外科贺建胜医疗组');
INSERT INTO `doctor_info` VALUES (274, '杨文龙', '胸外科', '胸外科金卫国医疗组');
INSERT INTO `doctor_info` VALUES (275, '陆世春', '胸外科', '胸外科金卫国医疗组');
INSERT INTO `doctor_info` VALUES (276, '金卫国', '胸外科', '胸外科金卫国医疗组');
INSERT INTO `doctor_info` VALUES (277, '史宏灿', '胸外科', '胸外科金卫国医疗组');
INSERT INTO `doctor_info` VALUES (278, '石维平', '胸外科', '胸外科孙超医疗组');
INSERT INTO `doctor_info` VALUES (279, '吕小夏', '胸外科', '胸外科孙超医疗组');
INSERT INTO `doctor_info` VALUES (280, '范懿魏', '胸外科', '胸外科孙超医疗组');
INSERT INTO `doctor_info` VALUES (281, '孙超', '胸外科', '胸外科孙超医疗组');
INSERT INTO `doctor_info` VALUES (282, '费文勇', '运动医学科', '运动医学费文勇医疗组');
INSERT INTO `doctor_info` VALUES (283, '卢耀甲', '运动医学科', '运动医学费文勇医疗组');
INSERT INTO `doctor_info` VALUES (284, '文旦', '运动医学科', '运动医学胡翰生医疗组');
INSERT INTO `doctor_info` VALUES (285, '郭丹', '运动医学科', '运动医学胡翰生医疗组');
INSERT INTO `doctor_info` VALUES (286, '胡翰生', '运动医学科', '运动医学胡翰生医疗组');
INSERT INTO `doctor_info` VALUES (287, '刘军', '普外胃肠外科', '胃肠外科');
INSERT INTO `doctor_info` VALUES (288, '唐程斌', '心脏大血管病中心', '心脏大血管');
INSERT INTO `doctor_info` VALUES (289, '王健', '创伤中心', '创伤中心');
INSERT INTO `doctor_info` VALUES (290, '闫可', '神经外科', '神经外科');
INSERT INTO `doctor_info` VALUES (291, '焦成', '耳鼻咽喉头颈外科', '耳鼻咽喉头颈外科');
INSERT INTO `doctor_info` VALUES (292, '陈洁', '普外胃肠外科', '胃肠外科');
INSERT INTO `doctor_info` VALUES (293, '王璐', '普外胃肠外科', '胃肠外科');
INSERT INTO `doctor_info` VALUES (294, '陈磊', '普外胃肠外科', '胃肠外科');
INSERT INTO `doctor_info` VALUES (295, '朱海航', '普外胃肠外科', '胃肠外科');
INSERT INTO `doctor_info` VALUES (296, '王永祥', '骨科脊柱', '骨科脊柱');
INSERT INTO `doctor_info` VALUES (297, '罗舟', '普外甲乳外科', '甲乳外科');
INSERT INTO `doctor_info` VALUES (298, '朱海杭', '普外胃肠外科', '胃肠外科');
INSERT INTO `doctor_info` VALUES (299, '顾翔', '心内科306', '心内科');
INSERT INTO `doctor_info` VALUES (300, '束余声', '胸外科', '胸外科');

-- ----------------------------
-- Table structure for interoperative_constraint
-- ----------------------------
DROP TABLE IF EXISTS `interoperative_constraint`;
CREATE TABLE `interoperative_constraint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oerating_room1` int(4) NULL DEFAULT NULL,
  `oerating_room2` int(4) NULL DEFAULT NULL,
  `oerating_room3` int(4) NULL DEFAULT NULL,
  `oerating_room4` int(4) NULL DEFAULT NULL,
  `oerating_room5` int(4) NULL DEFAULT NULL,
  `oerating_room6` int(4) NULL DEFAULT NULL,
  `oerating_room7` int(4) NULL DEFAULT NULL,
  `oerating_room8` int(4) NULL DEFAULT NULL,
  `oerating_room9` int(4) NULL DEFAULT NULL,
  `oerating_room10` int(4) NULL DEFAULT NULL,
  `oerating_room11` int(4) NULL DEFAULT NULL,
  `oerating_room12` int(4) NULL DEFAULT NULL,
  `oerating_room13` int(4) NULL DEFAULT NULL,
  `oerating_room14` int(4) NULL DEFAULT NULL,
  `oerating_room15` int(4) NULL DEFAULT NULL,
  `oerating_room16` int(4) NULL DEFAULT NULL,
  `oerating_room17` int(4) NULL DEFAULT NULL,
  `oerating_room18` int(4) NULL DEFAULT NULL,
  `oerating_room19` int(4) NULL DEFAULT NULL,
  `oerating_room20` int(4) NULL DEFAULT NULL,
  `oerating_room21` int(4) NULL DEFAULT NULL,
  `oerating_room22` int(4) NULL DEFAULT NULL,
  `oerating_room23` int(4) NULL DEFAULT NULL,
  `oerating_room24` int(4) NULL DEFAULT NULL,
  `oerating_room25` int(4) NULL DEFAULT NULL,
  `oerating_room26` int(4) NULL DEFAULT NULL,
  `oerating_room27` int(4) NULL DEFAULT NULL,
  `oerating_room28` int(4) NULL DEFAULT NULL,
  `oerating_room29` int(4) NULL DEFAULT NULL,
  `oerating_room30` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interoperative_constraint
-- ----------------------------
INSERT INTO `interoperative_constraint` VALUES (1, '1', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (2, '2', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (3, '3', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (4, '4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (5, '5', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (6, '6', 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (7, '7', 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (8, '8', 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (9, '9', 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (10, '10', 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (11, '11', 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (12, '12', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (13, '13', 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (14, '14', 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (15, '15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (16, '骨科手足', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (17, '普外血管外科', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (18, '神经外科', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (19, '生殖医学中心', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `interoperative_constraint` VALUES (20, '运动医学科', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `interoperative_constraint` VALUES (21, '心内科206', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (22, '心内科306', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `interoperative_constraint` VALUES (23, '心脏大血管病中心', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for medical_team_info
-- ----------------------------
DROP TABLE IF EXISTS `medical_team_info`;
CREATE TABLE `medical_team_info`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name_medical_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `affiliated_department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_medical_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medical_team_info
-- ----------------------------
INSERT INTO `medical_team_info` VALUES (1, '产科孔祥医疗组', '1', '孔祥', '佘程晨、宋晶哲、孔祥、周玲、张艳馨、卢丹');
INSERT INTO `medical_team_info` VALUES (2, '产科孔祥医疗组', '1', '李医生', '佘程晨、宋晶哲、孔祥、周玲、张艳馨、卢丹');
INSERT INTO `medical_team_info` VALUES (3, NULL, '2', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (4, NULL, '3', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (5, NULL, '4', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (6, NULL, '5', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (7, NULL, '6', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (8, NULL, '7', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (9, NULL, '8', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (10, NULL, '9', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (11, NULL, '10', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (12, NULL, '11', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (13, NULL, '12', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (14, NULL, '13', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (15, NULL, '14', NULL, NULL);
INSERT INTO `medical_team_info` VALUES (16, NULL, '15', NULL, NULL);

-- ----------------------------
-- Table structure for medical_team_info_port
-- ----------------------------
DROP TABLE IF EXISTS `medical_team_info_port`;
CREATE TABLE `medical_team_info_port`  (
  `ID` int(12) UNSIGNED NOT NULL AUTO_INCREMENT,
  `MED_DEPT_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MED_DEPT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MED_TEAM_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MED_TEAM_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MED_DOCT_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MED_DOCT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MED_GROUP_LEADER` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medical_team_info_port
-- ----------------------------

-- ----------------------------
-- Table structure for operating_day
-- ----------------------------
DROP TABLE IF EXISTS `operating_day`;
CREATE TABLE `operating_day`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operating_room_number` int(11) NULL DEFAULT NULL,
  `half_year` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `week` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subordinate_medical_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `affiliated_department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operating_day
-- ----------------------------
INSERT INTO `operating_day` VALUES (5, 5, '1-6月', '星期二', '赵伟', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (6, 6, '1-6月', '星期二', '周广臣', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (7, 7, '1-6月', '星期二', '金圣杰', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (9, 9, '1-6月', '星期二', '关兵', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (10, 10, '1-6月', '星期二', '', '', '');
INSERT INTO `operating_day` VALUES (11, 11, '1-6月', '星期二', '黄永生', '妇科', '');
INSERT INTO `operating_day` VALUES (12, 12, '1-6月', '星期二', '王业华', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (13, 13, '1-6月', '星期二', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (14, 14, '1-6月', '星期二', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (15, 15, '1-6月', '星期二', '陶玉平', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (16, 16, '1-6月', '星期二', '孙钰', '骨科关节', '');
INSERT INTO `operating_day` VALUES (17, 17, '1-6月', '星期二', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (18, 18, '1-6月', '星期二', '钱建军', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (19, 19, '1-6月', '星期二', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (20, 20, '1-6月', '星期二', '', '', '胸外科首台');
INSERT INTO `operating_day` VALUES (21, 21, '1-6月', '星期二', '邱建平', '口腔科', '');
INSERT INTO `operating_day` VALUES (22, 22, '1-6月', '星期二', 'C', '胸外科', 'C');
INSERT INTO `operating_day` VALUES (23, 23, '1-6月', '星期二', '陈兆雷', '血管外科', '神经外科？');
INSERT INTO `operating_day` VALUES (24, 24, '1-6月', '星期二', '刘宏君', '骨科手足', '');
INSERT INTO `operating_day` VALUES (25, 25, '1-6月', '星期二', '张恒柱', '神经外科', '张恒柱上半月；何金山下半月');
INSERT INTO `operating_day` VALUES (26, 26, '1-6月', '星期二', '王晓东', '神经外科', '');
INSERT INTO `operating_day` VALUES (27, 27, '1-6月', '星期二', '王骅', '创伤外科', '');
INSERT INTO `operating_day` VALUES (28, 28, '1-6月', '星期二', '周岳来', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (29, 29, '1-6月', '星期二', '费文勇', '运动医学', '');
INSERT INTO `operating_day` VALUES (30, 30, '1-6月', '星期二', '刘凯峰', '男科', '');
INSERT INTO `operating_day` VALUES (35, 5, '7-12月', '星期二', '赵伟', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (36, 6, '7-12月', '星期二', '王业华', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (37, 7, '7-12月', '星期二', '金圣杰', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (38, 8, '7-12月', '星期二', '黄永生', '妇科', '');
INSERT INTO `operating_day` VALUES (39, 9, '7-12月', '星期二', '徐丽', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (40, 10, '7-12月', '星期二', '关兵', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (41, 11, '7-12月', '星期二', '董乃俊', '妇科', '');
INSERT INTO `operating_day` VALUES (42, 12, '7-12月', '星期二', '周广臣', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (43, 13, '7-12月', '星期二', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (44, 14, '7-12月', '星期二', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (45, 15, '7-12月', '星期二', '陶玉平', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (46, 16, '7-12月', '星期二', '孙钰', '骨科关节', '');
INSERT INTO `operating_day` VALUES (47, 17, '7-12月', '星期二', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (48, 18, '7-12月', '星期二', '钱建军', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (49, 19, '7-12月', '星期二', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (50, 20, '7-12月', '星期二', '', '', '胸外科首台');
INSERT INTO `operating_day` VALUES (51, 21, '7-12月', '星期二', '邱建平', '口腔科', '');
INSERT INTO `operating_day` VALUES (52, 22, '7-12月', '星期二', 'C', '胸外科', 'C');
INSERT INTO `operating_day` VALUES (53, 23, '7-12月', '星期二', '陈兆雷', '血管外科', '神经外科？');
INSERT INTO `operating_day` VALUES (54, 24, '7-12月', '星期二', '刘宏君', '骨科手足', '');
INSERT INTO `operating_day` VALUES (55, 25, '7-12月', '星期二', '', '', '');
INSERT INTO `operating_day` VALUES (56, 26, '7-12月', '星期二', '王晓东', '神经外科', '');
INSERT INTO `operating_day` VALUES (57, 27, '7-12月', '星期二', '王骅', '创伤外科', '');
INSERT INTO `operating_day` VALUES (58, 28, '7-12月', '星期二', '周岳来', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (59, 29, '7-12月', '星期二', '费文勇', '运动医学', '');
INSERT INTO `operating_day` VALUES (60, 30, '7-12月', '星期二', '刘凯峰', '男科', '');
INSERT INTO `operating_day` VALUES (64, 4, '1-6月', '星期三', '伍刚', '肾脏内科', '肾');
INSERT INTO `operating_day` VALUES (65, 5, '1-6月', '星期三', '陈平', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (66, 6, '1-6月', '星期三', '姚浩', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (67, 7, '1-6月', '星期三', '柏斗胜', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (68, 8, '1-6月', '星期三', '顾建娟', '妇科', '');
INSERT INTO `operating_day` VALUES (69, 9, '1-6月', '星期三', '汤劲松', '疝儿外科', '');
INSERT INTO `operating_day` VALUES (70, 10, '1-6月', '星期三', '于爱民', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (71, 11, '1-6月', '星期三', '尹香花', '妇科', '');
INSERT INTO `operating_day` VALUES (72, 12, '1-6月', '星期三', '王业华', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (73, 13, '1-6月', '星期三', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (74, 14, '1-6月', '星期三', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (75, 15, '1-6月', '星期三', '冯新民', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (76, 16, '1-6月', '星期三', '杨建东', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (77, 17, '1-6月', '星期三', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (78, 18, '1-6月', '星期三', '李振南', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (79, 19, '1-6月', '星期三', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (80, 20, '1-6月', '星期三', '', '', '王道荣首台');
INSERT INTO `operating_day` VALUES (81, 21, '1-6月', '星期三', '张立英', '产科', '');
INSERT INTO `operating_day` VALUES (82, 22, '1-6月', '星期三', '陈鹏涛', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (83, 23, '1-6月', '星期三', '甄勇', '神经外科', '');
INSERT INTO `operating_day` VALUES (84, 24, '1-6月', '星期三', '张乃臣', '骨科手足', '');
INSERT INTO `operating_day` VALUES (85, 25, '1-6月', '星期三', '佘磊', '神经外科', '');
INSERT INTO `operating_day` VALUES (86, 26, '1-6月', '星期三', '陈兆雷', '血管外科', '神经外科？');
INSERT INTO `operating_day` VALUES (87, 27, '1-6月', '星期三', '王骅', '创伤外科', '');
INSERT INTO `operating_day` VALUES (88, 28, '1-6月', '星期三', '方永超', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (89, 29, '1-6月', '星期三', '费文勇', '运动医学', '');
INSERT INTO `operating_day` VALUES (90, 30, '1-6月', '星期三', '祝玉祥', '甲乳外科', '');
INSERT INTO `operating_day` VALUES (94, 4, '7-12月', '星期三', '伍刚', '肾脏内科', '肾');
INSERT INTO `operating_day` VALUES (95, 5, '7-12月', '星期三', '陈平', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (96, 6, '7-12月', '星期三', '王业华', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (97, 7, '7-12月', '星期三', '柏斗胜', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (98, 8, '7-12月', '星期三', '顾建娟', '妇科', '');
INSERT INTO `operating_day` VALUES (99, 9, '7-12月', '星期三', '汤劲松', '疝儿外科', '');
INSERT INTO `operating_day` VALUES (101, 11, '7-12月', '星期三', '尹香花', '妇科', '');
INSERT INTO `operating_day` VALUES (102, 12, '7-12月', '星期三', '姚浩', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (103, 13, '7-12月', '星期三', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (104, 14, '7-12月', '星期三', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (105, 15, '7-12月', '星期三', '陶玉平', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (106, 16, '7-12月', '星期三', '冯新民', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (107, 17, '7-12月', '星期三', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (108, 18, '7-12月', '星期三', '李振南', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (109, 19, '7-12月', '星期三', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (110, 20, '7-12月', '星期三', '', '', '王道荣首台');
INSERT INTO `operating_day` VALUES (111, 21, '7-12月', '星期三', '张立英', '产科', '');
INSERT INTO `operating_day` VALUES (112, 22, '7-12月', '星期三', '陈鹏涛', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (113, 23, '7-12月', '星期三', '甄勇', '神经外科', '');
INSERT INTO `operating_day` VALUES (114, 24, '7-12月', '星期三', '张乃臣', '骨科手足', '');
INSERT INTO `operating_day` VALUES (115, 25, '7-12月', '星期三', '佘磊', '神经外科', '');
INSERT INTO `operating_day` VALUES (116, 26, '7-12月', '星期三', '陈兆雷', '血管外科', '神经外科？');
INSERT INTO `operating_day` VALUES (117, 27, '7-12月', '星期三', '王骅', '创伤外科', '');
INSERT INTO `operating_day` VALUES (118, 28, '7-12月', '星期三', '方永超', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (119, 29, '7-12月', '星期三', '费文勇', '运动医学', '');
INSERT INTO `operating_day` VALUES (120, 30, '7-12月', '星期三', '祝玉祥', '甲乳外科', '');
INSERT INTO `operating_day` VALUES (121, 1, '1-6月', '星期四', '', '', '');
INSERT INTO `operating_day` VALUES (123, 3, '1-6月', '星期四', 'A', '胸外科', 'A');
INSERT INTO `operating_day` VALUES (125, 5, '1-6月', '星期四', '石磊', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (126, 6, '1-6月', '星期四', '姚浩', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (127, 7, '1-6月', '星期四', '丁向民', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (128, 8, '1-6月', '星期四', '王志学', '妇科', '');
INSERT INTO `operating_day` VALUES (129, 9, '1-6月', '星期四', '邱建平', '口腔科', '');
INSERT INTO `operating_day` VALUES (130, 10, '1-6月', '星期四', '张俊中', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (131, 11, '1-6月', '星期四', '黄永生', '妇科', '');
INSERT INTO `operating_day` VALUES (132, 12, '1-6月', '星期四', '周广臣', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (133, 13, '1-6月', '星期四', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (134, 14, '1-6月', '星期四', '朱远方', '胃肠外科', '朱远方');
INSERT INTO `operating_day` VALUES (135, 15, '1-6月', '星期四', '冯新民', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (136, 16, '1-6月', '星期四', '陶玉平', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (137, 17, '1-6月', '星期四', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (138, 18, '1-6月', '星期四', '钱建军', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (139, 19, '1-6月', '星期四', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (140, 20, '1-6月', '星期四', '', '', '');
INSERT INTO `operating_day` VALUES (141, 21, '1-6月', '星期四', '祝玉祥', '甲乳外科', '');
INSERT INTO `operating_day` VALUES (142, 22, '1-6月', '星期四', '卢丹', '产科', '');
INSERT INTO `operating_day` VALUES (143, 23, '1-6月', '星期四', '陈兆雷', '神经外科', '');
INSERT INTO `operating_day` VALUES (144, 24, '1-6月', '星期四', '顾加祥', '骨科手足', '');
INSERT INTO `operating_day` VALUES (145, 25, '1-6月', '星期四', '王晓东', '神经外科', '');
INSERT INTO `operating_day` VALUES (146, 26, '1-6月', '星期四', '王存祖', '神经外科', '');
INSERT INTO `operating_day` VALUES (147, 27, '1-6月', '星期四', '王骅', '创伤外科', '');
INSERT INTO `operating_day` VALUES (148, 28, '1-6月', '星期四', '周岳来', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (149, 29, '1-6月', '星期四', '费文勇', '运动医学', '');
INSERT INTO `operating_day` VALUES (150, 30, '1-6月', '星期四', '费文勇', '运动医学', '');
INSERT INTO `operating_day` VALUES (153, 3, '7-12月', '星期四', 'A', '胸外科', 'A');
INSERT INTO `operating_day` VALUES (155, 5, '7-12月', '星期四', '石磊', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (156, 6, '7-12月', '星期四', '周广臣', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (157, 7, '7-12月', '星期四', '丁向民', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (158, 8, '7-12月', '星期四', '王志学', '妇科', '');
INSERT INTO `operating_day` VALUES (159, 9, '7-12月', '星期四', '邱建平', '口腔科', '');
INSERT INTO `operating_day` VALUES (161, 11, '7-12月', '星期四', '黄永生', '妇科', '');
INSERT INTO `operating_day` VALUES (162, 12, '7-12月', '星期四', '姚浩', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (163, 13, '7-12月', '星期四', '王道荣', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (164, 14, '7-12月', '星期四', '朱远方', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (165, 15, '7-12月', '星期四', '杨建东', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (166, 16, '7-12月', '星期四', '陶玉平', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (167, 17, '7-12月', '星期四', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (168, 18, '7-12月', '星期四', '钱建军', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (169, 19, '7-12月', '星期四', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (170, 20, '7-12月', '星期四', '', '', '');
INSERT INTO `operating_day` VALUES (171, 21, '7-12月', '星期四', '祝玉祥', '甲乳外科', '');
INSERT INTO `operating_day` VALUES (172, 22, '7-12月', '星期四', '卢丹', '产科', '');
INSERT INTO `operating_day` VALUES (173, 23, '7-12月', '星期四', '陈兆雷', '神经外科', '');
INSERT INTO `operating_day` VALUES (174, 24, '7-12月', '星期四', '顾加祥', '骨科手足', '');
INSERT INTO `operating_day` VALUES (175, 25, '7-12月', '星期四', '王晓东', '神经外科', '');
INSERT INTO `operating_day` VALUES (176, 26, '7-12月', '星期四', '王存祖', '神经外科', '');
INSERT INTO `operating_day` VALUES (177, 27, '7-12月', '星期四', '王骅', '创伤外科', '');
INSERT INTO `operating_day` VALUES (178, 28, '7-12月', '星期四', '周岳来', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (179, 29, '7-12月', '星期四', '费文勇', '运动医学', '');
INSERT INTO `operating_day` VALUES (180, 30, '7-12月', '星期四', '费文勇', '运动医学', '');
INSERT INTO `operating_day` VALUES (183, 3, '1-6月', '星期五', 'A', '胸外科', 'A');
INSERT INTO `operating_day` VALUES (184, 4, '1-6月', '星期五', '伍刚', '肾脏内科', '肾');
INSERT INTO `operating_day` VALUES (185, 5, '1-6月', '星期五', '蒋国庆', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (186, 6, '1-6月', '星期五', '周广臣', '泌尿外科', '周广臣、姚浩、王业华在7、6、12手术间轮转');
INSERT INTO `operating_day` VALUES (187, 7, '1-6月', '星期五', '姚浩', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (188, 8, '1-6月', '星期五', '黄永生', '妇科', '黄永生/顾建娟');
INSERT INTO `operating_day` VALUES (189, 9, '1-6月', '星期五', '于爱民', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (190, 10, '1-6月', '星期五', '关兵', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (191, 11, '1-6月', '星期五', '尹香花', '妇科', '');
INSERT INTO `operating_day` VALUES (192, 12, '1-6月', '星期五', '王业华', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (193, 13, '1-6月', '星期五', '任俊', '胃肠外科', '任俊/汪刘华');
INSERT INTO `operating_day` VALUES (194, 14, '1-6月', '星期五', '赵伟', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (195, 15, '1-6月', '星期五', '陶玉平', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (196, 16, '1-6月', '星期五', '杨建东', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (197, 17, '1-6月', '星期五', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (198, 18, '1-6月', '星期五', '姚捷', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (199, 19, '1-6月', '星期五', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (200, 20, '1-6月', '星期五', '', '', '柏斗胜首台');
INSERT INTO `operating_day` VALUES (201, 21, '1-6月', '星期五', '汤劲松', '疝儿外科', '');
INSERT INTO `operating_day` VALUES (202, 22, '1-6月', '星期五', '孔祥', '产科', '');
INSERT INTO `operating_day` VALUES (203, 23, '1-6月', '星期五', '', '心脏科', '心脏大血管');
INSERT INTO `operating_day` VALUES (204, 24, '1-6月', '星期五', '刘宏君', '骨科手足', '');
INSERT INTO `operating_day` VALUES (205, 25, '1-6月', '星期五', '佘磊', '神经外科', '');
INSERT INTO `operating_day` VALUES (206, 26, '1-6月', '星期五', '陈兆雷', '血管外科', '张喜成');
INSERT INTO `operating_day` VALUES (207, 27, '1-6月', '星期五', '陈鹏涛', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (208, 28, '1-6月', '星期五', '方永超', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (209, 29, '1-6月', '星期五', '', '', '骨科；运动医学科接台');
INSERT INTO `operating_day` VALUES (210, 30, '1-6月', '星期五', '', '', '声带息肉；运动医学科接台');
INSERT INTO `operating_day` VALUES (215, 5, '7-12月', '星期五', '蒋国庆', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (216, 6, '7-12月', '星期五', '周广臣', '泌尿外科', '周广臣、姚浩、王业华在7、6、12手术间轮转');
INSERT INTO `operating_day` VALUES (217, 7, '7-12月', '星期五', '姚浩', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (218, 8, '7-12月', '星期五', '黄永生', '妇科', '黄永生/顾建娟');
INSERT INTO `operating_day` VALUES (219, 9, '7-12月', '星期五', '关兵', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (221, 11, '7-12月', '星期五', '尹香花', '妇科', '');
INSERT INTO `operating_day` VALUES (222, 12, '7-12月', '星期五', '王业华', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (223, 13, '7-12月', '星期五', '任俊', '胃肠外科', '任俊/汪刘华');
INSERT INTO `operating_day` VALUES (224, 14, '7-12月', '星期五', '赵伟', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (225, 15, '7-12月', '星期五', '杨建东', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (226, 16, '7-12月', '星期五', '陶玉平', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (227, 17, '7-12月', '星期五', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (228, 18, '7-12月', '星期五', '姚捷', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (229, 19, '7-12月', '星期五', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (230, 20, '7-12月', '星期五', '', '', '柏斗胜首台');
INSERT INTO `operating_day` VALUES (231, 21, '7-12月', '星期五', '汤劲松', '疝儿外科', '');
INSERT INTO `operating_day` VALUES (232, 22, '7-12月', '星期五', '孔祥', '产科', '');
INSERT INTO `operating_day` VALUES (233, 23, '7-12月', '星期五', '', '心脏科', '心脏大血管');
INSERT INTO `operating_day` VALUES (234, 24, '7-12月', '星期五', '刘宏君', '骨科手足', '');
INSERT INTO `operating_day` VALUES (235, 25, '7-12月', '星期五', '佘磊', '神经外科', '');
INSERT INTO `operating_day` VALUES (236, 26, '7-12月', '星期五', '陈兆雷', '血管外科', '张喜成');
INSERT INTO `operating_day` VALUES (237, 27, '7-12月', '星期五', '方永超', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (238, 28, '7-12月', '星期五', '陈鹏涛', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (239, 29, '7-12月', '星期五', '', '', '骨科；运动医学科接台');
INSERT INTO `operating_day` VALUES (240, 30, '7-12月', '星期五', '', '', '声带息肉；运动医学科接台');
INSERT INTO `operating_day` VALUES (243, 3, '1-6月', '星期一', 'A', '胸外科', 'A');
INSERT INTO `operating_day` VALUES (244, 4, '1-6月', '星期一', '伍刚', '肾脏内科', '肾');
INSERT INTO `operating_day` VALUES (245, 5, '1-6月', '星期一', '汤劲松', '疝儿外科', '');
INSERT INTO `operating_day` VALUES (246, 6, '1-6月', '星期一', '姚浩', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (247, 7, '1-6月', '星期一', '蒋国庆', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (248, 8, '1-6月', '星期一', '孙桂芳', '妇科', '');
INSERT INTO `operating_day` VALUES (249, 9, '1-6月', '星期一', '李东升', '疝儿外科', '');
INSERT INTO `operating_day` VALUES (250, 10, '1-6月', '星期一', '常玲美', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (251, 11, '1-6月', '星期一', '王志学', '妇科', '');
INSERT INTO `operating_day` VALUES (252, 12, '1-6月', '星期一', '丁雪飞', '泌尿外科', '丁雪飞或杨进');
INSERT INTO `operating_day` VALUES (253, 13, '1-6月', '星期一', '陈平', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (254, 14, '1-6月', '星期一', '乔唐', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (255, 15, '1-6月', '星期一', '冯新民', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (256, 16, '1-6月', '星期一', '杨建东', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (257, 17, '1-6月', '星期一', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (258, 18, '1-6月', '星期一', '姚捷', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (259, 19, '1-6月', '星期一', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (260, 20, '1-6月', '星期一', '', '', '丁雪飞首台');
INSERT INTO `operating_day` VALUES (261, 21, '1-6月', '星期一', '王小东', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (262, 22, '1-6月', '星期一', '卢丹', '产科', '');
INSERT INTO `operating_day` VALUES (263, 23, '1-6月', '星期一', '甄勇', '神经外科', '');
INSERT INTO `operating_day` VALUES (264, 24, '1-6月', '星期一', '刘宏君', '骨科手足', '');
INSERT INTO `operating_day` VALUES (265, 25, '1-6月', '星期一', '张乃臣', '骨科手足', '');
INSERT INTO `operating_day` VALUES (266, 26, '1-6月', '星期一', '王存祖', '神经外科', '');
INSERT INTO `operating_day` VALUES (267, 27, '1-6月', '星期一', '王骅', '创伤外科', '');
INSERT INTO `operating_day` VALUES (268, 28, '1-6月', '星期一', '何金山', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (269, 29, '1-6月', '星期一', '胡翰生', '运动医学', '');
INSERT INTO `operating_day` VALUES (270, 30, '1-6月', '星期一', '胡翰生', '运动医学', '');
INSERT INTO `operating_day` VALUES (271, 1, '7-12月', '星期一', '祝玉祥', '甲乳外科', '');
INSERT INTO `operating_day` VALUES (272, 2, '7-12月', '星期一', '邵稳喜', '甲乳外科', '');
INSERT INTO `operating_day` VALUES (274, 4, '7-12月', '星期一', '伍刚', '肾脏内科', '肾');
INSERT INTO `operating_day` VALUES (275, 5, '7-12月', '星期一', '李东升', '疝儿外科', '');
INSERT INTO `operating_day` VALUES (276, 6, '7-12月', '星期一', '丁雪飞', '泌尿外科', '丁雪飞或杨进');
INSERT INTO `operating_day` VALUES (277, 7, '7-12月', '星期一', '蒋国庆', '肝脾外科', '');
INSERT INTO `operating_day` VALUES (278, 8, '7-12月', '星期一', '孙桂芳', '妇科', '');
INSERT INTO `operating_day` VALUES (279, 9, '7-12月', '星期一', '汤劲松', '疝儿外科', '');
INSERT INTO `operating_day` VALUES (280, 10, '7-12月', '星期一', '常玲美', '耳鼻喉科', '');
INSERT INTO `operating_day` VALUES (281, 11, '7-12月', '星期一', '王志学', '妇科', '');
INSERT INTO `operating_day` VALUES (282, 12, '7-12月', '星期一', '姚浩', '泌尿外科', '');
INSERT INTO `operating_day` VALUES (283, 13, '7-12月', '星期一', '乔唐', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (284, 14, '7-12月', '星期一', '陈平', '胃肠外科', '');
INSERT INTO `operating_day` VALUES (285, 15, '7-12月', '星期一', '杨建东', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (286, 16, '7-12月', '星期一', '冯新民', '骨科脊柱', '');
INSERT INTO `operating_day` VALUES (287, 17, '7-12月', '星期一', '颜连启', '骨科关节', '');
INSERT INTO `operating_day` VALUES (288, 18, '7-12月', '星期一', '姚捷', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (289, 19, '7-12月', '星期一', 'B', '胸外科', 'B');
INSERT INTO `operating_day` VALUES (290, 20, '7-12月', '星期一', '', '', '丁雪飞首台');
INSERT INTO `operating_day` VALUES (291, 21, '7-12月', '星期一', '王小东', '胆胰外科', '');
INSERT INTO `operating_day` VALUES (292, 22, '7-12月', '星期一', '卢丹', '产科', '');
INSERT INTO `operating_day` VALUES (293, 23, '7-12月', '星期一', '甄勇', '神经外科', '');
INSERT INTO `operating_day` VALUES (294, 24, '7-12月', '星期一', '刘宏君', '骨科手足', '');
INSERT INTO `operating_day` VALUES (295, 25, '7-12月', '星期一', '张乃臣', '骨科手足', '');
INSERT INTO `operating_day` VALUES (296, 26, '7-12月', '星期一', '王存祖', '神经外科', '');
INSERT INTO `operating_day` VALUES (297, 27, '7-12月', '星期一', '王骅', '创伤外科', '');
INSERT INTO `operating_day` VALUES (298, 28, '7-12月', '星期一', '何金山', '骨科创伤', '');
INSERT INTO `operating_day` VALUES (299, 29, '7-12月', '星期一', '胡翰生', '运动医学', '');
INSERT INTO `operating_day` VALUES (300, 30, '7-12月', '星期一', '胡翰生', '运动医学', '');

-- ----------------------------
-- Table structure for operating_room_info
-- ----------------------------
DROP TABLE IF EXISTS `operating_room_info`;
CREATE TABLE `operating_room_info`  (
  `id` int(4) NOT NULL,
  `operating_department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operating_room_condition` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operating_room_info
-- ----------------------------
INSERT INTO `operating_room_info` VALUES (1, '一部', '1', '普通手术间');
INSERT INTO `operating_room_info` VALUES (2, '一部', '2', '大功率插座');
INSERT INTO `operating_room_info` VALUES (3, '一部', '3', '普通手术间');
INSERT INTO `operating_room_info` VALUES (4, '一部', '4', '普通手术间');
INSERT INTO `operating_room_info` VALUES (5, '一部', '5', '普通手术间');
INSERT INTO `operating_room_info` VALUES (6, '一部', '6', '大功率插座');
INSERT INTO `operating_room_info` VALUES (7, '一部', '7', '大功率插座');
INSERT INTO `operating_room_info` VALUES (8, '一部', '8', '普通手术间');
INSERT INTO `operating_room_info` VALUES (9, '一部', '9', '普通手术间');
INSERT INTO `operating_room_info` VALUES (10, '一部', '10', '普通手术间');
INSERT INTO `operating_room_info` VALUES (11, '一部', '11', '大功率插座');
INSERT INTO `operating_room_info` VALUES (12, '一部', '12', '大功率插座');
INSERT INTO `operating_room_info` VALUES (13, '一部', '13', '大功率插座');
INSERT INTO `operating_room_info` VALUES (14, '一部', '14', '普通手术间');
INSERT INTO `operating_room_info` VALUES (15, '一部', '15', '千级层流');
INSERT INTO `operating_room_info` VALUES (16, '一部', '16', '千级层流');
INSERT INTO `operating_room_info` VALUES (17, '一部', '17', '百级层流');
INSERT INTO `operating_room_info` VALUES (18, '一部', '18', '普通手术间');
INSERT INTO `operating_room_info` VALUES (19, '一部', '19', '普通手术间');
INSERT INTO `operating_room_info` VALUES (20, '一部', '20', '机器人手术间、同时是大功率插座');
INSERT INTO `operating_room_info` VALUES (21, '一部', '21', '普通手术间');
INSERT INTO `operating_room_info` VALUES (22, '一部', '23', '普通手术间');
INSERT INTO `operating_room_info` VALUES (23, '二部', '1', '杂交手术间');
INSERT INTO `operating_room_info` VALUES (24, '二部', '2', '普通手术间（应该是可透视手术间）');
INSERT INTO `operating_room_info` VALUES (25, '二部', '26', '可透视手术间');
INSERT INTO `operating_room_info` VALUES (26, '二部', '27', '普通手术间');
INSERT INTO `operating_room_info` VALUES (27, '二部', '28', '普通手术间（应该是可透视手术间）');
INSERT INTO `operating_room_info` VALUES (28, '二部', '29', '普通手术间（应该是可透视手术间）');
INSERT INTO `operating_room_info` VALUES (29, '日间', '30', '日间手术间（可透视手术间）');
INSERT INTO `operating_room_info` VALUES (30, '日间', '31', '日间手术间');

-- ----------------------------
-- Table structure for operating_room_info_port
-- ----------------------------
DROP TABLE IF EXISTS `operating_room_info_port`;
CREATE TABLE `operating_room_info_port`  (
  `ID` int(12) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CONSOLE_ROOM_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONSOLE_ROOM_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONSOLE_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONSOLE_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONSOLE_DEPT_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONSOLE_DEPT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operating_room_info_port
-- ----------------------------

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logical_deleted` int(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES (1, '超级管理员', 'AAAAA', '2023-01-10 10:00::00', 0);
INSERT INTO `role_info` VALUES (2, '管理员', NULL, '2023-01-10 10:00::00', 0);
INSERT INTO `role_info` VALUES (3, '查看', 'AAAA', '2023-01-10 10:00::00', 0);
INSERT INTO `role_info` VALUES (4, '管理2', 'BBBB', '2023-02-21 08:57:03', 0);
INSERT INTO `role_info` VALUES (5, 'A', 'AAAAA', '2023-03-19 18:40:24', 0);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int(12) NULL DEFAULT NULL,
  `permission_id` int(12) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (3, 1);
INSERT INTO `role_permission` VALUES (3, 3);
INSERT INTO `role_permission` VALUES (3, 4);
INSERT INTO `role_permission` VALUES (3, 4);
INSERT INTO `role_permission` VALUES (3, 2);
INSERT INTO `role_permission` VALUES (3, 6);
INSERT INTO `role_permission` VALUES (3, 5);
INSERT INTO `role_permission` VALUES (3, 7);
INSERT INTO `role_permission` VALUES (3, 8);
INSERT INTO `role_permission` VALUES (3, 9);
INSERT INTO `role_permission` VALUES (3, 10);
INSERT INTO `role_permission` VALUES (3, 11);
INSERT INTO `role_permission` VALUES (3, 12);
INSERT INTO `role_permission` VALUES (3, 16);
INSERT INTO `role_permission` VALUES (3, 13);
INSERT INTO `role_permission` VALUES (3, 14);
INSERT INTO `role_permission` VALUES (3, 15);
INSERT INTO `role_permission` VALUES (2, 6);
INSERT INTO `role_permission` VALUES (2, 5);
INSERT INTO `role_permission` VALUES (2, 7);
INSERT INTO `role_permission` VALUES (2, 8);
INSERT INTO `role_permission` VALUES (2, 9);
INSERT INTO `role_permission` VALUES (2, 10);
INSERT INTO `role_permission` VALUES (2, 11);
INSERT INTO `role_permission` VALUES (2, 12);
INSERT INTO `role_permission` VALUES (2, 16);
INSERT INTO `role_permission` VALUES (2, 13);
INSERT INTO `role_permission` VALUES (2, 14);
INSERT INTO `role_permission` VALUES (2, 15);
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (1, 4);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (1, 6);
INSERT INTO `role_permission` VALUES (1, 5);
INSERT INTO `role_permission` VALUES (1, 10);
INSERT INTO `role_permission` VALUES (1, 7);
INSERT INTO `role_permission` VALUES (1, 8);
INSERT INTO `role_permission` VALUES (1, 9);
INSERT INTO `role_permission` VALUES (1, 11);
INSERT INTO `role_permission` VALUES (1, 12);
INSERT INTO `role_permission` VALUES (1, 16);
INSERT INTO `role_permission` VALUES (1, 13);
INSERT INTO `role_permission` VALUES (1, 14);
INSERT INTO `role_permission` VALUES (1, 18);
INSERT INTO `role_permission` VALUES (1, 15);
INSERT INTO `role_permission` VALUES (1, 17);

-- ----------------------------
-- Table structure for special_surgical_info
-- ----------------------------
DROP TABLE IF EXISTS `special_surgical_info`;
CREATE TABLE `special_surgical_info`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `mapping_surgical_coding` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mapping_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of special_surgical_info
-- ----------------------------
INSERT INTO `special_surgical_info` VALUES (1, '0.4', '单根血管操作', '杂交', '2022-02-02 12:22:22');
INSERT INTO `special_surgical_info` VALUES (2, '39.52', '动脉瘤其他修补术', '杂交', '2022-02-02 12:22:22');
INSERT INTO `special_surgical_info` VALUES (3, '38.3000x001', '动脉瘤切除伴吻合术', '杂交', '2022-02-02 12:22:22');
INSERT INTO `special_surgical_info` VALUES (4, '39.2606', '腹主动脉-肠系膜上动脉搭桥术', '杂交', '2022-02-02 12:22:22');
INSERT INTO `special_surgical_info` VALUES (5, '39.7102', '腹主动脉覆膜支架腔内隔绝术', '杂交', '2022-02-02 12:22:22');

-- ----------------------------
-- Table structure for special_surgical_restraint
-- ----------------------------
DROP TABLE IF EXISTS `special_surgical_restraint`;
CREATE TABLE `special_surgical_restraint`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `mapping_surgical_coding` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mapping_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `special_id` int(12) NULL DEFAULT NULL,
  `operating_room1` int(4) NULL DEFAULT NULL,
  `operating_room2` int(4) NULL DEFAULT NULL,
  `operating_room3` int(4) NULL DEFAULT NULL,
  `operating_room4` int(4) NULL DEFAULT NULL,
  `operating_room5` int(4) NULL DEFAULT NULL,
  `operating_room6` int(4) NULL DEFAULT NULL,
  `operating_room7` int(4) NULL DEFAULT NULL,
  `operating_room8` int(4) NULL DEFAULT NULL,
  `operating_room9` int(4) NULL DEFAULT NULL,
  `operating_room10` int(4) NULL DEFAULT NULL,
  `operating_room11` int(4) NULL DEFAULT NULL,
  `operating_room12` int(4) NULL DEFAULT NULL,
  `operating_room13` int(4) NULL DEFAULT NULL,
  `operating_room14` int(4) NULL DEFAULT NULL,
  `operating_room15` int(4) NULL DEFAULT NULL,
  `operating_room16` int(4) NULL DEFAULT NULL,
  `operating_room17` int(4) NULL DEFAULT NULL,
  `operating_room18` int(4) NULL DEFAULT NULL,
  `operating_room19` int(4) NULL DEFAULT NULL,
  `operating_room20` int(4) NULL DEFAULT NULL,
  `operating_room21` int(4) NULL DEFAULT NULL,
  `operating_room22` int(4) NULL DEFAULT NULL,
  `operating_room23` int(4) NULL DEFAULT NULL,
  `operating_room24` int(4) NULL DEFAULT NULL,
  `operating_room25` int(4) NULL DEFAULT NULL,
  `operating_room26` int(4) NULL DEFAULT NULL,
  `operating_room27` int(4) NULL DEFAULT NULL,
  `operating_room28` int(4) NULL DEFAULT NULL,
  `operating_room29` int(4) NULL DEFAULT NULL,
  `operating_room30` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of special_surgical_restraint
-- ----------------------------
INSERT INTO `special_surgical_restraint` VALUES (1, '', '', '机器人', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (2, '', '', '介入手术', 2, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (3, '', '', '透视', 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (4, '', '', '钬激光', 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (5, '0.4', '单根血管操作', '杂交', 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (6, '39.52', '动脉瘤其他修补术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (7, '38.3000x001', '动脉瘤切除伴吻合术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (8, '39.2606', '腹主动脉-肠系膜上动脉搭桥术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (9, '39.7102', '腹主动脉覆膜支架腔内隔绝术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (10, '39.5900x004', '股动脉成形术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (11, '39.9009', '股动脉支架置入术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (12, '39.791', '经导管动静脉畸形介入栓塞术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (13, '39.7904', '经导管脾动脉栓塞术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (14, '39.7900x036', '经皮上肢动脉取栓术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (15, '39.7900x042', '经皮下肢动脉取栓术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (16, '39.26', '其他腹内血管分流术或搭桥', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (17, '39.5005', '髂动脉球囊血管成形术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (18, '39.9004', '髂动脉支架置入术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (19, '39.5007', '髂静脉球囊血管成形术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (20, '88.6703', '髂静脉造影', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (21, '39.9000x011', '髂静脉支架置入术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (22, '39.5000x021', '上腔静脉球囊扩张成形术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (23, '38.0301', '上肢静脉取栓术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (24, '88.45', '肾动脉造影术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (25, '39.9016', '肾动脉支架置入术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (26, '39.9008', '锁骨下动脉支架置入术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (27, '39.4902', '下腔静脉滤器取出术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (28, '38.7x04', '下腔静脉滤器置入术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (29, '88.5102', '下腔静脉造影', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (30, '38.88', '下肢动脉的其他手术闭合', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (31, '39.5000x031', '下肢动脉球囊扩张成形术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (32, '88.4800x005', '下肢动脉造影', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (33, '88.6600x002', '下肢静脉造影', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (34, '39.7303', '胸主动脉覆膜支架腔内隔绝术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (35, '39.99', '血管其他手术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (36, '39.5900x026', '烟囱技术髂内动脉重建术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (37, '38.9700x002', '引导下中心静脉置管术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (38, '0.46', '置入两根血管的支架', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (39, '0.45', '置入一根血管的支架', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (40, '39.7300x003', '主动脉覆膜支架腔内隔绝术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (41, '38.0900x001', '下肢静脉血栓切除术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (42, '0.63', '颈动脉支架经皮置入术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (43, '38.6101', '颅内血管畸形切除术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (44, '39.5100x007', '脑动脉瘤夹闭术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (45, '39.5101', '颈动脉瘤夹闭术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (46, '39.5102', '大脑前动脉瘤夹闭术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (47, '39.5103', '大脑中动脉瘤夹闭术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (48, '39.5107', '前交通动脉瘤夹闭术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (49, '39.7200x007', '硬脑膜动静脉瘘栓塞术（DAVF）', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (50, '39.7203', '经导管颅内动脉瘤栓塞术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (51, '39.7204', '经导管颅内动脉瘤弹簧圈栓塞术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (52, '39.7205', '经导管颅内动脉瘤支架辅助栓塞术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (53, '39.7207', '经导管颈动脉瘤弹簧圈栓塞术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (54, '39.7208', '经导管颈动脉瘤支架辅助栓塞术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (55, '39.7500x002', '经导管颈动脉瘤裸弹簧圈栓塞术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (56, '39.791', '经导管动静脉畸形介入栓塞术', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (57, '88.4101', '脑血管造影', '杂交', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `special_surgical_restraint` VALUES (58, '80.1501', '关节镜髋关节游离体取出术', '髋关节镜', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (59, '80.25', '关节镜髋关节检查', '髋关节镜', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (60, '80.4502', '关节镜髋关节松解术', '髋关节镜', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (61, '80.7501', '关节镜髋关节滑膜切除术', '髋关节镜', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (62, '80.8502', '关节镜髋关节病损切除术', '髋关节镜', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (63, '81.4000x004', '髋关节镜下髋关节成形术', '髋关节镜', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (64, '81.4000x005', '髋关节镜下盂唇修补术', '髋关节镜', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (65, '81.4000x006', '髋关节镜下软骨成形术', '髋关节镜', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `special_surgical_restraint` VALUES (66, '83.1900x023', '髋关节镜下髂腰肌松解术', '髋关节镜', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for surgicalapplication_info_port
-- ----------------------------
DROP TABLE IF EXISTS `surgicalapplication_info_port`;
CREATE TABLE `surgicalapplication_info_port`  (
  `ID` int(12) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ELECTR_REQUISITION_NO` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INHOSP_NO` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INHOSP_INDEX_NO` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SURGERY_PAT_RESOURCE_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PAT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHYSI_SEX_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CURR_BED_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPERATION_CATEGORY` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `POSITION` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `POSITION_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PRE_SURGERY_DIAG_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPERATION_PREFIX` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SURGERY_OPER_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PRE_SURGERY_DIAG_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPERATION_SUFFIX` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SURGERY_DR_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ANES_METHOD_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SURGERY_TABLE_NO` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SURGERY_DATE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SURGERY_DEPT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SURGERY_LEVEL_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SURGERY_WOUND_CATEG_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SURGERY_DURATION` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of surgicalapplication_info_port
-- ----------------------------
INSERT INTO `surgicalapplication_info_port` VALUES (5, '2392255', 'ZY010001054426', '0001054426', '住院', '佘春香', '女', '118716', '骨科关节', '择期', NULL, NULL, '感染', NULL, '踝关节镜下距下关节融合术', 'B99.x00x001', NULL, '颜望军', '局麻', 'D2', '2023-04-01T10:00:00', '第一手术部', '4级手术', '1', '2-小时');
INSERT INTO `surgicalapplication_info_port` VALUES (6, '2392275', 'ZY010001059731', '0001059731', '住院', '赵桂兰', '女', '118703', '骨科关节', '择期', NULL, NULL, '股骨粗隆间骨折', NULL, '肱骨髁间骨折手法整复术', 'S72.101', NULL, '易琼', '全麻', 'B7', '2023-04-18T08:00:00', '第一手术部', '', '1', '3-小时');

-- ----------------------------
-- Table structure for surgicalapplicationinfo
-- ----------------------------
DROP TABLE IF EXISTS `surgicalapplicationinfo`;
CREATE TABLE `surgicalapplicationinfo`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `pseudo_operation_data` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拟手术日期',
  `application_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hospital_serial_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admission_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `patient_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `surgeon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor_department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apply_department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `surgical_coding` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estimated_duration_operation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_sequence` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mode_anesthesia` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whether_operating` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whether_special_operation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `has_arranged` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `second_round_scheduling_weight` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrange_operating_room_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrange_operating_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrange_operating_room` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number_failed_order_grabs` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `submission_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `surgery` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `robot` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interventional_operation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perspective` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `holmium_laser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room3` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room4` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room5` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room6` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room7` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room8` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room9` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room10` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room11` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room12` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room13` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room14` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room15` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room16` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room17` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room18` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room19` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room20` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room21` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room22` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room23` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room24` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room25` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room26` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room27` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room28` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room29` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room30` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_start_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_end_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of surgicalapplicationinfo
-- ----------------------------
INSERT INTO `surgicalapplicationinfo` VALUES (1, '20220329', '2361441', 'ZY010001045408', '1045408', '徐*', '择期', '章佳新', '普外甲乳外科', '普外甲乳外科', '甲状腺大部切除术', '6.3901', '1', 'A7', '全麻', '', '', '是', '', '2', '一部', '2', '2', '2022-03-29 14:32:22', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (2, '20220329', '2361495', 'ZY010001044579', '1044579', '陈*萍', '择期', '王业华', '泌尿外科', '泌尿外科', '经尿道输尿管镜输尿管激光碎石术', '56.0x00x005', '2', 'A6', '全麻', '', '', '是', '', '12', '一部', '12', '0', '2022-03-29 15:19:28', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (3, '20220329', '2361566', 'ZY010001035922', '1035922', '张*山', '择期', '邱建平', '口腔科', '口腔科', '颊部病损切除术', '27.9901', '0.5', 'A3', '全麻', '', '', '是', '', '21', '一部', '21', '1', '2022-03-29 15:56:23', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 08:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (4, '20220329', '2361368', 'ZY010001045817', '1045817', '宰*明', '择期', '王道荣', '普外胃肠外科', '胃肠中心309', '开腹探查术', '54.11', '2', 'B1', '全麻', '', '', '是', '', '13', '一部', '13', '1', '2022-03-29 16:27:12', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (5, '20220329', '2361497', 'ZY010001044613', '1044613', '钱*祝', '择期', '颜连启', '骨科关节', '骨科关节', '膝关节单髁表面置换术', '81.5400x004', '1', 'A3', '会诊麻醉', '', '', '是', '', '17', '一部', '17', '1', '2022-03-29 13:26:11', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (6, '20220329', '2361118', 'ZY010001045819', '1045819', '孙*跃', '择期', 'A', '胸外科', '胸外科', '胸腔镜下肺病损切除术', '32.2003', '2', 'A1', '全麻', '', '', '是', '', '3', '一部', '3', '0', '2022-03-29 16:10:54', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (7, '20220329', '2361498', 'ZY010001045754', '1045754', '李*亚', '择期', '何海波', '口腔科', '口腔科', '舌骨上颈淋巴结清扫术', '40.4000x003', '3', 'B4', '全麻', '', '', '是', '1.3', '14', '一部', '26', '1', '2022-03-29 17:33:51', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 11:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (8, '20220329', '2361237', 'ZY010001046373', '1046373', '张*昌', '择期', '高红伟', '骨科创伤', '骨科创伤', '肱骨骨折切开复位内固定术', '79.3101', '2', 'A1', '会诊麻醉', '', '', '是', '1.4', '26', '二部', '4', '0', '2022-03-29 12:49:06', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (9, '20220329', '2361615', 'ZY010001044816', '1044816', '马*', '择期', '黄永生', '妇科', '妇科', '终止妊娠刮宫术', '69.0101', '0.5', 'C2', '静脉麻醉', '', '', '是', '', '11', '一部', '11', '3', '2022-03-29 12:18:38', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 08:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (10, '20220329', '2361635', 'ZY010001046045', '1046045', '常*', '择期', '金圣杰', '普外肝胆胰外科', '肝脾外科', '腹腔镜下胆囊切除术', '51.23', '1', 'A2', '全麻', '', '', '是', '', '7', '一部', '7', '4', '2022-03-29 15:41:47', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (11, '20220329', '2361636', 'ZY010001044608', '1044608', '杨*全', '择期', '蒋国庆', '普外肝胆胰外科', '肝脾外科', '腹腔镜下胆囊切除术', '51.23', '1', 'A3', '全麻', '', '', '是', '1.1', '14', '一部', '26', '0', '2022-03-29 17:53:20', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:30:00', '2023-04-16 12:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (12, '20220329', '2361296', 'ZY010001046090', '1046090', '段*永', '择期', '柳长坤', '泌尿外科', '泌尿外科', '包皮环切术', '64.0x00', '2', 'A1', '局麻', '', '', '是', '1.65', '11', '一部', '11', '2', '2022-03-29 14:40:18', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:00:00', '2023-04-16 11:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (13, '20220329', '2360680', 'ZY010001046443', '1046443', '徐*', '择期', '胡翰生', '运动医学科', '运动医学科', '关节镜膝关节前交叉韧带重建术', '81.4504', '1', 'A2', '腰麻', '', '', '是', '1.35', '29', '日间', '1', '0', '2022-03-29 13:54:59', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (14, '20220329', '2361450', 'ZY010001042053', '1042053', '郭*芹', '择期', '何海波', '口腔科', '口腔科', '口腔病损切除术', '27.4906', '1', 'B3', '全麻', '', '', '是', '1.5', '10', '一部', '10', '0', '2022-03-29 17:01:03', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (15, '20220329', '2361565', 'ZY010001046285', '1046285', '祝*国', '择期', '王骅', '创伤中心', '创伤中心2', '胫骨内固定装置去除术', '78.6701', '1', 'A3', '会诊麻醉', '', '', '是', '', '27', '二部', '5', '0', '2022-03-29 12:15:42', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (16, '20220329', '2361619', 'ZY010001045366', '1045366', '田*', '择期', '徐丽', '耳鼻咽喉头颈外科', '耳鼻咽喉头颈外科', '支撑喉镜下会厌病损等离子切除术', '30.0900x042', '1', 'B1', '全麻', '', '', '是', '', '10', '一部', '10', '2', '2022-03-29 16:51:23', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 10:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (17, '20220329', '2360683', 'ZY010001045934', '1045934', '戴*平', '择期', '胡翰生', '运动医学科', '运动医学科', '膝关节镜下半月板成形术', '81.4700x005', '1', 'B2', '腰麻', '', '', '是', '1.45', '30', '日间', '5', '1', '2022-03-29 14:40:08', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (18, '20220329', '2360677', 'ZY010001045878', '1045878', '倪*兰', '择期', '胡翰生', '运动医学科', '运动医学科', '肩关节镜下肩袖修补术', '81.8300x008', '1', 'A5', '全麻', '', '', '', '1.3', '', '', '', '0', '2022-03-29 14:39:44', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', NULL, NULL);
INSERT INTO `surgicalapplicationinfo` VALUES (19, '20220329', '2361435', 'ZY010001045783', '1045783', '操*武', '择期', '张恒柱', '神经外科', '神经外科506', '椎管内外病损切除术', '03.0100x004', '4', 'A1', '全麻', '', '', '是', '', '25', '二部', '3', '0', '2022-03-29 15:13:46', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 12:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (20, '20220329', '2361421', 'ZY010001039291', '1039291', '徐*梅', '择期', '周广臣', '泌尿外科', '泌尿外科', '经尿道膀胱镜膀胱激光碎石术', '57.0x00x007', '1', 'A5', '腰麻', '', '', '是', '', '6', '一部', '6', '2', '2022-03-29 15:51:39', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (21, '20220329', '2361451', 'ZY010001043716', '1043716', '经*香', '择期', '颜连启', '骨科关节', '骨科关节', '全部膝关节置换', '81.54', '2', 'A2', '会诊麻醉', '', '', '是', '', '17', '一部', '17', '0', '2022-03-29 17:08:01', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 11:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (22, '20220329', '2358035', 'ZY010001041919', '1041919', '薛*', '择期', '周广臣', '泌尿外科', '泌尿外科', '经尿道输尿管镜输尿管激光碎石术', '56.0x00x005', '2', 'A3', '全麻', '', '', '是', '', '6', '一部', '6', '1', '2022-03-29 14:10:20', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 11:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (23, '20220329', '2361561', 'ZY010001044315', '1044315', '徐*芳', '择期', '孙钰', '骨科关节', '骨科关节', '全部膝关节置换', '81.54', '2', 'B2', '会诊麻醉', '', '', '是', '', '16', '一部', '16', '1', '2022-03-29 16:37:06', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (24, '20220329', '2361556', 'ZY010001046278', '1046278', '戴*霞', '择期', '孙桂芳', '妇科', '妇科', '腹腔镜双侧卵巢和输卵管切除术', '65.63', '1', 'B1', '会诊麻醉', '', '', '是', '1.2', '11', '一部', '11', '0', '2022-03-29 16:31:22', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:30:00', '2023-04-16 12:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (25, '20220329', '2361242', 'ZY010001046512', '1046512', '王*兰', '择期', '王骅', '创伤中心', '创伤中心2', '股骨骨折切开复位髓内针内固定术', '79.3500x018', '2', 'A1', '会诊麻醉', '', '', '是', '', '27', '二部', '5', '0', '2022-03-29 14:06:33', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 11:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (26, '20220329', '2361618', 'ZY010001046816', '1046816', '李*祺', '择期', '关兵', '耳鼻咽喉头颈外科', '耳鼻咽喉头颈外科', '鼻骨折闭合性复位术', '21.71', '1', 'C1', '全麻', '', '', '是', '', '9', '一部', '9', '4', '2022-03-29 13:34:09', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (27, '20220329', '2361239', 'ZY010001046596', '1046596', '董*菊', '择期', '周岳来', '骨科创伤', '骨科创伤', '股骨骨折切开复位内固定术', '79.3501', '2', 'A3', '会诊麻醉', '', '', '是', '', '28', '二部', '9', '0', '2022-03-29 12:02:53', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (28, '20220329', '2361594', 'ZY010001043924', '1043924', '吴*义', '择期', '钱建军', '普外肝胆胰外科', '胆胰外科', '胆囊切除术', '51.22', '2', 'A5', '全麻', '', '', '是', '', '18', '一部', '18', '1', '2022-03-29 17:33:21', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (29, '20220329', '2361562', 'ZY010001045420', '1045420', '姚*美', '择期', '钱建军', '普外肝胆胰外科', '胆胰外科', '腹腔镜下胆囊切除术', '51.23', '1', 'A1', '全麻', '', '', '是', '', '18', '一部', '18', '0', '2022-03-29 16:47:06', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 11:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (30, '20220329', '2361564', 'ZY010001044529', '1044529', '唐*根', '择期', '孙钰', '骨科关节', '骨科关节', '全髋关节置换', '81.51', '2', 'B3', '会诊麻醉', '', '', '是', '', '16', '一部', '16', '0', '2022-03-29 15:14:15', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 12:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (31, '20220329', '2361569', 'ZY010001045169', '1045169', '黄*敏', '择期', '黄永生', '妇科', '妇科', '开腹探查术', '54.11', '2', 'C1', '全麻', '', '', '是', '', '11', '一部', '11', '2', '2022-03-29 14:23:30', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (32, '20220329', '2361175', 'ZY010001040098', '1040098', '杨*如', '择期', 'C', '胸外科', '胸外科', '胸腔镜下肺病损切除术', '32.2003', '2', 'C1', '全麻', '', '', '是', '', '22', '一部', '23', '2', '2022-03-29 12:44:37', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (33, '20220329', '2361418', 'ZY010001044605', '1044605', '王*星', '择期', '何春兰', '普外甲乳外科', '普外甲乳外科', '乳腺局部扩大切除术', '85.2300x001', '1', 'C2', '全麻', '', '', '是', '', '1', '一部', '1', '3', '2022-03-29 13:41:56', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (34, '20220329', '2361675', 'ZY010001046593', '1046593', '朱*钰', '临时', '胡翰生', '运动医学科', '运动医学科', '膝关节镜下髌韧带重建术', '81.9600x032', '1', 'A8', '腰麻', '', '', '是', '1.5', '30', '日间', '5', '1', '2022-03-29 17:39:02', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 10:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (35, '20220329', '2360681', 'ZY010001046452', '1046452', '赵*富', '择期', '胡翰生', '运动医学科', '运动医学科', '肩关节镜下肩袖修补术', '81.8300x008', '1', 'A1', '全麻', '', '', '是', '1.7', '29', '日间', '1', '2', '2022-03-29 15:29:51', '是', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 10:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (36, '20220329', '2361236', 'ZY010001046508', '1046508', '杨*熙', '择期', '周岳来', '骨科创伤', '骨科创伤', '尺骨骨折切开复位内固定术', '79.3202', '2', 'A1', '会诊麻醉', '', '', '是', '', '28', '二部', '9', '0', '2022-03-29 16:30:48', '是', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 12:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (37, '20220329', '2361238', 'ZY010001046638', '1046638', '赵*海', '择期', '陶玉平', '骨科脊柱', '骨科脊柱', '胸椎骨折切开复位内固定术', '3.5304', '1', 'B1', '会诊麻醉', '', '', '是', '', '15', '一部', '15', '0', '2022-03-29 15:35:29', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (38, '20220329', '2361502', 'ZY010001045771', '1045771', '刘*兰', '择期', '何海波', '口腔科', '口腔科', '舌骨上颈淋巴结清扫术', '40.4000x003', '3', 'B2', '全麻', '', '', '是', '1.3', '10', '一部', '10', '0', '2022-03-29 14:47:02', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:00:00', '2023-04-16 14:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (39, '20220329', '2361616', 'ZY010001043896', '1043896', '凡*江', '择期', '邱建平', '口腔科', '口腔科', '牙源性颌骨病损切除术', '24.4x00x002', '1', 'A5', '全麻', '', '', '是', '', '21', '一部', '21', '3', '2022-03-29 17:38:12', '否', '否', '否', '是', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (40, '20220329', '2361621', 'ZY010001035630', '1035630', '宋*', '择期', '邱建平', '口腔科', '口腔科', '颌骨上牙病损切除术', '24.4x00', '1', 'A8', '全麻', '', '', '是', '', '21', '一部', '21', '0', '2022-03-29 16:32:20', '否', '否', '否', '是', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 11:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (41, '20220329', '2361568', 'ZY010001043649', '1043649', '陈*', '择期', '邱建平', '口腔科', '口腔科', '颌骨上牙病损切除术', '24.4x00', '1', 'A4', '全麻', '', '', '是', '', '21', '一部', '21', '0', '2022-03-29 14:33:11', '是', '是', '是', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:00:00', '2023-04-16 13:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (42, '20220329', '2360684', 'ZY010001046100', '1046100', '杨*萍', '择期', '胡翰生', '运动医学科', '运动医学科', '膝关节镜下半月板成形术', '81.4700x005', '1', 'B3', '腰麻', '', '', '是', '10.45', '29', '日间', '1', '4', '2022-03-29 17:54:49', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:00:00', '2023-04-16 12:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (43, '20220329', '2361563', 'ZY010001045279', '1045279', '纪*红', '择期', '王永祥', '骨科脊柱', '骨科脊柱', '腰椎后柱融合术，后入路', '81.0701', '2', 'A1', '会诊麻醉', '', '', '是', '10.1', '25', '二部', '3', '3', '2022-03-29 17:25:56', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:30:00', '2023-04-16 14:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (44, '20220329', '2361420', 'ZY010001045193', '1045193', '杨*', '择期', '章佳新', '普外甲乳外科', '普外甲乳外科', '甲状腺大部切除术', '6.3901', '2', 'A4', '全麻', '', '', '是', '', '2', '一部', '2', '2', '2022-03-29 17:26:53', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 11:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (45, '20220329', '2361617', 'ZY010001024147', '1024147', '张*花', '择期', '关兵', '耳鼻咽喉头颈外科', '耳鼻咽喉头颈外科', '鼓室成形术,I型', '19.4x01', '3.5', 'A1', '全麻', '', '', '是', '', '9', '一部', '9', '4', '2022-03-29 16:43:49', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 13:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (46, '20220329', '2361620', 'ZY010001045840', '1045840', '刘*喜', '择期', '金圣杰', '普外肝胆胰外科', '肝脾外科', '腹腔镜下胆囊切除术', '51.23', '1', 'A1', '全麻', '', '', '是', '', '7', '一部', '7', '0', '2022-03-29 17:24:16', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 10:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (47, '20220329', '2361437', 'ZY010001045299', '1045299', '汤*梅', '择期', '章佳新', '普外甲乳外科', '普外甲乳外科', '甲状旁腺部分切除术', '6.8902', '2', 'A5', '全麻', '', '', '是', '', '2', '一部', '2', '3', '2022-03-29 17:27:29', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:00:00', '2023-04-16 14:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (48, '20220329', '2361356', 'ZY010001045951', '1045951', '杨*永', '择期', '王业华', '泌尿外科', '泌尿外科', '阴茎病损切除术', '64.2x01', '2', 'A5', '会诊麻醉', '', '', '是', '', '12', '一部', '12', '1', '2022-03-29 15:20:58', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 12:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (49, '20220329', '2361364', 'ZY010001045466', '1045466', '魏*兰', '择期', '章佳新', '普外甲乳外科', '普外甲乳外科', '腋窝淋巴结活组织检查', '40.1103', '2', 'A1', '全麻', '', '', '是', '', '2', '一部', '2', '2', '2022-03-29 16:26:59', '否', '否', '是', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (50, '20220329', '2361104', 'ZY010001042237', '1042237', '林*和', '择期', 'B', '胸外科', '胸外科', '胸腔镜下肺叶切除术', '32.41', '2', 'B1', '全麻', '', '', '是', '', '19', '一部', '19', '2', '2022-03-29 12:48:20', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (51, '20220329', '2361515', 'ZY010001044461', '1044461', '刘*秀', '择期', '颜连启', '骨科关节', '骨科关节', '全髋关节假体翻修术', '00.7000x001', '3', 'A4', '会诊麻醉', '', '', '是', '', '17', '一部', '17', '0', '2022-03-29 14:33:09', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (52, '20220329', '2361581', 'ZY010001044642', '1044642', '蔡*林', '择期', '周广臣', '泌尿外科', '泌尿外科', '输尿管镜检查', '56.31', '2', 'C3', '会诊麻醉', '', '', '是', '', '6', '一部', '6', '0', '2022-03-29 12:32:49', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:00:00', '2023-04-16 14:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (53, '20220329', '2361357', 'ZY010001044025', '1044025', '朱*', '择期', '何春兰', '普外甲乳外科', '普外甲乳外科', '甲状腺大部切除术', '6.3901', '2', 'A3', '全麻', '', '', '是', '', '1', '一部', '1', '2', '2022-03-29 16:40:53', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 11:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (54, '20220329', '2361598', 'ZY010001046318', '1046318', '张*高', '择期', '陶玉平', '骨科脊柱', '骨科脊柱', '椎骨成形术', '78.4904', '1', 'C3', '全麻', '', '', '是', '', '15', '一部', '15', '3', '2022-03-29 17:51:39', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 10:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (55, '20220329', '2361482', 'ZY010001043042', '1043042', '姚*芳', '择期', '章佳新', '普外甲乳外科', '普外甲乳外科', '单侧乳房根治性切除伴同侧腋窝前哨淋巴结活检术', '85.4500x001', '2', 'A8', '全麻', '', '', '是', '', '2', '一部', '2', '0', '2022-03-29 14:53:43', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 17:00:00', '2023-04-16 19:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (56, '20220329', '2361256', 'ZY010001044607', '1044607', '高*妹', '择期', '王业华', '泌尿外科', '泌尿外科', '经皮肾镜超声碎石术', '55.0403', '2', 'A2', '全麻', '', '', '是', '', '12', '一部', '12', '0', '2022-03-29 16:06:29', '否', '否', '是', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (57, '20220329', '2361355', 'ZY010001044768', '1044768', '孙*科', '择期', '赵伟', '普外胃肠外科', '胃肠中心109', '根治性胃切除术', '43.9900x004', '2.5', 'A1', '全麻', '', '', '是', '', '5', '一部', '5', '1', '2022-03-29 17:28:23', '否', '否', '否', '是', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 10:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (58, '20220329', '2361260', 'ZY010001046111', '1046111', '姚*香', '择期', '王骅', '创伤中心', '创伤中心2', '胫骨内固定装置去除术', '78.6701', '2', 'A2', '会诊麻醉', '', '', '是', '', '27', '二部', '5', '4', '2022-03-29 15:07:03', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:00:00', '2023-04-16 14:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (59, '20220329', '2361483', 'ZY010001044362', '1044362', '张*香', '择期', '颜连启', '骨科关节', '骨科关节', '全髋关节置换', '81.51', '1', 'A1', '会诊麻醉', '', '', '是', '', '17', '一部', '17', '0', '2022-03-29 15:16:50', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (60, '20220329', '2361258', 'ZY010001044775', '1044775', '金*江', '择期', '王业华', '泌尿外科', '泌尿外科', '经尿道膀胱病损电切术', '57.4900x001', '2', 'A3', '全麻', '', '', '是', '', '12', '一部', '12', '4', '2022-03-29 13:55:19', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 17:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (61, '20220329', '2361278', 'ZY010001043810', '1043810', '嵇*勤', '择期', '何春兰', '普外甲乳外科', '普外甲乳外科', '单侧乳房切除伴同侧腋窝淋巴结活检术', '85.4300x003', '2', 'A2', '全麻', '', '', '是', '', '1', '一部', '1', '1', '2022-03-29 13:42:05', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:00:00', '2023-04-16 14:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (62, '20220329', '2361257', 'ZY010001044180', '1044180', '陈*', '择期', '周岳来', '骨科创伤', '骨科创伤', '踝关节骨折切开复位内固定术', '79.3603', '3', 'A2', '会诊麻醉', '', '', '是', '', '28', '二部', '9', '4', '2022-03-29 15:35:27', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:00:00', '2023-04-16 16:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (63, '20220329', '2361518', 'ZY010001045742', '1045742', '吴*宇', '择期', '何海波', '口腔科', '口腔科', '颌骨上牙病损切除术', '24.4x00', '2', 'B5', '全麻', '', '', '是', '1.5', '14', '一部', '26', '2', '2022-03-29 15:15:46', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (64, '20220329', '2361577', 'ZY010001043477', '1043477', '朱*娣', '择期', '陶玉平', '骨科脊柱', '骨科脊柱', '经皮椎体增强', '81.66', '1', 'B2', '会诊麻醉', '', '', '是', '', '15', '一部', '15', '0', '2022-03-29 12:16:11', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:00:00', '2023-04-16 12:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (65, '20220329', '2361363', 'ZY010001044278', '1044278', '范*民', '择期', '何春兰', '普外甲乳外科', '普外甲乳外科', '甲状腺大部切除术', '6.3901', '2', 'A6', '全麻', '', '', '是', '', '1', '一部', '1', '1', '2022-03-29 12:33:39', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (66, '20220329', '2361478', 'ZY010001042182', '1042182', '吴*良', '择期', '王业华', '泌尿外科', '泌尿外科', '经尿道输尿管镜输尿管激光碎石术', '56.0x00x005', '2', 'A1', '全麻', '', '', '是', '', '12', '一部', '12', '0', '2022-03-29 14:44:17', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 18:00:00', '2023-04-16 20:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (67, '20220329', '2360698', 'ZY010001046439', '1046439', '林*华', '择期', '胡翰生', '运动医学科', '运动医学科', '膝关节镜下半月板成形术', '81.4700x005', '1', 'A3', '腰麻', '', '', '是', '1.45', '29', '日间', '1', '0', '2022-03-29 16:07:39', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:30:00', '2023-04-16 13:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (68, '20220329', '2361365', 'ZY010001044219', '1044219', '张*琴', '择期', '何春兰', '普外甲乳外科', '普外甲乳外科', '乳腺局部扩大切除术', '85.2300x001', '3', 'C1', '全麻', '', '', '是', '', '1', '一部', '1', '0', '2022-03-29 14:05:30', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 17:00:00', '2023-04-16 20:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (69, '20220329', '2361575', 'ZY010001042924', '1042924', '曾*青', '择期', '邱建平', '口腔科', '口腔科', '腮腺切除术', '26.3201', '1.5', 'A1', '全麻', '', '', '是', '', '21', '一部', '21', '0', '2022-03-29 15:11:10', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:30:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (70, '20220329', '2361459', 'ZY010001044487', '1044487', '徐*福', '择期', '陈兆雷', '普外血管外科', '创伤中心2', '下腔静脉滤器置入术', '38.7x04', '1', 'B1', '局麻+心电监护', '', '是', '是', '10.05', '23', '二部', '1', '4', '2022-03-29 16:58:27', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (71, '20220329', '2361606', 'ZY010001045220', '1045220', '孔*烟', '择期', '徐丽', '耳鼻咽喉头颈外科', '耳鼻咽喉头颈外科', '外耳道病损切除术', '18.2900x009', '1.5', 'B2', '全麻', '', '', '是', '', '10', '一部', '10', '0', '2022-03-29 15:12:19', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:30:00', '2023-04-16 16:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (72, '20220329', '2361358', 'ZY010001044218', '1044218', '王*莲', '择期', '何春兰', '普外甲乳外科', '普外甲乳外科', '甲状腺大部切除术', '6.3901', '2', 'A4', '全麻', '', '', '是', '1.25', '7', '一部', '7', '0', '2022-03-29 12:12:58', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:00:00', '2023-04-16 13:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (73, '20220329', '2361589', 'ZY010001046110', '1046110', '王*', '择期', '王骅', '创伤中心', '创伤中心2', '股骨内固定装置去除术', '78.6501', '2', 'A4', '会诊麻醉', '', '', '是', '', '27', '二部', '5', '2', '2022-03-29 13:43:56', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (74, '20220329', '2361140', 'ZY010001044859', '1044859', '张*定', '择期', '姚浩', '泌尿外科', '泌尿外科', '膀胱镜检查', '57.3200x001', '1.5', 'A1', '全麻', '', '', '是', '1.45', '13', '一部', '13', '1', '2022-03-29 13:09:23', '否', '否', '是', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 12:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (75, '20220329', '2361475', 'ZY010001045493', '1045493', '孔*俊', '择期', '章佳新', '普外甲乳外科', '普外甲乳外科', '甲状腺大部切除术', '6.3901', '2', 'B1', '全麻', '', '', '是', '1.2', '15', '一部', '15', '0', '2022-03-29 16:12:22', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:30:00', '2023-04-16 14:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (76, '20220329', '2361607', 'ZY010001046935', '1046935', '周*兰', '择期', '陶玉平', '骨科脊柱', '骨科脊柱', '经皮椎体增强', '81.66', '1', 'A8', '全麻', '', '', '是', '', '15', '一部', '15', '0', '2022-03-29 13:03:38', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:00:00', '2023-04-16 16:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (77, '20220329', '2361458', 'ZY010001045417', '1045417', '邹*辰', '择期', '刘宏君', '骨科手足', '骨科手足', '腱鞘切开术', '83.0101', '1', 'A1', '全麻', '', '', '是', '', '24', '二部', '2', '0', '2022-03-29 14:32:25', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (78, '20220329', '2360701', 'ZY010001046297', '1046297', '杨*怡', '择期', '胡翰生', '运动医学科', '运动医学科', '膝关节镜下半月板成形术', '81.4700x005', '1', 'B1', '静脉麻醉', '', '', '是', '1.6', '29', '日间', '1', '0', '2022-03-29 12:35:37', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (79, '20220329', '2361456', 'ZY010001044487', '1044487', '徐*福', '择期', '陈兆雷', '普外血管外科', '创伤中心2', '下腔静脉滤器置入术', '38.7x04', '1', 'A1', '局麻+心电监护', '', '是', '是', '10.1', '23', '二部', '1', '4', '2022-03-29 15:19:29', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 10:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (80, '20220329', '2361604', 'ZY010001046252', '1046252', '陶*玲', '择期', '关兵', '耳鼻咽喉头颈外科', '耳鼻咽喉头颈外科', '鼻内窥镜下多个鼻窦开窗术', '22.5300x004', '2', 'A3', '全麻', '', '', '是', '', '9', '一部', '9', '0', '2022-03-29 14:06:34', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:30:00', '2023-04-16 15:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (81, '20220329', '2361855', 'ZY010001046078', '1046078', '郑*', '临时', '胡翰生', '运动医学科', '运动医学科', '膝关节镜下半月板成形术', '81.4700x005', '1', 'B5', '腰麻', '', '', '是', '1.5', '29', '日间', '1', '1', '2022-03-29 14:35:26', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (82, '20220329', '2360696', 'ZY010001046415', '1046415', '颜*莲', '择期', '胡翰生', '运动医学科', '运动医学科', '肩关节镜下肩袖修补术', '81.8300x008', '1', 'A4', '全麻', '', '', '是', '1.55', '30', '日间', '5', '1', '2022-03-29 12:09:03', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:00:00', '2023-04-16 12:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (83, '20220329', '2361599', 'ZY010001045311', '1045311', '张*贝', '择期', '邱建平', '口腔科', '口腔科', '牙源性颌骨病损切除术', '24.4x00x002', '1', 'A6', '全麻', '', '', '是', '', '21', '一部', '21', '0', '2022-03-29 14:10:13', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (84, '20220329', '2361479', 'ZY010001045376', '1045376', '王*文', '择期', '刘凯峰', '生殖医学中心', '男科', '包皮环切术', '64.0x00', '1', 'A1', '局麻', '', '', '是', '', '30', '日间', '5', '2', '2022-03-29 17:54:52', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:30:00', '2023-04-16 13:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (85, '20220329', '2361582', 'ZY010001043663', '1043663', '沈*培', '择期', '邱建平', '口腔科', '口腔科', '腮腺浅叶切除术', '26.3100x009', '1', 'A2', '全麻', '', '', '是', '', '21', '一部', '21', '2', '2022-03-29 13:51:29', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 17:00:00', '2023-04-16 18:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (86, '20220329', '2361101', 'ZY010001044517', '1044517', '龚*琴', '择期', '何春兰', '普外甲乳外科', '普外甲乳外科', '乳腺局部扩大切除术', '85.2300x001', '3', 'A1', '全麻', '', '', '是', '1.35', '7', '一部', '7', '2', '2022-03-29 16:31:22', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (87, '20220329', '2361800', 'ZY010001044413', '1044413', '刘*明', '急诊', '孙磊', '心内科306', '心内科306', '双腔永久起搏器置入术', '37.8301', '1', 'A5', '局麻+心电监护', '', '', '是', '1.2', '23', '二部', '1', '0', '2022-03-29 14:54:50', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:00:00', '2023-04-16 12:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (88, '20220329', '2361602', 'ZY010001044546', '1044546', '王*玲', '择期', '关兵', '耳鼻咽喉头颈外科', '耳鼻咽喉头颈外科', '中耳活组织检查', '20.3201', '1', 'A2', '全麻', '', '', '是', '', '9', '一部', '9', '1', '2022-03-29 16:30:56', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 16:00:00', '2023-04-16 17:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (89, '20220329', '2361580', 'ZY010001044344', '1044344', '王*', '择期', '周广臣', '泌尿外科', '泌尿外科', '腹腔镜下肾部分切除术', '55.4x03', '3', 'D8', '全麻', '', '', '是', '', '6', '一部', '6', '0', '2022-03-29 14:39:15', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:30:00', '2023-04-16 17:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (90, '20220329', '2361259', 'ZY010001045344', '1045344', '王*宝', '择期', '王业华', '泌尿外科', '泌尿外科', '经尿道膀胱病损电切术', '57.4900x001', '2', 'A4', '全麻', '', '', '是', '1.1', '11', '一部', '11', '0', '2022-03-29 16:42:05', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 17:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (91, '20220329', '2361488', 'ZY010001042481', '1042481', '张*贵', '择期', '何海波', '口腔科', '口腔科', '颈部软组织病损切除术', '83.3904', '1', 'B1', '全麻', '', '', '是', '1.4', '10', '一部', '10', '2', '2022-03-29 16:22:33', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 16:30:00', '2023-04-16 17:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (92, '20220329', '2361516', 'ZY010001044387', '1044387', '金*恒', '择期', '王道荣', '普外胃肠外科', '胃肠中心109', '腹腔镜下胃切除术', '43.9900x003', '2', 'A1', '全麻', '', '', '是', '', '13', '一部', '13', '2', '2022-03-29 13:42:52', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:30:00', '2023-04-16 14:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (93, '20220329', '2361583', 'ZY010001044392', '1044392', '王*', '择期', '董乃俊', '妇科', '妇科', '腹腔镜检查', '54.21', '1', 'A1', '全麻', '', '', '是', '', '8', '一部', '8', '0', '2022-03-29 14:44:36', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 8:00:00', '2023-04-16 09:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (94, '20220329', '2361578', 'ZY010001044419', '1044419', '王*林', '择期', '孙钰', '骨科关节', '骨科关节', '全部膝关节置换', '81.54', '2', 'B1', '会诊麻醉', '', '', '是', '', '16', '一部', '16', '1', '2022-03-29 12:47:28', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (95, '20220329', '2361596', 'ZY010001041946', '1041946', '周*锋', '择期', '周广臣', '泌尿外科', '泌尿外科', '包皮环切术', '64.0x00', '0.5', 'A6', '会诊麻醉', '', '', '是', '', '6', '一部', '6', '0', '2022-03-29 15:37:25', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 18:00:00', '2023-04-16 18:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (96, '20220329', '2361442', 'ZY010001045745', '1045745', '王*', '择期', '刘宏君', '骨科手足', '骨科手足', '桡骨内固定装置去除术', '78.6301', '1', 'A2', '臂丛麻醉', '', '', '是', '', '24', '二部', '2', '0', '2022-03-29 13:04:21', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 10:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (97, '20220329', '2361445', 'ZY010001044999', '1044999', '吴*荣', '择期', '陈兆雷', '普外血管外科', '创伤中心2', '下腔静脉滤器置入术', '38.7x04', '1', 'A2', '局麻+心电监护', '', '是', '是', '10.15', '23', '二部', '1', '0', '2022-03-29 15:57:52', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:30:00', '2023-04-16 13:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (98, '20220329', '2361446', 'ZY010001044999', '1044999', '吴*荣', '择期', '陈兆雷', '普外血管外科', '创伤中心2', '下腔静脉滤器置入术', '38.7x04', '1', 'B2', '局麻+心电监护', '', '是', '是', '10.45', '23', '二部', '1', '0', '2022-03-29 17:26:46', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (99, '20220329', '2361485', 'ZY010001045523', '1045523', '王*文', '择期', '刘凯峰', '生殖医学中心', '男科', '包皮环切术', '64.0x00', '1', 'A2', '局麻', '', '', '是', '', '30', '日间', '5', '3', '2022-03-29 13:05:20', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (100, '20220329', '2361585', 'ZY010001044511', '1044511', '王*丽', '择期', '董乃俊', '妇科', '妇科', '腹腔镜检查', '54.21', '1', 'A2', '全麻', '', '', '是', '', '8', '一部', '8', '1', '2022-03-29 16:00:23', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 09:30:00', '2023-04-16 10:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (101, '20220329', '2361455', 'ZY010001043608', '1043608', '李*', '择期', '王健', '创伤中心', '创伤中心2', '眶骨骨折切开复位内固定术', '76.7903', '1.0', 'A2', '全麻', '', '', '是', '1.1', '16', '一部', '16', '0', '2022-03-29 16:24:02', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (102, '20220329', '2361586', 'ZY010001045306', '1045306', '丁*松', '择期', '王永祥', '骨科脊柱', '骨科脊柱', '经皮椎骨成形术', '81.65', '2', 'A2', '会诊麻醉', '', '', '', '1.4', '', '', '', '1', '2022-03-29 14:22:53', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', NULL, NULL);
INSERT INTO `surgicalapplicationinfo` VALUES (103, '20220329', '2361584', 'ZY010001045008', '1045008', '方*', '择期', '钱建军', '普外肝胆胰外科', '胆胰外科', '腹腔镜下胆囊切除术', '51.23', '1', 'A2', '全麻', '', '', '是', '', '18', '一部', '18', '3', '2022-03-29 12:02:43', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:00:00', '2023-04-16 13:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (104, '20220329', '2361570', 'ZY010001044588', '1044588', '顾*芳', '择期', '董乃俊', '妇科', '妇科', '宫腔镜检查', '68.1200x001', '0.5', 'A4', '全麻', '', '', '是', '', '8', '一部', '8', '3', '2022-03-29 12:28:54', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:00:00', '2023-04-16 11:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (105, '20220329', '2361567', 'ZY010001043527', '1043527', '祁*珍', '择期', '王永祥', '骨科脊柱', '骨科脊柱', '经皮椎骨成形术', '81.65', '2', 'A3', '会诊麻醉', '', '', '是', '10.7', '25', '二部', '3', '3', '2022-03-29 12:09:17', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:00:00', '2023-04-16 17:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (106, '20220329', '2361369', 'ZY010001045268', '1045268', '郝*祥', '择期', 'B', '胸外科', '胸外科', '胸腔镜下肺楔形切除术', '32.2001', '2', 'B2', '全麻', '', '', '是', '', '19', '一部', '19', '1', '2022-03-29 16:17:43', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 12:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (107, '20220329', '2361102', 'ZY010001043554', '1043554', '周*平', '择期', 'A', '胸外科', '胸外科', '胸腔镜下肺病损切除术', '32.2003', '2', 'A2', '全麻', '', '', '是', '', '3', '一部', '3', '0', '2022-03-29 16:34:40', '否', '否', '否', '是', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 12:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (108, '20220329', '2361590', 'ZY010001043708', '1043708', '陈*盼', '择期', '董乃俊', '妇科', '妇科', '宫腔镜检查', '68.1200x001', '0.5', 'A3', '全麻', '', '', '是', '', '8', '一部', '8', '0', '2022-03-29 12:33:46', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:00:00', '2023-04-16 12:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (109, '20220329', '2361481', 'ZY010001045236', '1045236', '方*', '择期', '刘宏君', '骨科手足', '骨科手足', '皮瓣修整术', '86.7503', '1', 'A3', '腰麻', '', '', '是', '', '24', '二部', '2', '2', '2022-03-29 16:47:21', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:00:00', '2023-04-16 12:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (110, '20220329', '2361486', 'ZY010001043144', '1043144', '崔*韬', '择期', '刘凯峰', '生殖医学中心', '男科', '包皮环切术', '64.0x00', '1', 'A3', '局麻', '', '', '是', '', '30', '日间', '5', '4', '2022-03-29 17:28:39', '否', '是', '是', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (111, '20220329', '2361587', 'ZY010001045784', '1045784', '孙*花', '择期', '钱建军', '普外肝胆胰外科', '胆胰外科', '腹腔镜下胆囊切除术', '51.23', '1', 'A3', '全麻', '', '', '是', '', '18', '一部', '18', '2', '2022-03-29 16:11:50', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:30:00', '2023-04-16 14:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (112, '20220329', '2361138', 'ZY010001044658', '1044658', '刘*梅', '择期', 'C', '胸外科', '胸外科', '胸腔镜下肺病损切除术', '32.2003', '2', 'C2', '全麻', '', '', '是', '', '22', '一部', '23', '3', '2022-03-29 12:18:38', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 12:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (113, '20220329', '2361417', 'ZY010001045761', '1045761', '刘*莲', '择期', '赵伟', '普外胃肠外科', '胃肠中心309', '腹腔镜下直肠根治术', '48.6900x002', '2.5', 'A2', '全麻', '', '', '是', '', '5', '一部', '5', '0', '2022-03-29 13:24:41', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 11:00:00', '2023-04-16 13:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (114, '20220329', '2361137', 'ZY010001046208', '1046208', '傅*', '择期', '高红伟', '骨科创伤', '骨科创伤', '胫骨骨折切开复位内固定术', '79.3601', '2.5', 'A2', '会诊麻醉', '', '', '是', '1.25', '26', '二部', '4', '0', '2022-03-29 15:22:01', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 10:30:00', '2023-04-16 13:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (115, '20220329', '2361519', 'ZY010001044746', '1044746', '纪*珠', '择期', '王道荣', '普外胃肠外科', '胃肠中心109', '腹腔镜下胃切除术', '43.9900x003', '2', 'B2', '全麻', '', '', '是', '', '13', '一部', '13', '4', '2022-03-29 16:24:44', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:00:00', '2023-04-16 17:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (116, '20220329', '2361588', 'ZY010001045431', '1045431', '赵*玲', '择期', '钱建军', '普外肝胆胰外科', '胆胰外科', '腹腔镜下胆囊切除术', '51.23', '1', 'A4', '全麻', '', '', '是', '', '18', '一部', '18', '0', '2022-03-29 17:40:56', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:00:00', '2023-04-16 16:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (117, '20220329', '2361593', 'ZY010001045501', '1045501', '王*强', '择期', '王永祥', '骨科脊柱', '骨科脊柱', '脊柱内固定装置去除术', '78.6907', '2', 'A4', '会诊麻醉', '', '', '', '1.2', '', '', '', '0', '2022-03-29 15:02:51', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', NULL, NULL);
INSERT INTO `surgicalapplicationinfo` VALUES (118, '20220329', '2361517', 'ZY010001042875', '1042875', '谢*章', '择期', '王道荣', '普外胃肠外科', '胃肠中心109', '腹腔镜右半结肠切除术', '17.33', '2', 'A2', '全麻', '', '', '是', '', '14', '一部', '26', '0', '2022-03-29 17:27:15', '否', '否', '否', '是', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 17:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (119, '20220329', '2361487', 'ZY010001045990', '1045990', '刘*瑶', '择期', '刘宏君', '骨科手足', '骨科手足', '腱鞘切开术', '83.0101', '1', 'A4', '全麻', '', '', '是', '', '24', '二部', '2', '0', '2022-03-29 15:08:52', '否', '是', '否', '是', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 12:30:00', '2023-04-16 13:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (120, '20220329', '2361135', 'ZY010001045628', '1045628', '黄*飞', '择期', 'A', '胸外科', '胸外科', '胸腔镜下肺病损切除术', '32.2003', '2', 'A3', '全麻', '', '', '是', '', '3', '一部', '3', '1', '2022-03-29 14:38:52', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (121, '20220329', '2361438', 'ZY010001044271', '1044271', '顾*珍', '择期', 'B', '胸外科', '胸外科', '胸腔镜下肺楔形切除术', '32.2001', '2', 'B3', '全麻', '', '', '是', '', '19', '一部', '19', '2', '2022-03-29 12:33:15', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (122, '20220329', '2361373', 'ZY010001044841', '1044841', '孙*强', '择期', '王存祖', '神经外科', '神经外科505', '颅骨修补术', '02.0600x003', '4', 'A2', '全麻', '', '', '是', '10.15', '26', '二部', '4', '4', '2022-03-29 15:30:13', '否', '否', '是', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:30:00', '2023-04-16 17:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (123, '20220329', '2361141', 'ZY010001045582', '1045582', '周*', '择期', 'C', '胸外科', '胸外科', '肺楔形切除术', '32.2904', '4', 'C3', '全麻', '', '', '是', '', '22', '一部', '23', '3', '2022-03-29 17:48:40', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 13:00:00', '2023-04-16 17:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (124, '20220329', '2361600', 'ZY010001046504', '1046504', '倪*珍', '择期', '唐程斌', '心脏大血管病中心', '心脏大血管病中心', '胸大肌移植术', '83.8200x011', '2', 'A2', '全麻', '', '', '是', '1.5', '23', '二部', '1', '0', '2022-03-29 14:35:46', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 17:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (125, '20220329', '2361490', 'ZY010001046659', '1046659', '周*林', '择期', '刘宏君', '骨科手足', '骨科手足', '带蒂皮瓣移植术', '86.7400x026', '1', 'A5', '臂丛麻醉', '', '', '是', '', '24', '二部', '2', '4', '2022-03-29 16:12:32', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:00:00', '2023-04-16 15:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (126, '20220329', '2361496', 'ZY010001046114', '1046114', '于*敏', '择期', '刘宏君', '骨科手足', '骨科手足', '皮肤病损根治性切除术', '86.4x00', '1', 'A6', '局麻', '', '', '是', '', '24', '二部', '2', '0', '2022-03-29 15:16:36', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 16:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (127, '20220329', '2361367', 'ZY010001045438', '1045438', '王*成', '择期', '赵伟', '普外胃肠外科', '胃肠中心309', '腹腔镜下肝部分切除术', '50.2205', '3', 'A3', '全麻', '', '', '是', '', '5', '一部', '5', '0', '2022-03-29 14:39:13', '是', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 14:00:00', '2023-04-16 17:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (128, '20220329', '2361535', 'ZY010001046411', '1046411', '崔*源', '择期', '刘宏君', '骨科手足', '骨科手足', '腱鞘切开术', '83.0101', '1', 'A7', '全麻', '', '', '是', '', '24', '二部', '2', '1', '2022-03-29 12:48:22', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 17:00:00', '2023-04-16 18:00:00');
INSERT INTO `surgicalapplicationinfo` VALUES (129, '20220329', '2361440', 'ZY010001045471', '1045471', '付*东', '择期', '赵伟', '普外胃肠外科', '胃肠中心309', '乙状结肠切除术', '45.7600x008', '2', 'A4', '全麻', '', '', '是', '', '5', '一部', '5', '4', '2022-03-29 16:04:59', '否', '是', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 17:30:00', '2023-04-16 19:30:00');
INSERT INTO `surgicalapplicationinfo` VALUES (130, '20220329', '2361136', 'ZY010001044598', '1044598', '朱*军', '择期', 'B', '胸外科', '胸外科', '胸腔镜肺叶节段切除术', '32.3', '2', 'B4', '全麻', '', '', '是', '', '19', '一部', '19', '2', '2022-03-29 15:52:38', '否', '否', '否', '否', '否', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '是', '2023-04-16 15:30:00', '2023-04-16 17:30:00');

-- ----------------------------
-- Table structure for system_permission
-- ----------------------------
DROP TABLE IF EXISTS `system_permission`;
CREATE TABLE `system_permission`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(4) NULL DEFAULT 0,
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sorted` int(4) NULL DEFAULT NULL,
  `menu_type` int(4) NULL DEFAULT 0,
  `create_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logical_deleted` int(4) NULL DEFAULT 0,
  `show_is` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_permission
-- ----------------------------
INSERT INTO `system_permission` VALUES (1, '数据概览', '/', 'Root', '@/views/index', 0, 'shouye', 1, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (2, '手术排程', '/lineOperation', 'LineOperation', '@/views/lineOperation', 0, 'shoushuwaike', 2, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (3, '添加手术排程', '/lineOperationdetails', 'LineOperationdetails', '@/views/lineOperation/components/lineOperationdetails', 2, 'ceshishenqing', 0, 2, NULL, NULL, 0, 1);
INSERT INTO `system_permission` VALUES (4, '编辑手术排程', '/lineOperationresult', 'LineOperationresult', '@/views/lineOperation/components/lineOperationresult', 2, 'ceshishenqing', 0, 2, NULL, NULL, 0, 1);
INSERT INTO `system_permission` VALUES (5, '手术申请', '/applicationSurgery', 'ApplicationSurgery', '@/views/applyfor', 0, 'ceshishenqing', 3, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (6, '手术申请详情页', '/particulars', 'particulars', '@/views/applyfor/components/particulars', 5, 'ceshishenqing', 0, 2, NULL, NULL, 0, 1);
INSERT INTO `system_permission` VALUES (7, '信息维护', '/infoMaintain', 'InfoMaintain', '', 0, 'navicon-xxwh', 4, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (8, '约束关系', '/relationConstraints', 'RelationConstraints', '@/views/relationConstraints', 7, NULL, 1, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (9, '手术室管理', '/operatingRoomManagement', 'OperatingRoomManagement', '@/views/operatingRoomManagement', 7, NULL, 2, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (10, '手术日设置', '/operationDaySet', 'OperationDaySet', '@/views/operatingRoomManagement/components/operationDaySet', 7, NULL, 3, 0, NULL, NULL, 0, 1);
INSERT INTO `system_permission` VALUES (11, '医疗组管理', '/medicalUnitManagement', 'MedicalUnitManagement', '@/views/medicalUnitManagement', 7, NULL, 4, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (12, '特殊手术管理', '/specialOperationManagement', 'SpecialoperationManagement', '@/views/specialOperationManagement', 7, NULL, 5, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (13, '权限管理', '/authorityMamn', 'AuthorityMamn', NULL, 0, '-quanxianguanli', 5, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (14, '用户管理', '/userset', 'Userset', '@/views/authorityMamn/userset', 13, NULL, 1, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (15, '角色管理', '/roleManagement', 'RoleManagement', '@/views/roleManagement', 13, NULL, 2, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (16, '角色授权', '/roleauthorization', 'roleauthorization', '@/views/roleManagement/components/roleauthorization', 13, NULL, 0, 2, NULL, NULL, 0, 1);
INSERT INTO `system_permission` VALUES (17, '测试', '/test', 'Test', '@/views/test', 0, 'shouye', 6, 0, NULL, NULL, 0, 0);
INSERT INTO `system_permission` VALUES (18, '修改密码', '/changePassword', 'ChangePassword', '@/views/changePassword', 15, NULL, NULL, 2, NULL, NULL, 0, 1);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_role` int(4) NULL DEFAULT NULL,
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mailbox` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_status` int(4) NULL DEFAULT NULL,
  `add_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'admin', '123456', 1, '李四', '李四', '15122569875', '15122569875@qq.com', 0, '2022-01-12 16:42:00');
INSERT INTO `user_info` VALUES (2, '111111', '123456', 2, NULL, NULL, NULL, NULL, 0, '2022-01-12 16:42:00');
INSERT INTO `user_info` VALUES (4, '1', '123456', 2, 'AAAAA', '', '', '', 1, '');
INSERT INTO `user_info` VALUES (8, '1', '123456', 2, 'AAAAA', '', '', '', 0, '2023-02-10 11:40:07');
INSERT INTO `user_info` VALUES (9, '123', '123456', 2, 'AAAA', 'ZZZZ111', NULL, NULL, 0, NULL);
INSERT INTO `user_info` VALUES (10, '1222', '12121212', 1, '1212', '1212', '1212', '1212', 0, '2023-02-10 11:47:28');





-- ----------------------------
-- Table structure for surgicalapplicationinfo_python
-- ----------------------------
DROP TABLE IF EXISTS `surgicalapplicationinfo_python`;
CREATE TABLE `surgicalapplicationinfo_python`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `pseudo_operation_data` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拟手术日期',
  `application_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hospital_serial_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admission_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `patient_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `surgeon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor_department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apply_department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `surgical_coding` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estimated_duration_operation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_sequence` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mode_anesthesia` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whether_operating` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `whether_special_operation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `has_arranged` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `second_round_scheduling_weight` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrange_operating_room_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrange_operating_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `arrange_operating_room` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number_failed_order_grabs` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `submission_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `surgery` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `robot` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interventional_operation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perspective` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `holmium_laser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room3` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room4` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room5` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room6` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room7` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room8` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room9` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room10` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room11` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room12` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room13` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room14` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room15` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room16` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room17` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room18` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room19` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room20` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room21` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room22` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room23` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room24` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room25` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room26` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room27` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room28` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room29` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_operating_room30` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_start_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_end_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


SET FOREIGN_KEY_CHECKS = 1;
