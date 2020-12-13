local configs = require("lspconfig/configs")
local util = require 'lspconfig/util'

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
