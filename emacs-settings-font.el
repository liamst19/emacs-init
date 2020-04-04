;;; emacs-settings-font.el -- Font and language configuration
;;; Commentary:

;; ------------------------------------------------------------
;;  Font and Language
;; ------------------------------------------------------------

;; ----------------------------------
;; Text Encoding
;; -----------------------------------

;; Set Coding System to UTF-8
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)

(setq default-buffer-file-coding-system 'utf-8)

;; -----------------------------------
;; Font
;; -----------------------------------

;; Default Font
;;(set-default-font "Consolas-12")
(setq default-frame-alist '((font . "Consolas-12")))
(setq-default line-spacing 5)

;; Font Set
;; Fix for emacs hanging while trying to display Japanese
;; (and presumably other foreign characters) on Windows system
;; (when (eq system-type 'nt)
  (setq inhibit-compacting-font-caches t)

;; -----------------------------------
;; Foreign Languages
;; -----------------------------------

;; Japanese --------------------------
;; (set-fontset-font (frame-parameter nil 'font)
;;                   'japanese-jisx0208
;;                  (font-spec :family "Noto Sans Mono-10"))
(set-locale-environment nil)
(set-language-environment "Japanese")

;; Greek -----------------------------
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

;; ------------------------------------------------------------

(provide 'emacs-settings-font)
;;; emacs-settings-font.el ENDS HERE
