;; Setup Config: Helm, Counsel, Ivy, Swiper

;;------------------------------------------------------------
;; [Package] Helm
;;  https://github.com/emacs-helm/helm
;;
;; Helm is an Emacs framework for incremental completions and
;; narrowing selections. It provides an easy-to-use API for developers
;; wishing to build their own Helm applications in Emacs, powerful
;; search tools and dozens of already built-in commands providing
;; completion to almost everything.
;;
;;------------------------------------------------------------

(use-package helm
  :ensure t
  :bind (("M-x"      . helm-M-x)
         ("C-x C-f"  . helm-find-files)
         ("C-x f"    . helm-recentf)
         ("C-SPC"    . helm-dabbrev)
         ("C-x r l"  . helm-bookmarks)
         ("M-y"      . helm-show-kill-ring)
         ("C-x b"    . helm-buffers-list))
  :bind (:map helm-map
	      ("M-i" . helm-previous-line)
	      ("M-k" . helm-next-line)
	      ("M-I" . helm-previous-page)
	      ("M-K" . helm-next-page)
	      ("M-h" . helm-beginning-of-buffer)
	      ("M-H" . helm-end-of-buffer))
  :config (progn
	    (setq helm-buffers-fuzzy-matching t)
            (setq helm-bookmark-show-location t)
            (helm-mode 1)))

;;------------------------------------------------------------
;; Helm integration with projectile
(use-package helm-projectile
  :ensure t
  :bind (("C-c p f" . helm-projectile-find-file)
         ("C-c p p" . helm-projectile-switch-project)
         ("C-c p g" . helm-projectile-grep))
  :config
  (helm-projectile-on))

;;------------------------------------------------------------
;; Helm-ag: silver searcher with helm
(use-package helm-ag
  :ensure helm-ag
  :bind ("M-p" . helm-projectile-ag)
  :commands (helm-ag helm-projectile-ag)
  :init (setq helm-ag-insert-at-point 'symbol
              helm-ag-command-option "--path-to-ignore ~/.agignore"))

;;------------------------------------------------------------
;; [Package] Helm-gtags
;; Helm integration with gtags
;;------------------------------------------------------------

(use-package helm-gtags
  :ensure t
  :bind (
      ("C-c g a"  . helm-gtags-tags-in-this-function)
      ("C-j"      . helm-gtags-select)
      ("M-."      . helm-gtags-dwim)
      ("M-,"      . helm-gtags-pop-stack)
      ("C-c <"    . helm-gtags-previous-history)
      ("C-c >"    . helm-gtags-next-history))
  :hook
    ;; Enable helm-gtags-mode in Dired so you can jump to any tag
    ;; when navigate project tree with Dired
    (dired-mode . helm-gtags-mode)

    ;; Enable helm-gtags-mode in Eshell for the same reason as above
    (eshell-mode . helm-gtags-mode)

    ;; Enable helm-gtags-mode in languages that GNU Global supports
    (c-mode     . helm-gtags-mode)
    (c++-mode   . helm-gtags-mode)
    (java-mode  . helm-gtags-mode)
    (asm-mode   . helm-gtags-mode))
  :init
  (progn
    (setq helm-gtags-ignore-case t
          helm-gtags-auto-update t
          helm-gtags-use-input-at-cursor t
          helm-gtags-pulse-at-cursor t
          helm-gtags-prefix-key "\C-cg"
          helm-gtags-suggested-key-mapping t))

(provide 'init-helm)
