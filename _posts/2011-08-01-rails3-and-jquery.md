---
layout: post
title: rails3和jquery
slug: rails3-and-jquery
date: 2011-08-01 10:30:48 +0800
excerpt: 话说rails3.1中默认的js库已经是jquery了，这让我显得很高兴，因为我对jquery是比较熟悉的。原来看了一段时间prototype，发现这个库太大了，可能prototype比较稳定吧，不知道，反正个人感觉挺好的。
categories:
- note
tags:
- jquery
- rails
---

话说rails3.1中默认的js库已经是jquery了，这让我显得很高兴，因为我对jquery是比较熟悉的。原来看了一段时间prototype，发现这个库太大了，可能prototype比较稳定吧，不知道，反正个人感觉挺好的。

首先建立一个新项目，实际上有没有-J都无所谓

	rails new helloworld -J

然后，在项目的Gemfile中添加，

	gem 'jquery-rails'
运行

	bundle install

再运行

	rails generate jquery:install

当然如果你想用jquery-ui的话，你可以。

	rails generate jquery:install --ui
