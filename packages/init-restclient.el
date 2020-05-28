;;------------------------------------------------------------
;; [Package] restclient.el
;;
;; https://github.com/pashky/restclient.el
;;
;; This is a tool to manually explore and test HTTP REST
;; webservices. Runs queries from a plain-text query sheet, displays
;; results as a pretty-printed XML, JSON and even images.
;;
;;------------------------------------------------------------

(use-package restclient
  :ensure t
  :mode
  ("\\.rest\\'"
  )

(provide 'init-restclient)
