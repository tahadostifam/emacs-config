;;; Sophisticated Modeline Configuration

;; 1. Define Custom Faces
(defface my-modeline-buffer-name-face
  '((t (:inherit bold :foreground "#ffffff" :background "#3355bb")))
  "Face for buffer name in modeline.")

(defface my-modeline-modified-face
  '((t (:inherit bold :foreground "#ff6b6b")))
  "Face for modified status.")

(defface my-modeline-unmodified-face
  '((t (:inherit bold :foreground "#51cf66")))
  "Face for unmodified status.")

(defface my-modeline-error-face
  '((t (:inherit bold :foreground "#ff0000" :weight bold)))
  "Face for error count.")

(defface my-modeline-warning-face
  '((t (:inherit bold :foreground "#ffa500")))
  "Face for warning count.")

(defface my-modeline-branch-face
  '((t (:inherit bold :foreground "#fcc419")))
  "Face for git branch name.")

(defface my-modeline-position-face
  '((t (:inherit bold :foreground "#74c0fc")))
  "Face for position info.")

(defface my-modeline-major-mode-face
  '((t (:inherit bold :foreground "#cc5de8")))
  "Face for major mode.")

(defface my-modeline-minor-mode-face
  '((t (:foreground "#adb5bd")))
  "Face for minor modes.")

;; 2. Helper Functions

;; Buffer status with emoji
(defun my-modeline-buffer-status ()
  "Return buffer status with emoji."
  (cond
   ((buffer-modified-p)   "🟠")   ; Modified (unsaved)
   ((buffer-file-name)    "🟢")   ; Saved file
   ((not (buffer-file-name)) "🟡") ; Scratch/unsaved buffer
   (t "⚪")))                     ; Other

;; Git branch name
(defun my-modeline-git-branch ()
  "Return current git branch or empty string."
  (let ((branch (vc-mode-line buffer-file-name)))
    (if (and branch (string-match "Git[:(]\\([^)]+\\)" branch))
        (propertize (format "  🌿 %s" (match-string 1 branch))
                    'face 'my-modeline-branch-face)
      "")))

