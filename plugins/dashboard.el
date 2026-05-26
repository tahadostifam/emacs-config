(use-package dashboard
  :ensure t
  :config

  (setq dashboard-items nil)
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)

  ;; Banner
  (setq dashboard-startup-banner 'official)
  (setq dashboard-banner-logo-title "Legends Never Die")

  ;; Remove ALL noise
  (setq dashboard-set-init-info nil)
  (setq dashboard-set-footer nil)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-set-heading-icons nil)
  (setq dashboard-set-file-icons nil)

  (setq dashboard-footer-messages '("Build systems, not excuses."))

  (setq dashboard-startupify-list '(dashboard-insert-banner
                                  dashboard-insert-newline
                                  dashboard-insert-banner-title))


  ;; IMPORTANT: delay rendering until frame is ready
  (add-hook 'emacs-startup-hook
            (lambda ()
              (run-at-time 0.1 nil #'dashboard-refresh-buffer)))
  
  (dashboard-setup-startup-hook)

  ;; Startup buffer
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

(defun my/close-dashboard-on-first-file ()
  (when (get-buffer "*dashboard*")
    (kill-buffer "*dashboard*")))

(add-hook 'find-file-hook #'my/close-dashboard-on-first-file)
