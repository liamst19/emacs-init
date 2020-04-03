
;;------------------------------------------------------------
;; [Package] Counsel
;
;; ivy-mode ensures that any Emacs command using
;; completing-read-function uses ivy for completion.

;; Counsel takes this further, providing versions of common Emacs
;; commands that are customised to make the best use of ivy. For example,
;; counsel-find-file has some additional keybindings. Pressing DEL will
;; move you to the parent directory.
;;
;;------------------------------------------------------------

;; Counsel will install Ivy and Swiper as dependencies
(use-package counsel
  :ensure t
  :bind (("\M-x" . counsel-M-x)
         ("\C-x \C-f" . counsel-find-file))

(provide 'init-counsel)
