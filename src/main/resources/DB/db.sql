SET SESSION sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

-- CREATE DATABASE --
DROP DATABASE IF EXISTS CALENDAR_DB;
CREATE DATABASE CALENDAR_DB DEFAULT CHARACTER SET utf8;

-- USE DATABASE --
USE CALENDAR_DB;

-- DROP TABLES --
DROP TABLE IF EXISTS tbl_role;
DROP TABLE IF EXISTS tbl_user;
DROP TABLE IF EXISTS tbl_event;
DROP TABLE IF EXISTS tbl_user_event;

-- TABLE ROLE --
CREATE TABLE tbl_role(
  role_code INTEGER NOT NULL COMMENT '角色ID',
  role_name VARCHAR(20) UNIQUE NOT NULL COMMENT '角色名',
  PRIMARY KEY(role_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- TABLE USER --
CREATE TABLE tbl_user(
  user_id BIGINT AUTO_INCREMENT COMMENT '用户ID',
  user_name VARCHAR(12) UNIQUE NOT NULL COMMENT '用户名',
  mail_address VARCHAR(50) COMMENT '用户邮箱',
  user_avatar VARCHAR(50) NOT NULL DEFAULT 'img/avatar/default/default-avatar.png' COMMENT '用户头像',
  password VARCHAR(64) NOT NULL COMMENT '用户密码',
  password_salt VARCHAR(64) NOT NULL COMMENT '密码盐值',
  now_action VARCHAR(128) COMMENT '当前状态',
  session_id VARCHAR(64) COMMENT '会话ID',
  current_login_datetime TIMESTAMP COMMENT '最近登录时间',
  delete_flag TINYINT NOT NULL COMMENT '是否已删除',
  PRIMARY KEY(user_id)
) ENGINE=InnoDB AUTO_INCREMENT=10000001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- TABLE EVENT --
CREATE TABLE tbl_event(
  event_id BIGINT AUTO_INCREMENT COMMENT '事件ID',
  event_title VARCHAR (32) NOT NULL COMMENT '事件标题',
  event_content VARCHAR(128) COMMENT '事件详细',
  event_start_date DATE NOT NULL COMMENT '事件开始日期',
  event_start_time TIME COMMENT '事件开始时间',
  event_end_date DATE COMMENT '事件结束日期',
  event_end_time TIME COMMENT '事件结束时间',
  event_color VARCHAR(10) NOT NULL COMMENT '事件结束时间',
  event_owner_id BIGINT NOT NULL COMMENT '事件所有者ID',
  PRIMARY KEY(event_id)
) ENGINE=InnoDB AUTO_INCREMENT=10000001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- TABLE USER_EVENT --
CREATE TABLE tbl_user_event(
  user_id BIGINT COMMENT '用户ID',
  event_id BIGINT COMMENT '事件ID',
  PRIMARY KEY(user_id, event_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

