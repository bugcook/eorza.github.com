---
layout: post
title: 升级至Wordprss3.1
slug: upgrade-to-wordpress3_1
date: 2011-03-02 18:28:54 +0800
bgsound: 2011/03/02/upgrade-to-wordpress3_1/CopaCabana.webm
excerpt: 前两天wordpress升级到了3.1版本，我也追逐一下潮流，把我的博客也升级了，本来想把我所有的东西做成一个插件，以便以后升级的时候会方便，但是想想还是算掉了，因为本人打算以后有重大升级的时候才考虑升级，而且即使做成插件，升级的时候也会因为调用函数改变之后要重写，还不若这样直接该来的爽快来的潇洒。
categories:
- note
tags:
- video
- bgsound
- wordpress
---

前两天wordpress升级到了3.1版本，我也追逐一下潮流，把我的博客也升级了，本来想把我所有的东西做成一个插件，以便以后升级的时候会方便，但是想想还是算掉了，因为本人打算以后有重大升级的时候才考虑升级，而且即使做成插件，升级的时候也会因为调用函数改变之后要重写，还不若这样直接该来的爽快来的潇洒。

这里主要是记录下所做的改变。

首先是主题根据自己的爱好改变了样式，在此次升级中，我把所有的CSS都写在了style.css的底部，这样的话以后小的升级可以直接粘贴了，大家如果觉得我的主题改的符合你的样子，那么我可以免费给你哦。

代码本来也已经发布出来，因为太长了，所以就减去了，如果你想要就可以看我的style.css的底部。你可以拷贝这里的代码，然后放到底部，就可以了，哈哈。当然我的审美观点跟你的是不可能完全一样的，所以，还是需要自己稍微修改一下的。

修改完主题的外观就开始做邮件提醒和ajax评论了。AJAX评论很简单，在header里面加一段代码就行，替换掉原来的评论动作，然后邮件回复提醒就需要改wordpress的系统文件了，哈哈，在wp-includes/comment-template.php里面，加的是提交按钮旁边的是否需要评论。

修改完这个，就需要改后台了，后台登录界面不满意，改一改，文件在wp-admin/css/login.css里面。然后就是加几个编辑器的按钮，加在wp-includes/quicktags.js，代码我就不写下来了，因为跟这里的东西好像冲突，哈哈。

好了吧，应该差不多了，最后再放个视频，测试一下我的编辑器按钮。

<video controls="controls">
	<source src="{{ site.path.uploads }}2011/03/02/upgrade-to-wordpress3_1/Final-Fantasy-XIV-FF14.webm" type="video/webm" />
	<source src="{{ site.path.uploads }}2011/03/02/upgrade-to-wordpress3_1/Final-Fantasy-XIV-FF14.mp4" type="video/mp4" />
	Your browser does not support the video tag.
</video>

PS：最近有好多网友喜欢我的主题，所以很高兴。所以就提供下载吧。点击这里下载
