local function compAdd(com)
 return component.list(com)() or error(com .. " not found")
end

local gpu, modem =
 compAdd(gpu),
 compAdd(modem)

component.invoke(gpu, "bind", compAdd("screen"))
modem.open(20)

while True do
 _,_,_,_,_,txt=computer.pullSignal("modem_message")
 for i in string.gmatch(txt, "%S\n") do
  print(i)
 end
end
