local ev = require('samp.events')
--.play za vracanje
-- .kreni
function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end
    while true do wait(0)
	    for i = 99, 99 do
        local text, prefix, color, pcolor = sampGetChatString(i)
            if text:find("Niste uneli ispravan") then
			    sampAddChatMessage(" ",-1)
				sampSendChat(string.format("/provera"))
            end
			if text:find("Prekinuli ste kopanje") then
			    sampAddChatMessage(" ",-1)
				sampSendChat(string.format("/provera"))
            end
			if text:find("Niste prosli proveru") then
			    sampAddChatMessage(" ",-1)
				sampSendChat(string.format("/provera"))
            end
			if text:find("Uneli ste ispravan kod") then
			    sampAddChatMessage(" ",-1)
				local data = samp_create_sync_data('player')
                data.weapon = data.weapon + 128
                data.send()
            end
			if text:find("Vi ste vec uneli kod") then
			    sampAddChatMessage(" ",-1)
				local data = samp_create_sync_data('player')
                data.weapon = data.weapon + 128
                data.send()
            end
			if text:find("Sada odnesite rudu") then
			    sampAddChatMessage(" ",-1)
				sampProcessChatInput("/.kreni")
            end
			if text:find("dobili ste") then
			    sampAddChatMessage(" ",-1)
				sampProcessChatInput("/.play")
            end
        end
		for i = 0, sampGetMaxPlayerId(false) do
			if sampIsPlayerConnected(i) then
				local result, id = sampGetCharHandleBySampPlayerId(i)
				if result then
					if doesCharExist(id) then
						local x, y, z = getCharCoordinates(id)
						local mX, mY, mZ = getCharCoordinates(playerPed)
						if 2.5 > getDistanceBetweenCoords3d(x, y, z, mX, mY, mZ) then
							setCharCollision(id, false)
						end
					end
				end
			end
        end
    end
end

function ev.onShowDialog(id, style, title, button1, button2, text)
    if title:find('Bankovni izvestaj') then
	    sampCloseCurrentDialogWithButton(0)
	end
	if title:find('Unesite kod:') then 
	local prvibroj = 0
    local drugibroj = 0
    local trecibroj = 0
    local koji = 0
    local finalbroj1 = 0
    local finalbroj2 = 0
    local finalbroj3 = 0
    local y3u = 0
    local y1u = 0
    local y2u = 0
	for a = 2139, 2200	do --cycle trough all textdeaw id 2139 je pocetak.
				if sampTextdrawIsExists(a) then --if textdeaw exists then
					x, y = sampTextdrawGetPos(a) --we get it's position. value returns in game coords
					if x < 253 then
					    prvibroj = prvibroj + 1
						y1u = y1u + y
					end
					if x > 254 and x < 338 then
					    drugibroj = drugibroj + 1
						y2u = y2u + y
					end
					if x > 339 and x < 430 then
					    trecibroj = trecibroj + 1
						y3u = y3u + y
					end
					koji = koji + 1
				end  
			end
			if y2u >= 2312.9782714844 and y2u <= 2312.9782714845 and drugibroj == 6 then
			    finalbroj2 = 0
			end
			if y3u >= 2313.1482849121 and y3u <= 2313.1482849122 and trecibroj == 6 then
			    finalbroj3 = 0
			end
			--Za broj 6
			if y1u >= 2339.0888671875 and y1u <= 2339.0888671876 and prvibroj == 6 then
			    finalbroj1 = 6
			end
			if y2u >= 2338.6965942382 and y2u <= 2338.6965942384 and drugibroj == 6 then
			    finalbroj2 = 6
			end
			if y3u >= 2338.8668518065 and y3u <= 2338.8668518067 and trecibroj == 6 then
			    finalbroj3 = 6
			end
			--Za broj 9
			if y1u >= 2312.6146850585 and y1u <= 2312.6146850587 and prvibroj == 6 then
			    finalbroj1 = 9
			end
			if y2u >= 2312.2225036621 and y2u <= 2312.2225036622 and drugibroj == 6 then
			    finalbroj2 = 9
			end
			if y3u >= 2312.3926391601 and y3u <= 2312.3926391603 and trecibroj == 6 then
			    finalbroj3 = 9
			end
			--Za broj 2
			if y1u >= 1944.7481384277 and y1u <= 1944.7481384278 and prvibroj == 5 then
			    finalbroj1 = 2
			end
			if y2u >= 1943.770568847 and y2u <= 1943.770568848 and drugibroj == 5 then
			    finalbroj2 = 2
			end
			if y3u >= 1943.9405822753 and y3u <= 1943.9405822755 and trecibroj == 5 then
			    finalbroj3 = 2
			end
			--Za broj 3
			if y1u >= 1944.5776672363 and y1u <= 1944.5776672364 and prvibroj == 5 then
			    finalbroj1 = 3
			end
			if y2u >= 1944.0151672363 and y2u <= 1944.0151672364 and drugibroj == 5 then
			    finalbroj2 = 3
			end
			if y3u >= 1944.1850280761 and y3u <= 1944.1850280763 and trecibroj == 5 then
			    finalbroj3 = 3
			end
			--Za broj 5
			if y1u >= 1944.2590942382 and y1u <= 1944.2590942384 and prvibroj == 5 then
			    finalbroj1 = 5
			end
			if y2u >= 1944.111328125 and y2u <= 1944.111328126 and drugibroj == 5 then
			    finalbroj2 = 5
			end
			if y3u >= 1944.2815856933 and y3u <= 1944.2815856935 and trecibroj == 5 then
			    finalbroj3 = 5
			end
			--Ostali brojevi su specificni i ne treba ova provera da se radi...
			if prvibroj == 2 then
			    finalbroj1 = 1
			end
			if prvibroj == 4 then
			    finalbroj1 = 4
			end
			if prvibroj == 3 then
			    finalbroj1 = 7
			end
			if prvibroj == 7 then
			    finalbroj1 = 8
			end
			if drugibroj == 2 then
			    finalbroj2 = 1
			end
			if drugibroj == 4 then
			    finalbroj2 = 4
			end
			if drugibroj == 3 then
			    finalbroj2 = 7
			end
			if drugibroj == 7 then
			    finalbroj2 = 8
			end
			if trecibroj == 2 then
			    finalbroj3 = 1
			end
			if trecibroj == 4 then
			    finalbroj3 = 4
			end
			if trecibroj == 3 then
			    finalbroj3 = 7
			end
			if trecibroj == 7 then
			    finalbroj3 = 8
			end
			sampAddChatMessage(string.format("%d %d %d", finalbroj1, finalbroj2, finalbroj3), 0x00DD00)
			--sampSetCurrentDialogEditboxText(string.format("%d%d%d", finalbroj1, finalbroj2, finalbroj3))
			unesiga(id, finalbroj1, finalbroj2, finalbroj3)
	end
