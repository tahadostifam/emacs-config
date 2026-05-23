(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode))
  :config
  (setq markdown-fontify-code-blocks-natively t))

(setq markdown-hide-markup t)

(use-package grip-mode
  :ensure t)
