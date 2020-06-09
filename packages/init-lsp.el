

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
         (c-mode . my-connect-lsp)
         (js-mode . my-connect-lsp)
         (js-jsx-mode . my-connect-lsp)
         (js2-mode . my-connect-lsp)
         (web-mode . my-connect-lsp)
         (vue-mode . my-connect-lsp)
         ;; (typescript-mode . my-connect-lsp)
         (python-mode . my-connect-lsp)
         ;; if you want which-key integration
         ;; (lsp-mode . lsp-enable-which-key-integration)
         )
  :commands lsp
  :init
  :config
;; enable log only for debug
  (setq lsp-log-io nil)
  ;; use `evil-matchit' instead
  (setq lsp-enable-folding nil)
  ;; no real time syntax check
  (setq lsp-diagnostic-package :none)
  ;; handle yasnippet by myself
  (setq lsp-enable-snippet nil)
  ;; use `company-ctags' only.
  ;; Please note `company-lsp' is automatically enabled if installed
  (setq lsp-enable-completion-at-point nil)
  ;; turn off for better performance
  (setq lsp-enable-symbol-highlighting nil)
  ;; use ffip instead
  (setq lsp-enable-links nil)
  ;; auto restart lsp
  (setq lsp-restart 'auto-restart)
  ;; @see https://github.com/emacs-lsp/lsp-mode/pull/1498 and code related to auto configure.
  ;; Require clients could be slow.
  ;; I only load `lsp-clients' because it includes the js client which I'm interested
  (setq lsp-client-packages '(lsp-clients))
  ;; don't scan 3rd party javascript libraries
  (push "[/\\\\][^/\\\\]*\\.\\(json\\|html\\|jade\\)$" lsp-file-watch-ignored) ; json
  ;; don't ping LSP lanaguage server too frequently
  (defvar lsp-on-touch-time 0)
  (defadvice lsp-on-change (around lsp-on-change-hack activate)
    ;; don't run `lsp-on-change' too frequently
    (when (> (- (float-time (current-time))
                lsp-on-touch-time) 30) ;; 30 seconds
      (setq lsp-on-touch-time (float-time (current-time)))
      ad-do-it))
    )

(defun my-connect-lsp (&optional no-reconnect)
  "Connect lsp server.  If NO-RECONNECT is t, don't shutdown existing lsp connection."
  (interactive "P")
  (when (and (not no-reconnect)
             (fboundp 'lsp-disconnect))
    (lsp-disconnect))
  (when (and buffer-file-name
             (not (member (file-name-extension buffer-file-name)
                          '("json"))))
    (unless (and (boundp 'lsp-mode) lsp-mode)
      (if (derived-mode-p 'js2-mode) (setq-local lsp-enable-imenu nil))
      (lsp-deferred))))

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
