return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add gruvbox material also bc gruvbox is sick
  { "sainnhe/gruvbox-material" },

  -- add tokyknight
  { "folke/tokyonight.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
