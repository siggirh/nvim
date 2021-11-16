let g:neoformat_enabled_python = ['black']

let g:neoformat_enabled_yaml = []
 
augroup fmt
  autocmd!
  autocmd BufWritePre * | Neoformat
augroup END
