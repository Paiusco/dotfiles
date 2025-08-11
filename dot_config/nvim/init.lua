require("core.options")
require("core.keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({
  require("custom.plugins.vim-sleuth"),
  require("custom.plugins.neogit"),
  require("custom.plugins.telescope"),
  require("custom.plugins.treesitter"),
  require("custom.plugins.todo-comments"),
  require("custom.plugins.which-key"),
  require("custom.plugins.colourscheme"),
  require("custom.plugins.mini"),
  require("custom.plugins.lsp"),
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        -- config
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
          },
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  -- { -- Autoformat
  --  "stevearc/conform.nvim",
  --  event = { "BufWritePre" },
  --  cmd = { "ConformInfo" },
  --  keys = {
  --    {
  --      "<leader>f",
  --      function()
  --        require("conform").format({ async = true, lsp_format = "fallback" })
  --      end,
  --      mode = "",
  --      desc = "[F]ormat buffer",
  --    },
  --  },
  --  opts = {
  --    notify_on_error = false,
  --    format_on_save = function(bufnr)
  --      -- Disable "format_on_save lsp_fallback" for languages that don't
  --      -- have a well standardized coding style. You can add additional
  --      -- languages here or re-enable it for the disabled ones.
  --      local disable_filetypes = { c = true, cpp = true }
  --      local lsp_format_opt
  --      if disable_filetypes[vim.bo[bufnr].filetype] then
  --        lsp_format_opt = "never"
  --      else
  --        lsp_format_opt = "fallback"
  --      end
  --      return {
  --        timeout_ms = 500,
  --        lsp_format = lsp_format_opt,
  --      }
  --    end,
  --    formatters_by_ft = {
  --      lua = { "stylua" },
  --      -- Conform can also run multiple formatters sequentially
  --      python = { "isort", "black" },
  --      --
  --      -- You can use 'stop_after_first' to run the first available formatter from the list
  --      -- javascript = { "prettierd", "prettier", stop_after_first = true },
  --    },
  --  },
  -- },



  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  require("kickstart.plugins.neo-tree"),
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
