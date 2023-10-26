local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    disable = {
      "python"
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    -- "deno",
  },
}

-- git support in nvimtree
M.nvimtree = {
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
  },

  renderer = {
    root_folder_label = true,
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        folder = {
          default = "",
        }
      }
    },
  },
}

M.blankline = {
  show_first_indent_level = true,
}
return M
