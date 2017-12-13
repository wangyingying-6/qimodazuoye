prompt PL/SQL Developer import file
prompt Created on 2015年9月4日 by Administrator
set feedback off
set define off
prompt Creating BOOK...
create table BOOK
(
  bid       VARCHAR2(18) not null,
  userid    VARCHAR2(18) not null,
  rid       VARCHAR2(18) not null,
  starttime DATE not null,
  endtime   DATE not null,
  rprice    NUMBER,
  btime     DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BOOK
  add constraint BID primary key (BID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating COMMENTTABLE...
create table COMMENTTABLE
(
  rid    VARCHAR2(18) not null,
  sname  VARCHAR2(50) not null,
  userid VARCHAR2(18),
  cdesc  VARCHAR2(500) not null,
  ctime  DATE not null,
  cmid   VARCHAR2(18) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table COMMENTTABLE
  add constraint CMID primary key (CMID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ODETAIL...
create table ODETAIL
(
  odid VARCHAR2(18) not null,
  rid  VARCHAR2(18) not null,
  oid  VARCHAR2(18) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ODETAIL
  add constraint OODID primary key (ODID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating UINFO...
create table UINFO
(
  userid   VARCHAR2(18) not null,
  password VARCHAR2(8) not null,
  role     VARCHAR2(20),
  status   VARCHAR2(20),
  wrongnum NUMBER,
  username VARCHAR2(50) not null,
  cardid   VARCHAR2(20),
  sex      VARCHAR2(20),
  tele     VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table UINFO
  add constraint UERID primary key (USERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ORDERTABLE...
create table ORDERTABLE
(
  oid        VARCHAR2(18) not null,
  userid     VARCHAR2(18) not null,
  totalprice NUMBER(8,2) not null,
  otime      DATE not null,
  ostatus    VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERTABLE
  add constraint OOOEID primary key (OID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ORDERTABLE
  add constraint UUSERID foreign key (USERID)
  references UINFO (USERID);

prompt Creating ROOM...
create table ROOM
(
  rid     VARCHAR2(18) not null,
  sname   VARCHAR2(20) not null,
  rstatus VARCHAR2(20) not null,
  rprice  NUMBER(8,2) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add constraint RRID primary key (RID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating STYPE...
create table STYPE
(
  sid      VARCHAR2(18) not null,
  sname    VARCHAR2(50) not null,
  totalnum NUMBER not null,
  simage   VARCHAR2(200) not null,
  sdesc    VARCHAR2(500) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STYPE
  add constraint SSID primary key (SID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for BOOK...
alter table BOOK disable all triggers;
prompt Disabling triggers for COMMENTTABLE...
alter table COMMENTTABLE disable all triggers;
prompt Disabling triggers for ODETAIL...
alter table ODETAIL disable all triggers;
prompt Disabling triggers for UINFO...
alter table UINFO disable all triggers;
prompt Disabling triggers for ORDERTABLE...
alter table ORDERTABLE disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for STYPE...
alter table STYPE disable all triggers;
prompt Disabling foreign key constraints for ORDERTABLE...
alter table ORDERTABLE disable constraint UUSERID;
prompt Loading BOOK...
insert into BOOK (bid, userid, rid, starttime, endtime, rprice, btime)
values ('b20150626145311853', 'u20150613173432259', 'r20150618133623001', to_date('01-06-2015', 'dd-mm-yyyy'), to_date('03-06-2015', 'dd-mm-yyyy'), 0, to_date('26-06-2015 14:53:11', 'dd-mm-yyyy hh24:mi:ss'));
insert into BOOK (bid, userid, rid, starttime, endtime, rprice, btime)
values ('b20150623133755418', 'u20150623111821641', 'r20150619105508806', to_date('10-06-2015', 'dd-mm-yyyy'), to_date('25-06-2015', 'dd-mm-yyyy'), 0, to_date('23-06-2015 13:37:55', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 2 records loaded
prompt Loading COMMENTTABLE...
insert into COMMENTTABLE (rid, sname, userid, cdesc, ctime, cmid)
values ('101', '标准间', null, '啊啊啊啊', to_date('18-06-2015 13:37:04', 'dd-mm-yyyy hh24:mi:ss'), 'c20150618133656132');
insert into COMMENTTABLE (rid, sname, userid, cdesc, ctime, cmid)
values ('111', 'aaa', 'u20150613171407637', 'sdds', to_date('26-06-2015 11:35:18', 'dd-mm-yyyy hh24:mi:ss'), 'c20150626113510562');
commit;
prompt 2 records loaded
prompt Loading ODETAIL...
insert into ODETAIL (odid, rid, oid)
values ('d20150626130751817', 'r20150618133623001', 'o20150626130751785');
insert into ODETAIL (odid, rid, oid)
values ('d20150626125013752', 'r20150618133623001', 'o20150626125013706');
commit;
prompt 2 records loaded
prompt Loading UINFO...
insert into UINFO (userid, password, role, status, wrongnum, username, cardid, sex, tele)
values ('u20150613173432259', '111', 'member', '1', 0, 'aaa', '33333', '男', '456768');
insert into UINFO (userid, password, role, status, wrongnum, username, cardid, sex, tele)
values ('u20150613145940203', '123', 'member', '1', 0, 'zhangsan', '213', '男', '333');
insert into UINFO (userid, password, role, status, wrongnum, username, cardid, sex, tele)
values ('u20150623111821641', '111', 'member', '1', 0, 'sss', '3423', '男', '343');
insert into UINFO (userid, password, role, status, wrongnum, username, cardid, sex, tele)
values ('u20150613171407637', '123', 'admin', '1', 1, 'admin', '34455', '男', '56565');
commit;
prompt 4 records loaded
prompt Loading ORDERTABLE...
insert into ORDERTABLE (oid, userid, totalprice, otime, ostatus)
values ('o20150626125013706', 'u20150613173432259', 200, to_date('26-06-2015 12:50:13', 'dd-mm-yyyy hh24:mi:ss'), '=2');
insert into ORDERTABLE (oid, userid, totalprice, otime, ostatus)
values ('o20150626130751785', 'u20150613173432259', 200, to_date('26-06-2015 13:07:51', 'dd-mm-yyyy hh24:mi:ss'), '=2');
commit;
prompt 2 records loaded
prompt Loading ROOM...
insert into ROOM (rid, sname, rstatus, rprice)
values ('r20150618133623001', '标准间', '101', 200);
insert into ROOM (rid, sname, rstatus, rprice)
values ('r20150619105424133', '标准间', '可用', 300);
insert into ROOM (rid, sname, rstatus, rprice)
values ('r20150619105508806', '标准间', '1', 222);
commit;
prompt 3 records loaded
prompt Loading STYPE...
insert into STYPE (sid, sname, totalnum, simage, sdesc)
values ('s20150626125102159', '行政套房', 12, 'E:\大三下\Struts2实训\工具\apache-tomcat-6.0.26\webapps\MyHotel\files\20150626125136791行政套房.png', '大');
insert into STYPE (sid, sname, totalnum, simage, sdesc)
values ('s20150626130915356', '333', 0, 'E:\大三下\Struts2实训\工具\apache-tomcat-6.0.26\webapps\MyHotel\files\201506261309238427.jpg', '3333');
commit;
prompt 2 records loaded
prompt Enabling foreign key constraints for ORDERTABLE...
alter table ORDERTABLE enable constraint UUSERID;
prompt Enabling triggers for BOOK...
alter table BOOK enable all triggers;
prompt Enabling triggers for COMMENTTABLE...
alter table COMMENTTABLE enable all triggers;
prompt Enabling triggers for ODETAIL...
alter table ODETAIL enable all triggers;
prompt Enabling triggers for UINFO...
alter table UINFO enable all triggers;
prompt Enabling triggers for ORDERTABLE...
alter table ORDERTABLE enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for STYPE...
alter table STYPE enable all triggers;
set feedback on
set define on
prompt Done.
