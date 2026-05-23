(setq interprogram-cut-function
      (lambda (text &optional push)
        (let ((process-connection-type nil))
          (let ((proc (start-process "wl-copy" "*Messages*" "wl-copy")))
            (process-send-string proc text)
            (process-send-eof proc)))))

(setq interprogram-paste-function
      (lambda ()
        (shell-command-to-string "wl-paste --no-newline")))
