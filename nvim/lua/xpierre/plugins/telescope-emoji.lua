return {
    "xiyaowong/telescope-emoji.nvim",
    config = function()
      require("telescope").load_extension("emoji")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>se", "<cmd>Telescope emoji<cr>", { desc = "Search Emoji" })

    end,
}
