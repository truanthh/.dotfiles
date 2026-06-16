return {
  -- colorscheme
  { "truanthh/onenord.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onenord-light",
    },
  },

  -- disable trouble
  { "folke/noice.nvim", enabled = false },
  { "lewis6991/gitsigns.nvim", enabled = false },

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        view_options = {
          show_hidden = true,
        },
      })

      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

      -- Open parent directory in floating window
      vim.keymap.set("n", "<space>-", require("oil").toggle_float)
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false }, -- we set this in options.lua
      toggle = { map = LazyVim.safe_keymap_set },
      words = { enabled = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- LazyVim config for treesitter
      indent = { enable = true }, ---@type lazyvim.TSFeat
      highlight = { enable = true }, ---@type lazyvim.TSFeat
      folds = { enable = true }, ---@type lazyvim.TSFeat
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "vue",
        "css",
        "scss",
      },
    },
  },
}
