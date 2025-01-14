if &compatible
  set nocompatible
end

" Remove declared plugins
function! s:UnPlug(plug_name)
  if has_key(g:plugs, a:plug_name)
    call remove(g:plugs, a:plug_name)
  endif
endfunction
command!  -nargs=1 UnPlug call s:UnPlug(<args>)

let g:has_async = v:version >= 800 || has('nvim')

call plug#begin('~/.config/nvim/bundle')

" Define bundles via Github repos
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'spf13/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'janko/vim-test'
Plug 'saltstack/salt-vim'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

if g:has_async
  Plug 'w0rp/ale'
endif

" Editing Plugins
Plug 'nathanaelkane/vim-indent-guides'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

Plug 'kien/rainbow_parentheses.vim'

" Python plugins
Plug 'neomake/neomake'
Plug 'mitsuhiko/vim-python-combined'
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'hashivim/vim-terraform'
Plug 'jacqueswww/vim-vyper'
Plug 'tomlion/vim-solidity'


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


let g:deoplete#enable_at_startup = 1

call plug#end()

call neomake#configure#automake('nrwi', 500)
