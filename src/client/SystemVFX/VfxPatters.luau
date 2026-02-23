local VfxMath = require(script.Parent.VfxMath)
local VfxFactory = require(script.Parent.VfxFactory)
local VfxPatters = {}

print("[VfxPatters] initialized")

function VfxPatters.CreateStaticCircle(center: Vector3, mainPart: BasePart, radius: number, amount: number)
	local positionList = VfxMath.CalculateCirclePosition(center, radius, amount, 0, 360)
	local partList = VfxFactory.CloneParts(mainPart, amount, workspace.Debris)
	VfxFactory.MovePartToPosition(partList, positionList)
end

function VfxPatters.CreateStaticSpiral(
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

function VfxPatters.ArrangeListInCircle(center: Vector3, radius: number, listBlock: { BasePart })
	local positionList = VfxMath.CalculateCirclePosition(center, radius, #listBlock, 0, 360)
	VfxFactory.MovePartToPosition(listBlock, positionList)
end

function VfxPatters.CreateImpactCircle(center, radius, listBlock: { BasePart }, startAngle: number, endAngle: number)
	local cframeList = VfxMath.ImpactCircleCframe(center, radius, #listBlock, startAngle, endAngle)
	VfxFactory.MovePartToPosition(listBlock, cframeList)
end

return VfxPatters
