#All logs will go to console, to turn on console click‚ button left from 1
local sampev = require 'lib.samp.events'
local ev = require("samp.events")
local bitex = require('lib.bitex')
local Vector3D = require "vector3d"

function sampev.onVehicleStreamIn(vehid, data)
	print(string.format("tmpvhc = AddStaticVehicleEx(%d, %.4f, %.4f, %.4f, %.4f, %d, %d, 30);",data.type,data.position.x,data.position.y,data.position.z,data.rotation,data.bodyColor1,data.bodyColor2))
end