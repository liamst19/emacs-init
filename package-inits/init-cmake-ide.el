
;;------------------------------------------------------------
;; [Package] CMake-ide
;; https://github.com/atilaneves/cmake-ide
;;
;; cmake-ide is a package to enable IDE-like features on Emacs for
;; CMake projects. It also supports non-CMake projects as long as a
;; compilation database is generated out-of-band.This includes
;; autocompletion and on-the-fly syntax checking in Emacs for CMake
;; projects with minimal configuration.
;; 
;;------------------------------------------------------------

(use-package cmake-ide
  :ensure t
  :after cc-mode
  :init
  :config
  (cmake-ide-setup))

(provide 'init-cmake-ide)
