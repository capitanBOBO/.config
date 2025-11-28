function s:configfiles()
      return [
            \ {'line': 'zsh', 'path': '~/.zshrc'},
            \ {'line': 'skhd', 'path': '~/.config/skhd/skhdrc'},
            \ {'line': 'yabai', 'path': '~/.config/yabai/yabairc'},
            \ {'line': 'nvim', 'path': '~/.config/nvim'},
            \ {'line': 'alacritty', 'path': '~/.config/alacritty/alacritty.toml'},
            \ {'line': 'tmux', 'path': '~/.config/tmux/tmux.conf'},
            \ {'line': 'vifm', 'path': '~/.config/vifm/vifmrc'},
            \ {'line': 'sketchybar', 'path': '~/.config/sketchybar'}
            \]
endfunction

let g:startify_bookmarks = [
                  \ {'p': '~/Developer/'},
                  \ {'c': '~/.config'}
                  \]
let g:ascii = [
    \ '               __',
    \ '.-. .-..--.--.|__|.--------.',
    \ '|  \| ||  |  ||  ||        |',
    \ '|_|\__| \___/ |__||__|__|__|',
    \ ''
    \]
let g:startify_custom_header = startify#pad(startify#fortune#boxed() + g:ascii) 
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']},
          \ { 'type': function('s:configfiles'),
          \   'header': ['   Configs'], 
          \   'indices': ['z', 's', 'y', 'nv', 'a', 't', 'fm', 'sb']
          \ },
          \ ]
