---
comments: true
date: 2010-10-25 13:19:39
layout: post
slug: linux-command-of-user-and-usergroup
title: linux用户和用户组命令
wordpress_id: 1663
categories:
- uncategorized
tags:
- linux
- ubuntu
---

主要讲述在Linux 系统中用户(user)和用户组(group)管理相应的概念；用户(user)和用户组(group)相关命令的列举；其中也对单用户多任务，多用户多任务也做以解说。



**1、建用户**



> 
adduser phpq                             //新建phpq用户
passwd phpq                               //给phpq用户设置密码




**2、建工作组**



> 
groupadd test                          //新建test工作组




**3、新建用户同时增加工作组**




> 
useradd -g test phpq                      //新建phpq用户并增加到test工作组




注：：-g 所属组 -d 家目录 -s 所用的SHELL

**4、给已有的用户增加工作组**



> 
usermod -G groupname username
或者：gpasswd -a user group





**5、临时关闭：**

在/etc/shadow文件中属于该用户的行的第二个字段（密码）前面加上*就可以了。想恢复该用户，去掉*即可。

或者使用如下命令关闭用户账号：



> 
passwd peter –l
重新释放：
passwd peter –u




**6、永久性删除用户账号**



> 
userdel peter
groupdel peter
usermod –G peter peter   （强制删除该用户的主目录和主目录下的所有文件和子目录）




**7、从组中删除用户**

编辑/etc/group 找到GROUP1那一行，删除 A，或者用命令



> 
gpasswd -d A GROUP




**8、显示用户信息**



> 
id user
cat /etc/passwd






