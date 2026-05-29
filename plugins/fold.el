(use-package hideshow
  :ensure nil
  :hook (prog-mode . hs-minor-mode)

  :config
  ;; Prefix key (C-k)
  (global-unset-key (kbd "C-k"))
  (define-prefix-command 'my/fold-map)
  (global-set-key (kbd "C-k") 'my/fold-map)

  ;; Fold / unfold current block
  (define-key my/fold-map (kbd "[") #'hs-hide-block)
  (define-key my/fold-map (kbd "]") #'hs-show-block)

  ;; Fold all / unfold all
  (define-key my/fold-map (kbd "0") #'hs-hide-all)
  (define-key my/fold-map (kbd "9") #'hs-show-all)

  ;; FIXED: correct hs-native level folding
  (defun my/hs-hide-level (level)
    "Hide all blocks deeper than LEVEL using hs-hide-level."
    (interactive "nFold level: ")
    (hs-show-all)
    (hs-hide-level level))

  ;; Level-based folding (NOW WORKING CORRECTLY)
  (define-key my/fold-map (kbd "1")
              (lambda () (interactive) (my/hs-hide-level 1)))

  (define-key my/fold-map (kbd "2")
              (lambda () (interactive) (my/hs-hide-level 2)))

  (define-key my/fold-map (kbd "3")
              (lambda () (interactive) (my/hs-hide-level 3)))

  (define-key my/fold-map (kbd "4")
              (lambda () (interactive) (my/hs-hide-level 4))))

