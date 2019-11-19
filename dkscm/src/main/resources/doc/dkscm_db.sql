/*************************************************/
/***********************DKSCM*********************/
-- 创建并使用数据库：dkscm_db

DROP DATABASE IF EXISTS dkscm_db;
CREATE DATABASE dkscm_db;
USE dkscm_db;

-- 系统登录状态表：sys_status
DROP TABLE IF EXISTS sys_status;
CREATE TABLE sys_status(
	status_id INT(10) NOT NULL AUTO_INCREMENT COMMENT'状态主键',
	status_code VARCHAR(100) NOT NULL COMMENT'状态编码',
	status_text VARCHAR(100) NOT NULL COMMENT'状态文本',
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT'修改时间',
	PRIMARY KEY(status_id)
)ENGINE=INNODB CHARSET='utf8mb4' COMMENT='系统状态表';
INSERT INTO sys_status(status_code,status_text) VALUES('ENABLE','启用');
INSERT INTO sys_status(status_code,status_text) VALUES('DISABLE','禁用');
INSERT INTO sys_status(status_code,status_text) VALUES('APPLY','已申请，未购买审批');
INSERT INTO sys_status(status_code,status_text) VALUES('REVIEW','已购买审批，未采购');
INSERT INTO sys_status(status_code,status_text) VALUES('PURCHASE','已采购，未入库审批');
INSERT INTO sys_status(status_code,status_text) VALUES('PERO_REVIEW','已采购，未入库审批');
INSERT INTO sys_status(status_code,status_text) VALUES('REPO','已入库，未领取');
INSERT INTO sys_status(status_code,status_text) VALUES('RECEIVE','已领取');
INSERT INTO sys_status(status_code,status_text) VALUES('RECEIVE_BACK','购买审批驳回');
INSERT INTO sys_status(status_code,status_text) VALUES('REPO_BACK','入库审批驳回');

-- 角色信息表：sys_role
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role(
	role_id INT(10) NOT NULL AUTO_INCREMENT COMMENT'角色主键',
	role_name VARCHAR(255) NOT NULL COMMENT'角色名称',
	status_code VARCHAR(100) NOT NULL COMMENT'状态编码',
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT'修改时间',
	PRIMARY KEY(role_id)
)ENGINE=INNODB CHARSET='utf8mb4' COMMENT='角色信息表';
INSERT INTO sys_role(role_name,status_code) VALUES('超级管理员','ENABLE');
INSERT INTO sys_role(role_name,status_code) VALUES('物资员','ENABLE');
INSERT INTO sys_role(role_name,status_code) VALUES('总经理','ENABLE');
INSERT INTO sys_role(role_name,status_code) VALUES('采购科','ENABLE');
INSERT INTO sys_role(role_name,status_code) VALUES('仓库科','ENABLE');

-- 菜单信息表：sys_menu
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu(
	menu_id INT(10) NOT NULL AUTO_INCREMENT COMMENT'菜单主键',
	parent_id INT(10) NOT NULL COMMENT'上级菜单',
	menu_text VARCHAR(255) NOT NULL COMMENT'菜单文本',
	menu_url VARCHAR(255) NOT NULL COMMENT'链接地址',
	menu_icon VARCHAR(255) NOT NULL COMMENT'菜单图标',
	sort_order INT(3) NOT NULL COMMENT'排序',
	status_code VARCHAR(100) NOT NULL COMMENT'状态编码',
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT'修改时间',
	PRIMARY KEY(menu_id)
)ENGINE=INNODB CHARSET='utf8mb4' COMMENT='菜单信息表';
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(0, '系统管理', '', 'fa fa-tachometer', 1, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(0, '物资采购', '', 'fa fa-truck', 2, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(0, '历史采购', '', 'fa fa-calendar', 3, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(1, '系统用户', 'user/index', 'fa fa-users', 4, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(1, '角色管理', 'role/index', 'fa fa-hand-rock-o', 5, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(1, '我的信息', 'user/detail', 'fa fa-user', 6, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(2, '采购申请', 'order/APPLY/index', 'fa fa-hand-paper-o', 7, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(2, '采购审批', 'order/APPLY/index', 'fa fa-pencil-square-o', 8, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(2, '物资购买', 'order/REVIEW/index', 'fa fa-cart-plus', 9, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(2, '入库审批', 'order/PURCHASE/index', 'fa fa-pencil-square-o', 10, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(2, '物资入库', 'order/REPO_REVIEW/index', 'fa fa-building-o', 11, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(2, '物资领取', 'order/REPO/index', 'fa fa-shopping-basket', 12, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(3, '已领取采购', 'order/RECEIVE/index', 'fa fa-sign-language', 13, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(3, '已申请驳回采购', 'order/REIVEW_BACK/index', 'fa fa-reply', 14, 'ENABLE');
INSERT INTO sys_menu(parent_id, menu_text, menu_url, menu_icon, sort_order, status_code) VALUES(3, '已入库驳回采购', 'order/REPO_BACK/index', 'fa fa-reply-all', 15, 'ENABLE');

-- 角色菜单中间表：sys_role_menu
DROP TABLE IF EXISTS sys_role_menu;
CREATE TABLE sys_role_menu(
	role_id INT(10) NOT NULL COMMENT'角色主键',
	menu_id INT (10) NOT NULL COMMENT'菜单主键'
)ENGINE=INNODB CHARSET='utf8mb4' COMMENT='角色菜单中间表';
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 1);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 2);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 3);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 4);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 5);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 6);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 7);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 8);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 9);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 10);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 11);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 12);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 13);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 14);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(1, 15);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(2, 1);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(2, 2);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(2, 3);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(2, 6);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(2, 7);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(2, 12);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(2, 13);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(2, 14);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(2, 15);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(3, 1);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(3, 2);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(3, 3);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(3, 6);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(3, 8);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(3, 10);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(3, 13);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(3, 14);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(3, 15);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(4, 1);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(4, 2);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(4, 3);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(4, 6);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(4, 9);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(4, 13);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(4, 14);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(4, 15);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(5, 1);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(5, 2);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(5, 3);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(5, 6);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(5, 11);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(5, 13);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(5, 14);
INSERT INTO sys_role_menu(role_id, menu_id) VALUES(5, 15);

