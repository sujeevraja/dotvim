## dotvim

This repo contains my config files and plugins for Vim/GVim and Neovim. There are two ways to set up the configuration:

### Option 1: Using Setup Scripts (Recommended)

1. Clone this repository:
```bash
git clone https://github.com/yourusername/dotvim.git
cd dotvim
```

2. For Vim/GVim setup:
```bash
./givm_setup.sh
```

3. For Neovim setup:
```bash
./neovim_setup.sh
```

### Option 2: Manual Setup

#### Vim/GVim Setup
1. Copy `vimrc` to:
   - `~/.vimrc` (Mac/Ubuntu)
   - `~/_vimrc` (Windows)
2. Copy the `vim` folder to:
   - `~/.vim` (Mac/Ubuntu)
   - `~/vimfiles` (Windows)

#### Neovim Setup
1. Copy `init.vim` to:
   - `~/.config/nvim/init.vim` (Mac/Ubuntu)
   - `~/AppData/Local/nvim/init.vim` (Windows)
2. Copy plugins from `vim/bundle/*` to:
   - `~/.local/share/nvim/site/pack/plugins/start/` (Mac/Ubuntu)
   - `~/AppData/Local/nvim-data/site/pack/plugins/start/` (Windows)

### Plugin Requirements

Most of the plugins can be used as-is except for:

- jedi-vim: requires vim to be compiled with `+python` or `+python3`.

- syntastic: requires `JShint` to be installed as a global node module using
  NodeJS for javascript files. This is not a necessity, as it just doesn't do
  any checking in javascript files if JShint is not installed.

- vim-signature: requires vim to be compiled with `+signs` (this was done by
  default and did not require any recompilation on a mac).

The best way to do this is to build vim from source. If that can't be done,
just remove the jedi-vim folder from the bundle directory.

## Plugins

Here's a list of all the plugins included in this configuration:

- **darcula**: A dark color scheme for Vim, inspired by IntelliJ IDEA's Darcula theme
- **syntastic**: Syntax checking plugin that runs files through external syntax checkers
- **delimitMate**: Provides automatic closing of quotes, parentheses, brackets, etc.
- **ctrlp**: Fuzzy file, buffer, mru, tag finder
- **nerdtree**: A tree explorer plugin for navigating the filesystem
- **vim-markdown**: Markdown syntax highlighting and support
- **scratch**: A scratch buffer plugin for taking notes
- **vim-surround**: Quoting/parenthesizing made simple
- **vim-speeddating**: Use CTRL-A/CTRL-X to increment dates, times, and more
- **vim-colors-solarized**: Precision color scheme for the vim text editor
- **vim-indent-guides**: Visually displaying indent levels in code
- **tcomment_vim**: An extensible & universal comment plugin
- **vim-signature**: Plugin to toggle, display and navigate marks
- **NrrwRgn**: A Narrow Region plugin for vim
- **vim-airline**: Lean & mean status/tabline for vim
- **vimtex**: Modern vim plugin for editing LaTeX files
- **tagbar**: Displays tags in a window, ordered by scope
- **vim-unimpaired**: Pairs of handy bracket mappings
- **typescript-vim**: TypeScript syntax files for Vim

## Vim Hints

- Switching between windows in vim: `ctrl-ww`.

- General navigation between windows in vim `ctrl-w(hjkl)`
  (left/down/up/right moves to that window).

- `=` is the indentation command. Use it with any motion command for automatic
  indentation. For example, going to `gg`, `=G` indents the whole file.

- `m` is used to set marks. For example, `ma` sets a mark below the cursor.
  Then, one can use `'a` to get to the line containing mark `a` and `\`a` to
  get to the exact position of the mark `a`. As these are motion commands, they
  can be used with other operations as well (yank, delete, etc).

## Plugin Hints

- Opening up NERDTree: `ctrl-n`.

- Opening up CtrlP: `ctrl-p`.

- Open scratch pad: `gs`. If something is selected, `gs` will copy it into the
  pad.

- Increase date by increasing number under cursor: `ctrl-A`.

- Decrease date by decreasing number under cursor: `ctrl-X`.

- Toggle indent visualization: `\ig`.

- Commenting with tcomment: `gc`. This is an action and can be applied on any
  motion.

- Delete all marks with `m<space>` (thanks to vim-signature).
