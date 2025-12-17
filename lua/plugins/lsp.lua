return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim',       opts = {} },
    'hrsh7th/cmp-nvim-lsp',
  },

  config = function()
    ---------------------------------------------------------------------------
    -- Completely disable diagnostics across all languages --------------------
    ---------------------------------------------------------------------------
    vim.diagnostic.config {
      virtual_text = false,
      signs = false,
      underline = false,
      update_in_insert = false,
      severity_sort = false,
    }
    vim.diagnostic.disable()

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.rs',
      callback = function()
        vim.lsp.buf.format {
          async = false,
          timeout_ms = 3000,
          filter = function(client)
            return client.name == 'rust_analyzer'
          end,
        }
      end,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        vim.diagnostic.disable(0)
      end,
    })
    ---------------------------------------------------------------------------

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      clangd = {
        cmd = { 'clangd', '--offset-encoding=utf-16', '--clang-tidy=false' },
        init_options = { clangTidy = false },
        handlers = {
          ['textDocument/publishDiagnostics'] = function() end,
        },
        on_attach = function(client, _)
          client.server_capabilities.diagnosticProvider = false
        end,
      },
      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            diagnostics = { enable = false },
          },
        },
      },
      rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = 'clippy' },
          },
        },
      },
      pylsp = {
        handlers = {
          ['textDocument/publishDiagnostics'] = function() end,
        },
        on_attach = function(client, _)
          client.server_capabilities.diagnosticProvider = false
        end,
      },
      jdtls = {
        handlers = {
          ['textDocument/publishDiagnostics'] = function() end,
        },
        on_attach = function(client, _)
          client.server_capabilities.diagnosticProvider = false
        end,
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'black',
      'clangd',
      'jdtls',
      'rust-analyzer',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
