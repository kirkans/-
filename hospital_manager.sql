/*
 Navicat Premium Dump SQL

 Source Server         : kirk
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : hospital_manager

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 27/12/2025 19:20:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1766665902998-1697438073596-avatar.png', 'ADMIN', '13677889922', 'admin@xm.com');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '科室名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '科室描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '科室信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '内科', '内科');
INSERT INTO `department` VALUES (2, '五官科', '五官科');
INSERT INTO `department` VALUES (3, '肿瘤科', '肿瘤科');
INSERT INTO `department` VALUES (4, '心脑血管', '心脑血管');
INSERT INTO `department` VALUES (5, '妇科', '妇科');
INSERT INTO `department` VALUES (6, '儿科', '儿科');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '简介',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '挂号费',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入职时间',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职位',
  `department_id` int NULL DEFAULT NULL COMMENT '科室ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '医生信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '张沐妍', '123456', '张沐妍', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：高血压顽疾诊治、心律失常药物调节。\n从业背景：重视预防医学，在社区开展高血压防治宣教十余载。', 10.00, '2025-09-01', '主治医师', 4);
INSERT INTO `doctor` VALUES (2, '陈清瑶', '123456', '陈清瑶', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：围产期保健、高危妊娠管理、妇科内分泌疾病（如多囊卵巢综合征）\n从业背景：毕业于复旦大学上海医学院，从事妇产科临床工作 22 年，曾任省级妇幼保健院产科主任，擅长处理妊娠期糖尿病、胎盘早剥、产后出血等高危情况，每年接诊孕产妇超 3000 人次，牵头开展 “孕期心理干预” 公益项目，降低孕期抑郁发生率。\n患者评价：“温柔且专业，总能在孕期焦虑时给出安心的指导”，尤其在女性备孕调理、产后康复指导方面深受患者信任。', 20.00, '2025-08-01', '主治医师', 5);
INSERT INTO `doctor` VALUES (10, '张三', '123456', '张三', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：呼吸系统疾病、慢性支气管炎、肺部感染。\n从业背景：从事内科临床工作15年，擅长慢性病管理与老年病综合治疗。', 30.00, '2025-01-10', '副主任医师', 1);
INSERT INTO `doctor` VALUES (11, '王建国', '123456', '王建国', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：消化内科、胃溃疡、肝硬化诊治。\n从业背景：医学博士，曾在三甲医院担任内科副主任，发表学术论文20余篇。', 50.00, '2025-02-15', '主任医师', 1);
INSERT INTO `doctor` VALUES (12, '赵丽华', '123456', '赵丽华', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：内分泌系统、糖尿病足、甲状腺疾病。\n从业背景：擅长精细化调理中老年代谢类疾病，患者满意度高。', 40.00, '2025-03-01', '主治医师', 1);
INSERT INTO `doctor` VALUES (13, '周明远', '123456', '周明远', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：过敏性鼻炎、慢性咽喉炎微创手术。\n从业背景：深耕耳鼻喉科20年，拥有数千例手术成功经验。', 35.00, '2025-01-20', '副主任医师', 2);
INSERT INTO `doctor` VALUES (14, '吴佩珊', '123456', '吴佩珊', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：白内障复明手术、青少年近视防控。\n从业背景：眼科资深专家，致力于儿童视力健康公益活动多年。', 60.00, '2025-04-12', '主任医师', 2);
INSERT INTO `doctor` VALUES (15, '孙杰', '123456', '孙杰', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：口腔修复、牙齿正畸、种植牙技术。\n从业背景：毕业于口腔医学院，擅长各类复杂阻生齿拔除及美学修复。', 45.00, '2025-05-18', '主治医师', 2);
INSERT INTO `doctor` VALUES (16, '陈默', '123456', '陈默', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：肺癌综合治疗、化疗方案优化、靶向药物研究。\n从业背景：肿瘤学博士后，主持多项国家级抗癌研究课题。', 100.00, '2025-02-01', '首席专家', 3);
INSERT INTO `doctor` VALUES (17, '林晓峰', '123456', '林晓峰', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：消化道肿瘤手术、腹腔镜微创切除。\n从业背景：擅长早癌筛查与晚期肿瘤姑息治疗，坚持人文关怀。', 80.00, '2025-03-10', '副主任医师', 3);
INSERT INTO `doctor` VALUES (18, '顾清', '123456', '顾清', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：放疗精确打击技术、放化疗结合治疗。\n从业背景：拥有多年大型放射设备操作与方案规划经验。', 70.00, '2025-06-05', '主治医师', 3);
INSERT INTO `doctor` VALUES (19, '郑大为', '123456', '郑大为', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：冠心病介入治疗、支架置入手术。\n从业背景：曾多次赴海外研修心血管介入技术，手术风格稳健。', 90.00, '2025-01-05', '主任医师', 4);
INSERT INTO `doctor` VALUES (20, '冯志刚', '123456', '冯志刚', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：脑梗死急性期治疗、脑血管狭窄介入。\n从业背景：神内专家，擅长中风后遗症的早期康复评估与干预。', 85.00, '2025-04-22', '副主任医师', 4);
INSERT INTO `doctor` VALUES (22, '杨桃', '123456', '杨桃', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：新生儿黄疸、小儿肺炎、生长发育评估。\n从业背景：性格亲和，擅长与患儿沟通，深得家长信赖。', 40.00, '2025-02-28', '副主任医师', 6);
INSERT INTO `doctor` VALUES (23, '楚云帆', '123456', '楚云帆', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：儿童哮喘、脱敏治疗、小儿免疫系统疾病。\n从业背景：知名医科大学儿科硕士，在核心期刊发表多篇论文。', 65.00, '2025-05-15', '主任医师', 6);
INSERT INTO `doctor` VALUES (24, '贾玲玲', '123456', '贾玲玲', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：儿童营养学、厌食症、多动症心理辅导。\n从业背景：双重背景（医学+心理学），关注儿童身心全面健康。', 50.00, '2025-08-10', '主治医师', 6);
INSERT INTO `doctor` VALUES (25, '苏月华', '123456', '苏月华', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：妇科良恶性肿瘤诊治、宫腹腔镜微创手术。\n从业背景：主任医师，从事妇产科临床工作近30年，在处理复杂子宫肌瘤、卵巢囊肿及子宫内膜异位症方面具有极高造诣，微创手术风格细腻。', 75.00, '2025-03-20', '科室主任', 5);
INSERT INTO `doctor` VALUES (26, '林静', '123456', '林静', 'http://localhost:9090/files/ys.png', 'DOCTOR', NULL, NULL, '专业领域：不孕不育症、月经不调、多囊卵巢综合征。\n从业背景：擅长中西医结合治疗妇科内分泌疾病，在排卵障碍性不孕及辅助生殖技术咨询方面经验丰富，已成功帮助众多家庭实现生育梦想。', 65.00, '2025-06-15', '副主任医师', 5);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天系统正式上线，开始内测', '今天系统正式上线，开始内测', '2025-09-05', 'admin');
INSERT INTO `notice` VALUES (4, '关于2024年春节期间门诊安排的通知', '尊敬的患者：我院春节期间急诊24小时开诊，正月初一至初三普通门诊停诊，初四恢复正常接诊。请合理安排就医时间。', '2025-11-01', 'admin');
INSERT INTO `notice` VALUES (5, '关爱女性健康：乳腺外科大型义诊活动预告', '为提高女性健康意识，我院乳腺外科将于本周五上午在门诊大厅举办免费咨询与超声筛查活动，限额50名。', '2025-11-15', 'admin');
INSERT INTO `notice` VALUES (6, '我院正式上线“诊间支付”功能', '为减少排队等待时间，患者现在可通过手机扫描处方单上的二维码直接缴费，无需再往返窗口。', '2025-11-20', 'admin');
INSERT INTO `notice` VALUES (7, '省人民医院心内科专家定期坐诊公告', '即日起，省人民医院心内科王主任将于每周二下午在我院专家门诊坐诊，欢迎广大患者预约咨询。', '2025-12-01', 'admin');
INSERT INTO `notice` VALUES (8, '医保异地结算政策最新调整说明', '根据上级部门要求，即日起异地就医备案流程简化，参保人员可通过“国家医保服务平台”APP直接办理，详情请咨询医保办。', '2025-12-05', 'admin');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生ID',
  `num` int NULL DEFAULT NULL COMMENT '就诊数量',
  `week` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '周几',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '排班信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES (1, 11, 10, '星期一');
INSERT INTO `plan` VALUES (2, 11, 10, '星期三');
INSERT INTO `plan` VALUES (3, 11, 15, '星期六');
INSERT INTO `plan` VALUES (4, 10, 15, '星期二');
INSERT INTO `plan` VALUES (5, 10, 15, '星期四');
INSERT INTO `plan` VALUES (6, 10, 20, '星期日');
INSERT INTO `plan` VALUES (7, 14, 10, '星期二');
INSERT INTO `plan` VALUES (8, 14, 10, '星期五');
INSERT INTO `plan` VALUES (9, 14, 15, '星期六');
INSERT INTO `plan` VALUES (10, 13, 15, '星期一');
INSERT INTO `plan` VALUES (11, 13, 15, '星期四');
INSERT INTO `plan` VALUES (12, 13, 20, '星期日');
INSERT INTO `plan` VALUES (13, 16, 8, '星期三');
INSERT INTO `plan` VALUES (14, 16, 8, '星期五');
INSERT INTO `plan` VALUES (15, 16, 12, '星期日');
INSERT INTO `plan` VALUES (16, 19, 10, '星期一');
INSERT INTO `plan` VALUES (17, 19, 10, '星期四');
INSERT INTO `plan` VALUES (18, 19, 15, '星期六');
INSERT INTO `plan` VALUES (19, 25, 12, '星期二');
INSERT INTO `plan` VALUES (20, 25, 12, '星期四');
INSERT INTO `plan` VALUES (21, 25, 15, '星期日');
INSERT INTO `plan` VALUES (22, 23, 15, '星期三');
INSERT INTO `plan` VALUES (23, 23, 15, '星期五');
INSERT INTO `plan` VALUES (24, 23, 20, '星期六');
INSERT INTO `plan` VALUES (25, 20, 20, '星期二');
INSERT INTO `plan` VALUES (26, 20, 20, '星期五');
INSERT INTO `plan` VALUES (27, 20, 25, '星期日');
INSERT INTO `plan` VALUES (28, 22, 20, '星期一');
INSERT INTO `plan` VALUES (29, 22, 20, '星期四');
INSERT INTO `plan` VALUES (30, 22, 25, '星期六');
INSERT INTO `plan` VALUES (31, 26, 20, '星期三');
INSERT INTO `plan` VALUES (32, 26, 20, '星期五');
INSERT INTO `plan` VALUES (33, 26, 25, '星期六');
INSERT INTO `plan` VALUES (34, 17, 20, '星期二');
INSERT INTO `plan` VALUES (35, 17, 20, '星期四');
INSERT INTO `plan` VALUES (36, 17, 25, '星期日');
INSERT INTO `plan` VALUES (37, 12, 30, '星期一');
INSERT INTO `plan` VALUES (38, 12, 30, '星期二');
INSERT INTO `plan` VALUES (39, 12, 30, '星期五');
INSERT INTO `plan` VALUES (40, 12, 35, '星期六');
INSERT INTO `plan` VALUES (41, 15, 30, '星期二');
INSERT INTO `plan` VALUES (42, 15, 30, '星期三');
INSERT INTO `plan` VALUES (43, 15, 30, '星期四');
INSERT INTO `plan` VALUES (44, 15, 35, '星期日');
INSERT INTO `plan` VALUES (45, 18, 30, '星期一');
INSERT INTO `plan` VALUES (46, 18, 30, '星期三');
INSERT INTO `plan` VALUES (47, 18, 30, '星期五');
INSERT INTO `plan` VALUES (48, 18, 35, '星期六');
INSERT INTO `plan` VALUES (53, 24, 30, '星期一');
INSERT INTO `plan` VALUES (54, 24, 30, '星期三');
INSERT INTO `plan` VALUES (55, 24, 30, '星期四');
INSERT INTO `plan` VALUES (56, 24, 35, '星期六');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int NULL DEFAULT NULL COMMENT '患者ID',
  `doctor_id` int NULL DEFAULT NULL COMMENT '医生ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '就诊时间',
  `medical_record` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '医嘱病历',
  `inhospital` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否住院',
  `inhostpital_record` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否住院登记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '就诊记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 1, 1, '2025-09-03', '<p>测试病例测试病例测试病例</p><p>测试病例测试病例测试病例</p><p>测试病例测试病例测试病例</p>', '是', '是');
INSERT INTO `record` VALUES (2, 2, 16, '2025-12-26', NULL, NULL, '否');

-- ----------------------------
-- Table structure for registration
-- ----------------------------
DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int NULL DEFAULT NULL COMMENT '患者ID',
  `room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '房号',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '费用',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '缴费状态',
  `medicine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否医保',
  `hos_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '住院状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '住院登记表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of registration
-- ----------------------------
INSERT INTO `registration` VALUES (1, 1, '101', 1000.00, '已缴费', '是', '住院中');

-- ----------------------------
-- Table structure for reserve
-- ----------------------------
DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '挂号信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reserve
-- ----------------------------
INSERT INTO `reserve` VALUES (1, 1, 1, '2025-09-03 00:00:00', '已叫号');
INSERT INTO `reserve` VALUES (2, 16, 2, '2025-12-26 00:00:00', '已叫号');
INSERT INTO `reserve` VALUES (3, 23, 2, '2025-12-26 00:00:00', '未叫号');
INSERT INTO `reserve` VALUES (4, 14, 2, '2025-12-26 00:00:00', '未叫号');
INSERT INTO `reserve` VALUES (5, 20, 2, '2025-12-26 00:00:00', '未叫号');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `account` double(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '患者信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test1', '123456', 'test1', 'http://localhost:9090/files/1766665944259-1723166858271-1697621121476-boy.png', 'USER', NULL, NULL, 140.00);
INSERT INTO `user` VALUES (2, '陈晋安', '123123', '陈晋安', NULL, 'USER', NULL, NULL, 9790.00);

SET FOREIGN_KEY_CHECKS = 1;
