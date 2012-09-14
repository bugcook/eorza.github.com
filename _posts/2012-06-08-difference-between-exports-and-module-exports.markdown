---
comments: true
date: 2012-06-08 20:04:15
layout: post
slug: difference-between-exports-and-module-exports
title: module.exports和exports的区别
wordpress_id: 3379
categories:
- note
tags:
- js
- node
---

在看代码的时候，注意到有很多地方出现了module.exports。当然在你的require的文件里，有很多exports.xxx这样的东西，我就研究了这两者之间的区别。

module.exports是require返回真正的东东。exports.xxx只是一种helper，他最后所有的东西都将赋值给module.exports。

多说了还是看不懂，先上代码吧。


    
    
    var to_exports = {};
    
    to_exports.name = function() {
    	console.log('My name is Hass');
    };
    to_exports.age = function() {
    	console.log('I\'m 18 years old');
    };
    
    module.exports = to_exports;
    



这段代码的的 to_exports 相当于 exports 。只是第一行和最后一行在你node里面帮你做了。

所以说 module.exports 是真正的东西， 是我们真正require过来的东西，所以如果你想单纯的返回一个字符串，那么你可以：


    
    module.exports = "A string";



但是你用 exports 的话，那么你要：


    
    exports.astring = "A string";



然后你需要调用astring返回你的字符串。

明天休息了，哈哈哈，太爽了。
