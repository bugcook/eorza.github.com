---
layout: post
title: 开源Web服务器
slug: open-source-web-server
date: 2011-05-24 13:29:10 +0800
excerpt: 开源产品的出现不仅获得了个人用户的喜爱，众多知名企业也青睐于它。虽然开源产品数不胜数，但并不是每一个开源产品都能被广泛应用并得到大众的好评。在众多成功的开源产品中，只有少数领头羊，而其它产品只能望其项背。本文汇总了五款开源Web服务器，来看看有没有你需要的吧！文章摘抄下来，以备以后使用。
categories:
- note
tags:
- apache
- linux
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: apache
  name: Apache
- slug: linux
  name: linux
---

开源产品的出现不仅获得了个人用户的喜爱，众多知名企业也青睐于它。虽然开源产品数不胜数，但并不是每一个开源产品都能被广泛应用并得到大众的好评。在众多成功的开源产品中，只有少数领头羊，而其它产品只能望其项背。本文汇总了五款开源Web服务器，来看看有没有你需要的吧！文章摘抄下来，以备以后使用。


## Apache

Apache是一个免费的网络服务器系统，基于“开源”许可发布。阿帕奇版本2.0在大部分基于UNIX的操作系统上都能运行，像Linux、Solaris、Digital UNIX以及AIX。在UNIX/POSIX系列系统上，比如Rhapsody、BeOS、以及BS2000/OSD中也能运行。甚至在AmigaOS与Windows2000上也可以运行。根据Netcraft网站的调查，互联网中60%的网站采用Apache系统。

Apache HTTP服务器从1996年诞生开始就成为全球使用最为广泛的Web服务器，其市场占有率远远超过第二名的IIS。2009年，全球超过1亿个网站使用Apache。

据Netcraft2010年8月11日的数据统计表明，全球目前已有119,664,128个网站使用Apache，目前Apache市场占有率为54.90%，IIS为25.87%。

## Nginx

Nginx是一个高性能的HTTP和反向代理服务器，也是一个 IMAP/POP3/SMTP代理服务器。 Nginx是由Igor Sysoev为俄罗斯访问量第二的 Rambler.ru 站点开发的。Igor将源代码以类BSD许可证的形式发布。Nginx 已经因为它的稳定性、丰富的功能集、示例配置文件和低系统资源的消耗而闻名了。

Nginx可以在大多数类Unix操作系统上编译运行，并有 Windows移植版。Nginx 是一个很棒的高性能Web和反向代理服务器，它具有很多非常优越的特性：在高连接并发的情况下，Nginx是Apache服务器不错的替代品。在美国，Nginx是虚拟主机商人经常选择的软件平台之一。它能够支持高达50000个并发连接数的响应。Nginx 的安装非常简单，配置文件非常简洁（还能够支持perl语法），Bug非常少。

## Lighttpd

Lighttpd 是一个德国人领导的开源Web服务器软件，其根本目的是提供一个专门针对高性能网站，安全、快速、兼容性好且灵活的web服务器环境。它的内存消耗非常低、CPU占用率低、效能好并且模块丰富。

Lighttpd是众多开源轻量级的Web服务器中较为优秀的一个。支持FastCGI、CGI、Auth、输出压缩、 URL重写及Alias等重要功能，而Apache之所以流行，很大程度也是因为功能丰富，在lighttpd上很多功能都有相应的实现，这一点对于Apache用户来说非常重要，因为迁移到lighttpd就必须面对这些问题。

## Cherokee

Cherokee号称是目前最快的Web 服务器软件，据说在性能上甚至比Nginx还略胜一筹。而且它还提供了一个benkmark测试来试图证明这一点，参与比较的有Lighttpd和Nginx。

同时，Cherokee还具有众多模块功能支持，比如FastCGI、SCGI、PHP、CGI、TLS及SSL加密连接、虚拟主机、授权认证、实时编码、载入均衡及与Apache兼容的日志文件等。从功能的丰富性上来说，Cherokee可以与Apache http比肩了。高性能和图形化的服务器管理是Cherokee的俩大卖点。

## Appweb

Appweb是一个嵌入式HTTP Web服务器，它的主要设计思路是安全。这是直接集成到客户的应用和设备，便于开发和部署基于Web的应用程序和设备。它正迅速（ 要求超过3500每秒）和紧凑（从11万），其中包括支持动态网页制作，服务器端嵌入式脚本过程中的CGI ，可加载模块，的SSL ，摘要式身份验证，虚拟主机， Apache样式配置，日志记录，单和多线程应用程序。它提供了大量的文档和示例。

Appweb是完全遵循GPL软件许可协议（GNU General Public License）的开源Web服务器。 AppWeb Web服务器软件在功能上比GoAhead更加丰富和实用， 除了GoAhead已有的功能之外，还有如下特点： 支持服务器端的JavaScript脚本。


