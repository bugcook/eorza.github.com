---
layout: post
title: Apache 重写规则
slug: apache-rewrite
date: 2010-09-15 17:28:15 +0800
excerpt: 本文旨在提供如何用Apache重写规则来解决一些常见的URL重写方法的问题，通过常见的实例给用户一些使用重写规则的基本方法和线索。
categories:
- material
tags:
- apache
---

## 一：目的

本文旨在提供如何用Apache重写规则来解决一些常见的URL重写方法的问题，通过常见的实例给用户一些使用重写规则的基本方法和线索。

## 二：为什么需要用重写规则？

一个网站，如果是长期需要放在internet上提供服务，必定会有不断地更新和维护，如临时转移到其它服务器进行维护，重新组织目录结构，变换URL甚至改变到新的域名等等， 而为了让客户不会因此受到任何影响，最好的方法就是使用Apache Rewrite Rule(重写规则)。


## 三：重写规则的作用范围

1) 可以使用在Apache主配置文件httpd.conf中

2) 可以使用在httpd.conf里定义的虚拟主机配置中

3) 可以使用在基本目录的跨越配置文件.htaccess中

## 四：重写规则的应用条件

只有当用户的WEB请求最终被导向到某台WEB服务器的Apache后台，则这台WEB服务器接受进来的请求，根据配置文件该请求是主配置还是虚拟主机，再根据用户在浏览器中请求的URI来配对重写规则并且根据实际的请求路径配对.htaccess中的重写规则。最后把请求 的内容传回给用户，该响应可能有两种：

1) 对浏览器请求内容的外部重定向(Redirect)到另一个URL。

让浏览器再次以新的URI发出请求(R=301或者R=302，临时的或是永久的重定向)如：一个网站有正规的URL和别名URL，对别名URL进行重定向到正规URL，或者网站改换成了新的域名则把旧的域名重定向到新的域名(Redirect)

2) 也可能是由Apache内部子请求代理产生新的内容送回给客户`[P,L]`

这是Apache内部根据重写后的URI内部通过代理模块请求内容并送回内容给客户，而客户端浏览器并不知道，浏览器中的URI不会被重写。但实际内容被Apache根据重写规则后的URI得到。如：在公司防火墙上运行的Apache启动这种代理重写规则，代理对内部网段上的WEB服务器的请求。

## 五：重写规则怎样工作？

我们假定在编译Apache时已经把mod_rewrite编译成模块，确信你的httpd.conf中有LoadModule rewrite_module libexec/mod_rewrite.so并且在Addmodule中有Addmodule mod_rewrite.c则可以使用重写规则。当外部请求来到Apache，Apache调用重写规则中的定义来重写由用户浏览器指定请求的URI，最后被重写的URI如果是重定向，则送由浏览器作再一次请求；如果是代理则把重写后的URI交给代理模块请求最终的内容(Content),最后把内容送回给浏览器。

## 六：何时使用.htaccess中的重写规则定义？

假如你对你的的网站内容所在的服务器没有管理员权限，或者你的网站放在ISP的服务器上托管等等条件下，你无法改写主配置文件，然而你可以对你的WEB站点内容所在的目录有写权限，则你可以设置自己的.htaccess文件达到同样的目的。但你需要确定主配置文件中对你的网站所在的目录定义了下面的内容:

	Options Indexes FollowSymLinks
	AllowOverride all

否则你的.htaccess不会工作。

## 七：应用举例

假定Apache被编译安装在主机192.168.1.56的/usr/local/apache/ 目录下面，我们编译进了重写和代理模块。

1) 隐藏Apache下的某个目录，使得对该目录的任何请求都重定向到另一个文件。

a&gt; httpd.conf的实现方法

我们放下面的部分到/usr/local/apache/conf/httpd.conf

	options Indexes followsymlinks
	allowoverride all
	rewriteengine on
	rewritebase /
	rewriterule ^(.*)$ index.html.en [R=301]

