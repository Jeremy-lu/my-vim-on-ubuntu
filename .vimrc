" My Vimrc file
" Maintainer: swaroop@swaroopch.com

"" Vim, not Vi.
" This must be first, because it changes other options as a side effect.
set nocompatible
set number
let mapleader = ','
" required! by vundle
filetype off

"" Vundle
"" See :help vundle for more details
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! by vundle
Bundle 'gmarik/vundle'

Bundle 'VimClojure'
Bundle 'paredit.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'gmarik/ide-popup.vim'
Bundle 'juvenn/mustache.vim'

Bundle 'mileszs/ack.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'sukima/xmledit'
" Bundle 'swaroopch/vim-markdown-preview'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
" Bundle 'vim-pandoc/vim-pandoc'
"my addon
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-rails'
Bundle 'godlygeek/tabular'
" Bundle 'tpope/vim-markdown'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
" Bundle 'mintplant/vim-literate-coffeescript'
Bundle 'vim-scripts/VimIM'
Bundle 'mjbrownie/browser.vim'
" Bundle 'michael-lu-cn/dbext.vim'
Bundle 'goatslacker/mango.vim'

Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

Bundle 'Yggdroot/indentLine'
Bundle 'myusuf3/numbers.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'jiangmiao/auto-pairs'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'

Bundle 'SirVer/ultisnips'

Bundle 'othree/html5.vim'
Bundle 'briancollins/vim-jst'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'einars/js-beautify'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'pangloss/vim-javascript'
" Bundle 'pangloss/vim-javascript-lib'

Bundle 'crusoexia/vim-monokai'

" for tags
Bundle 'majutsushi/tagbar'
" if node > 0.8.22, in order make tagbar work fine, need edit /usr/local/lib/jsctags/ctags/index.js file
" at line 53~55,
" change
" 
" exports.Tags.prototype = Object.create(Object.prototype, Trait.compose(Trait({
"    _search: function (id, pred) {
"
" to
"
"exports.Tags.prototype = Object.create(Object.prototype, Trait.compose(Trait({
"    tags: [],
"    _search: function (id, pred) {
"
Bundle 'marijnh/tern_for_vim'

Bundle 'groenewege/vim-less'
Bundle 'mxw/vim-jsx'
Bundle 'mtscout6/vim-cjsx'
Bundle 'isRuslan/vim-es6'

" for jshint
Bundle 'Shutnik/jshint2.vim'
Bundle 'jaxbot/syntastic-react'

" Bundle 'vim-slime'

Bundle 'othree/yajs.vim'

Bundle 'hsanson/vim-android'
" Bundle 'artur-shaik/vim-javacomplete2'
Bundle 'tomlion/vim-solidity'
Bundle 'posva/vim-vue'
" Bundle 'darthmall/vim-vue'
" Bundle 'tao12345666333/vim-vue'
Bundle 'ciaranm/detectindent'

" for wechat develop tool
Bundle 'chemzqm/wxapp.vim'

Bundle 'elzr/vim-json'

"" General Settings

" Enable syntax highlighting.
syntax on

" Line endings should be Unix-style unless the file is from someone else.
set fileformat=unix
au BufNewFile * set fileformat=unix

" Automatically indent when adding a curly bracket, etc.
" required! by vundle
"filetype plugin indent on
set autoindent
set smartindent
set mouse=a

" Tabs converted to 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set backspace=indent,eol,start

" Set up backup dir where the swap files are stored
"set dir=~/.vim/backup,~/tmp,/tmp
"set backupdir=~/.vim/backup,~/tmp,/tmp

" Disable the F1 help key
map <F1> <Esc>
imap <F1> <Esc>

" Show special characters
if v:version >= 700
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_
else
    set list listchars=tab:>-,trail:.,extends:>
endif

" Don't break up long lines, but visually wrap them.
set textwidth=0
set wrap

" Text mode
command TextMode setlocal nolist wrap linebreak scrolloff=999

" Highlight current line
"set cursorline

" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" Minimal number of screen lines to keep above and below the cursor.
" This keeps the cursor always in the vertical middle of the screen.
set scrolloff=999

