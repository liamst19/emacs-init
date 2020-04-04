;;------------------------------------------------------------
;; [Package] Eyebrowse
;;
;; https://github.com/wasamasa/eyebrowse
;;
;; eyebrowse is a global minor mode for Emacs that allows you
;; to manage your window configurations in a simple manner,
;; just like tiling window managers like i3wm with their
;; workspaces do. It displays their current state in the modeline
;; by default. The behaviour is modeled after ranger, a file
;; manager written in Python.
;;------------------------------------------------------------

(use-package eyebrowse
  :ensure t
  :config
  (setq eyebrowse-mode-line-separator " "
        eyebrowse-new-workspace t)
  (eyebrowse-mode t))

(provide 'init-eyebrowse)
