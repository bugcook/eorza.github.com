---
comments: true
date: 2011-09-01 03:09:10
layout: post
slug: chinese-rvm-tutorial
title: RVM中文指南
wordpress_id: 2849
categories:
- material
tags:
- ruby
- rvm
---

rvm还是不错的，当然是开发环境，如果你的服务器需要经常更换ruby版本的话，你真是太可怜了，哈哈。

Ruby Version Manager，Ruby版本管理器，包括Ruby的版本管理和Gem库管理(gemset)。目前支持Ruby的大多数版本，有 1.8.7，1.9.1，1.9.2和Ruby Enterprise Editon，通过RVM可以很方便的在多个Ruby版本中快速切换。RVM同时也支持JRuby。

设想当前工作在Ruby 1.9.2 + Rails 3.0下，想体验最新的Rails 开发版，怎么办？Gemset就是为解决这个问题而设计的，它可 以为每个Ruby版本生成多个gemsets，各个gemset相互独立，这意味着你可以很方便的切换到某个gemset下去体验一个未正式发布的gem 版本，而不会破杯当前的工作环境，完毕后，再切回到工作的gemset下即可。

大多的IDE也都很好的支持了RVM方面，可以自动识别RVM管理的Ruby版本和GemSet，方便你切换Ruby的解析环境。



**RVM的安装与配置**


    
    
    $ bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
    


使用下面命令对RVM自己进行升级


    
    
    $ rvm update
    



**RVM 信息**

通过以下几个命令查看当前RVM当前信息


    
    
    $ rvm info
    $ rvm info 1.9.2
    



**Ruby的安装使用与管理**

用这个命令查看有哪些RVM可用的Ruby版本


    
    
    $ rvm list known
    $ rvm install 1.9.2    # 安装 ruby-1.9.2
    $ rvm install ree   # install Ruby Enterprise Edition (REE)
    


 
安装多个版本的Ruby之后，RVM可以很方便的进行切换。使用下条命令可以设置某一版本为当前使用版本。


    
    
    $ rvm  ruby-1.8.7-p160 #切换1.8.7-p160为当前使用版本
    $ rvm 1.8.7-p160    #同上面命令一样rvm ruby-1.8.7-p160
    $ ruby -v #查看当前Ruby版本
    



**查看当前Ruby的安装位置**


    
    
    $ which ruby
    



**设置默认使用版本**

将某一个版本的ruby设为默认，这样避免每次启动新的Shell都要选择所要使用的Ruby版本。


    
    
    $ rvm --default use 1.9.2   #设置1.9.2为默认版本
    $ rvm default      #通过default可以快速回到默认版本
    $ rvm list default     #查看当前版本设置信息
    $ rvm reset     #恢复系统默认设置 
    



**查看已安装的Ruby信息**

列出所有已经安装的Ruby的版本信息


    
    
    $ rvm list      #列出已安装的Ruby版本
    $ rvm list rubies     #同上
    $ rvm list default    #显示默认Ruby版本信息
    $ rvm list known     #列出RVM所支持的所有Ruby版本的信息
    



**创建别名**

使用带版本号的ruby时，每次切换时都要输入很长的版本号，非常的不方便，通过使用别名功能，可以创建很简短的别名来代替长长的ruby信息。


    
    
    $ rvm alias create reed ree-1.8.7-p2010.01    #为ree-187的Ruby版本创建一个别名叫：reed
    $ rvm use reed  #通过别名迅速切换
    $ rvm alias delete reed   #删除别名
    $ rvm alias list # 查看所有的别名
    



**删除已安装版本**


    
    
    $ rvm remove ruby-1.9.2-p0
    $ rvm uninstall ruby-1.9.2-p0
    



**管理 Gemsets**

一个gemset就是一个目录，是某一个Ruby版本的Gem使用集，通过环境变量配置，使该gemset下的gem命令导入到Shell。

一个Ruby版本初装时就默认给了一个同名的gemset，也就是说rvm ruyb-1.9.2-p0 命令在执行时，就是使用该环境变量。

**创建**

基于指定Ruby版本创建一个新的Gemset


    
    
    $ rvm 1.9.2  #？？？
    $ rvm gemset create rails3  #创建一个名为rails3的gemset
    


 
**使用**

指定某一个gemset作为当前环境使用。


    
    
    $ rvm 1.9.2  #？？？
    $ rvm gemset use rails3   #在当前Ruby下使用rails3这个gemset
    $ rvm use ruby-1.9.2-p0@rails3 #或者直接使用这种命名，直接指定ruby和gemset的信息。
    $ rvm use ruby-1.9.2-p0@rails3 --default   #设置默认
    


 
**查看Gemsets信息**


    
    
    $ rvm default  #选择使用ruby版本
    



列出当前Ruby版本下所有gemsets的信息


    
    
    $ rvm gemset list
    



列出所有Ruby版本下所有gemsets的信息


    
    
    $ rvm gemset list_all
    



显示当前所使用的gemset信息


    
    
    $ rvm gemset name     #当前gemset的名称
    



rails3


    
    
    $ rvm gemdir   #所在位置
    ~/.rvm/gems/ruby-1.9.2-p0@rails3
    



**删除**

删除一个gemset，默认有确认操作，使用 --force 可跳过该步骤。


    
    
    $ rvm gemset delete rails3  #会让确认一次
    $ rvm --force gemset delete rails3     #直接删除，没有确定步骤
    



**清空**

可以清空一个Gemset，删除其中的所有的gems包


    
    
    $ rvm gemset empty rails3
    $ rvm --force gemset empty rails3   #直接删除，没有确定步骤
    


 
**导出**

将当前gemsets内的信息导出到一个 name.gems文件，gems文件内定义gem的名称，版本号和其信赖关系。


    
    
    $ rvm gemset export rails3.gems
    



**导入**

将gems文件所指定的gems安装到当前gemset下。


    
    
    $ rvm gemset rails 3
    $ rvm gemset import rails3 
    


 
**复制**

可以将一个gemset内的所有gems包都复制到另一个gemset，很快速的复制一个当前环境。


    
    
    $ rvm gemset copy 1.8.7@rails3 1.9.2-head@rails3
    



**全局 gemsets （global gemsets）**

每一个ruby版本都默认创建一个全局的gemset，以ruby_version@global命名，这样基于该ruby版本下所有的gemsets都会包含全局gemset里的gem包。可以起到统一约定的作用，也避免重复创建。

默认安装的global gemset内仅有一个gem包：rake
