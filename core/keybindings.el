(global-set-key (kbd "C-x h") #'mark-whole-buffer)

(defun my/build-and-run ()
  (interactive)
  (compile "make && ./main"))

(global-set-key (kbd "<f5>") #'my/build-and-run)
