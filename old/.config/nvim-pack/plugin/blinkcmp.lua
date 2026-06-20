require("blink.cmp").build():wait(60000)
require("blink.cmp").setup({
  enabled = true,
  cmdline = {
    enabled = false,
  },
  completion = {
    menu = {
      auto_show = true,
      draw = {
        columns = {
          {
            "label",
          },
          {
            "kind",
          },
        },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
    },
  },
  keymap = {
    preset = "none",
    ["<c-j>"] = {
      "select_next",
      "fallback",
    },
    ["<c-k>"] = {
      "select_prev",
      "fallback",
    },
    ["<down>"] = {
      "select_next",
      "fallback",
    },
    ["<up>"] = {
      "select_prev",
      "fallback",
    },
    ["<c-c>"] = {
      "hide",
    },
    ["<cr>"] = {
      "accept",
      "fallback",
    },
  },
})
