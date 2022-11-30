-- config
port = -- port
broadcastDelay = 10 -- seconds between each broadcast

-- init libs
local event = require("event")
local component = require("component")
local term = require("term")
local serialization = require("serialization")
local modem = component.modem
local gpu = component.gpu

textwr = ""

term.clear()
print("OC-teletext Station")
print("Version 1.3")
print("Broadcasting text.")
print("")
print("Broadcast info:")
print("Port                  | " .. port)
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
