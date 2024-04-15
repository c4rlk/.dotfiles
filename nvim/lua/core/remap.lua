-- Remap leader and local leader to <Space>
vim.api.nvim_set_keymap("", "<Space>", "<Np>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader= " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- no highlight
map("n", "<esc><esc>", ":noh<return><esc>", {silent = true})

-- Remap movement between Windows
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")

-- Undo Points
map("i", "<c-u>", "<c-g>u<c-u>")
map("i", "<c-w>", "<c-g>u<c-w>")

-- format the current buffer
map('n', "<leader>fm", ":lua vim.lsp.buf.format()<CR>", {})

map("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", {})

map('n', "<leader>d", "\"_d", {})
map('x', "<leader>d", "\"_d", {})