;; Error and warning count
(defun my-modeline-flymake-status ()
  "Return Flymake/Flycheck error and warning count."
  (cond
   ((and (fboundp 'flymake-mode) flymake-mode)
    (let ((errors 0) (warnings 0))
      (dolist (diag (flymake-diagnostics))
        (pcase (flymake-diagnostic-type diag)
          (:error (cl-incf errors))
          (:warning (cl-incf warnings))))
      (cond
       ((> errors 0) 
        (propertize (format " 🔴 %d" errors) 'face 'my-modeline-error-face))
       ((> warnings 0)
        (propertize (format " 🟡 %d" warnings) 'face 'my-modeline-warning-face))
       (t " ✅"))))
   
   ((and (fboundp 'flycheck-mode) flycheck-mode)
    (let* ((errors (flycheck-count-errors (flycheck-current-errors)))
           (error-count (cdr (assq 'error errors)))
           (warning-count (cdr (assq 'warning errors))))
      (cond
       ((and error-count (> error-count 0))
        (propertize (format " 🔴 %d" error-count) 'face 'my-modeline-error-face))
       ((and warning-count (> warning-count 0))
        (propertize (format " 🟡 %d" warning-count) 'face 'my-modeline-warning-face))
       (t " ✅"))))
   (t "  ")))

;; Position with line/column
(defun my-modeline-position ()
  "Return line and column info."
  (let* ((line (line-number-at-pos))
         (col (current-column))
         (total-lines (line-number-at-pos (point-max)))
         (percentage (if (> total-lines 0)
                         (round (/ (* line 100.0) total-lines))
                       0)))
    (propertize (format " %s%%  L%s:%s" percentage line (1+ col))
                'face 'my-modeline-position-face)))

;; Buffer name with emoji status
(defun my-modeline-buffer-name ()
  "Return buffer name with status emoji."
  (let* ((name (buffer-name))
         (status (my-modeline-buffer-status))
         (full-name (format " %s %s " status name)))
    (propertize full-name
                'face 'my-modeline-buffer-name-face
                'help-echo "Buffer name"
                'keymap (let ((map (make-sparse-keymap)))
                          (define-key map [mode-line mouse-1]
                            'mode-line-other-buffer)
                          map))))

;; Major mode with icon
(defun my-modeline-major-mode ()
  "Return major mode with proper face."
  (let* ((mode-name (symbol-name major-mode))
         (pretty-name (replace-regexp-in-string "-mode$" "" mode-name)))
    (propertize (format " 🐍 %s " (capitalize pretty-name))
                'face 'my-modeline-major-mode-face
                'help-echo (format "Major mode: %s" mode-name))))

;; Minor modes (only show important ones)
(defun my-modeline-minor-modes ()
  "Return important minor modes."
  (let ((modes '())
        (important-modes '(company-mode flymake-mode flyspell-mode
                         abbrev-mode auto-fill-mode)))
    (dolist (mode important-modes)
      (when (and (boundp mode) (symbol-value mode))
        (push (symbol-name mode) modes)))
    (if modes
        (propertize (format " [%s]" (string-join modes " "))
                    'face 'my-modeline-minor-mode-face)
      "")))

;; 3. Main Mode Line Format

(setq-default mode-line-format
              '("%e"
                ;; Left side
                (:eval (my-modeline-buffer-name))
                " "
                (:eval (my-modeline-git-branch))
                " "
                (:eval (my-modeline-position))
                " "
                (:eval (my-modeline-major-mode))
                " "
                (:eval (my-modeline-minor-modes))
                
                ;; Spacer to push to right
                mode-line-format-right-align
                
                ;; Right side
                (:eval (my-modeline-flymake-status))
                " "
                mode-line-misc-info
                " "
                mode-line-end-spaces))

;; 4. Alternative: With Doom Modeline style

;; If you want even more features, enable this instead
(defun my-sophisticated-modeline ()
  "Apply sophisticated modeline configuration."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  ;; Left
                  (:eval (my-modeline-buffer-name))
                  " "
                  (:eval (my-modeline-git-branch))
                  " "
                  (:eval (my-modeline-position))
                  " "
                  (:eval (my-modeline-major-mode))
                  " "
                  (:eval (my-modeline-minor-modes))
                  
                  ;; Center (optional, for space)
                  (:eval (when (mode-line-window-selected-p)
                           (propertize " " 'display '(space :align-to center))))
                  
                  ;; Right
                  (:eval (my-modeline-flymake-status))
                  " "
                  mode-line-misc-info
                  " "
                  (which-function-mode
                   (:eval (when (and (boundp 'which-function-mode)
                                     which-function-mode)
                            (let ((func (which-function)))
                              (when func
                                (propertize (format " %s" func)
                                            'face 'font-lock-function-name-face))))))
                  " "
                  mode-line-end-spaces)))

;; 5. Optional: Add modeline flashing on error

(defvar my-modeline-flash-timer nil
  "Timer for flashing modeline.")

(defun my-modeline-flash (color)
  "Flash modeline with COLOR."
  (let ((original-face (face-attribute 'mode-line :background)))
    (set-face-attribute 'mode-line nil :background color)
    (force-mode-line-update)
    (when my-modeline-flash-timer
      (cancel-timer my-modeline-flash-timer))
    (setq my-modeline-flash-timer
          (run-at-time 0.5 nil
                       (lambda ()
                         (set-face-attribute 'mode-line nil :background original-face)
                         (force-mode-line-update)
                         (setq my-modeline-flash-timer nil))))))

;; Flash red on error
(defun my-modeline-error-flash ()
  "Flash modeline red when error occurs."
  (my-modeline-flash "#ff0000"))

;; Flash yellow on warning
(defun my-modeline-warning-flash ()
  "Flash modeline yellow when warning occurs."
  (my-modeline-flash "#ffa500"))

;; Add hooks for Flymake/Flycheck
(add-hook 'flymake-diagnostic-functions
          (lambda ())
          t)

;; 6. Modeline click actions

(defun my-modeline-buffer-menu ()
  "Show buffer menu when clicking buffer name."
  (interactive)
  (ibuffer))

(defun my-modeline-git-menu ()
  "Show git status when clicking branch."
  (interactive)
  (magit-status-default))

;; Add keymap to modeline
(defvar my-modeline-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map [mode-line mouse-1] 'my-modeline-buffer-menu)
    (define-key map [mode-line mouse-3] 'my-modeline-git-menu)
    map))

;; 7. Apply configuration

;; Enable modeline features
(column-number-mode 1)
(line-number-mode 1)
(size-indication-mode 1)
(which-function-mode 1)

;; Apply the modeline
(my-sophisticated-modeline)

;; Force update
(force-mode-line-update)
