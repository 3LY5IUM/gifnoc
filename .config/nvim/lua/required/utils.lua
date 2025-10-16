
-- utils.lua
local M = {}

function M.check_completion()
  local info = vim.fn.complete_info()
  if info and info.selected ~= -1 then
    -- Something is selected, autocomplete
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n')
  else
    -- Nothing is selected, fallback to default behavior
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-y>', true, false, true), 'n')
  end
end

return M
