local configs = require("lspconfig.configs")
local util = require 'lspconfig.util'


vim.cmd [[ let $ELECTRON_RUN_AS_NODE = 1 ]]
vim.cmd [[ let $VSCODE_NLS_CONFIG = '{"locale": "en"}' ]]

-- local pylance_home=vim.fn.system('find ~/opt/pkg -iname "*pylance*" -type d | sort | tail -1')
-- pylance_home = pylance_home:gsub("%s+", "")

configs.pylance = {
    default_config = {
        -- cmd = {"node", pylance_home .. "/dist/server.bundle.js", "--stdio"},
        cmd = {"pylance"},
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
