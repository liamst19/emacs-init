;;; emacs-init.el --- init loader for emacs text editor
;;; Commentary:
;;; This is the entry point for all other configs.
;;;
;;; ============================================================
;;;
;;; Add the following to init file (eg .emacs, emacs.init),
;;; inserting the path to this directory as 'default-directory'
;;;
;;; ;; ----------------------------------------
;;; (let ((default-directory ""))
;;;   (add-to-list 'load-path default-directory)
;;;   (normal-top-level-add-subdirs-to-load-path)
;;;   (add-to-list 'load-path default-directory)
;;;   )
;;; (require 'emacs-init)
;;; ;; ----------------------------------------
;;;
;;; Some other directories must be set, mostly for org-capture
;;;
;;; ;; info files
;;; (add-to-list 'Info-default-directory-list "~/.emacs.d/info")
;;;
;;; ;; ----------------------------------------
;;; ;; Git Repository for magit, etc.
;;; (setq usr-git-repositories-directory "")
;;;
;;; ;; ----------------------------------------
;;; ;; Projectile Project Paths
;;; (setq projectile-project-search-path '(""))
;;;
;;; ;; ----------------------------------------
;;; ;; Dropbox - Mainly for notes and org-mode
;;; (setq usr-dropbox-directory       "")
;;; ;; ----------------------------------------
;;; ;; Org-mode
;;; (setq org-directory               "")
;;; (setq deft-directory              "")
;;; (setq usr-notes-directory         usr-dropbox-directory) ;for org files, etc.
;;; (setq usr-org-capture-directory   org-directory) ; for note captures
;;; (setq usr-deft-directory          deft-directory)
;;;
;;; ;; Agenda Files
;;; (setq org-agenda-files org-directory)
;;;
;;; ;; ----------------------------------------
;;; ;; Notes
;;; (let ((default-directory usr-notes-directory))
;;;   (setq diary-file (expand-file-name "diary"))
;;;   (setq markdown-memo-file (expand-file-name "Memo/%s.md.txt")))
;;;
;;; ;; ----------------------------------------
;;; ;; ----------------------------------------
;;;
;;; ============================================================
;;; ============================================================
;;; ============================================================

;; ------------------------------------------------------------
;; ------------------------------------------------------------

;; Load paths
(let ((default-directory (file-name-directory
			  (or load-file-name buffer-file-name))))
  (add-to-list 'load-path default-directory)  ; add this directory
  (normal-top-level-add-subdirs-to-load-path) ; add subdirectories
  (add-to-list 'custom-theme-load-path        ; themes directory
	       (concat default-directory "themes/")))

;; ------------------------------------------------------------
;; loading packages

(require 'emacs-settings) ; basic, package-less configs
(require 'emacs-settings-font) ; fonts, languages

(require 'init-packages) ; entry for loading packages

(require 'init-misc) ;; some miscellaneous functions

(if (string-equal system-type "windows-nt")
    (require 'win-settings))

;; ------------------------------------------------------------

(provide 'emacs-init)
;;; emacs-init.el ENDS HERE
