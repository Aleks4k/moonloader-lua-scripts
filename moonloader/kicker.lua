script_author("Propalica")
#This script need to be updated, currently it is client-side only.
require "moonloader"
local samp = require("samp.events")
local ffi = require("ffi")
--local memory = require("memory")
local ACWait = 10
local act = false
local pID = -1
local cID = -1
local seat = 0

function main()
    repeat wait(0) until isSampAvailable()
    sampAddChatMessage("Bacanje by Propalica v1.0", -1)
	sampRegisterChatCommand("baci", odbacigovna)
	while true do 
		wait(0)
		if act then
			local f, ped = sampGetCharHandleBySampPlayerId(pID)
			if f then
				local fX, fY, fZ = getActiveCameraCoordinates()
                local zX, zY, zZ = getActiveCameraPointAt()
				local heading = getHeadingFromVector2d(zX - fX, zY - fY)
                setCarHeading(cID, heading)
				local speedX = math.sin(-math.rad(heading)) * 1.1
                local speedY = math.cos(-math.rad(heading)) * 1.1
                setVehicleMoveSpeed(cID, speedX, speedY, 0.0)
				local playerPos = {getCharCoordinates(ped)}
				SendSync(cID, playerPos[1], playerPos[2], playerPos[3])
				wait(ACWait)
			else 
				act = false
				pID = -1
				cID = -1
				sampAddChatMessage("Zavrsio si bacanje", -1)
			end
		end
    end
end

function setVehicleMoveSpeed(handle, x, y, z)
    local ptr = getCarPointer(handle)
    if ptr ~= 0 then
        ffi.cast("void (__thiscall *)(uint32_t, float, float, float)", 0x441130)(ptr, x, y, z)
    end
end

function onSendPacket(id, bitstream)
	if act then
		return false
	end
end

function SendSync(vehicleId, x, y, z)
    local heading = getCharHeading(PLAYER_PED)
    
	local data = samp_create_sync_data("unoccupied")
    data.vehicleId = vehicleId
    data.seatId = seat
    data.roll = {0.1, 0.2, 0.3}
    data.direction = {-4.04, -2.9, -4.04}
    data.position = {x, y, z}
    data.moveSpeed.x = math.sin(-math.rad(heading)) * 0.1
    data.moveSpeed.y = math.cos(-math.rad(heading)) * 0.1
    data.moveSpeed.z = 4.5
    data.turnSpeed = {0.1, 0.1, 0.1}
    data.vehicleHealth = 999.0
    data.send()
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

function odbacigovna(arg)
	if #arg == 0 then
		sampAddChatMessage("/baci [ID]", -1)
	else
		local f, ped = sampGetCharHandleBySampPlayerId(arg)
		if f then
			local car, n = storeClosestEntities(PLAYER_PED)
			cID = car
			pID = arg
			--local playerPos = {getCharCoordinates(ped)}
			--SendSync(cID, playerPos[1], playerPos[2], playerPos[3])
			act = not act
		else
			sampAddChatMessage("/baci [ID]", -1)
		end
	end
end