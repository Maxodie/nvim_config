return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {}, {desc = "project file"})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, {desc = "string grep lower"})
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, {desc = "string grep upper"})

        vim.keymap.set('n', '<leader>psa', ":vimgrep //g **/*<left><left><left><left><left><left><left>", { desc = "vimgrep in all project"})
        vim.keymap.set('n', '<leader>psf', ":vimgrep //g %<left><left><left><left>", { desc = "vimgrep in current file"})
        vim.keymap.set('n', '<leader>pso', ":cope", { desc = "vimgrep open result (:cope)"})

        vim.keymap.set('n', '<leader>psn', ":cnext", { desc = "vimgrep next result (:cnext)"})
        vim.keymap.set('n', '<leader>psp', ":cprev", { desc = "vimgrep previous result (:cprev)"})

        vim.keymap.set('n', '<leader>psu', ":cprev", { desc = "vimgrep first result (:cfirst)"})
        vim.keymap.set('n', '<leader>psd', ":clast", { desc = "vimgrep last result (:clast)"})

        --vim.keymap.set('n', '<leader>ps', function()
            --builtin.grep_string({ search = vim.fn.input("Grep > ") })
        --end, {desc = "grep mais des fois seulement"})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {}, {desc = "telescope help tags"})
    end
}

