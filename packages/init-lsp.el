

;;------------------------------------------------------------
;; [Package] lsp-mode
;; https://github.com/emacs-lsp/lsp-mode
;;
;; Client for Language Server Protocol (v3.14). lsp-mode aims to
;; provide IDE-like experience by providing optional integration with
;; the most popular Emacs packages like company, flycheck and
;; projectile.
;;------------------------------------------------------------

(use-package lsp-mode
  :ensure t
  :commands lsp
  :init)

(use-package lsp-ui
  :commands lsp-ui-mode)

;; Requires Compnay-mode
(use-package company-lsp
  :commands company-lsp)

(provide 'init-lsp)
