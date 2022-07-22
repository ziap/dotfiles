#!/usr/bin/env luajit

-- Use a list because table keys are randomly sorted
-- It's also easier to add options or edit them this way
local options = {
  {
    name = " Sleep",
    command = "systemctl suspend"
  },
  {
    name = " Shut down",
    command = "systemctl poweroff"
  },
  {
    name = " Restart",
    command = "systemctl reboot"
  },
  {
    name = " Lock",
    command = "swaylock"
  },
  {
    name = " Log out",
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
  print(opt.name)
end
