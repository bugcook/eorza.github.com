---
comments: true
date: 2012-09-12 20:15:20
layout: post
slug: some-default-suffix-in-linux
title: linux中一些的默认后缀
wordpress_id: 3516
categories:
- note
tags:
- linux
---

Linux下文件的类型是不依赖于其后缀名的，但一般来讲：

.ko 是Linux 2.6内核使用的动态连接文件的后缀名，也就是模块文件，用来在Linux系统启动时加载内核模块

.o 是目标文件,相当于windows中的.obj文件

.so 为共享库,是shared object,用于动态连接的,和dll差不多

.a 为静态库,是好多个.o合在一起,用于静态连接

.la 为libtool自动生成的一些共享库，vi编辑查看，主要记录了一些配置信息。可以用如下命令查看file *.la来查看文件类型

.c为后缀的文件，C语言源代码文件；

.a为后缀的文件，是由目标文件构成的档案库文件；

.C，.cc或.cxx 为后缀的文件，是C++源代码文件；

.h为后缀的文件，是程序所包含的头文件；

.i 为后缀的文件，是已经预处理过的C源代码文件；

.ii为后缀的文件，是已经预处理过的C++源代码文件；

.m为后缀的文件，是Objective-C源代码文件；

.o为后缀的文件，是编译后的目标文件；

.s为后缀的文件，是汇编语言源代码文件；

.S为后缀的文件，是经过预编译的汇编语言源代码文件。



详细说一下:



1.以.a为扩展名的文件:

#tar xv file.a

2.以.z为扩展名的文件:

#uncompress file.Z

3.以.gz为扩展名的文件:

#gunzip file.gz

4.以.bz2为扩展名的文件:

#bunzip2 file.bz2

5.以.tar.Z为扩展名的文件:

#tar xvZf file.tar.Z

或 #compress -dc file.tar.Z | tar xvf -

6.以.tar.gz/.tgz为扩展名的文件:

#tar xvzf file.tar.gz

或 gzip -dc file.tar.gz | tar xvf -

7.以.tar.bz2为扩展名的文件:

#tar xvIf file.tar.bz2

或 bzip2 -dc file.tar.bz2 | xvf -

8.以.cpio.gz/.cgz为扩展名的文件:

#gzip -dc file.cgz | cpio -div

9.以.cpio/cpio为扩展名的文件:

#cpio -div file.cpio

或cpio -divc file.cpio

10.以.rpm为扩展名的文件安装:

#rpm -i file.rpm

11.以.rpm为扩展名的文件解压缩：

#rpm2cpio file.rpm | cpio -div

12.以.deb为扩展名的文件安装：

#dpkg -i file.deb

13.以.deb为扩展名的文件解压缩:

#dpkg-deb --fsys-tarfile file.deb | tar xvf - ar p

file.deb data.tar.gz | tar xvzf -

14.以.zip为扩展名的文件:

#unzip file.zip
