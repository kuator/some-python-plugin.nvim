local configs = require("lspconfig/configs")
local util = require 'lspconfig/util'


vim.cmd [[ let $ELECTRON_RUN_AS_NODE = 1 ]]
vim.cmd [[ let $VSCODE_NLS_CONFIG = '{"locale": "en"}' ]]

pylance_home=vim.fn.system('find ~/.vscode/extensions -iname "*pylance*" -type d | sort | tail -1')

configs.pylance = {
    default_config = {
        cmd = {"node", pylance_home .. "/dist/server.bundle.js", "--stdio"},
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
