;; Tree-sitter major mode remapping
(setq major-mode-remap-alist
      '((rust-mode . rust-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (python-mode . python-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (js-mode . js-ts-mode)))

;; File associations
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))

(use-package eglot
  :ensure nil
  :hook ((rust-ts-mode . eglot-ensure)
         (c-ts-mode . eglot-ensure)
         (c++-ts-mode . eglot-ensure)
         (python-ts-mode . eglot-ensure)
         (typescript-ts-mode . eglot-ensure)
         (tsx-ts-mode . eglot-ensure)
         (js-ts-mode . eglot-ensure)
         (bash-ts-mode . eglot-ensure))

  :config
  (setq eglot-events-buffer-size 0)
  (setq eglot-autoshutdown t)

  ;; C/C++
  (add-to-list 'eglot-server-programs
               '((c-ts-mode c++-ts-mode)
                 . ("clangd"
                    "--background-index"
                    "--clang-tidy"
                    "--header-insertion=iwyu")))

  ;; TypeScript / JavaScript
  (add-to-list 'eglot-server-programs
               '((typescript-ts-mode tsx-ts-mode js-ts-mode)
                 . ("typescript-language-server" "--stdio")))

  ;; Rust
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode)
                 . ("rust-analyzer"))))

(use-package corfu
  :ensure t

  :init
  (global-corfu-mode)

  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 1)
  (corfu-cycle t)

  :config
  ;; TAB completes current selection
  (setq tab-always-indent 'complete)

  ;; Enable popup info
  (corfu-popupinfo-mode))

;; Optional but recommended
(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters
               #'kind-icon-margin-formatter))


;; Better completion commands
(use-package emacs
  :ensure nil
  :custom
  (tab-always-indent 'complete)
  (completion-cycle-threshold 3))

;; Optional: richer annotations
(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

;; Optional: minibuffer completion improvements
(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

