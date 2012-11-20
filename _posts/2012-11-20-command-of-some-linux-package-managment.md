---
layout: post
title: Linux各主要发行版的包管理命令对照
categories:
- note
tags:
- linux

---

Debian和Gentoo是本人目前使用的2个发行版，所以在这里整理一下两者的包管理命令。Debian使用的是apt和dpkg，Gentoo则用的是emerge。Redhat的yum、Suse的zypper、Arch的pacman、Slackware的slackpkg，这些虽然没用过，不过也顺便放在这里吧。

更新源：

	# emerge --sync
	# yum check-update
	# zypper refresh
	# pacman -Sy
	# slackpkg update

搜索包：

	# apt-cache search
	# emerge --search
	# yum search
	# zypper search
	# pacman -Qs
	# slackpkg search

查看包的详细信息：

	# apt-cache show
	# emerge -udpv
	# yum info
	# zypper info
	# pacman -Qi
	# --

显示依赖关系：

	# apt-cache depends
	# emerge --emptytree --pretend
	# yum deplist
	# --
	# --
	# --

安装包：

	# apt-get install
	# emerge
	# yum install
	# zypper install
	# pacman -S
	# slackpkg install

删除包：

	# apt-get remove
	# emerge --unmerge
	# yum erase
	# zypper remove
	# pacman -R
	# slackpkg remove

显示可用更新：

	# apt-get upgrade -> n
	# --
	# yum list updates
	# zypper list-updates
	# --
	# --

更新全部已安装的包：

	# apt-get upgrade
	# emerge -Nua world
	# yum update
	# zypper update
	# pacman -Su
	# slackpkg update-all

更新整个系统：

	# apt-get dist-upgrade
	# emerge -NuDa world
	# yum upgrade
	# zypper dup
	# --
	# --

列出已安装的包：

	# dpkg -l
	# equery l （需要安装gentoolkit）
	# rpm -qa
	# rpm -qa
	# pacman -Qii
	# ls /var/log/packages/

删除缓存中的旧包：

	# apt-get clean
	# rm -r /usr/portage/distfiles
	# yum clean
	# --
	# --
	# --

删除不需要的依赖关系：

	# apt-get autoremove
	# emerge --depclean
	# --
	# --
	# --
	# --
