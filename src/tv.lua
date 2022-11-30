-- config
port = -- port no.
page = 1 -- page no. default
textReqCldwn = 30 -- time in secs to request text

-- init
local event = require("event")
local component = require("component")
local colour = require("colors")
local serialise = require("serialization")
local term = require("term")
local gpu = component.gpu
local modem = component.modem

gpu.setDepth(4)
gpu.setResolution(80,25)

gpu.fill(1,1,80,25," ")
term.setCursor(1,1)
print("Waiting for broadcast...")

-- main loop
while true do
  txtT = nil
  txtT = {}
  modem.open(port)
    _,_,_,_,_,txt = event.pull("modem_message")
    modem.close()
    -- unserialise
    for val in string.gmatch(txt, "%a+") do table.insert(txtT,val) end
    -- update text
    gpu.fill(1,1,80,25," ")
    gpu.setBackground(colour.white,true)
    gpu.setForeground(colour.black,true)
    gpu.fill(1,1,80,1," ")
    term.setCursor(1,1)
    print(tostring("OC-Teletext v1.0 - Page " .. tostring(page)))
    for i = 1, 20 do
      text = txtT[i]
      print(text)
    end

    -- change port
    if keyboard.isControlDown() then
      term.clear()
      print("Enter the channel you want. (If the channel is not properly configured, you will see a garbled mess!)
      page = io.read()
      page = tonumber(page)
    end
end
