#!/usr/bin/env luajit

-- Use a list because table keys are randomly sorted
-- It's also easier to add options or edit them this way
local options = {
  {
    name = "Sleep",
    icon = "system-suspend",
    command = "systemctl suspend"
  },
  {
    name = "Shut down",
    icon = "system-shutdown",
    command = "systemctl poweroff"
  },
  {
    name = "Restart",
    icon = "system-reboot",
    command = "systemctl reboot"
  },
  {
    name = "Lock",
    icon = "system-lock-screen",
    command = "swaylock"
  },
  {
    name = "Log out",
    icon = "system-log-out",
    command = "swaymsg exit"
  }
}

for i, opt in ipairs(options) do
  if arg[1] then
    if opt.name == arg[1] then
      os.execute(opt.command)
    end
  else
    print(opt.name..'\0icon\x1f'..opt.icon)
  end
end
