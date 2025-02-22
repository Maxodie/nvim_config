function ColorMyPencils(color)
    color = color or "ayu"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })
        end
    },

    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('cyberdream').setup({
                disable_background = true,
            })

            vim.cmd("colorscheme cyberdream")

            ColorMyPencils()
        end,
    },

    {
        "ayu-theme/ayu-vim",
        lazy = false,
        priority = 1000,
        config = function()
            -- Pour changer le style, vous pouvez utiliser : AyuLight, AyuDark ou AyuMirage
            vim.g.ayucolor = "mirage" -- Choisissez votre variante ici : "light", "dark", ou "mirage"

            vim.cmd("colorscheme ayu")

            ColorMyPencils()
        end,
    }
}
