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
print("OC-teletext")
print("Version 1.1.1")
print("Broadcasting text.")

-- main loop

while true do
  -- broadcast
  os.sleep(5)

  textwr = ""

  for line in io.lines("broadcast.txt") do
    textwr = textwr .. line
  end
  modem.broadcast(port,textwr)
end