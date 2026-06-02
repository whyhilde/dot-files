local M = {}


function M.setup(opts)
  vim.api.nvim_buf_create_user_command(0, opts.command,
    function()
      local cwf = vim.fn.expand("%:.")
      for _, rule in ipairs(opts.rules) do
        if string.find(cwf, rule.detect) then
          local target
          if rule.transform then
            target = rule.transform(cwf)
          else
            target = string.gsub(
              cwf,
              rule.gsub_pattern,
              rule.gsub_replacement
            )
          end
          vim.cmd("edit " .. target)
          return
        end
      end
    end,
    {
      desc = "toggle between test and source code",
    }
  )


  vim.keymap.set("n", "<localleader>ot", "<cmd>" .. opts.command .. "<cr>",
    {
      desc = "toggle between test and source code",
      buffer = true,
    }
  )
end


return M
