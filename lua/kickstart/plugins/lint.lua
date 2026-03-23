return {
  { -- ESLint LSP
    'neovim/nvim-lspconfig',
    opts = function()
      local customizations = {
        { rule = 'style/*', severity = 'off', fixable = true },
        { rule = 'format/*', severity = 'off', fixable = true },
        { rule = '*-indent', severity = 'off', fixable = true },
        { rule = '*-spacing', severity = 'off', fixable = true },
        { rule = '*-spaces', severity = 'off', fixable = true },
        { rule = '*-order', severity = 'off', fixable = true },
        { rule = '*-dangle', severity = 'off', fixable = true },
        { rule = '*-newline', severity = 'off', fixable = true },
        { rule = '*quotes', severity = 'off', fixable = true },
        { rule = '*semi', severity = 'off', fixable = true },
      }

      vim.lsp.config('eslint', {
        filetypes = {
          'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
          'vue',
          'html',
          'markdown',
          'json',
          'jsonc',
          'yaml',
          'toml',
          'xml',
          'gql',
          'graphql',
          'astro',
          'svelte',
          'css',
          'less',
          'scss',
          'pcss',
          'postcss',
        },
        settings = {
          rulesCustomizations = customizations,
        },
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
              client:request_sync('workspace/executeCommand', {
                command = 'eslint.applyAllFixes',
                arguments = {
                  {
                    uri = vim.uri_from_bufnr(bufnr),
                    version = vim.lsp.util.buf_versions[bufnr],
                  },
                },
              }, 2000, bufnr)
            end,
          })
        end,
      })
      vim.lsp.enable 'eslint'
    end,
  },
}
