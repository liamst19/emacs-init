;;------------------------------------------------------------
;; [Package] Dashboard
;; https://github.com/emacs-dashboard/emacs-dashboard
;;
;; An extensible emacs startup screen showing you what’s most important.
;;------------------------------------------------------------

(use-package dashboard
  :ensure t
  :init
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-content t)
  (setq dashboard-items '((bookmarks . 5)
                          (recents  . 5)
                          (projects . 5)
                          (agenda . t)
                          ; (registers . 0)
                          ))
  (setq show-week-agenda-p t))

(provide 'init-dashboard)
