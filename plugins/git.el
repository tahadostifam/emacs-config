(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))
