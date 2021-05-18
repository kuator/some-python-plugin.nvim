# pylance.nvim

- https://github.com/neovim/nvim-lspconfig/pull/303
- https://github.com/microsoft/pylance-release/issues/4

Works only on Unix-like systems like Linux and Mac. You have to have Visual Studio Code and the Pylance extension installed. The latest working version is: 2021.3.2

Pylance support for nvim-lsp. Don't star it, Microsoft will probably notice and the repo will have to be deleted.

This plugin contains a basic configuation for nvim_lsp and
[script](./install.sh) to download and install latest vscode pylance server.

Make sure jq, curl, unzip, vi are installed to make script work.

---

[plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'aca/pylance.nvim', { 'do': './install.sh' }
```

[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
```lua
local nvim_lsp = require('nvim_lsp')

require 'pylance'
nvim_lsp.pylance.setup{
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict"
      }
    }
  }
}
```

If you think this plugin is useful, you can write something nice about me on [Linkedin](https://www.linkedin.com/in/kuat-abylkassymov-273bb2177). Not that you have to though 😉
