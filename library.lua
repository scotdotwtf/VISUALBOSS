-- old func: 
--[[
getgenv().config = {
    script = {
        ["watermark"] = true
    },

    player = {
        ["viewmodel"] = {
            ["roll-x"] = 0,
            ["roll-y"] = 0,
            ["roll-z"] = 90
        },

        ["gunchams"] = {
            ["color"] = Color3.fromHex('#f517c1'),
            ["transparency"] = 0,
            ["material"] = "ForceField",
            ["overlay"] = "http://www.roblox.com/asset/?id=247707592" -- used to animate forcefield, leave blank if you dont care
        },
        
        ["armchams"] = {
            ["leftarm"] = {
                ["color"] = Color3.fromHex('#0bfff3'),
                ["transparency"] = 0,
                ["material"] = "ForceField",
                ["overlay"] = "http://www.roblox.com/asset/?id=247707592"
            },

            ["rightarm"] = {
                ["color"] = Color3.fromHex('#ffffff'),
                ["transparency"] = 0,
                ["material"] = "ForceField",
                ["overlay"] = "http://www.roblox.com/asset/?id=247707592"
            }
        }
    },

    enemies = {

    },

    world = {
        ["brightness"] = 0,
        ["tint"] = Color3.fromHex('#ffffff'), --// this can change viewmodel colors
        ["saturation"] = 0,
        ["contrast"] = 0,
        ["outdoor_ambient"] = Color3.fromHex('#48c2de'),
        ["ambient"] = Color3.fromHex('#48c2de'),
        ["time"] = 12,

        sky = {["moontextureid"] = "rbxassetid://1345054856", ["skyboxbk"] = "rbxassetid://12635309703", ["skyboxdn"] = "rbxassetid://12635311686", ["skyboxft"] = "rbxassetid://12635312870", ["skyboxlf"] = "rbxassetid://12635313718", ["skyboxrt"] = "rbxassetid://12635315817", ["skyboxup"] = "rbxassetid://12635316856", ["suntextureid"] = "rbxassetid://1345009717"}
    }
}
]]

-- what do we want?
    --[[
        enemie chams
            color, material, transparency, overlay
        enemie esp
            esp box, esp name, esp health, esp dist, esp gun
        local viewmodel roll
        local player chams 
        bullet tracers
        team chams
            color, material, transparency, overlay
        team esp
            esp box, esp name, esp health, esp dist, esp gun
    ]]

-- what do we have?
    --[[ function that allows you to:
        watermark
        local gun, arm chams
            color, transparency, material, overlay
        world visuals
            brightness, tint, sat, contrast, outambient,
            ambient, time, sky
        
    ]]

--[[ CONCEPT:
local VBLibrary = loadstring("https://raw.githubusercontent.com/scotdotwtf/VISUALBOSS/main/library.lua")()

--watermark example: bool
VBLibrary:ShowWatermark(true)

VBLibrary:ModifyWorld("Lighting", {
    ["Properties"] = {
        ["Brightness"] = 0,
        ["OutdoorAmbient"] = Color3.fromHex('#48c2de'),
        ["Ambient"] = Color3.fromHex('#48c2de'),
        ["Time"] = 12
    }
})

VBLibrary:ModifyWorld("Sky", {["moontextureid"] = "rbxassetid://1345054856", ["skyboxbk"] = "rbxassetid://12635309703", ["skyboxdn"] = "rbxassetid://12635311686", ["skyboxft"] = "rbxassetid://12635312870", ["skyboxlf"] = "rbxassetid://12635313718", ["skyboxrt"] = "rbxassetid://12635315817", ["skyboxup"] = "rbxassetid://12635316856", ["suntextureid"] = "rbxassetid://1345009717"})

VBLibrary:ModifyClient("FOV", {["Value"] = 120})

VBLibrary:ModifyLocal("Chams", true, {
    ["Object"] = "Gun",
    ["Properties"] = {
        ["Color"] = Color3.fromHex('#f517c1'),
        ["Transparency"] = 0,
        ["Material"] = Enum.Material.ForceField,
        ["TextureID"] = "http://www.roblox.com/asset/?id=247707592"
    }
})

VBLibrary:ModifyTeam("Chams", true, {
    ["Target"] = "All",
    ["Properties"] = {
        ["Color"] = Color3.fromHex('#f517c1'),
        ["Transparency"] = 0.5,
        ["Material"] = Enum.Material.Neon
    }
})

VBLibrary:ModifyEnemy("ESP", true, {
    ["Type"] = "Box2D",
    ["Target"] = "All",
    ["Properties"] = {
        ["Color"] = Color3.fromHex('#f517c1'),
        ["Outline"] = {true, Color3.fromHex('#00000')},
        ["Transparency"] = 0,
    }
})
]]

--// SOURCE:


--// LIBRARY:
local Library = {}

function Library:ShowWatermark(toggle)
    if game:GetService("CoreGui"):FindFirstChild("Logo") then
        game:GetService("CoreGui").Logo:Destroy()
    end
    if toggle then
        local LogoRoot = Instance.new("ScreenGui")
        LogoRoot.Name = "Logo"
        LogoRoot.Parent = game:GetService("CoreGui")
    
        local Logo = Instance.new("ImageLabel")
        Logo.Name = "LogoImage"
        Logo.Image = "http://www.roblox.com/asset/?id=12744806938"
        Logo.BackgroundTransparency = 1
        Logo.Position = UDim2.new(0, 5, 1, -25)
        Logo.Size = UDim2.fromOffset(275, 50)
        Logo.Parent = LogoRoot
    end
end

function Library:ModifyWorld(target, props)
    for i, v in pairs(props.Properties) do
        if target == "ColorCorrecton" then

        else
            game:GetService(target)props.Properties[v]
        end
    end
end