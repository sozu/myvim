"----------------------------------------------------------------
" setup
"----------------------------------------------------------------
" directory where this script exists.
let confDir = expand('<sfile>:p:h')

"----------------------------------------------------------------
" neobundle settings
"----------------------------------------------------------------
let neobundleDir = confDir . "/bundle"
let bundleDir = neobundleDir . "/neobundle.vim"

if has('vim_starting') && isdirectory(bundleDir)
	"----------------------------------------------------------------
	" neobundle setup
	"----------------------------------------------------------------
	set nocompatible

	filetype off
	filetype indent off

	execute "set runtimepath+=" . bundleDir

	call neobundle#begin(neobundleDir)

	" should use self management of neobundle?
	"NeoBundleFetch 'Shougo/neobundle.vim

	"----------------------------------------------------------------
	" neobundle plugins
	"----------------------------------------------------------------
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'thinca/vim-quickrun'
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'plasticboy/vim-markdown'
	NeoBundle 'kannokanno/previm'
	NeoBundle 'tyru/open-browser.vim'
	NeoBundle 'fatih/vim-go'

	"----------------------------------------------------------------
	" neobundle cleanup
	"----------------------------------------------------------------
	call neobundle#end()

	filetype on
	filetype indent on

    NeoBundleCheck
endif

"----------------------------------------------------------------
" basic settings
"----------------------------------------------------------------
set nu
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set tw=0
set noundofile

"execute "cd " . confDir

"----------------------------------------------------------------
" filetype settings
"----------------------------------------------------------------
au BufRead,BufNewFile *.md set filetype=markdown

"----------------------------------------------------------------
" custom settings for each environment
"----------------------------------------------------------------
if has('win32') && filereadable(confDir . "vimrc.win32")
	execute "source " . confDir . "/vimrc.win32"
elseif has('mac') && filereadable(confDir . "vimrc.mac")
	execute "source " . confDir . "/vimrc.mac"
endif

"----------------------------------------------------------------
" add runtimepath to load plugins in this configurations
"----------------------------------------------------------------
let runtimeDir = confDir . "/runtime"
execute "set runtimepath+=" . runtimeDir

"----------------------------------------------------------------
" cleanup
"----------------------------------------------------------------
