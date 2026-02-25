local VfxFactory = {}

local rng = Random.new()

function VfxFactory.CloneParts(part: BasePart, amount: number, parent: Instance): { BasePart }
	local clonList = table.create(amount)

	for i = 1, amount, 1 do
		local clon = part:Clone()
		clon.Parent = parent
		clonList[i] = clon
	end

	return clonList
end

--Mejorar el sistema de generación de bloques:
-- * Pueda personalizarse mas
function VfxFactory.GenerateRandomBlock(
	amount: number,
	center: Vector3,
	minSize: Vector3,
	maxSize: Vector3,
	parent: Instance
): { BasePart }
	local blockList = table.create(amount)

	for i = 1, amount, 1 do
		local block = Instance.new("Part")
		local randomX = rng:NextNumber(minSize.X, maxSize.X)
		local randomY = rng:NextNumber(minSize.Y, maxSize.Y)
		local randomZ = rng:NextNumber(minSize.Z, maxSize.Z)

		block.Size = Vector3.new(randomX, randomY, randomZ)
		block.Position = center
		block.Anchored = true
		block.CanCollide = false
		block.Parent = parent
		block.Material = Enum.Material.Plaster
		blockList[i] = block
	end
	return blockList
end

function VfxFactory.MovePartToPosition(partList: { BasePart }, cframeList: { CFrame })
	workspace:BulkMoveTo(partList, cframeList, Enum.BulkMoveMode.FireCFrameChanged)
end

return VfxFactory
