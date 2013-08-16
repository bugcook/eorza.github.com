---
layout: post
title: EMACS一些技巧
slug: some-emacs-tips
date: 2012-05-09 17:19:52 +0800
excerpt: 在perl中，如果你选中一段代码，然后align，emacs会把等号对齐，但是在php中不会这样，如果在php中你也想这样的话，那么你会用到。
categories:
- note
tags:
- emacs
---

在perl中，如果你选中一段代码，然后align，emacs会把等号对齐，但是在php中不会这样，如果在php中你也想这样的话，那么你会用到：

	M-x align-regexp RET = RET

举例，比如在一个比较长的数组中，如下，你会想把等号对其。

	$data = array(
	'filter_order_id'	=> $filter_order_id,
	'filter_box_code'		=> $filter_box_code,
	'filter_customer_id'		=> $filter_customer_id,
	'filter_email'=> $filter_email,
	'filter_shipping_name'			=> $filter_shipping_name,
	'filter_telephone'		=> $filter_telephone,
	'filter_shipping_address'		=> $filter_shipping_address,
	'filter_postcode'		=> $filter_postcode,
	'filter_payment_method'		=> $filter_payment_method,
	'filter_order_box_status_id'	=> $filter_order_box_status_id,
	'filter_date_added'	=> $filter_date_added,
	'sort'				=> $sort,
	'order'				=> $order
	);

当然align-regexp后面跟的是个正则表达式，如果你想让它以其他的方式对其，JUST DO IT！
