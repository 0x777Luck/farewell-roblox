
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")

-- entity shit
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer 
local dwRunService = game:GetService("RunService")

local dwCamera = workspace.CurrentCamera
local dwRunService = game:GetService("RunService")
local dwUIS = game:GetService("UserInputService")
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer
local dwMouse = dwLocalPlayer:GetMouse()

local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local loadoutSlotSelection = 1
local mapSlotSelection = 1
local Teleport = false
local TPx = 0
local TPy = 0
local TPz = 0
local pSilent = false
local mt = getrawmetatable(game)
local namecall = mt.__namecall
local showPlrInfo = true

local plrAmmo = Drawing.new("Text")
local plrHealth = Drawing.new("Text")
local watermark = Drawing.new("Text")

local HeadOff = Vector3.new(0, 0.5, 0)
local LegOff = Vector3.new(0,3,0)
--local osTime = os.date("%c")
local startTime = os.date("%c")
local frames = 0

-- New UI Lib New Features ;)

local Config = {
    WindowName = " Jailbird.gg | " .. " " .. startTime,
	Color = Color3.fromRGB(133,36,96),
	Keybind = Enum.KeyCode.RightBracket,
    TlprtKeybind = Enum.KeyCode.J,
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Visuals")
local Tab2 = Window:CreateTab("Aimbot")
local Tab3 = Window:CreateTab("Customization")
local Tab5 = Window:CreateTab("Misc.")

local Tab4 = Window:CreateTab("Settings")

local Section1 = Tab1:CreateSection("ESP")
local Section2 = Tab1:CreateSection("ESP Settings")
local Section6 = Tab1:CreateSection("Chams")
local Section8 = Tab1:CreateSection("Crosshair")
-- local Section3 = Tab1:CreateSection("Chams")

local SectionV1 = Tab2:CreateSection("Aimbot")
local SectionV3 = Tab2:CreateSection("Aim Part")
local SectionV4 = Tab2:CreateSection("FOV")
local SectionV5 = Tab2:CreateSection("(P)Silent Aim")

local SectionVV2 = Tab3:CreateSection("Skin Changer")
local SectionVV3 = Tab3:CreateSection("Gun Mods")
local SectionVV4 = Tab3:CreateSection("Character/Gun Customizer")

local SectionMM1 = Tab5:CreateSection("Map stuff")
local SectionMM2 = Tab5:CreateSection("Player Mods")
local SectionMM3 = Tab5:CreateSection("Chat Spammer")
local sectionMM4 = Tab5:CreateSection("Teleports")

local Section3 = Tab4:CreateSection("Menu")
local Section4 = Tab4:CreateSection("Background")
local Section5 = Tab4:CreateSection("Config")
local Section7 = Tab4:CreateSection("Credits")

local espsettings = {
    BoxColor = Color3.fromRGB(255,255,255),
    BoxVisible = false,
    BoxThickness = 1,
    BoxTransparency = 1,
    BoxFilled = false,
    TeamCheck = true,
    BoxOutlineVisible = false,
    BoxOutline = true,
    BoxOutlineFilled = true,
    BoxOutlineColor = Color3.fromRGB(0,0,0),
    BoxOutlineTransparency = 0,
    BoxOutlineChecked = true,
    HeadDotColor = Color3.fromRGB(255,255,255),
    ESPBool = false,
    HeadDot = false,
    NameESP = false,
    DistanceESP = false,
    SnaplinesESP = false,
    SnaplinePos = "Head",
    SnaplineColor = Color3.fromRGB(255,255,255),
    Healthbar = false
}

local chamsettings = {
    Enabled = false,
    OnTop = false,
    Color = Color3.fromRGB(255,255,255),
    BoxTransparency = 0.5,
    PlayerTransparency = 0.5
}

local aimbotsettings = {
    Aimbot = false,
    Aiming = false,
    Aimbot_AimPart = "Head",
    Aimbot_TeamCheck = false,
    Aimbot_Draw_FOV = false,
    Aimbot_FOV_Radius = 250,
    Aimbot_FOV_Color = Color3.fromRGB(255,255,255),
    Aimbotkey = false,
    Triggerbot = false,
    AimKey = Enum.KeyCode.X
}

local textsettings = {
    NamePos = "Bottom",
    DistPos = "Bottom",
    NameColor = Color3.fromRGB(255,255,255),
    DistColor = Color3.fromRGB(255,255,255)
}

local skinChanger = {
    loadoutSelection = "Loadout1",
    SelectedPrimSkin = "Default",
    SelectedSecSkin = "Default"
}

local gunMods = {
    PrimaryGun = "M4A1",
    FireRate = 900,
    GunFOVRedux = 5.5,
    BreachDoor = false,
    Break = false,
    Bullets = 1,
    RecoilStepAmmt = 0,
    Ammo = 30,
    VBase = 0,
    HBase = 0,
    DBase = 0,
    BulletPen = 75,
    gunCust = false
}

local characterSetts = {
    CharacterColor = Color3.fromRGB(255,255,255),
    GunColor = Color3.fromRGB(255,255,255),
    PlayerMaterial = "SmoothPlastic",
    GunMaterial = "SmoothPlastic",
    CharacterCustomization = false,
    GunCustomization = false,
    FOV = 70
}

local rainbowColor = {
    rainbow = Color3.fromRGB(255,255,255),
    rainbowBool = false
}

local mapSetts = {
    CurrentMap = "Gas Station",
    Transparency = 0,
    Collide = true,
    Enabled = false,
    InGame = false
}

local playerMods = {
    Speed = 10,
    Height = 10,
}

local crosshairSettings = {
    Toggled = false,    
    Color = Color3.fromRGB(255,255,255),
    Length = 1,
    Thickness = 1,
    Transparency = 1
}

local words = {
    'ur bad',
    'beamed by Jailbird.gg',
    'actual free-lo',
    'Federal is my bbg',
    'Ban me? I got more accounts 😈',
    'Pushin 🅿 with Jailbird.gg',
    'Say GG',
    'jUsT kIcK hIm',
    'Im getting used to the ban screen',
    'You guys think reporting me will do anything?',
    'Skill Issue',
    'There appears to be a skill issue',
    ''
}

local BoxTransparencyValue = 0.0
local PlayerModBool = false

------------- Visuals

local Name = "JailbirdGG.JSON"

local DefaultSettings = {
Aimbot = false,
AimPart = "Head",
AimbotTeamcheck = true,
AimbotFOVRadius = 250,
AimbotShowFOV = false,
AimbotKey = false,
ESP = false,
ESPTeamcheck = true,
ESPNames = false,
ESPDist = false,
BoxColor = "",
BoxOutlineColor = "",
BoxOutlineTransparency = 0,
BoxTransparency = 1,
HeadDot = false,
CharCustomization = false,
GunCustomization = false,
PlayerFOV = 70,
CharColor = "",
GunColor = "",
PlayerMat = "SmoothPlastic",
GunMat = "SmoothPlastic",
BAOT = 1,
FireRate = 900,
AmmoAmmt = 30,
BulletPen = 75,
PlrSpeed = 10,
PlrHeight = 10,
PlrModEnable = false,
gunCust = false,
PrimCamo = "",
SecCamo = "",
LoadoutNum = "Loadout 1",
ChamEnabled = false,
ChamOnTop = false,
ChamColor = Color3.fromRGB(255,255,255),
ChamBoxTransparency = 0.5,
ChamPlayerTransparency = 0.5,
ESPNameColor = Color3.fromRGB(255,255,255),
ESPDistColor = Color3.fromRGB(255,255,255)
}

local Settings

local Toggle1Box = Section1:CreateToggle("Boxes", nil, function (bool)

    espsettings.ESPBool = bool

  for i,v in pairs(game.Players:GetChildren()) do
   local BoxOutline = Drawing.new("Square")
   local Box = Drawing.new("Square")
   
   local HealthBarOutline = Drawing.new("Square")
   local HealthBar = Drawing.new("Square")

   function boxesp()

      game:GetService("RunService").RenderStepped:Connect(function()
         if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
            local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

            local RootPart = v.Character.HumanoidRootPart
            local Head = v.Character.Head
            local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)   
            local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
            local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

            if onScreen and espsettings.ESPBool == true then

                Box.Visible = false
                Box.Color = espsettings.BoxColor
                Box.Thickness = 1
                Box.Transparency = espsettings.BoxTransparency
                Box.Filled = espsettings.BoxFilled
    
                BoxOutline.Visible = false
                BoxOutline.Color = espsettings.BoxOutlineColor -- Box Inner color
                BoxOutline.Thickness = 3
                BoxOutline.Transparency = espsettings.BoxOutlineTransparency
                BoxOutline.Filled = espsettings.BoxOutlineFilled
                
                BoxOutline.Size = Vector2.new(1700 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                --BoxOutline.Visible = true

               Box.Size = Vector2.new(1700 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
               Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
               --Box.Visible = true

               if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                  BoxOutline.Visible = false
                  Box.Visible = false
              else
                  BoxOutline.Visible = true
                  Box.Visible = true
              end
            else
                BoxOutline.Visible = false
                Box.Visible = false
            end

         else
            BoxOutline.Visible = false
            Box.Visible = false
         end

      end)
   end
   coroutine.wrap(boxesp)()

   function Healthbar()

    game:GetService("RunService").RenderStepped:Connect(function()
        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
            local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

            local RootPart = v.Character.HumanoidRootPart
            local Head = v.Character.Head
            local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)   
            local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
            local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

            if onScreen and espsettings.Healthbar == true then

                HealthBarOutline.Thickness = 3
                HealthBarOutline.Filled = false
                HealthBarOutline.Color = Color3.new(0,0,0)
                HealthBarOutline.Transparency = 1
                HealthBarOutline.Visible = false
            
                HealthBar.Thickness = 1
                HealthBar.Filled = false
                HealthBar.Transparency = 1
                HealthBar.Visible = false
            
                HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                HealthBarOutline.Visible = false
            
                HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (workspace[v.Character.Name].Humanoid.MaxHealth / math.clamp(workspace[v.Character.Name].Humanoid.Health, 0, workspace[v.Character.Name].Humanoid.MaxHealth)))
                HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                HealthBar.Color = Color3.fromRGB(255 - 255 / (workspace[v.Character.Name].Humanoid.MaxHealth / workspace[v.Character.Name].Humanoid.Health), 255 / (workspace[v.Character.Name].Humanoid.MaxHealth / workspace[v.Character.Name].Humanoid.Health), 0)
                HealthBar.Visible = false


                if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                    HealthBar.Visible = false
                    HealthBarOutline.Visible = false
                else
                    HealthBar.Visible = true
                    HealthBarOutline.Visible = true
                end
            else
                HealthBar.Visible = false
                HealthBarOutline.Visible = false
            end
        else
            HealthBar.Visible = false
            HealthBarOutline.Visible = false
        end
    
     end)
   end
   coroutine.wrap(Healthbar)()

   if (espsettings.ESPBool == false) then
       BoxOutline:Remove()
       Box:Remove()
   end

end

--#region Updater Shit
game.Players.PlayerAdded:Connect(function(v)

    local BoxOutline = Drawing.new("Square")
    local Box = Drawing.new("Square")
    
    local HealthBarOutline = Drawing.new("Square")
    local HealthBar = Drawing.new("Square")
 
    function boxesp()
 
       game:GetService("RunService").RenderStepped:Connect(function()
          if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
             local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
 
             local RootPart = v.Character.HumanoidRootPart
             local Head = v.Character.Head
             local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)   
             local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
             local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
 
             if onScreen and espsettings.ESPBool == true then
 
                 Box.Visible = false
                 Box.Color = espsettings.BoxColor
                 Box.Thickness = 1
                 Box.Transparency = espsettings.BoxTransparency
                 Box.Filled = espsettings.BoxFilled
     
                 BoxOutline.Visible = false
                 BoxOutline.Color = espsettings.BoxOutlineColor -- Box Inner color
                 BoxOutline.Thickness = 3
                 BoxOutline.Transparency = espsettings.BoxOutlineTransparency
                 BoxOutline.Filled = espsettings.BoxOutlineFilled
                 
                 BoxOutline.Size = Vector2.new(1700 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                 BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                 --BoxOutline.Visible = true
 
                Box.Size = Vector2.new(1700 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                --Box.Visible = true
 
                if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                   BoxOutline.Visible = false
                   Box.Visible = false
               else
                   BoxOutline.Visible = true
                   Box.Visible = true
               end
             else
                 BoxOutline.Visible = false
                 Box.Visible = false
             end
 
          else
             BoxOutline.Visible = false
             Box.Visible = false
          end
 
       end)
    end
    coroutine.wrap(boxesp)()
 
    function Healthbar()
 
     game:GetService("RunService").RenderStepped:Connect(function()
         if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
             local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
 
             local RootPart = v.Character.HumanoidRootPart
             local Head = v.Character.Head
             local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)   
             local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
             local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
 
             if onScreen and espsettings.Healthbar == true then
 
                 HealthBarOutline.Thickness = 3
                 HealthBarOutline.Filled = false
                 HealthBarOutline.Color = Color3.new(0,0,0)
                 HealthBarOutline.Transparency = 1
                 HealthBarOutline.Visible = false
             
                 HealthBar.Thickness = 1
                 HealthBar.Filled = false
                 HealthBar.Transparency = 1
                 HealthBar.Visible = false
             
                 HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                 HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                 HealthBarOutline.Visible = false
             
                 HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (workspace[v.Character.Name].Humanoid.MaxHealth / math.clamp(workspace[v.Character.Name].Humanoid.Health, 0, workspace[v.Character.Name].Humanoid.MaxHealth)))
                 HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                 HealthBar.Color = Color3.fromRGB(255 - 255 / (workspace[v.Character.Name].Humanoid.MaxHealth / workspace[v.Character.Name].Humanoid.Health), 255 / (workspace[v.Character.Name].Humanoid.MaxHealth / workspace[v.Character.Name].Humanoid.Health), 0)
                 HealthBar.Visible = false
 
 
                 if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                     HealthBar.Visible = false
                     HealthBarOutline.Visible = false
                 else
                     HealthBar.Visible = true
                     HealthBarOutline.Visible = true
                 end
             else
                 HealthBar.Visible = false
                 HealthBarOutline.Visible = false
             end
         else
             HealthBar.Visible = false
             HealthBarOutline.Visible = false
         end
     
      end)
    end
    coroutine.wrap(Healthbar)()
 
    if (espsettings.ESPBool == false) then
        BoxOutline:Remove()
        Box:Remove()
    end

end)
     --#endregion Updater Shit

