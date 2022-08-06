#!/usr/bin/env luajit

-- Use a list because table keys are randomly sorted
-- It's also easier to add options or edit them this way
local options = {
  {
    icon = "system-suspend",
    name = "Sleep",
    command = "systemctl suspend"
  },
  {
    icon = "system-shutdown",
    name = "Shut down",
    command = "systemctl poweroff"
  },
  {
    icon = "system-reboot",
    name = "Restart",
    command = "systemctl reboot"
  },
  {
    icon = "system-lock-screen",
    name = "Lock",
    command = "swaylock"
  },
  {
    icon = "system-log-out",
    name = "Log out",
    command = "swaymsg exit"
  }
}

local opt_map = {}
for i, opt in ipairs(options) do
  opt_map[opt.name] = opt.command
end

local selection = arg[1]

if selection then
  if opt_map[selection] then
    io.popen(opt_map[selection]) 
  end
  os.exit()
end

for i, opt in ipairs(options) do
  print(opt.name.."\0icon\x1f"..opt.icon)
end
