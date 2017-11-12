;; 配置国内的插件源 是自己的emacs更加的好看
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
(require 'init-packages)
(require 'init-default)
(require 'init-swiper)
(require 'init-web-mode)
(require 'init-func)
;;(require 'init-keybinds)
;;(require 'init-config)
;;(require 'init-php)
;; 关系上部的工具栏
(tool-bar-mode -1)
;; 关闭左边的滑动
(scroll-bar-mode -1)
;; 开启行数显示(全局)
(global-linum-mode 1)
;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)
;;关闭默认启动画面
(setq inhibit-splash-screen t)
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
;;开启({"'等匹配
(smartparens-global-mode t)

;; 删除多余空格插件
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)
;; 关闭自动保存
(setq auto-save-default nil)
;; 开启窗口插件
;;(require 'popwin)
;;(popwin-mode 1)
;; 关闭警告声音
(setq ring-bell-function 'ignore)

;; yes or no 缩写
(fset 'yes-or-no-p 'y-or-n-p)

;; 设置和配置文件和插件的管理 整理文件
;; 也可以把上面两句合起来
(require 'dired-x)
(global-set-key (kbd "s-/") 'hippie-expand)

(set-language-environment "UTF-8")
; 开启全局 Company 补全
(global-company-mode 1)

;; 这里设置语言文件打开时用对应的文件格式
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       '(("\\.php\\'" . php-mode))
       auto-mode-alist))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
