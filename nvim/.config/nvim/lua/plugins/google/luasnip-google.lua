return {
  url = 'sso://user/mccloskeybr/luasnip-google.nvim',
  dependencies = { 'L3MON4D3/LuaSnip' },
  config = function() require('luasnip-google').load_snippets() end,
}
