" map leader \ to , for convinient, use command :echo mapleader to check current leader
let mapleader = ";"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'kchmck/vim-coffee-script'

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'
" Enable Nerdtree with CTRL + N
map <C-n> :NERDTreeToggle<CR>

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

Plugin 'ctrlp.vim'
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
" Use a leader instead of the actual named binding
nnoremap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nnoremap <leader>bb :CtrlPBuffer<cr>
" nnoremap <leader>bm :CtrlPMixed<cr>
" nnoremap <leader>bs :CtrlPMRU<cr>

Plugin 'easymotion/vim-easymotion'

Plugin 'surround.vim'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Ultisnips for vim snippets
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plugin 'tComment'

Plugin 'matchit.zip'

" Plugins cho javascript
Plugin 'jelera/vim-javascript-syntax'

Plugin 'pangloss/vim-javascript'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'Raimondi/delimitMate'

Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy5'
" bo qua mot so loi html
let g:syntastic_html_tidy_ignore_errors = [ 'is not recognized', 'discarding unexpected' ]
let g:syntastic_ruby_quiet_messages =
    \ {'regex': 'assigned but unused variable'}
" for ignore some warnings in ruby and javascript
let g:syntastic_quiet_messages = {
        \ "!level": "warnings",
        \ "regex":   'assigned but unused variable',
        \ "file:p":  ['.rb', '.js'] }

vmap ,x :!tidy -q -i --show-errors 0<CR>

Plugin 'JavaScript-Indent'

Plugin 'Valloric/YouCompleteMe'

Plugin 'marijnh/tern_for_vim'

Plugin 'ervandew/supertab'

Plugin 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'underscore,angularjs, jquery, angularui'

"for html
Plugin 'othree/html5.vim'

"for format html and javascript
Plugin 'maksimr/vim-jsbeautify'

"Lam dep giao dien va ho tro buffer
Plugin 'bling/vim-airline'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Text-object like motion for arguments
Plugin 'argtextobj.vim'

Plugin 'inline_edit.vim'

Plugin 'tpope/vim-rails'

Plugin 'yaymukund/vim-rabl'

" Plugin for use ack in vim
Plugin 'mileszs/ack.vim'

" Bundle 'kwaledesign/scss-snippets'
Plugin 'tpope/vim-bundler'

Plugin 'jiangmiao/auto-pairs'

Plugin 'tpope/vim-fugitive'

Plugin 'terryma/vim-smooth-scroll'

Plugin 'vim-scripts/LustyExplorer'

Plugin 'thoughtbot/vim-rspec'

Plugin 'jgdavey/tslime.vim'

Plugin 'christoomey/vim-tmux-navigator'

" Now we can turn our filetype functionality back on
filetype plugin indent on



"-------------------------BEGIN MY SETTING----------------------------------------"
" enable syntax processing set tabstop=4
" number of visual spaces per TAB
syntax enable           

" UI {
  colorscheme badwolf  "awesome colorscheme

  if $COLORTERM == 'gnome-terminal'
      set t_Co=256
  endif
  "GET COLOR FROM GUI COLOR SCHEME FOR VIM
  " if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  "   \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  "   " Use the guicolorscheme plugin to makes 256-color or 88-color
  "   " terminal use GUI colors rather than cterm colors.
  "   runtime! plugin/guicolorscheme.vim
  "   GuiColorScheme badwolf
  " else
  "   " For 8-color 16-color terminals or for gvim, just use the
  "   " regular :colorscheme command.
  "   colorscheme badwolf
  " endif
  "}


" SPACE AND TAB {
  set expandtab       " tabs are spaces
  set shiftwidth=2
  set softtabstop=2
"}


" UI Config {
  set showcmd  " show command in bottom bar

  " cursorline draws a horizontal highlight (or underline, depending on your colorscheme) on the line your cursor is currently on
  set cursorline          " highlight current line

  " This both turns on filetype detection and allows loading of language specific indentation files based on that detection. For me, this means the python indentation file that lives at ~/.vim/indent/python.vim gets loaded every time I open a *.py file.
  filetype indent on      " load filetype-specific indent files

  " This is a pretty cool feature I didn't know Vim had. You know how Vim automatically autocompletes things like filenames when you, for instance, run :e ~/.vim<TAB>? Well it will provide a graphical menu of all the matches you can cycle through if you turn on wildmenu.
  " set filetype=html           " abbrev -  :set ft=html
  set smartindent             " abbrev -  :set si

  set wildmenu            " visual autocomplete for command menu

  set lazyredraw          " redraw only when we need to.

  " With showmatch, when your cursor moves over a parenthesis-like character, the matching one will be highlighted as well.
  set showmatch           " highlight matching [{()}]

  set relativenumber

  " Open new split panes to right and bottom, which feels more natural than Vim’s default:
  set splitright

  " " Auto resize Vim splits to active split{
  "   set winwidth=104
  "   set winheight=5
  "   set winminheight=5
  "   set winheight=999
  " " }

  " SEARCHING {
    set incsearch           " search as characters are entered
    " turn off search highlight
    nnoremap <leader><space> :nohlsearch<CR>
  " }
  
" }



