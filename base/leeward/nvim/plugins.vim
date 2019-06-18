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
Plug 'saltstack/salt-vim'
Plug 'airblade/vim-gitgutter'

if g:has_async
  Plug 'w0rp/ale'
endif

" Python plugins
Plug 'neomake/neomake'
Plug 'mitsuhiko/vim-python-combined'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'python-mode/python-mode'
Plug 'ambv/black'

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
