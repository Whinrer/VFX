local VfxMath = require(script.Parent.VfxMath)
local VfxFactory = require(script.Parent.VfxFactory)
local VfxPatterns = {}

function VfxPatterns.CreateStaticCircle(center: Vector3, mainPart: BasePart, radius: number, amount: number)
	local positionList = VfxMath.CalculateCirclePosition(center, radius, amount, 0, 360)
	local partList = VfxFactory.CloneParts(mainPart, amount, workspace.Debris)
	VfxFactory.MovePartToPosition(partList, positionList)
end

function VfxPatterns.CreateStaticSpiral(
	center: Vector3,
	mainPart: BasePart,
	radius: number,
	amount: number,
	heigth: number,
	loops: number,
	spinDirection: number,
	axisMultiplicator: Vector3
)
	local cframeList =
		VfxMath.CalculateSpiralCFrames(center, radius, amount, heigth, loops, spinDirection, axisMultiplicator)
	local partList = VfxFactory.CloneParts(mainPart, amount, workspace.Debris)
	VfxFactory.MovePartToPosition(partList, cframeList)
end

function VfxPatterns.ArrangeListInCircle(center: Vector3, radius: number, listBlock: { BasePart })
	local positionList = VfxMath.CalculateCirclePosition(center, radius, #listBlock, 0, 360)
	VfxFactory.MovePartToPosition(listBlock, positionList)
end

function VfxPatterns.CreateImpactCircle(center, radius, listBlock: { BasePart }, startAngle: number, endAngle: number)
	local cframeList = VfxMath.ImpactCircleCframe(center, radius, #listBlock, startAngle, endAngle)
	VfxFactory.MovePartToPosition(listBlock, cframeList)
end

function VfxPatterns.CreateHaloAbovePlayer(center: Vector3)
	local amount = 50
	local radius = 10
	local minSize = Vector3.new(0.5, 1, 0.5)
	local maxSize = Vector3.new(1.5, 2, 1.5)

	local blockList = VfxFactory.GenerateRandomBlock(amount, center, minSize, maxSize, workspace.Debris)
	local cframeList = VfxMath.ImpactCircleCframe(center, radius, amount, 0, 360)
	VfxFactory.MovePartToPosition(blockList, cframeList)
end
return VfxPatterns
