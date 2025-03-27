local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
    theme="ivy",
  },
  pickers = {
      buffers = {
          theme = "ivy"
      },
      find_files = {
          theme = "ivy"
      },
      live_grep = {
          theme= "ivy"
      }
  }
}
