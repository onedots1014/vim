## vim

Cross-platform Vim/Neovim configuration. Supports Linux, macOS and Windows.

### 1. Install

```bash
git clone https://github.com/onedots1014/vim.git ~/.vim/vim
```

### 2. Setup

Copy the corresponding entry file to your system, or add a source line manually.

| Platform | Entry file | Target |
|----------|------------|--------|
| Linux/macOS Vim | `setup/vimrc` | `~/.vimrc` |
| Linux/macOS Neovim | `setup/nvim-init.vim` | `~/.config/nvim/init.vim` |
| Windows Vim | `setup/windows-vimrc.vim` | `~/_vimrc` |
| Windows Neovim | `setup/windows-nvim-init.vim` | `~/AppData/Local/nvim/init.vim` |

Example (Linux Vim):

```bash
cp ~/.vim/vim/setup/vimrc ~/.vimrc
```

If you already have a Lua-based Neovim config (e.g. LazyVim), add this to your `init.lua` instead:

```lua
vim.cmd('source ~/.vim/vim/init.vim')
```

### 3. Install Plugins

Open Vim/Neovim and run:

```
:PlugInstall
```

vim-plug will be downloaded automatically on first launch.

### 4. Plugins

| Plugin | Description |
|--------|-------------|
| NERDTree | File explorer |
| NERDCommenter | Code commenting |
| vim-better-whitespace | Trailing whitespace highlight |
| vim-airline | Status line |
| PaperColor | Color scheme |
| fzf.vim | Fuzzy finder (no Python required) |
| vim-signify | Git diff signs |
| vim-fugitive | Git integration |
| vim-gutentags | Auto tag management |
| gutentags_plus | Gtags/cscope support |
| vim-preview | Preview window |

### 5. Key Mappings

Leader key: `Space`

#### General

| Key | Action |
|-----|--------|
| `<Leader>r` | Reload vimrc |
| `<Leader>w` | Save |
| `<Leader>q` | Quit |
| `<Leader>Q` | Force quit |
| `<Leader>qv` | Force quit all |
| `<Leader>wq` | Save all and quit |
| `<Leader>v` | Vertical split |
| `<Leader>t` | Open terminal |
| `<Leader>qt` | Quit terminal |
| `<Leader>sn` | Toggle line numbers |
| `<Leader>nh` | Clear search highlight |

#### Window Resize

| Key | Action |
|-----|--------|
| `<Leader>wh` | Shrink width |
| `<Leader>wl` | Expand width |
| `<Leader>wk` | Expand height |
| `<Leader>wj` | Shrink height |

#### Insert Mode Navigation

| Key | Action |
|-----|--------|
| `Ctrl+h` | Left |
| `Ctrl+j` | Down |
| `Ctrl+k` | Up |
| `Ctrl+l` | Right |

#### NERDTree

| Key | Action |
|-----|--------|
| `<Leader>nt` | Toggle NERDTree |
| `<Leader>nf` | Find current file |

#### NERDCommenter

| Key | Action |
|-----|--------|
| `<Leader>k` | Toggle comment |
| `<Leader>e` | Comment to EOL |
| `<Leader>u` | Uncomment |

#### fzf.vim

| Key | Action |
|-----|--------|
| `Ctrl+p` | Find file |
| `<Leader>ff` | Find file |
| `<Leader>fb` | Find buffer |
| `<Leader>fm` | MRU / history |
| `<Leader>fg` | Rg grep |
| `<Leader>ft` | Find tag |
| `<Leader>fu` | Buffer tags |
| `<Leader>fl` | Find lines |
| `<Leader>fc` | Commands |
| `<Leader>fy` | Command history |
| `<Leader>fh` | Help tags |

#### Git (Signify + Fugitive)

| Key | Action |
|-----|--------|
| `<Leader>gj` | Next hunk |
| `<Leader>gk` | Previous hunk |
| `<Leader>gp` | Preview hunk diff |
| `<Leader>gu` | Undo hunk |
| `<Leader>gs` | Git status |
| `<Leader>gb` | Git blame |
| `<Leader>gd` | Git diff |
| `<Leader>gl` | Git log |
| `<Leader>gc` | Git commit |
| `<Leader>ga` | Git add current file |

#### Code Navigation (Gtags)

| Key | Action |
|-----|--------|
| `<Leader>js` | Find symbol references |
| `<Leader>jg` | Find definition |
| `<Leader>jc` | Find functions called by this |
| `<Leader>jt` | Find functions calling this |
| `<Leader>je` | Find text string |
| `<Leader>jf` | Find file |
| `<Leader>ji` | Find files including this |
| `<Leader>co` | Open quickfix |
| `Ctrl+j` | Next quickfix item |
| `Ctrl+k` | Previous quickfix item |
