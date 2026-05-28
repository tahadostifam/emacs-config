;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Line numbers
(global-display-line-numbers-mode 1)

(setq tab-always-indent 'complete)

(global-set-key (kbd "TAB") #'indent-for-tab-command)

(use-package windmove
  :ensure nil
  :bind*
  (("M-<left>" . windmove-left)
   ("M-<right>" . windmove-right)
   ("M-<up>" . windmove-up)
   ("M-<down>" . windmove-down)))
