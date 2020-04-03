;;-----------------------------------------------------------
;; [Package] Adaptive Wrap
;;
;; This package provides the `adaptive-wrap-prefix-mode' minor mode which
;; sets the wrap-prefix property on the fly so that single-long-line
;; paragraphs get word-wrapped in a way similar to what you'd get with
;; M-q using adaptive-fill-mode, but without actually changing the
;; buffer's text.
;;-----------------------------------------------------------

(use-package adaptive-wrap
  :ensure t)

;; Automatically activate adaptive-wrap along with visual-line-mode
(when (fboundp 'adaptive-wrap-prefix-mode)
  (defun my-activate-adaptive-wrap-prefix-mode ()
    "Toggle `visual-line-mode' and `adaptive-wrap-prefix-mode' simultaneously."
    (adaptive-wrap-prefix-mode (if visual-line-mode 1 -1)))
  (add-hook 'visual-line-mode-hook 'my-activate-adaptive-wrap-prefix-mode))

(provide 'init-adaptive-wrap)
