wait(8) -- waiting for the game to load
mousemoveabs(1000, 1000) 
mousemoveabs(1000, 1005)
mouse1click()
wait(5) --once game is loaded, execute the lines under
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/main/Library.lua"))()
local rareColors = {
	"leafy",
	"iceyBlue",
	"iceyWhite",
	"iceyPink",
	"iceyBlack",
	"limestone",
	"ruby",
	"sandstone",
	"sapphire",
	"diamond",
	"topaz",
	"amethyst",
	"emerald",
	"mossy",
	"neonPurple",
	"neonBlue",
	"obsidian",
	"moonstone",
	"volcanicOrange",
	"volcanicBlack",
	"prismatic",
}

local function GetWildHorses()
	local horses = {}
	for i, v in next, game:GetService("Workspace"):GetDescendants() do
		if
			v:IsA("Model")
			and v:GetAttribute("species") == "Horse"
			and v:GetAttribute("behaviour") == "WanderingAnimal"
			and not v:GetAttribute("price")
		then
			table.insert(horses, v)
		end
	end

	return horses
end

local function getSlaves(data: table)
	local horses = {}
	for i, v in next, data do
		if not v:GetAttribute("data") then
			continue
		end
		local horsedata = game:GetService("HttpService"):JSONDecode(v:GetAttribute("data"))
		if not horsedata.variants.maneColour then
			continue
		end

		if table.find(rareColors, horsedata.variants.maneColour) then
			table.insert(horses, v)
		else
		end
	end
	return horses
end

local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua"))()
local horses = GetWildHorses()

local fff = getSlaves(horses)
if #fff == 0 then
    NotificationLibrary:SendNotification("Error", "No Horses found server hoping", 5)
    wait(1)
    module:Teleport(game.PlaceId)
	return
else
    NotificationLibrary:SendNotification("Success", "Horse Found!", 5)
end

for i, v in next, fff do
	if not v:FindFirstChild("HumanoidRootPart") then
		continue
	end
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
	wait(0.5)
end
