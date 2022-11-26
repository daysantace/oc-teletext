-- config
port = -- port no.
page = 1 -- page no. default
textReqCldwn = 30 -- time in secs to request text

-- init
local event = require("event")
local component = require("component")
local colour = require("colors")
local serialization = require("serialization")
local term = require("term")
local gpu = component.gpu
local modem = component.modem

gpu.setDepth(4)
gpu.setResolution(80,25)

-- main loop
while true do
    _,_,_,_,modem_msg=event.pull("modem_message")
    text = modem_msg
    -- update text
    gpu.fill(1,1,80,25," ")
    gpu.setBackground(colour.white,true)
    gpu.setForeground(colour.black,true)
    gpu.fill(1,1,80,1," ")
    term.setCursor(1,1)
    print(0,0,tostring("OC-Teletext v1.0 - Page " .. tostring(page)))
    gpu.setBackground(colour.black,true)
    gpu.setForeground(colour.white,true)
    print(text)
end