注：rewriteengine on 为重写引擎开关，如果设为off,则任何重写规则定义将不被应用，该开关的另一好处就是如果为了临时拿掉重写规则，则改为off再重启动Apache即可，不必将下面一条条的重写规则注释掉。rewritebase / 的作用是如果在下面的rewriterule定义中被重写后的部分(此处为文件名index.html.en)前面没有/，则是相对目录，相对于这个rewritebase后面的定义也就是/usr/local/apache/htdocs/index.html.en,否则，如果此处没有rewritebase /这一项，则被重写成http://192.168.1.56/usr/local/apache/htdocs/manual/index.html.en ，显然是不正确的。

不过这里我们也可以不用rewritebase / , 而改为

	rewriteengine on
	rewriterule ^(.*)$ /index.html.en [R=301]

或者

	rewriteengine on
	rewriterule ^(.*)$ http://192.168.1.56/index.html.en [R=301]

b&gt; .htaccess的实现方法

我们先放下面的部分到httpd.conf

	options Indexes followsymlinks
	allowoverride all

然后放下面的部分到/usr/local/apache/htdocs/manual/.htaccess中

	rewriteengine on
	rewritebase /
	rewriterule ^(.*)$ index.html.en [R=301]

注：对文件.htaccess所作的任何改动不需要重启动Apache.

问：要是把这个manual目录重定向到用户jephe的自己的主目录呢？

用下面的.htaccess方案。

	rewriteengine on
	rewritebase /~jephe/
	rewriterule ^(.*)$ $1 [R=301]

则对manual目录下任何文件的请求被重定向到~jephe目录下相同文件的请求。

2) 转换www.username.domain.com的对于username的主页请求为www.domain.com/username

对于HTTP/1.1的请求包括一个Host: HTTP头，我们能用下面的规则集重写http://www.username.domain.com/anypath 到 /home/username/anypath

	Rewriteengine on
	rewritecond %{HTTP_HOST} ^www.[^.]+.host.com$
	rewriterule ^(.+) %{HTTP_HOST}$1 [C]
	rewriterule ^www.([^.]+).host.com(.*) /home/$1$2

注：

rewritecond 条件重写规则，当满足后面定义的条件后才会应用下面的重写规则，rewritecond有各种变量，请查阅相关文档。

3) 防火墙上的重写规则代理内部网段上服务器的请求。

NameVirtualhost 1.2.3.4

	servername www.domain.com
	rewriteengine on
	proxyrequest on
	rewriterule ^/(.*)$ http://192.168.1.3/$1 [P,L]

注：当外部浏览器请求 www.domain.com 时被解析到IP地址1.2.3.4 ,Apache 交出mod_rewrite处理转换成 http://192.168.1.3/$1 后再交由代理模块mod_proxy得到内容后传送回用户的浏览器。

4) 基本预先设定的转换MAP表进行重写 rewritemap

转换www.domain.com/{countrycode}/anypath 到Map表中规定的URI,上面是虚拟主机中的定义

	rewritelog /usr/local/apache/logs/rewrite.log
	rewriteloglevel 9
	rewriteengine on
	proxyrequest on
	rewritemap sitemap txt:/usr/local/apache/conf/rewrite.map
	rewriterule ^/([^/]+)+/(.*)$ http://%{REMOTE_HOST}::$1 [C]
	rewriterule (.*)::([a-z]+)$ ${sitemap:$2|http://h.i.j.k/} [R=301,L]

文件/usr/local/apache/conf/rewrite.map的内容如下:

	sg http://a.b.c.d/
	sh http://e.f.g.h/

注： 当用户请求http://www.domain.com/sg/anypath时被重写为http://a.b.c.d/anypath.当需要调试时请用rewritelog and rewriteloglevel 9联合,9为最大即得到最多的调试信息最小为1，最小的调试信息，默认为0，没有调试信息。sitemap的语法是${sitemap: LookupKey | Defaultvalue} ,有些书上把$写成了%是错误的。
