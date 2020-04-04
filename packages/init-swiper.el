;;------------------------------------------------------------
;; [Package] Swiper
;;
;; Swiper is an alternative to isearch that uses ivy to show an
;; overview of all matches.
;;
;;------------------------------------------------------------

(use-package swiper
  :ensure t)
;;  :bind (("\C-s" . swiper)))

;; Swiper with helm
(use-package swiper-helm
  :ensure t
  :bind (("C-s" . swiper-helm)))

(provide 'init-swiper)
