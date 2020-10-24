local configs = require("nvim_lsp/configs")

configs.pylance = {
    default_config = {
        cmd = {"pylance"},
        filetypes = {"python"},
        root_dir = function()
            return vim.loop.cwd()
        end,
        -- https://github.com/microsoft/pylance-release#settings-and-customization
        settings = {
            python = {}
        },
        -- TODO: remove this
        -- https://github.com/neovim/nvim-lspconfig/issues/299
        before_init = function(initialize_params, config)
            initialize_params["workspaceFolders"] = {
                {
                    name = "workspace",
                    uri = initialize_params["rootUri"]
                }
            }
        end
    }
}
