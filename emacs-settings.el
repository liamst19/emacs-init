;; ------------------------------------------------------------
;; UI settings
;; ------------------------------------------------------------

(setq frame-title-format "emacs - %b")

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
	(set-frame-size (selected-frame) 80 35)
	(set-frame-position (selected-frame) 25 50)
	;; (set-frame-width (selected-frame) 80)
	;; (set-frame-height (selected-frame) 35) 
	(tool-bar-mode -1)
	(menu-bar-mode -1)
	(toggle-scroll-bar -1)
	))))

(my-frame-tweaks)
(add-hook 'after-make-frame-functions #'my-frame-tweaks t)

;; ------------------------------------------------------------
;; Turn off the annoying beeping sound
(cond
 ((string-equal system-type "windows-nt") ; Windows
  (progn
    (set-message-beep 'silent)))
 ((string-equal system-type "gnu/linux") ; Linux
  (progn
    (setq visible-bell t))))
;; ------------------------------------------------------------
;;  [Font]
;; ------------------------------------------------------------

;; Default Font
;;(set-default-font "Consolas-12")
(setq default-frame-alist '((font . "Consolas-12")))
(setq-default line-spacing 5)

;; Font Set
;; Fix for emacs hanging while trying to display Japanese
;; (and presumably other foreign characters) on Windows system
;; (when (eq system-type 'nt)
  (setq inhibit-compacting-font-caches t)
;;
;; 日本語フォント設定
;; (set-fontset-font (frame-parameter nil 'font)
;;                   'japanese-jisx0208
;;                  (font-spec :family "Noto Sans Mono-10"))
(set-locale-environment nil)
(set-language-environment "Japanese")

;; ;; "Greek extended"  U+1F00 - U+1FFF
;; (set-fontset-font "fontset-standard"
;;                (cons (decode-char 'ucs #x1f00)
;;                      (decode-char 'ucs #x1fff))
;;                (font-spec :family "Consolas"))

;; ; "-*-Consolas-*-*-r-*-14-*-*-*-*-*-iso10646-1")

;; ;; "Greek and Coptic"  U+0370 - U+03FF
;; (set-fontset-font "fontset-standard"
;;                (cons (decode-char 'ucs #x0370)
;;                      (decode-char 'ucs #x03ff))
;;                (font-spec :family "Consolas"))
