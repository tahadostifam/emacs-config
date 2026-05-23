(use-package sideline
  :ensure t
  :hook (flymake-mode . sideline-mode)
  :custom
  (sideline-backends-right '(sideline-flymake))
  (sideline-order-right 'down)
  (sideline-format-right " %s ")
  (sideline-priority 100))

(use-package sideline-flymake
  :ensure t)

(setq sideline-flymake-display-current-line-only t)

(setq eldoc-echo-area-use-multiline-p t)
