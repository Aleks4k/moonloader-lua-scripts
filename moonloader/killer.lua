local sampev = require 'lib.samp.events'
local ev = require("samp.events")
#This script is outdated and wont work anymore.

lua_thread.create(function()
    repeat wait(0) until isSampAvailable()
    sampRegisterChatCommand("ubijga", ubistvo)
	while true do wait(0) 
    end
end)

function BulletSync(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)
	if getCurrentCharWeapon(PLAYER_PED) == slot11 and getCurrentCharWeapon(PLAYER_PED) ~= 0 then
		slot12 = allocateMemory(40)
		 
		setStructElement(slot12, 0, 1, slot0)
		setStructElement(slot12, 1, 2, slot1)
		setStructElement(slot12, 3, 4, representFloatAsInt(slot2))
		setStructElement(slot12, 7, 4, representFloatAsInt(slot3))
		setStructElement(slot12, 11, 4, representFloatAsInt(slot4))
		setStructElement(slot12, 15, 4, representFloatAsInt(slot5))
		setStructElement(slot12, 19, 4, representFloatAsInt(slot6))
		setStructElement(slot12, 23, 4, representFloatAsInt(slot7))
		setStructElement(slot12, 27, 4, representFloatAsInt(slot8))
		setStructElement(slot12, 31, 4, representFloatAsInt(slot9))
		setStructElement(slot12, 35, 4, representFloatAsInt(slot10))
		setStructElement(slot12, 39, 1, slot11)
		sampSendBulletData(slot12)
		freeMemory(slot12)
	end
end


function ubistvo(arg)
	if #arg == 0 then
		print("Command 'ubijga' syntax: /skill [ID]")
	else
		local weapon = getCurrentCharWeapon(PLAYER_PED)
		local mx, my, mz = getCharCoordinates(PLAYER_PED)
		local f, ped = sampGetCharHandleBySampPlayerId(arg)
		if f then
			local px, py, pz = getCharCoordinates(ped)
			if weapon == 34 then
				BulletSync(1, arg, mx, my, mz, px, py, pz, math.random(), math.random(), math.random(), weapon)
			end
		end
	end
end