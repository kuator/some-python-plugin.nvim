local configs = require("nvim_lsp/configs")
local _, _, plug_path = string.find(debug.getinfo(1, "S").source:sub(2),  "(.*/)lua/pylance.lua")

configs.pylance = {
    default_config = {
        cmd = {"node", plug_path .. "pkg/extension/dist/server.bundle.js", "--stdio"},
        filetypes = {"python"},
        root_dir = function()
            return vim.loop.cwd()
        end,
        -- https://github.com/microsoft/pylance-release#settings-and-customization
        settings = {
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
