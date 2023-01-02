
"
"                
"                  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"                  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"                  ██║   ██║██║██╔████╔██║██████╔╝██║     
"                  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                   ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                    ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"                
"                   		   -yuwei- 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable compatibilty with Vi.
set nocompatible

" Allow plugins to be used.
filetype plugin indent on
filetype off

" Use syntax highlighting.
syntax on

" Show line numbers.
set number

" Highlight line with cursor.
set cursorline

" Highlight column with cursor.
set cursorcolumn

" Split window to open a pane in the bottom.
set splitbelow

" Split window to open a pane to the right.
set splitright

" Always leave a number of rows below cursor.
set scrolloff=10

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab stop to 4 spaces.
set tabstop=4

" Indent automatically.
set autoindent

" Use the appropriate number of spaces to insert a tap in insert mode.
set expandtab

" Show command in the last line of the screen.
set showcmd

" Show the line and column position of cursor.
set ruler

" Show matching words during a search.
set showmatch

" Highlight matching words while searching for text.
set hlsearch

" Set the number of lines to save in history.
set history=8000

" Back up files.
set backup

" Set a directory to save file backups with full path.
set backupdir=~/.vim/backup//

" Undo changes to files after saving them.
set undofile

" Set a directory to save undo data with full path.
set undodir=~/.vim/undo//

" Set number of times a file can be undone.
set undoreload=2000

" Undo changes to files after saving them.
set undofile

" Set location for temporary (swp) files.
set directory=/tmp

" Check to see if an file has changed by another text editor.
set autoread

" Switch to another buffer without saving.
set hidden

" Set text width
set textwidth=80

" Hide mouse when typing.
set mousehide

nnoremap <leader>f :set foldmethod=indent<CR>
nnoremap <leader>fs :set foldmethod=syntax<CR>
nnoremap <leader>u zR<CR>
"set foldmethod=indent   "fold based on indent
"set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
"set foldlevel=1        "this is just what i use

" Set colorscheme.
colorscheme molokai


" Set wildmode.
" set wildmode=list:longest

" Ignore files.
" set wildignore=*.jpg,*.mp4,*.zip,*.iso,*.pdf,*.pyc,*.odt,*.png,*.gif,*.tar,*.gz,*.xz,*.bz2,*.tgz,*.db,*.exe,*.odt,*.xlsx,*.docx,*.tar,*.rar,*.img,*.odt,*.m4a,*.bmp,*.ogg,*.mp3,*.gzip,*.flv,*.deb,*.rpm

" PLUGINS ---------------------------------------------------------------- {{{
" let Vundle manage Vundle, required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'dense-analysis/ale'
Plugin 'ambv/black'
call vundle#end()            " required
filetype plugin indent on    " required

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree {
    nnoremap <leader>n :NERDTreeFocus<CR>
    "nnoremap <C-n> :NERDTree<CR>
    "nnoremap <C-t> :NERDTreeToggle<CR>
    "nnoremap <C-f> :NERDTreeFind<CR>
    autocmd StdinReadPre * let s:std_in=1
    " do not auto open nerdtree
    "autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe{
    let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf=0
    let g:ycm_python_binary_path='/usr/local/bin/python3'
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
    let g:ycm_filetype_blacklist = { 'python' : 1 }
    nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim {
"    let g:jedi#auto_vim_configuration = 0
"    let g:jedi#popup_on_dot = 0
"    let g:jedi#popup_select_first = 0
"    let g:jedi#completions_enabled = 1
"    let g:jedi#completions_command = ""
"    let g:jedi#show_call_signatures = "1"

"    let g:jedi#goto_assignments_command = "<leader>pa"
"    let g:jedi#goto_definitions_command = "<leader>pd"
"    let g:jedi#documentation_command = "<leader>pk"
"    let g:jedi#usages_command = "<leader>pu"
"    let g:jedi#rename_command = "<leader>pr"
" }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-Mode {
    let g:pymode_python='python3'
    let g:syntastic_python_python_exec='python3'
    let g:pymode_options_max_line_length = 80

    " rope
    let g:pymode_rope=0
    let g:pymode_rope_completion=0
    let g:pymode_rope_complete_on_dot=0
    let g:pymode_rope_auto_project=0
    let g:pymode_rope_enable_autoimport=0
    let g:pymode_rope_autoimport_generate=0
    let g:pymode_rope_guess_project=0

    " documentation
    let g:pymode_doc=0
    let g:pymode_doc_bind='K'

    " lints
    let g:pymode_lint=0
    "let g:pymode_lint_checkers = ['pylint', 'pep8']

    " virtualenv
    "let g:pymode_virtualenv=1

    " breakpoints
    "let g:pymode_breakpoint=1
    "let g:pymode_breakpoint_key='<leader>b'

    " syntax highlight
    let g:pymode_syntax=1
    let g:pymode_syntax_slow_sync=1
    let g:pymode_syntax_all=1
    let g:pymode_syntax_print_as_function=g:pymode_syntax_all
    let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
    let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
    let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
    let g:pymode_syntax_highlight_self=g:pymode_syntax_all
    let g:pymode_syntax_indent_errors=g:pymode_syntax_all
    let g:pymode_syntax_string_formatting=g:pymode_syntax_all
    let g:pymode_syntax_space_errors=g:pymode_syntax_all
    let g:pymode_syntax_string_format=g:pymode_syntax_all
    let g:pymode_syntax_string_templates=g:pymode_syntax_all
    let g:pymode_syntax_doctests=g:pymode_syntax_all
    let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
    let g:pymode_syntax_builtin_types=g:pymode_syntax_all
    let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
    let g:pymode_syntax_docstrings=g:pymode_syntax_all
" }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE {
    let g:ale_enabled = 1
    let g:ale_set_balloons = 1
    let g:ale_floating_preview = 1
    let g:ale_cursor_detail = 1
    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '--'
    "let g:ale_completion_enabled = 0
    "let g:ale_sign_error = '💣'
    "let g:ale_sign_warning = '🚩'
    "let g:ale_statusline_format = ['💣 %d', '🚩 %d', '']
    "
    let g:ale_lint_on_enter = 1
    let g:ale_lint_on_text_changed = 1
    let g:ale_python_flake8_options = '--max-line-length 80'
    let g:ale_python_pycodestyle_options = '--max-line-length 80'
    "let g:ale_cpp_clangtidy_executable = '/usr/local/bin/clang-tidy'
    let g:ale_c_clangtidy_extra_options = ''
    let g:ale_c_clangtidy_options = ''
    let g:ale_cpp_clangtidy_extra_options = ''
    let g:ale_cpp_clangtidy_options = ''
    let g:ale_linters = {
      \   'python': ['pylint', 'flake8', 'pycodestyle'],
      \   'c': ['clangtidy'],
      \   'cpp': ['clangtidy'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

    "let g:ale_python_isort_options = '--profile black -l 80'
    let g:ale_python_black_options = '--line-length 80'
    let g:clang_format#detect_style_file = 1
    "let g:clang_format#auto_format = 1
    "let g:ale_cpp_clangformat_executable = '/usr/local/bin/clang-format'
    let g:ale_fixers = {
      \    'python': ['autoimport', 'isort', 'autopep8', 'black'],
      \    'c': ['clang-format'],
      \    'cpp': ['clang-format'],
      \}
    "nmap <F10> :ALEFix<CR>
    let g:ale_fix_on_save = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
