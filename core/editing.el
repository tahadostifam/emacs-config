(setq-default indent-tabs-mode nil)

(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package whitespace-cleanup-mode
  :ensure t
  :config
  (setq whitespace-cleanup-mode-only-if-initially-clean t)
  (global-whitespace-cleanup-mode 1))
