;; ----------------------------------------
;; [Package] typescript-mode
;; https://github.com/emacs-typescript/typescript.el
;;
;; typescript.el is major-mode for editing Typescript-files in GNU
;; Emacs.
;; ----------------------------------------

(use-package typescript-mode
  :ensure t
  :mode ("\\.tsx?\\'")
  )

(provide 'init-typescript)
