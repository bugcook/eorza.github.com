---
layout: post
title: cite,q与blockquote
slug: cite-q-blockquote
date: 2010-12-14 21:52:19 +0800
excerpt: 需要注意的是，q是用来定义一个短的引语，blockquote是用来定义一段引语，它们的范围和作用级别不同。q引用的是一句话或者一句文档摘要，而blockquote则是引用一段或者大篇幅。q可以只包含存文本，或者内联元素，但blockquote的子节点必须为块元素，而不能是文本或者内联元素，当然，孙子辈的就无所谓了，这点进行strict XHTML验证你就会知晓。
categories:
- note
tags:
- css
- html
more_categories:
- slug: note
  name: 学习笔记
more_tags:
- slug: css
  name: css
- slug: html
  name: html
---

cite,q与blockquote这三个标签都是用来表示引用的，但这三者之间确是有着比较明显的区别的。

cite是用来标明引言的，所谓引言，就是对一本书、一篇报告或其它出版的来源资料的引用。可使用该标签对参考文献的引用进行定义，比如书籍或杂志的标题。如：


	<cite>《傲慢与偏见》</cite>

q是什么呢，是用来分离文本中的引语，定义一个短的引用。如：

	<q>能一起吃顿饭么？</q>，那位帅气的先生带着期盼的眼神等她回复。

再说说blockquote，它是用来定义一段引语的。比如我们要引用某篇诗文或者文章片段，如：

	> 你站在桥上看风景，
	> 看风景人在楼上看你。
	> 明月装饰了你的窗子，
	> 你装饰了别人的梦。


需要注意的是，q是用来定义一个短的引语，blockquote是用来定义一段引语，它们的范围和作用级别不同。q引用的是一句话或者一句文档摘要，而blockquote则是引用一段或者大篇幅。q可以只包含存文本，或者内联元素，但blockquote的子节点必须为块元素，而不能是文本或者内联元素，当然，孙子辈的就无所谓了，这点进行strict XHTML验证你就会知晓。

有一点相同的就是q和blockquote都有一个重要而且相同的属性cite，“cite？这不是一个标签元素么？我们前面才说到啊。”是的，确实有一个<cite>标签，但同时也有一个cite属性，它是用来注明引用来源的URL。

如上面的blockquote的例子，我们就可以加上cite属性来表明该引用的来源：

	<blockquote cite=“http://www.doyoe.com/plwj/article.asp?fid=pop&id=54”...

至于如何区分cite标签和q,blockquote的作用，也可以举2个例子：

q与cite：

	<q>废那事干啥，直接上不就得了</q>，<cite>黑皮</cite>先生如是说。

blockquote与cite：

	> 最是那一低头的温柔，
	> 象一朵水莲花不胜凉风的娇羞，
	> 道一声珍重，道一声珍重，
	> 那一声珍重里有蜜甜的忧愁——
	> 沙扬娜拉！
	<cite>——摘自<cite>《志摩的诗》</cite>

cite,q,blockquote三者虽然都有引用的作用，但却各司其职，互不干涉。
