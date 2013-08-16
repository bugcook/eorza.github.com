---
layout: post
title: RVM多用户BUG
slug: rvm-multi-user-bug
date: 2012-01-05 11:49:04 +0800
excerpt: 原因没有发现，倒是找出解决方法来了，那就是用sudo -H -i或者是rvmsudo bash命令切换到root模式下，然后rvm --default use XXX。新年快乐。
categories:
- note
tags:
- ruby
- rvm
---

刚才更新了一下rvm的版本，更新到了latest(1.10.0)，感觉不错。但是有一个令人崩溃的问题，就是当你用Multi-User模式安装rvm，然后切换默认ruby版本的时候会出现：

	RVM is not a function, selecting rubies with 'rvm use ...' will not work.

这令我很崩溃啊，研究了一上午，原因没有发现，倒是找出解决方法来了，那就是用sudo -H -i或者是rvmsudo bash命令切换到root模式下，然后rvm --default use XXX。新年快乐。
