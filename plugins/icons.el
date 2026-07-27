(use-package material-icon
  :vc (:url "https://github.com/zHaOdANiuu/material-icon.el" :rev :newest)
  :hook ((dired-mode . material-icon-dired-icons-mode)
         (ibuffer-mode . material-icon-ibuffer-icons-mode))
  :init
  (setq material-icon-size 22)
  (with-eval-after-load 'speedbar
    (material-icon-speedbar-icons-mode 1)))