-- 用户信息表：sys_user
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user(
	user_id INT(10) NOT NULL AUTO_INCREMENT COMMENT'用户主键',
	user_no VARCHAR(100) COMMENT'用户编码',
	username VARCHAR(255) NOT NULL COMMENT'用户姓名',
	cellphone VARCHAR(100) NOT NULL COMMENT'手机号码',
	PASSWORD VARCHAR(500) NOT NULL COMMENT'登录密码',
	role_id INT(10) NOT NULL COMMENT'角色',
	id_card VARCHAR(100) NOT NULL COMMENT'身份证号码',
	email VARCHAR(500) NOT NULL COMMENT'电子邮件',
	user_photo VARCHAR(500)COMMENT'头像',
	status_code VARCHAR(100) NOT NULL COMMENT'状态编码',
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT'修改时间',
	PRIMARY KEY(user_id)
)ENGINE=INNODB CHARSET='utf8mb4' COMMENT='用户信息表';
INSERT INTO sys_user(user_no, username, cellphone, PASSWORD, role_id, id_card, email, status_code) VALUES('DK000001', 'Angel', '18391626339', 'c973d4a3dbba1ef55d1c6044968fc305', 1, '', '', 'ENABLE');
INSERT INTO sys_user(user_no, username, cellphone, PASSWORD, role_id, id_card, email, status_code) VALUES('DK000002', '索菲娅', '15589054661', 'ba15a18cd3a8fb567e39053022515eb6', 2, '', '', 'ENABLE');
INSERT INTO sys_user(user_no, username, cellphone, PASSWORD, role_id, id_card, email, status_code) VALUES('DK000003', '言希', '15877369690', '43a8152aad6c94d61aedc6d9cd2fd3cc', 3, '', '', 'ENABLE');
INSERT INTO sys_user(user_no, username, cellphone, PASSWORD, role_id, id_card, email, status_code) VALUES('DK000004', '墨菲', '15891160909', '86efe916ecd8c99e3cc523ac0879e26d', 4, '', '', 'ENABLE');
INSERT INTO sys_user(user_no, username, cellphone, PASSWORD, role_id, id_card, email, status_code) VALUES('DK000005', '蒂凡尼', '18709162512', 'a3b7c57bad6565c9551b7ce616c1cbbb', 5, '', '', 'ENABLE');

-- 采购信息表：sys_purchase
DROP TABLE IF EXISTS sys_purchase;
CREATE TABLE sys_purchase(
	purchase_id INT(10) NOT NULL AUTO_INCREMENT COMMENT '采购主键',
	purchase_no VARCHAR(100) COMMENT '采购编码',
	goods_name VARCHAR(500) NOT NULL COMMENT '物资名称',
	goods_band VARCHAR(500) NOT NULL COMMENT '物资品牌',
	goods_type VARCHAR(500) NOT NULL COMMENT '物资型号',
	apply_quantity DECIMAL(10, 2) NOT NULL COMMENT '申请数量',
	goods_unit VARCHAR(50) NOT NULL COMMENT '单位',
	budget DECIMAL(10, 2) NOT NULL COMMENT '采购预算',
	apply_remark VARCHAR(500) NOT NULL COMMENT '申请备注',
	applicant_id INT(10) NOT NULL COMMENT '申请人',
	apply_time TIMESTAMP NOT NULL COMMENT '申请时间',
	reviewer_id INT(10) COMMENT '申请审批人',
	review_remark VARCHAR(500) COMMENT '申请审批意见',
	review_time TIMESTAMP COMMENT '申请审批时间', 
	purchaser_id INT(10) COMMENT '采购人',
	purchase_band VARCHAR(500) COMMENT '采购品牌',
	purchase_type VARCHAR(500) COMMENT '采购型号',
	purchase_quantity DECIMAL(10, 2) COMMENT '采购数量',
	purchase_amount DECIMAL(10, 2) COMMENT '采购金额',
	purchase_remark VARCHAR(500) COMMENT '采购备注',
	purchase_time TIMESTAMP COMMENT '采购时间',
	repo_reviewer_id INT(10) COMMENT '入库审批人',
	repo_review_remark VARCHAR(500) COMMENT '入库审批备注',
	repo_review_time TIMESTAMP COMMENT '入库审批时间',
	receiver_id INT(10) COMMENT '领取人',
	receiver_remark VARCHAR(500) COMMENT '领取备注',
	receive_time TIMESTAMP COMMENT '领取时间',
	status_code VARCHAR(100) NOT NULL COMMENT '状态编码',
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	PRIMARY KEY(purchase_id)
)ENGINE=INNODB CHARSET='utf8mb4' COMMENT='采购信息表';







