set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" init.vim
lua << EOF

-- init.lua

-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {
    'bash',
    'diff',
    'git_rebase',
    'gitcommit',
    'help',
    'html',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'org',
    'python',
    'terraform',
    'toml',
    'vim',
    'yaml',
  },
    -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/calendar/aiven.org', '~/calendar/nhw.org'},
  -- org_default_notes_file = '~/Dropbox/org/refile.org',
  notifications = {
    enabled = true,
    cron_enabled = true,
    repeater_reminder_time = true,
    deadline_warning_reminder_time = true,
    reminder_time = 10,
    deadline_reminder = true,
    scheduled_reminder = true,
    notifier = function(tasks)
      local result = {}
      for _, task in ipairs(tasks) do
        require('orgmode.utils').concat(result, {
          string.format('# %s (%s)', task.category, task.humanized_duration),
          string.format('%s %s %s', string.rep('*', task.level), task.todo, task.title),
          string.format('%s: <%s>', task.type, task.time:to_string())
        })
      end

      if not vim.tbl_isempty(result) then
        require('orgmode.notifications.notification_popup'):new({ content = result })
      end
    end,
    cron_notifier = function(tasks)
      for _, task in ipairs(tasks) do
        local title = string.format('%s (%s)', task.category, task.humanized_duration)
        local subtitle = string.format('%s %s %s', string.rep('*', task.level), task.todo, task.title)
        local date = string.format('%s: %s', task.type, task.time:to_string())

        -- Linux
        if vim.fn.executable('notify-send') == 1 then
          vim.loop.spawn('notify-send', { args = { string.format('%s\n%s\n%s', title, subtitle, date) }})
        end
-- for cron:
 -- * * * * * DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/neil/bin/nvim --headless --noplugin -c 'lua require("orgmode").cron()'

        -- MacOS
        if vim.fn.executable('terminal-notifier') == 1 then
          vim.loop.spawn('terminal-notifier', { args = { '-title', title, '-subtitle', subtitle, '-message', date }})
        end
      end
    end
  },
})

EOF
