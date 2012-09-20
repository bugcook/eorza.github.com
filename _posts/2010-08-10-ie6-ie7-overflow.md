---
layout: post
title: ie6、ie7下overflow失效
slug: ie6-ie7-overflow
date: 2010-08-10 16:05:46 +0800
excerpt: 如果父对象有overflow：hidden属性，子对象中的position属性是relative或者absolute，那么在ie6和ie7下父对象的overflow会失效，解决办法是给父对象加relative属性。
categories:
- note
tags:
- js
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: js
  name: JS
---

如果父对象有overflow：hidden属性，子对象中的position属性是relative或者absolute，那么在ie6和ie7下父对象的overflow会失效，解决办法是给父对象加relative属性。

有的时候，你找了一个js图片横向滑动的东东，如果你改了改，一不小心在ie7或者ie6下面不能用了，一般就是这个问题。
