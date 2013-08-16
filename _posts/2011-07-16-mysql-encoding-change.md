---
layout: post
title: mysql 编码转换
slug: mysql-encoding-change
date: 2011-07-16 12:02:17 +0800
excerpt: mysql的数据库编码从lantian1转换到utf8。找了好多资料，然后才发现，下面这个比较惯用，你懂得。
categories:
- note
tags:
- mysql
---

mysql的数据库编码从lantian1转换到utf8。找了好多资料，然后才发现，下面这个比较惯用，你懂得。

	$ mysqldump -u root -p --default-character-set=latin1 --skip-set-charset conv > conv.sql
	$ sed -i -e "s/latin1/utf8/g" conv.sql
	$ mysql -u root -p --default-character-set=utf8 conv < conv.sql

解释一下，如果有完美控的人可以理解一下。首先第一行当然是导出了，吧数据库备份出来。第二句的意思是把备份的数据库中的litan1转换成utf8,第三局是导入。

详细解释一下。

1.mysqldump是mysql数据库备份命令，-u后面的是你的数据库用户名，-p的意思是你的这个用户名有个密码，过会你要输入。--default-character-set的意思是导出的文件格式是latin1的编码，--skip-set-charset的意思是忽略穿件数据库时候的set charset命令，conv是你的schema名称 后面的conv.sql是要导入的文件。

2.这条命令我就不详细解释了，作用是把你的conv.sql文件的中的所有latin1转换成utf8.

3.这条也不详细解释了，导入到数据库中。

其实这篇文章应该跟上一篇是一个的，但是昨天没写，就分开吧。上篇文章看这里。
