(use-package telega
  :ensure t
  :config
  ;; Login settings
  (setq telega-use-dbus t)
  
  ;; Auto-start when opening
  (setq telega-auto-start t)
  
  ;; Show images inline
  (setq telega-image-use-resize t)
  
  ;; Enable notifications
  (setq telega-notifications-enable t)
  
  ;; Start Telega
  (telega))
