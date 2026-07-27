# Emacs Conf

Personal Emacs configuration with a modular structure, custom "skull" theme, and
support for development in Rust, C/C++, Python, TypeScript/JavaScript, and more.

## Installation

### Prerequisites

- Emacs 29+ (with native-comp support recommended)
- Git
- For Wayland: `wl-clipboard` (`wl-copy` / `wl-paste`)
- For LSP: Language servers for your languages (see below)

### Steps

```bash
# Clone the repository
git clone <your-repo-url> ~/.emacs.d

# Launch Emacs — packages will install automatically
emacs
```

On first launch, Emacs will:
1. Install `use-package` (if not built-in)
2. Install all configured packages from ELPA/MELPA
3. Load the "skull" theme
4. Open treemacs sidebar

### Language Servers (Optional)

Install the language servers you need:

```bash
# Rust
rustup component add rust-analyzer

# C/C++
sudo apt install clangd-14  # or your distro's equivalent

# Python
pip install python-lsp-server

# TypeScript / JavaScript
npm install -g typescript typescript-language-server

# Bash
npm install -g bash-language-server
```

## Packages

### Completion & Search
vertico, consult, corfu, cape, kind-icon

### Git
magit, diff-hl

### Project & File Tree
projectile, treemacs, treemacs-projectile, treemacs-magit

### Editing
multiple-cursors

### Interface
doom-modeline, nerd-icons, sideline, sideline-flymake, hl-todo, windmove

### Major Modes
web-mode, yaml-mode, json-mode, toml-mode, cyrus-mode (custom)

### LSP
eglot, rust-analyzer, clangd, python-lsp-server, typescript-language-server, bash-language-server

## Keybindings

### General Editing
C-x h -> mark-whole-buffer (select entire buffer)
TAB -> indent-for-tab-command (indent line / completion)
C-c + -> text-scale-increase (increase font size)
C-c - -> text-scale-decrease (decrease font size)
<f5> -> my/build-and-run (run `make && ./main`)

### Multiple Cursors
C-> -> mc/mark-next-like-this (add cursor at next occurrence)
C-< -> mc/mark-previous-like-this (add cursor at previous occurrence)
C-c C-< -> mc/mark-all-like-this (add cursor at all occurrences)

### Search & Navigation
C-s -> consult-line (search current buffer)
C-S-f -> consult-grep (search across files / project)
M-s f -> consult-find (find files in project)
M-s l -> consult-line-multi (search across all buffers)
M-s k -> consult-keep-lines (filter buffer lines)
M-s u -> consult-focus-lines (focus on matching lines)
C-x b -> consult-buffer (switch buffers / recent files)

### Window Navigation
M-<left> -> windmove-left (move to window on the left)
M-<right> -> windmove-right (move to window on the right)
M-<up> -> windmove-up (move to window above)
M-<down> -> windmove-down (move to window below)

### Project & File Tree
C-c p -> projectile-command-map (projectile commands prefix)
C-c t -> treemacs (toggle file tree sidebar)

### Git (Magit)
C-x g -> magit-status (open Magit status buffer)

### Code Folding (prefix: C-k)
C-k [ -> hs-hide-block (hide current block)
C-k ] -> hs-show-block (show current block)
C-k 0 -> hs-hide-all (hide all blocks)
C-k 9 -> hs-show-all (show all blocks)
C-k 1, C-k 2, C-k 3, C-k 4 -> fold to depth 1-4

## Emacs Beginner's Guide

### Basic Terminology

- **Buffer** — An open file (or scratch space) in memory
- **Window** — A pane showing a buffer
- **Frame** — A full Emacs window (like a GUI window)
- **Point** — The cursor position
- **Mark** — A saved position (for selections)
- **Minibuffer** — The command line at the bottom
- **Mode line** — The status bar at the bottom of each window

### Essential Concepts

#### The Meta (M-) and Control (C-) Modifiers

- `C-` means hold **Ctrl**
- `M-` means hold **Alt** (or press **Esc** then release)
- `C-x C-c` means: hold Ctrl, press x, press c, release Ctrl
- `C-c t` means: hold Ctrl, press c, release Ctrl, then press t

### File Operations
C-x C-f -> Find and open a file
C-x C-s -> Save current buffer
C-x C-w -> Write buffer to new filename (Save as)
C-x s -> Save all modified buffers
C-x k -> Kill (close) current buffer
C-x b *scratch* -> Open scratch buffer
C-x C-v -> Reload file from disk
C-x b -> Switch to recently opened files

