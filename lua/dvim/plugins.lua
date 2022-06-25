local core_plugins = {
  { "wbthomason/packer.nvim" },

  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "antoinemadec/FixCursorHold.nvim" },
  { "lewis6991/impatient.nvim" },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("dvim.core.plugins.notify").setup()
    end,
  },

  -- Colorschemes
  { "EdenEast/nightfox.nvim" },
  { "lunarvim/colorschemes" },
  { "lunarvim/darkplus.nvim" },
  { "dylanaraps/wal.vim" },
  { "lilydjwg/colorizer" },
  { "tjdevries/colorbuddy.nvim" },
  { "tomasiser/vim-code-dark" },

  -- Indent Blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("dvim.core.plugins.indent-blankline").setup()
    end,
    disable = not dvim.builtin.plugins.indent_blankline.active,
  },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/nvim-lsp-installer" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "onsails/lspkind-nvim" },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("dvim.core.plugins.symbols-outline").setup()
    end,
    disable = not dvim.builtin.plugins.symbols_outline.active,
  },
  { "ray-x/navigator.lua" },
  { "ray-x/guihua.lua" },
  { "ray-x/lsp_signature.nvim" },
  { "rmagatti/goto-preview" },
  { "tamago324/nlsp-settings.nvim" },

  -- WhichKey
  {
    -- NOTE: Temporary fix till folke comes back
    "max397574/lua-dev.nvim",
    module = "lua-dev",
  },
  {
    "max397574/which-key.nvim",
    commit = "f03a259",
    config = function()
      require("dvim.core.plugins.which-key").setup()
    end,
    disable = not dvim.builtin.plugins.which_key.active,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("dvim.core.plugins.gitsigns").setup()
    end,
    event = "BufRead",
    disable = not dvim.builtin.plugins.gitsigns.active,
  },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-fugitive" },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("dvim.core.plugins.comment").setup()
    end,
    disable = not dvim.builtin.plugins.comment.active,
  },

  -- Other
  { "mattn/emmet-vim" },
  { "Valloric/MatchTagAlways" },
  { "alvan/vim-closetag" },
  { "wakatime/vim-wakatime" },
  { "easymotion/vim-easymotion" },
  { "voldikss/vim-translator" },
  { "dhruvasagar/vim-table-mode" },
  { "machakann/vim-highlightedyank" },
  { "turbio/bracey.vim" },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },

  -- Surround
  {
    "Mephistophiles/surround.nvim",
    config = function()
      require("dvim.core.plugins.surround").setup()
    end,
    disable = not dvim.builtin.plugins.surround.active,
  },

  -- Todo Comments
  {
    "folke/todo-comments.nvim",
    config = function()
      require("dvim.core.plugins.todo-comments").setup()
    end,
    disable = not dvim.builtin.plugins.todo_comments.active,
  },

  -- Jabs
  {
    "matbme/JABS.nvim",
    config = function()
      require("dvim.core.plugins.jabs").setup()
    end,
    disable = not dvim.builtin.plugins.jabs.active,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    branch = "main",
    config = function()
      require("dvim.core.plugins.terminal").setup()
    end,
    disable = not dvim.builtin.plugins.terminal.active,
  },

  { "kyazdani42/nvim-web-devicons" }, -- Icons

  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  { "nvim-treesitter/playground" },

  -- GPS
  {
    "SmiteshP/nvim-gps",
    config = function()
      require("dvim.core.plugins.gps").setup()
    end,
  },

  -- Winbar
  -- {
  --   "fgheng/winbar.nvim",
  --   config = function()
  --     require("dvim.core.plugins.winbar").setup()
  --   end,
  --   disable = not dvim.builtin.plugins.winbar.active,
  -- },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("dvim.core.plugins.dap").setup()
    end,
    disable = not dvim.builtin.plugins.dap.active,
  },
  {
    "rcarriga/nvim-dap-ui",
    disable = not dvim.builtin.plugins.dap.active,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    disable = not dvim.builtin.plugins.dap.active,
  },
  {
    "ravenxrz/DAPInstall.nvim",
    disable = not dvim.builtin.plugins.dap.active,
  },
  {
    "mfussenegger/nvim-dap-python",
    disable = not dvim.builtin.plugins.dap.active,
  },

  -- Alpha
  {
    "goolord/alpha-nvim",
    config = function()
      require("dvim.core.plugins.alpha").setup()
    end,
    disable = not dvim.builtin.plugins.alpha.active,
  },

  -- Snippets
  {
    "SirVer/UltiSnips",
    config = function()
      require("dvim.core.plugins.ultisnips").setup()
    end,
    disable = not dvim.builtin.plugins.ultisnips.active,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("dvim.core.plugins.telescope").setup()
    end,
    disable = not dvim.builtin.plugins.telescope.active,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
    disable = not dvim.builtin.plugins.telescope.active,
  },

  -- Project
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("dvim.core.plugins.project").setup()
    end,
    disable = not dvim.builtin.plugins.project.active,
  },

  -- Copilot
  {
    "github/copilot.vim",
    disable = not dvim.builtin.plugins.copilot.active,
  },
  {
    "hrsh7th/cmp-copilot",
    disable = not dvim.builtin.plugins.copilot.active and not dvim.builtin.plugins.cmp.active,
  },

  -- CMP
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("dvim.core.plugins.cmp").setup()
    end,
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "hrsh7th/cmp-buffer",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "hrsh7th/cmp-path",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "hrsh7th/cmp-nvim-lua",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "hrsh7th/cmp-calc",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "rcarriga/cmp-dap",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "tzachar/cmp-tabnine", run = "./install.sh",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "quangnguyen30192/cmp-nvim-ultisnips",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "kdheepak/cmp-latex-symbols",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },
  {
    "hrsh7th/cmp-emoji",
    requires = { "hrsh7th/nvim-cmp" },
    disable = not dvim.builtin.plugins.cmp.active,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("dvim.core.plugins.autopairs").setup()
    end,
    disable = not dvim.builtin.plugins.autopairs.active,
  },

  -- NvimTree
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("dvim.core.plugins.nvimtree").setup()
    end,
    disable = not dvim.builtin.plugins.nvimtree.active,
  },

  -- Status Line and Bufferline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("dvim.core.plugins.lualine").setup()
    end,
    disable = not dvim.builtin.plugins.lualine.active,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("dvim.core.plugins.bufferline").setup()
    end,
    branch = "main",
    event = "BufWinEnter",
    disable = not dvim.builtin.plugins.bufferline.active,
  },

  -- LaTeX
  {
    "lervag/vimtex",
    config = function()
      require("dvim.core.plugins.vimtex").setup()
    end,
    disable = not dvim.builtin.plugins.latex.active,
  },
  {
    "KeitaNakamura/tex-conceal.vim",
    disable = not dvim.builtin.plugins.latex.active,
  },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      require("dvim.core.plugins.markdown").setup()
    end,
    disable = not dvim.builtin.plugins.markdown.active,
  },
}

for _, entry in ipairs(core_plugins) do
  if os.getenv("DVIM_DEV_MODE") then
    entry["lock"] = true
  end
end

return core_plugins
