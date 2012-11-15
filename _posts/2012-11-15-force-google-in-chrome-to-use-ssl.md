---
layout: post
title: Chrome下强制http重定向到https的方法
categories:
- note
tags:
- google
- chrome

---

使用Google的https搜索的时候，我们会发现搜索结果虽然可以显示，但是有时候结果的链接却无法打开。这里的原因是因为Google的https的搜索结果链接往往使用的是http的方式打开，因此有时候会无法访问，本文将介绍在Chrome下解决这个问题的方法。

如果你使用的是Chrome浏览器，只需要经过一些简单的设置，就可以强制Google的https搜索结果链接也使用https的方式打开。

打开Chrome，在地址栏输入chrome://net-internals/

之后，在HSTS选项卡下的Domain中输入 www.google.com （或 www.google.com.hk ），然后点击Add按钮。

现在你再使用Google的Https搜索，就会发现搜索结果的链接可以打开了。

这个设置主要用于解决10月下旬开始的Google搜索不畅的问题，如果用户切换到https的Google，那一定会遇到本文所说的问题。

对于其他网站的域名，如果遇到类似问题，也可以通过这个方法解决。
