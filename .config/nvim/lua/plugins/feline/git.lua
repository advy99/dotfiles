local GIT = {}

GIT.status = {}


function GIT.file_is_in_repo ()
	return (GIT.status ~= nil)
end


function GIT.update ()
	GIT.status = vim.b.gitsigns_status_dict
end


return GIT
