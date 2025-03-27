require("oil").setup{
    is_hidden_file = function(name, bufnr)
        return name ~= ".." and vim.startswith(name, ".")
    end,
    view_options={
        show_hidden=true,
    },
}
