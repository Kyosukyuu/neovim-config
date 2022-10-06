-- highlighting colors for webdev
-- avoid using render = "first_column" because it breaks nvim-treesitter syntax highlighting
require('nvim-highlight-colors').setup {
	render = 'background', -- or 'foreground' or 'first_column'
	enable_named_colors = true,
	enable_tailwind = false
}

