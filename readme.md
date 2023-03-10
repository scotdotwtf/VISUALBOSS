# VISUALBOSS
## It's FREE! *and open source

#### load with simple config: (v1.0)
```lua
-- EXPECT CHANGES! this is the first release of VIISUALBOSS with no ui or anything special.
getgenv().config = {
    player = {
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
        ["time"] = 0
    }
}

```