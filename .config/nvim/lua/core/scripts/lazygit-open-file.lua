return function(filename, line_number)
  line_number = tonumber(line_number) or 1

  -- Strip surrounding quotes if present (lazygit adds these for paths with spaces)
  filename = filename:gsub('^"(.*)"$', "%1")

  vim.api.nvim_win_close(0, true)
  vim.api.nvim_command("edit +" .. line_number .. " " .. vim.fn.fnameescape(filename))
end
