--local IsSynapse = is_synapse_function and is_synapse_function((function() end))

--if IsSynapse then continue else return end

repeat task.wait() until game:IsLoaded()

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Window = Library:CreateWindow({Title = 'BruhWare | Project Delta | UID: DEV',Center = true, AutoShow = true})
local Themes = {"Default", "Skeet", "Fatality", "Onetap", "Neverlose"}


-- game:GetService("Lighting")["Nuclear Winter 2 - A Jegabert skybox"]
-- game:GetService("Lighting").Sky

local aimTab = Window:AddTab("Aimbot")
local visTab = Window:AddTab("Visuals")
local miscTab = Window:AddTab("Misc.")
local rageTab = Window:AddTab("Rage")
local setsTab = Window:AddTab("Settings")

local aimbotTabbox = aimTab:AddLeftTabbox("Aimbot")
local aimbot = aimbotTabbox:AddTab("Aimbot")
aimbot:AddToggle("aimbot", {Text = "Enabled"}):AddKeyPicker("aimKey", {Text = "Aimbot", Default = "MB2", Mode = "Hold"})
aimbot:AddToggle("visCheck", {Text = "Visible Check"})
aimbot:AddToggle("showAimFOV", {Text = "Show Aimbot FOV"})
aimbot:AddToggle("predictMovement", {Text = "Predict Movement"})
aimbot:AddDropdown("aimPart", {Values = {"Head", "Upper Torso", "Lower Torso", "Left Lower Arm", "Right Lower Arm", "Left Lower Leg", "Right Lower Leg", "Random"}, Default = 1, Multi = false, Text = "Aim Part"})
aimbot:AddSlider("aimbotFov", {Text = "Fov Radius", Default = 100, Min = 0, Max = 800, Rounding = 0})
aimbot:AddSlider("aimSmoothing", {Text = "Aimbot Smoothing", Default = 25, Min = 1, Max = 100, Rounding = 0, Suffix = "%"})
aimbot:AddDropdown("aimAccuracy",{Values = {"Extremely High", "High", "Medium", "Low", "Very Low"}, Default = 1, Multi = false, Text = "Aimbot Accuracy"})
--aimbot:AddSlider("aimAccuracy", {Text = "Aimbot Accuracy", Default = 90, Min = 1, Max = 100, Rounding = 0, Suffix = "%"})

