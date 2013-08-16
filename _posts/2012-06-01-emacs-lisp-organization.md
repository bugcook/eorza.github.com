---
layout: post
title: Emacs Lisp Organization
slug: emacs-lisp-organization
date: 2012-06-01 18:14:35 +0800
excerpt: 最近觉得emacs的配置文件下很多人都有这个site-lisp文件夹，看了emacs的wiki，发现这个文件夹是emacs自动加载的，是属于site的东西，是属于全局的东西，是属于这台电脑的东西。所以我到stackoverflow上问了一下，果然是这个东西，在emacs里面，人们常说的this site就是指这个地盘，而这个地盘就是你装的这个系统。因为linux是多用户系统，所以对应的就是this user，也就是说site包含很多user，所以，在个人的配置文件里面，是不太适合出现site-lisp这个文件夹的，这个文件夹是emacs自动加载的，他的存在位置应该是/usr/share/emacs(或者版本号)/site-lisp这个位置。
categories:
- note
tags:
- emacs
---

六一了。想起自己的童年，不仅一阵黯然神伤。虽然自己的童年也不错，但是毕竟已经远去，那些无忧无虑的日子已经永远逝去，只是存在记忆中。

最近博客更新的明显减少，因为时间，因为懒惰，因为没东西写，这些都是借口。

不说那么多了，来重点。最近觉得emacs的配置文件下很多人都有这个site-lisp文件夹，看了emacs的wiki，发现这个文件夹是emacs自动加载的，是属于site的东西，是属于全局的东西，是属于这台电脑的东西。所以我到stackoverflow上问了一下，果然是这个东西，在emacs里面，人们常说的this site就是指这个地盘，而这个地盘就是你装的这个系统。因为linux是多用户系统，所以对应的就是this user，也就是说site包含很多user，所以，在个人的配置文件里面，是不太适合出现site-lisp这个文件夹的，这个文件夹是emacs自动加载的，他的存在位置应该是/usr/share/emacs(或者版本号)/site-lisp这个位置。

所以，我打算整理我的配置文件，用my-lisp作为自己写的lisp的文件夹，用vendor-lisp作为下载的lisp的文件夹。

祝我快乐。
