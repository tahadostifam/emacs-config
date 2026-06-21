(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

(use-package consult
  :ensure t
  :bind
  (;; Global search with ripgrep
   ;; ("C-S-f" . consult-ripgrep)          ;; Ctrl+Shift+F for global search
   ("C-s" . consult-line)               ;; Search in current file
   ("M-s f" . consult-find)             ;; Search for files
   ("C-S-f" . consult-grep)             ;; Global search
   ("C-x b" . consult-buffer)           ;; Better buffer switching
   ("M-s l" . consult-line-multi)       ;; Search across multiple files
   ("M-s k" . consult-keep-lines)       ;; Keep only lines matching regexp
   ("M-s u" . consult-focus-lines))     ;; Focus on lines matching regexp
  :config
  ;; Set preview delay for live previews
  (setq consult-preview-key 'any)
  ;; Show preview in the minibuffer
  (setq consult-preview-key 'any)
  ;; Keep the minibuffer open after selecting
  (setq consult-after-jump-hook nil))

;; TODO