local silentaimTabbox = aimTab:AddRightTabbox("Silent Aimbot")
local silentAim = silentaimTabbox:AddTab("Silent Aimbot")
silentAim:AddToggle("silentAim", {Text = "Enabled"})
silentAim:AddToggle("visCheckSilent", {Text = "Visible Check"})
silentAim:AddToggle("showSilentFOV", {Text = "Show Silent FOV"})
silentAim:AddToggle("showSilentTarget",{Text = "Show Target Snaplines"})
silentAim:AddDropdown("aimPartSilent", {Values = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Random"}, Default = 1, Multi = false, Text = "Aim Part"})
silentAim:AddSlider("silentFov", {Text = "Fov Radius", Default = 100, Min = 0, Max = 800, Rounding = 0})
silentAim:AddSlider("silentDist", {Text = "Max Distance", Default = 350, Min = 1, Max = 3500, Rounding = 0})
silentAim:AddDropdown("silentAccuracy",{Values = {"Extremely High", "High", "Medium", "Low", "Very Low"}, Default = 1, Multi = false, Text = "Aimbot Accuracy"})

local espTabbox = visTab:AddLeftTabbox("Player ESP")
local esp = espTabbox:AddTab("Player ESP")
esp:AddToggle("boxes", {Text = "Bounding Box"}):AddColorPicker("boxColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("snaplines", {Text = "Snapline"}):AddColorPicker("snaplineColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("nametags", {Text = "Name"}):AddColorPicker("nameColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("distance", {Text = "Distance"}):AddColorPicker("distanceColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("healthbar", {Text = "Health Bar"}):AddColorPicker("healthbarColor", {Default = Color3.fromRGB(255,255,255)})


local espSettings = espTabbox:AddTab("ESP Settings")
--espSettings:AddToggle("healthbarOverride", {Text = "Override Healthbar Color"}):AddColorPicker("healthbarColor",{Default = Color3.fromRGB(255,255,255)})
espSettings:AddSlider("espDistance", {Text = "ESP Render Distance", Default = 500, Min = 0, Max = 3500, Rounding = 0})
espSettings:AddDropdown("snaplineStart", {Values = {"Bottom", "Top", "Middle"}, Default = 1, Multi = false, Text = "Snapline Start Position"})
espSettings:AddDropdown("snaplineEnd", {Values = {"Head", "Torso", "Legs"}, Default = 1, Multi = false, Text = "Snapline End Position"})
espSettings:AddDropdown("boxStyle", {Values = {"Default", "Corners"}, Default = 1, Multi = false, Text = "Bounding Box Style"})
espSettings:AddDropdown("healthbarOptions", {Values = {"Left Side", "Right Side"}, Default = 1, Multi = false, Text = "Healthbar Position"})

local lootEspTabbox = visTab:AddLeftTabbox("World ESP")
local lootEsp = lootEspTabbox:AddTab("World ESP")
lootEsp:AddToggle("containers", {Text = "Containers"})
lootEsp:AddToggle("playerBodies", {Text = "Player Bodies"})
lootEsp:AddToggle("extracts", {Text = "Extract Locations"})

local localChamsTabbox = visTab:AddRightTabbox("Local Chams")
local localChams = localChamsTabbox:AddTab("Local Chams")
localChams:AddToggle("armChams", {Text = "Arm Chams"}):AddColorPicker("armColor", {Default = Color3.fromRGB(255,255,255)})
localChams:AddToggle("gunChams", {Text = "Gun Chams"}):AddColorPicker("gunColor", {Default = Color3.fromRGB(255,255,255)})
localChams:AddToggle("extendFOV", {Text = "FOV Changer"})
localChams:AddSlider("fovValue", {Text = "FOV Value", Default = 60, Min = 60, Max = 120, Rounding = 0})

localChams:AddSlider("armTrans", {Text = "Arm Transparency", Default = 0, Min = 0, Max = 100, Rounding = 0})
localChams:AddSlider("gunTrans", {Text = "Gun Transparency", Default = 0, Min = 0, Max = 100, Rounding = 0})
localChams:AddDropdown("armMat", {Values = {"Plastic", "Neon", "ForceField", "Glass", "Foil"}, Default = 1, Multi = false, Text = "Arm Material"})
localChams:AddDropdown("gunMat", {Values = {"Plastic", "Neon", "ForceField", "Glass", "Foil"}, Default = 1, Multi = false, Text = "Gun Material"})

local chamsTabbox = visTab:AddRightTabbox("Enemy Chams")
local chams = chamsTabbox:AddTab("Enemy Chams")
chams:AddToggle("enemyChamsCheckbox", {Text = "Enabled"})
chams:AddToggle("enemyChamsOccluded", {Text = "Occluded"})
chams:AddLabel("Fill Color"):AddColorPicker("fillColor", { Default = Color3.fromRGB(255, 0, 0) })
chams:AddLabel("Outline Color"):AddColorPicker("outlineColor", { Default = Color3.fromRGB(255, 255, 255) })
chams:AddSlider("fillTrans", {Text = "Fill Transparency", Default = 50, Min = 0, Max = 100, Rounding = 0})
chams:AddSlider("outlineTrans", {Text = "Outline Transparency", Default = 50, Min = 0, Max = 100, Rounding = 0})

local worldEffectsTabbox = miscTab:AddLeftTabbox("World Effects")
local worldEffects = worldEffectsTabbox:AddTab("World Effects")
worldEffects:AddToggle("fullBright", {Text = "Full Bright"})
worldEffects:AddToggle("removeGrass", {Text = "Remove Grass"})
Toggles.removeGrass:OnChanged(function ()
    if Toggles.removeGrass.Value == true then
        sethiddenproperty(workspace.Terrain, "Decoration", false)
    else
        sethiddenproperty(workspace.Terrain, "Decoration", true)
    end
end)
worldEffects:AddToggle("bodyChams", {Text = "Dead Body Chams"}):AddColorPicker("deadChamsClr", {Default = Color3.fromRGB(255,255,255)})
worldEffects:AddDropdown("bodyChamMat", {Values = {"Plastic", "Neon", "ForceField", "Glass", "Foil"}, Default = 1, Multi = false, Text = "Dead Body Material"})
worldEffects:AddToggle("customSkybox", {Text = "Custom Skybox"})
--[[
worldEffects:AddDropdown("skyboxOptions", {Values = {"Starry Evening", "Christmas", "Space", "Nebula", "Vaporwave"}, Default = 1, Multi = false, Text = "Skybox Options"})
Options.skyboxOptions:OnChanged(function ()

    local skyPath = game:GetService("Lighting").Sky or game:GetService("Lighting")["Nuclear Winter 2 - A Jegabert skybox"]

    if Toggles.customSkybox.Value == true then
        if Options.skyboxOptions.Value == "Starry Evening" then
            skyPath.SkyboxBk = "rbxassetid://5260808177"
            skyPath.SkyboxDn = "rbxassetid://5260653793"
            skyPath.SkyboxFt = "rbxassetid://5260817288"
            skyPath.SkyboxLf = "rbxassetid://5260800833"
            skyPath.SkyboxRt = "rbxassetid://5260811073"
            skyPath.SkyboxUp = "rbxassetid://5260824661"
        elseif Options.skyboxOptions.Value == "Christmas" then
            skyPath.SkyboxBk = "rbxassetid://8139677359"
            skyPath.SkyboxDn = "rbxassetid://8139677253"
            skyPath.SkyboxFt = "rbxassetid://8139677111"
            skyPath.SkyboxLf = "rbxassetid://8139676988"
            skyPath.SkyboxRt = "rbxassetid://8139676842"
            skyPath.SkyboxUp = "rbxassetid://8139676647"
        elseif Options.skyboxOptions.Value == "Space" then
            skyPath.SkyboxBk = "rbxassetid://168387023"
            skyPath.SkyboxDn = "rbxassetid://168387089"
            skyPath.SkyboxFt = "rbxassetid://168387054"
            skyPath.SkyboxLf = "rbxassetid://168534432"
            skyPath.SkyboxRt = "rbxassetid://168387190"
            skyPath.SkyboxUp = "rbxassetid://168387135"
        elseif Options.skyboxOptions.Value == "Nebula" then
            skyPath.SkyboxBk = "rbxassetid://159454299"
            skyPath.SkyboxDn = "rbxassetid://159454296"
            skyPath.SkyboxFt = "rbxassetid://159454293"
            skyPath.SkyboxLf = "rbxassetid://159454286"
            skyPath.SkyboxRt = "rbxassetid://159454300"
            skyPath.SkyboxUp = "rbxassetid://159454288"
        elseif Options.skyboxOptions.Value == "Vaporwave" then
            skyPath.SkyboxBk = "rbxassetid://8631780182"
            skyPath.SkyboxDn = "rbxassetid://8631784904"
            skyPath.SkyboxFt = "rbxassetid://8631769834"
            skyPath.SkyboxLf = "rbxassetid://8631777199"
            skyPath.SkyboxRt = "rbxassetid://8631735555"
            skyPath.SkyboxUp = "rbxassetid://8631782345"
        end
    end
end)
]]

--[[
worldEffects:AddToggle("noBloom", {Text = "Disable Bloom"})
Toggles.noBloom:OnChanged(function ()
    game:GetService("Lighting").Bloom.Enabled = Toggles.noBloom.Value
end)
worldEffects:AddToggle("noRays", {Text = "Disable Sun Rays"})
Toggles.noRays:OnChanged(function ()
    game:GetService("Lighting").Rays.Enabled = Toggles.noRays.Value
end)
]]


--local colorCorrectionTabbox = miscTab:AddRightTabbox("Color Correction")
--local cc = colorCorrectionTabbox:AddTab("Color Correction")

 
local miscOptionsTabbox = miscTab:AddLeftTabbox("Misc. Options")
local miscOptions = miscOptionsTabbox:AddTab("Misc. Options")
miscOptions:AddToggle("killsound", {Text = "Hit Sound"})
miscOptions:AddDropdown("killsoundId", {Values = {"Skeet", "Neverlose", "Rust Headshot", "baimware", "OSU", "Tf2 Critical Hit", "Tf2 Pan", "Quake Hit", "1", "Bonk", "Studs Falling"}, Default = 1, Multi = false, Text = "Hit Sound ID"})
miscOptions:AddSlider("killsoundVolume", {Text = "Hit Sound Volume", Default = 1, Min = 1, Max = 10, Rounding = 0})
miscOptions:AddToggle("tracers", {Text = "Bullet Tracers"}):AddColorPicker("tracerColor", {Default = Color3.fromRGB(255,255,255)})


local rageBotTabbox = rageTab:AddLeftTabbox("Ragebot")
local rageBot = rageBotTabbox:AddTab("Ragebot")
rageBot:AddToggle("rageBot", {Text = "Enabled"})
rageBot:AddToggle("rageAutoWall",{Text = "Auto-Wall"})
rageBot:AddDropdown("priorityPart", {Values = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}, Default = 1, Multi = false, Text = "Part Priority"})


local ragebotSettings = rageBotTabbox:AddTab("Ragebot Settings")

local antiaimTabbox = rageTab:AddRightTabbox("Anti-Aim")
local antiAim = antiaimTabbox:AddTab("Anti-Aim")
antiAim:AddToggle("antiAimCheckbox", {Text = "Enabled"})
antiAim:AddToggle("hideInFloor", {Text = "Hide In Floor"})
antiAim:AddToggle("lowerArms", {Text = "Lower Arms"})
antiAim:AddToggle("tiltNeck", {Text = "Tilt Neck"})
antiAim:AddDropdown("stance",{Values = {"Off","Stand", "Crouch", "Prone"}, Default = 1, Multi = false, Text = "Fake Stance"})
antiAim:AddDropdown("aaPitch", {Values = {"Off", "Up", "Down", "Random", "Manual"}, Default = 1, Multi = false, Text = "Pitch"})
antiAim:AddDropdown("aaYaw", {Values = {"Off", "Forward", "Backward", "Right", "Left", "Spin", "Random", "Manual"}, Default = 1, Multi = false, Text = "Yaw"})
antiAim:AddSlider("aaPitchSlider", {Text = "Pitch Slider", Default = 0, Min = -85, Max = 85, Rounding = 0})
antiAim:AddSlider("aaYawSlider", {Text = "Yaw Slider", Default = 0, Min = -180, Max = 180, Rounding = 0})
antiAim:AddSlider("aaYawJitter", {Text = "Yaw Jitter", Default = 15, Min = 1, Max = 100, Rounding = 0})

local fakeLagSettings = antiaimTabbox:AddTab("Fake-Lag")

local movementTabbox = rageTab:AddRightTabbox("Movement")
local movementSettings = movementTabbox:AddTab("Movement")
movementSettings:AddToggle("nofall", {Text = "No Fall Damage"})
movementSettings:AddToggle("walkspeed", {Text = "Walkspeed"})
movementSettings:AddSlider("walkspeedValue", {Text = "Walkspeed", Default = 10, Min = 10, Max = 70, Rounding = 0})
movementSettings:AddToggle("jumpheight", {Text = "BHop"})
movementSettings:AddSlider("jumpheightValue", {Text = "BHop Height", Default = 1, Min = 1, Max = 20, Rounding = 0})

local gunModsTabbox = rageTab:AddLeftTabbox("Gun Mods")
local gunMods = gunModsTabbox:AddTab("Gun Mods")
gunMods:AddToggle("noRecoil", {Text = "No Recoil"})
gunMods:AddToggle("noScreenBob", {Text = "No Screen Bob"})
gunMods:AddToggle("noMuzzleFlash", {Text = "No Muzzle Flash"})

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
Theme:AddToggle('Watermark', { Text = 'Show Watermark', Default = true }):OnChanged(function()
    Library:SetWatermarkVisibility(Toggles.Watermark.Value);
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
    TP:Teleport(2317712696, Player)
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
Feats:AddButton("Find New Server/Re-connect", function ()
    tp()
end)


local waterMarkSettings = setsTab:AddLeftTabbox("Watermark Settings")
local waterSettings = waterMarkSettings:AddTab("Watermark Settings")
waterSettings:AddDropdown("waterMarkSettingsDrop", {Values = {"Default", "Nickname", "Latency", "Current Time", "Framerate", "Week Day"}, Default = 1, Multi = true, Text = "Watermark Settings"})
task.spawn(function()

    game:GetService("RunService").RenderStepped:Connect(function (TimeBetween)
        

    --while game:GetService('RunService').RenderStepped:Wait() do

        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local time = os.date('%I:%M:%S %p')
        local fps = math.floor(1/TimeBetween)
        local date = os.date("%A")
        local bigString = "BruhWare"
        local ping = string.format("%0.0f", LocalPlayer:GetNetworkPing()*1000)

        Options.waterMarkSettingsDrop:OnChanged(function ()

            local split = " | "
            
            for key, value in next, Options.waterMarkSettingsDrop.Value do
                --print(key, value)
        
                if key == "Default" and value == true then
                    bigString = bigString .. split .. "UID: DEV"
                elseif key == "Default" and value == false then
                    key = "Default"; value = true;
                    bigString = bigString .. split .. "UID: DEV"
                end
        
                if key == "Config Name" and value == true then
                    bigString = bigString .. split .. "ConfigName"
                end
        
                if key == "Nickname" and value == true then
                    bigString = bigString .. split .. "Hype!"
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
ThemeManager:SetFolder("BruhWare")
SaveManager:SetFolder("BruhWare/WW")
SaveManager:BuildConfigSection(setsTab)

Library:Notify("Loaded UI!");

local Players = game:GetService("Players")
local Camera = game:GetService("Workspace").CurrentCamera
local LocalPlayer = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local mouseLocation

local function clamp(a, lowerNum, higher) -- DONT REMOVE this clamp is better then roblox's because it doesnt error when its not lower or heigher
	if a > higher then
		return higher
	elseif a < lowerNum then
		return lowerNum
	else
		return a
	end
end

--game:GetService("Players").huntersundead.Data.Shuffles.Melees
--game:GetService("ReplicatedStorage").Melees
--[[
local melee = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Melees:GetChildren()) do
    --melee = v
    print(v)
    local strung = Instance.new("StringValue", game:GetService("Players").huntersundead.Data.Shuffles.Melees)
    strung.Name = tostring(v)
end
]]

function getClosestPlayer()

    mouseLocation = UserInputService:GetMouseLocation()
    local Distance = 1000
    local closestChar = nil
    local plrPos, OnScreen = nil, nil
    local plrPart = "Head" -- since arsenal isnt gay this is fine

    for i,v in next, Players:GetPlayers() do
        
        local Health = game:GetService("Players")[v.Name].NRPBS.Health.Value

        if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and Health > 0 then
            
            local noHead = game:GetService("Workspace")[v.Name].Head
            plrPos, OnScreen = Camera:worldToViewportPoint(noHead.Position)

            if OnScreen then
                local mag = (Vector2.new(mouseLocation.X, mouseLocation.Y) - Vector2.new(plrPos.X, plrPos.Y)).Magnitude

                if mag <= Distance and mag < Options.aimbotFov.Value then
                    
                    Distance = mag
                    closestChar = v

                    return closestChar, plrPart
                end
            end
        end
    end
    
end

function ESP(Player)
    
    if (Player.Name == LocalPlayer.Name) then
        return
    end

    local outlineBox = Drawing.new("Square")
    outlineBox.Visible = false
    outlineBox.Color = Color3.new(0, 0, 0)
    outlineBox.Thickness = 2
    outlineBox.Transparency = 1
    outlineBox.Filled = false

    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.new(255,255,255)
    box.Thickness = 1
    box.Transparency = 1
    box.Filled = false

    -- Healthbar Outline
    local healthOutlineBox = Drawing.new("Square")
    healthOutlineBox.Visible = false
    healthOutlineBox.Color = Color3.new(0, 0, 0)
    healthOutlineBox.Thickness = 2
    healthOutlineBox.Transparency = 1
    healthOutlineBox.Filled = false
    
    -- Healthbar
    local healthBarBox = Drawing.new("Square")
    healthBarBox.Visible = false
    healthBarBox.Color = Color3.new(255,255,255)
    healthBarBox.Thickness = 0
    healthBarBox.Transparency = 1
    healthBarBox.Filled = false
    
    -- Snaplines
    local snapLine = Drawing.new("Line")
    snapLine.Visible =  false
    snapLine.Thickness = 1
    snapLine.Color = Options.snaplineColor.Value
    
    --getClosestPlayer(Player, playerPos)
    -- Name ESP
    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Center = true
    nameText.Outline = true
    nameText.Font = 2
    nameText.Size = 13
    nameText.Color = Options.nameColor.Value
        
    -- Distance ESP
    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Center = true
    distanceText.Outline = true
    distanceText.Font = 2
    distanceText.Size = 13
    distanceText.Color = Options.distanceColor.Value

    RunService:BindToRenderStep(Player.Name .. "Esp", 1, function ()
        if Player ~= nil and Player.TeamColor ~= LocalPlayer.TeamColor then

            local Root = game:GetService("Workspace")[Player.Name].HumanoidRootPart
            local Head = game:GetService("Workspace")[Player.Name].Head

            -- game:GetService("Players")["DefyTheOdds10_0"].NRPBS.Health
            -- game:GetService("Players")["DefyTheOdds10_0"].NRPBS.MaxHealth

            --local Health = game:GetService("Workspace")[Player.Name].Humanoid.Health
            --local MaxHealth = game:GetService("Workspace")[Player.Name].Humanoid.MaxHealth
            local Health = game:GetService("Players")[Player.Name].NRPBS.Health.Value
            local MaxHealth = game:GetService("Players")[Player.Name].NRPBS.MaxHealth.Value

            distanceText.Color = Options.distanceColor.Value
            nameText.Color = Options.nameColor.Value
            snapLine.Color = Options.snaplineColor.Value
            box.Color = Options.boxColor.Value

            if Options.healthbarColor.Value == Color3.fromRGB(255,255,255) then -- might work??
                healthBarBox.Color = Color3.fromRGB(255 - 255 / (MaxHealth / Health), 255 / (MaxHealth / Health), 0)
            else
                healthBarBox.Color = Options.healthbarColor.Value
            end

            if (Player and Root and Health > 0) then

                local Cam = Camera.CFrame
                local Torso = Root.CFrame
                
                local top, top_isrendered = workspace.Camera:worldToViewportPoint(Head.Position + (Torso.UpVector * 1) + Cam.UpVector)
                local bottom, bottom_isrendered = workspace.Camera:worldToViewportPoint(Torso.Position - (Torso.UpVector * 2.5) - Cam.UpVector)
        
                local minY = math.abs(bottom.y - top.y)
                local sizeX = math.ceil(math.max(clamp(math.abs(bottom.x - top.x) * 2.5, 0, minY), minY / 2, 3))
                local sizeY = math.ceil(math.max(minY, sizeX * 0.5, 3))

                local renderDistance = math.ceil((Root.Position - Camera.CFrame.Position).magnitude) -- idk why this isnt workign lol

                if top_isrendered or bottom_isrendered then

                    local boxtop = Vector2.new(
                        math.floor(top.x * 0.5 + bottom.x * 0.5 - sizeX * 0.5),
                        math.floor(math.min(top.y, bottom.y))
                    )
    
                    local boxsize = { w = sizeX, h = sizeY }
    
                    outlineBox.Position = Vector2.new(boxtop.x, boxtop.y)
                    outlineBox.Size = Vector2.new(boxsize.w, boxsize.h)

                    box.Position = Vector2.new(boxtop.x, boxtop.y)
                    box.Size = Vector2.new(boxsize.w, boxsize.h)
                    
                    if Toggles.boxes.Value == true and renderDistance <= Options.espDistance.Value then
                        outlineBox.Visible = true
                        box.Visible = true
                    else
                        outlineBox.Visible = false
                        box.Visible = false
                    end

                    -- Healthbar
                    if Toggles.healthbar.Value == true and renderDistance <= Options.espDistance.Value then -- this shit brokey

                        local ySizeBar = -math.floor(boxsize.h * Health / MaxHealth)

                        healthOutlineBox.Position = Vector2.new(boxtop.x - 7, boxtop.y - 1)
                        healthOutlineBox.Size = Vector2.new(4, boxsize.h + 3)
                    
                        healthBarBox.Position = Vector2.new(boxtop.x - 6, boxtop.y + boxsize.h)
                        healthBarBox.Size = Vector2.new(2, ySizeBar)

                        healthBarBox.Visible = true
                        healthOutlineBox.Visible = true
                    else
                        healthOutlineBox.Visible = false
                        healthBarBox.Visible = false
                    end

                    -- Snaplines
                    if Toggles.snaplines.Value == true and renderDistance <= Options.espDistance.Value then
                        
                        local RootPosition = Camera:worldToViewportPoint(Root.Position)
                        local HeadPosition = Camera:worldToViewportPoint(Head.Position)
                        local LegPosition = Camera:worldToViewportPoint(Root.Position - Vector3.new(0,4.7,0))

                        if Options.snaplineStart.Value == "Bottom" then
                            snapLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                        elseif Options.snaplineStart.Value == "Top" then
                            snapLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y * 0)
                        elseif Options.snaplineStart.Value == "Middle" then
                            snapLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                        end
                        
                        if Options.snaplineEnd.Value == "Head" then
                            snapLine.To = Vector2.new(HeadPosition.X, HeadPosition.Y)
                        elseif Options.snaplineEnd.Value == "Torso" then
                            snapLine.To = Vector2.new(RootPosition.X, RootPosition.Y)
                        elseif Options.snaplineEnd.Value == "Legs" then
                            snapLine.To = Vector2.new(LegPosition.X, LegPosition.Y)
                        end

                        snapLine.Visible = true

                    else
                        snapLine.Visible = false
                    end

                    -- Nametags
                    if Toggles.nametags.Value == true and renderDistance <= Options.espDistance.Value then
                        nameText.Text = tostring(Player.Name)
                        nameText.Position = (Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 15)) or Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 4)))
                        nameText.Visible = true
                    else
                        nameText.Visible = false
                    end

                    if Toggles.distance.Value == true and renderDistance <= Options.espDistance.Value then

                        local dist_pos = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 1)
                        distanceText.Text = tostring("(" .. math.ceil((Root.Position - Camera.CFrame.Position).magnitude) .. ")")
                        distanceText.Position = dist_pos
                        distanceText.Visible = true

                    else
                        distanceText.Visible = false
                    end
                else
                    box.Visible = false
                    outlineBox.Visible = false
                    healthOutlineBox.Visible = false
                    healthBarBox.Visible = false
                    distanceText.Visible = false
                    snapLine.Visible = false
                    nameText.Visible = false
                end
            else
                box.Visible = false
                outlineBox.Visible = false
                healthOutlineBox.Visible = false
                healthBarBox.Visible = false
                distanceText.Visible = false
                snapLine.Visible = false
                nameText.Visible = false
            end

        else
            box.Visible = false
            outlineBox.Visible = false
            healthOutlineBox.Visible = false
            healthBarBox.Visible = false
            distanceText.Visible = false
            snapLine.Visible = false
            nameText.Visible = false
        end
    end)

    Players.ChildRemoved:Connect(function (Player)
        
        box.Visible = false
        outlineBox.Visible = false
        healthOutlineBox.Visible = false
        healthBarBox.Visible = false
        distanceText.Visible = false
        snapLine.Visible = false
        nameText.Visible = false

        RunService:UnbindFromRenderStep(Player.Name .. "Esp")
    end)
