---
comments: false
date: 2011-09-24 11:45:30
layout: post
slug: big-tutorial-of-emacs
title: Emacs大总结
wordpress_id: 2877
categories:
- material
tags:
- emacs
---

按照本博客的观点，只要是看过一次的东西，一下不能全部记住，一定要放到这里来，以备把我可爱的流量只给自己，哈哈，虽然没有什么用，但是看到的网站上转贴的那些丑陋的格式，那些只知道采集的站长，我就禁不住的一阵感动，你们不累嘛？或许因为个人是有点完美主义，所以对很多东西都要求一些。所以虽然在这里我转载了，我转载了百度百科上的东西，但是我仍然没有内疚之心，第一，我注明出处了，第二，来看本文的人最起码不被乱七八糟的格式所气恼。

**Emacs的历史**

Emacs在1970年代诞生于MIT人工智能实验室（MIT AI Lab）。在此之前，人工智能实验室的ITS上运行的操作系统PDP-6和PDP-10的默认编辑器是一个叫TECO（Text Editor and Corrector）的行编辑器。与现代的文本编辑器不同，TECO将击键、编辑和文本显示按照不同的模式进行处理，稍晚出现的vi与它有些类似。在TECO上击键并不会直接将这些字符插入到文档里去，必须先输入一系列相应的TECO指令，而被编辑的文本在输入命令的时候是不会显示在屏幕上的。在如今还在使用的UNIX编辑器ed（ed）上，我们还能看到类似的工作方式。

1970年代初，Richard Stallman访问Stanford AI Lab时见到了那里的“E” editor。这种编辑器有着所见即所得的直观特点，深深打动了Stallman。后来Stallman回到MIT，那时候MIT AI lab的黑客Carl Mikkelsen 已经给TECO加上了称作“Control-R”的编辑显示模式，使得屏幕能跟随用户的每次击键刷新显示。Stallman重写了这一模式，使它运行得更有效率，后来又加入了宏，允许用户重新定义运行TECO程序的键位。



这一新版的TECO立刻在AI实验室流行开来，并且很快积累起了大量自定义的宏，这些宏的名字通常就以“MAC”或者“MACS”结尾，意为“宏”（macro）。两年后，Guy Steele承担起统一当时存在的各种键盘命令集的工作。Steele和Stallman经过一夜奋战，最终由Stallman完成了这一任务，包括一套扩展和注释新的宏包的工具。这个完成的系统被称作EMACS，代表“Editing MACroS”。根据Stallman的说法，他采用这个名字是“因为当时在ITS里还没有被当作缩写用过。”（”because  was not in use as an abbreviation on ITS at the time.” ）也有说法指出，当时波士顿在MIT附近有家名为“Emack & Bolio's”的商店出售的冰激凌很受欢迎，Dave Moon是那里的老主顾，他就将ITS上一个给文本排版的程序命名为BOLIO，然而Stallman并不喜欢甚或根本不知道那种冰激凌，此事后来成了黑客界的一桩公案。

Stallman意识到过多的定制、在开发过程中事实上的分支以及针对特殊用途的限制，威胁着Emacs的发展。后来他写道：

“ Emacs的发布基于社群共享，这意味着所有的发展都要反馈给我，由我进行整合和发布。（”EMACS was distributed on a basis of communal sharing, which means all improvements must be given back to me to be incorporated and distributed.”） ”

最初的Emacs同TECO一样只能运行在PDP-10系统。Emacs虽然是在TECO的基础上发展起来的，不过它已经足以被认为是一个新的文本编辑器了。很快，Emacs就成为ITS上的标准编辑程序，接着由Michael McMahon移植到Tenex和TOPS-20系统上。


**emacs的其他版本**

随后的几年里，开发出了许多运行于其他操作系统的类Emacs的编辑器，包括由Michael McMahon和Daniel Weinreb编写的SINE(Sine is not EMACS)、EINE（”EINE Is Not EMACS）以及ZWEI（“ZWEI Was EINE Initially”，工作于Lisp机器），它们的名字在德语中分别是“一”和“二”的意思。1978年，Honeywell的Cambridge Information Systems Lab的Bernard Greenberg用Maclisp（Lisp语言的一种）编写出Multics Emacs，第一次完全采用Lisp作为扩展语言。Lisp语言提供了前所未有的灵活性，因此被后来的Emacs开发者沿用。

最早在Unix上运行的Emacs类编辑器是1981年James Gosling编写的Gosling Emacs（Gosling后来发明了Java编程语言）。Gosling Emacs以C语言编写，使用Mocklisp作为扩展语言，Mocklisp有着类似Lisp语言的语法。1984年，Gosling Emacs成为专有软件（Proprietary software）。


**GNU Emac**

1984年，Stallman开始致力于开发GNU Emacs，这将是一个自由软件，以代替Gosling Emacs。最初GNU Emacs是在Gosling Emacs的基础上开发的，不过Stallman后来用一个真正的Lisp解释器代替了原来的Mocklisp解释器，由于Lisp解释器在此软件中的核心地位，这意味着实际上重写了几乎全部代码。GNU Emacs是GNU计划的第一个项目，以C语言编写，将Emacs Lisp（其解释器由C实现）作为扩展语言。GNU Emacs最早广泛发布的版本是15.34，出现于1985年。实际上版本2到12并不存在，GNU Emacs的早期版本都是以“1.x.x”的形式编号，直到1.12版时开发人员放弃了这一记法，因为他们认为主版本号是不应该改动的。因此，Version 13是第一个public release，它发布于1985年3月20日。

