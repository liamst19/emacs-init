;;------------------------------------------------------------
;; [Package] Vue-mode
;; https://github.com/AdamNiederer/vue-mode
;;
;; Emacs major mode for vue.js based on mmm-mode.
;;
;;------------------------------------------------------------

(use-package vue-mode
     :ensure t
     :mode
     ("\\.vue\\'")
     :init (progn
     (add-hook 'vue-mode-hook #'add-node-modules-path)
     (add-hook 'vue-mode-hook 'flycheck-mode)
     (flycheck-add-mode 'javascript-eslint 'vue-mode)
     (flycheck-add-mode 'javascript-eslint 'vue-html-mode)
     (flycheck-add-mode 'javascript-eslint 'css-mode)
     ))

(provide 'init-vue)
