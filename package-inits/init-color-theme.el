;;------------------------------------------------------------
;; [Package] Color Theme
;;------------------------------------------------------------

;; (use-package color-theme
;;   :ensure t
;;   :commands color-theme-sanityinc-tomorrow-night)

;; sanityinc
;; (use-package color-theme-sanityinc-tomorrow
;;   :ensure t
;;   :config
;;   (setf custom-safe-themes t)
;;   (color-theme-sanityinc-tomorrow-night))

;;------------------------------------------------------------
;; [Package] VSCode Dark Plus
;; https://github.com/ianpan870102/vscode-dark-plus-emacs-theme
;;
;; A complete port of the default Visual Studio Code Dark+ theme for
;; Emacs
;;
;;------------------------------------------------------------
(load-theme 'vscode-dark-plus t)

;; ------------------------------------------------------------
;; [Package] Rainbow Mode
;;
;; rainbow-mode is a minor mode for Emacs which displays strings
;; representing colors with the color they represent as background.
;;
;; ------------------------------------------------------------
(use-package rainbow-mode
  :ensure t)

(provide 'init-color-theme)
