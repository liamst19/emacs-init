;;------------------------------------------------------------
;; [Package] Auctex
;;------------------------------------------------------------

(use-package auctex
  :defer t
  :ensure t
  :init (progn
          (add-hook 'LaTeX-mode-hook 'visual-line-mode)
          (add-hook 'LaTeX-mode-hook 'flyspell-mode)
          (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
          (add-hook 'LaTeX-mode-hook 'turn-on-reftex))
  :config (progn
            (setq TeX-auto-save t)
            (setq TeX-parse-self t)
            (setq-default TeX-master nil)
            (setq reftex-plug-into-AUCTeX t)
            (setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem
            ;; Compile documents to PDF by default
            (setq TeX-PDF-mode t)))

(provide 'init-auctex)
