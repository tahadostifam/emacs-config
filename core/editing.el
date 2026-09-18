(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)
(setq standard-indent 4)
(setq indent-line-function 'indent-relative)
(setq tab-always-indent 'complete)

(global-set-key (kbd "TAB") 'insert-4-spaces)
(defun insert-4-spaces ()
  (interactive)
  (insert "    "))

(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package whitespace-cleanup-mode
  :ensure t
  :config
  (setq whitespace-cleanup-mode-only-if-initially-clean t)
  (global-whitespace-cleanup-mode 1))
