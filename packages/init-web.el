;;------------------------------------------------------------
;; [Package] Web-mode
;; http://web-mode.org/
;;
;; web-mode.el is an autonomous emacs major-mode for editing web
;; templates.  HTML documents can embed parts (CSS / JavaScript) and
;; blocks (client / server side).
;;------------------------------------------------------------

(use-package web-mode
  :ensure t
  :mode
  ("\\.ejs\\'"
   "\\.hbs\\'"
   "\\.html\\'"
   "\\.php\\'"
   "\\.vue\\'"
   "\\.[jt]sx\\'"
   )
  :hook
  (web-mode electric-pair-mode)
  :config
  (setq web-mode-markup-indent-offset     2
        web-mode-css-indent-offset        2
        web-mode-code-indent-offset       2
        web-mode-script-padding           2
        web-mode-block-padding            2
        web-mode-style-padding            2
        web-mode-enable-auto-pairing      t
        web-mode-enable-auto-closing      t
        web-mode-enable-auto-expanding    t
        web-mode-enable-css-colorization  t
        web-mode-enable-current-element-highlight t))

(provide 'init-web)
