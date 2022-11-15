#All logs will go to console, to turn on console click‚ button left from 1
local sampev = require 'lib.samp.events'
local ev = require("samp.events")
local bitex = require('lib.bitex')
local Vector3D = require "vector3d"

function sampev.onSetPlayerAttachedObject(playerId, index, create, object)
	if(object.modelId == 358 or object.modelId == 359 or object.modelId == 360 or object.modelId == 361 or object.modelId == 362 or object.modelId == 356 or object.modelId == 372 or object.modelId == 357 or object.modelId == 355 or object.modelId == 353 or object.modelId == 341 or object.modelId == 346 or object.modelId == 347 or object.modelId == 348 or object.modelId == 349 or object.modelId == 350 or object.modelId == 351 or object.modelId == 352) then
		--%d,%d,%.3f,%.3f,%.3f,%.3f,%.3f,%.3f,%.3f,%.3f,%.3f
		--print(string.format("%d|%d|%d|%.3f|%.3f|%.3f|%.3f|%.3f|%.3f|%.3f|%.3f|%.3f|%d|%d", index, object.modelId, object.bone, object.offset.x, object.offset.y, object.offset.z, object.rotation.x, object.rotation.y, object.rotation.z, object.scale.x, object.scale.y, object.scale.z, object.color1, object.color2))
		print(string.format("SetPlayerAttachedObject(playerid, %d, %d, %d, %.5f, %.5f, %.5f, %.5f, %.5f, %.5f, %.5f, %.5f, %.5f, %d, %d);", index, object.modelId, object.bone, object.offset.x, object.offset.y, object.offset.z, object.rotation.x, object.rotation.y, object.rotation.z, object.scale.x, object.scale.y, object.scale.z, object.color1, object.color2))
	end
end

function sampev.onCreateActor(actorId, skinId, position, rotation, health)
	print(string.format("CreateDynamicActor(%d, %.5f,%.5f,%.5f, %.5f, 0, %.5f, 0, 0);", skinId, position.x, position.y, position.z, rotation, health))
end

function sampev.onApplyPlayerAnimation(playerId, animLib, animName, loop, lockX, lockY, freeze, time)
	print(playerId)
end