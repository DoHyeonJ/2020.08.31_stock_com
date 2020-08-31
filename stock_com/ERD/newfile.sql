SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS st_board;
DROP TABLE IF EXISTS st_comment;
DROP TABLE IF EXISTS st_member;




/* Create Tables */

CREATE TABLE st_board
(
	-- �Խ��� ������ȣ
	board_uid int NOT NULL COMMENT '�Խ��� ������ȣ',
	-- �Խñ� �ۼ����̸�
	board_name varchar(20) NOT NULL COMMENT '�Խñ� �ۼ����̸�',
	-- �Խñ� ����
	board_title varchar(50) NOT NULL COMMENT '�Խñ� ����',
	-- �Խñ� ����
	board_content varchar(200) COMMENT '�Խñ� ����',
	-- �Խñ� �ۼ���
	board_date date NOT NULL COMMENT '�Խñ� �ۼ���',
	-- �Խñ� ��ȸ��
	board_viewcnt int NOT NULL COMMENT '�Խñ� ��ȸ��',
	PRIMARY KEY (board_uid)
);


CREATE TABLE st_comment
(
	-- ��� ������ȣ
	comment_uid int NOT NULL COMMENT '��� ������ȣ',
	-- �Խñ� ��ȣ
	comment_con_num int NOT NULL COMMENT '�Խñ� ��ȣ',
	-- ��� �ۼ��ڸ�
	comment_name varchar(10) COMMENT '��� �ۼ��ڸ�',
	-- ��� ��й�ȣ
	comment_pw varchar(20) NOT NULL COMMENT '��� ��й�ȣ',
	-- ��� ����
	comment_content varchar(100) NOT NULL COMMENT '��� ����',
	-- ��� �ۼ���
	comment_date date NOT NULL COMMENT '��� �ۼ���',
	PRIMARY KEY (comment_uid)
);


CREATE TABLE st_member
(
	-- ȸ�� ������ȣ
	member_uid int(1) NOT NULL AUTO_INCREMENT COMMENT 'ȸ�� ������ȣ',
	-- ȸ�� �̸�
	member_name varchar(20) NOT NULL COMMENT 'ȸ�� �̸�',
	-- ȸ�� id
	member_id varchar(20) DEFAULT '' NOT NULL COMMENT 'ȸ�� id',
	-- ȸ�� pw
	member_pw varchar(20) NOT NULL COMMENT 'ȸ�� pw',
	-- ȸ�� email
	member_email varchar(50) NOT NULL COMMENT 'ȸ�� email',
	-- ȸ�� ����
	member_gender varchar(2) NOT NULL COMMENT 'ȸ�� ����',
	-- ȸ�� ����
	member_birth date COMMENT 'ȸ�� ����',
	-- ȸ�� ��ȭ��ȣ
	member_phone varchar(20) NOT NULL COMMENT 'ȸ�� ��ȭ��ȣ',
	PRIMARY KEY (member_uid),
	UNIQUE (member_id),
	UNIQUE (member_email)
);



