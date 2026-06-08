(require 'package)

(setq native-comp-async-report-warnings-errors nil)
(setq package-install-upgrade-built-in t)
(setq package-check-signature nil)

(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("gnu-devel" . "https://elpa.gnu.org/devel/")))

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
(load-file "~/.emacs.d/plugins/sideline.el")
(load-file "~/.emacs.d/plugins/search.el")
(load-file "~/.emacs.d/plugins/sidebar.el")
(load-file "~/.emacs.d/plugins/fold.el")
(load-file "~/.emacs.d/plugins/markdown.el")

(load-file "~/.emacs.d/plugins/cyrus-mode.el")

;; Themes
(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))

(load-theme 'skull :no-confirm)
