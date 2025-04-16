set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" init.vim

lua << EOF
require'nvim-treesitter.configs'.setup{highlight={enable=true}}
EOF

