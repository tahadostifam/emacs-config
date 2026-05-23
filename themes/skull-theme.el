(deftheme skull "Minimal green cyberpunk theme")

(provide-theme 'skull)

(let ((my-bg "#0a0a0a")
      (my-fg "#bfbfbf")

      (my-green "#03ff28")
      (my-yellow "#c2a200")
      (my-gray "#6c6c6c")

      (my-blue "#4da3ff")
      (my-cyan "#00e5ff")
      (my-magenta "#ff4df0"))

  (custom-theme-set-faces
   'skull

   ;; Base
   `(default ((t (:background ,my-bg :foreground ,my-fg))))
   `(cursor ((t (:background ,my-green))))
   `(region ((t (:background "#1a1a1a"))))
   `(highlight ((t (:background "#151515"))))
   `(shadow ((t (:foreground ,my-gray))))

   ;; Syntax
   `(font-lock-comment-face
     ((t (:foreground ,my-gray :slant italic))))

   `(font-lock-string-face
     ((t (:foreground ,my-yellow))))

   `(font-lock-keyword-face
     ((t (:foreground ,my-green :weight bold))))

   `(font-lock-function-name-face
     ((t (:foreground ,my-cyan :weight bold))))

   `(font-lock-type-face
     ((t (:foreground ,my-blue))))

   `(font-lock-variable-name-face
     ((t (:foreground ,my-fg))))

   `(font-lock-constant-face
     ((t (:foreground ,my-magenta))))

   `(font-lock-builtin-face
     ((t (:foreground ,my-cyan))))

   `(font-lock-preprocessor-face
     ((t (:foreground ,my-magenta))))

   ;; UI
   `(fringe ((t (:background ,my-bg))))

   `(line-number
     ((t (:background ,my-bg
                      :foreground ,my-gray))))

   `(line-number-current-line
     ((t (:background ,my-bg
                      :foreground ,my-green
                      :weight bold))))

   ;; Mode line
   `(mode-line
     ((t (:background "#111111"
                      :foreground ,my-green
                      :box nil))))

   `(mode-line-inactive
     ((t (:background "#070707"
                      :foreground ,my-gray
                      :box nil))))

   ;; Borders
   `(vertical-border
     ((t (:foreground "#1a1a1a"))))

   `(window-divider
     ((t (:foreground "#1a1a1a"))))

   ;; Minibuffer
   `(minibuffer-prompt
     ((t (:foreground ,my-green :weight bold))))

   ;; Search
   `(isearch
     ((t (:background ,my-green
                      :foreground "#000000"
                      :weight bold))))

   `(lazy-highlight
     ((t (:background "#16351c"
                      :foreground ,my-fg))))

   ;; Diff / Git
   `(diff-added
     ((t (:foreground ,my-green))))

   `(diff-removed
     ((t (:foreground "#ff5555"))))

   `(diff-changed
     ((t (:foreground ,my-yellow))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

