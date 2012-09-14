---
comments: true
date: 2010-10-24 23:33:09
layout: post
slug: apache-virtual-host-order
title: apache虚拟机顺序
wordpress_id: 844
categories:
- note
tags:
- apache
---

本来想直接睡觉的，结果厕所里有人，在等厕所的时间看了一下apache的虚拟机的配置，对本来有点模糊的虚拟机配置有个稍微清楚的理解。说是理解，其实只是自己实验出来的，不过应该没问题。

apache虚拟机的顺序就是访问apache服务器的时候，apache是决定使用哪个文件夹为根目录的。呵呵，这里讲不清楚，就举个例子吧。比如你用www.test.com访问的一个网站，该网站是的web服务器是apache，此服务器DocumentRoot有虚拟机里面设置，有不是虚拟机里面设置的，那么，www.test.com将访问哪个目录呢？



首先，apache服务器会查找配置里面的NameVirtualHost指令，如果存在，那么NameVirtualHost后面的内容指示了在服务器上哪个网卡的哪个端口会出现基于域名的虚拟机的配置，比如是星号*，那么就是在所有网卡所有端口都可能出现虚拟机。

然后服务器会查找VirtualHost里面的ServerName是否有www.test.com这个域名，如果有，那么里面的目录就是了。如果没有，就会查找有没有IP合适的，如果没有，就会转到虚拟机指令以为的DocumentRoot所指的目录了。

大体上是这个样子，写的太乱了，突然发现自己的语文水平实在太低了，完全表达不出自己的想法。
