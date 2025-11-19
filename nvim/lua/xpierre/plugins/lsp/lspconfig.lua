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
    local lspconfig = require("lspconfig")
    local lspconfigs = require("lspconfig.configs")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local flake_ignores = {
      "E203",
      "W503",
      "E501",
      "C901",
    }

    local custom_servers = {
      lua_ls = {
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
      },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              mccabe = { enabled = false },
              flake8 = {
                enabled = true,
                ignore = table.concat(flake_ignores, ","),
              },
              pycodestyle = {
                ignore = { "E501", "W291" },
                maxLineLength = 88,
              },
            },
          },
        },
      },
    }

    local warned = {}

    local function setup_server(server, opts)
      if not lspconfigs[server] then
        if not warned[server] then
          warned[server] = true
          vim.schedule(function()
            vim.notify(string.format("[lspconfig] server '%s' is not available", server), vim.log.levels.WARN)
          end)
        end
        return
      end
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, opts or {}))
    end

    for server, opts in pairs(custom_servers) do
      setup_server(server, opts)
    end

    for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
      if not custom_servers[server] then
        setup_server(server)
      end
    end
  end,
}
