---
layout: post
title: 对css中包裹溢出
slug: wrapper-and-overflow-of-css
date: 2010-07-29 22:13:28 +0800
excerpt: css中的overflow有四个属性：visible，hidden，scroll，auto。当为默认的visible时跟float一起出现，就会出现我自己不能理解的现象。或许只是个基本知识吧
categories:
- note
tags:
- css
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: css
  name: css
---

研究了一晚上float，结果失败，没研究出个结果。但是还是有些收获的，就是关于overflow的一些奇怪的现象。

或许是基础不够吧，这些奇怪的显现或许只是一些基本的知识。先在这里记下，等什么明白再来看看，嘲笑一下自己。

css中的overflow有四个属性：visible，hidden，scroll，auto。当为默认的visible时跟float一起出现，就会出现我自己不能理解的现象。或许只是个基本知识吧。

执着狂们在学习html，css的时候，一定会被为box中换行的问题纠缠很久：一个有固定宽度的box，当内容长度超过其长度时，它是会溢出还是换行自适应高度呢？

	<style type="css/text">
	#box {width:200px;height:50px;border:1px solid red}
	</style>
	<div id="box">
	IwangtoFucktheworld IwangtoFucktheworld
	</div>

在这里，我们假定内容只包括图片和文字。一晚上研究，发现当文字中出现空格（非<span style="color: #ff0000;">&amp;nbsp；</span>形成的空格）时会在空格处换行，当图文混排时，会在图片与文字连接出换行。

ps：这里的换行当然是长度太长时。
