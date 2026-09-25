local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_hide(terminal_win)
    terminal_win = nil
    return
  end

  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.cmd("botright split")
    terminal_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
  else
    vim.cmd("botright split")
    terminal_win = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    terminal_buf = vim.api.nvim_get_current_buf()
    vim.bo.buflisted = false
    vim.bo.bufhidden = "hide"
  end

  vim.api.nvim_win_set_height(terminal_win, 15)
  vim.cmd("startinsert")
end

vim.keymap.set({"n", "t"}, "<C-/>", toggle_terminal)

