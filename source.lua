--<VISUALBOSS 1.0>--
-- *spec

--[[ GOOD FORCEFIELD OVERLAYS:
    lightning http://www.roblox.com/asset/?id=247707592
    scratch http://www.roblox.com/asset/?id=6248583558
    dots http://www.roblox.com/asset/?id=6665227233
    water http://www.roblox.com/asset/?id=12734728683
    energy http://www.roblox.com/asset/?id=12734767170
]]

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