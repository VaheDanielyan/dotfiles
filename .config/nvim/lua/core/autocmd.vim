autocmd BufReadPost,FileReadPost * normal zR

autocmd BufWritePre * :%s/\s\+$//e

