;;------------------------------------------------------------
;; YAML-Mode
;; https://github.com/yoshiki/yaml-mode
;;
;; yaml major mode for emacs.
;;------------------------------------------------------------

(use-package yaml-mode
  :ensure t
  :config (progn
            (add-hook 'yaml-mode-hook
                      (lambda ()
                        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))))

(provide 'init-yaml)
