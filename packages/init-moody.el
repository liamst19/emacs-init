
;;------------------------------------------------------------
;; [Package] Moody mode-line theme
;; https://github.com/tarsius/moody
;;
;; This package provides utilities for displaying elements of the mode
;; line as tabs and ribbons. It also provides replacements for a few
;; built-in elements.
;;
;;------------------------------------------------------------

(use-package moody
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(provide 'init-moody)
