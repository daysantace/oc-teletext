-- config
port = -- port
broadcastDelay = 10 -- seconds between each broadcast

-- init libs
local event = require("event")
local component = require("component")
local term = require("term")

local modem = component.modem
local gpu = component.gpu

-- main loop

::menu::

while true do
  canBroadcast = true
  term.clear()
  print("OC-teletext")
  print("Version 1.0")
  print("")
  print("1 - Edit transmission text")
  print("2 - Broadcast")
  select = io.read()
  
-- broadcast
  if select == "2" then
    send = ""
    for line in io.lines("broadcast.txt") do
      send = send .. line .. ""
    end
    modem.broadcast(port,send)
  end
-- edit text

-- read file

  if select == "1" then
    print("Edit broadcast.txt directly, will implement later.")
  end
end
end