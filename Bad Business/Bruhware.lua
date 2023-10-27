if not syn or not protectgui then
    getgenv().protectgui = function()end
end

repeat wait() until game:IsLoaded()

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Window = Library:CreateWindow({Title = 'BruhWare | Bad Buisness ',Center = true, AutoShow = true})
local Themes = {"Default", "Skeet", "Fatality", "Onetap", "Neverlose"}

local aimTab = Window:AddTab("Aimbot")
local visTab = Window:AddTab("Visuals")
local miscTab = Window:AddTab("Misc")
local setsTab = Window:AddTab("Settings")

local aimbotTabbox = aimTab:AddLeftTabbox("Aimbot")
local aimbot = aimbotTabbox:AddTab("Aimbot")
aimbot:AddToggle("aimbot", {Text = "Enabled"}):AddKeyPicker("aimKey", {Text = "Aimbot", Default = "MB2", Mode = "Hold"})
aimbot:AddToggle("visCheck", {Text = "Visible Check"})
aimbot:AddToggle("showAimFOV", {Text = "Show Aimbot FOV"}):AddColorPicker("aimbotFovColor", {Default = Color3.fromRGB(255,255,255)})
aimbot:AddToggle("prediction", {Text = "Target Prediction"})
--aimbot:AddToggle("dynamicFov", {Text = "Dynamic FOV"})
aimbot:AddDropdown("aimPart", {Values = {"Head", "Chest", "LeftArm", "RightArm", "LeftLeg", "RightLeg", "Random"}, Default = 1, Multi = false, Text = "Aim Part"})
aimbot:AddSlider("aimbotFov", {Text = "Fov Radius", Default = 100, Min = 0, Max = 800, Rounding = 0})
aimbot:AddSlider("horizontalSmoothing", {Text = "Horizontal Smoothing", Default = 1, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
aimbot:AddSlider("verticalSmoothing", {Text = "Vertical Smoothing", Default = 1, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
aimbot:AddSlider("aimbotAccuracy", {Text = "Aimbot Hitchance", Default = 100, Min = 1, Max = 100, Rounding = 0, Suffix = "%"})
--aimbot:AddSlider("predictionAmount", {Text = "Prediction Amount", Default = 0, Min = 0, Max = 100, Rounding = 0})
--aimbot:AddSlider("dynamicFovAmmount", {Text = "Dynamic FOV Amount", Default = 0, Min = -50, Max = 50, Rounding = 0})

local silentAimTabbox = aimTab:AddRightTabbox("Silent Aim")
local silentAim = silentAimTabbox:AddTab("Silent Aim")
silentAim:AddToggle("silentAim", {Text = "Enabled"})
silentAim:AddToggle("silentAimVisCheck", {Text = "Visible Check"})
silentAim:AddToggle("showSilentAimFOV", {Text = "Show Silent Aim FOV"}):AddColorPicker("silentFovColor", {Default = Color3.fromRGB(255,255,255)})
silentAim:AddDropdown("silentAimPart", {Values = {"Head", "Chest", "LeftArm", "RightArm", "LeftLeg", "RightLeg", "Random"}, Default = 1, Multi = false, Text = "Silent Aim Part"})
silentAim:AddSlider("silentAimFov", {Text = "Fov Radius", Default = 100, Min = 0, Max = 800, Rounding = 0})
silentAim:AddSlider("silentAimAccuracy", {Text = "Silent Aim Hitchance", Default = 100, Min = 1, Max = 100, Rounding = 0, Suffix = "%"})

local espTabbox = visTab:AddLeftTabbox("ESP")
local esp = espTabbox:AddTab("ESP")
esp:AddToggle("boxes", {Text = "Bounding Box"}):AddColorPicker("boxColor", {Default = Color3.fromRGB(255,255,255)}):AddColorPicker("visBoxColor", {Default = Color3.fromRGB(255,0,0)})
esp:AddToggle("healthbar", {Text = "Health Bar"}):AddColorPicker("healthbarColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("nametags", {Text = "Name"}):AddColorPicker("nameColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("distance", {Text = "Distance"}):AddColorPicker("distanceColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("arrows", {Text = "Out of FOV Arrows"}):AddColorPicker("arrowColor", {Default = Color3.fromRGB(255,255,255)})

local espSettings = espTabbox:AddTab("ESP Settings")

local chamsTabbox = visTab:AddRightTabbox("Enemy Chams")
local chams = chamsTabbox:AddTab("Enemy Chams")
chams:AddToggle("enemyChamsCheckbox", {Text = "Enabled"})
chams:AddToggle("enemyChamsOccluded", {Text = "Occluded"})
chams:AddToggle("pulseChams", {Text = "Pulse Chams"})
chams:AddLabel("Fill Color"):AddColorPicker("fillColor", { Default = Color3.fromRGB(255, 0, 0) })
chams:AddLabel("Outline Color"):AddColorPicker("outlineColor", { Default = Color3.fromRGB(255, 255, 255) })
chams:AddSlider("fillTrans", {Text = "Fill Transparency", Default = 50, Min = 0, Max = 100, Rounding = 0})
chams:AddSlider("outlineTrans", {Text = "Outline Transparency", Default = 50, Min = 0, Max = 100, Rounding = 0})

local localChamsTabbox = visTab:AddLeftTabbox("Local Player Chams")
local localChams = localChamsTabbox:AddTab("Local Player Chams")
localChams:AddToggle("localPlayerChams", {Text = "Enabled"})
localChams:AddToggle("armChams", {Text = "Arm Chams"}):AddColorPicker("armColor", {Default = Color3.fromRGB(255,255,255)})
localChams:AddToggle("gunChams", {Text = "Gun Chams"}):AddColorPicker("gunColor", {Default = Color3.fromRGB(255,255,255)})
localChams:AddDropdown("armMat", {Values = {"Plastic", "Neon", "ForceField", "Glass", "Foil"}, Default = 1, Multi = false, Text = "Arm Material"})
localChams:AddDropdown("gunMat", {Values = {"Plastic", "Neon", "ForceField", "Glass", "Foil"}, Default = 1, Multi = false, Text = "Gun Material"})

local weaponsTabbox = miscTab:AddLeftTabbox("Weapon Mods")
local weaponMod = weaponsTabbox:AddTab("Weapon Mods")
weaponMod:AddToggle("weaponMods", {Text = "Enabled"})
weaponMod:AddSlider("weaponScale", {Text = "Weapon Scale", Default = 50, Min = 0, Max = 100, Rounding = 0})
weaponMod:AddSlider("cameraScale", {Text = "Camera Scale", Default = 50, Min = 0, Max = 100, Rounding = 0})
weaponMod:AddSlider("recoilScale", {Text = "Recoil Scale", Default = 50, Min = 0, Max = 100, Rounding = 0})
weaponMod:AddSlider("bulletDrop", {Text = "Bullet Drop", Default = 50, Min = 0, Max = 100, Rounding = 0})

local antiAimTabbox = miscTab:AddRightTabbox("Anti-Aim")
local antiAim = antiAimTabbox:AddTab("Anti-Aim")
antiAim:AddToggle("antiAim", {Text = "Enabled"})
antiAim:AddToggle("randomPitch", {Text = "Random Pitch"})
antiAim:AddToggle("randomYaw", {Text = "Random Yaw"})
antiAim:AddSlider("pitch", {Text = "Pitch", Default = 0, Min = -2, Max = 2, Rounding = 1})
antiAim:AddSlider("yaw", {Text = "Yaw", Default = 0, Min = -1.5, Max = 1.5, Rounding = 1})

local function UpdateTheme()
    Library.BackgroundColor = Options.BackgroundColor.Value;
    Library.MainColor = Options.MainColor.Value;
    Library.AccentColor = Options.AccentColor.Value;
    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library.OutlineColor = Options.OutlineColor.Value;
    Library.FontColor = Options.FontColor.Value;

    Library:UpdateColorsUsingRegistry();
end;

local function SetDefault()
    Options.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Options.MainColor:SetValueRGB(Color3.fromRGB(24,24,24));
    Options.BackgroundColor:SetValueRGB(Color3.fromRGB(17,17,17));
    Options.AccentColor:SetValueRGB(Color3.fromRGB(141, 115, 196));
    Options.OutlineColor:SetValueRGB(Color3.fromRGB(42,42,42));
    Toggles.Rainbow:SetValue(false);

    UpdateTheme();
end;

local Theme = setsTab:AddLeftGroupbox('Theme'); 
Theme:AddLabel('Background Color'):AddColorPicker('BackgroundColor', { Default = Color3.fromRGB(21, 20, 37) });
Theme:AddLabel('Main Color'):AddColorPicker('MainColor', { Default = Color3.fromRGB(13, 3, 24)});
Theme:AddLabel('Accent Color'):AddColorPicker('AccentColor', { Default = Color3.fromRGB(59, 15, 96) });
Theme:AddLabel('Font Color'):AddColorPicker('FontColor', { Default = Color3.fromRGB(255, 255, 255) });
Theme:AddLabel('Outline Color'):AddColorPicker('OutlineColor', { Default = Color3.fromRGB(44, 18, 61) });
Theme:AddToggle('Keybinds', { Text = 'Show Keybinds Menu', Default = false }):OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.Keybinds.Value;
end);
Theme:AddToggle('Rainbow', { Text = 'Rainbow Accent Color' });
Theme:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' })
Theme:AddDropdown("themes", {Text = "", Default = 1, Values = Themes})
Options.themes:OnChanged(function ()
    if Options.themes.Value == "Default" then
        Options.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
        Options.MainColor:SetValueRGB(Color3.fromRGB(24,24,24));
        Options.BackgroundColor:SetValueRGB(Color3.fromRGB(17,17,17));
        Options.AccentColor:SetValueRGB(Color3.fromRGB(141, 115, 196));
        Options.OutlineColor:SetValueRGB(Color3.fromRGB(42,42,42));
        Toggles.Rainbow:SetValue(false);
        UpdateTheme();
    elseif Options.themes.Value == "Skeet" then
        Options.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
        Options.MainColor:SetValueRGB(Color3.fromRGB(17,17,17));
        Options.BackgroundColor:SetValueRGB(Color3.fromRGB(12, 12, 12));
        Options.AccentColor:SetValueRGB(Color3.fromRGB(58,255,0));
        Options.OutlineColor:SetValueRGB(Color3.fromRGB(48,48,48));
        Toggles.Rainbow:SetValue(false);
        UpdateTheme();
    elseif Options.themes.Value == "Fatality" then
        Options.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
        Options.MainColor:SetValueRGB(Color3.fromRGB(31,26,67));
        Options.BackgroundColor:SetValueRGB(Color3.fromRGB(27,20,52));
        Options.AccentColor:SetValueRGB(Color3.fromRGB(218,5,88));
        Options.OutlineColor:SetValueRGB(Color3.fromRGB(55,48,87));
        Toggles.Rainbow:SetValue(false);
        UpdateTheme();
    elseif Options.themes.Value == "Onetap" then
        Options.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
        Options.MainColor:SetValueRGB(Color3.fromRGB(29,28,33));
        Options.BackgroundColor:SetValueRGB(Color3.fromRGB(23,23,28));
        Options.AccentColor:SetValueRGB(Color3.fromRGB(253,166,27));
        Options.OutlineColor:SetValueRGB(Color3.fromRGB(49,49,55));
        Toggles.Rainbow:SetValue(false);
        UpdateTheme();
    elseif Options.themes.Value == "Neverlose" then
        Options.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
        Options.MainColor:SetValueRGB(Color3.fromRGB(0,11,22));
        Options.BackgroundColor:SetValueRGB(Color3.fromRGB(8,8,13));
        Options.AccentColor:SetValueRGB(Color3.fromRGB(60,133,224));
        Options.OutlineColor:SetValueRGB(Color3.fromRGB(1,27,43));
        Toggles.Rainbow:SetValue(false);
        UpdateTheme();
    end
end)
Theme:AddButton("Unload", function ()
    Library:Unload()
end)

task.spawn(function()
    while game:GetService('RunService').RenderStepped:Wait() do
        if Toggles.Rainbow.Value then
            local Registry = Window.Holder.Visible and Library.Registry or Library.HudRegistry;

            for Idx, Object in next, Registry do
                for Property, ColorIdx in next, Object.Properties do
                    if ColorIdx == 'AccentColor' or ColorIdx == 'AccentColorDark' then
                        local Instance = Object.Instance;
                        local yPos = Instance.AbsolutePosition.Y;

                        local Mapped = Library:MapValue(yPos, 0, 1080, 0, 0.5) * 1.5;
                        local Color = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.8, 1);
                        RGBCycle = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.8, 1);

                        if ColorIdx == 'AccentColorDark' then
                            Color = Library:GetDarkerColor(Color);
                        end;

                        Instance[Property] = Color;
                    end;
                end;
            end;
        end;

        
    end;
    
end);

task.spawn(function()
    while true do
        wait(1)

        if Library.Unloaded then break end
    end
end)

Toggles.Rainbow:OnChanged(function()
    if not Toggles.Rainbow.Value then
        UpdateTheme();
    end;
end);

Options.BackgroundColor:OnChanged(UpdateTheme);
Options.MainColor:OnChanged(UpdateTheme);
Options.AccentColor:OnChanged(UpdateTheme);
Options.OutlineColor:OnChanged(UpdateTheme);
Options.FontColor:OnChanged(UpdateTheme);

local function tp()
    local Player = game.Players.LocalPlayer
    local TP = game:GetService("TeleportService")
    TP:Teleport(3233893879, Player)
end;

Library:OnUnload(function()
    print('Unloaded!')

    --Toggles.boxes:SetValue(false)
    --Toggles.snaplines:SetValue(false)
    --Toggles.nametags:SetValue(false)
    --Toggles.healthbar:SetValue(false)
    --Toggles.distance:SetValue(false)

    Library.Unloaded = true
end)

local Extra = setsTab:AddRightTabbox("Extras")
local Feats = Extra:AddTab("Extras")
Feats:AddButton("Re-connect to Server", function ()
    tp()
end)
Feats:AddButton("Find New Server", function ()
    local Servers = game.HttpService:JSONDecode(game:HttpGet(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId)))
    --
    for Index, Value in pairs(Servers.data) do
        if Value.playing ~= Value.maxPlayers and Value.playing > 10 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Value.id)
        end
    end
end)

local waterMarkSettings = setsTab:AddLeftTabbox("Watermark Settings")
local waterSettings = waterMarkSettings:AddTab("Watermark Settings")
waterSettings:AddDropdown("waterMarkSettingsDrop", {Values = {"Config Name", "Nickname", "Latency", "Current Time", "Framerate", "Week Day"}, Default = 0, Multi = true, Text = "Watermark Settings"})
task.spawn(function()

    game:GetService("RunService").RenderStepped:Connect(function (TimeBetween)
        

    --while game:GetService('RunService').RenderStepped:Wait() do

        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local time = os.date('%I:%M:%S %p')
        local fps = math.floor(1/TimeBetween)
        local date = os.date("%A")
        local bigString = "BruhWare V5"
        local ping = string.format("%0.0f", LocalPlayer:GetNetworkPing()*1000)

        Options.waterMarkSettingsDrop:OnChanged(function ()

            local split = " | "
            
            for key, value in next, Options.waterMarkSettingsDrop.Value do
                --print(key, value)
        
                if key == "Default" and value == true then
                    bigString = "BruhWare" .. bigString
                elseif key == "Default" and value == false then
                    key = "Default"; value = true;
                    --bigString = "BruhWare" .. bigString
                end
        
                if key == "Config Name" and value == true then
                    bigString = bigString .. split .. "ConfigName"
                end
        
                if key == "Nickname" and value == true then
                    bigString = bigString .. split .. tostring(game:GetService("Players").LocalPlayer.DisplayName)
                end
        
                if key == "Latency" and value == true then
                    bigString = bigString .. split .. ping .. " ms"
                end
        
                if key == "Current Time" and value == true then
                    bigString = bigString .. split .. time
                end
        
                if key == "Framerate" and value == true then
                    bigString = bigString .. split .. fps .. " fps"
                end
        
                if key == "Week Day" and value == true then
                    bigString = bigString .. split .. date
                end

            end
        
        
        end)

        Library:SetWatermark(bigString)

    end)
    --end
end)


SaveManager:SetLibrary(Library)
ThemeManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
ThemeManager:SetFolder("BruhWareV5")
SaveManager:SetFolder("BruhWareV5/BB")
SaveManager:BuildConfigSection(setsTab)

Library:Notify("Loaded UI!");

local Players = game:GetService("Players")
local Camera = game:GetService("Workspace").CurrentCamera
local LocalPlayer = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local nv = Vector3.new()
local dot = nv.Dot
local locked = nil
local partLocked = nil
local partLockedLocked = false
local aimLocked = false
local cheat_client = {connections = {}, drawings = {},} -- thanks bbot. <3 you :3

local Tortoiseshell,WeaponModel,NewRandom = require(ReplicatedStorage.TS),nil,Random.new()
local ProjectileSpeed,ProjectileGravity,GravityCorrection = 1600,Vector3.new(0,150,0),2
local BanCommands = {"GetUpdate","SetUpdate","Invoke","GetSetting","FireProjectile"}

local Events = getupvalue(Tortoiseshell.Network.BindEvent,1)
local WeaponConfigs = getupvalue(Tortoiseshell.Items.GetConfig,3)
local Characters = getupvalue(Tortoiseshell.Characters.GetCharacter,1)
local Projectiles = getupvalue(Tortoiseshell.Projectiles.InitProjectile,1)

local WallCheckParams = RaycastParams.new()
WallCheckParams.FilterType = Enum.RaycastFilterType.Whitelist
WallCheckParams.IgnoreWater = true

local function Raycast(Origin,Direction,Table)
    WallCheckParams.FilterDescendantsInstances = Table
    return Workspace:Raycast(Origin,Direction,WallCheckParams)
end

local function WallCheck(Enabled,Hitbox)
    if not Enabled then return true end
    return not Raycast(Camera.CFrame.Position,
    Hitbox.Position - Camera.CFrame.Position,
    {Workspace.Geometry,Workspace.Terrain})
end

-- break da anti cheat lol!
function breakDaAntiCheat()
    do
        local OldNamecall,OldTaskSpawn
        OldNamecall = hookmetamethod(game,"__namecall",function(Self,...)
            if checkcaller() then return OldNamecall(Self,...) end
            local Method,Args = getnamecallmethod(),{...}
    
            if Method == "FireServer" then
                if type(Args[1]) == "string"
                and table.find(BanCommands,Args[1]) then
                    print("blocked",Args[2]) return
                end
            end
    
            return OldNamecall(Self,...)
        end)

        OldTaskSpawn = hookfunction(getrenv().task.spawn,function(...)
            if checkcaller() then return OldTaskSpawn(...) end
    
            local Args = {...}
            if type(Args[1]) == "function" then
                local Constants = getconstants(Args[1])
                if not table.find(Constants,"thread error ")
                and table.find(Constants,"wait") then
                    print("blocked wtd crash")
                    wait(31536000) -- 365 days
                end
            end
    
            return OldTaskSpawn(...)
        end)
    end
end

local function getHitbox(Character)
    
end

local function findWeaponModel()
    for i,v in pairs(Workspace:GetChildren()) do
        if v:FindFirstChild("AnimationController") then
            return v
        end
    end
end

local function getController()
    local controller = Tortoiseshell.Items:GetControllers()
    for i,v in pairs(controller) do
        if v.Equipped then
            return v
        end
    end
end

local function getEquippedWeapon()
    local controllers = Tortoiseshell.Items:GetControllers()
    for i,v in pairs(controllers) do
        if v.Equipped then
            return i,WeaponConfigs[i] -- i is the equipped weapon v is the player controller
        end
    end
end

local function fixUpValue(fn,hook,global)
    if global then
        old = hookfunction(fn,function(...)
            return hook(old,...)
        end)
    else local old = nil
        old = hookfunction(fn,function(...)
            return hook(old,...)
        end)
    end
end

local function clamp(a, lowerNum, higher) -- Thanks bbot!
	if a > higher then
		return higher
	elseif a < lowerNum then
		return lowerNum
	else
		return a
	end
end

local function createDrawings(class, properties)
    local drawing = Drawing.new(class)
    for i,v in next, properties do
        drawing[i] = v
    end
    table.insert(cheat_client.drawings, drawing)
    return drawing
end

local function create_conection(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(cheat_client.connections, connection)
    return connection
end

local function GetHitbox(Hitbox,Name)
    for Index,Part in pairs(Hitbox:GetChildren()) do
        local WeldConstraint = Part:FindFirstChildOfClass("WeldConstraint")
        if not WeldConstraint then break end
        if tostring(WeldConstraint.Part0) == Name then
            return Part
        end
    end
end

local function myCharacter()
    for i, v in ipairs(workspace.Characters:GetChildren()) do
        if (v.Body.Head.Position - Camera.CFrame.p).magnitude < 1 then return v end 
    end
end

local function onTeam(x)
    for i, v in ipairs(LocalPlayer.PlayerGui:GetChildren()) do 
        if v.Name == "NameGui" then 
            if v.Adornee:IsDescendantOf(x) then
                return true 
            end    
        end
    end
end

function calcHitChance(Percentage)
    Percentage = math.floor(Percentage)

    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100

    return chance <= Percentage / 100
end

local function gunChams()

    if WeaponModel ~= nil and Toggles.localPlayerChams.Value and Toggles.gunChams.Value and WeaponModel then -- should be gun chams
        if WeaponModel.Parent ~= nil then
            for i,v in pairs(WeaponModel.Body:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Color = Options.gunColor.Value
                    v.Material = Enum.Material[Options.gunMat.Value]
                end
            end
        end
    end

end

local function armChams()
    if Toggles.localPlayerChams.Value and Toggles.armChams.Value then
        for i,v in pairs(Workspace.Arms:GetChildren()) do
            if v:IsA("BasePart") then
                v.Color = Options.armColor.Value
                v.Material = Enum.Material[Options.armMat.Value]
            end
        end
    end
end

local bVector2 = {}
do -- vector functions
	function bVector2:getRotate(Vec, Rads)
		local vec = Vec.Unit
		--x2 = cos Î² x1 âˆ’ sin Î² y1
		--y2 = sin Î² x1 + cos Î² y1
		local sin = math.sin(Rads)
		local cos = math.cos(Rads)
		local x = (cos * vec.x) - (sin * vec.y)
		local y = (sin * vec.x) + (cos * vec.y)

		return Vector2.new(x, y).Unit * Vec.Magnitude
	end
end

local function map(N, OldMin, OldMax, Min, Max)
	return (N - OldMin) / (OldMax - OldMin) * (Max - Min) + Min
end

function getClosestPlayer()

    mouseLocation = UserInputService:GetMouseLocation()
    
    local closestChar = nil
    local plr_pos, OnScreen = nil, nil
    local plrPart = Options.aimPart.Value
    local chance = calcHitChance(Options.aimbotAccuracy.Value)
    local partsList = {"Head", "Chest", "LeftArm", "RightArm", "LeftLeg", "RightLeg"}
    local fovValue = Options.aimbotFov.Value
    local fuckPart = nil

    if locked == nil then
        aimLocked = false
    end

    if partLocked == nil then
        partLockedLocked = false
    end

    if partLocked == nil and Options.aimPart.Value == "Random" then
        plrPart = partsList[math.random(1, #partsList)]
        partLockedLocked = true
    end

    for i,v in next, workspace.Characters:GetChildren() do
        if not onTeam(v) and v ~= myCharacter() and chance then
            
            local Base = v.Body

            if Toggles.prediction.Value then

                local prediction

                local playerRoot = Base[plrPart]
                if playerRoot then

                    --// p100 prediction formula
                    prediction = playerRoot.Velocity * (1) * (Camera.CFrame.p - Base[plrPart].Position).magnitude / 1000

                    plr_pos, OnScreen = Camera:worldToViewportPoint(Base[plrPart].Position + prediction)

                end
            else
                plr_pos, OnScreen = Camera:worldToViewportPoint(Base[plrPart].Position)
            end

            local char = v

            if OnScreen then
                
                local mag = (Vector2.new(mouseLocation.X, mouseLocation.Y) - Vector2.new(plr_pos.X, plr_pos.Y)).Magnitude
                local Distance = mag

                if mag <= Distance and mag <= fovValue then
                    
                    Distance = mag
                    closestChar = char
                    target = v -- not used idk why
                    fuckPart = Base[plrPart]

                    if locked == nil then
                        locked = closestChar
                        aimLocked = true
                    end

                    return closestChar, fuckPart, plr_pos
                end


            end

        end
    end

end

function getClosestPlayerSilent() -- /gethitbox lol. This shit works well

    mouseLocation = UserInputService:GetMouseLocation()
    
    local closestChar = nil
    local plr_pos, OnScreen = nil, nil
    local plrPart = Options.silentAimPart.Value
    local chance = calcHitChance(Options.silentAimAccuracy.Value)
    local partsList = {"Head", "Chest", "LeftArm", "RightArm", "LeftLeg", "RightLeg"}
    local fovValue = Options.silentAimFov.Value
    local fuckPart = nil

    if Options.silentAimPart.Value == "Random" then
        plrPart = partsList[math.random(1, #partsList)]
    end

    for i,v in next, workspace.Characters:GetChildren() do
        if not onTeam(v) and v ~= myCharacter() and chance then
            
            local Base = v.Body

            plr_pos, OnScreen = Camera:worldToViewportPoint(Base[plrPart].Position)

            if OnScreen then

                local mag = (Vector2.new(mouseLocation.X, mouseLocation.Y) - Vector2.new(plr_pos.X, plr_pos.Y)).Magnitude
                local Distance = mag

                if Toggles.silentAimVisCheck.Value then

                    if WallCheck(Toggles.silentAimVisCheck.Value, Base[plrPart]) then
                
                        if mag <= Distance and mag <= fovValue then

                            Distance = mag
                            closestChar = v
    
                            if v ~= nil then
                                for i,h in pairs(v.Hitbox:GetChildren()) do -- game:GetService("Workspace").Characters.bgreoxdfba.Hitbox.ukjuvmuglm
        
                                    local part = h
        
                                    for i,p in pairs(h:GetChildren()) do -- game:GetService("Workspace").Characters.oztbpxgcrl.Hitbox.ukjuvmuglm.WeldConstraint
                                        if tostring(p.Part0) == plrPart then
                                            return closestChar, p, part
                                        end
                                    end
                                end
                            end
                        end
                    end

                else

                    if mag <= Distance and mag <= fovValue then

                        Distance = mag
                        closestChar = v

                        if v ~= nil then
                            for i,h in pairs(v.Hitbox:GetChildren()) do -- game:GetService("Workspace").Characters.bgreoxdfba.Hitbox.ukjuvmuglm
    
                                local part = h
    
                                for i,p in pairs(h:GetChildren()) do -- game:GetService("Workspace").Characters.oztbpxgcrl.Hitbox.ukjuvmuglm.WeldConstraint
                                    if tostring(p.Part0) == plrPart then
                                        return closestChar, p, part
                                    end
                                end
                            end
                        end
                    end

                end

            end
        end
    end

end

function Visuals(Player, Name)

    local esp = { drawings = {} }

    -- Outline Box
    esp.drawings.outlineBox = createDrawings("Square", {Color = Color3.new(0, 0, 0), Thickness = 2, ZIndex = -10})
    esp.drawings.box = createDrawings("Square", {Color = Color3.new(255,255,255), Thickness = 1, ZIndex = -9})

    -- Healthbar
    esp.drawings.healthOutlineBox = createDrawings("Square", {Color = Color3.new(0, 0, 0), Thickness = 2, ZIndex = -10, Filled = true})
    esp.drawings.healthBarBox = createDrawings("Square", {Color = Color3.new(255,255,255), Thickness = 1, ZIndex = -9, Filled = true})

    -- name esp
    esp.drawings.nameText = createDrawings("Text", {Center = true, Outline = true, Font = 2, Size = 13})
    
    -- dist esp
    esp.drawings.distanceText = createDrawings("Text", {Center = true, Outline = true, Font = 2, Size = 13})

    -- OOV Arrow
    esp.drawings.oovTriangle = createDrawings("Triangle", {Thickness = 1, Filled = true})

    function esp:destruct()

        if Player:FindFirstChild("Highlight") then
            Player.Highlight:Destroy()
        end

        esp.update_connection:Disconnect()
        for _,v in next, esp.drawings do
            v:Remove()
        end
    end

    esp.update_connection = create_conection(RunService.RenderStepped, function()
        if not Player:IsDescendantOf(workspace.Characters) then

            esp.drawings.outlineBox.Visible = false
            esp.drawings.box.Visible = false

            esp.drawings.healthBarBox.Visible = false
            esp.drawings.healthOutlineBox.Visible = false

            esp.drawings.distanceText.Visible = false

            esp.drawings.nameText.Visible = false

            esp.drawings.oovTriangle.Visible = false

            esp:destruct()
        else
            if Player ~= nil then

                esp.drawings.distanceText.Color = Options.distanceColor.Value
                esp.drawings.nameText.Color = Options.nameColor.Value
                esp.drawings.box.Color = Options.boxColor.Value
                esp.drawings.oovTriangle.Color = Options.arrowColor.Value

                local Root = Player.Body.Hips
                local Head = Player.Body.Head
    
                local Health = Player.Health.Value
                local MaxHealth = Player.Health.MaxHealth.Value
    
                if Options.healthbarColor.Value == Color3.fromRGB(255,255,255) then -- might work??
                    esp.drawings.healthBarBox.Color = Color3.fromRGB(255 - 255 / (MaxHealth / Health), 255 / (MaxHealth / Health), 0)
                else
                    esp.drawings.healthBarBox.Color = Options.healthbarColor.Value
                end

                if (Player and Root) then
    
                    local Cam = Camera.CFrame
                    local Torso = Root.CFrame
                    
                    local top, top_isrendered = workspace.Camera:worldToViewportPoint(Head.Position + (Torso.UpVector * 1) + Cam.UpVector)
                    local bottom, bottom_isrendered = workspace.Camera:worldToViewportPoint(Torso.Position - (Torso.UpVector * 2.5) - Cam.UpVector)
            
                    local minY = math.abs(bottom.y - top.y)
                    local sizeX = math.ceil(math.max(clamp(math.abs(bottom.x - top.x) * 2.5, 0, minY), minY / 2, 3))
                    local sizeY = math.ceil(math.max(minY, sizeX * 0.7, 3))
    
                    local renderDistance = math.ceil((Root.Position - Camera.CFrame.Position).magnitude) -- idk why this isnt workign lol
    
                    if top_isrendered or bottom_isrendered then
    
                        esp.drawings.oovTriangle.Visible = false

                        local boxtop = Vector2.new(
                            math.floor(top.x * 0.5 + bottom.x * 0.5 - sizeX * 0.5),
                            math.floor(math.min(top.y, bottom.y))
                        )
        
                        local boxsize = { w = sizeX, h = sizeY }

                        esp.drawings.outlineBox.Position = Vector2.new(boxtop.x, boxtop.y)
                        esp.drawings.outlineBox.Size = Vector2.new(boxsize.w, boxsize.h)
    
                        esp.drawings.box.Position = Vector2.new(boxtop.x, boxtop.y)
                        esp.drawings.box.Size = Vector2.new(boxsize.w, boxsize.h)
    
                        if Toggles.boxes.Value then
                            esp.drawings.outlineBox.Visible = true
                            esp.drawings.box.Visible = true
                        else
                            esp.drawings.outlineBox.Visible = false
                            esp.drawings.box.Visible = false
                        end

                        if Toggles.healthbar.Value then
                            local ySizeBar = -math.floor(boxsize.h * Health / MaxHealth)
                            esp.drawings.healthOutlineBox.Position = Vector2.new(boxtop.x - 7, boxtop.y - 1)
                            esp.drawings.healthOutlineBox.Size = Vector2.new(4, boxsize.h + 3)
    
                            esp.drawings.healthBarBox.Position = Vector2.new(boxtop.x - 6, boxtop.y + boxsize.h)
                            esp.drawings.healthBarBox.Size = Vector2.new(2, ySizeBar)
    
                            esp.drawings.healthBarBox.Visible = true
                            esp.drawings.healthOutlineBox.Visible = true
                        else
                            esp.drawings.healthBarBox.Visible = false
                            esp.drawings.healthOutlineBox.Visible = false
                        end

                        if Toggles.distance.Value then
                            local dist_pos = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 1)
                            esp.drawings.distanceText.Text = tostring("(" .. math.ceil((Root.Position - Camera.CFrame.Position).magnitude) .. ")")
                            esp.drawings.distanceText.Position = dist_pos
                            esp.drawings.distanceText.Visible = true
                        else
                            esp.drawings.distanceText.Visible = false
                        end

                        if Toggles.nametags.Value then
                            esp.drawings.nameText.Text = tostring(Name)
                            esp.drawings.nameText.Position = (Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 15)) or Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 4)))
                            esp.drawings.nameText.Visible = true
                        else
                            esp.drawings.nameText.Visible = false
                        end

                    else
                        esp.drawings.outlineBox.Visible = false
                        esp.drawings.box.Visible = false

                        esp.drawings.healthBarBox.Visible = false
                        esp.drawings.healthOutlineBox.Visible = false

                        esp.drawings.distanceText.Visible = false

                        esp.drawings.nameText.Visible = false

                        if Toggles.arrows.Value then
                            esp.drawings.oovTriangle.Visible = true
    
                            local relativePos = Camera.CFrame:PointToObjectSpace(Root.Position)
                            local angle = math.atan2(-relativePos.y, relativePos.x)
                            local distance = dot(relativePos.Unit, relativePos)
                            local arrow_size = 15 and map(distance, 1, 100, 15, 15) or 15
                            arrow_size = arrow_size > 15 and 15 or arrow_size < 15 and 15 or arrow_size
        
                            direction = Vector2.new(math.cos(angle), math.sin(angle))
                            local pos
        
                            if 20 ~= 101 then
                                pos = (
                                        direction * Camera.ViewportSize.x * 20 / 200
                                    ) + (Camera.ViewportSize * 0.5)
                            end
        
                            if not pos or pos.y > Camera.ViewportSize.y - 5 or pos.y < 5 then
                                pos = Camera:AngleToEdge(angle, 5)
                            end
        
                            esp.drawings.oovTriangle.PointA = pos
                            esp.drawings.oovTriangle.PointB = pos - bVector2:getRotate(direction, 0.5) * arrow_size
                            esp.drawings.oovTriangle.PointC = pos - bVector2:getRotate(direction, -0.5) * arrow_size
    
                        else
                            esp.drawings.oovTriangle.Visible = false
                        end

                    end

                    if not Player:FindFirstChild("Highlight") then

                        local highlight = Instance.new("Highlight", Player)
                        highlight.FillColor = Options.fillColor.Value
                        highlight.OutlineColor = Options.outlineColor.Value
                        highlight.DepthMode = 0
    
                        highlight.FillTransparency = Options.fillTrans.Value / 100
                        highlight.OutlineTransparency = Options.outlineTrans.Value / 100

                    end

                    if Player:FindFirstChild("Highlight") then

                        Player.Highlight.FillColor = Options.fillColor.Value
                        Player.Highlight.OutlineColor = Options.outlineColor.Value
                        Player.Highlight.FillTransparency = Options.fillTrans.Value / 100
                        Player.Highlight.OutlineTransparency = Options.outlineTrans.Value / 100
    
                        if Toggles.enemyChamsCheckbox.Value == true then
                            Player.Highlight.Enabled = true
                        else
                            Player.Highlight.Enabled = false
                        end
    
                        if Toggles.enemyChamsOccluded.Value == true then
                            Player.Highlight.DepthMode = 1
                        else
                            Player.Highlight.DepthMode = 0
                        end
    
    
                    end

                else
                    esp.drawings.outlineBox.Visible = false
                    esp.drawings.box.Visible = false

                    esp.drawings.healthBarBox.Visible = false
                    esp.drawings.healthOutlineBox.Visible = false

                    esp.drawings.distanceText.Visible = false

                    esp.drawings.nameText.Visible = false

                    esp.drawings.oovTriangle.Visible = false

                    esp:destruct()
                end

            else
                esp.drawings.outlineBox.Visible = false
                esp.drawings.box.Visible = false

                esp.drawings.healthBarBox.Visible = false
                esp.drawings.healthOutlineBox.Visible = false

                esp.drawings.distanceText.Visible = false

                esp.drawings.nameText.Visible = false

                esp.drawings.oovTriangle.Visible = false

                esp:destruct()
            end
        end

    end)

    for i, v in ipairs(LocalPlayer.PlayerGui:GetChildren()) do 
        if v.Name == "Highlight" then 
            v:Destroy()
        end
    end

end

function Aimbot()
    
    task.spawn(function () -- this fixed keybinds not working (fuck roblox user input)
        while true do
            wait()

            local state = Options.aimKey:GetState()

            if state then
                aiming = true
            else
                aiming = false
            end

            if Library.Unloaded then break end
        end
    end)

    local fovcircle = Drawing.new("Circle")
    fovcircle.Visible = Toggles.showAimFOV.Value
    fovcircle.Radius = Options.aimbotFov.Value
    fovcircle.Color = Options.aimbotFovColor.Value
    fovcircle.Thickness = 1
    fovcircle.Filled = false

    local fovcircleSilent = Drawing.new("Circle")
    fovcircleSilent.Visible = Toggles.showAimFOV.Value
    fovcircleSilent.Radius = Options.aimbotFov.Value
    fovcircleSilent.Color = Options.aimbotFovColor.Value
    fovcircleSilent.Thickness = 1
    fovcircleSilent.Filled = false

    RunService.RenderStepped:Connect(function ()

        mouseLocation = UserInputService:GetMouseLocation()
        
        fovcircle.Visible = Toggles.showAimFOV.Value
        fovcircle.Radius = Options.aimbotFov.Value

        local closestPlr, plrPart, plrPos = nil, nil, nil

        fovcircle.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
        fovcircle.Color = Options.aimbotFovColor.Value

        fovcircleSilent.Visible = Toggles.showSilentAimFOV.Value
        fovcircleSilent.Radius = Options.silentAimFov.Value

        fovcircleSilent.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
        fovcircleSilent.Color = Options.silentFovColor.Value

        local horizontal = Options.horizontalSmoothing.Value
        local vertical = Options.verticalSmoothing.Value

        if aiming and Toggles.aimbot.Value == true then
            closestPlr, plrPart, plrPos = getClosestPlayer()
        else
            closestPlr, plrPart, plrPos = nil, nil, nil
        end

        if plrPos ~= nil and locked ~= nil and aimLocked and plrPart ~= nil and Toggles.visCheck.Value == true then

            if WallCheck(Toggles.visCheck.Value, plrPart) then

                if horizontal < 1 and vertical < 1 then -- what the fuck did I code here. I dont ever remember doing mouse movements like this. This is aboslutely aids.
                    mousemoverel( (plrPos.X - mouseLocation.X), (plrPos.Y - mouseLocation.Y))
                elseif horizontal < 1 then
                    mousemoverel( (plrPos.X - mouseLocation.X), (plrPos.Y - mouseLocation.Y) / vertical)
                elseif vertical < 1 then
                    mousemoverel( (plrPos.X - mouseLocation.X) / horizontal, (plrPos.Y - mouseLocation.Y))
                else
                    mousemoverel( (plrPos.X - mouseLocation.X) / horizontal, (plrPos.Y - mouseLocation.Y) / vertical)
                end

            end

        elseif plrPos ~= nil and locked ~= nil and aimLocked and plrPart ~= nil and Toggles.visCheck.Value == false then

            if horizontal < 1 and vertical < 1 then -- what the fuck did I code here. I dont ever remember doing mouse movements like this. This is aboslutely aids.
                mousemoverel( (plrPos.X - mouseLocation.X), (plrPos.Y - mouseLocation.Y))
            elseif horizontal < 1 then
                mousemoverel( (plrPos.X - mouseLocation.X), (plrPos.Y - mouseLocation.Y) / vertical)
            elseif vertical < 1 then
                mousemoverel( (plrPos.X - mouseLocation.X) / horizontal, (plrPos.Y - mouseLocation.Y))
            else
                mousemoverel( (plrPos.X - mouseLocation.X) / horizontal, (plrPos.Y - mouseLocation.Y) / vertical)
            end

        end

        if Toggles.localPlayerChams.Value and Toggles.gunChams.Value then
            gunChams()
        end

        if Toggles.armChams.Value and Toggles.localPlayerChams.Value then
            armChams()
        end

        -- game:GetService("Players").TheRealOneHex.PlayerGui.MainGui.HitmarkerScript.HitmarkerSound
        -- playback speed of 1

        
    end)

end

function SilentAim() -- silent aim among other things
    
    fixUpValue(Tortoiseshell.Network.Fire, function (Old,Self,...)
        local Args = {...}

        local closestChar, p, part = getClosestPlayerSilent()
        
        if Args[2] == "__Hit" then
            if Toggles.silentAim.Value and closestChar and p and part then
                Args[4] = part.Position
                Args[5] = part
                Args[7] = closestChar
                Tortoiseshell.UI.Events.Hitmarker:Fire(
                part,part.Position)
                return Old(Self, unpack(Args))
            end

            if Args[4] == part.Position then
                local sound = Instance.new("Sound", workspace)
                sound.SoundId = "rbxassetid://4817809188"
                sound.Volume = 4
                sound.PlayOnRemove = true
                sound:Destroy()
            end

        end

        if Args[2] == "Throw" then -- uhh like grenade silent aim maybe idk
            if Toggles.silentAim.Value and closestChar and p and part then
                Args[5] = (part.Position - Camera.CFrame.Position).Unit

                Tortoiseshell.UI.Events.Hitmarker:Fire(
                part,part.Position)
                return Old(Self,unpack(Args))
            end
        end

        if Args[3] == "Look" then
            if Toggles.antiAim.Value then
                local pitch = Options.pitch.Value
                local yaw = Options.yaw.Value
                local random = Random.new()
                local states = {"Aiming", "Grounded", "InWater", "Lean"}
                local choseState
                -- plrPart = partsList[math.random(1, #partsList)]
                choseState = states[math.random(1, #states)]

                if Toggles.randomPitch.Value then
                    pitch = random:NextNumber(-2, 2)
                end

                if Toggles.randomYaw.Value then
                    yaw = random:NextNumber(-1.5, 1.5)
                end

                Args[4] = Toggles.randomPitch.Value and pitch or Options.pitch.Value
                Old(Self,"Character","State",choseState,Toggles.randomYaw.Value and yaw or Options.yaw.Value)

                return Old(Self,unpack(Args))
            end
        end

        return Old(Self,...)
    end)

    
end

function miscShit() -- yeah
    
    fixUpValue(Tortoiseshell.Items.GetConfig,function (Old,Self,...)
        local Args = {Old(Self,...)} local Config = Args[1]
        if Toggles.weaponMods.Value and (Config and Config.Recoil and Config.Recoil.Default) then

            Config.Recoil.Default.WeaponScale = Config.Recoil.Default.WeaponScale * (Options.weaponScale.Value / 100)
            Config.Recoil.Default.CameraScale = Config.Recoil.Default.CameraScale * (Options.cameraScale.Value / 100)
            Config.Recoil.Default.RecoilScale = Config.Recoil.Default.RecoilScale * (Options.recoilScale.Value / 100)
            
        end
        return unpack(Args)
    end)

    fixUpValue(Tortoiseshell.Raycast.CastGeometryAndEnemies,function(Old,Self,...)
        local Args = {...} if Toggles.weaponMods.Value and Args[4] and Args[4].Gravity then
            Args[4].Gravity = Args[4].Gravity * (Options.bulletDrop.Value / 100)
        end
        return Old(Self,unpack(Args))
    end)

    fixUpValue(Tortoiseshell.Projectiles.InitProjectile,function(Old,Self,...) -- maybe use this for better prediction later
        local Args = {...} if Args[4] == LocalPlayer then
            ProjectileSpeed = Projectiles[Args[1]].Speed
            ProjectileGravity = Vector3.new(0,math.abs(Projectiles[Args[1]].Gravity), 0)
        end
        return Old(Self,...)
    end)

    fixUpValue(Tortoiseshell.Items.GetAnimator,function(Old,Self,...)
        local Args = {...} if Args[1] then WeaponModel = Args[3] end
        return Old(Self,...)
    end,true)

end

for i,v in pairs(workspace.Characters:GetChildren()) do

    print(v)
    if not onTeam(v) and v ~= myCharacter() then
        Visuals(v, v.Name)
    end

end

workspace.Characters.ChildAdded:Connect(function (Player)

    local origName = Player.Name

    wait(1)

    --print(Player)

    if not onTeam(Player) and Player ~= myCharacter() then
        Visuals(Player, origName)
    end
end)


Aimbot()
breakDaAntiCheat() -- very funne
SilentAim()
miscShit()

Library:Notify("Loaded Menu Features!");
