require('trouble').setup({
	cmd="Trouble",
	opts={},
})
local x=vim.diagnostic.severity
vim.diagnostic.config{
    signs={
        text={
            [x.ERROR]="",
            [x.WARN]="",
            [x.INFO]="",
            [x.HINT]="󰌵",
        },
    },
}
