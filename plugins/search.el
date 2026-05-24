(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package consult
  :ensure t
  :bind (("C-s" . consult-line)
         ("C-c f" . consult-ripgrep)
         ("C-x b" . consult-buffer)))
