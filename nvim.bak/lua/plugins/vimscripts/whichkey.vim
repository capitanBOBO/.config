set timeoutlen=300
call which_key#register('<Space>', "g:which_key_map")

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {}

let g:which_key_map['q'] = {
            \'name': '+quit',
            \'q': [':qa', 'quit'],
            \'Q': [':q!', 'quit-whitout-save']
            \}



function SaveAndQuit()
    if confirm('Save and quit?', "&Yes\n&No", 1)==1
        :wq
    endif
endfunction

function! FileDir()
lua << END
  local cwd = require('telescope.utils').buffer_dir()
  require('telescope.builtin').find_files({ hidden=true, search_dirs={cwd} })
END
endfunction

let g:which_key_map['f'] = {
            \'name': '+file',
            \'s': [':w', 'save'],
            \'q': [":call SaveAndQuit()", 'save-and-quit'],
            \'r': [':Telescope oldfiles', 'recent-files'],
            \'c': [':call FileDir()', 'current-dir-files']
            \}


let g:which_key_map['s'] = {
            \'name': '+search',
            \'f': [':Telescope find_files', 'find-finles'],
            \ 'd' : [':Telescope live_grep', 'find-in-dir'],
            \ '/' : [':Telescope current_buffer_fuzzy_find', 'find-in-file'],
            \ 'w' : [':Telescope grep_string', 'find-by-word']
            \}

let g:which_key_map['b'] = {
            \'name': '+buffer',
            \'n': [':enew | Startify', 'new-buffer'],
            \'b': [':Telescope buffers', 'all-buffers'],
	    \'d' : [':bd', 'delete-buffer'],
            \'D' : [':%bd|e#|bd#', 'delete-all-but-this'],
            \']': [':BufferLineCycleNext', 'next-buffer'],
            \'[': [':BufferLineCyclePrev', 'prev-buffer'],
            \'.': [':BufferLineMoveNext', 'move-buffer-right'],
            \',': [':BufferLineMovePrev', 'move-buffer-left']
            \}


let g:which_key_map['t'] = {
            \'name': '+toggle',
            \'n': [':Neotree toggle', 'nvim-tree'],
            \'f': [':Neotree reveal', 'nvim-tree-on-file'],
            \}
let g:which_key_map['g'] = {
            \'name': '+git',
            \'p': [':Gitsigns preview_hunk', 'chunk-preview'],
            \']': [':Gitsigns next_hunk', 'chunk-next'],
            \'[': [':Gitsigns prev_hunk', 'chunk-prev'],
            \'s': [':Gitsigns stage_hunk', 'stage-chunk'],
            \'S': [':Gitsigns undo_stage_hunk', 'undo-stage-chunk'],
            \'b': [':Gitsigns stage_buffer', 'stage-buffer'],
            \'B': [':Gitsigns undo_stage_buffer', 'undo-stage-buffer'],
            \'d': [':Gitsigns diffthis', 'diff'],
            \'R': [':Gitsigns reset_hunk', 'reset-hunk'],
            \'a': [':Gitsigns blame_line', 'line-author'],
            \}

function Definition()
            :lua vim.lsp.buf.definition()
endfunction

let g:which_key_map['c'] = {
                                    \'name': '+code',
                                    \'d': [':call Definition()', 'go-to-definition'],
                                    \'p': [':Lspsaga preview_definition', 'preview-definition'],
                                    \'K': [':Lspsaga hover_doc', 'hover'],
                                    \'R': [':Lspsaga rename', 'rename'],
                                    \'D': {
                                                \'name': '+diagnostic',
                                                \'c': [':Lspsaga show_cursor_diagnostics', 'cursor'],
                                                \'l': [':Lspsaga show_line_diagnostics', 'line']
                                                \},
                                    \']': [':Lspsaga diagnostic_jump_next', 'next-error'],
                                    \'[': [':Lspsaga diagnostic_jump_prev', 'prev-error'],
                                    \'a': [':Lspsaga code_action', 'code-action']
                                    \}

