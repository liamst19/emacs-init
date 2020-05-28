;;------------------------------------------------------------
;; [Package] yasnippet
;; https://github.com/joaotavora/yasnippet
;; 
;; YASnippet is a template system for Emacs. It
;; allows you to type an abbreviation and automatically expand it into
;; function templates. Bundled language templates include: C, C++, C#,
;; Perl, Python, Ruby, SQL, LaTeX, HTML, CSS and more. The snippet
;; syntax is inspired from TextMate's syntax, you can even import most
;; TextMate templates to YASnippet. Watch a demo on YouTube.
;; ------------------------------------------------------------

(use-package yasnippet
  :ensure t
  :defer 4
  :diminish yas-minor-mode
  :config
  (progn
    (global-unset-key (kbd "s-e"))
    (setq-default yas-snippet-dirs '(usr-yasnippet-snippets-dir))
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    (define-key yas-minor-mode-map (kbd "s-e") 'yas-expand)
(yas-global-mode t)))

(use-package yasnippet-snippets
  :ensure t)

(provide 'init-yasnippet)
