---
comments: true
date: 2011-10-26 01:50:23
layout: post
slug: form-element-align
title: form元素对齐
wordpress_id: 2945
categories:
- note
tags:
- html
---

html中的表单元素大概用的最多的就是按钮、输入框和下拉菜单了，而这三个元素往往不是那么完美的对齐，我指的是横向的对齐，而且我说的完美的对齐，就是说你放大100倍之后你用标尺量一下，他们仍然是对齐的。

其实最大的难点是浏览器兼容的问题。因为火狐和IE8好像是不吃line-height这一套的，所以即使你在chrome下完美对齐了，那么在火狐和IE8下面会出现1像素的偏差，通常是火狐和IE8的按钮会矮上那么一个像素，原因就不说了，直接说解决方法。

本人觉得这不是在搞学问，所以就没有严格测试，而且这里用的雅黑的12号字体，所以如果是宋体的话可能会不实用。还有一点就是我这里的的元素高度是20来像素高吧，如果你想更高一点，那么你可以等差增加（注意不是等比）。


    
    
    input, select, button {
      font-family: "Microsoft YaHei";
      font-size: 12px;
      border: 1px solid #555;
    }
    



为了方便查看，我分别显示，首先是输入框，然后是按钮，最后是输入框。




    
    
    input[type="text"],
    input[type="password"],
    input[type="search"] {
      padding-top: 2px;
      padding-bottom: 2px;
    }
    




    
    
    input[type="submit"],
    input[type="reset"],
    input[type="button"] {
      padding-top: 1px;
      padding-bottom: 1px;
      line-height: 19px;
    }
    button {
      line-height: 19px;
    }
    




    
    
    select {
      padding: 1px;
      height: 23px;
    }
    



说到这里，我自己都开始有点糊涂了，那么就直接写个全的吧。


    
    
    
    <html>
      <head>
        <meta charset="UTF-8"></meta>
        <title>Dobila | 我会沿着电车的铁轨走回来的</title>
        <link href="http://dobila.info" rel="index" title="Dobila"></link>
        <style type="text/css">
          * {
            font-family: "Microsoft YaHei";
            font-size: 12px;
          }
          input, select, button {
            font-family: "Microsoft YaHei";
            font-size: 12px;
            border: 1px solid #aaa;
            outline: none;
          }
    
          input[type="text"],
          input[type="password"],
          input[type="search"] {
            padding-top: 2px;
            padding-bottom: 2px;
          }
    
          input[type="submit"],
          input[type="reset"],
          input[type="button"]  {
            padding-top: 1px;
            padding-bottom: 1px;
            line-height: 19px;
          }
          button {
            line-height: 19px;
          }
    
          select {
            padding: 1px;
            height: 23px;
          }
    
        </style>
      </head>
      <body>
        账号：
        <input type="text"></input>
        选择：
        <select>
          <option>你好吗</option>
          <option>dobila.info</option>
          <option>黄璜</option>
        </select>
        <input type="submit" value="确定"></input>
        <button>哈哈</button>
      </body>
    </html>
    
