---
layout: post
title: mysql默认值
slug: mysql-default-value
date: 2012-04-11 10:45:23 +0800
excerpt: mysql列的默认属性必须是个常数，不能是函数或者表达式。有一个例外就是 CURRENT_TIMESTAMP。
categories:
- note
tags:
- mysql
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: mysql
  name: mysql
---

mysql列的默认属性必须是个常数，不能是函数或者表达式。有一个例外就是 CURRENT_TIMESTAMP。

> 可以用NULL作为值，那么默认的default value是NULL。

> 不能用NULL作为值，那么分情况。数字列默认是0,字符串默认是""，即空字符串

还有好多其他的，请看http://dev.mysql.com/doc/refman/5.0/en/data-type-defaults.html
