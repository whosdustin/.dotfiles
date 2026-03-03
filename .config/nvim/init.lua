-- UI Config
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

-- Tab
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Leader
vim.g.mapleader = " "

-- Keymaps
vim.keymap.set({"n", "v", "x"}, "<leader>y", '"*y')
vim.keymap.set({"n", "v", "x"}, "<leader>d", '"*d')
vim.keymap.set({"n"}, "<leader>f", ":Pick files<CR>")
-- vim.keymap.set({"n"}, "<leader>lf", vim.lsp.buf.format)

--Plugins
vim.pack.add({
	{ src = "git@github.com:catppuccin/nvim.git" },
	{ src = "git@github.com:nvim-lualine/lualine.nvim.git" },
	{ src = "git@github.com:nvim-mini/mini.pairs.git" },
	{ src = "git@github.com:nvim-mini/mini.icons.git" },
	{ src = "git@github.com:nvim-mini/mini.pick.git" },
	{ src = "git@github.com:lewis6991/gitsigns.nvim.git" },
})

vim.cmd("colorscheme catppuccin-mocha")

require "gitsigns".setup()
require "mini.pairs".setup()
require "mini.icons".setup()

-- Centered on screen
local pick_window = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW', height = height, width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

require "mini.pick".setup {
	window = { config = pick_window }
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
		lualine_a = {{"mode", separator = { left = '' }, right_padding = 2 }  },
		lualine_b = {"branch"},
		lualine_c = {
			{ filetype_icon, separator = "", padding = { left = 1, right = 0 } },
			{"filename"}
		},
		lualine_x = {"diff"},
		lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
	}
}

