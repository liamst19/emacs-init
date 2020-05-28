;;------------------------------------------------------------
;; [Package] Org-mode
;;------------------------------------------------------------

;; Default notes directory
(let ((default-directory usr-org-capture-directory))
  (setq org-default-notes-file (expand-file-name "notes.org"))
  (setq org-notes-refile       (expand-file-name "notes_refile.org"))
  (setq org-devnotes-file      (expand-file-name "devnotes.org"))
  (setq org-diary-file         (expand-file-name "diary.org"))
  (setq org-quotes-file        (expand-file-name "quotes.org"))
  (setq org-wishlist-file      (expand-file-name "wishlist.org"))
  (setq org-todo-file          (expand-file-name "todo.org")))

;; Minor mode for quickly browsing through org-mode notes
(require 'org-notebook-mode)
;; Direction of the subtree buffer window: right, left, above, below
(setq org-notebook-window-direction 'right)

(use-package org
  :ensure t
  :mode (("\\.org$"       . org-mode)
         ("\\.org.txt\\'" . org-mode))

  ;; Org-Capture key bindings
  :bind (("\C-c c" . org-capture)
         ("\C-c l" . org-store-link)
         ("\C-c a" . org-agenda)
         ("\C-c b" . org-iswitchb))

  ;; Key bindings within org-mode
  :bind (:map org-mode-map
              ([f7]     . org-html-export-to-html))

  :init
  ;; Export backends
  (setq org-export-backends '(md org html latex ascii))
  ;; Org-mode Modules
  (setq org-modules '(org-habit org-tempo))
  ;; Mobile Config
  (setq org-mobile-inbox-for-pull org-default-notes-file)
  ;; Tags
  (setq org-tag-alist '(("@quote" . ?q) ("@memo" . ?m)))
  ;; Capture Templates
  (setq org-capture-templates
        '(("n" "Note"
           entry (file org-default-notes-file)
           "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n")
        ;; devnotes
          ("v" "devnote")
          ("vn" "Unfiled"
           entry (file+headline org-devnotes-file "Unfiled")
           "* %?\n")
          ("vo" "org-mode"
           entry (file+headline org-devnotes-file "org-mode")
           "* %?\n")
          ("ve" "emacs"
           entry (file+headline org-devnotes-file "Emacs")
           "* %?\n")
        ;; -----
          ("d" "Diary Entry"
           entry (file+datetree org-diary-file)
           "* %<%R> | %?\n%i\n%U\n\n")
          ("g" "Quote"
           entry (file+headline org-quotes-file "Captured")
           "* %?\n\n%U\n\n")
          ("w" "Wishlist"
           entry (file org-wishlist-file)
           "* %?\nLogged: %U\n")
          ("t" "Todo"
           entry (file org-todo-file)
           "* TODO %?\nLogged: %U\n")))
  ;; Refile Targets
  (setq org-refile-targets
        '((org-quotes-file           :maxlevel . 1)
          (org-default-notes-file    :maxlevel . 1)
          (org-notes-refile          :maxlevel . 3)
          (org-mobile-inbox-for-pull :maxlevel . 3)))
  ;; Refile on top of file max
  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)
  ;; Refile - create new nodes
  (setq org-refile-allow-creating-parent-nodes 'confirm)

  :config
  (progn
    (setq org-agenda-files                 (list org-todo-file
                                                 org-default-notes-file
                                                 org-devnotes-file
                                                 org-diary-file)
          org-agenda-include-diary         t
          org-ellipsis                     "↴" ;; ▾↴
          org-catch-invisible-edits        'show-and-error
          org-hide-emphasis-markers        t
          org-fontify-whole-heading-line   t
          org-tags-column                  0
          org-bullets-bullet-list          '("●" "◆" "▲" "■" "")
          org-indent-mode                  t
          org-adapt-indentation            t
          line-move-visual                 t)
    (add-hook 'org-mode-hook (lambda ()
                               (linum-mode 0)
                               (olivetti-mode 1)
                               (flyspell-mode 0)
                               (set-fringe-mode 0)
                               (setq line-spacing 3)
                               (setq global-hl-line-mode 0)
                               (setq left-margin-width 5)
                               (setq right-margin-width 5)
                               (setq header-line-format "")
                               ))
    (add-hook 'org-mode-hook 'variable-pitch-mode)
    (add-hook 'org-mode-hook 'visual-line-mode)
    (add-hook 'org-mode-hook 'org-indent-mode)
    (add-hook 'org-mode-hook 'prettify-symbols-mode))

  :custom-face
    (variable-pitch            ((t (:family "iA Writer Duo V-22"
                                            :foreground "#cdcdcd"))))
    (fixed-pitch               ((t (:family "Office Code Pro"))))
    (flyspell-incorrect        ((t (:foreground "#d3ebe9"
                                                :background "#c23127"))))
    (header-line               ((t (:background "#1c1e1f"))))
    (org-document-title        ((t (:foreground "#f2f2f2"
                                                :weight bold))))
    (org-meta-line             ((t (:inherit
                                    (font-lock-comment-face fixed-pitch)))))
    (org-document-info         ((t (:foreground "#51c4b5"))))
    (org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
    (org-block                 ((t (:inherit fixed-pitch))))
    (org-link                  ((t (:foreground "#6699cc"
                                                :underline t))))
    (org-property-value        ((t (:inherit fixed-pitch))))
    (org-special-keyword       ((t (:inherit
                                    (font-lock-comment-face fixed-pitch)))))
    (org-tag                   ((t (:inherit (shadow fixed-pitch)))))
    (org-verbatim              ((t (:inherit (shadow fixed-pitch)))))
    (org-code                  ((t (:inherit (shadow fixed-pitch)))))
    (org-indent                ((t (:inherit (org-hide fixed-pitch)))))
    (org-level-1               ((t (:family "iA Writer Quattro V-b-23"
                                            :foreground "#8899bb"))))
    (org-level-2               ((t (:foreground "#99cccc"))))
    (org-level-3               ((t (:foreground "#bbbbaa"))))
    (org-list-dt               ((t (:foreground "#aa9988"))))
    (org-ellipsis              ((t (:family "Office Code Pro"
                                            :foreground "#BBBBBB")))))

(provide 'init-org)
