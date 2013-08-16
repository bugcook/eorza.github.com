---
layout: post
title: 纯css实现iframe宽高自适应
slug: iframe-auto-height-width-only-with-css
date: 2010-11-11 16:22:22 +0800
excerpt: 从网上找了东西，发现都不适合自己的要求，也有纯css实现的，懒得看，大部分是基于js的，当然我的理念是能不用js就不用（这这是个个人怪癖，其实js也没什么，毕竟现在99%以上的浏览器都支持js了）。于是放慢了自己的脚步，自己研究一下吧。当然这里不是最完美的，至于哪里不完美，最后会给出。这里先给出代码。
categories:
- note
tags:
- css
---

从网上找了东西，发现都不适合自己的要求，也有纯css实现的，懒得看，大部分是基于js的，当然我的理念是能不用js就不用（这这是个个人怪癖，其实js也没什么，毕竟现在99%以上的浏览器都支持js了）。于是放慢了自己的脚步，自己研究一下吧。当然这里不是最完美的，至于哪里不完美，最后会给出。这里先给出代码。

	<!doctype html>
	<html>
	<head>
	<style type="text/css">
	.dd1 { height: 200px; width: 200px; border:1px solid red; }
	.wrapper { position: absolute;top: 0px;left: 250px;right: 10px;bottom: 20px;padding-top:50px;}
	.dd2 { height: 100%; background:red;}
	iframe { height: 100%; width: 100%;}
	* {border:0;margin:0;padding:0}
	</style>
	</head>
	<body>
	<div class="dd1">
	哈哈哈
	</div>
	<div class="wrapper">
	<div class="dd2">
	<iframe src="http://dobila.info"></frame>
	</div>
	</div>
	</body>
	</html>

网上很多东西只是给出了解决方法，都没有表明要解决的是什么，虽然大体上是说了，但是细节上还是要表述一下的比较好。这里我要实现的是iframe在右下角，宽高自适应的情况。至于什么是右下角，做过网站美工的都明白，一般网站后台，都是要么在左下方，要么在右下方显示主要内容的。

有的同学会说把iframe的宽高设置成100%不就行了吗？如果你的body里面只有一个iframe，这样也行，但是好像没有人这样用吧。我们的iframe是在一个框里面的，而不是直接在body里面的。

所以首先要实现的是这个包围iframe的框是随着你拖动浏览器的边框而自适应改变的，这里我用position:absolute来实现的，当然你也可以用其他的方法，我是没用过，不过我觉得应该可以。这里解释一下wrapper里面的属性，top、left、bottom、right是让wraper随着浏览器而改变的，这里为什么有个padding-top是解决ie6问题的，至于为什么ie6会出现这个状况，我也不知道。

然后就是在框内加iframe了，于是我加上了iframe，试了一下，可以，但是ie6又出问题了，宽度变得很宽了，于是我就在iframe外面又加了一层，才把问题解决。我痛恨ie6，但是在中国，大家永远在用着比别人落后很多的东西而不自觉。
