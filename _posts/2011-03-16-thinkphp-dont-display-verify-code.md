---
layout: post
title: thinkphp不显示验证码
slug: thinkphp-dont-display-verify-code
date: 2011-03-16 15:36:53 +0800
excerpt: thinkphp不显示验证码，官方出了一列解决问题，我也是按照官方的解决方案解决的，原来以为是分组的问题，高了2个多小时以后才发现果然是BOM的问题，问题简单了，如果你跟我一样用的VIM，你直接set nobomb就可以了，呵呵。如果你用其他的编辑器，那么上网搜索怎样去掉BOM吧。
categories:
- note
tags:
- thinkphp
- wordpress
---

thinkphp不显示验证码，官方出了一列解决问题，我也是按照官方的解决方案解决的，原来以为是分组的问题，高了2个多小时以后才发现果然是BOM的问题，问题简单了，如果你跟我一样用的VIM，你直接set nobomb就可以了，呵呵。如果你用其他的编辑器，那么上网搜索怎样去掉BOM吧。


不知道为什么，如果我把去掉bom的文件再一次set bomb之后仍然没有问题了，奇怪。还有，在windows下面建立的文件好像都带有bom，我RI。
