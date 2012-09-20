---
layout: post
title: ubuntu无法sudo
slug: cannot-sudo-in-ubuntu
date: 2012-03-05 08:49:50 +0800
excerpt: 于是我就到了recovery mode下面，想把我的用户组加到admin和root中，结果提示失败。它提示我Cannot lock /etc/passwd。有点崩溃。
categories:
- note
tags:
- linux
- ubuntu
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: linux
  name: linux
- slug: ubuntu
  name: ubuntu
---

就在上篇文章中，我尝试的时候改了我用户组，结果除了一大堆问题，问题之一就是无法sudo了。

于是我就到了recovery mode下面，想把我的用户组加到admin和root中，结果提示失败。它提示我Cannot lock '/etc/passwd'。有点崩溃。

再一次于是我google了一下，就google出了解决方法，如下：

Check that you are root

	whoami

Check that the root partition is mounted read-write

	cat /proc/mounts

If you see that your partition is mounted as ro (read-only), try remounting it as rw

	mount -o remount,rw /

然后就OK了，哈哈。不过不知道为什么默认的recorvery mode没有把根目录挂在为rw模式，难道是为了安全？
