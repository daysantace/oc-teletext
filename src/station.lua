-- config
port = -- port

-- init libs
local event = require("event")
local component = require("component")
local term = require("term")

local modem = component.proxy("modem")
local gpu = component.proxy("gpu")

-- main loop

:: menu ::

while true do
  term.clear()
  print("OC-teletext")
  print("Version 1.0")
  print("")
  print("1 - Edit transmission text")
  select = io.read()

-- edit text

-- read file

  if select == "1" then
  ::edit::

  term.clear()
  for line in io.lines("broadcast.txt") do
    print("line")
  end
  
  print("Type a number to edit its line.")
  lineEdit = io.read()

  if lineEdit > 20 then
    goto(edit)
  end

  print("Editing line " .. lineEdit)
  editText = io.read()


-- idk what this does
-- stolen from stackoverflow

  local file = io.open(broadcast.txt, 'r')
  local fileContent = {}
  for line in file:lines() do
      table.insert (fileContent, line)
  end
  io.close(file)

  fileContent[lineEdit] = editText

  file = io.open(inputFile, 'w')
  for index, value in ipairs(fileContent) do
        file:write(value..'')
  end
  io.close(file)
  goto(menu)
  end
end
