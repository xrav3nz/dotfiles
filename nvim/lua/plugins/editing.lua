return {
  { "tpope/vim-eunuch" },

  {
    "saghen/blink.cmp",

    opts = {
      keymap = {
        preset = "default",
      },

      completion = {
        -- Don't select by default, auto insert on selection
        list = { selection = { preselect = false, auto_insert = true } },
      },
    },
  },
}
