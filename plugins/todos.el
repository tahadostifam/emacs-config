(setq-default comment-start-skip "//+\\|/\\*+\\|#+\\|;")

(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"  . "#03ff28")   ;; green
          ("FIXME" . "#ff4df0")   ;; magenta
          ("BUG"   . "#ff5555")   ;; red
          ("NOTE"  . "#4da3ff")   ;; blue
          ("HACK"  . "#c2a200")   ;; yellow
          ("REVIEW". "#00e5ff")))) ;; cyan
