---
comments: true
date: 2010-08-29 12:05:01
layout: post
slug: dedecms-im-thumb
title: dedecms独立模型缩略图
wordpress_id: 497
categories:
- note
tags:
- dedecms
---

要对自己有信心

前连天要套一个dedecms的模板，自己定义了一个独立模型，然后想提取缩略图的url，结果死活弄不出来，上google，baidu弄了一上午，没有个合适的答案，有的是直接在模板里用sql调用，有的是在说在独立模型增加一个litpic字段（我靠，原来有一个litpic字段了，你增加个毛啊）。



下午的时候我恼怒了，我会php，为什么不自己找原因呢？于是我就找啊找啊，找到了include/arc.sglistview.class.php这个文件，在620行左右，有个查询字符串：


    
    $query = "Select tp.typedir,tp.typename,tp.isdefault,tp.defaultname,tp.namerule,tp.namerule2,tp.ispart,tp.moresite,tp.siteurl,tp.sitepath,arc.aid,arc.aid as id,arc.typeid,$addField	from `{$this-gt;AddTable}` arc left join `#@__arctype` tp on arc.typeid=tp.id where arc.aid in($idstr) and arc.arcrank >-1 $ordersql ";




很明显，我们的litpic在我们自定义的独立表$this->AddTable中，里面有aid、id等东西，这里我没看到litpic这个啊，后面好像是还有个$addField这个变量，研究了一下，这个是我们定义独立模型的时候自定义字段，里面也没有litpic这个系统定义的字段。

现在问题就简单了，在arc.typeid后面加个arc.litpic就可以了，模板就可以提取了。
