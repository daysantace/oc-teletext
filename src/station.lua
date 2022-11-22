-- config
port = -- port

-- init libs
local event = require("event")
local component = require("component")

local modem = component.proxy("modem")
local gpu = component.proxy("gpu")