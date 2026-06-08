(defvar cyrus-mode-hook nil)

(defvar cyrus-mode-syntax-table
  (let ((table (make-syntax-table)))

    ;; // comments
    (modify-syntax-entry ?/ ". 124b" table)
    (modify-syntax-entry ?* ". 23" table)
    (modify-syntax-entry ?\n "> b" table)

    ;; strings
    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?\' "\"" table)

    table)
  "Syntax table for Cyrus mode.")

(defconst cyrus-keywords
  '("if" "else" "goto"
    "for" "foreach" "while"
    "switch" "case" "default"
    "break" "continue" "return"
    "repr" "align"
    "pub" "mod"
    "defer"
    "fn"
    "import" "as"
    "var" "const"
    "type"
    "dynamic"
    "struct"
    "enum"
    "union"
    "interface"
    "macro"
    "weak"
    "linkonce"
    "callconv"
    "naked"
    "noreturn"
    "hot"
    "cold"
    "dllimport"
    "dllexport"
    "optsize"
    "optnone"
    "no_sanitize"
    "nounwind"
    "section"
    "extern"
    "inline"))

(defconst cyrus-builtin-types
  '("int"
    "int8" "int16" "int32" "int64" "int128"
    "uint"
    "uint8" "uint16" "uint32" "uint64" "uint128"
    "intptr" "uintptr"
    "isize" "usize"
    "float16" "float32" "float64" "float128"
    "bool"
    "char"
    "void"
    "any"))

(defconst cyrus-constants
  '("true" "false" "null" "undefined"))

(defconst cyrus-font-lock-keywords
  `(
    ;; keywords
    (,(regexp-opt cyrus-keywords 'symbols)
     . font-lock-keyword-face)

    ;; constants
    (,(regexp-opt cyrus-constants 'symbols)
     . font-lock-constant-face)

    ;; builtin types
    (,(regexp-opt cyrus-builtin-types 'symbols)
     . font-lock-type-face)

    ;; suffixed numbers
    ("\\_<[0-9][0-9_]*\\(int\\(8\\|16\\|32\\|64\\|128\\)\\|float\\(16\\|32\\|64\\|128\\)\\)\\_>"
     . font-lock-constant-face)

    ;; decimal numbers
    ("\\_<[0-9][0-9_]*\\(\\.[0-9_]+\\)?\\([eE][+-]?[0-9_]+\\)?\\_>"
     . font-lock-constant-face)

    ;; fn declarations
    ("\\_<fn\\_>\\s-+\\([A-Za-z_][A-Za-z0-9_]*\\)"
     1 font-lock-function-name-face)

    ;; macro declarations
    ("\\_<macro\\_>\\s-+\\([A-Za-z_][A-Za-z0-9_]*\\)"
     1 font-lock-function-name-face)

    ;; function calls
    ("\\_<\\([A-Za-z_][A-Za-z0-9_]*\\)\\s-*("
     1 font-lock-function-name-face)

    ;; var declarations
    ("\\_<var\\_>\\s-+\\([A-Za-z_][A-Za-z0-9_]*\\)"
     1 font-lock-variable-name-face)

    ;; const declarations
    ("\\_<const\\_>\\s-+\\([A-Za-z_][A-Za-z0-9_]*\\)"
     1 font-lock-variable-name-face)

    ;; parameters
    ("\\([A-Za-z_][A-Za-z0-9_]*\\)\\s-*:"
     1 font-lock-variable-name-face)

    ;; labels
    ("\\_<\\([A-Za-z_][A-Za-z0-9_]*\\)\\s-*:"
     1 font-lock-preprocessor-face)

    ;; namespace before ::
    ("\\_<\\([A-Za-z_][A-Za-z0-9_]*\\)::"
     1 font-lock-type-face)

    ;; enum members
    ("\\_<[A-Za-z_][A-Za-z0-9_]*::\\([A-Za-z_][A-Za-z0-9_]*\\)\\_>"
     1 font-lock-constant-face)

    ;; properties
    ("\\.\\([A-Za-z_][A-Za-z0-9_]*\\)"
     1 font-lock-variable-name-face)

    ;; type annotations
    (":\\s-*\\([A-Za-z_][A-Za-z0-9_]*\\)"
     1 font-lock-type-face)
    ))

;;;###autoload
(define-derived-mode cyrus-mode prog-mode "Cyrus"
  "Major mode for the Cyrus programming language."

  :syntax-table cyrus-mode-syntax-table

  (setq-local font-lock-defaults
              '(cyrus-font-lock-keywords))

  (setq-local comment-start "// ")
  (setq-local comment-end ""))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.cyrus\\'" . cyrus-mode))

(provide 'cyrus-mode)

