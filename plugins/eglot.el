(use-package eglot
  :ensure nil
  :hook ((rust-mode . eglot-ensure)
         (c-mode . eglot-ensure)
         (c++-mode . eglot-ensure)
         (python-mode . eglot-ensure))

  :config
  ;; Performance
  (setq eglot-events-buffer-size 0)

  ;; Auto shutdown unused servers
  (setq eglot-autoshutdown t)

  ;; Optional clangd flags
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode)
                 . ("clangd"
                    "--background-index"
                    "--clang-tidy"
                    "--header-insertion=iwyu"))))
