---
layout: post
title: jquery在IE9下的一个BUG
slug: a-ie9-bug-with-jquery
date: 2011-03-23 11:37:47 +0800
excerpt: 当你用attr属性来控制背景的显示位置的时候，最后一个属性值如果是0的话，attr就会一直显示。（啊啊啊，说不清楚了，直接上代码）。
categories:
- note
tags:
- bug
- jquery
- js
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: bug
  name: bug
- slug: jquery
  name: jquery
- slug: js
  name: JS
---

这个bug的局限性有多大我不知道，因为懒得去查找，自己并不是一个很热心的人，也许是热心而没有时间，或者是太懒了。

当你用attr属性来控制背景的显示位置的时候，最后一个属性值如果是0的话，attr就会一直显示。（啊啊啊，说不清楚了，直接上代码）。

	$(".submenu-title").click(function(){
		if(!$(this).attr("style")){
			$(this).attr("style","background-position:0 0;");
			$(this).next(".submenu-list").slideUp("fast");
		} else {
			$(this).removeAttr("style");
			$(this).next(".submenu-list").slideDown("fast");
		}
	});

比如说这段代码，你就只能在点击`$(".submenu-title")`的时候`slideUp("fast")`，而不能`slideDown("fast")`。这下应该清楚了啊。哥的语文表达能力实在是太弱了，怎么才能提高呢。

晕，还没有说解决就publish了，真是的。解决办法很简单，就是把background-position的最后一个值改成一个0.1%或者你喜欢跟那个小的0.0001%，当然那这只是一个权衡之计，相信jquery会解决这个问题的。
