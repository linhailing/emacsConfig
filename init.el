;; 配置国内的插件源 是自己的emacs更加的好看
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
;; cl - Common Lisp Extension
(require 'cl)
;; Add Packages
(defvar henry/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")

(setq package-selected-packages henry/packages)

(defun my/packages-installed-p ()
     (loop for pkg in henry/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg henry/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; 关系上部的工具栏
(tool-bar-mode -1)
;; 关闭左边的滑动
(scroll-bar-mode -1)
;; 开启行数显示(全局)
(global-linum-mode 1)
;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)
;; setting font size Monaco/Source Code Pro
(set-default-font "Monaco")
(set-face-attribute 'default nil :height 120)
;; 关闭自动生成备份文件
(setq make-backup-files nil)
;; 这里开始我们hocking
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
;; 配置快捷键来查找最近打开过的文件
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
;; 删除整个文字 
(delete-selection-mode 1)
;; 开启全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;开启光标行高亮
(global-hl-line-mode 1)
;; 开启theme
(load-theme 'monokai 1)
;; 开启括号的匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 这里设置语言文件打开时用对应的文件格式
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
