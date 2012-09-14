---
comments: true
date: 2011-04-29 14:27:22
layout: post
slug: linux-io-rediect
title: Linux I/O 重定向
wordpress_id: 2261
categories:
- material
tags:
- linux
---

linux I/O 重定向的一些东东，研究过几次，始终搞不懂，于是就先复制下来，慢慢品读。貌似要搞懂这些东西需要理解linux文件系统，INODE这些东西，还有重定向的概念用在cat这个命令下面比较多，这两者有什么关系吗？有人知道告诉我好吗？



**1、基本概念**



> 
a、I/O重定向通常与 FD有关，shell的FD通常为10个，即 0～9； 
b、常用FD有3个，为0（stdin，标准输入）、1（stdout，标准输出）、2（stderr，标准错误输出），默认与keyboard、monitor、monitor有关； 
c、用 < 来改变读进的数据信道(stdin)，使之从指定的档案读进； 
d、用 > 来改变送出的数据信道(stdout, stderr)，使之输出到指定的档案； 
e、0 是 < 的默认值，因此 < 与 0<是一样的；同理，> 与 1> 是一样的； 
f、在IO重定向 中，stdout 与 stderr 的管道会先准备好，才会从 stdin 读进资料； 
g、管道“|”(pipe line):上一个命令的 stdout 接到下一个命令的 stdin; 
h、tee 命令是在不影响原本 I/O 的情况下，将 stdout 复制一份到档案去; 
i、bash（ksh）执行命令的过程：分析命令－变量求值－命令替代（``和$( )）－重定向－通配符展开－确定路径－执行命令； 
j、( )  将 command group 置于 sub-shell 去执行，也称 nested sub-shell，它有一点非常重要的特性是：继承父shell的Standard input, output, and error plus any other open file descriptors。 
k、exec 命令：常用来替代当前 shell 并重新启动一个 shell，换句话说，并没有启动子 shell。使用这一命令时任何现有环境都将会被清除，。exec 在对文件描述符进行操作的时候，也只有在这时，exec 不会覆盖你当前的 shell 环境。 




**2、基本IO**



> 
cmd > file	 把 stdout 重定向到 file 文件中 
cmd >> file	 把 stdout 重定向到 file 文件中(追加) 
cmd 1> fiel	 把 stdout 重定向到 file 文件中 
cmd > file 2>&1	 把 stdout 和 stderr 一起重定向到 file 文件中 
cmd 2> file	 把 stderr 重定向到 file 文件中 
cmd 2>> file	 把 stderr 重定向到 file 文件中(追加) 
cmd >> file 2>&1	 把 stderr 和 stderr 一起重定向到 file 文件中 
cmd < file >file2	 cmd 命令以 file 文件作为 stdin，以 file2 文件作为 stdout 
cat <>file                             以读写的方式打开 file 
cmd < file	 cmd 命令以 file 文件作为 stdin 
cmd << delimiter	 Here document，从 stdin 中读入，直至遇到delimiter 分界符 





**3、进阶IO**



> 
>&n;	 使用系统调用 dup (2) 复制文件描述符 n 并把结果用作标准输出 
<&n;	 标准输入复制自文件描述符 n 
<&-	 关闭标准输入（键盘） 
>&-	 关闭标准输出 
n<&-	 表示将 n 号输入关闭 
n>&-	 表示将 n 号输出关闭 




上述所有形式都可以前导一个数字，此时建立的文件描述符由这个数字指定而不是缺省的 0 或 1。如：
 
... 2>file	运行一个命令并把错误输出(文件描述符 2)定向到 file。 

... 2>&1	运行一个命令并把它的标准输出和输出合并。(严格的说是通过复制文件描述符 1 来建立文件描述符 2 ，但效果通常是合并了两个流。) 

2>&1说明：2>&1 也就是 FD2＝FD1 ，这里并不是说FD2 的值 等于FD1的值，因为 > 是改变送出的数据信道，通俗的说是：把stderr并到stdout。但使用类似 cmd 1>&3 这样的形式时，原理相同，但往往不同于 2>&1 和 1>&2 通常用来合并的作用。 

注意：普通cmd命令的cmd n>&n; 和exec n>&n; 是有区别的。 



> 
exec 0outfilename	 # 打开文件outfilename作为stdout 
exec 2>errfilename	 # 打开文件 errfilename作为 stderr 
exec 0<&-	 # 关闭 FD0 
exec 1>&-	 # 关闭 FD1 
exec 5>&-	 # 关闭 FD5 





