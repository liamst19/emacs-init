;;------------------------------------------------------------
;; Miscellaneous Functions
;;------------------------------------------------------------

;; finds init file
(defun config-emacs ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file user-init-file))
(global-set-key "\C-c\C-i" 'config-emacs)

;; Insert Current Date
(defun current-date ()
  "Insert current date yyyy-mm-dd."
  (interactive)
  (format-time-string "%Y-%m-%d"))

;; Save and kill current buffer
(defun save-and-kill-this-buffer ()
  "Save and kill the current buffer."
  (interactive)
  (save-buffer)
  (kill-this-buffer))

(global-set-key "\C-cx" 'save-and-kill-this-buffer)

;;------------------------------------------------------------
;; Window jumping

(defun prev-window ()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C->") #'other-window)
(global-set-key (kbd "C-<") #'prev-window)

;; -----------------------------------------------------------
;; Unfill Paragraph
;; http://www.emacswiki.org/emacs-test/UnfillParagraph
;; 
;; Unfilling a paragraph joins all the lines in a paragraph into a
;; single line. It is the contrary of FillParagraph. It works where a
;; line ends with a newline character (”\n”) and paragraphs are
;; separated by blank lines.

(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max)))
    (fill-paragraph nil region)))

;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)

;; Unfill Region
;; http://www.emacswiki.org/emacs-test/UnfillRegion
;; Unfilling a region joins all the lines in a paragraph into a single
;; line for each paragraphs in that region. It is the contrary of
;; fill-region, and the idea is based on UnfillParagraph.
;; 
;; You can convert an entire buffer from paragraphs to lines by
;; recording a macro that calls ‘unfill-paragraph’ and moves past the
;; blank-line to the next unfilled paragraph and then executing that
;; macro on the whole buffer, ‘C-u 0 C-x e’

(defun unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
    logical line.  This is useful, e.g., for use with
    `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))

;; Handy key definition
(define-key global-map "\C-\M-Q" 'unfill-region)

;;======================================================================
;;======================================================================
;;======================================================================

(provide 'init-misc)
