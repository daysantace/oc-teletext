-- config
page = 1 -- change to whatever you want

-- init
local event = require("event")
local component = require("component")
local colour = require("colors")
local serialise = require("serialization")
local term = require("term")
local keyboard = require("keyboard")

local gpu = component.gpu
local modem = component.modem

gpu.setDepth(4)
gpu.setResolution(80,25)

gpu.fill(1,1,80,25," ")
term.setCursor(1,1)
print("Waiting for broadcast...")
print("Reading from page " .. tostring(page))
print("Press Ctrl to change.")

-- main loop
while true do
  txtT = nil
  txtT = {}
  modem.open(port)
    if keyboard.isControlDown() then
      term.clear()
      print("Enter the channel you want. (If the channel is not properly configured, you will see a garbled mess!)")
      page = io.read()
      page = tonumber(page)
    end
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
    print(tostring("OC-Teletext v1.3 - Page " .. tostring(page)))
    for i = 1, 20 do
      text = txtT[i]
      print(text)
    end

    -- change port
    if keyboard.isControlDown() then
      term.clear()
      print("Enter the channel you want. (If the channel is not properly configured, you will see a garbled mess!)")
      page = io.read()
      page = tonumber(page)
    end
end
