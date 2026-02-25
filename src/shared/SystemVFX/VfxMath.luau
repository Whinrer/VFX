local VfxMath = {}

print("[VfxMath] Initialized.")

local rng = Random.new()

function VfxMath.GenerateAngles(amount: number, startAngle: number, endAngle: number, spinDirection: number): { number }
	local anglesList = table.create(amount)
	local anglesStep = spinDirection * ((endAngle - startAngle) / (amount - 1))

	for i = 1, amount, 1 do
		anglesList[i] = startAngle + (anglesStep * (i - 1))
		anglesList[i] = math.rad(anglesList[i])
	end

	return anglesList
end

function VfxMath.CalculateCirclePosition(
	center: Vector3,
	radius: number,
	amount: number,
	startAngle: number,
	endAngle: number
)
	local anglesList = VfxMath.GenerateAngles(amount, startAngle, endAngle, -1)
	local cframeList = table.create(amount)

	for i = 1, amount do
		local x = center.X + math.cos(anglesList[i]) * radius
		local z = center.Z + math.sin(anglesList[i]) * radius
		cframeList[i] = CFrame.new(x, center.Y, z)
	end

	return cframeList
end

function VfxMath.CalculateSpiralCFrames(
	center: Vector3,
	radius: number,
	amount: number,
	heigth: number,
	loops: number,
	spinDirection: number,
	axisMultiplicator: Vector3
): { CFrame }
	axisMultiplicator = axisMultiplicator or Vector3.new(1, 1, 1)
	local endAngle = 360 * loops
	local anglesList = VfxMath.GenerateAngles(amount, 0, endAngle, spinDirection)
	local heigthStep = heigth / amount
	local cframeList = table.create(amount)

	for i = 1, amount do
		local x = center.X + ((math.cos(anglesList[i]) * radius) * axisMultiplicator.X)
		local z = center.Z + ((math.sin(anglesList[i]) * radius) * axisMultiplicator.Z)
		local y = center.Y + ((heigthStep * i) * axisMultiplicator.Y)
		cframeList[i] = CFrame.new(x, y, z)
	end

	return cframeList
end

function VfxMath.ImpactCircleCframe(
	center: Vector3,
	radius: number,
	amount: number,
	startAngle: number,
	endAngle: number
)
	local anglesList = VfxMath.GenerateAngles(amount, startAngle, endAngle, 1)
	local cframeList = { CFrame }
	for i = 1, amount, 1 do
		local x = center.X + math.cos(anglesList[i]) * radius
		local z = center.Z + math.sin(anglesList[i]) * radius

		local position = Vector3.new(x, center.Y, z)
		local baseCframe = CFrame.new(position, center)

		local anglesRandom = CFrame.Angles(rng:NextInteger(-15, 15), center.Y, rng:NextInteger(-15, 15))
		cframeList[i] = baseCframe * anglesRandom
	end
	return cframeList
end

return VfxMath
