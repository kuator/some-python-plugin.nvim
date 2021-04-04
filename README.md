# pylance.nvim

- https://github.com/neovim/nvim-lspconfig/pull/303
- https://github.com/microsoft/pylance-release/issues/4

Pylance support for nvim-lsp.

This plugin just contains basic configuation for nvim_lsp and
[script](./install.sh) to download and install latest vscode pylance server.

Make sure jq, curl, unzip is installed to make script works.

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

If you think this plugin is useful,
you can write something nice about me on [Linkedin](https://www.linkedin.com/in/kuat-abylkassymov-273bb2177).
Not that you have to though 😉
