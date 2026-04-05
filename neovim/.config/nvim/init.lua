-- UI Config
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

-- Tab
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.list = true
vim.o.listchars = "tab:› ,lead:.,trail:•"

-- Leader
vim.g.mapleader = " "

-- Keymaps
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"*y')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"*d')
vim.keymap.set({ "n" }, "<leader>p", ":Pick files<CR>")
vim.keymap.set({ "n" }, "<leader>lf", vim.lsp.buf.format)
vim.keymap.set({ "n" }, "<leader>lg", ":LazyGit<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>e", ":NvimTreeOpen<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>b", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover { border = "rounded", max_height = 25, max_width = 120 }
end, { desc = "Hover docs" })

--Plugins
vim.pack.add({
  { src = "git@github.com:catppuccin/nvim.git" },
  { src = "git@github.com:neovim/nvim-lspconfig.git" },
  { src = "git@github.com:nvim-lualine/lualine.nvim.git" },
  { src = "git@github.com:nvim-mini/mini.pairs.git" },
  { src = "git@github.com:nvim-mini/mini.icons.git" },
  { src = "git@github.com:nvim-mini/mini.pick.git" },
  { src = "git@github.com:lewis6991/gitsigns.nvim.git" },
  { src = "git@github.com:kdheepak/lazygit.nvim.git" },
  { src = "git@github.com:nvim-tree/nvim-tree.lua.git" },
  { src = "git@github.com:nvim-treesitter/nvim-treesitter.git" }
})

vim.cmd("colorscheme catppuccin-mocha")

vim.lsp.enable {
  "lua_ls",
  "gopls"
}

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" }}
    }
  }
})

require "mini.pairs".setup()
require "mini.icons".setup()
require "nvim-tree".setup()
require "nvim-treesitter".setup {
  ensure_installed = {
    "go", "lua", "typescript", "bash", "toml", "json", "html", "css"
  },
  highlight = {
    enable = true,
  }
}
require "gitsigns".setup {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  signs_staged = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
  },
}

-- Centered on screen
local pick_window = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW',
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

require "mini.pick".setup {
  window = {
    config = pick_window,
    prompt_prefix = "  ",
    prompt_caret = "󰗧"
  }
}

local filetype_icon = function()
  local ft = vim.bo.filetype
  return ft == "" and ft or MiniIcons.get("filetype", ft)
end

require "lualine".setup {
  options = {
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { "mode", separator = { left = '' }, right_padding = 2 } },
    lualine_b = { "branch" },
    lualine_c = {
      { filetype_icon, separator = "", padding = { left = 1, right = 0 } },
      { "filename" }
    },
    lualine_x = { "diff" },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  }
}
