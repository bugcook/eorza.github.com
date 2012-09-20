---
layout: post
title: linux所有文件夹
slug: ls-all-directories-in-linux
date: 2011-07-29 17:45:51 +0800
excerpt: 列出linux下面某一个目录的所有文件夹。一开始我觉得应该是应该不是什么大问题，应该有相应的命令吧，不过一段时间之后我发现找不到，只找到这一条命令，是在是惭愧啊，如果大家谁知道请告诉我哦。
categories:
- note
tags:
- bash
- linux
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: bash
  name: bash
- slug: linux
  name: linux
---

列出linux下面某一个目录的所有文件夹。一开始我觉得应该是应该不是什么大问题，应该有相应的命令吧，不过一段时间之后我发现找不到，只找到这一条命令，是在是惭愧啊，如果大家谁知道请告诉我哦。

举几个例子比较好，不然不好理解，首先，列出当前目录所有的文件夹。

	ls -RF | grep ':$' | awk -F ':' '{print $1}'

然后，列出用户目录下面的picture文件夹。

	ls ~/picture -RF | grep ':$' | awk -F ':' '{print $1}'

最后，给用户目录下的picture文件夹下面的所有的属性+x。

	chmod ~/picture +x `ls -RF | grep ':$' | awk -F ':' '{print $1}'`

最后的最后不要告诉我你还想知道怎么更改所有的文件的属性。
