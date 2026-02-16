"===================================
"LATEX SECTION
"===================================

" setlocal textwidth=72

" Add chapter tag
nmap <leader>c <HOME>v$"zdi\chapter{<ESC>"zp$a}<ESC>

" Add section tag
nmap <leader>s <HOME>v$"zdi\section{<ESC>"zp$a}<ESC>

" Add subsection tag
nmap <leader>ss <HOME>v$"zdi\subsection{<ESC>"zp$a}<ESC>

" Add textt tag
nmap <leader>t <HOME>v$"zdi\texttt{<ESC>"zp$a}<ESC>

" Insert item tag
nmap <leader>i I\item <ESC>

" Create item lists
nmap <leader>l vip :s/^\(.*\)$/\\item \1/g<CR><C-C>:noh<CR>

" Itemize
nmap <leader>bi I\begin{itemize}<CR>\end{itemize}<ESC>

" verbatim block
vmap <leader>v "zdO\being{verbatim}<CR><ESC>"zgp<ESC>o\end{verbatim}}<ESC>




