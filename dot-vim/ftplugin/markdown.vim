"===================================
"Markdown SECTION
"===================================

"create html header lines (h1 to h6)
nmap<leader>1 <HOME>I# <ESC>
nmap<leader>2 <HOME>I## <ESC>
nmap<leader>3 <HOME>I### <ESC>
nmap<leader>4 <HOME>I#### <ESC>
nmap<leader>5 <HOME>I##### <ESC>
nmap<leader>6 <HOME>I###### <ESC>

imap h1 #
imap h2 ##
imap h3 ###
imap h4 ####
imap h5 #####
imap h6 ######

"create html list items
nmap <leader>l vip :s/^\(.*\)$/1. \1/g<CR><C-C>:noh<CR>

setlocal tabstop=4 shiftwidth=4
setlocal tabstop=4 shiftwidth=4
