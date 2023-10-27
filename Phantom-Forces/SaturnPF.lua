local http_service = game:GetService("HttpService");
local main_actor;

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

assert(getactors()[1], "phantom forces changed.")
main_actor = getactors()[1];

if not syn then LocalPlayer:Kick() end

function client_start()

    syn.run_on_actor(main_actor, [[


    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ActuallyHex/BruhWareBadBuisness/main/temp_folder/another_one/source.lua"))()
    
    local UserInputService = game:GetService("UserInputService")

    local watermark = library:Watermark(".")

    local main = library:Load{
        Name = "saturn.wtf - phantom forces",
        SizeX = 610,
        SizeY = 700,
        Theme = "Default",
        Extension = "json", -- config file extension
        Folder = "saturnwtf-pf" -- config folder name
    }

    local visual_options = {
        boxes = false, 
        healthbar = false, 
        distance = false, 
        nametags = false, 
        snaplines = false, 
        chams = false, 
        occluded_chams = false,
        brightness = 1, 
        contrast = 1, 
        saturation = 1, 
        bloom = false, 
        bloom_intensity = 1, 
        bloom_size = 1, 
        bloom_threshold = 1, 
        fill_transparency = 50, 
        outline_transparency = 50, 
        distance_num = 1500, 
        snapline_start = "", 
        snapline_end = "", 
        no_sway = false, 
        no_shake = false, 
        gun_chams = false, 
        arm_chams = false, 
        gun_material = "Plastic", 
        arm_material = "Plastic",
        color_correction = false,
        oov_arrow = false,
        bullet_tracers = false,
        vis_check_esp = false,
        oov_arrow_fov = 15,
        force_time = false,
        force_time_time = 0,
        dead_body_chams = false,
        dead_body_chams_material = "Plastic",
        local_player_viewmodel = false,
        viewmodel_x = 0,
        viewmodel_y = 0,
        viewmodel_z = 0,
        viewmodel_pitch = 0,
        viewmodel_yaw = 0,
        viewmodel_roll = 0,
    }
    
    local color_options = {
        boxes = Color3.fromRGB(255, 255, 255), 
        healthbar = Color3.fromRGB(255, 255, 255), 
        distance = Color3.fromRGB(255, 255, 255), 
        nametags = Color3.fromRGB(255, 255, 255), 
        snaplines = Color3.fromRGB(255, 255, 255), 
        chams_fill = Color3.fromRGB(255, 255, 255), 
        chams_outline = Color3.fromRGB(255, 255, 255), 
        gun_chams = Color3.fromRGB(255, 255, 255), 
        arm_chams = Color3.fromRGB(255, 255, 255),
        color_correction = nil,
        oov_arrow = Color3.fromRGB(255, 255, 255),
        bullet_tracers = Color3.fromRGB(255, 255, 255),
        vis_check_color = Color3.fromRGB(255, 255, 255),
        dead_body_chams_color = Color3.fromRGB(255, 255, 255),
    }
    
    local aimbot_options = {
        aimbot = false,
        aim_part = {}, 
        vis_check = false, 
        prediction = false, 
        show_aimbot_fov = false, 
        dynamic_fov = false, 
        aimbot_fov = 250, 
        horizontal_smoothing = 0, 
        vertical_smoothing = 0, 
        aimbot_hitchance = 100,
        aiming = false,
        key = nil,
        distance = 1500,
        aimbot_fov_num_sides = 80,
        randomization = 0,
    }
    
    local silent_aim_options = {
        silent_aim = false, 
        aim_part = {}, 
        vis_check = false, 
        show_silent_fov = false, 
        dynamic_fov = false, 
        silent_fov = 100, 
        silent_hitchance = 100,
        silent_fov_num_sides = 80,
    }

    local misc_options = {
        hitsound = false, 
        hitsound_sound = "", 
        custom_hitsound = "",
        hitsound_volume = 3,
        skybox = false,
        skybox_option = nil,
        primary = nil,
        secondary = nil,
        melee = nil,
        custom_beam_texture = "",
    }

    local expected_primary = nil
    local expected_secondary = nil
    local expected_melee = nil
    
    local aim_assist = main:Tab("aim assist")
    local visual = main:Tab("visuals")
    local misc = main:Tab("misc")
    
    -- Aim Assist
    local aimbot = aim_assist:Section{
        Name = "aimbot",
        Side = "Left"
    }
    
    local aimbot_check = aimbot:Toggle{
        Name = "aimbot",
        Flag = "aimbot",
        Callback  = function(bool)
            aimbot_options.aimbot = bool
        end
    }
    
    aimbot_check:Keybind{Default = Enum.UserInputType.MouseButton2, Flag = "Aimbot Keybind", Mode = "nil", Callback = function (key, fromsetting)
        local key = tostring(key):gsub("Enum.UserInputType.","")
        aimbot_options.key = key
    end}
    
    local vis_check_aimbot = aimbot:Toggle{
        Name = "visible check",
        Flag = "vis_check_aimbot",
        Callback  = function(bool)
            aimbot_options.vis_check = bool
        end
    }
    
    local show_aimbot_fov = aimbot:Toggle{
        Name = "show aimbot fov",
        Flag = "show_aimbot_fov",
        Callback  = function(bool)
            aimbot_options.show_aimbot_fov = bool
        end
    }
    
    local aimbot_prediction = aimbot:Toggle{
        Name = "aimbot prediction",
        Flag = "aimbot_prediction",
        Callback  = function(bool)
            aimbot_options.prediction = bool
        end
    }
    
    local dynamic_aimbot_fov = aimbot:Toggle{
        Name = "dynamic aimbot fov",
        Flag = "dynamic_aimbot_fov",
        Callback  = function(bool)
            aimbot_options.dynamic_fov = bool
        end
    }
    
    local aimbot_aim_part = aimbot:Dropdown{
        Name = "aimbot aim part",
        Max = 6,
        Default = "Head",
        Content = {
            "Head",
            "Torso",
            "Left Arm",
            "Right Arm",
            "Left Leg",
            "Right Leg",
        },
        Flag = "aimbot_aim_part",
        Callback = function(option)
            aimbot_options.aim_part = option
        end
    }

    aimbot_aim_part:Set("Head")
    
    local aimbot_fov = aimbot:Slider{
        Name = "aimbot fov",
        Text = "[value]",
        Default = 150,
        Min = 0,
        Max = 500,
        Float = 0.1,
        Flag = "aimbot_fov",
        Callback = function(value)
            aimbot_options.aimbot_fov = value
        end
    }
    
    local horizontal_smoothing = aimbot:Slider{
        Name = "horizontal smoothing",
        Text = "[value]%",
        Default = 0,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "horizontal_smoothing",
        Callback = function(value)
            aimbot_options.horizontal_smoothing = value
        end
    }
    
    local vertical_smoothing = aimbot:Slider{
        Name = "vertical smoothing",
        Text = "[value]%",
        Default = 0,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "vertical_smoothing",
        Callback = function(value)
            aimbot_options.vertical_smoothing = value
        end
    }
    
    local aimbot_hitchance = aimbot:Slider{
        Name = "aimbot hit chance",
        Text = "[value]%",
        Default = 100,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "aimbot_hitchance",
        Callback = function(value)
            aimbot_options.aimbot_hitchance = value
        end
    }

    local aimbot_randomization = aimbot:Slider{
        Name = "randomization",
        Text = "[value]%",
        Default = 100,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "aimbot_randomization",
        Callback = function(value)
            aimbot_options.randomization = value
        end
    }

    local aimbot_distance = aimbot:Slider{
        Name = "aimbot distance",
        Text = "[value]",
        Default = 1500,
        Min = 0,
        Max = 2500,
        Float = 1,
        Flag = "aimbot_distance",
        Callback = function(value)
            aimbot_options.distance = value
        end
    }
    
    local aimbot_fov_num_sides = aimbot:Slider{
        Name = "fov circle sides",
        Text = "[value]",
        Default = 80,
        Min = 3,
        Max = 80,
        Float = 1,
        Flag = "aimbot_fov_num_sides",
        Callback = function(value)
            aimbot_options.aimbot_fov_num_sides = value
        end
    }

    
    local silent_aim = aim_assist:Section{
        Name = "silent aim",
        Side = "Right"
    }
    
    local silent_check = silent_aim:Toggle{
        Name = "silent aim",
        Flag = "silent_aim",
        Callback  = function(bool)
            silent_aim_options.silent_aim = bool
        end
    }
    
    local silent_vis_check = silent_aim:Toggle{
        Name = "silent visible check",
        Flag = "silent_vis_check",
        Callback  = function(bool)
            silent_aim_options.vis_check = bool
        end
    }
    
    local show_silent_fov = silent_aim:Toggle{
        Name = "show silent aim fov",
        Flag = "show_silent_fov",
        Callback  = function(bool)
            silent_aim_options.show_silent_fov = bool
        end
    }

    --local silent_aim_dynamic_fov = silent_aim:Toggle{
    --    Name = "dynamic silent aim fov",
    --    Flag = "silent_aim_dynamic_fov",
    --    Callback  = function(bool)
    --        silent_aim_options.dynamic_fov = bool
    --    end
    --}

    local silent_aim_part = silent_aim:Dropdown{
        Name = "silent aim part",
        Default = "Head",
        Max = 6,
        Content = {
            "Head",
            "Torso",
            "Left Arm",
            "Right Arm",
            "Left Leg",
            "Right Leg",
        },
        Flag = "silent_aim_part",
        Callback = function(option)
            silent_aim_options.aim_part = option
        end
    }

    local silent_aim_fov = silent_aim:Slider{
        Name = "silent aim fov",
        Text = "[value]",
        Default = 150,
        Min = 0,
        Max = 500,
        Float = 0.1,
        Flag = "silent_aim_fov",
        Callback = function(value)
            silent_aim_options.silent_fov = value
        end
    }
    
    local silent_aim_hit_chance = silent_aim:Slider{
        Name = "silent aim hit chance",
        Text = "[value]%",
        Default = 100,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "silent_aim_hit_chance",
        Callback = function(value)
            silent_aim_options.silent_hitchance = value
        end
    }
    
    local silent_fov_num_sides = silent_aim:Slider{
        Name = "fov circle sides",
        Text = "[value]",
        Default = 80,
        Min = 3,
        Max = 80,
        Float = 1,
        Flag = "silent_fov_num_sides",
        Callback = function(value)
            silent_aim_options.silent_fov_num_sides = value
        end
    }

    -- Visuals
    local player_esp = visual:Section{
        Name = "player esp",
        Side = "Left"
    }
    
    local boxes = player_esp:Toggle{
        Name = "boxes",
        Flag = "boxes",
        Callback  = function(bool)
            visual_options.boxes = bool
        end
    }
    
    local boxes_color_picker = boxes:ColorPicker{
        Default = Color3.fromRGB(255, 255, 255), 
        Flag = "boxes_color_picker", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.boxes = Color3.fromRGB(r, g, b)
        end
    }
    
    local healthbar = player_esp:Toggle{
        Name = "health bar",
        Flag = "healthbar",
        Callback  = function(bool)
            visual_options.healthbar = bool
        end
    }
    
    local healthbar_color_picker = healthbar:ColorPicker{
        Default = Color3.fromRGB(255, 255, 255), 
        Flag = "healthbar_color_picker", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.healthbar = Color3.fromRGB(r, g, b)
        end
    }
    
    
    local nametags = player_esp:Toggle{
        Name = "nametags",
        Flag = "nametags",
        Callback  = function(bool)
            visual_options.nametags = bool
        end
    }
    
    local nametags_color_picker = nametags:ColorPicker{
        Default = Color3.fromRGB(255, 255, 255), 
        Flag = "nametags_color_picker", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.nametags = Color3.fromRGB(r, g, b)
        end
    }
    
    local distance = player_esp:Toggle{
        Name = "distance",
        Flag = "distance",
        Callback  = function(bool)
            visual_options.distance = bool
        end
    }
    
    local distance_color_picker = distance:ColorPicker{
        Default = Color3.fromRGB(255, 255, 255), 
        Flag = "distance_color_picker", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255)
    
            color_options.distance = Color3.fromRGB(r, g, b)
    
        end
    }
    
    
    local snaplines = player_esp:Toggle{
        Name = "snaplines",
        Flag = "snaplines",
        Callback  = function(bool)
            visual_options.snaplines = bool
        end
    }
    
    local snaplines_color_picker = snaplines:ColorPicker{
        Default = Color3.fromRGB(255, 255, 255), 
        Flag = "snaplines_color_picker", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.snaplines = Color3.fromRGB(r, g, b)
        end
    }
    
    local oov_arrow = player_esp:Toggle{
        Name = "oov arrows",
        Flag = "oov_arrow",
        Callback  = function(bool)
            visual_options.oov_arrow = bool
        end
    }
    
    local oov_arrow_color_picker = oov_arrow:ColorPicker{
        Default = Color3.fromRGB(255, 255, 255), 
        Flag = "oov_arrow_color_picker", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.oov_arrow = Color3.fromRGB(r, g, b)
    
        end
    }
    
    
    local seperator = player_esp:Separator("player chams")
    
    local chams = player_esp:Toggle{
        Name = "chams",
        Flag = "chams",
        Callback  = function(bool)
            visual_options.chams = bool
        end
    }
    
    
    local occluded = player_esp:Toggle{
        Name = "occluded",
        Flag = "occluded",
        Callback  = function(bool)
            visual_options.occluded_chams = bool
        end
    }
    
    local fill_color_label = player_esp:ColorPicker{
        Name = "fill color",
        Default = Color3.new(255, 0, 0), 
        Flag = "fill_color", 
        Callback = function(color)
            
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 

            color_options.chams_fill = Color3.fromRGB(r, g, b)
            
        end
    }
    
    local outline_color_label = player_esp:ColorPicker{
        Name = "outline color",
        Default = Color3.new(255, 255, 255), 
        Flag = "outline_color", 
        Callback = function(color)
            
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.chams_outline = Color3.fromRGB(r, g, b)
    
        end
    }
    
    local fill_transparency = player_esp:Slider{
        Name = "fill transparency",
        Text = "[value]%",
        Default = 50,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "fill_transparency",
        Callback = function(value)
            visual_options.fill_transparency = value
        end
    }
    
    local outline_transparency = player_esp:Slider{
        Name = "outline transparency",
        Text = "[value]%",
        Default = 50,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "outline_transparency",
        Callback = function(value)
            visual_options.outline_transparency = value
        end
    }
    
    local esp_settings = visual:Section{
        Name = "esp settings",
        Side = "Right"
    }
    
    local esp_distance = esp_settings:Slider{
        Name = "esp distance",
        Text = "[value]%",
        Default = 1500,
        Min = 0,
        Max = 2500,
        Float = 1,
        Flag = "esp_distance",
        Callback = function(value)
    
        end
    }

    local snapline_start_position = esp_settings:Dropdown{
        Name = "snapline start position",
        Default = "top",
        Content = {
            "top",
            "middle",
            "bottom"
        },
        Flag = "snapline_start_position",
        Callback = function(option)
    
        end
    }
    
    local snapline_end_position = esp_settings:Dropdown{
        Name = "snapline end position",
        Default = "head",
        Content = {
            "head",
            "torso",
            "legs"
        },
        Flag = "snapline_end_position",
        Callback = function(option)
    
        end
    }
    
    local esp_vis_check = esp_settings:Toggle{
        Name = "vis check esp",
        Flag = "vis_check_esp",
        Callback  = function(bool)
            visual_options.vis_check_esp = bool
        end
    }
    
    local vis_check_color = esp_vis_check:ColorPicker{
        Default = Color3.new(255, 255, 255), 
        Flag = "Toggle 1 Picker 1", 
        Callback = function(color)
            
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.vis_check_color = Color3.fromRGB(r, g, b)
    
        end
    }
    
    local oov_arrow_fov = esp_settings:Slider{
        Name = "oov arrow fov",
        Text = "[value]",
        Default = 50,
        Min = 10,
        Max = 101,
        Float = 1,
        Flag = "oov_arrow_fov",
        Callback = function(value)
            visual_options.oov_arrow_fov = value
        end
    }

    local local_player = visual:Section{
        Name = "local player",
        Side = "Left"
    }
    
    local no_sway = local_player:Toggle{
        Name = "no sway",
        Flag = "no_sway",
        Callback  = function(bool)
            visual_options.no_sway = bool
        end
    }
    
    local no_shake = local_player:Toggle{
        Name = "no shake",
        Flag = "no_shake",
        Callback  = function(bool)
            visual_options.no_shake = bool
        end
    }
    
    local arm_chams = local_player:Toggle{
        Name = "arm chams",
        Flag = "arm_chams",
        Callback  = function(bool)
            visual_options.arm_chams = bool
        end
    }
    
    local arm_chams_color = arm_chams:ColorPicker{
        Default = Color3.new(255, 255, 255), 
        Flag = "arm_chams_color", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.arm_chams = Color3.fromRGB(r, g, b)
    
        end
    }
    
    local arm_chams_material = local_player:Dropdown{
        Name = "arm chams material",
        Default = "Plastic",
        Content = {
            "Plastic",
            "Neon",
            "ForceField",
            "Glass",
            "Foil"
        },
        Flag = "arm_chams_material",
        Callback = function(option)
            visual_options.arm_chams_material = option
        end
    }
    
    local gun_chams = local_player:Toggle{
        Name = "gun chams",
        Flag = "gun_chams",
        Callback  = function(bool)
            visual_options.gun_chams = bool
        end
    }
    
    local gun_chams_color = gun_chams:ColorPicker{
        Default = Color3.new(255, 255, 255), 
        Flag = "gun_chams_color", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.gun_chams = Color3.fromRGB(r, g, b)
    
        end
    }
    
    local gun_chams_material = local_player:Dropdown{
        Name = "gun chams material",
        Default = "Plastic",
        Content = {
            "Plastic",
            "Neon",
            "ForceField",
            "Glass",
            "Foil"
        },
        Flag = "gun_chams_material",
        Callback = function(option)
            visual_options.gun_chams_material = option
        end
    }
    
    local bullet_tracers = local_player:Toggle{
        Name = "bullet tracers",
        Flag = "bullet_tracers",
        Callback  = function(bool)
            visual_options.bullet_tracers = bool
        end
    }
    
    local bullet_tracers_color = bullet_tracers:ColorPicker{
        Default = Color3.new(255, 255, 255), 
        Flag = "bullet_tracers_color", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.bullet_tracers = Color3.fromRGB(r, g, b)
    
        end
    }

    local custom_beam_texture = local_player:Box{
        Name = "custom beam texture",
        --Default = "hi",
        Placeholder = "custom texture id here",
        Flag = "custom_beam_texture",
        Callback = function(text)

            print(text)

            if text ~= "" then
                misc_options.custom_beam_texture = text
            end

        end
    }

    local localplayer_viewmodel_section = visual:Section{
        Name = "local player viewmodel",
        Side = "Left"
    }

    local local_player_viewmodel = localplayer_viewmodel_section:Toggle{
        Name = "local player viewmodel",
        Flag = "local_player_viewmodel",
        Callback  = function(bool)
            -- visual_options.gun_chams = bool
            visual_options.local_player_viewmodel = bool
        end
    }

    local viewmodel_pos_x = localplayer_viewmodel_section:Slider{
        Name = "viewmodel position x",
        Text = "[value]",
        Default = 0,
        Min = -180,
        Max = 180,
        Float = 1,
        Flag = "viewmodel_pos_x",
        Callback = function(value)
            -- visual_options.oov_arrow_fov = value
            visual_options.viewmodel_x = value
        end
    }

    local viewmodel_pos_y = localplayer_viewmodel_section:Slider{
        Name = "viewmodel position y",
        Text = "[value]",
        Default = 0,
        Min = -180,
        Max = 180,
        Float = 1,
        Flag = "viewmodel_pos_y",
        Callback = function(value)
            -- visual_options.oov_arrow_fov = value
            visual_options.viewmodel_y = value
        end
    }

    local viewmodel_pos_z = localplayer_viewmodel_section:Slider{
        Name = "viewmodel position z",
        Text = "[value]",
        Default = 0,
        Min = -180,
        Max = 180,
        Float = 1,
        Flag = "viewmodel_pos_z",
        Callback = function(value)
            -- visual_options.oov_arrow_fov = value
            visual_options.viewmodel_z = value
        end
    }

    local viewmodel_pitch = localplayer_viewmodel_section:Slider{
        Name = "viewmodel pitch",
        Text = "[value]",
        Default = 0,
        Min = -180,
        Max = 180,
        Float = 1,
        Flag = "viewmodel_pitch",
        Callback = function(value)
            -- visual_options.oov_arrow_fov = value
            visual_options.viewmodel_pitch = value
        end
    }

    local viewmodel_yaw = localplayer_viewmodel_section:Slider{
        Name = "viewmodel yaw",
        Text = "[value]",
        Default = 0,
        Min = -180,
        Max = 180,
        Float = 1,
        Flag = "viewmodel_yaw",
        Callback = function(value)
            -- visual_options.oov_arrow_fov = value
            visual_options.viewmodel_yaw = value
        end
    }

    local viewmodel_roll = localplayer_viewmodel_section:Slider{
        Name = "viewmodel roll",
        Text = "[value]",
        Default = 0,
        Min = -180,
        Max = 180,
        Float = 1,
        Flag = "viewmodel_roll",
        Callback = function(value)
            -- visual_options.oov_arrow_fov = value
            visual_options.viewmodel_roll = value
        end
    }
    
    local world = visual:Section{
        Name = "world",
        Side = "Right"
    }

    local color_correction_toggle = world:Toggle{
        Name = "color correction",
        Flag = "color_correction_toggle",
        Callback  = function(bool)
            visual_options.color_correction = bool
        end
    }

    local color_correction_color = color_correction_toggle:ColorPicker{
        Default = Color3.new(255, 255, 255), 
        Flag = "color_correction_color", 
        Callback = function(color)
           
            local r = math.round(color.R * 255) 
            local g = math.round(color.G * 255) 
            local b = math.round(color.B * 255) 
    
            color_options.color_correction = Color3.fromRGB(r, g, b)
    
        end
    }

    local brightness = world:Slider{
        Name = "brightness",
        Text = "[value]",
        Default = 0,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "brightness",
        Callback = function(value)
            visual_options.brightness = value
        end
    }

    local contrast = world:Slider{
        Name = "contrast",
        Text = "[value]",
        Default = 0,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "contrast",
        Callback = function(value)
            visual_options.contrast = value
        end
    }

    local saturation = world:Slider{
        Name = "saturation",
        Text = "[value]",
        Default = 0,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "saturation",
        Callback = function(value)
            visual_options.saturation = value
        end
    }

    local bloom = world:Toggle{
        Name = "bloom",
        Flag = "bloom",
        Callback  = function(bool)
            visual_options.bloom = bool
        end
    }

    local bloom_intensity = world:Slider{
        Name = "bloom intensity",
        Text = "[value]",
        Default = 0,
        Min = 0,
        Max = 100,
        Float = 1,
        Flag = "bloom_intensity",
        Callback = function(value)
            visual_options.bloom_intensity = value
        end
    }
    
    local bloom_size = world:Slider{
        Name = "bloom size",
        Text = "[value]",
        Default = 0,
        Min = 0,
        Max = 56,
        Float = 1,
        Flag = "bloom_size",
        Callback = function(value)
            visual_options.bloom_size = value
        end
    }
    
    local bloom_threshold = world:Slider{
        Name = "bloom threshold",
        Text = "[value]",
        Default = 0,
        Min = 0,
        Max = 40,
        Float = 1,
        Flag = "bloom_threshold",
        Callback = function(value)
            visual_options.bloom_threshold = value
        end
    }

    local force_time = world:Toggle{
        Name = "force time",
        Flag = "force_time",
        Callback  = function(bool)
            visual_options.force_time = bool
        end
    }

    local force_time_time = world:Slider{
        Name = "force time",
        Text = "[value]hr",
        Default = 0,
        Min = 0,
        Max = 24,
        Float = 0.1,
        Flag = "force_time_time",
        Callback = function(value)
            visual_options.force_time_time = value
        end
    }

    local skybox = world:Toggle{
        Name = "skybox",
        Flag = "skybox",
        Callback  = function(bool)
            misc_options.skybox = bool
        end
    }

    local skybox_options = world:Dropdown{
        Name = "skybox options",
        Default = "Starry Evening",
        Content = {
            "Starry Evening", 
            "Christmas", 
            "Space", 
            "Nebula", 
            "Vaporwave",
        },
        Flag = "skybox_option",
        Callback = function(option)

            local sky = game:GetService("Lighting")

            -- option

            if misc_options.skybox then

                local skyboxTest = pcall(function ()
                    
                    print("pcall skybox working!")
                    
                    if sky.SkyBox ~= nil then

                        if option == "Starry Evening" then
                            
                            sky.SkyBox.SkyboxBk = "rbxassetid://5260808177"
                            sky.SkyBox.SkyboxDn = "rbxassetid://5260653793"
                            sky.SkyBox.SkyboxFt = "rbxassetid://5260817288"
                            sky.SkyBox.SkyboxLf = "rbxassetid://5260800833"
                            sky.SkyBox.SkyboxRt = "rbxassetid://5260811073"
                            sky.SkyBox.SkyboxUp = "rbxassetid://5260824661"

                        elseif option == "Christmas" then

                            sky.SkyBox.SkyboxBk = "rbxassetid://8139677359"
                            sky.SkyBox.SkyboxDn = "rbxassetid://8139677253"
                            sky.SkyBox.SkyboxFt = "rbxassetid://8139677111"
                            sky.SkyBox.SkyboxLf = "rbxassetid://8139676988"
                            sky.SkyBox.SkyboxRt = "rbxassetid://8139676842"
                            sky.SkyBox.SkyboxUp = "rbxassetid://8139676647"

                        elseif option == "Space" then

                            sky.SkyBox.SkyboxBk = "rbxassetid://168387023"
                            sky.SkyBox.SkyboxDn = "rbxassetid://168387089"
                            sky.SkyBox.SkyboxFt = "rbxassetid://168387054"
                            sky.SkyBox.SkyboxLf = "rbxassetid://168534432"
                            sky.SkyBox.SkyboxRt = "rbxassetid://168387190"
                            sky.SkyBox.SkyboxUp = "rbxassetid://168387135"

                        elseif option == "Nebula" then

                            sky.SkyBox.SkyboxBk = "rbxassetid://159454299"
                            sky.SkyBox.SkyboxDn = "rbxassetid://159454296"
                            sky.SkyBox.SkyboxFt = "rbxassetid://159454293"
                            sky.SkyBox.SkyboxLf = "rbxassetid://159454286"
                            sky.SkyBox.SkyboxRt = "rbxassetid://159454300"
                            sky.SkyBox.SkyboxUp = "rbxassetid://159454288"

                        elseif option == "Vaporwave" then

                            sky.SkyBox.SkyboxBk = "rbxassetid://8631780182"
                            sky.SkyBox.SkyboxDn = "rbxassetid://8631784904"
                            sky.SkyBox.SkyboxFt = "rbxassetid://8631769834"
                            sky.SkyBox.SkyboxLf = "rbxassetid://8631777199"
                            sky.SkyBox.SkyboxRt = "rbxassetid://8631735555"
                            sky.SkyBox.SkyboxUp = "rbxassetid://8631782345"

                        end

                    end
                
                end)

                local cloudTest = pcall(function ()
        
                    if sky.Cloudy ~= nil then
                        
                        print("pcall Cloudy working!")

                        if option == "Starry Evening" then
                            
                            sky.Cloudy.SkyboxBk = "rbxassetid://5260808177"
                            sky.Cloudy.SkyboxDn = "rbxassetid://5260653793"
                            sky.Cloudy.SkyboxFt = "rbxassetid://5260817288"
                            sky.Cloudy.SkyboxLf = "rbxassetid://5260800833"
                            sky.Cloudy.SkyboxRt = "rbxassetid://5260811073"
                            sky.Cloudy.SkyboxUp = "rbxassetid://5260824661"

                        elseif option == "Christmas" then

                            sky.Cloudy.SkyboxBk = "rbxassetid://8139677359"
                            sky.Cloudy.SkyboxDn = "rbxassetid://8139677253"
                            sky.Cloudy.SkyboxFt = "rbxassetid://8139677111"
                            sky.Cloudy.SkyboxLf = "rbxassetid://8139676988"
                            sky.Cloudy.SkyboxRt = "rbxassetid://8139676842"
                            sky.Cloudy.SkyboxUp = "rbxassetid://8139676647"

                        elseif option == "Space" then

                            sky.Cloudy.SkyboxBk = "rbxassetid://168387023"
                            sky.Cloudy.SkyboxDn = "rbxassetid://168387089"
                            sky.Cloudy.SkyboxFt = "rbxassetid://168387054"
                            sky.Cloudy.SkyboxLf = "rbxassetid://168534432"
                            sky.Cloudy.SkyboxRt = "rbxassetid://168387190"
                            sky.Cloudy.SkyboxUp = "rbxassetid://168387135"

                        elseif option == "Nebula" then

                            sky.Cloudy.SkyboxBk = "rbxassetid://159454299"
                            sky.Cloudy.SkyboxDn = "rbxassetid://159454296"
                            sky.Cloudy.SkyboxFt = "rbxassetid://159454293"
                            sky.Cloudy.SkyboxLf = "rbxassetid://159454286"
                            sky.Cloudy.SkyboxRt = "rbxassetid://159454300"
                            sky.Cloudy.SkyboxUp = "rbxassetid://159454288"

                        elseif option == "Vaporwave" then

                            sky.Cloudy.SkyboxBk = "rbxassetid://8631780182"
                            sky.Cloudy.SkyboxDn = "rbxassetid://8631784904"
                            sky.Cloudy.SkyboxFt = "rbxassetid://8631769834"
                            sky.Cloudy.SkyboxLf = "rbxassetid://8631777199"
                            sky.Cloudy.SkyboxRt = "rbxassetid://8631735555"
                            sky.Cloudy.SkyboxUp = "rbxassetid://8631782345"

                        end


                    end
                    
                end)
                    
                local skyTest = pcall(function ()
                
                    if sky.Sky ~= nil then
                        
                        if option == "Starry Evening" then
                            
                            sky.Sky.SkyboxBk = "rbxassetid://5260808177"
                            sky.Sky.SkyboxDn = "rbxassetid://5260653793"
                            sky.Sky.SkyboxFt = "rbxassetid://5260817288"
                            sky.Sky.SkyboxLf = "rbxassetid://5260800833"
                            sky.Sky.SkyboxRt = "rbxassetid://5260811073"
                            sky.Sky.SkyboxUp = "rbxassetid://5260824661"

                        elseif option == "Christmas" then

                            sky.Sky.SkyboxBk = "rbxassetid://8139677359"
                            sky.Sky.SkyboxDn = "rbxassetid://8139677253"
                            sky.Sky.SkyboxFt = "rbxassetid://8139677111"
                            sky.Sky.SkyboxLf = "rbxassetid://8139676988"
                            sky.Sky.SkyboxRt = "rbxassetid://8139676842"
                            sky.Sky.SkyboxUp = "rbxassetid://8139676647"

                        elseif option == "Space" then

                            sky.Sky.SkyboxBk = "rbxassetid://168387023"
                            sky.Sky.SkyboxDn = "rbxassetid://168387089"
                            sky.Sky.SkyboxFt = "rbxassetid://168387054"
                            sky.Sky.SkyboxLf = "rbxassetid://168534432"
                            sky.Sky.SkyboxRt = "rbxassetid://168387190"
                            sky.Sky.SkyboxUp = "rbxassetid://168387135"

                        elseif option == "Nebula" then

                            sky.Sky.SkyboxBk = "rbxassetid://159454299"
                            sky.Sky.SkyboxDn = "rbxassetid://159454296"
                            sky.Sky.SkyboxFt = "rbxassetid://159454293"
                            sky.Sky.SkyboxLf = "rbxassetid://159454286"
                            sky.Sky.SkyboxRt = "rbxassetid://159454300"
                            sky.Sky.SkyboxUp = "rbxassetid://159454288"

                        elseif option == "Vaporwave" then

                            sky.Sky.SkyboxBk = "rbxassetid://8631780182"
                            sky.Sky.SkyboxDn = "rbxassetid://8631784904"
                            sky.Sky.SkyboxFt = "rbxassetid://8631769834"
                            sky.Sky.SkyboxLf = "rbxassetid://8631777199"
                            sky.Sky.SkyboxRt = "rbxassetid://8631735555"
                            sky.Sky.SkyboxUp = "rbxassetid://8631782345"

                        end

                    end
                
                end)
                    
                local desertTest = pcall(function ()
                
                    if sky["Desert Skybox"] ~= nil then

                        if option == "Starry Evening" then
                            
                            sky["Desert Skybox"].SkyboxBk = "rbxassetid://5260808177"
                            sky["Desert Skybox"].SkyboxDn = "rbxassetid://5260653793"
                            sky["Desert Skybox"].SkyboxFt = "rbxassetid://5260817288"
                            sky["Desert Skybox"].SkyboxLf = "rbxassetid://5260800833"
                            sky["Desert Skybox"].SkyboxRt = "rbxassetid://5260811073"
                            sky["Desert Skybox"].SkyboxUp = "rbxassetid://5260824661"

                        elseif option == "Christmas" then

                            sky["Desert Skybox"].SkyboxBk = "rbxassetid://8139677359"
                            sky["Desert Skybox"].SkyboxDn = "rbxassetid://8139677253"
                            sky["Desert Skybox"].SkyboxFt = "rbxassetid://8139677111"
                            sky["Desert Skybox"].SkyboxLf = "rbxassetid://8139676988"
                            sky["Desert Skybox"].SkyboxRt = "rbxassetid://8139676842"
                            sky["Desert Skybox"].SkyboxUp = "rbxassetid://8139676647"

                        elseif option == "Space" then

                            sky["Desert Skybox"].SkyboxBk = "rbxassetid://168387023"
                            sky["Desert Skybox"].SkyboxDn = "rbxassetid://168387089"
                            sky["Desert Skybox"].SkyboxFt = "rbxassetid://168387054"
                            sky["Desert Skybox"].SkyboxLf = "rbxassetid://168534432"
                            sky["Desert Skybox"].SkyboxRt = "rbxassetid://168387190"
                            sky["Desert Skybox"].SkyboxUp = "rbxassetid://168387135"

                        elseif option == "Nebula" then

                            sky["Desert Skybox"].SkyboxBk = "rbxassetid://159454299"
                            sky["Desert Skybox"].SkyboxDn = "rbxassetid://159454296"
                            sky["Desert Skybox"].SkyboxFt = "rbxassetid://159454293"
                            sky["Desert Skybox"].SkyboxLf = "rbxassetid://159454286"
                            sky["Desert Skybox"].SkyboxRt = "rbxassetid://159454300"
                            sky["Desert Skybox"].SkyboxUp = "rbxassetid://159454288"

                        elseif option == "Vaporwave" then

                            sky["Desert Skybox"].SkyboxBk = "rbxassetid://8631780182"
                            sky["Desert Skybox"].SkyboxDn = "rbxassetid://8631784904"
                            sky["Desert Skybox"].SkyboxFt = "rbxassetid://8631769834"
                            sky["Desert Skybox"].SkyboxLf = "rbxassetid://8631777199"
                            sky["Desert Skybox"].SkyboxRt = "rbxassetid://8631735555"
                            sky["Desert Skybox"].SkyboxUp = "rbxassetid://8631782345"

                        end

                    end
                
                end)

                local sunsetTest = pcall(function ()
                    
                    if sky.Sunset ~= nil then

                        if option == "Starry Evening" then
                            
                            sky.Sunset.SkyboxBk = "rbxassetid://5260808177"
                            sky.Sunset.SkyboxDn = "rbxassetid://5260653793"
                            sky.Sunset.SkyboxFt = "rbxassetid://5260817288"
                            sky.Sunset.SkyboxLf = "rbxassetid://5260800833"
                            sky.Sunset.SkyboxRt = "rbxassetid://5260811073"
                            sky.Sunset.SkyboxUp = "rbxassetid://5260824661"

                        elseif option == "Christmas" then

                            sky.Sunset.SkyboxBk = "rbxassetid://8139677359"
                            sky.Sunset.SkyboxDn = "rbxassetid://8139677253"
                            sky.Sunset.SkyboxFt = "rbxassetid://8139677111"
                            sky.Sunset.SkyboxLf = "rbxassetid://8139676988"
                            sky.Sunset.SkyboxRt = "rbxassetid://8139676842"
                            sky.Sunset.SkyboxUp = "rbxassetid://8139676647"

                        elseif option == "Space" then

                            sky.Sunset.SkyboxBk = "rbxassetid://168387023"
                            sky.Sunset.SkyboxDn = "rbxassetid://168387089"
                            sky.Sunset.SkyboxFt = "rbxassetid://168387054"
                            sky.Sunset.SkyboxLf = "rbxassetid://168534432"
                            sky.Sunset.SkyboxRt = "rbxassetid://168387190"
                            sky.Sunset.SkyboxUp = "rbxassetid://168387135"

                        elseif option == "Nebula" then

                            sky.Sunset.SkyboxBk = "rbxassetid://159454299"
                            sky.Sunset.SkyboxDn = "rbxassetid://159454296"
                            sky.Sunset.SkyboxFt = "rbxassetid://159454293"
                            sky.Sunset.SkyboxLf = "rbxassetid://159454286"
                            sky.Sunset.SkyboxRt = "rbxassetid://159454300"
                            sky.Sunset.SkyboxUp = "rbxassetid://159454288"

                        elseif option == "Vaporwave" then

                            sky.Sunset.SkyboxBk = "rbxassetid://8631780182"
                            sky.Sunset.SkyboxDn = "rbxassetid://8631784904"
                            sky.Sunset.SkyboxFt = "rbxassetid://8631769834"
                            sky.Sunset.SkyboxLf = "rbxassetid://8631777199"
                            sky.Sunset.SkyboxRt = "rbxassetid://8631735555"
                            sky.Sunset.SkyboxUp = "rbxassetid://8631782345"

                        end

                    end
                
                end)    

                local sky2Test = pcall(function ()

                    if sky.Sky2 ~= nil then
                
                        if option == "Starry Evening" then
                            
                            sky.Sky2.SkyboxBk = "rbxassetid://5260808177"
                            sky.Sky2.SkyboxDn = "rbxassetid://5260653793"
                            sky.Sky2.SkyboxFt = "rbxassetid://5260817288"
                            sky.Sky2.SkyboxLf = "rbxassetid://5260800833"
                            sky.Sky2.SkyboxRt = "rbxassetid://5260811073"
                            sky.Sky2.SkyboxUp = "rbxassetid://5260824661"

                        elseif option == "Christmas" then

                            sky.Sky2.SkyboxBk = "rbxassetid://8139677359"
                            sky.Sky2.SkyboxDn = "rbxassetid://8139677253"
                            sky.Sky2.SkyboxFt = "rbxassetid://8139677111"
                            sky.Sky2.SkyboxLf = "rbxassetid://8139676988"
                            sky.Sky2.SkyboxRt = "rbxassetid://8139676842"
                            sky.Sky2.SkyboxUp = "rbxassetid://8139676647"

                        elseif option == "Space" then

                            sky.Sky2.SkyboxBk = "rbxassetid://168387023"
                            sky.Sky2.SkyboxDn = "rbxassetid://168387089"
                            sky.Sky2.SkyboxFt = "rbxassetid://168387054"
                            sky.Sky2.SkyboxLf = "rbxassetid://168534432"
                            sky.Sky2.SkyboxRt = "rbxassetid://168387190"
                            sky.Sky2.SkyboxUp = "rbxassetid://168387135"

                        elseif option == "Nebula" then

                            sky.Sky2.SkyboxBk = "rbxassetid://159454299"
                            sky.Sky2.SkyboxDn = "rbxassetid://159454296"
                            sky.Sky2.SkyboxFt = "rbxassetid://159454293"
                            sky.Sky2.SkyboxLf = "rbxassetid://159454286"
                            sky.Sky2.SkyboxRt = "rbxassetid://159454300"
                            sky.Sky2.SkyboxUp = "rbxassetid://159454288"

                        elseif option == "Vaporwave" then

                            sky.Sky2.SkyboxBk = "rbxassetid://8631780182"
                            sky.Sky2.SkyboxDn = "rbxassetid://8631784904"
                            sky.Sky2.SkyboxFt = "rbxassetid://8631769834"
                            sky.Sky2.SkyboxLf = "rbxassetid://8631777199"
                            sky.Sky2.SkyboxRt = "rbxassetid://8631735555"
                            sky.Sky2.SkyboxUp = "rbxassetid://8631782345"

                        end

                    end
                    
                end)

            end


        end
    }

    local misc_main = misc:Section{
        Name = "misc. 1",
        Side = "Left"
    }
    
    local hit_sound = misc_main:Toggle{
        Name = "hit sound",
        Flag = "hit_sound",
        Callback  = function(bool)
            misc_options.hitsound = bool
        end
    }
    
    local hitsound_id = misc_main:Dropdown{
        Name = "hit sound id",
        Default = "skeet",
        Content = {
            "skeet", 
            "neverlose", 
            "rust headshot", 
            "baimware", 
            "osu", 
            "tf2 critical hit", 
            "tf2 pan", 
            "quake hit", 
            "1", 
            "bonk", 
            "lego studs"
        },
        Flag = "hitsound_id",
        Callback = function(option)
            misc_options.hitsound_id = option
        end
    }
    
    local custom_hitsound_box = misc_main:Box{
        Name = "custom hitsound",
        --Default = "hi",
        Placeholder = "custom sound id here",
        Flag = "custom_hitsound_box",
        Callback = function(text)

            print(text)

            if text ~= "" then
                misc_options.custom_hitsound = text
            end

        end
    }

    local hitsound_volume = misc_main:Slider{
        Name = "hitsound volume",
        Text = "[value]",
        Default = 1,
        Min = 1,
        Max = 10,
        Float = 1,
        Flag = "hitsound_volume",
        Callback = function(value)
            misc_options.hitsound_volume = value
        end
    }

    local unlock_all_main = misc:Section{
        Name = "unlock all",
        Side = "Right"
    }
    
    local unlock_all_weapons = unlock_all_main:Toggle{
        Name = "unlock all weapons",
        Flag = "unlock_all_weapons",
        Callback  = function(bool)
            misc_options.unlock_all = bool
        end
    }

    local unlock_all_attachments = unlock_all_main:Toggle{
        Name = "unlock all attachments",
        Flag = "unlock_all_weapons_attachments",
        Callback  = function(bool)
            misc_options.unlock_all_attachments = bool
        end
    }

    local server_primary = unlock_all_main:Dropdown{
        Name = "server primary",
        Default = "AK12",
        Content = {
            "AK12", 
            "M4A1", 
            "MP5K", 
            "COLT LMG", 
            "INTERVENTION",
        },
        Flag = "server_primary",
        Callback = function(option)
            misc_options.primary = option
        end
    }

    local server_secondary = unlock_all_main:Dropdown{
        Name = "server secondary",
        Default = "G17",
        Content = {
            "G17", 
            "M9",
        },
        Flag = "server_secondary",
        Callback = function(option)
            misc_options.secondary = option
        end
    }

    local server_melee = unlock_all_main:Dropdown{
        Name = "server melee",
        Default = "KNIFE",
        Content = {
            "TANTO", 
            "KNIFE", 
            "TRENCH KNIFE", 
            "MAGLITE CLUB", 
            "CROWBAR", 
            "CANDY CANE", 
            "HONEY STICK",
        },
        Flag = "server_melee",
        Callback = function(option)
            misc_options.melee = option
        end
    }

    local configs = main:Tab("settings")
    
    local themes = configs:Section{Name = "Theme", Side = "Left"}
    
    local themepickers = {}
    
    local themelist = themes:Dropdown{
        Name = "Theme",
        Default = library.currenttheme,
        Content = library:GetThemes(),
        Flag = "Theme Dropdown",
        Callback = function(option)
            if option then
                library:SetTheme(option)
    
                for option, picker in next, themepickers do
                    picker:Set(library.theme[option])
                end
            end
        end
    }
    
    library:ConfigIgnore("Theme Dropdown")
    
    local namebox = themes:Box{
        Name = "Custom Theme Name",
        Placeholder = "Custom Theme",
        Flag = "Custom Theme"
    }
    
    library:ConfigIgnore("Custom Theme")
    
    themes:Button{
        Name = "Save Custom Theme",
        Callback = function()
            if library:SaveCustomTheme(library.flags["Custom Theme"]) then
                themelist:Refresh(library:GetThemes())
                themelist:Set(library.flags["Custom Theme"])
                namebox:Set("")
            end
        end
    }
    
    local customtheme = configs:Section{Name = "Custom Theme", Side = "Right"}
    
    themepickers["Accent"] = customtheme:ColorPicker{
        Name = "Accent",
        Default = library.theme["Accent"],
        Flag = "Accent",
        Callback = function(color)
            library:ChangeThemeOption("Accent", color)
        end
    }
    
    library:ConfigIgnore("Accent")
    
    themepickers["Window Background"] = customtheme:ColorPicker{
        Name = "Window Background",
        Default = library.theme["Window Background"],
        Flag = "Window Background",
        Callback = function(color)
            library:ChangeThemeOption("Window Background", color)
        end
    }
    
    library:ConfigIgnore("Window Background")
    
    themepickers["Window Border"] = customtheme:ColorPicker{
        Name = "Window Border",
        Default = library.theme["Window Border"],
        Flag = "Window Border",
        Callback = function(color)
            library:ChangeThemeOption("Window Border", color)
        end
    }
    
    library:ConfigIgnore("Window Border")
    
    themepickers["Tab Background"] = customtheme:ColorPicker{
        Name = "Tab Background",
        Default = library.theme["Tab Background"],
        Flag = "Tab Background",
        Callback = function(color)
            library:ChangeThemeOption("Tab Background", color)
        end
    }
    
    library:ConfigIgnore("Tab Background")
    
    themepickers["Tab Border"] = customtheme:ColorPicker{
        Name = "Tab Border",
        Default = library.theme["Tab Border"],
        Flag = "Tab Border",
        Callback = function(color)
            library:ChangeThemeOption("Tab Border", color)
        end
    }
    
    library:ConfigIgnore("Tab Border")
    
    themepickers["Tab Toggle Background"] = customtheme:ColorPicker{
        Name = "Tab Toggle Background",
        Default = library.theme["Tab Toggle Background"],
        Flag = "Tab Toggle Background",
        Callback = function(color)
            library:ChangeThemeOption("Tab Toggle Background", color)
        end
    }
    
    library:ConfigIgnore("Tab Toggle Background")
    
    themepickers["Section Background"] = customtheme:ColorPicker{
        Name = "Section Background",
        Default = library.theme["Section Background"],
        Flag = "Section Background",
        Callback = function(color)
            library:ChangeThemeOption("Section Background", color)
        end
    }
    
    library:ConfigIgnore("Section Background")
    
    themepickers["Section Border"] = customtheme:ColorPicker{
        Name = "Section Border",
        Default = library.theme["Section Border"],
        Flag = "Section Border",
        Callback = function(color)
            library:ChangeThemeOption("Section Border", color)
        end
    }
    
    library:ConfigIgnore("Section Border")
    
    themepickers["Text"] = customtheme:ColorPicker{
        Name = "Text",
        Default = library.theme["Text"],
        Flag = "Text",
        Callback = function(color)
            library:ChangeThemeOption("Text", color)
        end
    }
    
    library:ConfigIgnore("Text")
    
    themepickers["Disabled Text"] = customtheme:ColorPicker{
        Name = "Disabled Text",
        Default = library.theme["Disabled Text"],
        Flag = "Disabled Text",
        Callback = function(color)
            library:ChangeThemeOption("Disabled Text", color)
        end
    }
    
    library:ConfigIgnore("Disabled Text")
    
    themepickers["Object Background"] = customtheme:ColorPicker{
        Name = "Object Background",
        Default = library.theme["Object Background"],
        Flag = "Object Background",
        Callback = function(color)
            library:ChangeThemeOption("Object Background", color)
        end
    }
    
    library:ConfigIgnore("Object Background")
    
    themepickers["Object Border"] = customtheme:ColorPicker{
        Name = "Object Border",
        Default = library.theme["Object Border"],
        Flag = "Object Border",
        Callback = function(color)
            library:ChangeThemeOption("Object Border", color)
        end
    }
    
    library:ConfigIgnore("Object Border")
    
    themepickers["Dropdown Option Background"] = customtheme:ColorPicker{
        Name = "Dropdown Option Background",
        Default = library.theme["Dropdown Option Background"],
        Flag = "Dropdown Option Background",
        Callback = function(color)
            library:ChangeThemeOption("Dropdown Option Background", color)
        end
    }
    
    library:ConfigIgnore("Dropdown Option Background")
    
    local configsection = configs:Section{Name = "Configs", Side = "Left"}
    
    local configlist = configsection:Dropdown{
        Name = "Configs",
        Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
        Flag = "Config Dropdown"
    }
    
    library:ConfigIgnore("Config Dropdown")
    
    local loadconfig = configsection:Button{
        Name = "Load Config",
        Callback = function()
            library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
        end
    }
    
    local delconfig = configsection:Button{
        Name = "Delete Config",
        Callback = function()
            library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
            configlist:Refresh(library:GetConfigs())
        end
    }
    
    
    local configbox = configsection:Box{
        Name = "Config Name",
        Placeholder = "Config Name",
        Flag = "Config Name"
    }
    
    library:ConfigIgnore("Config Name")
    
    local save = configsection:Button{
        Name = "Save Config",
        Callback = function()
            library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"]) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
            configlist:Refresh(library:GetConfigs())
        end
    }
    
    local keybindsection = configs:Section{Name = "UI Toggle Keybind", Side = "Left"}
    
    keybindsection:Keybind{
        Name = "UI Toggle",
        Flag = "UI Toggle",
        Default = Enum.KeyCode.RightShift,
        Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
        Callback = function(_, fromsetting)
            if not fromsetting then
                library:Close()
            end
        end
    }

    local unloadMenu = keybindsection:Button{
        Name = "Unload Menu",
        Callback = function()

            boxes:Toggle(false) -- works
            healthbar:Toggle(false) -- works

            library:Close()
            library:Unload()

        end
    }

    -- tables
    local replicationInterface = nil;
    local network = nil;
    local clientCamera = nil;
    local meleeCheck = nil;
    local weaponData = nil;
    local fireData = nil;
    local publicSettings = nil;
    local gameController = nil;

    -- functions
    local gameTrajectory = nil;
    local bulletCheck = nil;
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    local beams = {}
    local nv = Vector3.new()
    local dot = nv.Dot
    local debris = game:service("Debris")
    local tween = game:service("TweenService")
    local mouse = LocalPlayer:GetMouse()
    local animations = {}

    local locked_part_bool = false -- this will check to see if the part has been chosen and locked
    local locked_part = nil -- this will hold the actual part that we use in the aimbot

    local locked_target_silent = nil -- this will be the target name
    local locked_part_silent_bool = false -- this will check to see if the part has been chosen and locked
    local locked_part_silent = nil -- this will hold the actual part that we use in the aimbot

    local filter = Instance.new("ColorCorrectionEffect", game:GetService("Lighting"))
    local bloom = Instance.new("BloomEffect", game:GetService("Lighting"))

    -- silent aim functions
    local shared = getrenv().shared;
    local physics = shared.require("physics");
    local particle = shared.require("particle");
    local bulletCheck = shared.require("BulletCheck")
    local solve = debug.getupvalue(physics.timehit, 2);
    local global_trajectory = nil

    for idx, tbl in pairs(getgc(true)) do

        if (typeof(tbl) == "table" and rawget(tbl, "setHighMs")) then
            replicationInterface = tbl;
        elseif (typeof(tbl) == "table" and rawget(tbl, "send")) then
            network = tbl;
        elseif (typeof(tbl) == "table" and rawget(tbl, "setSway")) then
            clientCamera = tbl;
        elseif (typeof(tbl) == "table" and rawget(tbl, "canMelee")) then
            meleeCheck = tbl
        elseif (typeof(tbl) == "table" and rawget(tbl, "getWeaponAttData")) then
            weaponData = tbl
        elseif (typeof(tbl) == "table" and rawget(tbl, "getFiremode") and rawget(tbl, "getFirerate")) then
            fireData = tbl
        elseif (typeof(tbl) == "table" and rawget(tbl, "getController")) then
            gameController = tbl
        elseif (typeof(tbl) == "function") then

            local info = getinfo(tbl);

            if info.name == "trajectory" then
                gameTrajectory = tbl
            elseif info.name == "bulletcheck" then
                bulletCheck = tbl
            elseif info.name == "PublicSettings" then
                publicSettings = tbl
            end

        end

    end

    function get_character(Player)
        local entry = replicationInterface.getEntry(Player)
    
        if entry then
            local third_person_object = entry._thirdPersonObject
            if third_person_object then
                return third_person_object._characterHash.head.Parent
            end
        end
    end
    
    function get_health(Player)
        local entry = replicationInterface.getEntry(Player)
    
        if entry then
            return entry._healthstate.health0, entry._healthstate.maxhealth
        end
    end
    
    function get_alive(Player)
        local entry = replicationInterface.getEntry(Player)
    
        if entry then
            return entry._alive
        end
    end

    function createBeam(origin_att, ending_att, texture)
    

        local beam = Instance.new("Beam")

        if misc_options.custom_beam_texture ~= "" then
            local connect = "http://www.roblox.com/asset/?id=" .. misc_options.custom_beam_texture
            print(connect)
            beam.Texture = connect or "http://www.roblox.com/asset/?id=7071778278"
        else
            beam.Texture = texture or "http://www.roblox.com/asset/?id=7071778278"
        end

        beam.TextureMode = Enum.TextureMode.Stretch
        beam.TextureSpeed = 1
        beam.LightEmission = 1
        beam.LightInfluence = 1
        beam.TextureLength = 12
        beam.FaceCamera = true
        beam.Enabled = true
        beam.ZOffset = -1
        beam.Transparency = NumberSequence.new(0,0)
        beam.Color = ColorSequence.new(color_options.bullet_tracers, Color3.new(0, 0, 0))
        beam.Attachment0 = origin_att
        beam.Attachment1 = ending_att
        debris:AddItem(beam, 3)
        debris:AddItem(origin_att, 3)
        debris:AddItem(ending_att, 3)
    
        local speedtween = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)
        tween:Create(beam, speedtween, { TextureSpeed = 2 }):Play()
        beam.Parent = workspace
        table.insert(beams, { beam = beam, time = tick() })
        return beam
    end
    
    function updateBeams()
        local time = tick()
        for i = #beams, 1, -1 do
            if beams[i].beam  then
                local transparency = (time - beams[i].time) - 2
                beams[i].beam.Transparency = NumberSequence.new(transparency, transparency)
            else
                table.remove(beams, i)
            end
        end
    end
    
    function networkFuncs()
    
        local send = network.send
    
        network.send = function(self, name, ...)
    
            local args = table.pack(...);
    
            if name ~= "repupdate" and name ~= "ping" then

            end
    
            if name == "newbullets" then
    
                if visual_options.bullet_tracers == true then
    
                    for i = 1, #args[1].bullets do
    
                        local bullet = args[1].bullets[i]
                        local origin = args[1].firepos
        
                        local attach_origin = Instance.new("Attachment", workspace.Terrain)
                        attach_origin.Position = origin
                        local ending = origin + (type(bullet[1]) == "table" and bullet[1].unit.Unit or bullet[1].Unit) * 300
                        local attach_ending = Instance.new("Attachment", workspace.Terrain)
                        attach_ending.Position = ending
                        local beam = createBeam(attach_origin, attach_ending)
                        beam.Parent = workspace
        
                    end
    
                end
    
    
            end
    
            if name == "bullethit" then
    
                if misc_options.hitsound == true then
                    
                    local sound = Instance.new("Sound", workspace)

                    if misc_options.custom_hitsound ~= "" then
                        
                        local quickString = "rbxassetid://" .. misc_options.custom_hitsound
                        sound.SoundId = quickString

                        print(quickString)
                        
                    else

                        if misc_options.hitsound_id == "skeet" then
                            sound.SoundId = "rbxassetid://4817809188"
                        elseif misc_options.hitsound_id == "neverlose" then
                            sound.SoundId = "rbxassetid://8679627751"
                        elseif misc_options.hitsound_id == "rust headshot" then
                            sound.SoundId = "rbxassetid://5043539486"
                        elseif misc_options.hitsound_id == "baimware" then
                            sound.SoundId = "rbxassetid://6607339542"
                        elseif misc_options.hitsound_id == "osu" then
                            sound.SoundId = "rbxassetid://7149919358"
                        elseif misc_options.hitsound_id == "tf2 critical hit" then
                            sound.SoundId = "rbxassetid://296102734"
                        elseif misc_options.hitsound_id == "tf2 pan" then
                            sound.SoundId = "rbxassetid://3431749479"
                        elseif misc_options.hitsound_id == "quake hit" then
                            sound.SoundId = "rbxassetid://4868633804"
                        elseif misc_options.hitsound_id == "1" then
                            sound.SoundId = "rbxassetid://7349055654"
                        elseif misc_options.hitsound_id == "bonk" then
                            sound.SoundId = "rbxassetid://5635027625"
                        elseif misc_options.hitsound_id == "lego studs" then
                            sound.SoundId = "rbxassetid://7273808931"
                        end

                    end

    
                    sound.Volume = misc_options.hitsound_volume
                    sound.PlayOnRemove = true
                    sound:Destroy()
    
                end
    
            end

            if name == "changeWeapon" then
                if misc_options.unlock_all == true then 
                    if args[2] == "Primary" then
                        expected_primary = args[3]
                        args[3] = misc_options.primary

                    elseif args[2] == "Secondary" then
                        expected_secondary = args[3]
                        args[3] = misc_options.secondary
                    elseif args[2] == "Knife" then
                        expected_melee = args[3]
                        args[3] = misc_options.melee
                    end
                end
            end

            if name == "spawn" then

            end

    
            return send(self, name, table.unpack(args));
    
        end
    
    end
    
    function get_weapon(Player)
        local entry = replicationInterface.getEntry(Player)
    
        if entry then
            local third_person_object = entry._thirdPersonObject
            if third_person_object then
                return third_person_object._weaponname or ""
            end
        end
    end
    
    function IsVisible(Player, PlayerPart)
        if get_alive(Player) and get_character(Player) then
            local Base = get_character(Player)
            local PartPos = Base[PlayerPart].Position
            local Hit = workspace:FindPartOnRayWithIgnoreList(Ray.new(Camera.CFrame.p, PartPos - Camera.CFrame.p), {
                workspace.Ignore,
                workspace.Players,
                workspace.Terrain,
                Camera
            })
            return Hit == nil
        end
        return false
    end
    
    local function map(N, OldMin, OldMax, Min, Max)
        return (N - OldMin) / (OldMax - OldMin) * (Max - Min) + Min
    end
    
    function clamp(a, lowerNum, higher)
        if a > higher then
            return higher
        elseif a < lowerNum then
            return lowerNum
        else
            return a
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
    
    function hitChance(Percentage)
        -- // Floor the percentage
        Percentage = math.floor(Percentage)

        -- // Get the chance
        local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100
    
        -- // Return
        return chance <= Percentage / 100
    end

    local function trajectory(dir, velocity, accel, speed)
        local t1, t2, t3, t4 = solve(
            accel:Dot(accel) * 0.25,
            accel:Dot(velocity),
            accel:Dot(dir) + velocity:Dot(velocity) - speed^2,
            dir:Dot(velocity) * 2,
            dir:Dot(dir));
    
        local time = (t1>0 and t1) or (t2>0 and t2) or (t3>0 and t3) or t4;
        local bullet = (dir + velocity*time + 0.5*accel*time^2) / time;
        return bullet, time;
    end

    function IsDown(EnumItem)
        -- Check if a key being held down is down
        return (EnumItem.EnumType == Enum.KeyCode and UserInputService:IsKeyDown(EnumItem)) or (EnumItem.EnumType == Enum.UserInputType and UserInputService:IsMouseButtonPressed(EnumItem))
    end

    function Visuals(Player)
    
        if (Player == LocalPlayer) then
            return
        end
    
        -- Start ESP
    
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
    
        local fovTriangle = Drawing.new("Triangle")
        fovTriangle.Visible = false
        fovTriangle.Thickness = 1
        fovTriangle.Filled = true
        fovTriangle.Color = Color3.new(255,255,255)
    
        -- End ESP
    
        RunService:BindToRenderStep(Player.Name .. "Esp", 1, function()
    
            if Player ~= nil and Player.Team ~= LocalPlayer.Team then
    
                local Base = get_character(Player)
                local alive = get_alive(Player)
                local Health, MaxHealth = get_health(Player)
    
                if Health == 0 then
                    Health = 100
                end
    
                local gun = get_weapon(Player)
    
                snapLine.Color = color_options.snaplines
                nameText.Color = color_options.nametags
                distanceText.Color = color_options.distance
                fovTriangle.Color = color_options.oov_arrow
    
                -- colors
                healthBarBox.Color = Color3.fromRGB(255 - 255 / (MaxHealth / Health), 255 / (MaxHealth / Health), 0)

                if alive then -- works lol
    
                    local Root = Base.Torso
                    local Head = Base.Head
    
                    local visible = IsVisible(Player, "Torso") or IsVisible(Player, "Head")
    
                    local Cam = Camera.CFrame
                    local Torso = Root.CFrame
                    
                    local top, top_isrendered = workspace.Camera:worldToViewportPoint(Head.Position + (Torso.UpVector * 1) + Cam.UpVector)
                    local bottom, bottom_isrendered = workspace.Camera:worldToViewportPoint(Torso.Position - (Torso.UpVector * 2.5) - Cam.UpVector)
            
                    local minY = math.abs(bottom.y - top.y)
                    local sizeX = math.ceil(math.max(clamp(math.abs(bottom.x - top.x) * 2.5, 0, minY), minY / 2, 3))
                    local sizeY = math.ceil(math.max(minY, sizeX * 0.5, 3))
    
                    if visual_options.vis_check_esp then

                        if visible then
                            box.Color = color_options.vis_check_color
                        else 
                            box.Color = color_options.boxes
                        end

                    else 
                        box.Color = color_options.boxes
                    end

                    -- ESP
                    if top_isrendered or bottom_isrendered then
    
                        local boxtop = Vector2.new(
                            math.floor(top.x * 0.5 + bottom.x * 0.5 - sizeX * 0.5),
                            math.floor(math.min(top.y, bottom.y))
                        )
        
                        local boxsize = { w = sizeX, h = sizeY }
                        local ySizeBar = -math.floor(boxsize.h * Health / MaxHealth)
    
                        fovTriangle.Visible = false
    
                        outlineBox.Position = Vector2.new(boxtop.x, boxtop.y)
                        outlineBox.Size = Vector2.new(boxsize.w, boxsize.h)
    
                        box.Position = Vector2.new(boxtop.x, boxtop.y)
                        box.Size = Vector2.new(boxsize.w, boxsize.h)
    
                        if visual_options.boxes == true then
                            box.Visible = true
                            outlineBox.Visible = true
                        else
                            box.Visible = false
                            outlineBox.Visible = false
                        end
    
                        if visual_options.healthbar == true then
    
                            -- Default Values
                            healthOutlineBox.Position = Vector2.new(boxtop.x - 7, boxtop.y - 1)
                            healthOutlineBox.Size = Vector2.new(4, boxsize.h + 3)
                        
                            -- Default Values
                            healthBarBox.Position = Vector2.new(boxtop.x - 6, boxtop.y + boxsize.h)
                            healthBarBox.Size = Vector2.new(2, ySizeBar)
                            
                            healthBarBox.Visible = true
                            healthOutlineBox.Visible = true
                        else
                            healthOutlineBox.Visible = false
                            healthBarBox.Visible = false
                        end
    
                        if visual_options.snaplines == true then
    
                            local RootPosition = Camera:worldToViewportPoint(Root.Position)
                            local HeadPosition = Camera:worldToViewportPoint(Head.Position)
                            local LegPosition = Camera:worldToViewportPoint(Root.Position - Vector3.new(0,4.3,0))
    
                            snapLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                            snapLine.To = Vector2.new(HeadPosition.X, HeadPosition.Y)
    
                            snapLine.Visible = true
                        else
                            snapLine.Visible = false
                        end
    
                        if visual_options.nametags == true then
    
                            nameText.Text = tostring(Player.Name)
                            nameText.Position = (Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 15)) or Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 4)))
                            nameText.Visible = true
    
                        else
                            nameText.Visible = false
                        end
    
                        if visual_options.distance == true then
    
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

                        if visual_options.oov_arrow == true then
    
                            fovTriangle.Visible = true
        
                            -- visual_options.oov_arrow_fov

                            local relativePos = Camera.CFrame:PointToObjectSpace(Root.Position)
                            local angle = math.atan2(-relativePos.y, relativePos.x)
                            local distance = dot(relativePos.Unit, relativePos)
                            local arrow_size = 15 and map(distance, 1, 100, 15, 15) or 15
                            arrow_size = arrow_size > 15 and 15 or arrow_size < 15 and 15 or arrow_size
        
                            direction = Vector2.new(math.cos(angle), math.sin(angle))
                            local pos
        
                            if visual_options.oov_arrow_fov ~= 101 then
                                pos = (
                                        direction * Camera.ViewportSize.x * visual_options.oov_arrow_fov / 200
                                    ) + (Camera.ViewportSize * 0.5)
                            end
        
                            if not pos or pos.y > Camera.ViewportSize.y - 5 or pos.y < 5 then
                                pos = Camera:AngleToEdge(angle, 5)
                            end
        
                            fovTriangle.PointA = pos
                            fovTriangle.PointB = pos - bVector2:getRotate(direction, 0.5) * arrow_size
                            fovTriangle.PointC = pos - bVector2:getRotate(direction, -0.5) * arrow_size
        
                        else
                            fovTriangle.Visible = false
                        end

                    end
    
                    -- Chams
                    if not Base:FindFirstChild("Highlight") then
                        
                        local highlight = Instance.new("Highlight", Base)
                        highlight.FillColor = color_options.chams_fill
                        highlight.OutlineColor = color_options.chams_outline
                        highlight.DepthMode = 0
    
                        highlight.FillTransparency = visual_options.fill_transparency / 100
                        highlight.OutlineTransparency = visual_options.outline_transparency / 100
                        --highlight.Adornee = Base
                    end
    
                    if Base:FindFirstChild("Highlight") then
    
                        Base.Highlight.FillColor = color_options.chams_fill
                        Base.Highlight.OutlineColor = color_options.chams_outline
                        Base.Highlight.FillTransparency = visual_options.fill_transparency / 100
                        Base.Highlight.OutlineTransparency = visual_options.outline_transparency / 100
    
                        if visual_options.chams == true then
                            Base.Highlight.Enabled = true
                        else
                            Base.Highlight.Enabled = false
                        end
    
                        if visual_options.occluded_chams == true then
                            Base.Highlight.DepthMode = 1
                        else
                            Base.Highlight.DepthMode = 0
                        end
    
    
                    end
    
    
                else
                    box.Visible = false
                    outlineBox.Visible = false
                    healthOutlineBox.Visible = false
                    healthBarBox.Visible = false
                    distanceText.Visible = false
                    snapLine.Visible = false
                    nameText.Visible = false
                    fovTriangle.Visible = false
                end
    
            end
    
        end)
    
        Players.PlayerRemoving:Connect(function (Player) -- should remove the players info after they have left the server I only do it here because it allows me to remove the drawings before they leave
    
            box.Visible = false
            outlineBox.Visible = false
            healthOutlineBox.Visible = false
            healthBarBox.Visible = false
            distanceText.Visible = false
            snapLine.Visible = false
            nameText.Visible = false
            fovTriangle.Visible = false
    
            RunService:UnbindFromRenderStep(Player.Name .. "Esp")
        end)
        
    end
    
    for i,v in pairs(Players:GetPlayers()) do
        Visuals(v)
    end
    
    Players.PlayerAdded:Connect(function(Player)
        Visuals(Player)
    end)

    local locked_aim_player = nil
    local locked_aim_bool = false

    function getClosestPlayer() -- ok so i think (strong emphasis on think) I fixed the problem with aimbot locking into the wrong person

        local closest_char = nil
        local mouseLocation = UserInputService:GetMouseLocation()
        local Distance = math.huge
        local plr_pos, on_screen = nil, nil
        local plr_part = "Head"
        local fov_value

        local partsList = aimbot_options.aim_part
        local chance = hitChance(aimbot_options.aimbot_hitchance)
        local norm = aimbot_options.randomization / 10



        if aimbot_options.dynamic_fov == true then
            fov_value = aimbot_options.aimbot_fov / Camera.FieldOfView * Camera.ViewportSize.y
        else 
            fov_value = aimbot_options.aimbot_fov
        end

        if locked_part_bool == false then

            locked_part = partsList[math.random(1, #partsList)]
            
            locked_part_bool = true
            


        end

        --local xRand = nil
        --local yRand = nil
        --local zRand = nil
        --local real_asf = nil

        --xRand = math.random(0, norm)
        --yRand = math.random(0, norm)
        --zRand = math.random(0, norm)
        --real_asf = Vector3.new(xRand, yRand, zRand)

        if locked_aim_bool == false then
            for i,v in next, Players:GetPlayers() do
            
                if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team then
                      
                    local Base = get_character(v)
                    local alive = get_alive(v)
                    local Health, MaxHealth = get_health(v)
                    local prediction
    
                    -- this should work
                    local controller = gameController:getController()
                    local weapon = controller._activeWeaponRegistry[controller._activeWeaponIndex]
                    -- this should work

                    local wpdata = weapon._weaponData

                    if alive and Base and locked_part ~= "" and chance then
    
                        if aimbot_options.prediction == true then

                            plr_pos, on_screen = Camera:worldToViewportPoint(Base[locked_part].Position) -- should br able to do this if the trajectory formula isnt fucked up
                            
                        else
                            plr_pos, on_screen = Camera:worldToViewportPoint(Base[locked_part].Position)
                        end
    
                        if on_screen then
    
                            local qew = Vector2.new(mouseLocation.X, mouseLocation.Y) - Vector2.new(plr_pos.X, plr_pos.Y)
                            local mag = qew.Magnitude
        
                            if mag <= Distance and mag <= aimbot_options.distance and mag <= fov_value then
    
                                Distance = mag
                                closest_char = v
    
                                locked_aim_bool = true
                                locked_aim_player = closest_char

                                return closest_char, locked_part, plr_pos
                            end
    
                        end
                    end
    
                end
        
            end
        else
            if locked_aim_player ~= LocalPlayer and locked_aim_player.Team ~= LocalPlayer.Team and locked_aim_player ~= nil then
                
                local Base = get_character(locked_aim_player)
                local alive = get_alive(locked_aim_player)
                local Health, MaxHealth = get_health(locked_aim_player)
                local prediction

                -- this should work
                local controller = gameController:getController()
                local weapon = controller._activeWeaponRegistry[controller._activeWeaponIndex]
                -- this should work
                
                local wpdata = weapon._weaponData

                if alive and Base and locked_part ~= "" and chance then

                    if aimbot_options.prediction == true then
    
                        plr_pos, on_screen = Camera:worldToViewportPoint(Base[locked_part].Position)
                        
                    else
                        plr_pos, on_screen = Camera:worldToViewportPoint(Base[locked_part].Position)
                    end

                    if on_screen then
    
                        local qew = Vector2.new(mouseLocation.X, mouseLocation.Y) - Vector2.new(plr_pos.X, plr_pos.Y)
                        local mag = qew.Magnitude
    
                        if mag <= Distance and mag <= aimbot_options.distance and mag <= fov_value then

                            Distance = mag
                            closest_char = locked_aim_player

                            return closest_char, locked_part, plr_pos
                        end

                    end

                end
            else
                locked_aim_bool = false
            end
        end

    end

    local function getClosestPlayerSilent(dir, ignore)

        local mouseLocation = UserInputService:GetMouseLocation()
        local _angle = silent_aim_options.silent_fov;

        local _position, _entry;
        local Distance = 1000
    
        local chance = hitChance(silent_aim_options.silent_hitchance)
        local partsList = silent_aim_options.aim_part
    
        if locked_part_silent_bool == false then

            locked_part_silent = partsList[math.random(1, #partsList)]

            locked_part_silent_bool = true

        end

        replicationInterface.operateOnAllEntries(function(player, entry)
    
            local tpObject = entry and entry._thirdPersonObject;
            local character = tpObject and tpObject._character;
    
            if character and player.Team ~= LocalPlayer.Team then
    
                local part = character[locked_part_silent]
                local plr_pos, OnScreen = Camera:worldToViewportPoint(part.Position)
                local visible = IsVisible(player, locked_part_silent)
    
                if silent_aim_options.silent_aim and OnScreen and chance then
    
                    local mag = (Vector2.new(mouseLocation.X, mouseLocation.Y) - Vector2.new(plr_pos.X, plr_pos.Y)).Magnitude
    
                    local dotProduct = dir.Unit:Dot((part.Position - Camera.CFrame.p).Unit);
                    local angle = math.deg(math.acos(dotProduct));
    
                    if silent_aim_options.vis_check then

                        if mag <= silent_aim_options.silent_fov and mag <= Distance and visible then
                            _angle = angle;
                            _position = part.Position;
                            _entry = entry;
                            target = player
                        end

                    else 

                        if mag <= silent_aim_options.silent_fov and mag <= Distance then
                            _angle = angle;
                            _position = part.Position;
                            _entry = entry;
                            target = player
                        end

                    end

                end
            end
        end);
    
        return _position, _entry;
    end

    local function Aimbot()

        local fovcircleOutline = Drawing.new("Circle")
        fovcircleOutline.Visible = aimbot_options.show_aimbot_fov
        fovcircleOutline.Radius = aimbot_options.aimbot_fov
        fovcircleOutline.Color = Color3.fromRGB(0, 0, 0)
        fovcircleOutline.Thickness = 2
        fovcircleOutline.Filled = false
    
        local fovcircle = Drawing.new("Circle")
        fovcircle.Visible = aimbot_options.show_aimbot_fov
        fovcircle.Radius = aimbot_options.aimbot_fov
        fovcircle.Color = Color3.fromRGB(255, 255, 255)
        fovcircle.Thickness = 1
        fovcircle.Filled = false

        local fovcircleSilentOutline = Drawing.new("Circle")
        fovcircleSilentOutline.Visible = aimbot_options.show_aimbot_fov
        fovcircleSilentOutline.Radius = aimbot_options.aimbot_fov
        fovcircleSilentOutline.Color = Color3.fromRGB(0, 0, 0)
        fovcircleSilentOutline.Thickness = 2
        fovcircleSilentOutline.Filled = false
    
        local fovcircleSilent = Drawing.new("Circle")
        fovcircleSilent.Visible = aimbot_options.show_aimbot_fov
        fovcircleSilent.Radius = aimbot_options.aimbot_fov
        fovcircleSilent.Color = Color3.fromRGB(255, 255, 255)
        fovcircleSilent.Thickness = 1
        fovcircleSilent.Filled = false

        RunService.RenderStepped:Connect(function(fpsTime)

            local name = "saturn.wtf"
            local ping = game:GetService("Stats").PerformanceStats.Ping:GetValueString()
            local trimmed = string.gsub(ping, " msec", "")
            local mils = tonumber(string.format("%.0f", trimmed))
            local fps = math.floor(1/fpsTime)
            local username = "Hype!"

            watermark:Set(name .. " | " .. "Ping: " .. mils .. " | " .. "FPS: " .. fps .. " | " .. username)
            
            local mouseLocation = UserInputService:GetMouseLocation()

            fovcircle.Visible = aimbot_options.show_aimbot_fov
            fovcircle.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
            fovcircle.NumSides = aimbot_options.aimbot_fov_num_sides
            
            fovcircleOutline.Visible = aimbot_options.show_aimbot_fov
            fovcircleOutline.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
            fovcircleOutline.NumSides = aimbot_options.aimbot_fov_num_sides

            if aimbot_options.dynamic_fov == true then
                fovcircle.Radius = aimbot_options.aimbot_fov / Camera.FieldOfView * Camera.ViewportSize.y
                fovcircleOutline.Radius = aimbot_options.aimbot_fov / Camera.FieldOfView * Camera.ViewportSize.y
            else 
                fovcircleOutline.Radius = aimbot_options.aimbot_fov
                fovcircle.Radius = aimbot_options.aimbot_fov
            end

            if silent_aim_options.dynamic_fov == true then 
                fovcircleSilent.Radius = silent_aim_options.silent_fov / Camera.FieldOfView * Camera.ViewportSize.y
                fovcircleSilentOutline.Radius = silent_aim_options.silent_fov / Camera.FieldOfView * Camera.ViewportSize.y
            else
                fovcircleSilent.Radius = silent_aim_options.silent_fov
                fovcircleSilentOutline.Radius = silent_aim_options.silent_fov
            end

            fovcircleSilent.Visible = silent_aim_options.show_silent_fov
            fovcircleSilent.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
            fovcircleSilent.NumSides = silent_aim_options.silent_fov_num_sides
            
            fovcircleSilentOutline.Visible = silent_aim_options.show_silent_fov
            fovcircleSilentOutline.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
            fovcircleSilentOutline.NumSides = silent_aim_options.silent_fov_num_sides

            -- color correction
            filter.Enabled = visual_options.color_correction
            filter.TintColor = color_options.color_correction
            filter.Brightness = visual_options.brightness / 100
            filter.Contrast = visual_options.contrast / 100
            filter.Saturation = visual_options.saturation / 100

            local horizontal = aimbot_options.horizontal_smoothing
            local vertical = aimbot_options.vertical_smoothing

            if aimbot_options.aimbot == true then
                
                if IsDown(Enum.UserInputType[aimbot_options.key]) then

                    local closest_plr, plr_part, plr_pos = getClosestPlayer() -- works :D
                    local visible = IsVisible(closest_plr, plr_part)

                    local xPlayerPos = plr_pos.X - mouseLocation.X
                    local yPlayerPos = plr_pos.Y - mouseLocation.Y

                    if aimbot_options.vis_check == true then

                        if plr_pos ~= nil and visible then 

                            if horizontal < 1 and vertical < 1 then

                                mousemoverel(xPlayerPos, yPlayerPos)

                            elseif horizontal < 1 then

                                mousemoverel(xPlayerPos, yPlayerPos / vertical)

                            elseif vertical < 1 then

                                mousemoverel(xPlayerPos / horizontal, yPlayerPos)

                            else
                                mousemoverel(xPlayerPos / horizontal, yPlayerPos / vertical)
                            end

                        else

                            locked_part_bool = false
                            locked_aim_bool = false
                        end

                    else 
                        if plr_pos ~= nil then 

                            if horizontal < 1 and vertical < 1 then

                                mousemoverel(xPlayerPos, yPlayerPos)

                            elseif horizontal < 1 then

                                mousemoverel(xPlayerPos, yPlayerPos / vertical)

                            elseif vertical < 1 then

                                mousemoverel(xPlayerPos / horizontal, yPlayerPos)

                            else

                                mousemoverel(xPlayerPos / horizontal, yPlayerPos / vertical)

                            end

                        else

                            locked_part_bool = false
                            locked_aim_bool = false
                        end
                    end

                else 
                    locked_part_bool = false
                    locked_aim_bool = false
                end

            end

            if visual_options.arm_chams == true then

                if game:GetService("Workspace").Camera["Left Arm"] ~= nil then
            
                    for i,v in pairs(game:GetService("Workspace").Camera["Left Arm"]:GetChildren()) do
                        if v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
                            v.Material = Enum.Material[visual_options.arm_chams_material]
                            v.Color = color_options.arm_chams
                        end
                    end
        
                    for i,v in pairs(game:GetService("Workspace").Camera["Right Arm"]:GetChildren()) do
                        if v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
                            v.Material = Enum.Material[visual_options.arm_chams_material]
                            v.Color = color_options.arm_chams
                        end
                    end
                end
    
            end
    
            if visual_options.gun_chams == true then
                if game:GetService("Workspace").Camera ~= nil then
                    for i,v in pairs(game:GetService("Workspace").Camera:GetChildren()) do
                        if v.Name ~= "Left Arm" and v.Name ~= "Right Arm" then
                            for i,p in pairs(v:GetChildren()) do
                                if not p.Name:find("IronGlow") and not p.Name:find("SightMark") and not p.Name:find("FlameSUP") and not p.Name:find("Flame") then
                                    p.Color = color_options.gun_chams
                                    p.Material = Enum.Material[visual_options.gun_chams_material]
                                end
                            end
                        end
                    end
                end
            end

            if game.Lighting ~= nil then

                if visual_options.force_time then
                    game.Lighting.ClockTime = visual_options.force_time_time
                end

                if misc_options.skybox == true then

                    -- game:GetService("Lighting")["Desert Skybox"]


                end

            end

        end)

    end
    coroutine.wrap(Aimbot)()

    local function silentAim()

        -- hooks
        local old;
        old = hookfunction(particle.new, function(args)
            if args.onplayerhit and debug.getinfo(2).name == "fireRound" and silent_aim_options.silent_aim then
                local position, entry = getClosestPlayerSilent(args.velocity, args.physicsignore);
                if position and entry then
                    local index = table.find(debug.getstack(2), args.velocity);
        
                    locked_part_silent_bool = false
                    -- global_trajectory = trajectory(position - args.visualorigin, entry._velspring.p, -args.acceleration, args.velocity.Magnitude)

                    args.velocity = trajectory(
                        position - args.visualorigin,
                        entry._velspring.p,
                        -args.acceleration,
                        args.velocity.Magnitude);

                        
        
                    debug.setstack(2, index, args.velocity);
                end
            end
            return old(args);
        end);


    end
    coroutine.wrap(silentAim)()

    networkFuncs()
    
    -- no sway
    local origSetSway = clientCamera.setSway

    local origSetShake = clientCamera.shake

    clientCamera.setSway = function (self, amount)
        local sway = visual_options.no_sway and 0 or amount

        return origSetSway(self, sway)
    end

    clientCamera.shake = function (self, amount)
        local shake = visual_options.no_shake and Vector3.zero or amount

        return origSetShake(self, shake)
    end
    -- no sway

    -- unlock all
    local oldAttachmentOwnership = weaponData.ownsAttachment
    
    weaponData.ownsAttachment = function(...)
        return (true and misc_options.unlock_all_attachments) or oldAttachmentOwnership(...)
    end

    local oldWeaponOwnership = weaponData.ownsWeapon

    weaponData.ownsWeapon = function(...)
        return (true and misc_options.unlock_all) or oldWeaponOwnership(...)
    end
    -- unlock all

    local oldGunSway = fireData.walkSway

    fireData.walkSway = function (...)
        if syn then
            
            local angle = CFrame.Angles(0, 0, 0)

            local origin = oldGunSway(...)
    
            if visual_options.local_player_viewmodel then
                
                -- if no_gunsway then -- pseudo code
                -- origin = CFrame.new()
                -- end
    
                origin = origin * CFrame.new(visual_options.viewmodel_x / 90, visual_options.viewmodel_y / 90, visual_options.viewmodel_z / 90) * CFrame.Angles(math.rad(visual_options.viewmodel_pitch), math.rad(visual_options.viewmodel_yaw), math.rad(visual_options.viewmodel_roll))
            end

            return origin * angle
        end
        return oldGunSway(...)
    end


    ]]);

end

client_start()
