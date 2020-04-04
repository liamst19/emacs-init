;;------------------------------------------------------------
;; CC-Mode
;;------------------------------------------------------------

;; (Setq-default c-basic-offset 4)
;; (defun my-arg-list-indentation ()
;;   (c-set-offset 'arglist-intro '++))
;; (add-hook 'c-mode-hook 'my-arg-list-indentation)
(setq c-default-style "linux"
      c-basic-offset 4)

(defun my-arg-list-indentation ()
  (setq c-basic-offset 4)
  (c-set-offset 'member-init-intro '+)
  (c-set-offset 'arglist-intro '++))
(add-hook 'c-mode-common-hook 'my-arg-list-indentation)

(provide 'init-cc)
