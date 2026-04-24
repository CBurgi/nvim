syntax on " syntax highlighting
"set termguicolors

" Set session file
"set sessiondir=~/.config/nvim/sessions

" Autoclose parens
"so ~/.config/nvim/autoclose.vim

" File formatting
set fileformat=unix
set encoding=UTF8

" Tabs formatting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
set expandtab
set autoindent

" No wrapping
set nowrap

" Change match parens
hi MatchParen guibg=DarkCyan
let matchparen_disable_cursor_hl = 1


" Visuals for lines
set cursorline " Highlight line cursor is on
set number " Line numbers
set relativenumber
set scrolloff=12 " Stop scrolling when 12 from bottom
set signcolumn=auto:2 " Show 2 sign columns

" Visuals for commands
set showcmd " Show command in bottom right
set noshowmode " Dont show mode (plugin will do it)

set noerrorbells visualbell t_vb= " Disable error sounds

" Use file for swapping/undo
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Save global marks on exit
set viminfo='100,f1

" Copy int windows clipboard
if has("win32") || has("win64")
    vnoremap cp "vy :call system('clip.exe', @v)<CR>
    vnoremap <C-c> "vy :call system('clip.exe', @v)<CR>
elseif has("unix")
    vnoremap cp "+y<CR>
    vnoremap <C-c> "+y<CR>
endif

" Move lines with alt
nnoremap <M-j> ddp
nnoremap <M-k> ddkP
nnoremap <C-M-j> yyp
nnoremap <C-M-k> yyP

vnoremap <M-j> Dp
vnoremap <M-k> DkP
vnoremap <C-M-j> YP
vnoremap <C-M-k> YP


" Search settings
set ignorecase " Ignore case...
set smartcase " Unless a cap is in the search
set incsearch " Highlight pattern live
set hlsearch " Highlight all patterns
" Remove highlighting on exit search
nnoremap <CR> :noh <CR><CR>:<backspace>

" Hover when cursor not moved for 2 seconds
"autocmd CursorHold,CursorHoldI * 

" Save session and quit
autocmd VimLeave * call SaveSess()
nnoremap <leader>q :wqa<CR>
nnoremap <leader>ss :call SaveSess()<CR>
function SaveSess()
    call CloseBlanks(1)
    const file =  globpath(&rtp, 'sessions/') . GetRepo() . ".vim"
    execute "mksession! " . file
    echomsg "Made session for " . getcwd()
endfunction

" Load session
 "autocmd VimEnter * call LoadSess()
nnoremap <leader>sl :call LoadSess()<CR>
function LoadSess()
    call CloseBlanks()
    const file =  globpath(&rtp, 'sessions/') . GetRepo() . ".vim"
    if !filereadable(file)
      echo "No session for " . file
      return ""
    endif
    execute "source " . file
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endfunction

nnoremap <leader>c :call CloseBlanks(1)<CR>
function! CloseBlanks(all = 0)
  const buf = bufnr('%')
  const win = win_getid()
  "echo "Buf: " . buf . ", Win: " . win
  execute "windo if &buftype == 'nowrite' || &buftype == 'nofile' || &buftype == 'quickfix' || &buftype == 'help' || (" . a:all . " && @% == '') | close | endif"
  if winnr("$") > 1 && win_id2win(win) != 0
    execute "call win_gotoid(" . win . ")"
  endif
  "execute "bufdo if &buftype == 'nofile' || &buftype == 'quickfix' || &buftype == 'help' | close | endif"
  "if bufexists(buf)
  "  execute "b" . buf
  "endif
endfunction

function GetRepo()
    const dir = split(getcwd(),"/")
    const name = dir[len(dir) - 1]
    return name
endfunction
