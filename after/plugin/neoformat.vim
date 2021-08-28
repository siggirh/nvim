let g:neoformat_enabled_python = ['black']
 
augroup fmt
  autocmd!
  autocmd BufWritePre * | Neoformat
augroup END
