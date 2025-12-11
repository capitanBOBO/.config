function s:configfiles()
      return [
            \ {'line': 'zsh', 'path': '~/.config/zsh/zshrc' },
            \ {'line': 'skhd', 'path': '~/.config/skhd/README.org'},
            \ {'line': 'yabai', 'path': '~/.config/yabai/README.org'},
            \ {'line': 'nvim', 'path': '~/.config/nvim'},
            \ {'line': 'alacritty', 'path': '~/.config/alacritty/alacritty.toml'},
            \ {'line': 'tmux', 'path': '~/.config/tmux/tmux.conf'},
            \ {'line': 'vifm', 'path': '~/.config/vifm/vifmrc'},
            \ {'line': 'sketchybar', 'path': '~/.config/sketchybar'},
            \ {'line': 'lazygit', 'path': '~/Library/Application\ Support/lazygit/config.yml'}
            \]
endfunction

let g:startify_bookmarks = [
                  \ {'p': '~/Developer/'},
                  \ {'c': '~/.config'}
                  \]
function s:bookmarks()
  return [
      \ {'line': ' Projects', 'path': '~/Developer/'},
      \ {'line': ' Dotfiles', 'path': '~/.config/'}
      \]
endfunction
" let g:ascii = [
"       \'███╗   ██╗██╗   ██╗██╗███╗   ███╗',
"       \'████╗  ██║██║   ██║██║████╗ ████║',
"       \'██╔██╗ ██║██║   ██║██║██╔████╔██║',
"       \'██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
"       \'██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
"       \'╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝'
"       \]
let g:ascii = [
      \ '██╗      ██████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗',
      \ '██║     ██╔═══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║',
      \ '██║     ████████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║',
      \ '██║     ██╔═══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║',
      \ '███████╗██║   ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║',
      \ '╚══════╝╚═╝   ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝' 
      \ ]
let g:startify_custom_header = startify#pad(startify#fortune#boxed() + g:ascii) 
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': function('s:bookmarks'),
          \   'header': ['   Bookmarks'],
          \   'indices': ['p', 'c']
          \ },
          \ { 'type': function('s:configfiles'),
          \   'header': ['   Configs'], 
          \   'indices': ['z', 's', 'y', 'nv', 'a', 't', 'fm', 'sb', 'lg']
          \ },
          \ ]
