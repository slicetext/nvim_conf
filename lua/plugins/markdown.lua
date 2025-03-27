require('render-markdown').setup({
        pipe_table = {
        enabled = true,
        render_modes = false,
        preset = 'none',
        style = 'full',
        cell = 'padded',
        padding = 1,
        min_width = 0,
        border = {
            '┌', '┬', '┐',
            '├', '┼', '┤',
            '└', '┴', '┘',
            '│', '─',
        },
        alignment_indicator = '━',
        head = 'RenderMarkdownTableHead',
        row = 'RenderMarkdownTableRow',
        filler = 'RenderMarkdownTableFill',
    },
})
