;; 设置index长度
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
;; js
(defun my-js-mode-index-setup()
  (setq js-indent-level 2)
  (setq js2-basic-offset 2)
  )
(add-hook 'js2-mode-hook 'my-js-mode-index-setup)
;; css
(defun my-css-mode-index-setup()
  (setq css-indent-offset 2)
  )
(add-hook 'css-mode-hook 'my-css-mode-index-setup)

;; config for emmet
(require 'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.

; (evil-define-key 'insert emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
; (evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)
; (evil-define-key 'emacs emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
; (evil-define-key 'emacs emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)
; (evil-define-key 'hybrid emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
; (evil-define-key 'hybrid emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)

;; my fix for tab indent
(defun henry/indent-region(numSpaces)
  (progn
    ; default to start and end of current line
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))

    ; if there's a selection, use that instead of the current line
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end))
      )
    (save-excursion                          ; restore the position afterwards
      (goto-char regionStart)                ; go to the start of region
      (setq start (line-beginning-position)) ; save the start of the line
      (goto-char regionEnd)                  ; go to the end of region
      (setq end (line-end-position))         ; save the end of the line

      (indent-rigidly start end numSpaces) ; indent between start and end
      (setq deactivate-mark nil)           ; restore the selected region
      )
    )
  )
(defun henry/tab-region ()
  (interactive "p")
  (if (use-region-p)
      (henry/indent-region 2)               ; region was selected, call indent-region
    (insert "    ")                   ; else insert four spaces as expected
    ))
(defun henry/untab-region ()
  (interactive "p")
  (henry/indent-region -2))
(defun henry/hack-tab-key ()
  (interactive)
  (local-set-key (kbd "<tab>") 'henry/tab-region)
  (local-set-key (kbd "<S-tab>") 'henry/untab-region)
  )
(add-hook 'prog-mode-hook 'henry/hack-tab-key)


;; 文件末尾
(provide 'init-web-mode)
