return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Configuración de la interfaz de Dadbod
      vim.g.db_ui_show_database_navigation = 1
      vim.g.db_ui_save_location = '~/.config/nvim/db_ui_queries'
    end,
  }
}
