#!/usr/bin/luajit

local options = {
  [" Sleep"] = "systemctl suspend",
  [" Shut down"] = "systemctl poweroff",
  [" Restart"] = "systemctl reboot",
  [" Lock"] = "swaylock",
  [" Log out"] = "swaymsg exit"
}
local selection = arg[1]

if selection then
  if options[selection] then
    io.popen(options[selection]) 
  end
  os.exit()
end

for i, _ in pairs(options) do
  print(i)
end
