
;;------------------------------------------------------------
;; [Package] ggtags
;; https://github.com/leoliu/ggtags
;;
;; Emacs frontend to GNU Global source code tagging system. The goal
;; is to make working with GNU Global in Emacs as effortlessly and
;; intuitively as possible and to integrate tightly with standard emacs
;; packages. ggtags.el is tested in Emacs 24 and 25. Patches, feature
;; requests and bug reports are welcome. Thanks.
;;------------------------------------------------------------

(use-package ggtags
  :ensure t
  :commands ggtags-mode
  :diminish ggtags-mode
  :bind (("M-*" . pop-tag-mark)
         ("C-c g s" . ggtags-find-other-symbol)
         ("C-c g h" . ggtags-view-tag-history)
         ("C-c g r" . ggtags-find-reference)
         ("C-c g f" . ggtags-find-file)
         ("C-c g c" . ggtags-create-tags)
         ("C-c g u" . ggtags-update-tags))
         ;; ("M-." . ggtags-find-tag-dwim)
         ;; ("M-," . pop-tag-mark)
         ;; ("C-c <" . ggtags-prev-mark)
         ;; ("C-c >" . ggtags-next-mark))
  :hook
  (c-mode-common . (lambda ()
                     (when (derived-mode-p
                            'c-mode
                            'c++-mode
                            'java-mode asm-mode)
                       (ggtags-mode 1)))))

(provide 'init-ggtags)
