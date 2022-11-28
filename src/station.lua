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
print("Version 1.1")
print("Broadcasting text.")

-- main loop

while true do
  -- broadcast
  os.sleep(broadcastDelay)
  textwr = ""
  for line in io.lines("broadcast.txt") do
    textwr = textwr .. " ".. line
  end
  
  -- send colour
  cB = ""
  for line in io.lines("colourbg.txt") do
    cB = cB.. " " .. line
  end
  
  cF = ""
  for line in io.lines("colourfg.txt") do
    cF = cF .. " " .. line
  end
  
  modem.broadcast(port,textwr)
  modem.broadcast(port,cB)
  modem.broadcast(port,cF)
end