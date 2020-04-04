;;------------------------------------------------------------
;; [Package] Ivy / Swiper / Counsel
;;
;; http://oremacs.com/swiper/
;;
;; Ivy is an interactive interface for completion in Emacs. Emacs uses
;; completion mechanism in a variety of contexts: code, menus,
;; commands, variables, functions, etc. Completion entails listing,
;; sorting, filtering, previewing, and applying actions on selected
;; items. When active, ivy-mode completes the selection process by
;; narrowing available choices while previewing in the
;; minibuffer. Selecting the final candidate is either through simple
;; keyboard character inputs or through powerful regular expressions.
;;------------------------------------------------------------

(use-package ivy
  :ensure t
  :bind (("\C-c \C-r" . ivy-resume))
  :config (progn
            (ido-mode t) ;ido mode?
            (ivy-mode t)
            (setq ivy-use-virtual-buffers t)
            (setq ivy-count-format "%d/%d ")))

(provide 'init-ivy)
