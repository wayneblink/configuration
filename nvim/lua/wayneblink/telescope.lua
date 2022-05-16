local action_state = require('telescope.actions.state')

require('telescope').setup{
	defaults = {
		prompt_prefix="$ ",
		mappings = {
			i = {
			} 
		}
	}
}
require('telescope').load_extension('fzf')

local mappings = {
}

local opt = require('telescope.themes').get_ivy()
mappings.curr_buff = function()
	require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
mappings.find_files = function()
	require('telescope.builtin').find_files(opt)
end
mappings.live_grep = function()
	require('telescope.builtin').live_grep(opt)
end
mappings.buffers = function()
	require('telescope.builtin').buffers(opt)
end
mappings.help_tags = function()
	require('telescope.builtin').help_tags(opt)
end
return mappings
