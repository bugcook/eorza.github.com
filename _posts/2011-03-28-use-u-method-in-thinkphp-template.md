---
layout: post
title: thinkphp模板使用U方法
slug: use-u-method-in-thinkphp-template
date: 2011-03-28 11:42:51 +0800
excerpt: 这两天看了一下thinkphp的东东，发现缺陷实在不少（或许是我功力不够，那些缺陷可以用更方便的方法解决）。想想国内的东西，貌似很少有好的作品。实在是失望透顶。
categories:
- note
tags:
- thinkphp
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: thinkphp
  name: thinkphp
---

这两天看了一下thinkphp的东东，发现缺陷实在不少（或许是我功力不够，那些缺陷可以用更方便的方法解决）。想想国内的东西，貌似很少有好的作品。实在是失望透顶。


比如这个，我想实现这么一个功能，在我输出的一组数据里面调用URL，好的，官方回答：

> {:U()}
> 这样的用法就是调用一个普通的函数的用法，变量在函数里面怎么调用 这里就怎么调用
> 很典型的错误就是
> {:U('view?id=$id')}
> 你会在php代码里面这样写 $url = 'view?id=$id'; 吗？
> 仔细想下吧，呵呵~不要老是犯这种低级的错误

这是低级的错误，确实是。我知道我可以$url = "view?id=$id"; 这样写，但是大哥，一般html里面，url外面都要包含一个双引号的。

好了，不多发牢骚了，有个人给了下面的解决方法，实在是，一点都不模板，一点都不引擎。

	{:U('View/index',array('pid'=>$vo['id']))}

一点都不一目了然，让美工来做程序吧。