end

function Chams(Player)
    if (Player.Name == LocalPlayer.Name) then
        return
    end

    RunService:BindToRenderStep(Player.Name .. "Chams", 1, function ()
        local Health = game:GetService("Players")[Player.Name].NRPBS.Health.Value
        
        if Player ~= nil and Player.Team ~= LocalPlayer.Team and Health > 0 and Toggles.enemyChamsCheckbox.Value == true then
            for i,v in pairs(game:GetService("Workspace")[Player.Name]:GetChildren()) do
                if not v.Parent:FindFirstChild("Highlight") then
                    
                    local highlight = Instance.new("Highlight", v.Parent)
                    highlight.FillColor = Options.fillColor.Value
                    highlight.OutlineColor = Options.outlineColor.Value
                    highlight.DepthMode = 0

                    highlight.FillTransparency = Options.fillTrans.Value / 100
                    highlight.OutlineTransparency = Options.outlineTrans.Value / 100
                    highlight.Adornee = v.Parent

                    repeat wait()

                        if Toggles.enemyChamsCheckbox.Value == true then
                            highlight.Enabled = true
                        else
                            highlight.Enabled = false
                        end

                        if Toggles.enemyChamsOccluded.Value == true then
                            highlight.DepthMode = 1
                        else
                            highlight.DepthMode = 0
                        end

                        highlight.FillColor = Options.fillColor.Value
                        highlight.OutlineColor = Options.outlineColor.Value

                        highlight.FillTransparency = Options.fillTrans.Value / 100
                        highlight.OutlineTransparency = Options.outlineTrans.Value / 100

                    until Toggles.enemyChamsCheckbox.Value == false

                end
            end

        end

        task.wait(math.clamp(10 / 1000, 0, 9e9))
    end)

    Players.ChildRemoved:Connect(function (Player)

        RunService:UnbindFromRenderStep(Player.Name .. "Chams")
        
    end)
