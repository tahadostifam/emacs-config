;; FIXME! 

;;; Markdown Mode - Pure Buffer Preview (No Files)
(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode))
  
  :init
  (setq markdown-command "multimarkdown")  ; Or "pandoc -f markdown -t html"
  (setq markdown-hide-markup t)
  (setq markdown-split-window-direction 'right)
  (setq markdown-wrap-lines t)
  
  ;; Prevent external browser
  (setq markdown-open-command nil)
  
  :bind
  (:map markdown-mode-map
        ;; Your existing binding
        ("C-c C-e" . markdown-do)
        
        ;; Preview in buffer (works!)
        ("C-c C-v" . markdown-export-and-preview)
        ("C-c C-p" . markdown-export-and-preview)
        
        ;; Export to buffer only
        ("C-c C-b" . my/markdown-export-to-buffer))
  
  :config
  ;; Custom: Export to buffer without saving file
  (defun my/markdown-export-to-buffer ()
    "Export markdown to a buffer without saving file."
    (interactive)
    (let ((output-buffer (get-buffer-create "*Markdown Export*")))
      (with-current-buffer output-buffer
        (erase-buffer)
        (insert (markdown-export))
        (goto-char (point-min))
        (set-buffer-modified-p nil)
        (read-only-mode 1))
      (display-buffer output-buffer
                      `(display-buffer-pop-up-window
                        (inhibit-same-window . t)
                        (window-height . 0.5)))
      (message "Markdown exported to buffer!")))
  
  ;; Auto-update on save (optional)
  (defun my/auto-update-markdown-preview ()
    "Update preview when saving markdown file."
    (when (get-buffer "*Markdown Export*")
      (my/markdown-export-to-buffer)))
  
  (add-hook 'after-save-hook #'my/auto-update-markdown-preview))
