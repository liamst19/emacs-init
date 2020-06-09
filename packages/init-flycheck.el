;;------------------------------------------------------------
;; [Package] FLycheck
;;
;; http://www.flycheck.org/en/latest/
;;
;; Flycheck is a modern on-the-fly syntax checking extension for GNU
;; Emacs; It uses various syntax checking and linting tools to
;; automatically check the contents of buffers while you type, and
;; reports warnings and errors directly in the buffer, or in an
;; optional error list.
;;------------------------------------------------------------

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))


;; Flycheck does not explicitly support Windows, but tries to maintain
;; Windows compatibility and should generally work fine on Windows, too.
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :hook
  (flycheck-mode . my/use-eslint-from-node-modules)
  :config
  (progn
    ;; use eslint with web-mode for jsx files
    (flycheck-add-mode 'javascript-eslint 'web-mode))
 )

(provide 'init-flycheck)
