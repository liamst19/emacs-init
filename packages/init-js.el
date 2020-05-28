;;------------------------------------------------------------
;; [Package] js2-mode
;; https://github.com/mooz/js2-mode/
;;
;; Improved JavaScript editing mode for GNU Emacs
;;------------------------------------------------------------

(use-package js2-mode
  :ensure t
  :mode
  ("\\.js\\'")
  :init
  (setq js-basic-indent 2
        js-indent-level 2)
  (setq-default js2-basic-indent 2
                js2-basic-offset 2
                js2-auto-indent-p t
                js2-cleanup-whitespace t
                js2-enter-indents-newline t
                js2-strict-missing-semi-warning nil
                js2-indent-on-enter-key t
                js2-global-externs
                (list
                 "window"      "module"        "require"
                 "buster"      "sinon"         "assert"
                 "refute"      "setTimeout"    "clearTimeout"
                 "setInterval" "clearInterval" "location"
                 "__dirname"    "console"      "JSON"
                 "jQuery"       "$"))
  :hook
  (js2-mode . (lambda() (push '("function" . ?ƒ) prettify-symbols-alist)))
  )

;;------------------------------------------------------------
;; [Package] rjsx-mode
;; https://github.com/felipeochoa/rjsx-mode
;;
;; This mode derives from js2-mode, extending its parser to support
;; JSX syntax according to the official spec. This means you get all
;; of the js2 features plus proper syntax checking and highlighting of
;; JSX code blocks.
;;
;;------------------------------------------------------------

(use-package rjsx-mode
  :ensure t
  :mode
   ("\\.[jt]sx?\\'")
  :init
  )

;;------------------------------------------------------------
;; [Package] json-mod
;; https://github.com/joshwnj/json-mode
;;
;; Major mode for editing JSON files.
;;
;; Extends the builtin js-mode to add better syntax highlighting for
;; JSON and some nice editing keybindings.
;;
;;------------------------------------------------------------

(use-package json-mode
  :ensure t
  :mode
  ("\\.json\\'")
  )

(provide 'init-js)
