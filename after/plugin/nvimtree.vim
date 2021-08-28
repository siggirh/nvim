let g:nvim_tree_auto_open = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_highlight_opened_files = 1

let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

nnoremap <leader>nn <cmd>NvimTreeToggle<cr>
nnoremap <leader>nr <cmd>NvimTreeRefresh<cr>
nnoremap <leader>nf <cmd>NvimTreeFindFile<cr>
nnoremap <leader>nc <cmd>NvimTreeClose<cr>

