--<VISUALBOSS 1.0>--
-- *spec

-- EXPECT CHANGES! this is the first release of VISUALBOSS with no ui or anything special.

--// remove old instances
if game:GetService("Lighting"):FindFirstChild("SkyBox") then game:GetService("Lighting").SkyBox:Destroy() end
if game:GetService("CoreGui"):FindFirstChild("logoroot") then game:GetService("CoreGui").logoroot:Destroy() end

--// script
if config.script.watermark then
    local logoroot = Instance.new("ScreenGui")
    logoroot.Name = "logoroot"
    logoroot.Parent = game:GetService("CoreGui")

    local logo = Instance.new("ImageLabel")
    logo.Name = "logo"
    logo.Image = "http://www.roblox.com/asset/?id=12744806938"
    logo.ScaleType = Enum.ScaleType.Fit
    logo.AnchorPoint = Vector2.new(0, 1)
    logo.BackgroundColor3 = Color3.fromHex("#FFFFFF")
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.new(0, 5, 1, -25)
    logo.Size = UDim2.fromOffset(275, 50)
    logo.Parent = logoroot
end

--// this little line can detect when you spawn :)
game:GetService("Workspace").CurrentCamera.ChildAdded:Connect(function()
    --// player
    for i, v in pairs(game:GetService("Workspace").Camera:GetChildren()) do
        if v.Name ~= "Left Arm" and v.Name ~= "Right Arm" then
            for k, h in pairs(v:GetChildren()) do
                if h:IsA("BasePart") then
                    h.Color = config.player.gunchams.color
                    h.Transparency = config.player.gunchams.transparency
                    h.Material = config.player.gunchams.material
                    if config.player.gunchams.overlay ~= "" and h:IsA("MeshPart") then
                        h.TextureID = config.player.gunchams.overlay
                    end
                end
            end
        elseif v.Name == "Left Arm" then
            for k, h in pairs(v:GetChildren()) do
                if h:IsA("BasePart") then
                    h.Color = config.player.armchams.leftarm.color
                    h.Transparency = config.player.armchams.leftarm.transparency
                    h.Material = config.player.armchams.leftarm.material
                    if config.player.armchams.leftarm.overlay ~= "" and h:IsA("MeshPart") then
                        h.TextureID = config.player.armchams.leftarm.overlay
                    end
                end
            end
        elseif v.Name == "Right Arm" then
            for k, h in pairs(v:GetChildren()) do
                if h:IsA("BasePart") then
                    h.Color = config.player.armchams.rightarm.color
                    h.Transparency = config.player.armchams.rightarm.transparency
                    h.Material = config.player.armchams.rightarm.material
                    if config.player.armchams.rightarm.overlay ~= "" and h:IsA("MeshPart") then
                        h.TextureID = config.player.armchams.rightarm.overlay
                    end
                end
            end
        end
    end

    --// enemies
end)

--// world
if game:GetService("Lighting"):FindFirstChild("ColorCorrection") then game:GetService("Lighting").ColorCorrection:Destroy() end
local colorcorrection = Instance.new("ColorCorrectionEffect")
colorcorrection.Parent = game:GetService("Lighting")

colorcorrection.Brightness = config.world.brightness
colorcorrection.TintColor = config.world.tint
colorcorrection.Saturation = config.world.saturation
colorcorrection.Contrast = config.world.contrast

--// this keeps your lighting to always be what you set it as
game:GetService("Lighting").Changed:Connect(function()
    game:GetService("Lighting").OutdoorAmbient = config.world.outdoor_ambient
    game:GetService("Lighting").Ambient = config.world.ambient
    game:GetService("Lighting").ClockTime = config.world.time
end)

--// skybox
game:GetService("Lighting").ChildAdded:Connect(function()
    if game:GetService("Lighting"):FindFirstChild("SkyBox") then
        game:GetService("Lighting").SkyBox:Destroy()
    end

    local sky = Instance.new("Sky")
    sky.Parent = game:GetService("Lighting")
    sky.Name = "SkyBox"
    sky.MoonTextureId = config.world.sky.moontextureid
    sky.SkyboxBk = config.world.sky.skyboxbk
    sky.SkyboxDn = config.world.sky.skyboxdn
    sky.SkyboxFt = config.world.sky.skyboxft
    sky.SkyboxLf = config.world.sky.skyboxlf
    sky.SkyboxRt = config.world.sky.skyboxrt
    sky.SkyboxUp = config.world.sky.skyboxup
    sky.SunTextureId = config.world.sky.suntextureid
end)