;; php-mode config

(eval-after-load 'php-mode
  '(require 'php-ext))

(require 'php-mode)
  (add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php))
               (yas-global-mode 1)
               (ac-php-core-eldoc-setup ) ;; enable eldoc
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
               ))

;; 设置使用那些minor mode
(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (company-mode t)
             (ac-php-core-eldoc-setup) ;; enable eldoc
             (make-local-variable 'company-backends)
             (add-to-list 'company-backends 'company-ac-php-backend)))

;;(require 'php-auto-yasnippets)
;;(setq php-auto-yasnippet-php-program "~/path/to/Create-PHP-YASnippet.php")

;;(payas/ac-setup)
;; use conposer
;;(php-mode . ((php-auto-yasnippet-required-files (list "~/project/vendor/autoload.php"))))

(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;; ggtags
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(provide 'init-php)
