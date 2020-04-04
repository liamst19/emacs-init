;;------------------------------------------------------------
;; [Package] Emmet-mode
;; https://github.com/smihica/emmet-mode
;;
;; emmet-mode is a minor mode providing support for Zen Coding by
;; producing HTML from CSS-like selectors.
;;
;; -----------------------------------------------------------

(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
  (add-hook 'web-mode-hook 'emmet-mode)
  :config
  (setq emmet-expand-jsx-className? t)
  )

(provide 'init-emmet)
