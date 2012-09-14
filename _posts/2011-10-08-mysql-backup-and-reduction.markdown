---
comments: true
date: 2011-10-08 03:15:51
layout: post
slug: mysql-backup-and-reduction
title: mysql备份还原
wordpress_id: 2899
categories:
- note
- material
tags:
- mysql
---

本博客使命之mysql数据库的备份还原。其实写这些东西怪丢人的，很多人会说你连这个都记不住吗？我只好一句话不说，我确实记不住。

**1 导出所有数据库**


    
    
    mysqldump -u username -p password –all-databases > all.sql
    



**2 导出一个数据库**


    
    
    mysqldump -u username -p password somedatabase > all.sql
    



**3 导入**

进入mysql -u username -p password


    
    
    source all.sql
    



命令很多，但是有这几条就暂时够用了。
