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
  :hook
  (sgml-mode . emmet-mode) ;; Auto-start on any markup modes
  (css-mode  . emmet-mode) ;; enable Emmet's css abbreviation.
  (web-mode  . emmet-mode)
  :config
  (setq emmet-expand-jsx-className? t)
  )

(provide 'init-emmet)
