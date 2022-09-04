local cmp = require('cmp')
local lspkind = require('lspkind')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp')

cmp.setup({
  completion = {
    autocomplete = false,
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
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
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' }
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
    })
  }
})

capabilities.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup({
  capabilities = capabilities
})

lspconfig.pyright.setup({
  capabilities = capabilities
})
