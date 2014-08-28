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

	"----------------------------------------------------------------
	" neobundle cleanup
	"----------------------------------------------------------------
	call neobundle#end

	filetype off
	filetype indent off

	execute "set runtimepath+=" . bundleDir

	call neobundle#begin(neobundleDir)

	" should use self management of neobundle?
	"NeoBundleFetch 'Shougo/neobundle.vim

	"----------------------------------------------------------------
	" neobundle plugins
	"----------------------------------------------------------------

	call neobundle#end

	filetype on
	filetype indent on
endif

"----------------------------------------------------------------
" basic settings
"----------------------------------------------------------------
set nu
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab

"execute "cd " . confDir

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
