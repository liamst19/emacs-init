;;------------------------------------------------------------
;; [Package] Auctex
;;------------------------------------------------------------

(use-package auctex
  :defer t
  :ensure t
  :hook
  (LaTeX-mode . visual-line-mode)
  (LaTeX-mode . flyspell-mode)
  (LaTeX-mode . LaTeX-math-mode)
  (LaTeX-mode . turn-on-reftex)
  :config (progn
            (setq TeX-auto-save t)
            (setq TeX-parse-self t)
            (setq-default TeX-master nil)
            (setq reftex-plug-into-AUCTeX t)
            (setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem
            ;; Compile documents to PDF by default
            (setq TeX-PDF-mode t)))

(provide 'init-auctex)
