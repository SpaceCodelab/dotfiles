-- Shim for deprecated API used by some plugins
if vim.tbl_flatten == nil then
	vim.tbl_flatten = function(t)
		local result = {}
		local function _tbl_flatten(_t)
			for i = 1, #_t do
				local v = _t[i]
				if type(v) == "table" then
					_tbl_flatten(v)
				elseif v then
					result[#result + 1] = v
				end
			end
		end
		_tbl_flatten(t)
		return result
	end
end

-- Also override if it exists as deprecated
local _orig_tbl_flatten = vim.tbl_flatten
vim.tbl_flatten = function(t)
	if type(t) ~= "table" then
		return {}
	end
	local result = {}
	local function _tbl_flatten(_t)
		for i = 1, #_t do
			local v = _t[i]
			if type(v) == "table" then
				_tbl_flatten(v)
			elseif v then
				result[#result + 1] = v
			end
		end
	end
	_tbl_flatten(t)
	return result
end

require("config.plugMan")
require("config.options")
require("config.keymaps")