### Navigation
C-f -> Move forward one character
C-b -> Move backward one character
M-f -> Move forward one word
M-b -> Move backward one word
C-n -> Move to next line
C-p -> Move to previous line
C-a -> Go to start of line
C-e -> Go to end of line
C-v -> Scroll down one screen
M-v -> Scroll up one screen
M-< -> Go to start of file
M-> -> Go to end of file
M-g g -> Jump to line number
C-M-v -> Scroll other window

### Editing
C-x u or C-/ -> Undo last change
C-g then C-/ -> Redo after undo
C-w -> Cut selected region
M-w -> Copy selected region
C-y -> Paste last killed text
M-y -> Cycle through kill ring after C-y
C-d -> Delete character at point
M-d -> Delete word after point
C-k -> Kill (cut) to end of line
C-t -> Swap two characters
M-t -> Swap two words
C-x C-t -> Swap two lines
M-; -> Comment or uncomment region/line
C-M-\ -> Indent selected region

### Selecting (Region)
C-<SPC> -> Start selection at point
M-@ -> Select word
C-S-e -> Drag with Shift + arrow
C-x h -> Mark entire buffer
M-w -> Copy selected text
C-w -> Cut selected text
C-g -> Deactivate mark

### Search and Replace
C-s -> Incremental search (consult-line)
C-r -> Search backward
C-S-f -> Grep across files
M-s f -> Find file in project
M-% -> Find and replace with confirmation
C-M-% -> Replace all without asking (regex)

### Window Management
C-x 2 -> Split window above and below
C-x 3 -> Split window side by side
C-x 0 -> Close current window
C-x 1 -> Keep only current window
C-x o -> Move cursor to other window
M-<left> -> Move to window on the left (this config)
M-<right> -> Move to window on the right (this config)
M-<up> -> Move to window above (this config)
M-<down> -> Move to window below (this config)
C-c LEFT -> winner-undo (undo window layout)
C-c RIGHT -> winner-redo (redo window layout)

### Frame Management
C-x 5 2 -> Create a new frame
C-x 5 0 -> Close current frame
C-x 5 f -> Open file in new frame
C-x 4 f -> Open file in other window

### Buffer Management
C-x b -> consult-buffer with preview
C-x C-b -> Show buffer list
C-x k -> Close current buffer
C-x <right> -> Switch to next buffer
C-x <left> -> Switch to previous buffer
C-x C-v -> Reload from disk

### Dired (File Manager)
C-x d -> Open directory listing
C-x C-j -> dired-jump
(+) Create directory, (C) Copy file, (R) Rename / move, (d then x) Delete file, (Enter) Open file

### Help
C-h k -> What does this key do?
C-h f -> Show help for a function
C-h v -> Show help for a variable
C-h m -> Show help for current major mode
C-h t -> Built-in Emacs tutorial
C-h i -> Open info manual browser
C-h a -> Search commands by keyword
C-h b -> List all keybindings for current buffer
M-x list-packages -> Browse and install packages

### Common Operations

#### Copy from system clipboard (Wayland)
The config integrates with `wl-clipboard` automatically. M-w copies, C-y pastes.

#### Build and run
Press <f5> to run `make && ./main`

#### Change font size
C-c + to increase, C-c - to decrease

#### Code folding
C-k [ to fold, C-k ] to unfold, C-k 1-4 to fold by level

#### Git operations with Magit
C-x g opens Magit status. In Magit: s to stage, S to stage all, c to commit, P to push, F to pull, l to view log, b to checkout branch

#### Sync your config
```bash
cd ~/.emacs.d && git pull
# Restart Emacs or evaluate: M-x eval-buffer in init.el
```

### Built-in Modes
M-x shell, M-x eshell, M-x term, M-x calc, M-x calendar, M-x doctor, M-x tetris, M-x snake

### Useful Emacs Lisp Commands

Run these with M-x:
M-x eval-buffer -> Evaluate (load) entire buffer
M-x eval-region -> Evaluate selected Elisp code
M-x eval-expression -> Evaluate one Elisp expression
M-x toggle-frame-fullscreen -> Toggle fullscreen
M-x global-display-line-numbers-mode -> Toggle line numbers
M-x whitespace-mode -> Show whitespace characters
M-x visual-line-mode -> Soft word wrap
M-x toggle-truncate-lines -> Toggle line truncation
M-x customize -> GUI settings browser

---

## Theme

The **skull** theme is a custom green-on-black cyberpunk dark theme.

## Troubleshooting

**Packages fail to install?**
```elisp
;; In Emacs:
M-x package-refresh-contents
M-x package-install RET <package-name>
```

**Theme not loading?**
- Ensure `skull-theme.el` is in `~/.emacs.d/themes/`
- Run `M-x load-theme RET skull RET`

**Clipboard not working on Wayland?**
- Install `wl-clipboard`: `sudo apt install wl-clipboard`
- Verify `wl-copy` and `wl-paste` are in `$PATH`
