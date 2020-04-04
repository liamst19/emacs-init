;;------------------------------------------------------------
;; [Package] Projectile
;; https://projectile.readthedocs.io/en/latest/
;;
;; Projectile is a project interaction library for Emacs. Its
;; goal is to provide a nice set of features operating on a
;; project level without introducing external dependencies (when feasible).
;;------------------------------------------------------------

(use-package projectile
  :ensure t
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map))
  :config (projectile-mode t))

(provide 'init-projectile)
