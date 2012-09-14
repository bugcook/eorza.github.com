---
comments: true
date: 2010-10-27 14:58:14
layout: post
slug: mysql-remote-connection
title: mysql远程连接
wordpress_id: 858
categories:
- note
tags:
- apache
- mysql
---

今天重新做了一个虚拟机，然后配置了一下lamp，结果出现问题了，就是mysql远程连接的问题，默认的root用户是不支持远程连接的，因为root用户在mysql的msyql数据库中的user表的host只有127.0.0.1、localhost、本机名，所以当你以远程的ip去连接msyql服务器的时候，就会出现问题，问题就是连接不上了，哈哈。

感觉上root用户开放远程连接是很危险的，虽然是虚拟机，但是还是养成一个好的习惯比较好，于是，我添加了一个用户。




    
    GRANT ALL PRIVILEGES ON dbName.* TO test@"%" identified by "1111";



这里的%就是对所有主机开放的意思了。添加完后，发现还是连不上，印象中好像还有个地方要改，我在本机上telnet localhost 3306，可以。然后我telnet 192.168.0.111 3306就不行了（192.168.0.111是我本机ip）。于是我netstat了一下，发现3306端口只监听127.0.0.1（即回还接口）的。这个时候才想起来，好像是msyql只是设置了监听本地回还接口啊，然后我就打开my.cnf文件，找到。


    
    bind-address = 127.0.0.1



这段配置，把他注释掉了，让mysql可以接受所有网卡的请求，就ok了。

这里总结一下不管是mysql也好，apache也好，还是sendmail也好都考虑了很多安全的东西，常用的手段就是限制，一个限制监听的网卡和端口，一个是限制远端的ip（ip过滤），所以当你有什么东西远程连接不上的时候，从这两个方面考虑一下，会比较好的。打完收工。

