---
layout: post
title: MYSQL创建删除索引
slug: create-and-drop-index-in-mysql
date: 2012-05-02 13:13:44 +0800
excerpt: 索引的创建可以在CREATE TABLE语句中进行，也可以单独用CREATE INDEX或ALTER TABLE来给表增加索引。删除索引可以利用ALTER TABLE或DROP INDEX语句来实现。
categories:
- material
- other
tags:
- mysql
---

索引的创建可以在CREATE TABLE语句中进行，也可以单独用CREATE INDEX或ALTER TABLE来给表增加索引。删除索引可以利用ALTER TABLE或DROP INDEX语句来实现。

## （1）使用ALTER TABLE语句创建索引。

语法如下：

	alter table table_name add index index_name (column_list) ;
	alter table table_name add unique (column_list) ;
	alter table table_name add primary key (column_list) ;

其中包括普通索引、UNIQUE索引和PRIMARY KEY索引3种创建索引的格式，table_name是要增加索引的表名，column_list指出对哪些列进行索引，多列时各列之间用逗号分隔。索引名index_name可选，缺省时，MySQL将根据第一个索引列赋一个名称。另外，ALTER TABLE允许在单个语句中更改多个表，因此可以同时创建多个索引。


创建索引的示例如下：

	mysql> use tpsc
	Database changed
	mysql> alter table tpsc add index shili (tpmc ) ;
	Query OK, 2 rows affected (0.08 sec)
	Records: 2 Duplicates: 0 Warnings: 0

## （2）使用CREATE INDEX语句对表增加索引。

能够增加普通索引和UNIQUE索引两种。其格式如下：

	create index index_name on table_name (column_list) ;
	create unique index index_name on table_name (column_list) ;

说明：table_name、index_name和column_list具有与ALTER TABLE语句中相同的含义，索引名不可选。另外，不能用CREATE INDEX语句创建PRIMARY KEY索引。

## （3）删除索引。

删除索引可以使用ALTER TABLE或DROP INDEX语句来实现。DROP INDEX可以在ALTER TABLE内部作为一条语句处理，其格式如下：

	drop index index_name on table_name ;
	alter table table_name drop index index_name ;
	alter table table_name drop primary key ;

其中，在前面的两条语句中，都删除了table_name中的索引index_name。而在最后一条语句中，只在删除PRIMARY KEY索引中使用，因为一个表只可能有一个PRIMARY KEY索引，因此不需要指定索引名。如果没有创建PRIMARY KEY索引，但表具有一个或多个UNIQUE索引，则MySQL将删除第一个UNIQUE索引。

如果从表中删除某列，则索引会受影响。对于多列组合的索引，如果删除其中的某列，则该列也会从索引中删除。如果删除组成索引的所有列，则整个索引将被删除。

删除索引的操作，如下面的代码：

	mysql> drop index shili on tpsc ;
	Query OK, 2 rows affected (0.08 sec)
	Records: 2 Duplicates: 0 Warnings: 0

该语句删除了前面创建的名称为“shili”的索引。
