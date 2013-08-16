---
layout: post
title: Console和Terminal的区别
slug: different-between-console-and-terminal
date: 2012-08-30 14:09:46 +0800
excerpt: Console主要用来管理电脑，terminal主要用来使用电脑。随着时间的发展，管理员们也开始用terminal来管理电脑（比如通过ssh连接服务器来管理服务器），所以现在这两个东西开始混淆。
categories:
- note
tags:
- linux
---

抽空研究了LFS，自己编个系统玩玩。碰到了一些名词，比如console和terminal等等，搞不懂了，就上网查了查。

Console就是控制台，控制电脑的设备，一般用console的都是系统管理员，对于我们个人电脑闹来说就是鼠标、键盘、显示器，这些东西通过分别的接口与电脑相连，比如鼠标接口，键盘接口，显示器通过显卡与主机相连。

Terminal即是终端，我们使用电脑的设备，一般使用console的都是普通用户，因为linux下面是多用户的，很多人可以通过不同的terminal来使用电脑。这些terminal设备一般是通过串行线连接的，当然也很多用网卡连接的。

Console主要用来管理电脑，terminal主要用来使用电脑。随着时间的发展，管理员们也开始用terminal来管理电脑（比如通过ssh连接服务器来管理服务器），所以现在这两个东西开始混淆。


下面是转载了别人的解释。

> 要本质上区别这两个名词背后的差异，应该从它的使用角度去区分。terminal（终端）,其实是处于用户使用系统的角度来说的，相对于提供服务的系统终端是用户使用这个系统的入口，这个名词的使用范围比console要广。而console（控制台）则强调是控制系统（几乎就是大机了）的地方，其使用者主要是管理员。

> 由于历史的的原因，在计算机世界里terminal和console常常指同一样东西，因为这种东西能完成两种角色，后来便发展到一些技术人员已经不严格称呼这样东西了。但在著述文档时，应该要根据上下文环境决定使用哪个名词。
> 举个例子：对于摄像系统，摆在监控室里面的那些就是terminal而不是console.手机也是一个terminal，它是用户使用通信系统的入口，而手机这个小系统也是可以通过console来管理的。

> 在国外这两个概念并不难区分，所以wiki上没有强调这一点。

下面是网上大部分人从wiki上翻译的。

> 传统上讲，terminal（终端）,其实是处于用户使用系统的角度来说的，相对于提供服务的系统终端是用户使用这个系统的入口。而console（控制台）更强调是控制系统的地方，其使用者主要是管理员。从概念上讲terminal的范围比console要广。

再下面是stackover上的解释。

> In the linux world they can all look the same from the point of view of the user at the keyboard. The differences are in how they interact with each other.

> The shell is the program which actually processes commands and returns output. Most shells also manage foreground and background processes, command history and command line editing. These features (and many more) are standard in bash, the most common shell in modern linux systems.

> A terminal refers to a wrapper program which runs a shell. Decades ago, this was a physical device consisting of little more than a monitor and keyboard. As unix/linux systems added better multiprocessing and windowing systems, this terminal concept was abstracted into software. Now you have programs such as Gnome Terminal which launches a window in a Gnome windowing environment which will run a shell into which you can enter commands.

> The console is a special sort of terminal. Historically, the console was a single keyboard and monitor plugged into a dedicated serial console port on a computer used for direct communication at a low level with the operating system. Modern linux systems provide for virtual consoles. These are accessed through key combinations (e.g. alt+F1) which are handled at low levels of the linux operating system -- this means that there is no special service which needs to be installed and configured to run. Interacting with the console is also done using a shell program.

