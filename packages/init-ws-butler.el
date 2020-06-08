;;-----------------------------------------------------------
;;-[Package] ws-butler -- an unobtrusive way to trim spaces from end of line
;; https://github.com/lewang/ws-butler
;;
;; Only lines touched get trimmed. If the white space at end of buffer
;; is changed, then blank lines at the end of buffer are truncated
;; respecting require-final-newline.
;;
;; Trimming only happens when saving.
;; 
;;------------------------------------------------------------

(use-package ws-butler
  :ensure t
  :hook
  (prog-mode . ws-butler-mode)
  )

(provide 'init-ws-butler)
