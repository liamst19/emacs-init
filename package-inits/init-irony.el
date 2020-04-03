;;------------------------------------------------------------
;; [Package] Irony
;; https://github.com/Sarcasm/irony-mode
;;
;; irony-mode is an Emacs minor-mode that aims at improving the
;; editing experience for the C, C++ and Objective-C languages.
;; It works by using a combination of an Emacs package and a
;; C++ program (irony-server) exposing libclang.
;;------------------------------------------------------------

(use-package irony
  :ensure t
  :config
  (progn
    (add-hook 'c++-mode-hook   'irony-mode)
    (add-hook 'c-mode-hook     'irony-mode)
    (add-hook 'objc-mode-hook  'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    ;; Windows performance tweaks
    (when (boundp 'w32-pipe-read-delay)
      (setq w32-pipe-read-delay 0))
    ;; Set the buffer size to 64K on Windows
    ;; (from the original 4K)
    (when (boundp 'w32-pipe-buffer-size)
      (setq irony-server-w32-pipe-buffer-size (* 64 1024)))))

(use-package company-irony
  :ensure t
  :config
  (push 'company-irony company-backends))

(use-package company-irony-c-headers
  :ensure t
  :config
  (push 'company-irony-c-headers company-backends))
;;  :hook (irony-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-irony-c-headers)))))

(use-package flycheck-irony
  :ensure t
  :config
  (progn
    (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

(provide 'init-irony)
