

;;------------------------------------------------------------
;; [Package] lsp-mode
;; https://github.com/emacs-lsp/lsp-mode
;;
;; Client for Language Server Protocol (v3.14). lsp-mode aims to
;; provide IDE-like experience by providing optional integration with
;; the most popular Emacs packages like company, flycheck and
;; projectile.
;;
;; To defer LSP server startup (and DidOpen notifications) until the
;; buffer is visible you can use lsp-deferred instead of lsp:
;;
;; (use-package lsp-mode
;;     :hook (XXX-mode . lsp-deferred)
;;     :commands (lsp lsp-deferred))
;;
;;------------------------------------------------------------

(use-package lsp-mode
  :ensure t
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c-mode . lsp) (js-mode . lsp) (js-jsx-mode . lsp) (js2-mode . lsp)
         (web-mode . lsp) (vue-mode . lsp)
         ;; (typescript-mode . lsp)
         (python-mode . lsp)
         ;; if you want which-key integration
         ;; (lsp-mode . lsp-enable-which-key-integration)
         )
  :commands lsp
  :init)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Requires Compnay-mode
(use-package company-lsp
  :ensure t
  :commands company-lsp)

;; requires Helm
(use-package helm-lsp
  :commands helm-lsp-workspace-symbol)

;; Treemacs
(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(provide 'init-lsp)
