---
layout: post
title: apache并发连接数
slug: apache-concurrent-link
date: 2011-11-04 09:52:15 +0800
excerpt: 突然发现，还有两个月就2012年了，时间过得真实带米内特块啊，最近公司的破网站经常连接不上去，于是找个命令查看apache的并发连接数，发现挺高的，哎。
categories:
- note
- material
tags:
- apache
- ubuntu
---

突然发现，还有两个月就2012年了，时间过得真实带米内特块啊，最近公司的破网站经常连接不上去，于是找个命令查看apache的并发连接数，发现挺高的，哎。要懂得东西太多了。

我们调优常常要查看httpd进程数（即prefork模式下Apache能够处理的并发请求数）：

	ps -ef | grep httpd | wc -l

出现的结果,就是当前Apache能够处理的多少个并发请求，这个值Apache根据负载情况自动调。

查看Apache的并发请求数及其TCP连接状态：

	netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'

返回结果示例：

	LAST_ACK 5
	SYN_RECV 30
	ESTABLISHED 1597
	FIN_WAIT1 51
	FIN_WAIT2 504
	TIME_WAIT 1057

其中的SYN_RECV表示正在等待处理的请求数；ESTABLISHED表示正常数据传输状态；TIME_WAIT表示处理完毕，等待超时结束的请求数。

	状态：描述
	CLOSED：无连接是活动的或正在进行
	LISTEN：服务器在等待进入呼叫
	SYN_RECV：一个连接请求已经到达，等待确认
	SYN_SENT：应用已经开始，打开一个连接
	ESTABLISHED：正常数据传输状态
	FIN_WAIT1：应用说它已经完成
	FIN_WAIT2：另一边已同意释放
	ITMED_WAIT：等待所有分组死掉
	CLOSING：两边同时尝试关闭
	TIME_WAIT：另一边已初始化一个释放
	LAST_ACK：等待所有分组死掉

可以使用Linux下的webbench来作压力测试.　
