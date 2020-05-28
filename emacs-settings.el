;;; emacs-settings.el -- basic, package-less UI settings
;;; Commentary:
;;;

;; ------------------------------------------------------------
;; UI settings
;; ------------------------------------------------------------

(setq frame-title-format "%b --- emacs")  ; title bar
;; (setq inhibit-startup-screen t)           ; disable splash screen

;; Turn off the annoying 'ding!' sound
;; (if (string-equal system-type "gnu/linux") ; necessary?
(setq visible-bell t)
;;)

(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; Scratch
;; (setq initial-scratch-message nil)   ; remove message from scratch
;; (setq initial-major-mode 'text-mode) ; set it to text-mode

;;Auto-Save
;; https://www.emacswiki.org/emacs/AutoSave
(setq backup-directory-alist
      `(("." . ,(concat usr-emacs-directory "backups"))))
;; (setq-default make-backup-files nil)
;; (setq auto-save-default nil)
;; (setq delete-auto-save-files t)

;; Disable Lock Files - crashes cypress testing
(setq create-lockfiles nil)

;; Do not open file or user dialog
(setq use-file-dialog nil)
(setq use-dialog-box nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; line-wrap for text-mode
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq c-basic-indent 2)
(setq tab-width 2)
;; (highlight-tabs)
;; (highlight-trailing-whitespace)

;; get curved quotes as you type
;; (electric-quote-mode)

;; Spell-check program
(setq ispell-program-name "aspell")

(global-linum-mode t)
(line-number-mode t)
(column-number-mode t)

(blink-cursor-mode 0)
(global-hl-line-mode t)
(show-paren-mode t)
;; Mouse Scrolling Behaviour
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; ------------------------------------------------------------
;; emacsclient (--daemon) does not seem to reproduce the initial
;; window settings like toolbar and window sizes. This is a
;; workaround.
;;
;; source:
;;   https://emacs.stackexchange.com/questions/39359/tool-bar-in-emacsclient

(defun my-frame-tweaks (&optional frame)
  "frame tweaks"
  (unless frame
    (setq frame (selected-frame)))
  (when frame
    (with-selected-frame frame
      (when (display-graphic-p)
	;; ---------------------------------------------------
	;; Frame Configurations ------------------------------

	(set-frame-size (selected-frame) 80 35)
	(set-frame-position (selected-frame) 25 50)
	;; (set-frame-width (selected-frame) 80)
	;; (set-frame-height (selected-frame) 35)
	(tool-bar-mode -1)
	(menu-bar-mode -1)
	(toggle-scroll-bar -1)

	;; ---------------------------------------------------
	;; ---------------------------------------------------
	))))

;; Call on load
(my-frame-tweaks)

;; Hook to be called for emacsclient frames
(add-hook 'after-make-frame-functions #'my-frame-tweaks t)

;; ------------------------------------------------------------
;; ------------------------------------------------------------
(provide 'emacs-settings)
