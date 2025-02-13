-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "v", "x", "o" }, "<A-l>", function()
  LazyVim.format({ force = true })
end)

local wk = require("which-key")
local cmd = function(command)
  return "<Esc><Cmd>" .. command .. "<CR>"
end

wk.add({
  { "<leader>dd", cmd([[lua require'dap'.continue()]]), desc = "Start" },
  { "<F1>", cmd([[lua require'dap'.continue()]]), desc = "Start" },
  { "<F2>", cmd([[lua require'dap'.run_to_cursor()]]), desc = "Run to cursor" },
  { "<F3>", cmd([[lua require'dap'.step_over()]]), desc = "Step Over" },
  { "<F4>", cmd([[lua require'dap'.step_into()]]), desc = "Step Into" },
  { "<F5>", cmd([[lua require'dap'.step_out()]]), desc = "Step Out" },
  { "<F6>", cmd([[lua require'dap'.run_last()]]), desc = "Run Last" },
  { "<F11>", cmd([[lua require'dap'.terminate()]]), desc = "Terminate" },
})
