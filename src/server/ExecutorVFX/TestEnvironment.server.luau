local ReplicateStorage = game:GetService("ReplicatedStorage")
local VfxPatterns = require(ReplicateStorage.Shared.SystemVFX.VfxPatterns)

local spawnEvent = ReplicateStorage:WaitForChild("SpawnVFXEvent") :: RemoteEvent

spawnEvent.OnServerEvent:Connect(function(player)
	print("Hola, " .. player.Name)
	local character = player.Character

	if not character or not character.PrimaryPart then
		return
	end

	local headCharacter = character.PrimaryPart.Position - Vector3.new(0, 3, 0)
	VfxPatterns.CreateHaloAbovePlayer(headCharacter)
end)
