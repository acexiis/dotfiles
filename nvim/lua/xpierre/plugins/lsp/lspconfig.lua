return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    { "jose-elias-alvarez/null-ls.nvim", config = true },
  },
  config = function()
    -- import necessary plugins
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    -- Apply LSP settings
    lspconfig.pylsp.setup({
      settings = settings,
      capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = function(client, bufnr)
        -- Buffer local mappings
        local opts = { buffer = bufnr, silent = true }

        -- Define keybinds
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
      end,

    })

    -- Additional LSP configurations
    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      ["pylsp"] = function()
        lspconfig["pylsp"].setup({
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  ignore = { "E501" },
                  maxLineLength = 88,
                },
              },
            },
          },
        })
      end,
    })
  end,
}
