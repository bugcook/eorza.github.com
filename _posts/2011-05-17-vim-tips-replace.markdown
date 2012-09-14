---
comments: true
date: 2011-05-17 13:33:00
layout: post
slug: vim-tips-replace
title: vim技巧之替换
wordpress_id: 2608
categories:
- note
- material
tags:
- vim
---

vim是无比强大的，这里提供大家一个技巧，就是批量获得图片地址的方法，当然这里的vim技巧不止批量获取地址，还有好大用处，但是这里我就是用来批量获取地址的。好的，开始吧。



这里以编写C语言程序为例， 假设，我们最终想完成的代码如下：


    
    
    #define BIT_MASK_1      (1 << 0)
    #define BIT_MASK_2      (1 << 1)
    #define BIT_MASK_3      (1 << 2)
    #define BIT_MASK_4      (1 << 3)
    #define BIT_MASK_5      (1 << 4)
    #define BIT_MASK_6      (1 << 5)
    #define BIT_MASK_7      (1 << 6)
    #define BIT_MASK_8      (1 << 7)
    #define BIT_MASK_9      (1 << 8)
    #define BIT_MASK_10      (1 << 9)
    #define BIT_MASK_11      (1 << 10)
    #define BIT_MASK_12      (1 << 11)
    #define BIT_MASK_13      (1 << 12)
    #define BIT_MASK_14      (1 << 13)
    #define BIT_MASK_15      (1 << 14)
    #define BIT_MASK_16      (1 << 15)
    #define BIT_MASK_17      (1 << 16)
    #define BIT_MASK_18      (1 << 17)
    #define BIT_MASK_19      (1 << 18)
    #define BIT_MASK_20      (1 << 19)
    #define BIT_MASK_21      (1 << 20)
    #define BIT_MASK_22      (1 << 21)
    #define BIT_MASK_23      (1 << 22)
    #define BIT_MASK_24      (1 << 23)
    #define BIT_MASK_25      (1 << 24)
    #define BIT_MASK_26      (1 << 25)
    #define BIT_MASK_27      (1 << 26)
    #define BIT_MASK_28      (1 << 27)
    #define BIT_MASK_29      (1 << 28)
    #define BIT_MASK_30      (1 << 29)
    #define BIT_MASK_31      (1 << 30)
    #define BIT_MASK_32      (1 << 31)
    



我们不需要一行一行的去写，只需要先写好第一行，如下：


    
    #define BIT_MASK_1      (1 << 0)



然后，我们回到Normal模式，在这一行上输入“Y31p"，拷贝此行，然后粘贴31次。这样，我们得到总共32行上面的内容。
现在使用"V31j"命令选中这32行，然后使用两次替换命令：


    
    
    :'<,'>s/BIT_MASK_zsd*ze/=line(".") - line("'<") + 1
    :'<,'>s/zsd*ze)$/=line(".")-line("'<")
    



这样，我们就得到了我们想要的结果。

这种方式还可以用于数组下标的自动增加，以及文本的章节自动编号等功能。只要你能够用正则表达式准确的定位出你想要自动编号的的数字，
那么就可以使用这种方法来自动编号。

上面，我们使用了两条VIM替换命令，下面详细剖析一下这两条命令。

以第一条命令为例，第二条命令和第一条命令类似：


    
    :'<,'>s/BIT_MASK_zsd*ze/=line(".") - line("'<") + 1



这条命令在我们选中的区域内进行替换，查找以“BIT_MASK_”开头，后面跟任意多个数字的字符串，并把匹配位置放在数字上，然后使用后面表达式计算出来的数字替换这些匹配的数字。

下面是这条命令中每个元素的含义：



> 
'<,'>        我们所选中的区域 (:help '<，:help '> )
s            在选中的区域中进行替换 (:help :s )
zs          指明匹配由此开始 (:help /zs )
d*          查找任意位数的数字 (:help /d )
ze          指明匹配到此为止 (:help /ze )
=           指明后面是一个表达式 (:help :s= )
line(".")    当前光标所在行的行号 (:help line() )
line("'<")   我们所选区域中第一行的行号 (:help line() )




“'<”和“'>”是我们使用了“v”，“V”命令选中一个visual区域后，VIM设置的标记，分别用来标识visual区域的开始和结束。

