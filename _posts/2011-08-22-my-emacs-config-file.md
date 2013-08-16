---
layout: post
title: 我的emacs配置文件
slug: my-emacs-config-file
date: 2011-08-22 19:49:21 +0800
excerpt: 马上就回去了，趁着这段时间把我昨天的emacs的配置文件保存一下，以备以后使用。嗯，昨天研究了一天，发现vim真的时候追求速度的人用，有的人说emacs块，那是你没有用熟，vim才叫运指如飞，emacs只能叫一般，但是emacs的强大之处是他的稳重，是他的lisp，是他的严谨，是他的我也不知道的东西，反正我是决定放弃用vim，因为vim我的指头已经超过大脑的运转了，我只想留点时间思考，从我的指头中间。
categories:
- note
tags:
- emacs
---

马上就回去了，趁着这段时间把我昨天的emacs的配置文件保存一下，以备以后使用。嗯，昨天研究了一天，发现vim真的时候追求速度的人用，有的人说emacs块，那是你没有用熟，vim才叫运指如飞，emacs只能叫一般，但是emacs的强大之处是他的稳重，是他的lisp，是他的严谨，是他的我也不知道的东西，反正我是决定放弃用vim，因为vim我的指头已经超过大脑的运转了，我只想留点时间思考，从我的指头中间。

	;=======================================================================
	;; Remove toolbar
	(tool-bar-mode nil)
	;; Remove menu
	;;(menu-bar-mode nil)
	;; Remove scrollbar
	(scroll-bar-mode nil)
	;; Ground color
	(set-foreground-color "grey")
	(set-background-color "black")
	;; Model line
	(set-face-attribute 'mode-line nil :box "#333" :background "#333" :foreground "#ccc" :height 80)
	(set-face-attribute 'mode-line-inactive nil :box "#333" :background "#333" :foreground "#555" :height 80)
	(set-face-attribute 'mode-line-highlight nil :box "#aaa" :background "#aaa")
	(set-face-attribute 'buffer-menu-buffer nil :weight 'normal)
	(set-face-attribute 'completions-common-part nil :background "#111")
	(set-face-attribute 'completions-first-difference nil :background "#222" :weight 'normal)
	(set-face-attribute 'header-line nil :background "#0a0a0a")
	;; Font lock
	;;(global-font-lock-mode 0)
	;; Vertical border
	(set-face-attribute 'vertical-border nil :foreground "#333")
	;; Disable fringes
	(fringe-mode 0)
	;; Enable line numbers
	(global-linum-mode 1)
	;;(setq linum-format 'dynamic )
	(setq linum-format "%4d  ")
	(set-face-background 'linum "black")
	(set-face-foreground 'linum "#333")
	;; Colomn number
	(column-number-mode 1)
	;; Cursor color
	(set-face-background 'cursor "#999")
	;; Startup window size and position
	(setq default-frame-alist '((height . 50) (width . 150) ))
	;; Highlight curren line
	(global-hl-line-mode 1)
	(set-face-attribute hl-line-face nil :background "#050505")
	;; Link Face
	(set-face-background 'link "red")
	;; Set indent size
	(setq standard-indent 2)
	(setq default-tab-width 2)
	;; Set region color
	(set-face-background 'region "#222")
	;; Set frame title
	(setq frame-title-format "%f")
	;; Set tab to space
	(setq-default indent-tabs-mode nil)
	;; Backup files to one directory
	(setq backup-directory-alist (quote (("." . ".emacs.d/backups"))))
	(setq version-control t)
	(setq kept-old-versions 2)
	(setq kept-new-versions 5)
	(setq delete-old-versions t)
	(setq backup-directory-alist '(("." . ".emacs.d/backups")))
	(setq backup-by-copying t)
	;; Default directory
	;;(setq default-directory "~/Works/rubyonrails/mystore")
	;;=======================================================================
	(defun dbl-mark-one-line ()
	(interactive)
	(move-beginning-of-line nil)
	(set-mark-command nil)
	(next-line nil)
	)
	(global-set-key (kbd "M-@") 'dbl-mark-one-line)
	(defun dbl-insert-one-line-above ()
	(interactive)
	(move-beginning-of-line nil)
	(newline nil)
	(previous-line nil)
	)
	(global-set-key (kbd "C-S-o") 'dbl-insert-one-line-above)
	(defun dbl-insert-one-line-below ()
	(interactive)
	(move-end-of-line nil)
	(newline nil)
	)
	(global-set-key (kbd "C-o") 'dbl-insert-one-line-below)
	;;=======================================================================
	;; Cedet
	;;(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")
	;;(global-ede-mode 1)
	;;(semantic-load-enable-minimum-features)
	;;(semantic-load-enable-code-helpers)
	;; Auto complete
	(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
	(require 'auto-complete-config)
	(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/ac-dict")
	(ac-config-default)
	(ac-set-trigger-key "M-n")
	(setq ac-auto-start nil)
	(set-face-background 'ac-selection-face "#444")
	(set-face-background 'ac-candidate-face "#222")
	;;=======================================================================
	(custom-set-variables
	;; custom-set-variables was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
	'(inhibit-startup-screen t)
	'(speedbar-use-tool-tips-flag t)
	'(truncate-lines t))
	(custom-set-faces
	;; custom-set-faces was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
	)

	;;; This was installed by package-install.el.
	;;; This provides support for the package system and
	;;; interfacing with ELPA, the package archive.
	;;; Move this code earlier if you want to reference
	;;; packages in your .emacs.
	(when
	(load
	(expand-file-name "~/.emacs.d/elpa/package.el"))
	(package-initialize))

后面是在windows下面的东西，在文件和文件夹的右键中增加Edit with Emacs,十分方便哦。

	Windows Registry Editor Version 5.00
	[HKEY_CLASSES_ROOT\*\shell]
	[HKEY_CLASSES_ROOT\*\shell\openwemacs]
	@="&Edit with Emacs"
	[HKEY_CLASSES_ROOT\*\shell\openwemacs\command]
	@="D:\\Emacs\\bin\\runemacs.exe \"%1\""
	[HKEY_CLASSES_ROOT\Directory\shell\openwemacs]
	@="Edit &with Emacs"
	[HKEY_CLASSES_ROOT\Directory\shell\openwemacs\command]
	@="D:\\Emacs\\bin\\runemacs.exe \"%1\""

