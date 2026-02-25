local UserInputService = game:GetService("UserInputService")
local ReplicateStorage = game:GetService("ReplicatedStorage")

local spawnEvent = ReplicateStorage:WaitForChild("SpawnVFXEvent")

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then
		return
	end
	if input.KeyCode == Enum.KeyCode.F then
		print("PRECIONO LA F")
		spawnEvent:FireServer()
	end
end)
