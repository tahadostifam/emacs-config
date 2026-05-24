(use-package eglot
  :ensure nil
  :hook ((rust-mode . eglot-ensure)
         (c-mode . eglot-ensure)
         (c++-mode . eglot-ensure)
         (python-mode . eglot-ensure)

         ;; TypeScript
         (typescript-ts-mode . eglot-ensure)
         (tsx-ts-mode . eglot-ensure)
         (js-ts-mode . eglot-ensure))

  :config
  ;; Performance
  (setq eglot-events-buffer-size 0)

  ;; Auto shutdown unused servers
  (setq eglot-autoshutdown t)

  ;; Clangd
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode)
                 . ("clangd"
                    "--background-index"
                    "--clang-tidy"
                    "--header-insertion=iwyu")))

  ;; TypeScript / JavaScript
  (add-to-list 'eglot-server-programs
               '((typescript-ts-mode
                  tsx-ts-mode
                  js-ts-mode)
                 . ("typescript-language-server" "--stdio"))))