end)

local Toggle1Health = Section1:CreateToggle("Healthbar", nil, function (bool)
    espsettings.Healthbar = bool
end)

local Toggle2Name = Section1:CreateToggle("Name ESP", nil, function (bool)

    espsettings.NameESP = bool

    for i,v in pairs(game.Players:GetChildren()) do

        local DropText = Drawing.new("Text")
    
        function BruhNameESP()
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then

                    local TextVect, onScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    
                    DropText.Visible = false
                    DropText.Center = true
                    DropText.Outline = true
                    DropText.Font = 2
                    DropText.Size = 13
                    DropText.Color = Color3.new(1,1,1) --> or any color, using FromRGB
                    DropText.Text = v.Name
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  

                    if onScreen == true and espsettings.NameESP == true then
    
                        DropText.Color = textsettings.NameColor

                        local texts = math.ceil((RootPart.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude)

                        -- Text pos check
                        if textsettings.NamePos == "Bottom" then
                            DropText.Position = Vector2.new(TextVect.X / 1, TextVect.Y + 1500 / RootPosition.Z / 1)
                        else
                            DropText.Position = Vector2.new(TextVect.X / 1, TextVect.Y - 1400 / RootPosition.Z / 1)
                        end

                        --BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                        
                        if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                            DropText.Visible = false
                        else
                            DropText.Visible = true
                        end
                    else
                        DropText.Visible = false
                    end
    
                else
                    DropText.Visible = false
                end
    
            end)
            
        end
        coroutine.wrap(BruhNameESP)()
    end
    
    -- Region updater
    
    game.Players.PlayerAdded:Connect(function(v)
        
        local DropText = Drawing.new("Text")
    
        function BruhNameESP()
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then

                    local TextVect, onScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    
                    DropText.Visible = false
                    DropText.Center = true
                    DropText.Outline = true
                    DropText.Font = 2
                    DropText.Size = 13
                    DropText.Color = Color3.new(1,1,1) --> or any color, using FromRGB
                    DropText.Text = v.Name
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
    
                    if onScreen == true and espsettings.NameESP == true then
    
                        DropText.Color = textsettings.NameColor

                        local texts = math.ceil((RootPart.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude)

                        if textsettings.NamePos == "Bottom" then
                            DropText.Position = Vector2.new(TextVect.X / 1, TextVect.Y + 1500 / RootPosition.Z / 1)
                        else
                            DropText.Position = Vector2.new(TextVect.X / 1, TextVect.Y - 1400 / RootPosition.Z / 1)
                        end

                        if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                            DropText.Visible = false
                        else
                            DropText.Visible = true
                        end
                    else
                        DropText.Visible = false
                    end
    
                else
                    DropText.Visible = false
                end
    
            end)
            
        end
        coroutine.wrap(BruhNameESP)()
    end)


end)

