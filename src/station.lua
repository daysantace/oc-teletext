-- config
port = nil -- port
broadcastDelay = 10 -- seconds between each broadcast

-- init libs
local event = require("event")
local component = require("component")
local term = require("term")

local modem = component.modem
local gpu = component.gpu

textwr = ""

if port == nil then
  term.clear()
  print("ERROR! You have not configured a port for this station.")
  print("Type edit station.lua in the command line and replace nil with your desired port number.")
  exit()
end

term.clear()

print("OC-teletext Station")
print("Version 1.3")
print("Broadcasting text.")
print("")
print("Broadcast info - Ctrl + Alt + C to exit")
print("Page                  | " .. port)
print("Seconds per broadcast | " .. broadcastDelay)

-- main loop

while true do
  -- broadcast
  os.sleep(broadcastDelay)
  textwr = ""
  for line in io.lines("broadcast.txt") do
    textwr = textwr .. " ".. line
  end
  
  modem.broadcast(port,textwr)
end
