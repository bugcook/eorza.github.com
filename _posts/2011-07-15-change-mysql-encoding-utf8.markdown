---
comments: true
date: 2011-07-15 08:18:03
layout: post
slug: change-mysql-encoding-utf8
title: 修改mysql编码为utf8
wordpress_id: 2715
categories:
- note
tags:
- mysql
---

今天脑子突然一想，我这个博客的其中一个很大的作用就是记录学习过程中查找的东西，然后每次都要重新查找，所以搞得很不爽，所以要有个地方记录一下，貌似现在这里记录的很少了哈哈，现在开始记录把。当然这里是在ubuntu下面，如果是在其他linux只要找到my.cnf配置文件就可以，如果是在windows下面喝mac下面，就google一下吧。




    
    
    show variables like 'character%'; #执行编码显示
    
    +----------------------------+----------------------------+ 
    | Variable_name              | Value                      | 
    +----------------------------+----------------------------+ 
    | character_set_client       | latin1                     | 
    | character_set_connection   | latin1                     | 
    | character_set_database     | latin1                     | 
    | character_set_filesystem   | binary                     | 
    | character_set_results      | latin1                     | 
    | character_set_server       | latin1                     | 
    | character_set_system       | utf8                       | 
    | character_sets_dir         | /usr/share/mysql/charsets/ | 
    +----------------------------+----------------------------+ 
    



在ubuntu下找到/etc/mysql/my.cnf文件，做如下修改：



> 
找到客户端配置[client] 在下面添加 
default-character-set=utf8 默认字符集为utf8 
在找到[mysqld] 添加 
default-character-set=utf8 默认字符集为utf8 
init_connect='SET NAMES utf8' （设定连接mysql数据库时使用utf8编码，以让mysql数据库为utf8运行）




修改好后，重新启动mysql 即可，查询一下：


    
    
    show variables like 'character%'; 
    
    +----------------------------+----------------------------+ 
    | Variable_name              | Value                      | 
    +----------------------------+----------------------------+ 
    | character_set_client       | utf8                       | 
    | character_set_connection   | utf8                       | 
    | character_set_database     | utf8                       | 
    | character_set_filesystem   | binary                     | 
    | character_set_results      | utf8                       | 
    | character_set_server       | utf8                       | 
    | character_set_system       | utf8                       | 
    | character_sets_dir         | /usr/share/mysql/charsets/ | 
    +----------------------------+----------------------------+ 
    



对了，设置这个的一个好处就是你用命令行mysql客户端的时候，select的时候会排列整体。