end

function unesiga(id, finalbroj1, finalbroj2, finalbroj3)
    lua_thread.create(function ()
			--sampSetCurrentDialogEditboxText("123")
			wait(3000)
			sampSendDialogResponse(id, 1, -1, string.format("%d%d%d", finalbroj1, finalbroj2, finalbroj3))
			--sampCloseCurrentDialogWithButton(1)
			sampShowDialog(-1, "", "", "", "", 1)
			sampCloseCurrentDialogWithButton(1)
		end)
end

function samp_create_sync_data(sync_type, copy_from_player)
    local ffi = require 'ffi'
    local sampfuncs = require 'sampfuncs'
    -- from SAMP.Lua
    local raknet = require 'samp.raknet'
    require 'samp.synchronization'

    copy_from_player = copy_from_player or true
    local sync_traits = {
        player = {'PlayerSyncData', raknet.PACKET.PLAYER_SYNC, sampStorePlayerOnfootData},
        vehicle = {'VehicleSyncData', raknet.PACKET.VEHICLE_SYNC, sampStorePlayerIncarData},
        passenger = {'PassengerSyncData', raknet.PACKET.PASSENGER_SYNC, sampStorePlayerPassengerData},
        aim = {'AimSyncData', raknet.PACKET.AIM_SYNC, sampStorePlayerAimData},
        trailer = {'TrailerSyncData', raknet.PACKET.TRAILER_SYNC, sampStorePlayerTrailerData},
        unoccupied = {'UnoccupiedSyncData', raknet.PACKET.UNOCCUPIED_SYNC, nil},
        bullet = {'BulletSyncData', raknet.PACKET.BULLET_SYNC, nil},
        spectator = {'SpectatorSyncData', raknet.PACKET.SPECTATOR_SYNC, nil}
    }
    local sync_info = sync_traits[sync_type]
    local data_type = 'struct ' .. sync_info[1]
    local data = ffi.new(data_type, {})
    local raw_data_ptr = tonumber(ffi.cast('uintptr_t', ffi.new(data_type .. '*', data)))
    -- copy player's sync data to the allocated memory
    if copy_from_player then
        local copy_func = sync_info[3]
        if copy_func then
            local _, player_id
            if copy_from_player == true then
                _, player_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
            else
                player_id = tonumber(copy_from_player)
            end
            copy_func(player_id, raw_data_ptr)
        end
    end
    -- function to send packet
    local func_send = function()
        local bs = raknetNewBitStream()
        raknetBitStreamWriteInt8(bs, sync_info[2])
        raknetBitStreamWriteBuffer(bs, raw_data_ptr, ffi.sizeof(data))
        raknetSendBitStreamEx(bs, sampfuncs.HIGH_PRIORITY, sampfuncs.UNRELIABLE_SEQUENCED, 1)
        raknetDeleteBitStream(bs)
    end
    -- metatable to access sync data and 'send' function
    local mt = {
        __index = function(t, index)
            return data[index]
        end,
        __newindex = function(t, index, value)
            data[index] = value
        end
    }
    return setmetatable({send = func_send}, mt)
end