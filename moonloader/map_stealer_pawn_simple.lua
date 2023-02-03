--All logs will go to console, to turn on console click‚ button left from 1
local sampev = require 'lib.samp.events'
local ev = require("samp.events")
local bitex = require('lib.bitex')
local Vector3D = require "vector3d"
navodnik = '"'

function sampev.onRemoveBuilding(modelId, position, radius)
	print(string.format("RemoveBuildingForPlayer(playerid, %d, %.4f, %.4f, %.4f, %.2f);", modelId, position.x, position.y, position.z, radius))
end

function sampev.onCreateObject(objectId, data)
	print(string.format("obj = CreateObject(%d, %.6f, %.6f, %.6f, %.6f, %.6f, %.6f);", data.modelId, data.position.x, data.position.y, data.position.z, data.rotation.x, data.rotation.y, data.rotation.z))
end

function sampev.onSetObjectMaterial(objectId, material)
	print(string.format("SetObjectMaterial(obj, %s, %s, %s%s%s, %s%s%s, %s);", material.materialId, material.modelId, navodnik, material.libraryName, navodnik, navodnik, material.textureName, navodnik, srediRGBAobject(material.color)))
end

function sampev.onSetObjectMaterialText(objectId, material)
	print(string.format("SetObjectMaterialText(obj, %s%s%s, %d, %d, %s%s%s, %d, %d, %s, %s, %d);", navodnik, material.text, navodnik, material.materialId,material.materialSize, navodnik, material.fontName, navodnik, material.fontSize,material.bold,srediRGBAobject(material.fontColor),srediRGBAobject(material.backGroundColor),material.align))
end
