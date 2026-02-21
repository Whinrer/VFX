local VfxPatters = require(script.Parent.Parent.SystemVFX.VfxPatters)
local VfxMath = require(script.Parent.Parent.SystemVFX.VfxMath)
local VfxFactory = require(script.Parent.Parent.SystemVFX.VfxFactory)

local CollectionService = game:GetService("CollectionService")
local mainPart = CollectionService:GetTagged("partevfx")[1] :: BasePart

print("[TestEnviroment] Initialized.")

local radius = 10
local amount = 15
local startAngle = 10
local endAngle = 180
local heigth = 40
local loops = 2
local minSize = Vector3.new(1, 1, 2)
local maxSize = Vector3.new(3, 2, 3)
local blockList = VfxFactory.GenerateRandomBlock(amount, mainPart.Position, minSize, maxSize, workspace.Debris)
VfxPatters.ArrangeListInCircle(mainPart.Position, radius, blockList)
