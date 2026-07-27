# Emacs Conf

Personal Emacs configuration with a modular structure, custom "skull" theme, and
support for development in Rust, C/C++, Python, TypeScript/JavaScript, and more.

---

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

---

## Packages

### Completion & Search

| Package | Purpose |
|---------|---------|
| [vertico](https://github.com/minad/vertico) | Vertical minibuffer completion |
| [consult](https://github.com/minad/consult) | Enhanced search and navigation commands |
| [corfu](https://github.com/minad/corfu) | In-buffer completion UI (popup) |
| [cape](https://github.com/minad/cape) | Completion-at-point extensions |
| [kind-icon](https://github.com/kind-icon/kind-icon) | Icons in completion popup |

### Git

| Package | Purpose |
|---------|---------|
| [magit](https://magit.vc/) | Git porcelain inside Emacs |
| [diff-hl](https://github.com/dholm/diff-hl) | Highlight uncommitted changes in the fringe |

### Project & File Tree

| Package | Purpose |
|---------|---------|
| [projectile](https://github.com/bbatsov/projectile) | Project management and navigation |
| [treemacs](https://github.com/Alexander-Miller/treemacs) | File tree sidebar |
| treemacs-projectile | Projectile integration for treemacs |
| treemacs-magit | Magit integration for treemacs |

### Editing

| Package | Purpose |
|---------|---------|
| [multiple-cursors](https://github.com/magnars/multiple-cursors.el) | Multiple cursor editing |

### Interface

| Package | Purpose |
|---------|---------|
| [doom-modeline](https://github.com/seagle0128/doom-modeline) | Modern, information-rich mode line |
| [nerd-icons](https://github.com/rainstormstudio/nerd-icons) | Icon font for UI elements |
| [sideline](https://github.com/emacs-sideline/sideline) | Side-line diagnostics display |
| sideline-flymake | Flymake backend for sideline |
| [hl-todo](https://github.com/tarsius/hl-todo) | Highlight TODO/FIXME keywords |
| [windmove](https://www.gnu.org/software/emacs/manual/html_node/emacs/Windmove.html) | Navigate windows with arrow keys (built-in) |

### Major Modes

| Package | Purpose |
|---------|---------|
| [web-mode](https://github.com/fxbois/web-mode) | HTML/CSS/JS editing |
| [yaml-mode](https://github.com/yoshiki/yaml-mode) | YAML files |
| [json-mode](https://github.com/joshwnj/json-mode) | JSON files |
| [toml-mode](https://github.com/ianlancetaylor/toml-mode) | TOML files |
| cyrus-mode (custom) | Custom major mode for Cyrus language |

### LSP

| Tool | Purpose |
|------|---------|
| [eglot](https://github.com/joaotavora/eglot) | Built-in LSP client |
| rust-analyzer | Rust LSP |
| clangd | C/C++ LSP |
| python-lsp-server | Python LSP |
| typescript-language-server | TypeScript/JavaScript LSP |
| bash-language-server | Bash LSP |

---

## Keybindings

### General Editing

| Keybinding | Command | Description |
|------------|---------|-------------|
| `C-x h` | `mark-whole-buffer` | Select entire buffer |
| `TAB` | `indent-for-tab-command` | Indent line / completion |
| `C-c +` | `text-scale-increase` | Increase font size |
| `C-c -` | `text-scale-decrease` | Decrease font size |
| `<f5>` | `my/build-and-run` | Run `make && ./main` |

### Multiple Cursors

| Keybinding | Command | Description |
|------------|---------|-------------|
| `C->` | `mc/mark-next-like-this` | Add cursor at next occurrence |
| `C-<` | `mc/mark-previous-like-this` | Add cursor at previous occurrence |
| `C-c C-<` | `mc/mark-all-like-this` | Add cursor at all occurrences |

### Search & Navigation

| Keybinding | Command | Description |
|------------|---------|-------------|
| `C-s` | `consult-line` | Search current buffer |
| `C-S-f` | `consult-grep` | Search across files (project) |
| `M-s f` | `consult-find` | Find files in project |
| `M-s l` | `consult-line-multi` | Search across all buffers |
| `M-s k` | `consult-keep-lines` | Filter buffer lines |
| `M-s u` | `consult-focus-lines` | Focus on matching lines |
| `C-x b` | `consult-buffer` | Switch buffers / recent files |

### Window Navigation

| Keybinding | Command | Description |
|------------|---------|-------------|
| `M-<left>` | `windmove-left` | Move to window on the left |
| `M-<right>` | `windmove-right` | Move to window on the right |
| `M-<up>` | `windmove-up` | Move to window above |
| `M-<down>` | `windmove-down` | Move to window below |

### Project & File Tree

| Keybinding | Command | Description |
|------------|---------|-------------|
| `C-c p` | `projectile-command-map` | Projectile commands prefix |
| `C-c t` | `treemacs` | Toggle file tree sidebar |

### Git (Magit)

| Keybinding | Command | Description |
|------------|---------|-------------|
| `C-x g` | `magit-status` | Open Magit status buffer |

### Code Folding

Prefix: `C-k`

| Keybinding | Command | Description |
|------------|---------|-------------|
| `C-k [` | `hs-hide-block` | Hide current block |
| `C-k ]` | `hs-show-block` | Show current block |
| `C-k 0` | `hs-hide-all` | Hide all blocks |
| `C-k 9` | `hs-show-all` | Show all blocks |
| `C-k 1` | Fold level 1 | Fold to depth 1 |
| `C-k 2` | Fold level 2 | Fold to depth 2 |
| `C-k 3` | Fold level 3 | Fold to depth 3 |
| `C-k 4` | Fold level 4 | Fold to depth 4 |

---

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

| Command | Keybinding | Description |
|---------|------------|-------------|
| Open file | `C-x C-f` | Find and open a file |
| Save file | `C-x C-s` | Save current buffer |
| Save as | `C-x C-w` | Write buffer to new filename |
| Save all | `C-x s` | Save all modified buffers |
| Close buffer | `C-x k` | Kill (close) current buffer |
| New scratch | `C-x b *scratch*` | Open scratch buffer |
| Revert file | `C-x C-v` | Reload file from disk |
| Recent files | `C-x b` (with consult) | Switch to recently opened files |

### Navigation

| Command | Keybinding | Description |
|---------|------------|-------------|
| Forward char | `C-f` | Move forward one character |
| Backward char | `C-b` | Move backward one character |
| Forward word | `M-f` | Move forward one word |
| Backward word | `M-b` | Move backward one word |
| Next line | `C-n` | Move to next line |
| Previous line | `C-p` | Move to previous line |
| Beginning of line | `C-a` | Go to start of line |
| End of line | `C-e` | Go to end of line |
| Next page | `C-v` | Scroll down one screen |
| Previous page | `M-v` | Scroll up one screen |
| Beginning of buffer | `M-<` | Go to start of file |
| End of buffer | `M->` | Go to end of file |
| Go to line | `M-g g` | Jump to line number |
| Scroll up line | `C-M-v` | Scroll other window |

### Editing

| Command | Keybinding | Description |
|---------|------------|-------------|
| Undo | `C-x u` or `C-/` | Undo last change |
| Redo | `C-g` then `C-/` | Redo after undo |
| Cut (kill) | `C-w` | Cut selected region |
| Copy | `M-w` | Copy selected region |
| Paste (yank) | `C-y` | Paste last killed text |
| Paste previous | `M-y` | Cycle through kill ring after `C-y` |
| Delete char | `C-d` | Delete character at point |
| Delete word | `M-d` | Delete word after point |
| Delete line | `C-k` | Kill (cut) to end of line |
| Transpose chars | `C-t` | Swap two characters |
| Transpose words | `M-t` | Swap two words |
| Transpose lines | `C-x C-t` | Swap two lines |
| Comment/uncomment | `M-;` | Comment or uncomment region/line |
| Indent region | `C-M-\` | Indent selected region |

### Selecting (Region)

| Command | Keybinding | Description |
|---------|------------|-------------|
| Set mark | `C-<SPC>` | Start selection at point |
| Select word | `M-@` | Select word |
| Select to end of line | `C-S-e` | (or drag with Shift + arrow) |
| Select all | `C-x h` | Mark entire buffer |
| Copy region | `M-w` | Copy selected text |
| Cut region | `C-w` | Cut selected text |
| Cancel selection | `C-g` | Deactivate mark |

### Search and Replace

| Command | Keybinding | Description |
|---------|------------|-------------|
| Search buffer | `C-s` | Incremental search (this config: consult-line) |
| Search backward | `C-r` | Search backward |
| Search files | `C-S-f` | Grep across files |
| Find file | `M-s f` | Find file in project |
| Query replace | `M-%` | Find and replace with confirmation |
| Replace all | `C-M-%` | Replace all without asking (regex) |

### Window Management

| Command | Keybinding | Description |
|---------|------------|-------------|
| Split horizontally | `C-x 2` | Split window above and below |
| Split vertically | `C-x 3` | Split window side by side |
| Close window | `C-x 0` | Close current window |
| Close other windows | `C-x 1` | Keep only current window |
| Switch window | `C-x o` | Move cursor to other window |
| Switch to left | `M-<left>` | (this config) |
| Switch to right | `M-<right>` | (this config) |
| Switch to above | `M-<up>` | (this config) |
| Switch to below | `M-<down>` | (this config) |
| Undo window layout | `C-c LEFT` | winner-undo (after winner-mode) |
| Redo window layout | `C-c RIGHT` | winner-redo |

### Frame Management

| Command | Keybinding | Description |
|---------|------------|-------------|
| New frame | `C-x 5 2` | Create a new frame |
| Delete frame | `C-x 5 0` | Close current frame |
| Open file in new frame | `C-x 5 f` | Open file in new frame |
| Open file in other window | `C-x 4 f` | Open file in other window |

### Buffer Management

| Command | Keybinding | Description |
|---------|------------|-------------|
| Switch buffer | `C-x b` | (this config: consult-buffer with preview) |
| List buffers | `C-x C-b` | Show buffer list |
| Kill buffer | `C-x k` | Close current buffer |
| Next buffer | `C-x <right>` | Switch to next buffer |
| Previous buffer | `C-x <left>` | Switch to previous buffer |
| Revert buffer | `C-x C-v` | Reload from disk |

### Dired (File Manager)

| Command | Keybinding | Description |
|---------|------------|-------------|
| Open dired | `C-x d` | Open directory listing |
| Open current directory | `C-x C-j` | (dired-jump) |
| Create directory | `+` | (in dired) |
| Copy file | `C` | (in dired) |
| Rename / move | `R` | (in dired) |
| Delete file | `d` then `x` | (in dired) |
| Open file | `Enter` | (in dired) |

### Help

| Command | Keybinding | Description |
|---------|------------|-------------|
| Describe key | `C-h k` | What does this key do? |
| Describe function | `C-h f` | Show help for a function |
| Describe variable | `C-h v` | Show help for a variable |
| Describe mode | `C-h m` | Show help for current major mode |
| Tutorial | `C-h t` | Built-in Emacs tutorial |
| Manual | `C-h i` | Open info manual browser |
| Apropos | `C-h a` | Search commands by keyword |
| Keybinding help | `C-h b` | List all keybindings for current buffer |
| Package list | `M-x list-packages` | Browse and install packages |

### Common Operations

#### Copy from system clipboard (Wayland)
- The config integrates with `wl-clipboard` automatically
- `M-w` copies to clipboard, `C-y` pastes

#### Build and run
- Press `<f5>` to run `make && ./main`

#### Change font size
- `C-c +` to increase, `C-c -` to decrease

#### Code folding
- Use `C-k [` to fold, `C-k ]` to unfold, `C-k 1`-`4` to fold by level

#### Git operations with Magit
- `C-x g` opens Magit status
- In Magit: `s` to stage, `S` to stage all, `c` to commit, `P` to push, `F` to pull
- `l` to view log, `b` to checkout branch

#### Sync your config
```bash
cd ~/.emacs.d && git pull
# Then restart Emacs or evaluate: M-x eval-buffer in init.el
```

### Built-in Modes

| Mode | Description |
|------|-------------|
| `M-x shell` | Shell inside Emacs |
| `M-x eshell` | Emacs shell (works cross-platform) |
| `M-x term` | Full terminal emulator |
| `M-x calc` | Calculator |
| `M-x calendar` | Calendar |
| `M-x doctor` | ELIZA therapist (for fun) |
| `M-x tetris` | Tetris game |
| `M-x snake` | Snake game |

### Configuration Structure

```
~/.emacs.d/
├── init.el                 # Entry point, package setup, theme
├── core/
│   ├── keybindings.el      # Global keybindings
│   ├── editing.el          # Editing settings (multiple-cursors)
│   ├── clipboard.el        # Wayland clipboard integration
│   └── ui.el               # UI settings, fonts, windmove
├── plugins/
│   ├── git.el              # Magit and diff-hl
│   ├── lsp.el              # Eglot, file associations, corfu
│   ├── search.el           # Vertico and consult
│   ├── sidebar.el          # Projectile and treemacs
│   ├── sideline.el         # Diagnostic sideline
│   ├── fold.el             # Code folding (hideshow)
│   ├── modeline.el         # Doom modeline
│   ├── icons.el            # Nerd icons
│   ├── todos.el            # hl-todo
│   └── cyrus-mode.el       # Custom major mode
├── themes/
│   └── skull-theme.el      # Custom dark theme
├── elpa/                   # Installed packages (auto-generated)
└── README.md               # This file
```

### Useful Emacs Lisp Commands

Run these with `M-x`:

| Command | Description |
|---------|-------------|
| `M-x eval-buffer` | Evaluate (load) entire buffer |
| `M-x eval-region` | Evaluate selected Elisp code |
| `M-x eval-expression` | Evaluate one Elisp expression |
| `M-x toggle-frame-fullscreen` | Toggle fullscreen |
| `M-x global-display-line-numbers-mode` | Toggle line numbers |
| `M-x whitespace-mode` | Show whitespace characters |
| `M-x visual-line-mode` | Soft word wrap |
| `M-x toggle-truncate-lines` | Toggle line truncation |
| `M-x customize` | GUI settings browser |

---

## Theme

The **skull** theme is a custom green-on-black cyberpunk dark theme.

- Background: `#0a0a0a`
- Foreground: `#bfbfbf`
- Accent: `#03ff28` (green)
- Secondary: `#c2a200` (yellow), `#4da3ff` (blue), `#00e5ff` (cyan), `#ff4df0` (magenta)

---

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
