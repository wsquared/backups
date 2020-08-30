" Color
colorscheme monokai

"Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\}

let g:ale_enabled = 0

nmap <silent> <leader>a <Plug>(ale_next_wrap)

nmap <leader>af :ALEFix<CR>
nmap <leader>al :ALELint<CR>
nmap <leader>at :ALEToggle<CR>

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Ctrl P
let g:ctrl_p_show_hidden = 1

" Nerdtree
let NERDTreeShowHidden = 1

" Disabling highlighting
let g:ale_set_highlights = 1
let g:ale_completion_enabled = 1

" Only run linting when saving the file
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

"Python mode
let g:pymode_python = 'python3'
