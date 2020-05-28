;;------------------------------------------------------------
;; [Package] Deft
;; 
;; https://jblevins.org/projects/deft/
;;
;; Deft is an Emacs mode for quickly browsing, filtering, and editing
;; directories of plain text notes, inspired by Notational
;; Velocity. It was designed for increased productivity when writing
;; and taking notes by making it fast and simple to find the right
;; file at the right time and by automating many of the usual tasks
;; such as creating new files and saving files.
;;
;;------------------------------------------------------------

(use-package deft
  :ensure t
  :bind (("\C-c d d" . deft)
         ("\C-c d R" . deft-refresh))
  :init
  :config
  (setq deft-directory usr-deft-directory)
  (setq deft-extensions '("txt" "org" "md")) ;maybe add "tex"?
  (setq deft-default-extension "org")
  (setq deft-text-mode 'markdown-mode)
  (setq deft-use-filename-as-title t)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-auto-save-interval 0)
  (setq deft-recursive t)
  )

;;------------------------------------------------------------
;; [Package] Zetteldeft
;; https://www.eliasstorms.net/zetteldeft/
;;
;; (From Website)
;; This is my feeble attempt at recreating a Zettelkasten environment
;; by extending the excellent deft package in emacs.1 I call it
;; zetteldeft.
;;
;; It is inspired by the The Archive app. For this and more on the
;; Zettelkasten way of taking notes, see zettelkasten.de. They have a
;; forum for discussion on both software and the specifics of the
;; Zettelkasten philosophy.
;;
;;------------------------------------------------------------

(use-package zetteldeft
  :ensure t
; :after deft
  :bind(("\C-c d n" . zetteldeft-new-file)
        ("\C-c d o" . zetteldeft-find-file)
        ("\C-c d i" . zetteldeft-find-file-id-insert)
        ("\C-c d N" . zetteldeft-new-file-and-link)
        ("\C-c d s" . zetteldeft-search-at-point)
        ("\C-c d c" . zetteldeft-search-current-id)
        ("\C-c d f" . zetteldeft-follow-link)
        ("\C-c d F" . zetteldeft-avy-file-search-ace-window)
        ("\C-c d l" . zetteldeft-avy-link-search)
        ("\C-c d t" . zetteldeft-avy-tag-search)
        ("\C-c d T" . zetteldeft-tag-buffer)
        ("\C-c d D" . zetteldeft-deft-new-search)
        ("\C-c d I" . zetteldeft-find-file-full-title-insert)
        ("\C-c d r" . zetteldeft-file-rename)
        ("\C-c d x" . zetteldeft-count-words))
  )

(provide 'init-deft)
