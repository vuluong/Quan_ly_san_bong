/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     10/3/2017 9:35:03 PM                         */
/*==============================================================*/


alter table ACC_STADIUM
   drop constraint FK_ACC_STAD_FK_ACC_ST_ACCOUNT;

alter table ACC_STADIUM
   drop constraint FK_ACC_STAD_FK_ST_ACC_STADIUM;

alter table COUNTY
   drop constraint FK_COUNTY_FK_CT_PRO_PROVINCE;

alter table PRICE_SUMMARY
   drop constraint FK_PRICE_SU_FK_ST_PR__STADIUM;

alter table STADIUM
   drop constraint FK_STADIUM_FK_ST_CT_COUNTY;

drop table ACCOUNT cascade constraints;

drop table ACC_STADIUM cascade constraints;

drop table COUNTY cascade constraints;

drop table PRICE_SUMMARY cascade constraints;

drop table PROVINCE cascade constraints;

drop table STADIUM cascade constraints;

/*==============================================================*/
/* Table: ACCOUNT                                               */
/*==============================================================*/
create table ACCOUNT 
(
   ACC_ID               NUMBER(10)           not null,
   USER_ID              NUMBER(10),
   ACC_STADIUM_ID       NUMBER(10),
   FACEBOOK_ID          NUMBER(10),
   GOOGLE_ID            NUMBER(10),
   constraint PK_ACCOUNT primary key (ACC_ID)
);

comment on column ACCOUNT.ACC_ID is
'ID';

comment on column ACCOUNT.USER_ID is
'User ID';

comment on column ACCOUNT.FACEBOOK_ID is
'Facebook id';

comment on column ACCOUNT.GOOGLE_ID is
'Google+ ID';

/*==============================================================*/
/* Table: ACC_STADIUM                                           */
/*==============================================================*/
create table ACC_STADIUM 
(
   ACC_STADIUM          NUMBER(10)           not null,
   ACC_ID               NUMBER(10)           not null,
   STADIUM_ID           NUMBER(10)           not null,
   constraint PK_ACC_STADIUM primary key (ACC_STADIUM)
);

comment on column ACC_STADIUM.ACC_STADIUM is
'ID';

comment on column ACC_STADIUM.ACC_ID is
'ACC_ID';

comment on column ACC_STADIUM.STADIUM_ID is
'STADIUM_ID';

/*==============================================================*/
/* Table: COUNTY                                                */
/*==============================================================*/
create table COUNTY 
(
   COUNTY_ID            NUMBER(4)            not null,
   CODE                 VARCHAR(50)          not null,
   PROVINCE_ID          NUMBER(2)            not null,
   NAME                 VARCHAR(50)          not null,
   ORD                  NUMBER(2),
   constraint PK_COUNTY primary key (COUNTY_ID)
);

comment on table COUNTY is
'Qua^.n ';

comment on column COUNTY.COUNTY_ID is
'ID';

comment on column COUNTY.CODE is
'Ma~';

comment on column COUNTY.PROVINCE_ID is
'Ma~ ti?nh';

comment on column COUNTY.NAME is
'Te^n qua^n huye^.n';

comment on column COUNTY.ORD is
'Ddo^. u+u tie^n';

/*==============================================================*/
/* Table: PRICE_SUMMARY                                         */
/*==============================================================*/
create table PRICE_SUMMARY 
(
   PRICE_SUMMARY_ID     NUMBER(5)            not null,
   STADIUM_ID           NUMBER(5),
   EFFECT_FROM          DATE                 not null,
   EFFECT_UNTIL         DATE                 not null,
   PRICE                NUMBER(10)           not null,
   PROMOTION            VARCHAR2(1024),
   constraint PK_PRICE_SUMMARY primary key (PRICE_SUMMARY_ID)
);

comment on table PRICE_SUMMARY is
'Ba?ng gia''';

comment on column PRICE_SUMMARY.PRICE_SUMMARY_ID is
'ID';

comment on column PRICE_SUMMARY.STADIUM_ID is
'Ma~';

comment on column PRICE_SUMMARY.EFFECT_FROM is
'Tho+`i gian ba+''t dda^`u';

comment on column PRICE_SUMMARY.EFFECT_UNTIL is
'Tho+`i gian ke^''t thu''c';

comment on column PRICE_SUMMARY.PRICE is
'Gia'' tien';

comment on column PRICE_SUMMARY.PROMOTION is
'Khuye^''n ma.i';

/*==============================================================*/
/* Table: PROVINCE                                              */
/*==============================================================*/
create table PROVINCE 
(
   PROVINCE_ID          NUMBER(2)            not null,
   CODE                 varchar2(50)         not null,
   NAME                 Varchar2(50)         not null,
   ORD                  NUMBER(2),
   constraint PK_PROVINCE primary key (PROVINCE_ID)
);

comment on table PROVINCE is
'Ti?nh';

comment on column PROVINCE.PROVINCE_ID is
'ID';

comment on column PROVINCE.CODE is
'Ma~';

comment on column PROVINCE.NAME is
'Te^n';

comment on column PROVINCE.ORD is
'Ddo^. u+u tie^n';

/*==============================================================*/
/* Table: STADIUM                                               */
/*==============================================================*/
create table STADIUM 
(
   STADIUM_ID           NUMBER(5)            not null,
   NAME                 VARCHAR(50)          not null,
   COUNTY_ID            NUMBER(4)            not null,
   LONGITUDE            varchar2(10)         not null,
   LATITUDE             varchar2(10)         not null,
   PRICE_SUMMARY_ID     NUMBER(10)           not null,
   NUMBER_STADIUM       NUMBER(2),
   OWNER_NAME           VARCHAR2(50)         not null,
   MSISDN               VARCHAR2(15),
   constraint PK_STADIUM primary key (STADIUM_ID)
);

comment on table STADIUM is
'Sa^n bo''ng
';

comment on column STADIUM.STADIUM_ID is
'Ma~';

comment on column STADIUM.NAME is
'Te^n sa^n bo''ng';

comment on column STADIUM.COUNTY_ID is
'Qua^.n Huye^.n';

comment on column STADIUM.LONGITUDE is
'Kinh ddo^.';

comment on column STADIUM.LATITUDE is
'Vi~ ddo^.';

comment on column STADIUM.PRICE_SUMMARY_ID is
'Chi tiet cuoc';

comment on column STADIUM.NUMBER_STADIUM is
'So^'' ';

comment on column STADIUM.OWNER_NAME is
'Chu? sa^n';

comment on column STADIUM.MSISDN is
'SDT chu? sa^n';

alter table ACC_STADIUM
   add constraint FK_ACC_STAD_FK_ACC_ST_ACCOUNT foreign key (ACC_ID)
      references ACCOUNT (ACC_ID);

alter table ACC_STADIUM
   add constraint FK_ACC_STAD_FK_ST_ACC_STADIUM foreign key (STADIUM_ID)
      references STADIUM (STADIUM_ID);

alter table COUNTY
   add constraint FK_COUNTY_FK_CT_PRO_PROVINCE foreign key (PROVINCE_ID)
      references PROVINCE (PROVINCE_ID)
      on delete cascade;

alter table PRICE_SUMMARY
   add constraint FK_PRICE_SU_FK_ST_PR__STADIUM foreign key (STADIUM_ID)
      references STADIUM (STADIUM_ID);

alter table STADIUM
   add constraint FK_STADIUM_FK_ST_CT_COUNTY foreign key (COUNTY_ID)
      references COUNTY (COUNTY_ID);

