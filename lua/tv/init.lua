local build_url = require("utils").build_url

local M = {}

M.setup = function()
	vim.api.nvim_create_user_command("CopyGithubLink", function()
		local url = build_url()
		vim.fn.setreg("+", url)
	end, {})

	vim.api.nvim_create_user_command("CopyGithubLinkBranch", function(branch)
		local url = build_url(branch)
		vim.fn.setreg("+", url)
	end, { nargs = 1 })
end

return M