local Toggle3Dist = Section1:CreateToggle("Distance", nil, function (bool)
    

    espsettings.DistanceESP = bool

    for i,v in pairs(game.Players:GetChildren()) do

        local NameDist = Drawing.new("Text")
    
        function BruhNameDistESP()
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then

                    local TextVect, onScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    
                    NameDist.Visible = false
                    NameDist.Center = true
                    NameDist.Outline = true
                    NameDist.Font = 0
                    NameDist.Size = 16
                    NameDist.Color = Color3.new(1,1,1) --> or any color, using FromRGB
                    NameDist.Text = v.Character.Name
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  

                    if onScreen == true and espsettings.DistanceESP == true then
    
                        NameDist.Color = textsettings.DistColor

                        local texts = math.ceil((RootPart.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude)

                        if textsettings.DistPos == "Bottom" then
                            NameDist.Position = Vector2.new(TextVect.X / 1, TextVect.Y + 1600 / RootPosition.Z / 1)
                        else
                            NameDist.Position = Vector2.new(TextVect.X / 1, TextVect.Y - 1550 / RootPosition.Z / 1)
                        end

                        NameDist.Text = tostring("(" .. texts .. ")")
    
                        if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                            NameDist.Visible = false
                        else
                            NameDist.Visible = true
                        end
                    else
                        NameDist.Visible = false
                    end
    
                else
                    NameDist.Visible = false
                end
    
            end)
            
        end
        coroutine.wrap(BruhNameDistESP)()
    end
    
    -- Region updater
    
    game.Players.PlayerAdded:Connect(function(v)
        
        local NameDist = Drawing.new("Text")
    
        function BruhNameDistESP()
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then

                    local TextVect, onScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    
                    NameDist.Visible = false
                    NameDist.Center = true
                    NameDist.Outline = true
                    NameDist.Font = 2
                    NameDist.Size = 13
                    NameDist.Color = Color3.new(1,1,1) --> or any color, using FromRGB
                    NameDist.Text = v.Character.Name
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
    
                    if onScreen == true and espsettings.DistanceESP == true then
    
                        NameDist.Color = textsettings.DistColor

                        local texts = math.ceil((RootPart.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude)

                        if textsettings.DistPos == "Bottom" then
                            NameDist.Position = Vector2.new(TextVect.X / 1, TextVect.Y + 1450 / RootPosition.Z / 1)
                        else
                            NameDist.Position = Vector2.new(TextVect.X / 1, TextVect.Y - 1250 / RootPosition.Z / 1)
                        end
    
                        NameDist.Text = tostring("[" .. texts .. "]")

                        if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                            NameDist.Visible = false
                        else
                            NameDist.Visible = true
                        end
                    else
                        NameDist.Visible = false
                    end
    
                else
                    NameDist.Visible = false
                end
    
            end)
            
        end
        coroutine.wrap(BruhNameDistESP)()
    end)

end)

local Toggle5HeadDot = Section1:CreateToggle("Head Dot", nil, function (bool)
    

    espsettings.HeadDot = bool

    for i,v in pairs(game.Players:GetChildren()) do

        local HeadCircle = Drawing.new("Circle")
    
        function BruhheadCircle()
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                    local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                    HeadCircle.Visible = true
                    HeadCircle.Radius = 30
                    HeadCircle.Color = espsettings.HeadDotColor
                    HeadCircle.Thickness = 1
                    HeadCircle.Filled = false
                    HeadCircle.Transparency = 1
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                    local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
    
                    if onScreen == true and espsettings.HeadDot == true then
    
                        HeadCircle.Position = Vector2.new(HeadPosition.X / 1, HeadPosition.Y / 1)
                        HeadCircle.Radius = 430 / RootPosition.Z
    
                        if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                            HeadCircle.Visible = false
                        else
                            HeadCircle.Visible = true
                        end
                    else
                        HeadCircle.Visible = false
                    end
    
                else
                    HeadCircle.Visible = false
                end
    
            end)
            
        end
        coroutine.wrap(BruhheadCircle)()
    end
    
    -- Region updater
    
    game.Players.PlayerAdded:Connect(function(v)
        
        local HeadCircle = Drawing.new("Circle")
    
        function BruhheadCircle()
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                    local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                    HeadCircle.Visible = true
                    HeadCircle.Radius = 30
                    HeadCircle.Color = espsettings.HeadDotColor
                    HeadCircle.Thickness = 1
                    HeadCircle.Filled = false
                    HeadCircle.Transparency = 1
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                    local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
    
                    if onScreen == true and espsettings.HeadDot == true then
    
                        HeadCircle.Position = Vector2.new(HeadPosition.X / 1, HeadPosition.Y / 1)
                        HeadCircle.Radius = 450 / RootPosition.Z
    
                        if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                            HeadCircle.Visible = false
                        else
                            HeadCircle.Visible = true
                        end
                    else
                        HeadCircle.Visible = false
                    end
    
                else
                    HeadCircle.Visible = false
                end
    
            end)
        end
        coroutine.wrap(BruhheadCircle)()
    end)

end)

local Toggle6SnapLines = Section1:CreateToggle("Snaplines", nil, function (bool)
    
    espsettings.SnaplinesESP = bool

    for i,v in pairs(game.Players:GetChildren()) do
        local TLeft = Drawing.new("Line")
    
    function Snaplines()
        
        game:GetService("RunService").RenderStepped:Connect(function ()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)   
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
    
                TLeft.Visible =  false
                TLeft.Thickness = 1
                TLeft.Color = espsettings.SnaplineColor

                if onScreen and espsettings.SnaplinesESP == true then

                    if espsettings.SnaplinePos == "Head" then
                        TLeft.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                        TLeft.To = Vector2.new(HeadPosition.X, HeadPosition.Y)
                    else 
                        if espsettings.SnaplinePos == "Torso" then
                            TLeft.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                            TLeft.To = Vector2.new(RootPosition.X, RootPosition.Y)
                        else
                            if espsettings.SnaplinePos == "Legs" then
                                TLeft.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                                TLeft.To = Vector2.new(LegPosition.X, LegPosition.Y)
                            end
                        end
                        

                    end


                    if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                        TLeft.Visible = false
                    else
                        TLeft.Visible = true
                    end
                else
                    TLeft.Visible = false
                end
            else
                TLeft.Visible = false
            end
        end)
    end
    coroutine.wrap(Snaplines)()
    end

    game.Players.PlayerAdded:Connect(function(v)
        
    local TLeft = Drawing.new("Line")
    
    function Snaplines()
        
        game:GetService("RunService").RenderStepped:Connect(function ()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)   
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
    
                TLeft.Visible =  false
                TLeft.Thickness = 1
                TLeft.Color = espsettings.SnaplineColor

                if onScreen and espsettings.SnaplinesESP == true then

                    if espsettings.SnaplinePos == "Head" then
                        TLeft.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                        TLeft.To = Vector2.new(HeadPosition.X, HeadPosition.Y)
                    else 
                        if espsettings.SnaplinePos == "Torso" then
                            TLeft.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                            TLeft.To = Vector2.new(RootPosition.X, RootPosition.Y)
                        else
                            if espsettings.SnaplinePos == "Legs" then
                                TLeft.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                                TLeft.To = Vector2.new(LegPosition.X, LegPosition.Y)
                            end
                        end
                    end
                    if espsettings.TeamCheck == true and v.TeamColor == lplr.TeamColor then
                        TLeft.Visible = false
                    else
                        TLeft.Visible = true
                    end
                else
                    TLeft.Visible = false
                end
            else
                TLeft.Visible = false
            end
        end)
    end
    coroutine.wrap(Snaplines)()
    end)

end)

local Toggle7 = Section1:CreateToggle("Team Check", true, function (bool)
    

    espsettings.TeamCheck = bool

end)

local Colorpicker1Box = Section2:CreateColorpicker("Box Color", function(Color)
    espsettings.BoxColor = Color

end)

local Colorpicker2InsBox = Section2:CreateColorpicker("Inside Box Color", function (color)
    espsettings.BoxOutlineColor = color
end)

local Colorpicker3NameColor = Section2:CreateColorpicker("Name Text Color", function (color)
    textsettings.NameColor = color
end)

local Colorpicker4DistColor = Section2:CreateColorpicker("Distance Text Color", function (color)
    textsettings.DistColor = color
end)

