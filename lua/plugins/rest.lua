require("rest-nvim").setup({
  -- Open request results in a horizontal split
  result_split_horizontal = false,
  -- Keep the http file buffer above|left when split horizontal|vertical
  result_split_in_place = false,
  -- Skip SSL verification, useful for unknown certificates
  skip_ssl_verification = false,
  -- Encode URL before making request
  encode_url = true,
  -- Highlight request on run
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
    -- toggle showing URL, HTTP info, headers at top the of result window
    show_url = true,
    show_http_info = true,
    show_headers = true,
    -- executables or functions for formatting response body [optional]
    -- set them to false if you want to disable them
    formatters = {
      json = "jq",
      html = function(body)
        return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
      end,
    },
  },
  -- Jump to request line on run
  jump_to_request = false,
  env_file = ".env",
  custom_dynamic_variables = {},
  yank_dry_run = true,
})

local wk = require("which-key")

local augroup = vim.api.nvim_create_augroup("RestNvim", {})
vim.api.nvim_clear_autocmds({ group = augroup })
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  pattern = { "*.http" },
  callback = function(bufnr)
    wk.register({
      r = {
        "<Plug>RestNvim",
        "Run the request under the cursor",
      },
      p = {
        "<Plug>RestNvimPreview",
        "Preview the request cURL command",
      },
      l = { "<Plug>RestNvimLast", "Re-run the last request" },
    }, {
      mode = "n",
      bufnr = bufnr,
      prefix = "<localleader>",
    })
  end,
})
