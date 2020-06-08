
;; ------------------------------------------------------------
;; Tern
;; https://ternjs.net/
;;
;; Tern is a stand-alone code-analysis engine for JavaScript. It is
;; intended to be used with a code editor plugin to enhance the
;; editor's support for intelligent JavaScript editing. Features
;; provided are:
;;
;;  - Autocompletion on variables and properties
;;  - Function argument hints
;;  - Querying the type of an expression
;;  - Finding the definition of something
;;  - Automatic refactoring
;;
;; ------------------------------------------------------------

(use-package tern
  :ensure t
  :commands (tern-mode)
  :hook
  (js2-mode . tern-mode)
  :config
    (require 'tern-auto-complete)
    (tern-ac-setup)
  )

(provide 'init-tern)
