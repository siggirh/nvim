vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function load_module(m)
  local status, mod = pcall(require, m)
  if not status then return nil end
  return mod
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = load_module("lazy")
if not lazy then return end

lazy.setup({
  'tjdevries/colorbuddy.nvim',

  'f-person/auto-dark-mode.nvim',

  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

  {
    'folke/which-key.nvim',
    opts = {},
  },

  'nvim-lualine/lualine.nvim',

  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },

  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    tag = "v0.9.0",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },

  'psf/black',

  {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
  }
})

-- Settings
vim.cmd [[set exrc]]
vim.cmd [[set nu]]
vim.cmd [[set relativenumber]]
vim.cmd [[set nohlsearch]]
vim.cmd [[set hidden]]
vim.cmd [[set noerrorbells]]
vim.cmd [[set tabstop=2]]
vim.cmd [[set softtabstop=2]]
vim.cmd [[set shiftwidth=2]]
vim.cmd [[set expandtab]]
vim.cmd [[set smartindent]]
vim.cmd [[set nowrap]]
vim.cmd [[set noswapfile]]
vim.cmd [[set nobackup]]
vim.cmd [[set undodir=~/.vim/undodir]]
vim.cmd [[set undofile]]
vim.cmd [[set incsearch]]
vim.cmd [[set termguicolors]]
vim.cmd [[set scrolloff=8]]
vim.cmd [[set noshowmode]]
vim.cmd [[set completeopt=menu,menuone,noselect]]
vim.cmd [[set signcolumn=number]]
vim.cmd [[set updatetime=50]]
vim.cmd [[set lazyredraw]]
vim.cmd [[set cursorline]]

vim.o.updatetime = 50
vim.o.mouse = 'a'

-- Disable netrw for nvimtree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Prettier
vim.cmd [[let g:prettier#exec_cmd_async = 1]]
vim.cmd [[let g:prettier#autoformat = 1]]
vim.cmd [[let g:prettier#autoformat_require_pragma = 0]]

-- Black
vim.cmd [[autocmd BufWritePre *.py execute ':Black']]

--
-- Modules
--
local lualine = load_module('lualine')
if lualine then
  lualine.setup({
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
    },
    sections = {
      lualine_b = { 'filename' },
      lualine_c = { 'branch', 'diff' },
      lualine_x = {},
      lualine_y = { 'diagnostics' },
    },
  })
end

local colorbuddy = load_module("colorbuddy")
if colorbuddy then
  colorbuddy.setup()
end


local auto_dark_mode = load_module('auto-dark-mode')
if auto_dark_mode then
  auto_dark_mode.setup({
    update_interval = 1000,
    set_dark_mode = function()
      vim.cmd [[ colorscheme catppuccin-macchiato ]]
      vim.cmd [[ highlight! MatchParen guibg=NONE ]]
      vim.cmd [[ highlight! NormalFloat guibg=NONE ]]
      vim.cmd [[ highlight! FloatBorder guibg=#1e2030 ]]
    end,
    set_light_mode = function()
      vim.cmd [[ colorscheme catppuccin-latte ]]
      vim.cmd [[ highlight! MatchParen guibg=NONE ]]
      vim.cmd [[ highlight! NormalFloat guibg=NONE ]]
      vim.cmd [[ highlight! FloatBorder guibg=#e6e9ef ]]
    end,
  })

  auto_dark_mode.init()
end

local cmp = load_module("cmp")
if cmp then
  cmp.setup({
    completion = {
      --keyword_length = 3,
    },
    matching = {
      disallow_fuzzy_matching = true,
      disallow_prefix_unmatching = true,
      disallow_partial_matching = true,
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        end
      end, { "i", "s" }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }
  })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)


local mason = load_module('mason')
if mason then
  mason.setup()
end


local mason_lspconfig = load_module('mason-lspconfig')
if mason_lspconfig then
  mason_lspconfig.setup({
    ensure_installed = {
      'pyright',
      'tsserver',
      'eslint',
      'lua_ls',
    },
  })
end

local nvim_lsp = load_module('lspconfig')
if nvim_lsp then
  local capabilities = load_module('cmp_nvim_lsp').default_capabilities()

  local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)

    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
      vim.api.nvim_command [[augroup END]]
    end
  end

  nvim_lsp.eslint.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })

  nvim_lsp.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = {
          enable = false
        },
        workspace = {
          checkThirdParty = false,
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.stdpath "config" .. "/lua"] = true,
          },
        },
      },
    },
  })

  nvim_lsp.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "typescript.tsx"
    },
    cmd = {
      "typescript-language-server",
      "--stdio"
    }
  })

  nvim_lsp.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end


