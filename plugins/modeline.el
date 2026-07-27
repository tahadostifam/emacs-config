(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1)
  
  (setq telephone-line-primary-left-separator 'telephone-line-erc-left)
  (setq telephone-line-primary-right-separator 'telephone-line-erc-right)
  
  ;; Left: Everything about the file
  (setq telephone-line-lhs
        '((evil   . (telephone-line-evil-tag-segment))
          (accent . (telephone-line-vc-segment))
          (nil    . (telephone-line-projectile-segment
                     telephone-line-buffer-name-segment
                     telephone-line-major-mode-segment))))
  
  ;; Right: Position, encoding, line endings, time
  (setq telephone-line-rhs
        '((nil    . (telephone-line-position-segment
                     telephone-line-column-segment))
          (accent . (telephone-line-buffer-encoding-segment
                     telephone-line-eol-segment
                     telephone-line-time-segment)))))
