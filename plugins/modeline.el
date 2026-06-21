(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 30)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-icon t)
  (setq doom-modeline-buffer-file-name-style 'relative-from-project)
  (setq doom-modeline-vcs-max-length 50)
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-enable-eldoc t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-checker-simple-format t))
