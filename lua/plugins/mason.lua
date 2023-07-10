return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require("mason").setup()
    end,
  },
  {
	"williamboman/mason-lspconfig.nvim", 
	config = function() 
     	  require("mason-lspconfig").setup({ensure_installed = { "lua_ls", "rust_analyzer" }})

    require("mason-lspconfig").setup_handlers {
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
    }
		end,
	},
  {"neovim/nvim-lspconfig"},
}

