SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS st_board;
DROP TABLE IF EXISTS st_comment;
DROP TABLE IF EXISTS st_member;




/* Create Tables */

CREATE TABLE st_board
(
	-- 게시판 고유번호
	board_uid int NOT NULL AUTO_INCREMENT COMMENT '게시판 고유번호',
	-- 게시글 제목
	board_title varchar(50) NOT NULL COMMENT '게시글 제목',
	-- 게시글 내용
	board_content varchar(200) COMMENT '게시글 내용',
	-- 게시글 작성일
	board_date datetime NOT NULL COMMENT '게시글 작성일',
	-- 게시글 조회수
	board_viewcnt int NOT NULL COMMENT '게시글 조회수',
	PRIMARY KEY (board_uid)
);


CREATE TABLE st_comment
(
	-- 댓글 고유번호
	comment_uid int NOT NULL AUTO_INCREMENT COMMENT '댓글 고유번호',
	-- 게시글 번호
	comment_con_num int NOT NULL COMMENT '게시글 번호',
	-- 댓글 작성자명
	comment_name varchar(10) COMMENT '댓글 작성자명',
	-- 댓글 비밀번호
	comment_pw varchar(20) NOT NULL COMMENT '댓글 비밀번호',
	-- 댓글 내용
	comment_content varchar(100) NOT NULL COMMENT '댓글 내용',
	-- 댓글 작성일
	comment_date date NOT NULL COMMENT '댓글 작성일',
	PRIMARY KEY (comment_uid)
);


CREATE TABLE st_member
(
	-- 회원 고유번호
	member_uid int NOT NULL AUTO_INCREMENT COMMENT '회원 고유번호',
	-- 회원 이름
	member_name varchar(20) NOT NULL COMMENT '회원 이름',
	-- 회원 id
	member_id varchar(20) DEFAULT '' NOT NULL COMMENT '회원 id',
	-- 회원 pw
	member_pw varchar(20) NOT NULL COMMENT '회원 pw',
	-- 회원 email
	member_email varchar(50) NOT NULL COMMENT '회원 email',
	-- 회원 성별
	member_gender varchar(2) NOT NULL COMMENT '회원 성별',
	-- 회원 생일
	member_birth date COMMENT '회원 생일',
	-- 회원 전화번호
	member_phone varchar(20) NOT NULL COMMENT '회원 전화번호',
	PRIMARY KEY (member_uid),
	UNIQUE (member_id),
	UNIQUE (member_email)
);



