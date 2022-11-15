local sampev = require 'lib.samp.events'
local ev = require("samp.events")

function ev.onServerMessage(color, text)
	if text:find('Upisite prvi') then
		local pocetak_prvi = 0
		local kraj_prvi = 0
		pocetak_prvi, kraj_prvi = text:find("prvi ")
		local pocetak_drugi = 0
		local kraj_drugi = 0
		pocetak_drugi, kraj_drugi = text:find("osvojite")
		str = string.sub(text, kraj_prvi+9, kraj_prvi+19)
		lua_thread.create(function() 
			wait(1000) #Necemo odma da saljemo da ne provale.
			sampSendChat(str)
        end) 
	end
end