“BIT_MASK_zsd*ze”是一个正则表达式，用来查找以“BIT_MASK_”开头，后面跟任意多个数字的字符串。其中“zs”、“ze”用来指定匹配的开始和结束位置，因为我们只打算替换“BIT_MASK_0”中的数字，所以在查找时只把匹配区域置在数字上。

由于我们的替换操作要把不同行的数字替换成不同的值，所以在这里需要使用一个表达式来计算出替换后的值。当“:s”命令的替换字符串是以“=”开头时，表明使用一个表达式计算的结果进行替换。我们这里的表达式就是“line(".") - line("'<") + 1”，其中“line()”函数用来获得行号，它可以获得当前行的行号，以及指定的标记（mark）所在的行号。“line(“.”)”用来获得当前光标所在行的行号，“line(“’<”)”则用来获得“'<”标记所在行的行号。这两个行号的差加上1就是我们想替换的值。

上面，我们使用VIM的替换功能，实现高效的代码编写。本文将介绍另外一种方法，实现相同的功能。

我们先看例子：



> 
UniqueID2       = lview.focusedItem.subItems.opIndex(0).text;
Parent          = lview.focusedItem.subItems.opIndex(0).text;
Children        = lview.focusedItem.subItems.opIndex(0).text;
login           = lview.focusedItem.subItems.opIndex(1).text;
txtCust.text    = lview.focusedItem.subItems.opIndex(2).text;
txtProj.text    = lview.focusedItem.subItems.opIndex(3).text;
txtbDate.text   = lview.focusedItem.subItems.opIndex(4).text;
txtdDate.text   = lview.focusedItem.subItems.opIndex(5).text;
txteDate.text   = lview.focusedItem.subItems.opIndex(6).text;
txtPM.text      = lview.focusedItem.subItems.opIndex(7).text;
txtLang.text    = lview.focusedItem.subItems.opIndex(8).text;
txtVendor.text  = lview.focusedItem.subItems.opIndex(9).text;
txtInvoice.text = lview.focusedItem.subItems.opIndex(10).text;
txtPMFund.text  = lview.focusedItem.subItems.opIndex(11).text;
txtProjFund.text= lview.focusedItem.subItems.opIndex(12).text;
txtA_No.text    = lview.focusedItem.subItems.opIndex(13).text;
txtNotes.text   = lview.focusedItem.subItems.opIndex(14).text;
txtStatus.text  = lview.focusedItem.subItems.opIndex(15).text;






我们要把上面代码中括号中的数字，替换成由0开始的一个顺序递增序列，例如：



> 
UniqueID2       = lview.focusedItem.subItems.opIndex(0).text;
Parent          = lview.focusedItem.subItems.opIndex(1).text;
Children        = lview.focusedItem.subItems.opIndex(2).text;
……




实现以上需求，除了用前面介绍的方法外，还可以用下面的命令：


    
    :let n=0 | g/opIndex(zsd+/s//=n/|let n+=1



这条命令同上一篇介绍的命令类似，它也使用了VIM的替换功能和表达式，不同之处在于它并不需要事先选中替换区域，因为它没有使用”line()”函数来计算当前位置的偏移，而是直接使用变量来进行赋值。

下面简单讲解一下这条命令各个组成元素：



> 
let          为变量赋值 (:help let )
|            用来分隔不同的命令 (:help :bar )
g            在匹配后面模式的行中执行指定的ex命令 (:help :g )
zs          指明匹配由此开始 (:help /zs )
d+         查找1个或多个数字 (:help /d )
s            对匹配模式进行替换 (:help :s )
=           指明后面是一个表达式 (:help :s= )




所以，这条命令的执行过程为：



> 
1.    给变量n赋值为0；
2.    查找模式” opIndex(zsd+”，使用变量n的值替换匹配的模式字符串；
3.    给变量n加1；




需要说明一下”|”，它用来分隔不同的命令。

另外，在substitute命令中，如果省略匹配模式字符串，它会使用之前定义的匹配模式字符串，在本例中就是由”global”命令定义的”opIndex(zsd+”。

除了上面介绍的方法外，还有一个VIM插件专门实现数字、日期等的增、减，可以在下面的网址下载此插件：

http://vim.sourceforge.net/scripts/script.php?script_id=670 

http://mysite.verizon.net/astronaut/vim/index.html#VISINCR

