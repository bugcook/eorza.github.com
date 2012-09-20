---
layout: post
title: vim7.3任意字体
slug: vim-73-any-fonts
date: 2011-05-27 15:14:25 +0800
excerpt: 这里提供的vim不光是任意字体，而且还取消了windows窗口的阴影边框（有的人叫3D边框），个人觉得那个边框好厚重一个，不美观，所以就去掉了，然后加了可以支持任意字体的东西。
categories:
- note
tags:
- vim
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: vim
  name: vim
---

这个又是一个完美控的结果。突然想起来昨天中午跟公司的老总一起吃饭的时候，他说他是个完美主义者，眼中总容不下别人的缺点。不过我觉得不是容不下别人的缺点，是容不下别人，因为他相信只有自己才能做完美的事情，他不相信别人。

所以我还是要学着改一下的比较好，尤其是像我这种偶尔写写代码的人来说，尤其注意，世界上没有没有BUG的代码，没有不乱的代码，没有完美的程序。我一直这样劝解自己。


回到主题，这里提供的vim不光是任意字体，而且还取消了windows窗口的阴影边框（有的人叫3D边框），个人觉得那个边框好厚重一个，不美观，所以就去掉了，然后加了可以支持任意字体的东西。

<audio controls="controls">
	<source src="{{ site.path.uploads }}2011/05/27/vim-73-any-fonts/noname.mp3" type="audio/mpeg" />
	Your browser does not support the audio element.
</audio>

说一下需要哪些东西，首先是去掉3D边框。下载下来源代码后找到gui_32w.c这个文件，打开，找到这两个地方。第一个地方是去掉边框，当去掉边框之后，默认窗口的大小就会多出2个像素，所以要修改第二个地方。

	s_hwnd = CreateWindowEx(
	WS_EX_CLIENTEDGE,         //注意这里要修改
	szVimWndClass, "Vim MSWindows GUI",
	WS_OVERLAPPEDWINDOW | WS_CHILD | WS_CLIPSIBLINGS | 0xC000,
	gui_win_x == -1 ? CW_USEDEFAULT : gui_win_x,
	gui_win_y == -1 ? CW_USEDEFAULT : gui_win_y,
	100,				/* Any value will do */
	100,				/* Any value will do */
	vim_parent_hwnd, NULL,
	s_hinst, NULL);

修改成

	s_hwnd = CreateWindowEx(
	WS_EX_MDICHILD,
	szVimWndClass, "Vim MSWindows GUI",
	WS_OVERLAPPEDWINDOW | WS_CHILD | WS_CLIPSIBLINGS | 0xC000,
	gui_win_x == -1 ? CW_USEDEFAULT : gui_win_x,
	gui_win_y == -1 ? CW_USEDEFAULT : gui_win_y,
	100,				/* Any value will do */
	100,				/* Any value will do */
	vim_parent_hwnd, NULL,
	s_hinst, NULL);

	gui.border_offset = gui.border_width + 2;	/*CLIENT EDGE*/   //这里要修改，注意。

修改成

	gui.border_offset = gui.border_width;	/*CLIENT EDGE*/

好了，编译，看到了吧，边框没有了。接下来我们就修改make文件来使vim7.3支持所有的字体。介绍一下为什么要修改make文件，其实就是编译参数，所以你也可以修改编译的时候的参数，但是这里还是请你修改make文件吧。

找到Make_mvc.mak和Make_ming.mak两个文件，在这两个文件下面分别加入一下代码，注意，第一行加入Make_mvc.mak中，第二行加入Make_ming.mak中。

	CFLAGS = $(CFLAGS) -DFEAT_PROPORTIONAL_FONTS
	DEFINES += -DFEAT_PROPORTIONAL_FONTS

编译，打完收工，呵呵，虽然讲了这么多，但是估计大部分人都不会去做的，所以，直接放出编译好的gvim文件，大家下载吧。点击这里下载。

最后献上一首歌，送给每个过来的朋友的。
