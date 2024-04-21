local M = {}

M.build_url = function(branch)
	local git_url = vim.fn.system("git config --get remote.origin.url")

	if git_url == "" then
		error("Not a git repository")
		return
	end

	if string.find(git_url, "https://") then
		git_url = string.sub(git_url, 1, -6)
	elseif string.find(git_url, "git@") then
		git_url = "https://github.com/ " .. string.sub(git_url, 16, -1)
	end

	local path = vim.fn.expand("%")
	local line_num = vim.api.nvim__buf_stats(0).current_lnum

	if branch == nil then
		branch = "main"
	end

	local combined = git_url .. "/blob/" .. branch .. "/" .. path .. "#L" .. line_num

	return combined
end

return M
