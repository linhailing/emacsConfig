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
		;;auto-complete
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		;;popwin
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		web-mode
		emmet-mode
		;;yasnippet
		;;php-mode
		;;ac-php
		;;company-php
		;;php-auto-yasnippets
		;;auto-complete
		;;phpctags
		;;flycheck
		;;flymake-php
		;;ggtags
		;;php-eldoc
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

;; 文件末尾
(provide 'init-packages)
