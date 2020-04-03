;;------------------------------------------------------------
;; [Package] Magit
;; https://magit.vc/
;;
;; Magit is an interface to the version control system Git,
;; implemented as an Emacs package.
;;
;;------------------------------------------------------------

(use-package magit
  :ensure t
  :config (setq magit-repository-directories `((usr-git-repositories-directory . 1))))

(use-package ghub
  :defer t
  :config
  (require 'auth-source-pass)
(defvar my-ghub-token-cache nil))

(use-package forge
  :ensure t
  :after magit)

(provide 'init-git)
