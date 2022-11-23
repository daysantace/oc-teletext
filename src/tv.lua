-- config
port = -- port no.
page = 1 -- page no. default
textReqCldwn = 30 -- time in secs to request text

-- init
local event = require("event")
local component = require("component")
local colour = require("colors")

local gpu = component.gpu
local modem = component.gpu

gpu.setDepth(4)
gpu.setResolution(80,25)

-- main loop
while true do
_,_,_,_,_,txt=event.pull("modem_message")

-- update text
 gpu.fill(0,0,80,25," ")
 gpu.setBackground(colour.white,true)
 gpu.setForeground(colour.black,true)
 print("OC-Teletext v1.0 - Page " .. tostring(page))
 gpu.setBackground(colour.black,true)
 gpu.setForeground(colour.white,true)
 for i in string.gmatch(txt, "%S\n") do
  print(i)
 end
end