GNU Emacs和Gosling Emacs一样运行在Unix系统上。不过GNU Emacs的功能更多，特别是它有一个真正的lisp作为扩展。结果，GNU Emacs很快就取代了Gosling Emacs，成为Unix系统上事实的Emacs编辑器。

1999年之前，GNU Emacs的开发相对封闭，以至于到了在《大教堂与市集》这本书里被用作“教堂式”开发的典范这样一个程度。在那以后这个项目就采用了公开的开发邮件列表和匿名CVS访问。开发工作在一个单独的CVS trunk中进行，目前的版本号是22.0.93（这篇文章比较老，现在已经有23.0的版本了）。现在它的维护者是Richard Stallman。


**XEmac**

1991年，Lucid公司的Jamie Zawinski等人以GNU Emacs 19的一个早期alpha版为基础，添加了一些新的特性，开发出Lucid Emacs。很快，Lucid Emacs的开发与GNU Emacs渐行渐远，最终双方的团队放弃了将两者合并的努力。Lucid Emacs被重新命名为XEmacs，它不像GNU Emacs那样要求严格的代码授权，因此能够吸纳大量的优秀扩展，在很多方面比GNU Emacs更为优秀。到目前为止，两者都是众多Emacs类编辑器中最受欢迎的选择。


**Emacs的功能特点**

Emacs不仅仅是一个编辑器，他是一个整合环境，或可称它为集成开发环境，这些功能如让使用者置身于全emacs功能的操作系统中，在基于编辑器的功能基础上，Emacs自行开发了一个“bourne-shell-like”的shell: EShell。Emacs还可以：

收发电子邮件

通过FTP/TRAMP编辑远程档案

通过Telnet登录主机

上新闻组

登陆IRC和朋友交流

查看日历

撰写文章大纲

对多种编程语言的编辑

调试程序，结合GDB，EDebug等。支持C/C++，Perl，Python，Lisp等等

玩游戏

计算器

记日记

煮咖啡

管理日程，Task，ToDo，约会等

个人信息管理

目录管理

文件比较

阅读info和man文档

浏览网站

为各种程序（TeX等）提供统一的操作界面

……


**此外Emacs还有如下特点：**

display editor

实时编辑器

高级编辑器

Self-documenting

可定制性

可扩展性（集成Lisp语言）

支持X Window环境


**各平台上的Emac**

Emacs是目前世界上最具可移植性的重要软件之一，能够在当前大多数操作系统上运行，包括类Unix系统（GNU/Linux、各种BSD、Solaris、AIX、IRIX、Mac OS X等等）、MS-DOS、Microsoft Windows以及OpenVMS等。

Emacs既可以在文本终端也可以在图形用户界面（GUI）环境下运行。在类Unix系统上，Emacs使用X Windows产生GUI，或者直接使用“框架”（widget toolkit），例如Motif、LessTif或GTK+等等。Emacs也能够利用Mac OS X和Microsoft Windows的本地图形系统产生GUI。用GUI环境下的Emacs能提供菜单（Menubar）、工具栏（toolbar）、scrollbar以及context menu等交互方式。


**编辑模式**

Emacs采取的编辑方式是对不同类型的文本进入相应的编辑模式，即“主模式”（major mode）。Emacs针对多种文档定义了不同的主模式，包括普通文本文件、各种编程语言的源文件、HTML文档、TEX与LaTeX文档，以及其他类型的文本文件等等。

每种主模式都有特殊的Emacs Lisp变量和函数，使用户在这种模式下能更方便的处理这一特定类型的文本。例如，各种编程的主模式会对源文件文本中的关键字、注释以不同的字体和颜色加以语法高亮。主模式还提供诸如跳转到函数的开头或者结尾这


**Emacs快捷键**

掌握Emacs的快捷键可以说是Emacs爱好者的基本功，也是提高编辑速度和质量所必备的，但是初学者可能记不住那么多的快捷键必要时可以翻一下，最常用的快捷键数量也就数十个。Emacs的快捷键都是绑定于ctrl和alt(或称meta)上的，例如c-x就是ctrl+x，m-x就是alt+x。当然所有的按键都可以自定义。

当要退出编辑时C-x C-c 代表着,先按C-x 再按C-c才可以退出编辑环境．


**文件操作**

C-x C-f 打开文件,出现提示时输入/username@host:filepath可编辑FTP文件

C-x C-v 打开一个文件，取代当前缓冲区

C-x C-s 保存文件

C-x C-w 存为新文件

C-x i 插入文件

C-x C-q 切换为只读或者读写模式

C-x C-c 退出Emacs


**编辑操作**

C-f 前进一个字符

C-b 后退一个字符

M-f 前进一个单词

M-b 后退一个单词

C-a 移到行首

C-e 移到行尾

M-a 移到句首

M-e 移到句尾

C-p 后退一行

C-n 前进一行


