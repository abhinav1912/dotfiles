return {
  'vintharas/fzf-codesearch.nvim',
  url = 'sso://user/vintharas/fzf-codesearch.nvim',
  dependencies = { "ibhagwan/fzf-lua" },
  opts = {
    backend = 'cs', -- Select codesearch backend: 'cs' or 'csearch'
    corpus = 'piper', -- Select corpus to use when searching. 'piper' includes companydoc in addition to google3
    experimental = false, -- when true, passes `--experimental` flag to `cs`
    max_num_results = 50, -- max number of results
    find_file = {
      keymap = '<leader>fc',
      description = '[f]ind [c]odesearch',
      opts = {} -- use this to pass fzf-lua compatible options to the picker
    },
    find_query = {
      enable_proximity = true, -- adds proximity which defaults to CWD
      keymap = '<leader>fq',
      description = '[f]ind [q]uery',
      opts = {} -- use this to pass fzf-lua compatible options to the picker
    },
  }
}
