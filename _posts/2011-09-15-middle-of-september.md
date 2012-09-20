---
layout: post
title: 9月中旬
slug: middle-of-september
date: 2011-09-15 11:55:36 +0800
excerpt: 9月中旬，刚写了一点东西，累了，就写个记录吧，最近烦心事挺多的。我仔细想了想，其实也没什么烦心的事情，只是想想未来，想想出路，就觉得有点迷茫，好在总有个目标，不管自己喜欢不喜欢，总是要努力去做的。
categories:
- note
- lost
tags:
- emacs
- talk
more_categories:
- slug: note
  name: 学习笔记
- slug: lost
  name: 往事追忆
more_tags:
- slug: emacs
  name: emacs
- slug: talk
  name: 语录
---

9月中旬，刚写了一点东西，累了，就写个记录吧，最近烦心事挺多的。我仔细想了想，其实也没什么烦心的事情，只是想想未来，想想出路，就觉得有点迷茫，好在总有个目标，不管自己喜欢不喜欢，总是要努力去做的。

本文的主要动机不是回忆或者牢骚，是记下一个小东西，就是emacs中文输入的问题，因为毕竟是中国嘛，你做的东西跟汉语是有很大的渊源的，所以要输入中文。原来的解决方法是从shell启动，然后在shell的配置文件bashrc中配置。

	export LC_CTYPE=zh_CN.UTF-8

但是，后来，我想，既然emacs无所不能，为什么还得从shell启动呢，于是我想到了，emacs从shell启动，读取shell的变量，然后。

好了，如果直接从xwindow启动的话，他不会读你的bashrc变量的，是吗？于是你就写了一个bash，在启动emacs设置一下变量，你明白了。

	#!/bin/sh
	export LC_CTYPE=zh_CN.UTF-8
	emacs

然后你再创建一个快捷方式，打开这个就是启动emacs，万事OK。

更新一下：

其实没有万事OK，那个emacs还是会找不到gems，然后出了各种错误，这个时候你需要搞个插件，rvm.el。当然如果你不用rvm那就不需要搞这个插件了。然后用gemset的时候，要用后面没有@这个，对于我来说要：

	# rvm use ruby-1.9.2-p2900@rails3 --default #不用这个
	# rvm use ruby-1.9.2-p2900@global --default #不用这个
	rvm use ruby-1.9.2-p2900 --default #而是用这个

最近空下来的时候常常想一些事情，这两天总结了一下。

1.我同学经常说的，什么事情都是守恒的，你获得一些东西，那么你将失去一些东西。失去的和获得的对所有人来说是一样的，但是对于某个特定的人来说不一样，比如说你获得了金钱，失去了健康，如果你觉得金钱重于健康，那么你是幸福的，反之，你是痛苦的。

2.人活着有没有意义。这不是个问题，有没有意义是已经存在那里了，你可以说有也可以说没有，其实都是一样的。意义不重要，但是精彩重要。你可以选择日复一日，年复一年的生活，做着等死，也可以选择精彩的一生。当然这个精彩不一定伟大。就是说，不要平庸。

3.要感恩。感恩不是对别人说的，是自己去做的。如果你见哪个人哪个公司整天对你说要感恩，那么他一定不感恩，因为他对你说这些东西的目的只有一个，就是要你对他感恩。

4.诸事由心。问心无愧，管他人说甚。这句话是龙幽说的，要做到这样真的很难很难，难过你得了癌症然后恢复。

总结了这么多。按照我自己的经验，几年之后再看看这些，会觉得好笑。

<audio controls="controls">
	<source src="{{ site.path.uploads }}2011/09/15/middle-of-september/Song-for-the-Lord.mp3" type="audio/mpeg" />
	Your browser does not support the audio element.
</audio>

最后放一首歌。其实博客里面有好多的音乐，都是自己很喜欢的，如果你不幸来到了这里，那么请接受我的音乐观的洗礼。

