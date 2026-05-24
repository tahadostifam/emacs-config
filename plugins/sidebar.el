;; (use-package projectile
;;   :ensure t
;;   :init
;;   (projectile-mode 1)

;;   :bind-keymap
;;   ("C-c p" . projectile-command-map)

;;   :config
;;   ;; Optional: cache projects for faster indexing
;;   (setq projectile-enable-caching t))

;; (use-package treemacs
;;   :ensure t
;;   :defer t
;;   :bind
;;   ("C-c t" . treemacs)

;;   :config
;;   ;; Sidebar width
;;   (setq treemacs-width 35)

;;   ;; Better visuals
;;   (treemacs-follow-mode t)
;;   (treemacs-filewatch-mode t)
;;   (treemacs-fringe-indicator-mode 'always)

;;   ;; Optional: git integration if available
;;   (when (executable-find "git")
;;     (treemacs-git-mode 'deferred)))

;; (use-package treemacs-projectile
;;   :ensure t
;;   :after (treemacs projectile))

;; (use-package treemacs-magit
;;   :ensure t
;;   :after (treemacs magit))