local Colorpicker5HeadDotColor = Section2:CreateColorpicker("Head Dot Color", function (color)
    espsettings.HeadDotColor = color
end)

local SnaplineColor = Section2:CreateColorpicker("Snapline Color", function (color)
    espsettings.SnaplineColor = color
end)

local Slider1OutsOpac = Section2:CreateSlider("Outside Box Transparency",0,1,nil,false, function (value)
    -- espsettings.BoxTransparency = value
    espsettings.BoxTransparency = value

end)

local Slider5InsOpac = Section2:CreateSlider("Inside Box Transparency",0,1,nil,false, function (value)
    -- espsettings.BoxTransparency = value
    espsettings.BoxOutlineTransparency = value

end)

local Dropdown2 = Section2:CreateDropdown("Name Position", {"Top", "Bottom"}, function (String)
    
    textsettings.NamePos = String
end)

local Dropdown3 = Section2:CreateDropdown("Distance Position", {"Top", "Bottom"}, function (String)
    
    textsettings.DistPos = String
end)

local SnaplinePos = Section2:CreateDropdown("Snapline Position", {"Head", "Torso", "Legs"}, function (String)
    espsettings.SnaplinePos = String
end)

local ToggleChams = Section6:CreateToggle("Enable", nil, function (bool)

    chamsettings.Enabled = bool

    function chams()
        game:GetService("RunService").RenderStepped:Connect(function()
            if chamsettings.Enabled == true then
                for i,v in pairs(game.Players:GetChildren()) do
                    for i,b in pairs(v.Character:GetChildren()) do
                        if b:IsA("Part") and v.Character.Humanoid.Health > 0 and v ~= lplr and v.TeamColor ~= lplr.TeamColor then
                            if not b:FindFirstChild("BoxHandleAdornment") then
                                b.Transparency = chamsettings.PlayerTransparency
                                local box = Instance.new("BoxHandleAdornment", b)
                                box.AlwaysOnTop = chamsettings.Enabled
                                box.Adornee = b
                                box.Size = b.Size
                                box.Color3 = chamsettings.Color
                                box.ZIndex = 1                                         
                                box.Transparency = chamsettings.BoxTransparency

                                repeat wait()
                                    box.Color3 = chamsettings.Color
                                    box.Transparency = chamsettings.BoxTransparency
                                    b.Transparency = chamsettings.PlayerTransparency
                                    box.AlwaysOnTop = chamsettings.OnTop
                                until chamsettings.Enabled == false
                            end
                        end
                    end
                end
            end
        end)
    end
    coroutine.wrap(chams)()

    function destroyChams()
        game:GetService("RunService").RenderStepped:Connect(function ()
               for i,v in pairs(game.Players:GetChildren()) do
                  for i,b in pairs(v.Character:GetChildren()) do
                      if b:IsA("Part") and v.Character.Humanoid.Health == 0 or chamsettings.Enabled == false then
                          if b:FindFirstChild("BoxHandleAdornment") then
                              b.BoxHandleAdornment:Destroy()
                          end
                      end
                  end
               end
        end)
    end
    coroutine.wrap(destroyChams)()

end)

local OnTopCham = Section6:CreateToggle("Always On Top", nil, function (bool)
    chamsettings.OnTop = bool
end)

local Colorpicker4ChamColor = Section6:CreateColorpicker("Cham Color", function (color)
    chamsettings.Color = color
end)

local slider5ChamOpac = Section6:CreateSlider("Cham Transparency",0,1,nil,false,function (value)
    chamsettings.BoxTransparency = value
end)

local slider7PlayerOpac = Section6:CreateSlider("Player Transparency",0,1,nil,false,function (value)
    chamsettings.PlayerTransparency = value
end)

local crosshairToggle = Section8:CreateToggle("Crosshair", false, function (bool)
    
    crosshairSettings.Toggled = bool
    local CrosshairDown = Drawing.new("Line") -- y
    local CrosshairCross = Drawing.new("Line") -- x

    function makeCrosshair()
        game:GetService("RunService").RenderStepped:Connect(function ()
            if crosshairSettings.Toggled == true then

                CrosshairDown.Color = Color3.new(255,255,255)
                CrosshairDown.Thickness = 1 
                CrosshairDown.Transparency = 1

                CrosshairCross.Color = Color3.new(255,255,255)
                CrosshairCross.Thickness = 1 
                CrosshairCross.Transparency = 1 

                if crosshairSettings.Toggled == true then

                    CrosshairDown.Visible = true
                    CrosshairCross.Visible = true
                
                    CrosshairCross.From = Vector2.new((dwCamera.ViewportSize.X/2)+(crosshairSettings.Length/2+1), dwCamera.ViewportSize.Y/2) 
                    CrosshairCross.To = Vector2.new(dwCamera.ViewportSize.X/2-(crosshairSettings.Length/2), dwCamera.ViewportSize.Y/2) 
                
                    CrosshairDown.From = Vector2.new(dwCamera.ViewportSize.X/2, dwCamera.ViewportSize.Y/2+(crosshairSettings.Length/2)) 
                    CrosshairDown.To = Vector2.new(dwCamera.ViewportSize.X/2, dwCamera.ViewportSize.Y/2-(crosshairSettings.Length/2))

        
                else
                    CrosshairDown.Visible = false
                    CrosshairCross.Visible = false
                end

            else
                CrosshairDown.Visible = false
                CrosshairCross.Visible = false
            end

        end)
    end
    coroutine.wrap(makeCrosshair)()

end)

local sliderBruh= Section8:CreateSlider("Crosshair Length",5,25,nil,false,function (value)
    crosshairSettings.Length = value
end)

------------- End of Visuals -- Add color settings later after all of the esp is finished

------------- Aimbot Section

local Toggle1Aimbot = SectionV1:CreateToggle("Enable", nil, function (bool)
    

aimbotsettings.Aimbot = bool

local fovcircle = Drawing.new("Circle")
fovcircle.Visible = aimbotsettings.Aimbot_Draw_FOV
fovcircle.Radius = aimbotsettings.Aimbot_FOV_Radius
fovcircle.Color = aimbotsettings.Aimbot_FOV_Color
fovcircle.Thickness = 1
fovcircle.Filled = false
fovcircle.Transparency = 1

fovcircle.Position = Vector2.new(dwCamera.ViewportSize.X / 2, dwCamera.ViewportSize.Y / 2)

dwUIS.InputBegan:Connect(function(i)
    if i.KeyCode == Enum.KeyCode.X and aimbotsettings.Aimbotkey == true then
        aimbotsettings.Aiming = true;
    end
end)

dwUIS.InputEnded:Connect(function(i)
    if i.KeyCode == Enum.KeyCode.X and aimbotsettings.Aimbotkey == true then
        aimbotsettings.Aiming = false;
    end
end)


dwUIS.InputBegan:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton2 and aimbotsettings.Aimbotkey == false then
   aimbotsettings.Aiming = true
end
end)

dwUIS.InputEnded:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton2 and aimbotsettings.Aimbotkey == false then
   aimbotsettings.Aiming = false
end
end)

dwRunService.RenderStepped:Connect(function()
    
    local dist = math.huge
    local closest_char = nil
    fovcircle.Radius = aimbotsettings.Aimbot_FOV_Radius
    fovcircle.Color = aimbotsettings.Aimbot_FOV_Color

    if Aimbotlol == false then
        fovcircle.Visible = false
    end

    if aimbotsettings.Aimbot_Draw_FOV == false then
        fovcircle.Visible = false
    else 
        fovcircle.Visible = true
    end

    if aimbotsettings.Aiming and aimbotsettings.Aimbot == true then

        for i,v in next, dwEntities:GetChildren() do 

            if v ~= dwLocalPlayer and
            v.Character and
            v.Character:FindFirstChild("HumanoidRootPart") and
            v.Character:FindFirstChild("Humanoid") and
            v.Character:FindFirstChild("Humanoid").Health > 0 then

                if aimbotsettings.Aimbot_TeamCheck == true and
                v.Team ~= dwLocalPlayer.Team or
                aimbotsettings.Aimbot_TeamCheck == false then

                    local char = v.Character
                    local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char[aimbotsettings.Aimbot_AimPart].Position)

                    if is_onscreen then

                        local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude

                        if mag < dist and mag < aimbotsettings.Aimbot_FOV_Radius then

                            dist = mag
                            closest_char = char

                        end
                    end
                end
            end
        end

        if closest_char ~= nil and
        closest_char:FindFirstChild("HumanoidRootPart") and
        closest_char:FindFirstChild("Humanoid") and
        closest_char:FindFirstChild("Humanoid").Health > 0 then

            dwCamera.CFrame = CFrame.new(dwCamera.CFrame.Position, closest_char[aimbotsettings.Aimbot_AimPart].Position)
        end
    end
