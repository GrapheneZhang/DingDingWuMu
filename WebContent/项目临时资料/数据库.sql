create database ddwmitem;

use ddwmitem;

CREATE TABLE wm_user(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
loginname varchar(40) NOT NULL,
username varchar(20) NOT NULL,
password varchar(40) NOT NULL,
privilege char(1) NOT NULL DEFAULT '0',
idcard varchar(20) NOT NULL
);

insert into wm_user(loginname,username,password,privilege,idcard) values('admin','超级管理员','ddwm866','1','1111111111111');

CREATE TABLE wm_operate_log(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
userid int NOT NULL,
loginname varchar(40) NOT NULL,
operatetype varchar(4) NOT NULL,
operatedis varchar(100) NoT NULL,
operatetime DATETIME  NOT NULL,
foreign key (userid) references wm_user(id)
);


CREATE TABLE wm_producttype(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(20) NOT NULL,
parentid int NOT NULL,
protypestate char(1) NOT NULL
);

CREATE TABLE wm_product(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(40) NOT NULL,
protypename varchar(20)NOT NULL,
productdes varchar(1000), 
pictureurl varchar(100), 
productstate char(1) NOT NULL
);


CREATE TABLE wm_picture(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
pictureurl varchar(100) NOT NULL, 
protypename varchar(100) NOT NULL
);

CREATE TABLE wm_news(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
title varchar(50),
--content varchar(2000) NOT NULL,虽然u8占1个varchar就可表示汉字，但不知道将来用的数据库是否是u8编码
content varchar(20000) NOT NULL,
authorid int NOT NULL,
createtime Date,
foreign key (authorid) references wm_user(id)
);

CREATE TABLE wm_words(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
title varchar(50), 
content varchar(2000) NOT NULL,
createtime DATETIME NOT NULL,
tel varchar(50),
qq varchar(50),
name varchar(50)
);

CREATE TABLE wm_tech(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
title varchar(50), 
content varchar(2000) NOT NULL
);

grant all privileges on ddwmitem.* to ddwmitem@'%'
identified by 'ddwn123';