/*����courseman��ݿ�*/
create database ddwmitem;
/*�л���courseman��ݿ�*/
use ddwmitem;
/*��������Ա��*/
CREATE TABLE wm_user(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
loginname varchar(40) NOT NULL,/*��¼��*/
username varchar(20) NOT NULL,/*��ʵ����*/
password varchar(40) NOT NULL,/*��¼����*/
privilege char(1) NOT NULL DEFAULT '0',	/*�û�Ȩ�ޣ�1��?������Ա��Ȩ�����ӹ���Ա��Ĭ��Ϊ0*/
idcard varchar(20) NOT NULL /* �û����֤�ţ�ʶ�����ĸ���*/
);
/*���һ����������Ա�����ڽ�����ӹ���Ա*/
insert into wm_user(loginname,username,password,privilege,idcard) values('admin','��������Ա','ddwm866','1','1111111111111');

/*��������Ա������¼��*/
CREATE TABLE wm_operate_log(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
userid int NOT NULL,/*����Աid�����*/
loginname varchar(40) NOT NULL,/*����Ա��¼��*/
operatetype varchar(4) NOT NULL,/*�������ͣ����ӣ�ɾ���޸ģ�*/
operatedis varchar(100) NoT NULL,/*��������*/
operatetime DATETIME  NOT NULL,/*����ʱ��*/
foreign key (userid) references wm_user(id)
);

/*������Ʒ���ͱ�*/
CREATE TABLE wm_producttype(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(20) NOT NULL,/*������*/
parentid int NOT NULL,/*����id*/
protypestate char(1) NOT NULL/*��Ʒ���͵�״̬*/
);

/*������Ʒ��*/
CREATE TABLE wm_product(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
name varchar(40) NOT NULL,/*��Ʒ���ʽ����Ʒ��+��Ʒ�ͺţ�*/
protypename varchar(20)NOT NULL,/*��Ʒ�������*/
productdes varchar(1000), /*��Ʒ����*/
pictureurl varchar(100), /*��Ʒ��ӦͼƬ��url*/
productstate char(1) NOT NULL/*��Ʒ״̬��0Ϊ����ʾ�����Σ� 1Ϊ��ʾ��չʾ�У�Ĭ�ϣ�*/
);

/*������ƷͼƬ�?��Ʒ�زı?*/
CREATE TABLE wm_picture(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
pictureurl varchar(100) NOT NULL, /*��Ʒ��ӦͼƬ��url*/
protypename varchar(100) NOT NULL/*��Ʒ���������*/
);

/*�������ű�*/
CREATE TABLE wm_news(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
title varchar(50), /*���ű���*/
content varchar(2000) NOT NULL,/*��������*/
authorname varchar(20),/*����Ա����*/
authorid int NOT NULL,/*����Աid*/
createtime Date ,/*����Ա���ʱ��*/
foreign key (authorid) references wm_user(id)
);

/*�������Ա�*/
CREATE TABLE wm_words(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
title varchar(50), /*���Ա���*/
content varchar(2000) NOT NULL,/*��������*/
createtime DATETIME NOT NULL,/*����ʱ��*/
tel varchar(50),/*������tel*/
qq varchar(50),/*������qq*/
name varchar(50)/*����������*/
);

/*����֪ʶ���*/
CREATE TABLE wm_tech(
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
title varchar(50), /*֪ʶ����*/
content varchar(2000) NOT NULL/*�������ͣ�1.�ı�������2.�ĵ�url*/
);
/*����courseman�û�����courseman��ݿ��ȫ��Ȩ�ޡ�
Ϊ��������û�������ݿ�ͬ����û�����������
����������Ϊabc123*/
grant all privileges on ddwmitem.* to ddwmitem@'%'
identified by 'ddwn123';