end)

end)

local Toggle4AimWKey = SectionV1:CreateToggle("Aim With Key [X]", nil, function (bool)
    

    aimbotsettings.Aimbotkey = bool
end)

local Toggle3 = SectionV1:CreateToggle("TeamCheck", true, function (bool)
    aimbotsettings.Aimbot_TeamCheck = bool
end)

local Dropdown1AimPart = SectionV3:CreateDropdown("Aim Part", {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}, function (String)
    

    aimbotsettings.Aimbot_AimPart = String

end)
-- Dropdown1:SetOption("Head")

local Toggle4ShowFOV = SectionV4:CreateToggle("Show FOV Circle", nil, function (bool)

    aimbotsettings.Aimbot_Draw_FOV = bool
    
end)

local Slider4Rad = SectionV4:CreateSlider("Radius",10,500,nil,false, function (value)
    aimbotsettings.Aimbot_FOV_Radius = value
end)

local Toggle1SilentAim = SectionV5:CreateToggle("Enable (P)Silent Aim", nil, function (bool)
    
    pSilent = bool

    local function ClosestPlayerToMouse()
        local target = nil
        local dist = math.huge
        for i,v in pairs(dwEntities:GetPlayers()) do
        if v.Name ~= lplr.Name then
            if workspace[v.Character.Name] and workspace[v.Character.Name]:FindFirstChild("Humanoid") and workspace[v.Character.Name].Humanoid.Health ~= 0 and workspace[v.Character.Name]:FindFirstChild("HumanoidRootPart") and v.TeamColor ~= lplr.TeamColor and pSilent == true then
                local screenpoint = camera:WorldToScreenPoint(workspace[v.Character.Name].HumanoidRootPart.Position)
                local check = (Vector2.new(dwMouse.X,dwMouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
        
                if check < dist then
                    target  = v
                    dist = check
                end
            end
        end
        end
        
        print(target)
        return target
        end
        
        setreadonly(mt,false)
        
        mt.__namecall = function(self,...)
            local args = {...}
            local method = getnamecallmethod()
            
            if tostring(self) == "Hit" and method == "FireServer" then
                args[1] = workspace[ClosestPlayerToMouse()].Head.Position
                args[2] = workspace[ClosestPlayerToMouse()].Head
                return self.FireServer(self, unpack(args))
            end
            return namecall(self,...)
        end

end)

local loadoutSlots = {"Loadout 1", "Loadout 2", "Loadout 3", "Loadout 4", "Loadout 5"}

local skinTable = {}
for i,v in pairs(game:GetService("ReplicatedStorage").Items.Skin:GetChildren()) do	
	if v:IsA("Decal") or v:IsA("Texture") then
		table.insert(skinTable, v.Name)
		table.sort(skinTable)

	end
end

local loadoutSelection = SectionVV2:CreateDropdown("Loadout Selector", loadoutSlots, function (value)
    
    if value == "Loadout 1" then
        skinChanger.loadoutSlotSelection = "Loadout1"
    else if value == "Loadout 2" then
        skinChanger.loadoutSlotSelection = "Loadout2"
    else if value == "Loadout 3" then
        skinChanger.loadoutSlotSelection = "Loadout3"
    else if value == "Loadout 4" then
        skinChanger.loadoutSlotSelection = "Loadout4"
    else if value == "Loadout 5" then
        skinChanger.loadoutSlotSelection = "Loadout5"
    end
end

end

end

end

end)
--loadoutSelection:SetOption("Loadout 1")

local PrimaryCamo = SectionVV2:CreateDropdown("Primary Skins", skinTable, function (value)
    skinChanger.SelectedPrimSkin = value

    game:GetService("Players").LocalPlayer.PlayerData.Loadout[skinChanger.loadoutSlotSelection].Primary.Skin.Value = skinChanger.SelectedPrimSkin

end)

local SeccondaryCamo = SectionVV2:CreateDropdown("Secondary Skins", skinTable, function (value)
    skinChanger.SelectedSecSkin = value

    game:GetService("Players").LocalPlayer.PlayerData.Loadout[skinChanger.loadoutSlotSelection].Secondary.Skin.Value = skinChanger.SelectedSecSkin

end)

local CharCusto = SectionVV4:CreateToggle("Character Customizer", nil, function (bool)
    characterSetts.CharacterCustomization = bool

    function blue()
        game:GetService("RunService").RenderStepped:Connect(function ()

        if characterSetts.CharacterCustomization == true then

            for i,v in pairs(game:GetService("Workspace").Camera[gunMods.PrimaryGun]:GetChildren()) do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    if rainbowColor.rainbowBool == true then
                        v.BrickColor = BrickColor.new(rainbowColor.rainbow)
                        v.Material = characterSetts.PlayerMaterial
                    else
                        v.Material = characterSetts.PlayerMaterial
                        v.BrickColor = BrickColor.new(characterSetts.CharacterColor)
                    end
    
                end
            end

            game:GetService("Workspace").Camera.FieldOfView = characterSetts.FOV

        end

        
        end)
    end
    coroutine.wrap(blue)()

    if characterSetts.CharacterCustomization == true then
        game:GetService("Workspace").Camera.FieldOfView = characterSetts.FOV
    end

end)

local PlrModelClr = SectionVV4:CreateColorpicker("Player Model Color", function (color)
    
    characterSetts.CharacterColor = color

end)

matTable = {"Plastic", "Foil", "Grass", "Ice", "Marble", "SmoothPlastic", "Neon", "ForceField"}

local Dropdown4 = SectionVV4:CreateDropdown("Player Material", matTable, function (Name)
    characterSetts.PlayerMaterial = Name
end)

local GunCusto = SectionVV4:CreateToggle("Gun Customizer", nil, function (bool)
    characterSetts.GunCustomization = bool

    function red()
        game:GetService("RunService").RenderStepped:Connect(function ()
        if characterSetts.GunCustomization == true then
            for i,v in pairs(game:GetService("Workspace").Camera[gunMods.PrimaryGun][gunMods.PrimaryGun]:GetChildren()) do
                if v:IsA("MeshPart") or v:IsA("UnionOperation") or v:IsA("Part") then
                    if rainbowColor.rainbowBool == true then
                        v.BrickColor = BrickColor.new(rainbowColor.rainbow)
                    else
                        v.Material = characterSetts.GunMaterial
                        v.BrickColor = BrickColor.new(characterSetts.GunColor)
                    end

                    

                end
            end
        end

        end)
    end
    coroutine.wrap(red)()

end)

local GunMdlClr = SectionVV4:CreateColorpicker("Gun Model Color", function (color)
    characterSetts.GunColor = color
end)

local GunMdlMat = SectionVV4:CreateDropdown("Gun Material", matTable, function (Name)
    characterSetts.GunMaterial = Name
end)

local FOVSlider= SectionVV4:CreateSlider("Player FOV", 60,120,nil,false, function (value)
    characterSetts.FOV = value
end)

-- local SectionVV3 = Tab3:CreateSection("Gun Mods")

-- Start of misc section below

function gunGetter()
    game:GetService("RunService").RenderStepped:Connect(function ()

	if mapSetts.InGame == true then
	        for i,v in pairs(workspace[game.Players.LocalPlayer.Name]:GetDescendants()) do
            	if v:IsA("Tool") then  
                
                gunMods.PrimaryGun = v.Name


            end
            
        end
	end
    
    end)

end
coroutine.wrap(gunGetter)()

local GunMods = SectionVV3:CreateToggle("Gun Mods", nil, function (bool)
    gunMods.gunCust = bool

    function modGun()
        game:GetService("RunService").RenderStepped:Connect(function ()
            if mapSetts.InGame == true and gunMods.gunCust == true then

                local gunService = workspace[game.Players.LocalPlayer.Name][gunMods.PrimaryGun]["ACS_Modulo"].Variaveis.Settings
                local m = require(gunService)
                local Ammo = workspace[game.Players.LocalPlayer.Name][gunMods.PrimaryGun]["ACS_Modulo"].Variaveis.Ammo

                Ammo.Value = gunMods.Ammo
                m.MinRecoilPower = 0
                m.MaxRecoilPower = 0
                m.ChangeFOV = {characterSetts.FOV, characterSetts.FOV}
                m.AimRecover = 0
                m.PunchRecover = 0
                m.MaxSpread = 0
                m.SwayBase = 0
                m.MaxSway = 0
                m.RecoilPunch = 0
                m.MinSpread = 0
                m.MaxSpread = 0
                --m.RecoilPowerStepAmount = gunMods.RecoilStepAmmt
                m.FireRate = gunMods.FireRate
                m.CanBreachDoor = true
                m.CanBreak = true
                m.AimInaccuracyStepAmount = 0
                m.Bullets = gunMods.Bullets
                m.BulletPenetration = gunMods.BulletPen
                m.FallOfDamage = 0
                m.Distance = math.huge
                m.BSpeed = 1
                m.Tracer = true
                m.BulletWhiz = false
                m.TracerColor = characterSetts.GunColor
                m.Mode = "Auto"
                --m.FireModes = {ChangeFiremods = false, Semi = false, Burst = false, Auto = true, Explo}

            end
        end)
        
    end
    coroutine.wrap(modGun)()


end)

local BSAOT = SectionVV3:CreateSlider("Bullets shot at one time", 1, 20, nil, false, function (value)
    gunMods.Bullets = value
end)

local FireRate = SectionVV3:CreateSlider("Fire Rate", 100, 2000, nil, false, function (value)
    gunMods.FireRate = value
end)

local AmmoAmmt = SectionVV3:CreateSlider("Ammo Ammount", 1, 500, nil, false, function (value)
    gunMods.Ammo = value
end)

local BulletPen = SectionVV3:CreateSlider("Bullet Penetration", 75, 10000, nil, false, function (value)
    gunMods.BulletPen = value
end)

function mapGetter()
    game:GetService("RunService").RenderStepped:Connect(function ()

        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:IsA("Folder") and v.Name == "Map" then
        
                for i,v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                    if v:IsA("Model") then
                
                        mapSetts.CurrentMap = v.Name
                        mapSetts.InGame = true
                    end
                
                end
        
            else
                
            end
        
        end
    end)

end
coroutine.wrap(mapGetter)()

local Toggle8 = SectionMM1:CreateToggle("No-Clip", false, function (bool)
    mapSetts.Enabled = bool

    if mapSetts.InGame ==  true then

        repeat wait(0.1)

        game:GetService("Workspace").MapBaseSupport.CanCollide = true 
        game:GetService("Workspace").MapCore.CanCollide = true
        game:GetService("Workspace").Baseplate.CanCollide = true

        
            for i,v in pairs(game:GetService("Workspace").Map[mapSetts.CurrentMap]:GetDescendants()) do
                if v.Name ==  "Part" or v:IsA("MeshPart") then
    
                    v.Transparency = mapSetts.Transparency
                    v.CanCollide = mapSetts.Collide

                end
    
            end

            for i,v in pairs(game.Players:GetChildren()) do
                if v == lplr then
                    for i,b in pairs(v.Character:GetChildren()) do
                        if b:IsA("Part") then
                            b.CanCollide = false
                        end
                    end
                end
                
            end

        until mapSetts.Enabled == false

    end



end)

local Toggle9 = SectionMM1:CreateToggle("Collision", true, function (bool)
    mapSetts.Collide = bool
end)

local Slider6 = SectionMM1:CreateSlider("Wall Transparency",0,1,nil,false, function (value)
    mapSetts.Transparency = value
end)

local Button5 = SectionMM1:CreateButton("TP to Attackers Spawn Box", function ()
    workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = game:GetService("Workspace").SpawnLocation.CFrame
end)

local Toggle10 = SectionMM2:CreateToggle("Player Mods", false, function (bool)
    PlayerModBool = bool

    repeat wait()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = playerMods.Speed
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = playerMods.Height
    until PlayerModBool == false

end)

local Slider7 = SectionMM2:CreateSlider("Player Speed", 10, 300, 10, false, function (value)
    
    playerMods.Speed = value

end)

local Slider9 = SectionMM2:CreateSlider("Player Jump Height", 10, 300, 10, false, function (value)
    
    playerMods.Height = value

end)

local Toggle11 = SectionMM2:CreateToggle("Fly (kinda buggy)", nil, function (bool)

    local poggersBool = bool

    function flyEnable()

        while poggersBool == true do

            repeat wait()

                repeat wait()
                until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
                local mouse = game.Players.LocalPlayer:GetMouse()
                repeat wait() until mouse

                local plr = game.Players.LocalPlayer
                local Torso = game.Players.LocalPlayer.Character.Torso
                local flying = false
                local deb = true
                local ctrl = {f = 0, b = 0, l = 0, r = 0}
                local lastctrl = {f = 0, b = 0, l = 0, r = 0}
                local maxspeed = 200
                local speed = 0

                function Fly()
                local bg = Instance.new("BodyGyro", Torso)
                bg.P = 9e4
                bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.cframe = Torso.CFrame
                local bv = Instance.new("BodyVelocity", Torso)
                bv.velocity = Vector3.new(0,0.1,0)
                bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
                repeat wait()
                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+3+(speed/maxspeed)
                if speed > maxspeed then
                speed = maxspeed
                end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-5
                if speed < 0 then
                speed = 0
                end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                bv.velocity = Vector3.new(0,0.1,0)
                end
                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
                until not flying or value == false
                ctrl = {f = 0, b = 0, l = 0, r = 0}
                lastctrl = {f = 0, b = 0, l = 0, r = 0}
                speed = 0
                bg:Destroy()
                bv:Destroy()
                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end
                
                mouse.KeyDown:connect(function(key)
                if key:lower() == 'g' then
                if flying then flying = false
                else
                flying = true
                Fly()
                end
                elseif key:lower() == "w" then
                ctrl.f = 1
                elseif key:lower() == "s" then
                ctrl.b = -1
                elseif key:lower() == "a" then
                ctrl.l = -1
                elseif key:lower() == "d" then
                ctrl.r = 1
                end
                end)
                mouse.KeyUp:connect(function(key)
                if key:lower() == "w" then
                ctrl.f = 0
                elseif key:lower() == "s" then
                ctrl.b = 0
                elseif key:lower() == "a" then
                ctrl.l = 0
                elseif key:lower() == "d" then
                ctrl.r = 0
                end
                end)
                Fly()

                if flying == false then
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end

            until poggersBool == false
            
        end

    end
    coroutine.wrap(flyEnable)()

    if poggersBool == false then
        flying = false
    end


end)

-- Chat Spammer

local toggle12 = SectionMM3:CreateToggle("Enable Chat Spammer (Not finished)", nil, function (bool)
    
end)

--local sectionMM4 = Tab5:CreateSection("Teleports")
--local toggle15 = sectionMM4:CreateToggle("Teleport Players To You", nil , function (bool)
--end)

local toggle16 = sectionMM4:CreateToggle("Teleport To Players (Loop)", nil, function (bool)
    
    Teleport = bool

    repeat wait(1)
        for i,v in pairs(game.Players:GetChildren()) do

            if v.Character ~= nil and v.TeamColor ~= lplr.TeamColor then
                workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = workspace[v.Name].HumanoidRootPart.CFrame * CFrame.new(TPx, TPy, TPz)
                wait(1)
            end
            
        end
    until Teleport == false


end)

toggle16:CreateKeybind(tostring(Config.TlprtKeybind):gsub("Enum.KeyCode.", ""), function (Key)
    Config.TlprtKeybind = Enum.KeyCode[Key]
end)

local TPSliderX= sectionMM4:CreateSlider("TP X Offset",-15,15,0,false, function (value)
    TPx = value
end)

local TPSliderY= sectionMM4:CreateSlider("TP Y Offset",0,15,nil,false, function (value)
    TPy = value
end)

local TPSliderZ= sectionMM4:CreateSlider("TP Z Offset",-15,15,0,false, function (value)
    TPz = value
end)

--local tlprtDropdown = sectionMM4:CreateDropdown("")

-------------  Theme settings and shit (leave alone)
local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)


function updateFPS()

    game:GetService("RunService").RenderStepped:Connect(function()
        frames = frames + 1
    end)
    
end
coroutine.wrap(updateFPS)()

local Toggle25 = Section3:CreateToggle("Watermark", nil, function (State)
    

     if State == true then

        watermark.Visible = true
        watermark.Center = false
        watermark.Outline = true
        watermark.Font = 1
        watermark.Size = 25
        watermark.Color = Color3.new(1,1,1) --> or any color, using FromRGB
        watermark.Position = Vector2.new(120, 4)

        while wait(1) do
            watermark.Text = "Jailbird.gg | " .. "FPS: " .. tostring(frames)

            frames = 0
        end

     else

        watermark.Visible = false

     end

end)

------------- End of Theme settings and shit (leave alone)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Abstract")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.fromRGB(0,0,0))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.0)

-- local Sayings = {"#GG!","EZ Win","Slammed NN", "Bruh", "GG!", ""} --  Maybe add these to the title so it picks a random one and then shows in the title bar idk
-- Keep all the same values when you disable esp and then re-enable it because for some reason it make a whole new esp box instead of using the one already made??
-- Add chat spammer
-- somehow maybe bypass kicking script??

------- Config Section

local Button1 = Section5:CreateButton("Save Config", function ()

    if not pcall(function() readfile(Name) end) then writefile(Name, game:service'HttpService':JSONEncode(DefaultSettings)) end

    Settings = game:service'HttpService':JSONDecode(readfile(Name))

    local function Save()
    writefile(Name,game:service'HttpService':JSONEncode(Settings))
    end
    -- ESP Settings Below
    Settings.ESP = espsettings.ESPBool
    Settings.BoxOutlineTransparency = espsettings.BoxOutlineTransparency
    Settings.BoxTransparency = espsettings.BoxTransparency
    Settings.HeadDot = espsettings.HeadDot
    Settings.BoxColor = {espsettings.BoxColor.R*255,espsettings.BoxColor.G*255, espsettings.BoxColor.B*255}
    Settings.BoxOutlineColor = {espsettings.BoxOutlineColor.R*255, espsettings.BoxOutlineColor.G*255, espsettings.BoxOutlineColor.B*255}
    Settings.HeadDotColor = {espsettings.HeadDotColor.R*255, espsettings.HeadDotColor.G*255, espsettings.HeadDotColor.B*255}
    Settings.ESPNames = espsettings.NameESP
    Settings.ESPDist = espsettings.DistanceESP
    Settings.ESPNameColor = {textsettings.NameColor.R*255,textsettings.NameColor.G*255,textsettings.NameColor.B*255}
    Settings.ESPDistColor = {textsettings.DistColor.R*255,textsettings.DistColor.G*255,textsettings.DistColor.B*255}
    -- Chams Section Below
    Settings.ChamEnabled = chamsettings.Enabled
    Settings.ChamOnTop = chamsettings.OnTop
    Settings.ChamColor = {chamsettings.Color.R*255, chamsettings.Color.G*255, chamsettings.Color.B*255}
    Settings.ChamBoxTransparency = chamsettings.BoxTransparency
    Settings.ChamPlayerTransparency = chamsettings.PlayerTransparency
    -- Aimbot Settings below
    Settings.Aimbot = aimbotsettings.Aimbot
    Settings.AimPart = aimbotsettings.Aimbot_AimPart
    Settings.AimbotFOVRadius = aimbotsettings.Aimbot_FOV_Radius
    Settings.AimbotKey = aimbotsettings.Aimbotkey
    Settings.AimbotShowFOV = aimbotsettings.Aimbot_Draw_FOV
    -- Characters and Gun Customization
    Settings.CharCustomization = characterSetts.CharacterCustomization
    Settings.GunCustomization = characterSetts.GunCustomization
    Settings.PlayerMat = characterSetts.PlayerMaterial
    Settings.GunMat = characterSetts.GunMaterial
    Settings.PlayerFOV = characterSetts.FOV
    Settings.CharColor = {characterSetts.CharacterColor.R*255,characterSetts.CharacterColor.G*255,characterSetts.CharacterColor.B*255}
    Settings.GunColor = {characterSetts.GunColor.R*255,characterSetts.GunColor.G*255,characterSetts.GunColor.B*255}
    -- Gun Mods
    Settings.gunCust = gunMods.gunCust
    Settings.BAOT = gunMods.Bullets
    Settings.FireRate = gunMods.FireRate
    Settings.AmmoAmmt = gunMods.Ammo
    Settings.BulletPen = gunMods.BulletPen
    Settings.PrimCamo = skinChanger.SelectedPrimSkin
    Settings.SecCamo = skinChanger.SelectedSecSkin
    Settings.LoadoutNum = skinChanger.loadoutSlotSelection
    -- Player Mods
    Settings.PlrModEnable = PlayerModBool
    Settings.PlrSpeed = playerMods.Speed
    Settings.PlrHeight = playerMods.Height

    Save()
end)

local Button2 = Section5:CreateButton("Load Config", function ()
    Settings = game:service'HttpService':JSONDecode(readfile(Name))
    -- ESP Settings Below
    espsettings.ESPBool = Settings.ESP
    espsettings.BoxOutlineTransparency = Settings.BoxOutlineTransparency
    espsettings.BoxTransparency = Settings.BoxTransparency
    espsettings.HeadDot = Settings.HeadDot
    espsettings.BoxColor = Color3.fromRGB(unpack(Settings.BoxColor))
    espsettings.BoxOutlineColor = Color3.fromRGB(unpack(Settings.BoxOutlineColor))
    espsettings.HeadDotColor = Color3.fromRGB(unpack(Settings.HeadDotColor))
    espsettings.NameESP = Settings.ESPNames
    espsettings.DistanceESP = Settings.ESPDist
    textsettings.DistColor = Color3.fromRGB(unpack(Settings.ESPDistColor))
    textsettings.NameColor = Color3.fromRGB(unpack(Settings.ESPNameColor))
    -- Chams Settings Below
    chamsettings.Enabled = Settings.ChamEnabled
    chamsettings.OnTop = Settings.ChamOnTop
    chamsettings.Color = Color3.fromRGB(unpack(Settings.ChamColor))
    chamsettings.BoxTransparency = Settings.ChamBoxTransparency
    chamsettings.PlayerTransparency = Settings.ChamPlayerTransparency
    -- Aimbot Settings below
    aimbotsettings.Aimbot = Settings.Aimbot
    aimbotsettings.Aimbot_AimPart = Settings.AimPart
    aimbotsettings.Aimbot_FOV_Radius = aimbotsettings.Aimbot_FOV_Radius
    aimbotsettings.Aimbotkey = Settings.AimbotKey
    aimbotsettings.Aimbot_Draw_FOV = Settings.AimbotShowFOV
    -- Characters and Gun Customization
    characterSetts.CharacterCustomization = Settings.CharCustomization
    characterSetts.GunCustomization = Settings.GunCustomization
    characterSetts.PlayerMaterial = Settings.PlayerMat
    characterSetts.GunMaterial = Settings.GunMat
    characterSetts.FOV = Settings.PlayerFOV
    characterSetts.CharacterColor = Color3.fromRGB(unpack(Settings.CharColor))
    characterSetts.GunColor = Color3.fromRGB(unpack(Settings.GunColor))
    skinChanger.loadoutSlotSelection = Settings.LoadoutNum
    skinChanger.SelectedPrimSkin = Settings.PrimCamo
    skinChanger.SelectedSecSkin = Settings.SecCamo
    -- Gun Mods
    gunMods.gunCust = Settings.gunCust
    gunMods.Bullets = Settings.BAOT
    gunMods.FireRate = Settings.FireRate
    gunMods.Ammo = Settings.AmmoAmmt
    gunMods.BulletPen = Settings.BulletPen
    -- Player Mods
    PlayerModBool = Settings.PlrModEnable
    playerMods.Speed = Settings.PlrSpeed
    playerMods.Height = Settings.PlrHeight

    --Toggle1Box:SetState(true)

    Toggle1Box:SetState(espsettings.ESPBool)
    Toggle2Name:SetState(espsettings.NameESP)
    Toggle3Dist:SetState(espsettings.DistanceESP)
    Toggle5HeadDot:SetState(espsettings.HeadDot)
    Slider1OutsOpac:SetValue(espsettings.BoxTransparency)
    Slider5InsOpac:SetValue(espsettings.BoxOutlineTransparency)
    Slider4Rad:SetValue(aimbotsettings.Aimbot_FOV_Radius)
    Toggle4AimWKey:SetState(aimbotsettings.Aimbotkey)
    Toggle4ShowFOV:SetState(aimbotsettings.Aimbot_Draw_FOV)
    Dropdown1AimPart:SetOption(aimbotsettings.Aimbot_AimPart)
    --
    Colorpicker1Box:UpdateColor(espsettings.BoxColor)
    Colorpicker2InsBox:UpdateColor(espsettings.BoxOutlineColor)
    Colorpicker3NameColor:UpdateColor(textsettings.NameColor)
    Colorpicker4DistColor:UpdateColor(textsettings.DistColor)
    Colorpicker5HeadDotColor:UpdateColor(espsettings.HeadDotColor)
    Colorpicker4ChamColor:UpdateColor(chamsettings.Color)

    --
    ToggleChams:SetState(chamsettings.Enabled)
    OnTopCham:SetState(chamsettings.OnTop)
    slider5ChamOpac:SetValue(chamsettings.BoxTransparency)
    slider7PlayerOpac:SetValue(chamsettings.PlayerTransparency)
    Toggle1Aimbot:SetState(aimbotsettings.Aimbot)
    -- 

    GunMods:SetState(gunMods.gunCust)
    BSAOT:SetValue(gunMods.Bullets)
    FireRate:SetValue(gunMods.FireRate)
    FOVAR:SetValue(gunMods.GunFOVRedux)
    --RSA:SetValue(gunMods.RecoilStepAmmt)
    AmmoAmmt:SetValue(gunMods.Ammo)
    BulletPen:SetValue(gunMods.BulletPen)
    -- 
    CharCusto:SetState(characterSetts.CharacterCustomization)
    FOVSlider:SetValue(characterSetts.FOV)
end)

local Button3 = Section5:CreateButton("TP Back To Lobby (Useful getting kicked)", function ()
    local Player = game.Players.LocalPlayer
    local TP = game:GetService("TeleportService")
    TP:Teleport(6055959032, Player)
end)

local Button4 = Section5:CreateButton("Unload Cheat", function ()
    for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if v.Name == "Box Color P" then
            espsettings.ESPBool = false
            chamsettings.Enabled = false
            aimbotsettings.Aimbot = false
            espsettings.BoxVisible = false
            espsettings.BoxOutlineVisible = false
            aimbotsettings.Aimbot_Draw_FOV = false
            chamsettings.BoxTransparency = 0
            chamsettings.PlayerTransparency = 0
            espsettings.HeadDot = false 
            espsettings.DistanceESP = false
            espsettings.NameESP = false
            espsettings.BoxTransparency = 0
            espsettings.BoxOutlineTransparency = 0
            showPlrInfo = false
            espsettings.SnaplinesESP = false
            aimbotsettings.Aiming = false   
            flying = false
            Teleport = false
            watermark.Visible = false

            function destroyChams()
                game:GetService("RunService").RenderStepped:Connect(function ()
                       for i,v in pairs(game.Players:GetChildren()) do
                          for i,b in pairs(v.Character:GetChildren()) do
                              if b:IsA("Part") and v.Character.Humanoid.Health == 0 or chamsettings.Enabled == false then
                                  if b:FindFirstChild("BoxHandleAdornment") then
                                      b.BoxHandleAdornment:Destroy()
                                  end
                              end
                          end
                       end
                end)
            end
            coroutine.wrap(destroyChams)()

            v.Parent:Remove()
        end
    end
end)

-- local Label1 = Section5:CreateLabel("")

local Label1 = Section7:CreateLabel("Hex/Hype - Dev                                     ")
local Label2 = Section7:CreateLabel(" Discord - discord.gg/u7psbSZBeM          ")

local Toggle15 = Section2:CreateToggle("Rainbow Mode", false, function (bool)
    checkBool = bool
    rainbowColor.rainbowBool = bool

if checkBool == false then  
    espsettings.BoxColor = Color3.fromRGB(255,255,255)
    espsettings.BoxOutlineColor = Color3.fromRGB(255,255,255)
    espsettings.HeadDotColor = Color3.fromRGB(255,255,255)
    chamsettings.Color = Color3.fromRGB(255,255,255)
end

local R = 0
local G = 0
local B = 0

repeat wait(2.0)

    R = R + 70

    repeat wait(0.1)
        R = R + 5
        espsettings.BoxColor = Color3.fromRGB(R,G,B)
        espsettings.BoxOutlineColor = Color3.fromRGB(R,G,B)
        rainbowColor.rainbow = Color3.fromRGB(R,G,B)
        espsettings.HeadDotColor = Color3.fromRGB(R,G,B)
        chamsettings.Color = Color3.fromRGB(R,G,B)
    until  R == 255 or checkBool == false

    if (R == 255) then
        
        repeat wait(0.1)
            G = G + 5
            espsettings.BoxColor = Color3.fromRGB(R,G,B)
            espsettings.BoxOutlineColor = Color3.fromRGB(R,G,B)
            rainbowColor.rainbow = Color3.fromRGB(R,G,B)
            espsettings.HeadDotColor = Color3.fromRGB(R,G,B)
            chamsettings.Color = Color3.fromRGB(R,G,B)
        until G == 255 or checkBool == false

    end

    if (R == 255 and G == 255) then
        
        repeat wait(0.1)
            R = R - 5
            espsettings.BoxColor = Color3.fromRGB(R,G,B)
            espsettings.BoxOutlineColor = Color3.fromRGB(R,G,B)
            rainbowColor.rainbow = Color3.fromRGB(R,G,B)
            espsettings.HeadDotColor = Color3.fromRGB(R,G,B)
            chamsettings.Color = Color3.fromRGB(R,G,B)
        until R == 0 or checkBool == false
    end

    if (R == 0 and G == 255) then
        
        repeat wait(0.1)
            B = B + 5
            espsettings.BoxColor = Color3.fromRGB(R,G,B)
            espsettings.BoxOutlineColor = Color3.fromRGB(R,G,B)
            rainbowColor.rainbow = Color3.fromRGB(R,G,B)
            espsettings.HeadDotColor = Color3.fromRGB(R,G,B)
            chamsettings.Color = Color3.fromRGB(R,G,B)
        until B == 255 or checkBool == false

    end

    if (G == 255 and B == 255) then
        
        repeat wait(0.1)
            G = G - 5
            espsettings.BoxColor = Color3.fromRGB(R,G,B)
            espsettings.BoxOutlineColor = Color3.fromRGB(R,G,B)
            rainbowColor.rainbow = Color3.fromRGB(R,G,B)
            espsettings.HeadDotColor = Color3.fromRGB(R,G,B)
            chamsettings.Color = Color3.fromRGB(R,G,B)
        until G == 0 or checkBool == false
    end

    if (R == 0 and G == 0 and B == 255) then

        repeat wait(0.1)
            R = R + 5
            espsettings.BoxColor = Color3.fromRGB(R,G,B)
            espsettings.BoxOutlineColor = Color3.fromRGB(R,G,B)
            rainbowColor.rainbow = Color3.fromRGB(R,G,B)
            espsettings.HeadDotColor = Color3.fromRGB(R,G,B)
            chamsettings.Color = Color3.fromRGB(R,G,B)
        until R == 255 or checkBool == false

    end

    if (R == 255 and G == 0 and B == 255) then
        
        repeat wait(0.1)
            B = B - 5
            espsettings.BoxColor = Color3.fromRGB(R,G,B)
            espsettings.BoxOutlineColor = Color3.fromRGB(R,G,B)
            rainbowColor.rainbow = Color3.fromRGB(R,G,B)
            espsettings.HeadDotColor = Color3.fromRGB(R,G,B)
            chamsettings.Color = Color3.fromRGB(R,G,B)
        until B == 0 or checkBool == false

    end

    if (R == 255) then
        
        repeat wait(0.1)
            R = R - 5
            espsettings.BoxColor = Color3.fromRGB(R,G,B)
            espsettings.BoxOutlineColor = Color3.fromRGB(R,G,B)
            rainbowColor.rainbow = Color3.fromRGB(R,G,B)
            espsettings.HeadDotColor = Color3.fromRGB(R,G,B)
            chamsettings.Color = Color3.fromRGB(R,G,B)
        until R == 70 or checkBool == false
        
    end

until (checkBool == false)

if checkBool == false then  
    espsettings.BoxColor = Color3.fromRGB(255,255,255)
    espsettings.BoxOutlineColor = Color3.fromRGB(255,255,255)
    espsettings.HeadDotColor = Color3.fromRGB(255,255,255)
    chamsettings.Color = Color3.fromRGB(255,255,255)
end

end)

repeat wait()

    while wait() do

        local Ammo = workspace[game.Players.LocalPlayer.Name][gunMods.PrimaryGun]["ACS_Modulo"].Variaveis.Ammo.Value
        local Health = workspace[game.Players.LocalPlayer.Name].Humanoid.Health

        plrAmmo.Visible = true
        plrAmmo.Center = false
        plrAmmo.Outline = true
        plrAmmo.Font = 1
        plrAmmo.Size = 25
        plrAmmo.Color = Color3.new(1,1,1) --> or any color, using FromRGB
        plrAmmo.Text = tostring("Ammo: " .. Ammo)
        plrAmmo.Position = Vector2.new(50, 800)

        plrHealth.Visible = true
        plrHealth.Center = false
        plrHealth.Outline = true
        plrHealth.Font = 1
        plrHealth.Size = 25
        plrHealth.Color = Color3.new(1,1,1) --> or any color, using FromRGB
        plrHealth.Text = tostring("Health: " .. Health)
        plrHealth.Position = Vector2.new(50, 770)

    end

until showPlrInfo == false