end

local function Aimbot()
    
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
    fovcircle.Color = Color3.new(255,255,255)
    fovcircle.Thickness = 1
    fovcircle.Filled = false

    RunService.RenderStepped:Connect(function ()

        fovcircle.Visible = Toggles.showAimFOV.Value
        fovcircle.Radius = Options.aimbotFov.Value

        mouseLocation = UserInputService:GetMouseLocation()
        fovcircle.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
    
        local closestParts = nil
        local closestPart = nil
        local w2sPlr = nil
        local onScreen = nil
        local smoothing = Options.aimSmoothing.Value 
        local origin = Camera.CFrame.p

        if aiming and Toggles.aimbot.Value == true and Toggles.visCheck.Value == false then

            local closestPlr, plrPart = getClosestPlayer()
            local selectedPlrPart = game:GetService("Workspace")[closestPlr.Name][plrPart]
            
            w2sPlr, onScreen = Camera:worldToViewportPoint(selectedPlrPart.Position)

            if onScreen then
                mousemoverel((w2sPlr.X - mouseLocation.X) / smoothing, (w2sPlr.Y - mouseLocation.Y) / smoothing)
            end
        end
    end)
end
coroutine.wrap(Aimbot)()

-- find part on ray with ignore list <- silent aim

for i,v in pairs(Players:GetChildren()) do
    ESP(v)
    Chams(v)
end

Players.ChildAdded:Connect(function (Player)
    ESP(Player)
    Chams(Player)
end)

Library:Notify("Loaded Exploits!");
