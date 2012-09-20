---
layout: post
title: 一个flash播放器
slug: a-flash-vedio-player
date: 2010-09-03 13:32:35 +0800
excerpt: 找了一上午，终于找到一个自己觉得稍微满意的flash播放器，之前在思途老兄的一篇文章中介绍了一个法国的flash播放器，但是用了一段时间后，发现那个控制条一直存在，挡住了一部分画面，尤其是当视频有文字的时候，更让人无法容忍了。
categories:
- note
tags:
- f4player
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: f4player
  name: f4player
---

找了一上午，终于找到一个自己觉得稍微满意的flash播放器，之前在思途老兄的一篇文章中介绍了一个法国的flash播放器，但是用了一段时间后，发现那个控制条一直存在，挡住了一部分画面，尤其是当视频有文字的时候，更让人无法容忍了。后来，我就找了一个叫f4player的，感觉还不错。

网址：http://f4player.org/。

下载地址：http://code.google.com/p/f4player/downloads/list。

大家可以去看看，下载里面有5个文件，其中一个是皮肤一个测试视频，我下的是最早那一个，因为alpha2和alpha2.1都是我不会用类型的，怎么弄也弄不出来，我就直接下了最下面那个alpha版本的。

试用了一下，又发现一个比较烦人的毛病，就是它总是把你的视频给变成16：9比例的，正好有源代码，我看了看f4文件夹下面的player.as文件，发现一段代码，大概在150行左右。

//  if(Width > int(Height * 1.7777)){ // 1.3333 => 4/3 || 1.7777 => 16/9 format

//    player.screen.width = int(Height * 1.7777);

player.screen.height = Height;

//  } else {

player.screen.width = Width;

//     player.screen.height = int(Width * .5625); // .75 => 4/3 || .5625 => 16/9 format

//  }

</pre>

源文件里面是没注释的，这里倍我注释了几行，兄弟你懂得。

然后把player.fa编译一下就OK了。

下面是调用代码

	<div id='player' align='center'></div>
	<p><script type="text/javascript" src="http://dobila.info/wp-content/themes/twentyten/dbl_src/mootools.txt"></script><br />
	<script type="text/javascript">
	var player = new Swiff('http://dobila.info/wp-content/themes/twentyten/dbl_src/f4player.swf', {
	id: 'f4player',
	width: 480,
	height: 360,
	params: {
	wmode: 'window',
	allowFullScreen: 'true'
	},
	vars: {
	skin: 'http://dobila.info/wp-content/themes/twentyten/dbl_src/f4dark.swf',
	screenshot: 'http://dobila.info/wp-content/uploads/2010/09/x4end.jpg',
	flv: 'http://dobila.info/wp-content/uploads/2010/09/x4end.mp4'
	}
	});
	player.inject('player');
	</script>

这里解释一下，第二行是加载了一个js框架，mootools，其实不用js也行，写一段ie和其他浏览器通用的代码就行，因为太懒了就懒的写了。还有就是如果插入多个视频的话，别忘了只留一个mootools。
