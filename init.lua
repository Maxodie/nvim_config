require("nvim_config.set")
require("nvim_config.remap")

require("nvim_config.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    },
    shader = "hlsl", -- make .shader files to have hlsl as filetype
    hlsl = "hsls", -- make .hlsl files to have hlsl filetype so treesitter gives it proper highlight
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = e.buf, desc = "goto def"})
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = e.buf, desc = "hover"})
        vim.keymap.set("n", "<leader>gws", function() vim.lsp.buf.workspace_symbol() end, {buffer = e.buf, desc = "query workspace symbol"})
        vim.keymap.set("n", "<leader>gd", function() vim.diagnostic.open_float() end, {buffer = e.buf, desc = "open flaot"})
        vim.keymap.set("n", "<leader>gca", function() vim.lsp.buf.code_action() end, {buffer = e.buf, desc = "code actions"})
        vim.keymap.set("n", "<leader>grr", function() vim.lsp.buf.references() end, {buffer = e.buf, desc = "references"})
        vim.keymap.set("n", "<leader>grn", function() vim.lsp.buf.rename() end, {buffer = e.buf, desc = "rename"})
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = e.buf, desc = "signature help"})
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = e.buf, desc = "goto next"})
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = e.buf, desc = "goto prev"})
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
