---
layout: post
title: Git拉取所有submodule
slug: git-pull-all-submodule
date: 2012-05-24 08:28:32 +0800
excerpt: 如果我们的git仓库下有多个submodule，你想全部更新一下，就要用下面的命令，当然，还有其他的很多方法可以用。git做同一件事情可以用很多方法，这是它的有点，也是缺点。
categories:
- note
tags:
- git
---

前几天akismet突然好用了，搞得我心花怒放，一直想找个原因，可是总是没有时间去弄。所有凑合着吧。

记录一下这个命令行，其实不应该记录的，应该理解了自然会去用，比如说正则表达式，你不能每个都去记录下来，然后再去用。

好的，如果我们的git仓库下有多个submodule，你想全部更新一下，就要用下面的命令，当然，还有其他的很多方法可以用。git做同一件事情可以用很多方法，这是它的有点，也是缺点。

	git submodule foreach git pull origin master

突然发现后台写文章的字体好小，赶紧看看更正过来，我觉得好像是我把后台的字体改成微软雅黑了。
