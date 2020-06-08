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
     :hook
     (vue-mode . add-node-modules-path)
     (vue-mode . flycheck-mode)
     :init (progn
     (flycheck-add-mode 'javascript-eslint 'vue-mode)
     (flycheck-add-mode 'javascript-eslint 'vue-html-mode)
     (flycheck-add-mode 'javascript-eslint 'css-mode)
     ))

(provide 'init-vue)
