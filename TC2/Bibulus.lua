if not game:IsLoaded() then 
    game.Loaded:Wait()
end

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Window = Library:CreateWindow({Title = 'bibulus.club',Center = true, AutoShow = true})
local Themes = {"Default", "Skeet", "Fatality", "Onetap", "Neverlose"}

local aimTab = Window:AddTab("Aimbot")
local projAimTab = Window:AddTab("Projectile Aimbot")
local visTab = Window:AddTab("Visual")
local miscTab = Window:AddTab("Misc")
local setsTab = Window:AddTab("Settings")

local aimbotTabbox = aimTab:AddLeftTabbox("Aimbot")
local aimbot = aimbotTabbox:AddTab("Aimbot")
aimbot:AddToggle("aimbot", {Text = "Enabled"}):AddKeyPicker("aimKey", {Text = "Aimbot", Default = "MB2", Mode = "Hold"})
aimbot:AddToggle("visCheck", {Text = "Visible Check"})
aimbot:AddToggle("showAimFOV", {Text = "Show Aimbot FOV"}):AddColorPicker("aimbotFovColor", {Default = Color3.fromRGB(255,255,255)})
aimbot:AddToggle("prediction", {Text = "Target Prediction"})
aimbot:AddToggle("pingComp", {Text = "Ping Compensation"})
aimbot:AddDropdown("aimPart", {Values = {"Head", "UpperTorso", "LowerTorso", "LeftHand", "RightHand", "LeftFoot", "RightFoot", "Random"}, Default = 1, Multi = false, Text = "Aim Part"})
aimbot:AddDropdown("aimIgnore", {Values = {"Cloaked", "Friends", "Ubercharged", "Bonked"}, Default = 0, Multi = true, Text = "Ignore Targets"})
aimbot:AddSlider("aimbotFov", {Text = "Fov Radius", Default = 100, Min = 0, Max = 800, Rounding = 0})
aimbot:AddSlider("horizontalSmoothing", {Text = "Horizontal Smoothing", Default = 1, Min = 1, Max = 100, Rounding = 0, Suffix = "%"})
aimbot:AddSlider("verticalSmoothing", {Text = "Vertical Smoothing", Default = 1, Min = 1, Max = 100, Rounding = 0, Suffix = "%"})
aimbot:AddSlider("aimbotAccuracy", {Text = "Aimbot Hitchance", Default = 100, Min = 1, Max = 100, Rounding = 0, Suffix = "%"})

local silentaimTabbox = aimTab:AddRightTabbox("Silent Aimbot")
local silentAim = silentaimTabbox:AddTab("Silent Aimbot")
silentAim:AddToggle("silentAim", {Text = "Enabled"})
silentAim:AddToggle("visCheckSilent", {Text = "Visible Check"})
silentAim:AddToggle("showSilentFOV", {Text = "Show Silent FOV"}):AddColorPicker("silentFovColor", {Default = Color3.fromRGB(255,255,255)})
silentAim:AddDropdown("aimPartSilent", {Values = {"Head", "UpperTorso", "LowerTorso", "LeftHand", "RightHand", "LeftFoot", "RightFoot", "Random"}, Default = 1, Multi = false, Text = "Aim Part"})
silentAim:AddDropdown("aimIgnore", {Values = {"Cloaked", "Friends", "Ubercharged", "Bonked"}, Default = 0, Multi = true, Text = "Ignore Targets"})
silentAim:AddSlider("silentFov", {Text = "Fov Radius", Default = 100, Min = 0, Max = 800, Rounding = 0})
silentAim:AddSlider("silentAccuracy", {Text = "Silent Aimbot Hitchance", Default = 100, Min = 1, Max = 100, Rounding = 0, Suffix = "%"})

