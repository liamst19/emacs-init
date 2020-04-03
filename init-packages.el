

;; ------------------------------------------------------------
;; ------------------------------------------------------------
;; Set load paths for packages

(let ((lisp-dir "~/.emacs.d/lisp/")
      (elpa-dir "~/.emacs.d/elpa/"))
    (progn
    ;; lisp directory
    (unless (file-directory-p lisp-dir)
      (make-directory lisp-dir))
    (add-to-list 'load-path lisp-dir)
    (let ((default-directory  lisp-dir))
      (normal-top-level-add-subdirs-to-load-path))
    ;; ELPA directory
    (unless (file-directory-p elpa-dir)
      (make-directory elpa-dir))
    (let ((default-directory elpa-dir))
      (normal-top-level-add-subdirs-to-load-path))))

;;------------------------------------------------------------
;; [Package] Package Initialization and Update
;;------------------------------------------------------------
(require 'package)
(setq package-archives
      '(("melpa"     . "https://melpa.org/packages/")
        ("gnu"       . "https://elpa.gnu.org/packages/")
;;        ("marmalade" . "https://marmalade-repo.org/packages/")
        ("org"       . "http://orgmode.org/elpa/")))
(package-initialize) ;; obsolete from emacs 27

(setq url-http-attempt-keepalives nil)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Periodically check for packages updates
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-interval 7) ;every 7 days
  (auto-package-update-maybe))

;;------------------------------------------------------------
;;------------------------------------------------------------

(require 'init-japanese-mozc) ;; Japanese input

(require 'init-calendar)
(require 'init-org)
(require 'init-deft)
(require 'init-f) ;; for working with files and directories

(require 'init-color-theme)
;; (require 'init-moody) ; moody mode-line theme
(require 'init-adaptive-wrap)
(require 'init-minions) ; minions mode-line theme
(require 'init-eyebrowse) ; minor mode for window configurations
(require 'init-olivetti) ; minor mode for nice writing environment
(require 'init-highlight-indentation-guides)

(require 'init-dashboard)
(require 'init-evil) ; vim keybindings
(require 'init-git)
(require 'init-projectile)
(require 'init-treemacs)
(require 'init-flycheck)

(require 'init-ag)

;; (require 'init-tern)
(require 'init-helm)
(require 'init-company)
(require 'init-irony)
(require 'init-lsp)

;; (require 'init-ivy)
;; (require 'init-ido)
;; (require 'init-counsel)

(require 'init-swiper)

(require 'init-yasnippet)
(require 'init-ggtags)
(require 'init-dtrt-indent)
(require 'init-ws-butler)

(require 'init-markdown)
(require 'init-yaml)
(require 'init-js)  ; javascript
(require 'init-vue)
(require 'init-web)  ; html, css
(require 'init-emmet)
(require 'init-tide) ; typescript
(require 'init-cc)
(require 'init-cmake)
(require 'init-cmake-ide)

(require 'init-auctex) ; for latex

;;------------------------------------------------------------
