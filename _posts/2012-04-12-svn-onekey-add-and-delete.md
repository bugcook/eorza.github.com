---
layout: post
title: SVN一键添加删除
slug: svn-onekey-add-and-delete
date: 2012-04-12 16:43:53 +0800
excerpt: 其实两键，两条命令。在你做了很多操作，很多删除很多添加的时候，很有用。我记得是在博客里面有来着，但是找不到了。
categories:
- note
tags:
- svn
---

其实两键，两条命令。在你做了很多操作，很多删除很多添加的时候，很有用。我记得是在博客里面有来着，但是找不到了。

	svn status | grep -v "^.[ \t]*\..*" | grep "^?" | awk '{print $2}' | xargs svn add
	svn status | grep -v "^.[ \t]*\..*" | grep "^\!" | awk '{print $2}' | xargs svn delete