local aimbotTargetingTabbox = aimTab:AddRightTabbox("Targeting")
local targeting = aimbotTargetingTabbox:AddTab("Targeting")
targeting:AddToggle("autoScope", {Text = "Auto Scope"})
targeting:AddToggle("autoRev", {Text = "Rev Minigun When Active"})
targeting:AddToggle("waitHeadshot", {Text = "Wait for Headshot"})
targeting:AddToggle("waitForCharge", {Text = "Wait for Charge"})

local meleeTabbox = aimTab:AddRightTabbox("Melee")
local melee = meleeTabbox:AddTab("Melee")
melee:AddToggle("enableMelee", {Text = "Enable"})
melee:AddSlider("meleeDistance", {Text = "Maximum Melee Target Distance", Default = 5, Min = 5, Max = 7.8, Rounding = 1})

local projAimbotTabbox = projAimTab:AddLeftTabbox("Proj. Aimbot")
local projAim = projAimbotTabbox:AddTab("Proj. Aimbot")
projAim:AddLabel("Coming soon :)")


local espTabbox = visTab:AddLeftTabbox("ESP")
local esp = espTabbox:AddTab("ESP")
esp:AddToggle("boxes", {Text = "Bounding Box"}):AddColorPicker("boxColor", {Default = Color3.fromRGB(255,255,255)}):AddColorPicker("visBoxColor", {Default = Color3.fromRGB(255,0,0)})
esp:AddToggle("nametags", {Text = "Name"}):AddColorPicker("nameColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("distance", {Text = "Distance"}):AddColorPicker("distanceColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("healthbar", {Text = "Health Bar"}):AddColorPicker("healthbarColor", {Default = Color3.fromRGB(255,255,255)})
esp:AddToggle("agent", {Text = "Agent"}):AddColorPicker("agentColor", {Default = Color3.fromRGB(255,255,255)})

local espSettings = espTabbox:AddTab("ESP Settings") -- might not need this idk

local localPlayer = visTab:AddRightTabbox("Local Player")
local localChams = localPlayer:AddTab("Local Player")
localChams:AddToggle("armChams", {Text = "Arm Chams"}):AddColorPicker("armColor", {Default = Color3.fromRGB(255,255,255)})
localChams:AddToggle("gunChams", {Text = "Gun Chams"}):AddColorPicker("gunColor", {Default = Color3.fromRGB(255,255,255)})
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

local worldEffectsTabbox = visTab:AddLeftTabbox("World Effects")
local worldEffects = worldEffectsTabbox:AddTab("World Effects")
worldEffects:AddToggle("thirdPerson", {Text = "Third Person"}):AddKeyPicker("tpKey", {Text = "Third Person", Default = "N", Mode = "Toggle"})
worldEffects:AddToggle("customSkybox", {Text = "Custom Skybox"})
worldEffects:AddDropdown("skyboxOptions", {Values = {"Starry Evening", "Christmas", "Space", "Nebula", "Vaporwave"}, Default = 1, Multi = false, Text = "Skybox Options"})

local colorSettings = worldEffectsTabbox:AddTab("Color Settings")
colorSettings:AddToggle("clr_correction", {Text = "Color Correction"}):AddColorPicker("clrCorrct", {Default = Color3.fromRGB(255,255,255) })
colorSettings:AddSlider("brightness", { Text = "Brightness", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
colorSettings:AddSlider("contrast", { Text = "Contrast", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
colorSettings:AddSlider("saturation", { Text = "Saturation", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
colorSettings:AddToggle("bloom", {Text = "Bloom"})
colorSettings:AddSlider("bloom_intensity", { Text = "Intensity", Default = 0, Min = 0, Max = 40, Rounding = 0})
colorSettings:AddSlider("bloom_size", { Text = "Size", Default = 0, Min = 0, Max = 56, Rounding = 0})
colorSettings:AddSlider("bloom_threshold", { Text = "Threshold", Default = 0, Min = 0, Max = 40, Rounding = 0})

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
    Options.MainColor:SetValueRGB(Color3.fromRGB(30, 47, 65));
    Options.BackgroundColor:SetValueRGB(Color3.fromRGB(30, 47, 65));
    Options.AccentColor:SetValueRGB(Color3.fromRGB(56, 178, 143));
    Options.OutlineColor:SetValueRGB(Color3.fromRGB(60, 125, 137));
    Toggles.Rainbow:SetValue(false);

    UpdateTheme();
end;

-- Background Color 30, 47, 65
-- Main Color 30, 47, 65
-- Accent Color 56, 178, 143
-- Font Color 255, 255, 255
-- Outline Color 60, 125, 137

local Theme = setsTab:AddLeftGroupbox('Theme'); 
Theme:AddLabel('Background Color'):AddColorPicker('BackgroundColor', { Default = Color3.fromRGB(30, 47, 65) });
Theme:AddLabel('Main Color'):AddColorPicker('MainColor', { Default = Color3.fromRGB(30, 47, 65)});
Theme:AddLabel('Accent Color'):AddColorPicker('AccentColor', { Default = Color3.fromRGB(56, 178, 143) });
Theme:AddLabel('Font Color'):AddColorPicker('FontColor', { Default = Color3.fromRGB(255, 255, 255) });
Theme:AddLabel('Outline Color'):AddColorPicker('OutlineColor', { Default = Color3.fromRGB(60, 125, 137) });
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
        Options.MainColor:SetValueRGB(Color3.fromRGB(30, 47, 65));
        Options.BackgroundColor:SetValueRGB(Color3.fromRGB(30, 47, 65));
        Options.AccentColor:SetValueRGB(Color3.fromRGB(56, 178, 143));
        Options.OutlineColor:SetValueRGB(Color3.fromRGB(60, 125, 137));
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
    TP:Teleport(328028363, Player)
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

-- you can totally remove the watermark settings if you want to I just thought it was something cool to include.
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
        local bigString = "bibulus.club"
        local ping = string.format("%0.0f", LocalPlayer:GetNetworkPing()*1000)

        Options.waterMarkSettingsDrop:OnChanged(function ()

            local split = " | "
            
            for key, value in next, Options.waterMarkSettingsDrop.Value do
                --print(key, value)
        
                if key == "Default" and value == true then
                    bigString = "bibulus.club" .. bigString
                elseif key == "Default" and value == false then
                    key = "Default"; value = true;
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
ThemeManager:SetFolder("bibulus.club")
SaveManager:SetFolder("bibulus.club/tc2")
SaveManager:BuildConfigSection(setsTab)

Library:Notify("Loaded UI!");

function Bypass() -- Im only doing this to organize shit btw

    local die
for i,v in pairs(getnilinstances()) do
if v.Name == "Event" then
die = v
end
end

_G.executed = false

local mt = getrawmetatable(game)
setreadonly(mt, false)
local namecall = mt.__namecall

if _G.executed == false then
mt.__namecall = newcclosure(function(self,...)
    local args = {...}
    local method = getnamecallmethod()
    if self == die then
        return
    end
    if self.Name == "BeanBoozled" then
        return true
    end
    return namecall(self,...)
end)
end

print("Ban Bypass Loaded!")
_G.executed = true


end

Bypass()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local filter = Instance.new("ColorCorrectionEffect", game:GetService("Lighting"))
local bloom = Instance.new("BloomEffect", game:GetService("Lighting"))
local skyPath = game:GetService("Lighting").Sky

local GetPlayers = Players.GetPlayers
local WorldToScreen = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild
local GetMouseLocation = UserInputService.GetMouseLocation
local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget

local ExpectedArguments = {
    Raycast = {ArgCountRequired = 3,Args = {"Instance", "Vector3", "Vector3", "RaycastParams"}}
}

Toggles.customSkybox:OnChanged(function ()
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

Options.skyboxOptions:OnChanged(function ()
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

local function clamp(a, lowerNum, higher) -- thank you bbot for own clamp feature
	if a > higher then
		return higher
	elseif a < lowerNum then
		return lowerNum
	else
		return a
	end
end

function calcHitChance(Percentage)
    -- // Floor the percentage
    Percentage = math.floor(Percentage)

    -- // Get the chance
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100

    -- // Return
    return chance <= Percentage / 100
end

local function IsPlayerVisible(Player)
    local PlayerCharacter = Player.Character
    local LocalPlayerCharacter = LocalPlayer.Character
    
    if not (PlayerCharacter or LocalPlayerCharacter) then return end 
    
    local PlayerRoot = FindFirstChild(PlayerCharacter, "Head") or FindFirstChild(PlayerCharacter, "UpperTorso")
    
    if not PlayerRoot then return end 
    
    local CastPoints, IgnoreList = {PlayerRoot.Position, LocalPlayerCharacter, PlayerCharacter}, {LocalPlayerCharacter, PlayerCharacter}, {LocalPlayerCharacter, Highlight}
    local ObscuringObjects = #GetPartsObscuringTarget(Camera, CastPoints, IgnoreList)
    
    return ((ObscuringObjects == 0 and true) or (ObscuringObjects > 0 and false))
end

function getClosestPlayer()

    mouseLocation = UserInputService:GetMouseLocation()
    
    local Distance = 1000
    local closestChar = nil
    local plr_pos, OnScreen = nil, nil
    local plrPart = Options.aimPart.Value
    local chance = calcHitChance(Options.aimbotAccuracy.Value)
    local partsList = {"Head", "UpperTorso", "LowerTorso", "LeftHand", "RightHand", "LeftFoot", "RightFoot"}
    local fovValue = nil

    if plrPart == "Random" then
        plrPart = partsList[math.random(1, #partsList)]
    end

    for i,v in next, Players:GetPlayers() do
        
        local base = workspace[v.Name] -- this works
        local Head = base.Head
        local Health = base.Humanoid.Health
        local MaxHealth = base.Humanoid.MaxHealth
        local Root = base.HumanoidRootPart

        if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and Health > 0 and chance and base ~= nil and base[plrPart] ~= nil then -- should fix the eror here idk though

            plr_pos, OnScreen = Camera:worldToViewportPoint(base[plrPart].Position)

            if OnScreen then

                local mag = (Vector2.new(mouseLocation.X, mouseLocation.Y) - Vector2.new(plr_pos.X, plr_pos.Y)).Magnitude
                
                fovValue = Options.aimbotFov.Value

                if mag <= Distance and mag <= fovValue then
                    
                    Distance = mag
                    closestChar = v
                    target = v

                    return closestChar, plrPart, plr_pos
                end
            
            end
        end
    end

end

function Visuals(Player)

    if (Player == LocalPlayer) then
        return
    end

    -- Bounding Boxes
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
    healthOutlineBox.Filled = true
    
    -- Healthbar
    local healthBarBox = Drawing.new("Square")
    healthBarBox.Visible = false
    healthBarBox.Color = Color3.new(255,255,255)
    healthBarBox.Thickness = 0
    healthBarBox.Transparency = 1
    healthBarBox.Filled = true
    
    -- Snaplines
    local snapLine = Drawing.new("Line")
    snapLine.Visible =  false
    snapLine.Thickness = 1
    snapLine.Color = Color3.new(255,255,255)
    
    -- Name ESP
    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Center = true
    nameText.Outline = true
    nameText.Font = 2
    nameText.Size = 13
    nameText.Color = Color3.new(255,255,255)
        
    -- Distance ESP
    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Center = true
    distanceText.Outline = true
    distanceText.Font = 2
    distanceText.Size = 13
    distanceText.Color = Color3.new(255,255,255)

    -- Class ESP
    local classText = Drawing.new("Text")
    classText.Visible = false
    classText.Center = true
    classText.Outline = true
    classText.Font = 2
    classText.Size = 13
    classText.Color = Color3.new(255,255,255)

    RunService:BindToRenderStep(Player.Name .. "Esp", 1, function()

        if Player ~= nil and Player.Team ~= LocalPlayer.Team then

            local plrClass = Player.Status.Class.Value
            local base = workspace[Player.Name] -- this works
            local Head = base.Head
            local Health = base.Humanoid.Health
            local MaxHealth = base.Humanoid.MaxHealth
            local Root = base.HumanoidRootPart
                
            if Options.healthbarColor.Value == Color3.fromRGB(255,255,255) then -- might work??
                healthBarBox.Color = Color3.fromRGB(255 - 255 / (MaxHealth / Health), 255 / (MaxHealth / Health), 0)
            else
                healthBarBox.Color = Options.healthbarColor.Value
            end
            
            classText.Color = Options.agentColor.Value
            distanceText.Color = Options.distanceColor.Value
            nameText.Color = Options.nameColor.Value


            if (base and Head and Root and Health > 0) then
                
                local Cam = Camera.CFrame
                local Torso = Root.CFrame

                local top, top_isrendered = workspace.Camera:worldToViewportPoint(Head.Position + (Torso.UpVector * 1) + Cam.UpVector)
                local bottom, bottom_isrendered = workspace.Camera:worldToViewportPoint(Torso.Position - (Torso.UpVector * 2.5) - Cam.UpVector)
        
                local minY = math.abs(bottom.y - top.y)
                local sizeX = math.ceil(math.max(clamp(math.abs(bottom.x - top.x) * 2.5, 0, minY), minY / 2, 3))
                local sizeY = math.ceil(math.max(minY, sizeX * 0.5, 3))

                local visible = IsPlayerVisible(Player)

                if visible then
                    box.Color = Options.visBoxColor.Value
                else
                    box.Color = Options.boxColor.Value
                end
                
                if top_isrendered or bottom_isrendered then
        
                    local boxtop = Vector2.new(
                        math.floor(top.x * 0.5 + bottom.x * 0.5 - sizeX * 0.5),
                        math.floor(math.min(top.y, bottom.y))
                    )
    
                    local boxsize = { w = sizeX, h = sizeY }
    
                    -- Boxes
                    outlineBox.Position = Vector2.new(boxtop.x, boxtop.y)
                    outlineBox.Size = Vector2.new(boxsize.w, boxsize.h)
    
                    box.Position = Vector2.new(boxtop.x, boxtop.y)
                    box.Size = Vector2.new(boxsize.w, boxsize.h)
    
                    -- Boxes
                    if Toggles.boxes.Value then
                        box.Visible = true
                        outlineBox.Visible = true
                    else
                        box.Visible = false
                        outlineBox.Visible = false
                    end

                    -- Health Bar
                    if Toggles.healthbar.Value then

                        local ySizeBar = -math.floor(boxsize.h * Health / MaxHealth)
                        healthOutlineBox.Position = Vector2.new(boxtop.x - 7, boxtop.y - 1)
                        healthOutlineBox.Size = Vector2.new(4, boxsize.h + 3)

                        healthBarBox.Position = Vector2.new(boxtop.x - 6, boxtop.y + boxsize.h)
                        healthBarBox.Size = Vector2.new(2, ySizeBar)

                        healthBarBox.Visible = true
                        healthOutlineBox.Visible = true
                    else
                        healthBarBox.Visible = false
                        healthOutlineBox.Visible = false
                    end

                    -- Distance
                    if Toggles.distance.Value then
                        local dist_pos = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 1)
                        distanceText.Text = tostring("(" .. math.ceil((Root.Position - Camera.CFrame.Position).magnitude) .. ")")
                        distanceText.Position = dist_pos
                        distanceText.Visible = true
                    else
                        distanceText.Visible = false
                    end

                    -- Name
                    if Toggles.nametags.Value then
                        nameText.Text = tostring(Player.Name)
                        nameText.Position = (Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 15)) or Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 4)))
                        nameText.Visible = true
                    else
                        nameText.Visible = false
                    end

                    -- Class
                    if Toggles.agent.Value then
                        classText.Text = tostring(plrClass)

                        if Toggles.distance.Value then
                            classText.Position = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 15)
                        else
                            classText.Position = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 1)
                        end

                        classText.Visible = true
                    else
                        classText.Visible = false
                    end

                else
                    healthBarBox.Visible = false
                    healthOutlineBox.Visible = false
                    box.Visible = false
                    outlineBox.Visible = false
                    distanceText.Visible = false
                    nameText.Visible = false
                    classText.Visible = false
                end

                -- Chams
                if not base:FindFirstChild("Highlight") then
                    
                    local highlight = Instance.new("Highlight", base)
                    highlight.FillColor = Options.fillColor.Value
                    highlight.OutlineColor = Options.outlineColor.Value
                    highlight.DepthMode = 0

                    highlight.FillTransparency = Options.fillTrans.Value / 100
                    highlight.OutlineTransparency = Options.outlineTrans.Value / 100
                    --highlight.Adornee = Base
                end

                if base:FindFirstChild("Highlight") then

                    base.Highlight.FillColor = Options.fillColor.Value
                    base.Highlight.OutlineColor = Options.outlineColor.Value
                    base.Highlight.FillTransparency = Options.fillTrans.Value / 100
                    base.Highlight.OutlineTransparency = Options.outlineTrans.Value / 100

                    if Toggles.enemyChamsCheckbox.Value == true then
                        base.Highlight.Enabled = true
                    else
                        base.Highlight.Enabled = false
                    end

                    if Toggles.enemyChamsOccluded.Value == true then
                        base.Highlight.DepthMode = 1
                    else
                        base.Highlight.DepthMode = 0
                    end


                end

            else
                healthBarBox.Visible = false
                healthOutlineBox.Visible = false
                box.Visible = false
                outlineBox.Visible = false
                distanceText.Visible = false
                nameText.Visible = false
                classText.Visible = false
            end
        else
            healthBarBox.Visible = false
            healthOutlineBox.Visible = false
            box.Visible = false
            outlineBox.Visible = false
            distanceText.Visible = false
            nameText.Visible = false
            classText.Visible = false

            local base = workspace[Player.Name] -- this works

            if base:FindFirstChild("Highlight") then -- uhhh this should remove friendlies highlights because idk
                base.Highlight:Destroy()
            end
            
        end
    end)

    Players.PlayerRemoving:Connect(function (Player) -- should remove the players info after they have left the server I only do it here because it allows me to remove the drawings before they leave

        box.Visible = false
        outlineBox.Visible = false
        healthBarBox.Visible = false
        healthOutlineBox.Visible = false
        distanceText.Visible = false
        nameText.Visible = false
        classText.Visible = false

        RunService:UnbindFromRenderStep(Player.Name .. "Esp")
    end)
end

for i,v in pairs(Players:GetPlayers()) do
    Visuals(v)
end

Players.PlayerAdded:Connect(function(Player)
    Visuals(Player)
end)

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
    fovcircle.Color = Color3.new(255,255,255)
    fovcircle.Thickness = 1
    fovcircle.Filled = false

    local silentFovCircle = Drawing.new("Circle")
    silentFovCircle.Visible = false
    silentFovCircle.Radius = Options.silentFov.Value
    silentFovCircle.Color = Options.silentFovColor.Value
    silentFovCircle.Thickness = 1
    silentFovCircle.Filled = false

    RunService.RenderStepped:Connect(function ()

        local mouseLocation = UserInputService:GetMouseLocation()
        fovcircle.Visible = Toggles.showAimFOV.Value
        fovcircle.Radius = Options.aimbotFov.Value

        fovcircle.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
        fovcircle.Color = Options.aimbotFovColor.Value

        silentFovCircle.Visible = Toggles.showSilentFOV.Value
        silentFovCircle.Radius = Options.silentFov.Value
        silentFovCircle.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
        silentFovCircle.Color = Options.silentFovColor.Value
        
        local horizontal = Options.horizontalSmoothing.Value
        local vertical = Options.verticalSmoothing.Value

        if aiming and Toggles.aimbot.Value == true then
            
            local closestPlr, plrPart, plrPos = getClosestPlayer()
            local visible = IsPlayerVisible(closestPlr)
            --local visible = client:IsVisible(closestPlr, plrPart)

            if Toggles.visCheck.Value then
                if plrPos ~= nil and plrPart ~= nil and visible then
                    mousemoverel( (plrPos.X - mouseLocation.X) / horizontal, (plrPos.Y - mouseLocation.Y) / vertical)
                end
            else
                if plrPos ~= nil and plrPart ~= nil then
                    mousemoverel( (plrPos.X - mouseLocation.X) / horizontal, (plrPos.Y - mouseLocation.Y) / vertical)
                end
            end


        end

        filter.Brightness = Options.brightness.Value / 100
        filter.Contrast = Options.contrast.Value / 100
        filter.Saturation = Options.saturation.Value / 100
        filter.TintColor = Options.clrCorrct.Value

        bloom.Intensity = Options.bloom_intensity.Value / 100
        bloom.Size = Options.bloom_size.Value
        bloom.Threshold = Options.bloom_threshold.Value

        if Toggles.clr_correction.Value == true then
            filter.Enabled = true
        else
            filter.Enabled = false
        end

        if Toggles.bloom.Value == true then
            bloom.Enabled = true
        else
            bloom.Enabled = false
        end



    end)
end

local function getPositionOnScreen(Vector)
    local Vec3, OnScreen = WorldToScreen(Camera, Vector)
    return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then
        return false
    end
    for Pos, Argument in next, Args do
        if typeof(Argument) == RayMethod.Args[Pos] then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
    return (Position - Origin).Unit * 1000
end

local function getMousePosition()
    return GetMouseLocation(UserInputService)
end

local function getClosestPlayerSilent()

    local Closest
    local DistanceToMouse
    for _, Player in next, GetPlayers(Players) do
        if Player == LocalPlayer then continue end
        if Player.Team == LocalPlayer.Team then continue end

        local Character = Player.Character
        if not Character then continue end

        local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
        local Humanoid = FindFirstChild(Character, "Humanoid")
        local visible = IsPlayerVisible(Player)
        if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 then continue end

        local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)
        if not OnScreen then continue end

        local Distance = (getMousePosition() - ScreenPosition).Magnitude

        if Toggles.visCheckSilent.Value then
            if visible then
                if Distance <= (DistanceToMouse or Options.silentFov.Value) then
                    Closest = (Character[Options.aimPartSilent.Value]) -- change "Head" to any other body part
                    DistanceToMouse = Distance
                end
            end
        else
            if Distance <= (DistanceToMouse or Options.silentFov.Value) then
                Closest = (Character[Options.aimPartSilent.Value]) -- change "Head" to any other body part
                DistanceToMouse = Distance
            end
        end

    end
    return Closest
end

function silentAim()
    local Old
    Old = hookmetamethod(game, "__namecall", newcclosure(function(...)

    local Method = getnamecallmethod()
    local Arguments = {...}
    local self = Arguments[1]
    local chance = calcHitChance(Options.silentAccuracy.Value)

    if self == workspace and not checkcaller() and Toggles.silentAim.Value and chance then
        if Method == "Raycast" then
            if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
                local A_Origin = Arguments[2]

                local HitPart = getClosestPlayerSilent()

                if HitPart then
                    Arguments[3] = getDirection(A_Origin, HitPart.Position)

                    return Old(unpack(Arguments))
                end
            end
        end
    end
    return Old(...)
end))
end

Aimbot()
silentAim() -- comment this out if you want to disable silent aim

Library:Notify("Loaded Menu Features!");
