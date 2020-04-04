;;------------------------------------------------------------
;; [Package] Markdown Mode
;;------------------------------------------------------------

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md.txt\\'" . markdown-mode)
         ("\\.Markdown.txt\\'" . markdown-mode))
  :init (setq-default markdown-hide-markup t))

(defun markdown-setup ()
  (interactive)
  (visual-line-mode 1)
  (setq buffer-face-mode-face
        '(:family "iA Writer Quattro S"
                  :height 125
                  :foreground "#aba7a0"))
  (buffer-face-mode)
  (setq line-spacing 3)
  (setq left-margin-width 5)
  (setq right-margin-width 5)
  (flyspell-mode 1)
  (setq global-hl-line-mode nil)
  (setq header-line-format " "))
(add-hook 'markdown-mode-hook #'markdown-setup)
(add-hook 'markdown-mode-hook 'prettify-symbols-mode)
(add-hook 'markdown-mode-hook (lambda () (linum-mode 0)))

(provide 'init-markdown)
