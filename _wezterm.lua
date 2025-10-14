local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.default_cwd = wezterm.home_dir

wezterm.log_error('Home ' .. wezterm.home_dir)
config.initial_rows = 35
config.initial_cols = 117

config.font = wezterm.font 'Fira Code'
config.font_size = 18

config.color_scheme = 'AdventureTime'

config.keys = {}
for i = 1, 8 do
  -- CMD+ALT + number to activate that window
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD|ALT',
    action = act.ActivateWindow(i - 1),
  })
end

for i = 1, 8 do
  -- CMD + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD',
    action = act.ActivateTab(i - 1),
  })
end

table.insert(config.keys, {
  key = 't',
  mods = 'CMD',
  action = act.SpawnCommandInNewTab { cwd = wezterm.home_dir, domain = 'DefaultDomain' },
})

table.insert(config.keys, {
  key = 'n',
  mods = 'CMD',
  action = act.SpawnCommandInNewWindow { cwd = wezterm.home_dir, domain = 'DefaultDomain' },
})

return config
