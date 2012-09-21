---
layout: post
title: dedecms自动模型联动搜索
slug: dedecms-search
date: 2010-09-29 21:20:33 +0800
excerpt: 大家都知道，好像联动搜索只能是独立模型里面的。搞了一会儿我就打算直接用搜索功能的，但是想了一会儿，还是要相信自己能弄出来的。
categories:
- note
tags:
- dedecms
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: dedecms
  name: dedecms
---

今天看了一中午的dedecms，改了一个小东西，就是dedecms自动模型的联动搜索。

大家都知道，好像联动搜索只能是独立模型里面的。搞了一会儿我就打算直接用搜索功能的，但是想了一会儿，还是要相信自己能弄出来的。


闲话不多说，Let's go！！这里我们选择nativeplace举例，而且这里的nativeplace我只保留的省份（嘿嘿，工作需要）。

当然是打开list.php了（如果你不知道这个，好吧，我告诉你，联动搜索是用这个文件的，位置是plus/list.php），大家可以看到有一个if判断结构

	if($tinfos['issystem']==-1){
		//others;
		include(DEDEINC."/arc.sglistview.class.php");
		$lv = new SgListView($tid,$cArr);
	}
	else {
		include(DEDEINC."/arc.listview.class.php");
		$lv = new ListView($tid);
		//others
	}

这里的issystem就是判断你的模型是不是独立模型，如果值为-1就是独立模型了，因为我们是自动模型，所有就在else包含的语句中搞搞了。

可以看到SgListView类中多了一个$cArr参数，这里就是传递的nativeplace等参数，所以我也给我们的listview加上参数

然后else包含的语句变为

	include(DEDEINC."/arc.listview.class.php");
	$nativeplace = ( (empty($nativeplace) || !is_numeric($nativeplace)) ? 0 : $nativeplace );
	$cArr['nativeplace'] = $nativeplace;
	$lv = new ListView($tid,1,$cArr);

当然了，我们传了一个$cArr给构造函数，当然构造函数要想办法接收了。所以我们打开位于include/arc.listview.class.php的文件，然后修改此类的构造函数为（原来的构造函数什么样子自己看）：

	function __construct($typeid,$uppage=1,$searchArr=array()) {
		//在$this->TotalResult = is_numeric($this->TotalResult)? $this->TotalResult : "";下面加入下面一行
		$this->searchArr = $searchArr;
	}

然后这里出现了一个$this->searchArr，所以，我们要给类加一个属性：var $searchArr;（别跟我说你不知道加哪）。

现在我们已经传过来nativeplace了，即`$this->searchArr['nativeplace']`，然后我们给查询语句加一个判断就大功搞成了。

在大概650行左右有`if(ereg('hot|click|lastpost',$orderby))`这么一句话，在上面加上：

	if(!empty($this->searchArr['nativeplace']))
	{
		$temp = $this->searchArr['nativeplace'];
		$dobila = "$addtable.nativeplace = $temp and";
	}
	else {
		$dobila = "";
	}

通过这几句，我们增加了一个判断条件$dobila，具体我就不说明了。

讲$dobila加入到查询字符串就OK了，位置在，饿，不好说，这样吧，在if(ereg('hot|click|lastpost',$orderby))这个条件判断语句中，我把整段代码复制过来，大家看看在哪就ok了。

	if(ereg('hot|click|lastpost',$orderby)) { //如果不用默认的sortrank或id排序，使用联合查询（数据量大时非常缓慢）
		$query = "Select arc.*,tp.typedir,tp.typename,tp.isdefault,tp.defaultname,
		tp.namerule,tp.namerule2,tp.ispart,tp.moresite,tp.siteurl,tp.sitepath
		$addField
		from `#@__archives` arc
		left join `#@__arctype` tp on arc.typeid=tp.id
		$addJoin
		where $dobila {$this->addSql} $ordersql limit $limitstart,$row";
	} else { //普通情况先从arctiny表查出ID，然后按ID查询（速度非常快）
		$t1 = ExecTime();
		$ids = array();
		$query = "Select id From `#@__arctiny` arc where {$this->addSql} $ordersql limit $limitstart,$row ";
		$this->dsql->SetQuery($query);
		$this->dsql->Execute();
		while($arr=$this->dsql->GetArray())
			{
				$ids[] = $arr['id'];
			}
		$idstr = join(',',$ids);
		if($idstr=='')
			{
				return '';
			}
		else
			{
				$query = "Select arc.*,tp.typedir,tp.typename,tp.corank,tp.isdefault,tp.defaultname,
		tp.namerule,tp.namerule2,tp.ispart,tp.moresite,tp.siteurl,tp.sitepath
		$addField
		from `#@__archives` arc left join `#@__arctype` tp on arc.typeid=tp.id
		$addJoin
		where $dobila arc.id in($idstr) $ordersql ";
			}
		$t2 = ExecTime();
		//echo $t2-$t1;
	}

对了，本来想上网查这个东东来，结果看到几个付费的，擦，哥自己弄，不用你们，然后我就写了一个免费的给大家看，如果大家觉得不懂，想问的话，加我QQ或者发邮件：jrrhss@gmail.com。

