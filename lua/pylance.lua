local configs = require("lspconfig/configs")
local util = require 'lspconfig/util'


vim.cmd [[ let $ELECTRON_RUN_AS_NODE = 1 ]]
vim.cmd [[ let $VSCODE_NLS_CONFIG = '{"locale": "en"}' ]]

local _, _, plug_path = string.find(debug.getinfo(1, "S").source:sub(2),  "(.*/)lua/pylance.lua")

configs.pylance = {
    default_config = {
        cmd = {"node", plug_path .. "pkg/extension/dist/server.bundle.js", "--stdio"},
        filetypes = {"python"},
        root_dir = util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt");
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true;
              useLibraryCodeForTypes = true;
            };
          };
        };
    }
}
