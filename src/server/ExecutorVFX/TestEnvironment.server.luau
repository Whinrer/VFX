local VfxPatters = require(script.Parent.Parent.Parent.shared.SystemVFX.VfxPatters)
local VfxMath = require(script.Parent.Parent.SystemVFX.VfxMath)
local VfxFactory = require(script.Parent.Parent.SystemVFX.VfxFactory)

local CollectionService = game:GetService("CollectionService")
local mainPart = CollectionService:GetTagged("partevfx")[1] :: BasePart

print("[TestEnviroment] Initialized.")

local radius = 10
local amount = 50
local startAngle = 0
local endAngle = 360
local heigth = 40
local loops = 2

local minSize = Vector3.new(1, 1, 2)
local maxSize = Vector3.new(3, 2, 3)
local blockList = VfxFactory.GenerateRandomBlock(amount, mainPart.Position, minSize, maxSize, workspace.Debris)
VfxPatters.CreateImpactCircle(mainPart.Position, radius, blockList, startAngle, endAngle)
