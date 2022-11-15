local ev = require('samp.events')
local sampev = require 'lib.samp.events'
local first = 0
local sec = 0
local third = 0

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end
    while true do wait(0)
    end
end

function ev.onServerMessage(color, text)
	if text:find('Unijeli ste pogresno') then
		sampSendChat(string.format("/vf"))
	end
	if text:find('Verifikovan') then
		pocni()
	end
	if text:find('Iskopali ste') then
		pocni2()
	end
end

function ev.onShowDialog(id, style, title, button1, button2, text)
    if title:find('Verifikacija') then 
		sampAddChatMessage(string.format("Verifikacija pass: %d %d %d", first, sec, third), 0x00DD00)
		unesiga(id, first, sec, third)
		first = 0
		sec = 0
		third = 0
	end
	if title:find('BANKOVNI IZVJESTAJ') then
		sampCloseCurrentDialogWithButton(0)
	end
end

function sampev.onShowTextDraw(id, data)
	if srediRGBА(data.letterColor) == "0x000000FF" then
		if data.position.x >= 260 and data.position.x < 300 then
			first = first + 1
		end
		if data.position.x >= 300 and data.position.x < 335 then
			sec = sec + 1
		end
		if data.position.x >= 335 and data.position.x < 380 then
			third = third + 1
		end
	end
end

function unesiga(id, prvibroj, drugibroj, trecibroj)
    lua_thread.create(function ()
		wait(2800)
		sampSendDialogResponse(id, 1, -1, string.format("%d%d%d", prvibroj, drugibroj, trecibroj))
		sampCloseCurrentDialogWithButton(0)
	end)
end

function pocni()
	lua_thread.create(function ()
		wait(1000)
		sampSendChat("/lopata")
		wait(3000)
		sampSendChat("/kopaj")
	end)
end

function pocni2()
	lua_thread.create(function ()
		wait(1000)
		sampSendChat("/vf")
	end)
end

function srediRGBА(rgb)
	lele = string.format("%x", rgb)
	lele = string.upper(lele)
	return string.format("0x%s%s%s%s", string.sub(lele, -2, -1), string.sub(lele, -4, -3), string.sub(lele, -6, -5), string.sub(lele, -8, -7))
end
	