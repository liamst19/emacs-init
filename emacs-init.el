
;; ------------------------------------------------------------
;; Helper Functions
;; ------------------------------------------------------------

(defun xah-get-fullpath (@file-relative-path)
  "Return the full path of *file-relative-path, relative to caller's file location.
Source: http://ergoemacs.org/emacs/organize_your_dot_emacs.html"
  (concat (file-name-directory
	   (or load-file-name buffer-file-name)
	   ) @file-relative-path))

;; ------------------------------------------------------------
;; ------------------------------------------------------------
(add-to-list 'load-path (concat usr-emacs-init-repository "/misc/"))
(add-to-list 'custom-theme-load-path (concat usr-emacs-init-repository "/themes/"))
(add-to-list 'load-path (concat usr-emacs-init-repository "package-inits"))

(load (xah-get-fullpath "emacs-settings.el"))
(load (xah-get-fullpath "init-packages.el"))
