---
layout: post
title: 从wordpress迁移到jekyll
slug: change-blog-from-wordpress-to-jekyll
date: 2012-09-24 08:53:30 +0800
excerpt: 前几天公司突然解散，太多的事情，没有心思更改博客，后来再一次研究lfs的时候，才想起来要整一下。上google上搜了一下，Twenty Twelve的主题貌似还没有出来，然后突然想起来现在好多与编程有关的博客好像都转移到了jekyll或者octopress，研究了一下，决定还是用比较原声的jekyll，因为octopress加了好多东西，而且它的主题也不是我的style。
categories:
- note
tags:
- wordpress
- jekyll
---

前几天公司突然解散，太多的事情，没有心思更改博客，后来再一次研究lfs的时候，才想起来要整一下。上google上搜了一下，Twenty Twelve的主题貌似还没有出来，然后突然想起来现在好多与编程有关的博客好像都转移到了jekyll或者octopress，研究了一下，决定还是用比较原声的jekyll，因为octopress加了好多东西，而且它的主题也不是我的style。

有个叫jekyllbootstrap的东西，里面也是封装了好多东西，当然也就不是我的style，但是其中jekyllbootstrap的有个主题叫twitter的主题比较不错（貌似现在国外的好多设计风格都有twitter的感觉，莫非是现在的主流？），于是我就参考了一下，感觉布局十分简单，就自己写了html和css，然后利用jekyll搭建了一个简单的blog。

刚开始确实不是很容易，比如怎样直接用github的主分支master来作为页面的push的对象，怎样在本地测试。其实最大的难题是migration，从jekyll的wiki上看到很多的转移方法，都很有限，比如我的博客上有很多的post有图片，而且还有视频。个人觉得jekyll主要是面向写作的比较好，纯技术的博客比较好，当然写论文的话各种公式也是有latex等等的支持，所以说是基本上没有图片的，像我这种有图片的基本上不存在，但是我还是想保留，所以就很麻烦。有了困难咱就解决，ruby咱不熟咱还有php，于是我就用php写了一个migration的程序。这个php的程序刚开始就写错了，因为我竟然从wordpress导出的xml文件中读内容，其实从数据库里面读是更方便的，哎，sb的我～

在转移的过程中还出了一个很纠结的问题就是用什么样的markdown的引擎的问题，比如刚开始用默认的maruku，但是maruku对中文列表支持的不是很好（- -，只是不是很好吗？），然后用rdiscount，但是rdiscount会把我的markdown中的html原来的tag弄成两份，后来kramdown才实际解决了问题。

代码就不贴出来了，有人需要就直接email给哥。


