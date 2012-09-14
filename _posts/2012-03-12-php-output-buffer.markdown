---
comments: true
date: 2012-03-12 17:26:49
layout: post
slug: php-output-buffer
title: PHP的输出缓冲
wordpress_id: 3294
categories:
- note
tags:
- php
- ubuntu
---

今天碰到一个小问题，本着研究到底的精神。这个问题被我研究了一下，当然到底时不可能的，什么事情到底了就会总结出哲学的那几个问题上，比如人为什么活着等问题。

就是用header函数的时候会出现什么headers already sent这个问题，其实这个问题在ubuntu中是已经没有了的，因为，因为的原因在后面讲。

首先讲一下headers。这里的headers就是http header的意思。当你请求一个页面的时候，服务器会返回两部分，一部分就是header，一部分时主要内容。这个header储存了很多有用的东西，比如你的浏览器的cookie等内容，而内容则是你看到的东西。

为什么会出现headers already sent这个问题大体上很好理解。PHP在输出的时候，会产生header数据，如果没有明显的用函数指定header的值（比如header函数、setcookie函数都会改变header的值），那么会产生默认的值。header的作用时很多有用的东西，http协议的创造者让它必须要在主体内容之前发送到浏览器。如果在这之前你已经用php输出一些东西了，那么当然会引起冲突了。



下面这一段时有文化的人的解释，我只是摘抄一下。



> 脚本开始执行时，它可以同时发送header(标题)信息和主体信息。 Header信息(来自 header() 或 SetCookie() 函数)并不会立即发送，相反，它被保存到一个列表中。 这样就可以允许你修改标题信息，包括缺省的标题(例如 Content-Type 标题）。但是，一旦脚本发送了任何非标题的输出（例如，使用 HTML 代码块或 print() 调用)，那么PHP就必须先发送所有的标题，然后再送出空行，终止 HTTP header，而在此之后才会继续发送主体数据。从这时开始，任何添加或修改标题信息的试图都是不允许的，并会发送上述的错误消息之一。



于是php就研究出了output buffer来解决这个问题。output buffer时php的一个选型，如果你有权限，你可以直接修改php.ini文件来开启这个东西，也可以在程序里面动态的控制。下面4个函数就时用来控制的。


    
    
    ob_start()
    启用output buffering机制。 Output buffering支持多层次 -- 例如，可以多次调用ob_start() 函数。
    
    ob_end_flush()
    发送output buffer（输出缓冲）并禁用output buffering机制。
    
    ob_end_clean()
    清除output buffer但不发送，并禁用output buffering。
    
    ob_get_contents()
    将当前的output buffer返回成一个字符串。允许你处理脚本发出的任何输出。
    



然后举两个例子，因为如果没有例子，那么很少人呢会懂。

Example 1


    
    
     
    <h1>Example 1</h1> 
    
    



这里，尽管你已发送了输出(HTML 代码块中和 print 语句中)，也可以使用 SetCookie() 调用，而不会出错，真的要感谢output buffering机制。请注意使用output buffering机制用于这种目的会引起一定程度上的性能损失，因此最好缺省情况下不要启用此机制。但是，对于复杂一些的脚本，output buffering可以简化逻辑性。

Example 2


    
    
     
    



这个例子显示了一个效率很低的确定字符串长度的方法。它不是简单的使用strlen()函数处理，而是先启用 output buffering 机制，将字符串打印出来,然后再确定output buffer的长度。最后清除output buffer。

打完收工。新生活新鸡血。
