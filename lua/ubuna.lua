local M = {}

M.name = "ubuna"

function M.highlight(mod)
	for name, value in pairs(require(mod)) do
		vim.api.nvim_set_hl(0, name, value)
	end
end

M.setup = function()
	local modules = "highlights"

	vim.api.nvim_buf_clear_namespace(0, -1, 0, -1)
	vim.api.nvim_set_hl_ns(0)

	vim.g.colors_name = M.name
	vim.o.background = "dark"
    vim.o.termguicolors = true

	for _, module in ipairs(require(modules)) do
		M.highlight(modules .. "." .. module)
	end
end

return M
