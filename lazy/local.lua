
return {

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
        config = function()

            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup({})
            -- REQUIRED

            -- basic telescope configuration
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

            -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            --     { desc = "Open harpoon window" })
            vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end, {desc = "delete from harpoon"})
            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "add to harpoon"})
            vim.keymap.set("n", "<leader>hw", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "open harpoon" })

            vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, {desc = "harpoon file 1"})
            vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, {desc = "harpoon file 2"})
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, {desc = "harpoon file 3"})
            vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, {desc = "harpoon file 4"})
            vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, {desc = "harpoon file 5"})
            vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, {desc = "harpoon file 6"})
            vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, {desc = "harpoon file 7"})
            vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, {desc = "harpoon file 8"})

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<C-hn>", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<C-hb>", function() harpoon:list():next() end)
        end
    }
}
