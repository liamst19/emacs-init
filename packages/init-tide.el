;;------------------------------------------------------------
;; [Package] tide-mode
;; https://github.com/ananthakumaran/tide
;;
;; TypeScript Interactive Development Environment for Emacs
;;------------------------------------------------------------

(defun my/activate-tide-mode ()
  "Use hl-identifier-mode only on js or ts buffers."
  (interactive)
  (when (and (stringp buffer-file-name)
             (string-match "\\.tsx?\\'" buffer-file-name))
    (tide-setup)
    (tide-hl-identifier-mode +1)))

(use-package tide
  :ensure t
   ;; :after (typescript-mode company flycheck)
  :mode ("\\.tsx?\\'")
  :init
  (progn
    ;; (add-hook 'before-save-hook     'tide-format-before-save)
    ;; (add-hook 'typescript-mode-hook #'my/activate-tide-mode)
    ;; (add-hook 'web-mode-hook        #'my/activate-tide-mode)
    )
  )

(provide 'init-tide)
