-----------------------------------------------------------
-- zepl Configuration
-----------------------------------------------------------
-- Plugin: axvr/zepl.vim

vim.cmd [[
  let g:repl_config = {
              \   'javascript': { 'cmd': 'node' },
              \   'scheme': { 'cmd': 'scheme' },
              \   'julia': { 'cmd': 'julia' },
              \   'R': { 'cmd': 'R' },
              \   'python': { 'cmd': 'python3' }
              \ }
]]