" Use UTF-8
set encoding=utf-8

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
if isdirectory(expand("~/.vim/bundle/vim-fugitive", ":p"))
    set statusline+=%{fugitive#statusline()}        " git status
endif
if isdirectory(expand("~/.vim/bundle/syntastic", ":p"))
    set statusline+=%{SyntasticStatuslineFlag()}    " syntastic status - makes sense with :Errors
endif
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=0x%-8B                          " character value
set statusline+=%-14(%l,%c%V%)                  " line, character
set statusline+=%<%P                            " file position

" Tab line
" Refer ':help setting-guitablabel'
function GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
        if getbufvar(bufnr, '&modified')
            let label = '[+] '
            break
            break
        endif
    endfor

    " Append the number of windows in the tab page if more than one
    let wincount = tabpagewinnr(v:lnum, '$')
    if wincount > 1
        let label .= wincount
    endif
    if label != ''
        let label .= ' '
    endif

    return label

endfunction

set guitablabel=%{GuiTabLabel()}\ %t

" Show line number, cursor position.
set ruler

" Display incomplete commands.
set showcmd

" Search as you type.
set incsearch

" Ignore case while searching
set ignorecase

" Make /g flag default when doing :s
" But, this will make the replace just match the first of the line
" set gdefault

" Show autocomplete menus
set wildmenu

" Show editing mode
set showmode

" Ignore certain filetypes when doing filename completion
set wildignore=*.sw*,*.pyc,*.bak

" Show matching brackets
set showmatch

" Bracket blinking
set matchtime=2

" Split new window below current one
set splitbelow

" Error bells are displayed visually.
set visualbell

" Automatically read files which have been changed outside of Vim, if we
" haven't changed it already.
set autoread

" Disable highlighting after search. Too distracting.
" set nohlsearch

" To save, ctrl-s.
" nmap <c-s> :w<CR>
" imap <c-s> <Esc>:w<CR>a

" Reformatting options. See `:help fo-table`
" set formatoptions+=lnor1

" Disable spellcheck by default
set nospell
autocmd BufRead,BufNewFile * setlocal nospell
" To enable again, use:
" setlocal spell spelllang=en_us

" Say a message
function! Say(msg)
    echohl IncSearch
    echo a:msg
    echohl None
endfunction

" Copy full buffer to OS clipboard.
" function! CopyAll()
"     normal mzggVG"+y'z
"     call Say("Copied.")
" endfunction
" command A call CopyAll()

" Delete buffer contents and Paste from OS clipboard.
" function! PasteFromClipboard()
"     normal ggVGd"+p1G
"     call Say("Pasted.")
" endfunction
" command B call PasteFromClipboard()

" Markdown files are plain text files
" autocmd FileType markdown TextMode
" autocmd FileType pandoc TextMode
" let g:pandoc_no_folding = 1
" Allow these file extensions to be accessed via 'gf' of only the name, for
" e.g. gf on [[AnotherPage]] should go to AnotherPage.pd
set suffixesadd=.pd,.txt

if has('python') " Assumes Python >= 2.6

    " Quick way to open a filename under the cursor in a new tab
    " (or URL in a browser)
    function! Open()
python <<EOF
import re
import platform
import vim

def launch(uri):
    if platform.system() == 'Darwin':
        vim.command('!open {}'.format(uri))
    elif platform.system() == 'Linux':
        vim.command('!firefox -new-tab {}'.format(uri))

def is_word(text):
    return re.match(r'^[\w./?%:#&=~+-]+$', text) is not None

filename_start = filename_end = vim.current.window.cursor[1] # (row, col)

while filename_start >= 0 and is_word(vim.current.line[filename_start:filename_start+1]):
    filename_start -= 1
filename_start += 1

while filename_end <= len(vim.current.line) and is_word(vim.current.line[filename_end:filename_end+1]):
    filename_end += 1

filename = vim.current.line[filename_start:filename_end]

if filename.endswith('.md') or filename.endswith('.txt'):
    vim.command('tabedit {0}'.format(filename))

elif filename.lower().startswith('http') or filename.lower().startswith('www.'):
    if filename.lower().startswith('www.'):
        filename = 'http://{0}'.format(filename)
    filename = filename.replace('#', r'\#').replace('%', r'\%').replace('~', r'\~')
    launch(filename)

else:
    launch(filename)
EOF

    endfunction

    command O call Open()
    map <Leader>o :call Open()<CR>

" Add the virtualenv's site-packages to vim path
python << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

endif " python

" Remove the Windows ^M (copied from http://amix.dk/vim/vimrc.html)
map <Leader>d mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Shortcut to insert date
inoremap <F5> <C-R>=strftime("%a, %d %b %Y")<CR>

" http://items.sjbach.com/319/configuring-vim-right
" Marks
nnoremap ' `
nnoremap ` '

" matchit
runtime! macros/matchit.vim

" Python
let python_highlight_all=1
" PEP8 compliance - http://www.python.org/dev/peps/pep-0008/
autocmd FileType python set colorcolumn=80

"" Bundle-specific configurations

" Bundle 'VimClojure'
let g:vimclojure#ParenRainbow = 1

" Bundle 'tpope/vim-fugitive'
" http://vimcasts.org/blog/2011/05/the-fugitive-series/
autocmd BufReadPost fugitive://* set bufhidden=delete

" Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1

" XML, HTML
function TagExpander()
    if exists("b:did_ftplugin")
      unlet b:did_ftplugin
    endif
    runtime! ftplugin/xml.vim ftplugin/xml_*.vim ftplugin/xml/*.vim
endfunction

autocmd FileType xml   call TagExpander()
autocmd FileType html  call TagExpander()
autocmd FileType eruby call TagExpander()
autocmd FileType htmljinja call TagExpander()
autocmd FileType htmldjango call TagExpander()

" Ruby
autocmd BufRead,BufNewFile {Gemfile,Rakefile,config.ru} setlocal ft=ruby
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2

" JSON
"autocmd BufRead,BufNewFile *.json setlocal ft=json foldmethod=syntax
" autocmd FileType json setlocal tabstop=2 shiftwidth=2

" Clojure
autocmd FileType clojure setlocal tabstop=2 shiftwidth=2

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Assume Bash is my shell (:help sh.vim)
let g:is_bash = 1

" Reload all windows in all tabs, useful after I do a 'git rebase -i'
command Reedit :tabdo windo edit!

" Default color scheme
set background=dark

" NOTE: On Mac OS X, best used with [iTerm 2](http://www.iterm2.com)
if isdirectory(expand("~/.vim/bundle/vim-tomorrow-theme", ":p"))
    colorscheme Tomorrow-Night
endif

" Mac
if has('mac')
    set macmeta
endif

" Local config
let vimrc_local = expand("~/.vimrc.local", ":p")
if filereadable(vimrc_local)
    execute 'source' vimrc_local
endif
unlet vimrc_local

" vim: filetype=vim

" configure ctrlp
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

nnoremap tl  :tabnext<CR>
nnoremap th  :tabprev<CR>
" qf: is be used for nerdtree
noremap qc :!g++ % -o %< && ./%< <CR>
noremap qg :!go run %<CR>
noremap qb :!google-chrome %<CR><CR>
noremap ql :!. local.sh<CR>
noremap qm :!mocha test %<CR>
noremap qmm :!mocha %<CR>
noremap qn :!node %<CR>
noremap qr :!ruby %<CR>
noremap qw :!nautilus .<CR><CR>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
let Tlist_Use_Right_Window = 1
" autocmd BufWritePost *.cpp :TlistUpdate

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

nnoremap tt :TagbarToggle<CR>

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufReadPost *.cf set filetype=coffee
" SQLite
 let g:dbext_default_SQLITE_bin = 'sqlite3'
 let g:dbext_default_profile_sqlite_hanzi  = 'type=SQLITE:dbname=~/wen/demo/main/hanzi.db'
 let g:dbext_default_profile_sqlite_android  = 'type=SQLITE:dbname=~/wen/demo/yuewen/android.db'
 let g:dbext_default_profile_sqlite_library = 'type=SQLITE:dbname=~/library/library.db'
"  let g:dbext_default_profile_postgres_hanzi = 'type=PGSQL:user=postgres:dbname=dvdrental'
 let g:dbext_default_profile_postgres_sample = 'type=PGSQL:user=michael:dbname=wuhuai_small'
"  let g:dbext_default_profile  = 'sqlite_hanzi'
"  let g:dbext_default_profile  = 'postgres_hanzi'
 let g:dbext_default_profile  = 'postgres_sample'
"  let g:dbext_default_profile  = 'sqlite_android'

"Vimscript file settings----------{{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

" set pastetoggle=<leader>p
color mango
color Tomorrow-Night-Eighties

" map  / <Plug>(easymotion-sn)
map <space>l <Plug>(easymotion-lineforward)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
map <space>h <Plug>(easymotion-linebackward)
map <space>w <Plug>(easymotion-w)
map <space>b <Plug>(easymotion-b)
map <space>f <Plug>(easymotion-f)
map <space>s <Plug>(easymotion-s)

" easy save and exit
noremap ; :w<CR>
noremap ' :q<CR>
noremap " :qa<CR>
" inoremap <S-A> <Esc><S-A>


nnoremap p "+p
nnoremap y "+y
nnoremap d "+d
nnoremap yy "+yy
nnoremap dd "+dd
nnoremap ci) f(ci(
nnoremap ca) f(ca(
nnoremap ci] f[ci[
nnoremap ca] f[ca[
nnoremap ci} f{ci{
nnoremap ca} f{ca{
nnoremap ca} f{ca{

" js easyer
" inoremap f0 ()<Esc>hi
inoremap f9 () => {}<Esc>i<CR><Esc>k<S-A><Esc>5hi
" inoremap f{ {}<Esc>hi
" inoremap f[ []<Esc>hi
" inoremap f' ''<Esc>hi
" inoremap f" ""<Esc>hi
inoremap clg console.log()<Esc>i

" nerdtree set
noremap qq :NERDTreeTabsToggle<CR>
noremap qf :NERDTreeFind<CR>

" tern setting
noremap gd :TernDef<CR>
noremap gr :TernRefs<CR>


" open nerdtree auto
" autocmd VimEnter * NERDTree
let g:nerdtree_tabs_open_on_console_startup=1


" 突出显示当前行等
set cursorcolumn
set cursorline          " 突出显示当前行

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
" set scrolloff=13


"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" Enter toggle search命中文本的高亮。
" noremap <CR> :set nohlsearch<CR>
nnoremap <CR> :nohlsearch<CR><CR>
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase


"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B


" 自动补全配置
" set completeopt=longest,menu


" ------- 选中及操作改键
"Reselect visual block after indent/outdent.调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv


" w!! to sudo & write a file      JSON.stringify()

cmap w!! w !sudo tee >/dev/null %


" set coffee and nodejs excute hot key
" noremap <F9> :! coffee %<CR>
" noremap <F10> :! node %<CR>

" replace word in the cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" :nnoremap <Leader>d :/\<function <C-r><C-w>\><CR>

" set normal 9 to insert at the end of the line
" :nnoremap 9 <Esc><S-A>
" :nnoremap 0 <Esc><S-I>

" YCM config
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全

"Utisnip
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" " 定义存放代码片段的文件夹 .vim/additional_snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
" let g:UltiSnipsSnippetDirectories=["additional_snippets", 'UltiSnips']

" ctrlp function
nnoremap <Leader>ff :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
" nnoremap <Leader>fu :execute 'CtrlPFunky ' . expand('<cword>')
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

" set jshint
" let jshint2_read = 1
" let jshint2_save = 1
let jshint2_error = 0
let jshint2_min_height = 3
let jshint2_max_height = 12

" React jsx syntax
let g:jsx_ext_required = 0

" Set ctrlp ignore
set wildignore+=*/node_modules/*,*/ROOT/*,*.so,*.swp,*.swo,*.zip
" let g:syntastic_javascript_checkers = ['jsxhint']
" let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" vim-slime
"let g:slime_target = "screen"
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
nnoremap <F4> :SlimeSend<CR>

" for java complete
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" vim android
" stop gradle auto sync
let g:gradle_async=0

" vim-vue
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
au BufRead,BufNewFile *.vue set filetype=html
au BufRead,BufNewFile *.wpy set filetype=html
au BufRead,BufNewFile *.wxml set filetype=html

" filetype map
au BufRead,BufNewFile *.ftl set filetype=html

syntax on
colorscheme monokai
set t_Co=256  " vim-monokai now only support 256 colours in terminal.

let g:indentLine_enable=1
let g:indentLine_color_term=239
let g:indentLine_color_gui='#A4E57E'
let g:indentLine_char='┆'
let g:indentLine_indentLevel=20

" disable json file hidden double quote
let g:vim_json_syntax_conceal = 0

" input vertical method
" first use V to select lines and position
" then use I to prepare insert
" then input
" then press Esc
" ok, finished, cool!

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
