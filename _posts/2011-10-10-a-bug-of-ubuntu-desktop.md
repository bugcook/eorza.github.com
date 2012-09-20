---
layout: post
title: ubuntu desktop的一个bug
slug: a-bug-of-ubuntu-desktop
date: 2011-10-10 14:26:46 +0800
excerpt: 这里ubuntu server版本好像没有这个问题，或者有这个问题被去掉了，但是desktop版本没有去掉，不知道为什么。
categories:
- note
tags:
- apache
- ubuntu
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: apache
  name: Apache
- slug: ubuntu
  name: ubuntu
---

上午搞东西的时候，发现一个我的apache的一个很烦人的问题，当我在浏览器中输入localhost/javascript的时候，总是出现403 forbidden的东西，搞的我很上火，看了看apache的日志，发现这么一条错误：

	[Mon Oct 10 13:44:35 2011] [error] [client 127.0.0.1] Directory index forbidden by Options directive: /usr/share/javascript/

原来是localhost/javascript会转移到/usr/share/javascript中，但是这个文件夹也是可以读的，后来我灵光一闪，绝对是apache的那个配置文件阻止了这个文件夹，于是我find了一下，结果在/etc/apache2/conf.d/这个文件夹中有javascript-common.conf这么一个链接，链接的/etc/javascript-common/javascript-common.conf的内容是：

	Alias /javascript /usr/share/javascript/
	<Directory "/usr/share/javascript/">
	Options FollowSymLinks MultiViews
	</Directory>

什么不说了，直接把javascript-common.conf删除就是了。

这里ubuntu server版本好像没有这个问题，或者有这个问题被去掉了，但是desktop版本没有去掉，不知道为什么。这个bug在这里已经提交过了，估计ubuntu的兄弟们忘了改desktop版本的了。

