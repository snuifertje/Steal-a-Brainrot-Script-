-- No-Clip and Speed Control Exploit

local brainrot = require(game.ServerScriptService.BrainRot)

-- Steal the brainrot exploit
brainrot()

-- No-Clip function
local function noClip(state)
    local character = game.Players.LocalPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if state then
        character.Anchored = true
    else
        character.Anchored = false
    end

    if humanoid then
        humanoid.WalkSpeed = state and 0 or 16
    end
end

-- Bind keys to toggle no-clip and adjust speed
local keyNoClip = Enum.KeyCode.E
local keySpeedPlus = Enum.KeyCode.R
local keySpeedMinus = Enum.KeyCode.F

local function onKeyDown(key, increment)
    if key == keyNoClip then
        noClip(not game.Players.LocalPlayer.Character.Anchored)
    elseif key == keySpeedPlus then
        local currentSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = math.clamp(currentSpeed + increment, 16, 500)
    elseif key == keySpeedMinus then
        local currentSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = math.clamp(currentSpeed - increment, 16, 500)
    end
end

game.UserInputService.InputBegan:Connect(function(key)
    if key.KeyCode == keyNoClip then
        onKeyDown(keyNoClip)
    elseif key.KeyCode == keySpeedPlus then
        onKeyDown(keySpeedPlus, 10)
    elseif key.KeyCode == keySpeedMinus then
        onKeyDown(keySpeedMinus, 10)
    end
end)
