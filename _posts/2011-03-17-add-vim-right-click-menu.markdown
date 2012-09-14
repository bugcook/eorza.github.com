---
comments: true
date: 2011-03-17 21:12:53
layout: post
slug: add-vim-right-click-menu
title: Vim添加右键菜单
wordpress_id: 2052
categories:
- note
tags:
- vim
---

1、添加edit with vim选项，每个文件打开一个新窗口。新建reg文件，代码如下：


    
    Windows Registry Editor Version 5.00
    
    [HKEY_CLASSES_ROOT*Shelledit with vim]
    @="edit with vim"
    
    [HKEY_CLASSES_ROOT*Shelledit with vimcommand]
    @=""D:\Program Files\Vim\vim71\gvim.exe" "%1""





2、添加vim tabnew选项，每个文件打开一个新标签页。新建reg文件，代码如下：


    
    Windows Registry Editor Version 5.00
    
    [HKEY_CLASSES_ROOT*Shellvim tabnew]
    @="vim tabnew"
    
    [HKEY_CLASSES_ROOT*Shellvim tabnewcommand]
    @=""D:\Program Files\Vim\vim71\gvim.exe" -p --remote-tab-silent "%1" "%*""



3、添加vim hex选项，用以十六进制打开文件。新建reg文件，代码如下：


    
    Windows Registry Editor Version 5.00
    
    [HKEY_CLASSES_ROOT*Shellvim hex]
    @="vim hex"
    
    [HKEY_CLASSES_ROOT*Shellvim hexcommand]
    @=""D:\Program Files\Vim\vim71\gvim.exe" -b "%1""



这里还要在vimrc配置文件中加入一下内容：


    
    augroup Binary
      au!
      au BufReadPost *.* if &bin; | %!xxd
      au BufReadPost *.* set ft=xxd | endif
    augroup END



