---
layout: post
title: 爱是蓝色的
slug: love-is-blue
date: 2011-05-12 10:18:03 +0800
excerpt: 对了，关于最近互联网上市热潮，必定会产生泡沫，原因不知道是什么，但是感觉泡沫一定会破灭的，或许这次公司用的网络访问国外网站开始变的不稳定只是我们的DANG们为了尽量阻止人们访问国外的优秀的网站来防止泡沫破灭。国内的网站广告实在太让人受不了了，你看看人人网，打眼一看，花花绿绿的全是广告，是人就应该受不了。
categories:
- note
- lost
tags:
- jquery
- bad
more_categories:
- slug: note
  name: 学习笔记
- slug: lost
  name: 往事追忆
more_tags:
- slug: jquery
  name: jquery
- slug: bad
  name: 难过
---

正在听的一首歌，《love is blue》，翻译过来应该是爱是蓝色的，忽然觉得挺好的，就拿过来当作标题。好久没有更新了，理由就是忙，忙着好多事情，忙的不可开交，但是仔细想想又没有做很多事情，看来是瞎忙。

先是朋友结婚回家喝酒，然后又是结婚当天回家当伴郎，当的很失败，或许是前一天跟老头吵架吵的太累了，一晚上都没有睡着。忽然说起我的父亲，仔细研究了一下他，貌似没有优点，全是缺点，为了自己的愤怒，出奇的愤怒竟然对所有人不管不问。虽然是我父亲，还是要好好孝顺，但是我对他已经没有尊重了，我只尊重会尊重他人的人。而我的母亲又是世界上最善良的母亲，虽然她夹在我和父亲之间，不知如何是好，我想是我最尊敬的人了。


我一直以为生活应该就是没有压力，没有阻力的才叫生活，我以为高兴的做着自己喜欢的事情才是生活的大部分。现在我才发现原来生活的大部分是背负这苦痛的，我要一直背负这苦痛生活。各种苦难，不是来自物质上的，而是来自精神上的。

不说这些了，或许以后会慢慢想起，这些不好的回忆就让他随风而逝吧。

<audio controls="controls">
	<source src="{{ site.path.uploads }}2011/05/12/love-is-blue/love-is-blue.mp3" type="audio/mpeg" />
	Your browser does not support the audio element.
</audio>

昨天写代码的时候，碰上jquery的绑定问题，出现一个问题，就是绑定是后来append（或者其他方法）上去的元素，你再用bind或者其他的如click等函数绑定的时候是不管用的，你必须用live来绑定这些。

	<!doctype html>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>aaa</title>
	<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	$("#btn").click(function(){
	$("#wrapper").empty();
	$("#wrapper").append("<div id='aa'>哈哈</div>");
	});
	$("#aa").click(function(){
	alert("bind");
	});
	$("#aa").live("click",function(){
	alert("live");
	});
	});
	</script>
	</head>
	<body>
	<input id="btn" type="button" value="button" />
	<div id="wrapper"></div>
	</body>
	</html>

所以说jquery的东西还是比较多的，我以为我可以很快的掌握这些东西呢。

对了，关于最近互联网上市热潮，必定会产生泡沫，原因不知道是什么，但是感觉泡沫一定会破灭的，或许这次公司用的网络访问国外网站开始变的不稳定只是我们的DANG们为了尽量阻止人们访问国外的优秀的网站来防止泡沫破灭。国内的网站广告实在太让人受不了了，你看看人人网，打眼一看，花花绿绿的全是广告，是人就应该受不了。
