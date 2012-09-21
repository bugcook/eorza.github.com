---
layout: post
title: INPUT中文字的对齐
slug: about-the-vertical-align-of-input
date: 2011-03-16 11:52:41 +0800
excerpt: 关于按钮的问题，这里不用多说，按钮大体上分为`button`、`input[type=submit]`、`input[type=button]`这三种，上下对齐的话只要使用`padding`就行，同样在IE下面是不行的，要单独HACK。
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

完美控，对所有的东西都追求完美。虽然知道不可能，但是最起码更接近完美一些，那就很幸福了。


`input[type="text"]`这个，输入内容的上下对齐问题。这里提供两种方法。

第一种方法你喜欢微软雅黑字体，你的网站大部分是这个字体，然后你就可以font-size和line-height属性来控制，记住，后者的值必须比前者的值大4个px，然后字体是雅黑字体。至于其他的字体行不行我不知道，但我知道最起码默认的宋体就不行。这个方法在Chrome、firefox、IE9下面都测试成功，不需要HACK。

第二种方法是使用padding，如果需要加高input的高度，使这个input的padding上下一致即可，这个方法chrome和firefox下面是没问题的，而且任何字体都可以，在IE9下面要单独HACK，在IE9下面，padding上下的值不一样。

关于按钮的问题，这里不用多说，按钮大体上分为`button`、`input[type="submit"]`、`input[type="button"]`这三种，上下对齐的话只要使用padding就行，同样在IE下面是不行的，要单独HACK。

备注：Firefox的HACK：

	@-moz-document url-prefix(){ #respond {padding: 3px 8px;} }

当然，你要更改的里面的内容。

