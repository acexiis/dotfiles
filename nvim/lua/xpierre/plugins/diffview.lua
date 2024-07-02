return {
  "sindrets/diffview.nvim",
    config = function()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>", { desc = "Diff view open" })
  end,

}