local nvim_tree = load_module('nvim-tree')
if nvim_tree then
  nvim_tree.setup({
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          git = false,
          folder = false,
          file = true,
          folder_arrow = true,
        }
      }
    },
    view = {
      adaptive_size = true,
    },
    git = {
      enable = false,
    },
    diagnostics = {
      enable = false,
    },
    filters = {
      dotfiles = false,
      custom = {
        "node_modules",
        "venv",
        ".DS_Store",
        ".idea",
        ".vscode",
        ".mypy_cache",
        "__pycache__",
        ".pytest_cache",
        ".git$"
      },
    },
    update_focused_file = {
      enable = true,
    }
  })
end


local telescope = load_module('telescope')
local actions = load_module('telescope.actions')
if telescope and actions then
  telescope.setup({
    defaults = {
      file_sorter = require('telescope.sorters').get_fzf_sorter,
      prompt_prefix = '  ',
      color_devicons = true,
      file_ignore_patterns = { '.git/', 'package-lock.json', 'venv/', 'node_modules/', 'build/', 'dist/' },
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
      mappings = {
        n = {
          ["C-x"] = false,
          ["C-q"] = actions.send_to_qflist,
          ["q"] = actions.close
        }
      }
    },
    pickers = {
      find_files = {
        hidden = true,
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
      },
    }
  })

  telescope.load_extension('fzf')
end


local treesitter = load_module('nvim-treesitter.configs')
if treesitter then
  treesitter.setup({
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false
    },
    indent = {
      enable = true,
    },
    ensure_installed = {
      "css",
      "dockerfile",
      "go",
      "html",
      "javascript",
      "json",
      "json5",
      "jsonc",
      "lua",
      "prisma",
      "python",
      "scss",
      "tsx",
      "typescript",
      "vim",
      "yaml",
      "markdown",
      "markdown_inline",
    }
  })
end

--
-- Keymaps
--
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap('<leader>fp', '<cmd>Telescope find_files<cr>')
nmap('<leader>ff', '<cmd>Telescope live_grep<cr>')
nmap('<leader>fb', '<cmd>Telescope buffers<cr>')
nmap('<leader>fh', '<cmd>Telescope help_tags<cr>')

imap('jk', '<Esc>')
nmap('<leader>h', '<cmd>wincmd h<cr>')
nmap('<leader>j', '<cmd>wincmd j<cr>')
nmap('<leader>k', '<cmd>wincmd k<cr>')
nmap('<leader>l', '<cmd>wincmd l<cr>')
nmap('<leader>w', '<cmd>wincmd v<cr> <cmd>wincmd l<cr>')
nmap('<leader>W', '<cmd>wincmd s<cr> <cmd>wincmd j<cr>')

nmap('<C-e>', '<cmd>NvimTreeToggle<cr>')
nmap('<leader>ef', '<cmd>NvimTreeFindFile<cr>')
nmap('<leader>er', '<cmd>NvimTreeRefresh<cr>')

nmap('<C-h>', '<cmd>vertical resize +10<cr>')
nmap('<C-l>', '<cmd>vertical resize -10<cr>')

nmap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')

nmap('<leader>fm', '<cmd>w<cr><cmd>!isort %<cr><cmd>!black %<cr>')
