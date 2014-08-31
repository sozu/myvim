let confDir = expand('<sfile>:p:h')

gui
colorscheme koehler
set transparency=180

source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

if has('win32') && filereadable(confDir . "/gvimrc.win32")
	execute "source " . confDir . "/gvimrc.win32"
elseif has('mac') && filereadable(confDir . "gvimrc.mac")
	execute "source " . confDir . "/gvimrc.mac"
endif
