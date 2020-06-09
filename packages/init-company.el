
;;------------------------------------------------------------
;; [Package] Company
;; https://company-mode.github.io/
;;
;; Company is a text completion framework for Emacs. The name
;; stands for "complete anything". It uses pluggable back-ends
;; and front-ends to retrieve and display completion candidates.
;;------------------------------------------------------------

(use-package company
  :ensure t
  :hook
  ;; Enable company mode in every programming mode
  (prog-mode . company-mode)
  :config
  (progn
    ;; (company-ctags-auto-setup)
    ;; Set my own default company backends
    (setq-default
     company-backends
     '(company-nxml
       company-css
       company-cmake
       company-files
       company-dabbrev-code
       company-keywords
       company-irony
       company-irony-c-headers
       company-gtags
       company-dabbrev
       company-elisp))))

(use-package company-ctags
  :ensure t
  :after (company)
  :init
  (setq company-ctags-extra-tags-files '("$HOME/TAGS" "/usr/include/TAGS"))
  )

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

;; The Tern project is a JavaScript analyzer that can be used to
;; improve the JavaScript integration with editors like Emacs.

;; (use-package company-tern
;; :ensure t
;; :init
;; (progn
;; (add-to-list 'company-backends 'company-tern))
;; ;;    (add-hook 'js2-mode-hook (lambda () (tern-mode t))))
;; :hook
;; (js2-mode . (lambda() (tern-mode t))))

(provide 'init-company)