" KEYBINDINGS {
  let localleader = "\\"

  " Movement. Move to beginning/end of line
  nnoremap B ^     
  nnoremap E $

  "Ctrl D in insert mode to uppercase current word
  inoremap <c-d> <esc>viwUi
  "Ctrl D in normal mode to uppercase current word
  nnoremap <c-d> viwU

  " Shortcut for open and edit .vimrc file
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>

  " Shortcut for run all script in .vimrc file without restart vim
  nnoremap <leader>sv :source $MYVIMRC<cr>

  " Shortcut for edit my vim document
  nnoremap <leader>ed :vsplit ~/Documents/vim_shortcut.txt<cr>

  "Faster shortcut for tComment
  map  <leader>c <c-_><c-_>

  " Duoc su dung khi can xuong dong trong truong hop {}
  inoremap <C-c> <CR><Esc>O

  " shortcut cho close buffer
  nnoremap <c-b> :bdelete<cr>
  inoremap <c-b> :bdelete<cr>
  inoremap <c-h> <esc>ha
  inoremap <c-j> <esc>ja
  inoremap <c-k> <esc>ka
  inoremap <c-l> <esc>la

  "Keybings tao shortcut cho de dang thao tac voi buffer
  " This allows buffers to be hidden if you've modified a buffer.
  " This is almost a must if you wish to use buffers in this way.
  set hidden

  " WORKING WITH BUFFER{
    " To open a new empty buffer
    nmap <leader>t :enew<cr>

    " Move to the next buffer
    nmap <leader>l :bnext<CR>

    " Move to the previous buffer
    nmap <leader>h :bprevious<CR>

    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    nmap <leader>bq :bp <BAR> bd #<CR>

    " Show all open buffers and their status
    nmap <leader>bl :ls<CR>
  " }

  "Shortcut cho de dang di chuyen giua cac split window hon
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  "Shortcut cho adding and deleting empty line
  " Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
  nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
  nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
  nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
  nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

  " MORE AWESOME HOTKEYS{
    " Run the q macro
    nnoremap <leader>q @q
    " Quickly close windows
    nnoremap <leader>x :x<cr>
    " Switch between the last two files
    nnoremap <leader><leader> <c-^>
  " }
"}

"NUMBER AND RELATIVE NUMBER {
  "Toggle relative numbering, and set to absolute on loss of focus or insert mode
  set rnu
  function! ToggleNumbersOn()
      set nu!
      set rnu
  endfunction
  function! ToggleRelativeOn()
      set rnu!
      set nu
  endfunction
  autocmd FocusLost * call ToggleRelativeOn()
  autocmd FocusGained * call ToggleRelativeOn()
  autocmd InsertEnter * call ToggleRelativeOn()
  autocmd InsertLeave * call ToggleRelativeOn()
"}

" ZOOM / RESTORE WINDOW.{
  function! s:ZoomToggle() abort
      if exists('t:zoomed') && t:zoomed
          execute t:zoom_winrestcmd
          let t:zoomed = 0
      else
          let t:zoom_winrestcmd = winrestcmd()
          resize
          vertical resize
          let t:zoomed = 1
      endif
  endfunction
  command! ZoomToggle call s:ZoomToggle()
  nnoremap <silent> <leader>z :ZoomToggle<CR>
" }


" SYSTEM CLIPBOARD COPY & PASTE SUPPORT {
  set pastetoggle=<F2> "F2 before pasting to preserve indentation
  "Copy paste to/from clipboard
  vnoremap <C-c> "+y
  map <silent><leader>p :set paste<CR>i<esc>"+]p:set nopaste<cr>"
  map <silent><Leader><S-p> :set paste<CR>I<esc>"+]p:set nopaste<cr>"
" }

" Disable arrow key to remove bad habbit {
  inoremap  <Up>     <nop>
  inoremap  <Down>   <nop>
  inoremap  <Left>   <nop>
  inoremap  <Right>  <nop>
  noremap   <Up>     <nop>
  noremap   <Down>   <nop>
  noremap   <Left>   <nop>
  noremap   <Right>  <nop>
"}

" RESIZE PANES{
  nnoremap <silent> <Right> :vertical resize +5<cr>
  nnoremap <silent> <Left> :vertical resize -5<cr>
  nnoremap <silent> <Up> :resize +5<cr>
  nnoremap <silent> <Down> :resize -5<cr>
" }


" AUTOCOMMAND {
  " automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
"}

" Movement Keybindings {
    onoremap p i(
"}

" GIT keybinding {
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gcm :Gcommit<CR>
" }
"-----------------END MY SETTINGS----------------------------------------------"

"-----------------BEGIN OTHER SETTINGS----------------------------------------------"
" ctags{
  set tags=./tags;
  set tags+=gems.tags
  " Use ack instead of grep
  set grepprg=ack
" }

" for handlerbar emberjs
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

" SWP FiLES{
  " Save your swp files to a less annoying place than the current directory.
  " If you have .vim-swap in the current directory, it'll use that.
  " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
  if isdirectory($HOME . '/.vim/swap') == 0
          :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
  endif
  set directory=./.vim-swap//
  set directory+=~/.vim/swap//
  set directory+=~/tmp//
  set directory+=.
" }

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>
nnoremap ww :w<return>
nnoremap qqq :q<return>
set tw=100


" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)


" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)



" Scroll plugin
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Lustbuffer plugin
" nnoremap <silent> <leader>b :LustyBufferExplorer<CR>
"
nnoremap qq :bd<cr>

nnoremap oy "+y<cr>

"You have an existing block of text or code in vim. You want to re-format it to wrap to 80-characters.
set textwidth=100
set colorcolumn=100


" Change cursor when switching between normal and insert mode in vim
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif


" tslime.vim
" let g:tslime_always_current_session = 1
" let g:tslime_always_current_window = 1

" "RSpec mapping
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
nmap <leader>a :Tmux zeus parallel_rspec spec<CR>
" map <Leader>l :call RunLastSpec()<CR>
let g:rspec_command = 'call Send_to_Tmux("zeus rspec {spec}\n")'

"Make vim inside termial transparent if terminal set this
hi Normal ctermbg=none
highlight NonText ctermbg=none
"
"

"-----------------END OTHER SETTINGS----------------------------------------------"
"
