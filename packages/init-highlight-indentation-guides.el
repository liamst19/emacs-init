;;------------------------------------------------------------
;; highlight-indentation-guides
;; https://github.com/DarthFennec/highlight-indent-guides
;;
;; This minor mode highlights indentation levels via font-lock. Indent
;; widths are dynamically discovered, which means this correctly
;; highlights in any mode, regardless of indent width, even in
;; languages with non-uniform indentation such as Haskell. By default,
;; this mode also inspects your theme dynamically, and automatically
;; chooses appropriate colors for highlighting. This mode works
;; properly around hard tabs and mixed indentation, and it behaves
;; well in large buffers.
;;
;;------------------------------------------------------------

(use-package highlight-indent-guides
  :ensure t
  :init
  (setq highlight-indent-guides-method    'column
        highlight-indent-guides-character ?\|)
  :hook (prog-mode . highlight-indent-guides-mode))

(provide 'init-highlight-indentation-guides)
