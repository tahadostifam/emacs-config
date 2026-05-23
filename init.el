(require 'package)

(setq native-comp-async-report-warnings-errors nil)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Core
(load-file "~/.emacs.d/core/keybindings.el")
(load-file "~/.emacs.d/core/editing.el")
(load-file "~/.emacs.d/core/clipboard.el")
(load-file "~/.emacs.d/core/ui.el")

;; Plugins
(load-file "~/.emacs.d/plugins/eglot.el")
(load-file "~/.emacs.d/plugins/git.el")
(load-file "~/.emacs.d/plugins/todos.el")

;; Themes
(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))

(load-theme 'skull :no-confirm)
