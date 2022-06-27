local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

for _, plugin in pairs(dvim.plugins) do
  require('packer').startup(function(use)
    use { plugin }
  end)
end

return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim" }

  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "antoinemadec/FixCursorHold.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "rcarriga/nvim-notify" }

  -- Colorschemes
  use { "lilydjwg/colorizer" }
  use { "nekonako/xresources-nvim" }
  use { "EdenEast/nightfox.nvim" }
  use { "lunarvim/colorschemes" }
  use { "dylanaraps/wal.vim" }
  use { "tomasiser/vim-code-dark" }
  use { "AlphaTechnolog/pywal.nvim" }
  use { "lighthaus-theme/vim-lighthaus" }
  use { "jacoborus/tender.vim" }
  use { "mcchrish/zenbones.nvim" }
  use { "rmehri01/onenord.nvim" }
  use { "Shatur/neovim-ayu" }
  use { "rafamadriz/neon" }
  use { "luisiacc/gruvbox-baby" }
  use { "folke/tokyonight.nvim" }
  use { "chriskempson/base16-vim" }
  use { "flazz/vim-colorschemes" }

  -- Indent Blankline
  use {
    "lukas-reineke/indent-blankline.nvim",
    disable = not dvim.builtin.plugins.indent_blankline.active,
  }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/nvim-lsp-installer" }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "onsails/lspkind-nvim" }
  use { "RRethy/vim-illuminate" }
  use { "folke/lua-dev.nvim" }
  use {
    "b0o/SchemaStore.nvim",
    disable = not dvim.builtin.filetypes.json.active,
  }
  use {
    "simrat39/symbols-outline.nvim",
    disable = not dvim.builtin.plugins.symbols_outline.active,
  }
  use { "ray-x/navigator.lua" }
  use { "ray-x/guihua.lua" }
  use { "ray-x/lsp_signature.nvim" }
  use { "rmagatti/goto-preview" }
  use { "tamago324/nlsp-settings.nvim" }

  -- Log files
  use {
    "mtdl9/vim-log-highlighting",
    disable = not dvim.builtin.filetypes.log.active,
  }

  -- WhichKey
  use {
    "max397574/which-key.nvim",
    disable = not dvim.builtin.plugins.which_key.active,
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    disable = not dvim.builtin.plugins.gitsigns.active,
  }
  use { "tpope/vim-rhubarb" }
  use { "tpope/vim-fugitive" }

  -- Comments
  use {
    "numToStr/Comment.nvim",
    disable = not dvim.builtin.plugins.comment.active,
  }

  -- Other
  use { "mattn/emmet-vim" }
  use { "Valloric/MatchTagAlways" }
  use { "alvan/vim-closetag" }
  use { "wakatime/vim-wakatime" }
  use { "easymotion/vim-easymotion" }
  use { "voldikss/vim-translator" }
  use { "dhruvasagar/vim-table-mode" }
  use { "machakann/vim-highlightedyank" }
  use { "turbio/bracey.vim" }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  }

  -- Surround
  use {
    "Mephistophiles/surround.nvim",
    disable = not dvim.builtin.plugins.surround.active,
  }

  -- Todo Comments
  use {
    "folke/todo-comments.nvim",
    disable = not dvim.builtin.plugins.todo_comments.active,
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    branch = "main",
    disable = not dvim.builtin.plugins.terminal.active,
  }

  use { "kyazdani42/nvim-web-devicons" } -- Icons

  -- TreeSitter
  use { "nvim-treesitter/nvim-treesitter", }
  use { "nvim-treesitter/playground" }

  -- GPS
  use {
    "SmiteshP/nvim-gps",
  }

  -- Debugging
  use {
    "mfussenegger/nvim-dap",
    disable = not dvim.builtin.plugins.dap.active,
  }
  use {
    "rcarriga/nvim-dap-ui",
    disable = not dvim.builtin.plugins.dap.active,
  }
  use {
    "theHamsta/nvim-dap-virtual-text",
    disable = not dvim.builtin.plugins.dap.active,
  }
  use {
    "ravenxrz/DAPInstall.nvim",
    disable = not dvim.builtin.plugins.dap.active,
  }
  use {
    "mfussenegger/nvim-dap-python",
    disable = not dvim.builtin.plugins.dap.active,
  }

  -- Alpha
  use {
    "goolord/alpha-nvim",
    disable = not dvim.builtin.plugins.alpha.active,
  }

  -- Snippets
  use {
    "SirVer/UltiSnips",
    disable = not dvim.builtin.plugins.ultisnips.active,
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    disable = not dvim.builtin.plugins.telescope.active,
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
    disable = not dvim.builtin.plugins.telescope.active,
  }

  -- Project
  use {
    "ahmedkhalf/project.nvim",
    disable = not dvim.builtin.plugins.project.active,
  }

  -- Copilot
  use {
    "github/copilot.vim",
    disable = not dvim.builtin.plugins.copilot.active,
  }
  use {
    "hrsh7th/cmp-copilot",
    disable = not dvim.builtin.plugins.copilot.active and not dvim.builtin.plugins.cmp.active,
  }

  -- CMP
  use {
    "hrsh7th/nvim-cmp",
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-buffer",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-path",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-nvim-lsp",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-nvim-lua",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "hrsh7th/cmp-calc",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "rcarriga/cmp-dap",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "quangnguyen30192/cmp-nvim-ultisnips",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }
  use {
    "kdheepak/cmp-latex-symbols",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active and not dvim.builtin.filetypes.latex.active,
  }
  use {
    "hrsh7th/cmp-emoji",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    disable = not dvim.builtin.plugins.autopairs.active,
  }

  -- NvimTree
  use {
    "kyazdani42/nvim-tree.lua",
    disable = not dvim.builtin.plugins.nvimtree.active,
  }

  -- Status Line and Bufferline
  use {
    "nvim-lualine/lualine.nvim",
    disable = not dvim.builtin.plugins.lualine.active,
  }
  use {
    "akinsho/bufferline.nvim",
    branch = "main",
    disable = not dvim.builtin.plugins.bufferline.active,
  }

  -- LaTeX
  use {
    "lervag/vimtex",
    disable = not dvim.builtin.filetypes.latex.active,
  }
  use {
    "KeitaNakamura/tex-conceal.vim",
    disable = not dvim.builtin.filetypes.latex.active,
  }

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    disable = not dvim.builtin.filetypes.markdown.active,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)