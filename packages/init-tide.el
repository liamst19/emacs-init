;;------------------------------------------------------------
;; [Package] tide-mode
;; https://github.com/ananthakumaran/tide
;;
;; TypeScript Interactive Development Environment for Emacs
;;------------------------------------------------------------

(defun my/activate-tide-mode ()
  "Use hl-identifier-mode only on js or ts buffers."
  (when (and (stringp buffer-file-name)
             (string-match "\\.tsx?\\'" buffer-file-name))
    (tide-setup)
    (tide-hl-identifier-mode)))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :mode ("\\.tsx?\\'")
  :hook ((before-save     . tide-format-before-save)
         (typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (web-mode        . my/activate-tide-mode)))

(provide 'init-tide)
