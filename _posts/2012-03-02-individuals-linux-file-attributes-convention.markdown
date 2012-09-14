---
comments: true
date: 2012-03-02 15:48:47
layout: post
slug: individuals-linux-file-attributes-convention
title: linux文件属性的个人约定
wordpress_id: 3289
categories:
- note
tags:
- linux
- ubuntu
---

完美的感觉又来了，下午叨叨了一会在linux下开发web程序文件的属性问题。

环境是ubuntu+apache（默认apache是以www-data这个用户来运行的），我的用户名是hass。默认的文件夹属性是775，文件是644。文件所属为hass:hass,。web程序在安装的时候如果需要写权限，那么我就将文件所属改为www-data:hass。然后apache自己产生的文件的文件所属明显就是www-data:www-data。

讲一下好处，文件所属为hass:hass的文件都是需要人来编辑的程序，文件所属的www-data:hass为需要写权限的，文件所属为www-data:www-data的则为apache生成的，不需要我们来干预的。

后：刚到新公司，很新奇。
