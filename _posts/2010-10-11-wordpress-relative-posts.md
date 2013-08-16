---
layout: post
title: wordpress相关文章
slug: wordpress-relative-posts
date: 2010-10-11 21:04:21 +0800
excerpt: 插件大家到网上一搜一大堆，其实非插件实现的也是一大堆，这里之所以写这个，是因为自己用的时候，我喜欢把随机文章放到相关文章的上面（个人爱好），网上的代码用的query_post，这样很容易的就扰乱了原来的loop，使post->ID得不到当前文章的值。
categories:
- note
tags:
- wordpress
- computer
---

当然，这里说的是非插件实现，插件大家到网上一搜一大堆，其实非插件实现的也是一大堆，这里之所以写这个，是因为自己用的时候，我喜欢把随机文章放到相关文章的上面（个人爱好），网上的代码用的query_post，这样很容易的就扰乱了原来的loop，使post->ID得不到当前文章的值。

wordpress中获取文章有大概四种方法：query_posts，WP_Query，get_posts，get_results。后来我用了WP_Query，也扰乱了post->ID，于是我用了get_posts，搞不清楚。于是选择了最后一种方法。


获取随机文章的代码如下：

	<li id="dobila-random" class="widget-container">
	<h3 class="widget-title">Random Posts</h3>
	<ul>
	<?php $randomPosts = $wpdb->get_results("SELECT ID, post_title FROM $wpdb->posts WHERE ID != $post->ID AND post_status = 'publish' AND post_type = 'post' ORDER BY rand() LIMIT 10");
	foreach($randomPosts as $randomPost) { ?>
	<li>ID) ?>" title="<?php echo $randomPost->post_title; ?>"><?php echo $randomPost->post_title; ?></li>
	<?php } ?>
	</ul>
	</li>

获取相关文章的代码如下：

	<li id="dobila-relative" class="widget-container">
	<h3 class="widget-title">Relative Posts</h3>
	<ul>
	<?php $tags = wp_get_post_tags($post->ID);
	foreach ($tags as $tagg) {
	$tags_id[] = $tagg->term_id;
	};
	if ($tags) {
	$args=array(
	'tag__in' => $tags_id,
	'post__not_in' => array($post->ID),
	'showposts'=>10,
	'caller_get_posts'=>1
	);
	$my_query = new WP_Query($args);
	if( $my_query->have_posts() ) { while ($my_query->have_posts()) : $my_query->the_post(); ?>
	<li>" title="<?php the_title_attribute(); ?>"><?php the_title(); ?></li>
	<?php endwhile; } } ?>
	</ul>
	</li>


