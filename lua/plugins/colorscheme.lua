return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add gruvbox material also bc gruvbox is sick
  { "sainnhe/gruvbox-material" },

  -- add everforest
  { "neanias/everforest-nvim" },

  -- Configure LazyVim to load everforest
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
