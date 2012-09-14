---
comments: true
date: 2011-04-25 16:17:44
layout: post
slug: login-lfs-with-ssh
title: SSH登录LFS
wordpress_id: 2245
categories:
- note
tags:
- lfs
- linux
---

LFS，又一次搞了起来，因为gnome3前两天发布了，因为对C/C++突然感兴趣了，还有很多其他原因，下面的是在虚拟机上的第一步，LFS书上没写这个，所有就记录下来。



**一、更改root**

用LiveCD 这个的，和后面的chroot后的不是同一个的登陆密码，方便切换多个终端来干活，不更改好像无法登陆第二个以上。


    
    LiveCD root # passwd



**二、配置网卡**

如果你的VM建的时候就是按默认选项的，那么你的宿主机怎么配网，VM也怎么配就OK了。


    
    # net-setup eth0



然后选 2 依次输入IP地址，掩码，网关，DNS等等。如果你的网关用DHCP 那就选 1 
测试一下网路是否可以用了


    
    # ping dobila.info



如果可以得到解析的IP，不用等了，那就是OK了，直接^C 结束了继续后边的事呢。

其实在VM里装系统是个很累的工作，所以，我用 SSH Secure Shell 来登录VM里的Linux 然后进行下面的安装。因此我们得要把sshd给启动起来，这样，如果你有固定internet IP 的话，你甚至可以在任何可以连接到你的机器继续安装系统。


    
    # /etc/rc.d/init.d/sshd start 



下面将在putty 登陆了！在登录之前，如果发现像我这样的完美控的人，会发现提示行是那么的不完美，所有就要看http://dobila.info/entry/note/linux-shell-prompt.html来修改提示行了。根据这篇文章，我修改的结果是直接修改/etc/bashrc。


    
    
    alias ls='ls --color=auto'
    alias ll='ls -l'
    eval $(dircolors -b /etc/dircolors)
    
    # Setup a red prompt for root and a green one for users. 
    NORMAL="[e[0m]"
    RED="[e[1;31m]"
    GREEN="[e[1;32m]"
    if [[ $EUID == 0 ]] ; then
            # PS1="$REDu [ $NORMALw$RED ] # $NORMAL"
            PS1="$REDu:$NORMALw$RED # $NORMAL"
    else
            PS1="$GREENu [ $NORMALw$GREEN ]$ $NORMAL"
    fi
    
    if [ "`locale charmap 2>/dev/null`" = "UTF-8" ]
    then
            stty iutf8
    fi
    



**2011年5月3日更新：制作好工具链后重启需要的工作：**



> 1.重新启动计算机，并从LiveCD启动
2.加载分区
export LFS=/mnt/lfs
mkdir -pv $LFS
mount /dev/hda2 $LFS
3.加载交换分区（如果不想用交换分区或者没有交换分区可跳过此步骤）
swapon /dev/hda1

相关知识点：
这时候已经制作好了工具链，因此可以不需要建立根目录下的tools链接了。




**2011年5月3日更新：利用主系统加载几个重要的文件系统，请注意这个步骤对于后面的工作极其重要。**



> mount -v --bind /dev $LFS/dev





> 
mount -vt devpts devpts $LFS/dev/pts
mount -vt tmpfs shm $LFS/dev/shm
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys






> 
chroot "$LFS" /tools/bin/env -i 
    HOME=/root TERM="$TERM" PS1='u:w$ ' 
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin 
    /tools/bin/bash --login +h





