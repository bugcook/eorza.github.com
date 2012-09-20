---
layout: post
title: dos攻击之fsockopen
slug: dos-attack-of-fcsopen
date: 2011-11-05 16:30:59 +0800
excerpt: 2006年的秋天，当我看到满屏幕的熊猫，我知道我的电脑也可以中毒了。今天，我的服务器成肉鸡了。我想，原来那么多我自以为不会降临到我身上的事情都降临到我身上了。看来我要居安思危了。
categories:
- note
tags:
- apache
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: apache
  name: Apache
---

2006年的秋天，当我看到满屏幕的熊猫，我知道我的电脑也可以中毒了。今天，我的服务器成肉鸡了。我想，原来那么多我自以为不会降临到我身上的事情都降临到我身上了。看来我要居安思危了。

解决办法：直接在php中禁用fsockopen以及psockopen等函数。当然如果你的程序需要用的此类函数的话，就要另寻其他的方法了，比如制发包频率（怎么控制我也不清楚，google it but not baidu it）。

好像是dedecms有这个漏洞，我不打补丁了，因为马上要改版了。

说到这，再见。
