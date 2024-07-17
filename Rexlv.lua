local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Dakar Hub l RE:XL ",
    SubTitle = "by Sierra",
    TabWidth = 120,
    Size = UDim2.fromOffset(500, 430),
    Acrylic = true,
    Theme = "Amethyst",
    Transparency = false,
    MinimizeKey = Enum.KeyCode.LeftControl
})

--https://lucide.dev/icons/
local Tabs = {
    --[[ Main = Window:AddTab({ Title = "Main", Icon = "menu" }), ]]
   --[[  General = Window:AddTab({ Title = "General", Icon = "folder" }), ]]
    Farm = Window:AddTab({ Title = "Farm", Icon = "swords" }),
    Boss = Window:AddTab({ Title = "Boss", Icon = "skull" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "mountain-snow" }),
    Misc = Window:AddTab({ Title = "Miscellaneous", Icon = "wrench" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Players = Game.Players
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Options = Fluent.Options

local function updateWalkSpeed(value)
    LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = value * 50  
end



do
    Fluent:Notify({
        Title = "Dakar Hub",
        Content = "Power by Sierra",
        SubContent = "Thank for Support",
        Duration = 10
    })



   --[[  Tabs.Main:AddParagraph({
        Title = "Paragraph",
        Content = "This is a paragraph.\nSecond line!"
    })



    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Very important button",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })



    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Toggle", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)


    
    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Slider",
        Description = "This is a slider",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider:SetValue(3)



    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
    end)


    local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "Dropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"},
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)

    local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
        Title = "Colorpicker",
        Default = Color3.fromRGB(96, 205, 255)
    })

    Colorpicker:OnChanged(function()
        print("Colorpicker changed:", Colorpicker.Value)
    end)
    
    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

    local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Description = "but you can change the transparency.",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "TColorpicker changed:", TColorpicker.Value,
            "Transparency:", TColorpicker.Transparency
        )
    end)

    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle",
        Default = "LeftControl",

        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle")


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end) ]]
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
--[[ SaveManager:BuildConfigSection(Tabs.Settings) ]]
Window:SelectTab(1)

--[[ Fluent:Notify({
    Title = "Dakar Hub",
    Content = "By Sierra",
    Duration = 10
}) ]]

--[[ SaveManager:LoadAutoloadConfig() ]]

--[Anti AFK]---
game:service'Players'.LocalPlayer.Idled:connect(function()
    game:service'VirtualUser':CaptureController()
    game:service'VirtualUser':ClickButton2(Vector2.new())
end)

--[Redeem Code]--

local Code_List = {
    [1] = "3KPLAYERS",
    [2] = "10KLIKES",
    [3] = "Sub2XenoTy",
    [4] = "XLUPDATE",
    [5] = "FREECODE1",
    [6] = "XLRELEASE",
    [7] = "Group",
    [8] = "IFOLLOWEGOS",
    [9] = "IFOLLOWDESTROY",
    [10] = "5KPLAYERS "
}

Tabs.Misc:AddButton({
    Title = "Redeem Code",
    Description = "Redeem all codes",
    Callback = function()
        Window:Dialog({
            Title = "Redeem Code",
            Content = "Add all new code latest",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        for i,v in pairs(Code_List) do
                            ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("CodeRemote"):FireServer(v) 
                        end
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

--[Chest]--

local Toggle = Tabs.Teleport:AddToggle("Auto_Chest", {Title = "Teleport to Chest", Default = false })

spawn(function()
    while task.wait() do
        if Fluent.Unloaded then break end
        if Options.Auto_Chest.Value then
            pcall(function()
                local spawnLocations = workspace.SpawnLocations:GetChildren()
                for _, spawnChild in ipairs(spawnLocations) do
                    if spawnChild.Name == "Spawn" then
                        local treasureChest = spawnChild:FindFirstChild("TreasureChest")
                        if treasureChest then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = treasureChest.CFrame
                            return
                        end
                    end
                end
            end)
        end
    end
end)

--Weapon Select--
local Backpack_List = {}

local function updateBackpackList()
    Backpack_List = {}
    for _, item in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if item:IsA("Tool") then
            table.insert(Backpack_List, item.Name)
        end
    end
end

updateBackpackList()

local Select_Weapon = Tabs.Farm:AddDropdown("SelectWeapon", {
    Title = "Select Weapon",
    Description = "Select Weapon to use",
    Values = Backpack_List,
    Multi = false,
    Default = nil,
})

local function refreshDropdown()
    updateBackpackList()
    Select_Weapon:SetValues(Backpack_List)
end

Tabs.Farm:AddButton({
    Title = "Refresh Weapon",
    Callback = refreshDropdown
})

local function equipSelectedWeapon()
    local selectedWeapon = Select_Weapon.Value
    if selectedWeapon then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(selectedWeapon)
        if tool then
            tool.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(tool)
        end
    end
end

--[AutoSkill]--

local Toggle = Tabs.Farm:AddToggle("Auto_Skill", {Title = "Auto Skills", Default = false })

spawn(function()
    while task.wait() do
        if Fluent.Unloaded then break end
        if Options.Auto_Skill.Value then
            pcall(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, LocalPlayer)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.R, false, LocalPlayer)     
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.C, false, LocalPlayer) 
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.X, false, LocalPlayer)   
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Y, false, LocalPlayer)                
            end)
        end
    end
end)


--[AutoFarm]--

local Toggle = Tabs.Farm:AddToggle("Auto_Farm", {Title = "Auto Farm Level[Instant Kills]", Default = false, Description = "For those who can interact with quest NPC"})

spawn(function()
    while task.wait() do
        if Fluent.Unloaded then break end
        if Options.Auto_Farm.Value then
            pcall(function()
                if game:GetService("Players").LocalPlayer.PlayerValues.Level.Value < 51 then
                    if LocalPlayer.PlayerValues.CurrentQuest.Value == "Defeat 9 Outlaws" then
                        for i, v in pairs(workspace.Live:GetChildren()) do
                            if v.Name == "Outlaw" and v.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                                equipSelectedWeapon()
                                if v.Humanoid.Health < v.Humanoid.MaxHealth * 0.99 then
                                    v.Humanoid.Health = 0
                                    --[[ v.Humanoid:TakeDamage(999999)  ]]
                                    --[[ v.Torso:destroy() ]]
                                    --[[ v:BreakJoints() ]]
                                    --[[ v.Head:destroy() ]]
    
                                end 
                                local targetPosition = v.HumanoidRootPart.Position
                                local belowPosition = Vector3.new(targetPosition.X, targetPosition.Y - 10, targetPosition.Z) -- Adjust -10 based on how much below you want to stay
                                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(belowPosition)
                                local direction = (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).unit
                                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + direction)
                                local args = {
                                    [1] = false,
                                    [2] = Vector3.new(-2126.913818359375, -973.5858154296875, 11168.841796875),
                                    [3] = CFrame.new(-2126.913818359375, -973.5858154296875, 11168.841796875, -0.9747312068939209, -0.03396324813365936, 0.2207840532064438, 0, 0.9883741736412048, 0.15204176306724548, -0.22338104248046875, 0.14819985628128052, -0.9633991122245789)
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(unpack(args))
                                break
                            end
                        end
                    else
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ClearQuestRemote"):FireServer()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(64, 540, 1654)
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ChangeQuestRemote"):FireServer(game:GetService("ReplicatedStorage"):WaitForChild("Quests"):WaitForChild("Defeat 9 Outlaws"))
                    end
                else 
                    if game:GetService("Players").LocalPlayer.PlayerValues.Level.Value < 101 then
                        if LocalPlayer.PlayerValues.CurrentQuest.Value == "Defeat 8 Spearfishers" then
                            for i, v in pairs(workspace.Live:GetChildren()) do
                                if v.Name == "Spearfisher" and v.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                                    equipSelectedWeapon()
                                    if v.Humanoid.Health < v.Humanoid.MaxHealth * 0.99 then
                                        v.Humanoid.Health = 0
                                        --[[ v.Humanoid:TakeDamage(999999)  ]]
                                        --[[ v.Torso:destroy() ]]
                                        --[[ v:BreakJoints() ]]
                                        --[[ v.Head:destroy() ]]
        
                                    end 
                                    local targetPosition = v.HumanoidRootPart.Position
                                    local belowPosition = Vector3.new(targetPosition.X, targetPosition.Y - 10, targetPosition.Z) -- Adjust -10 based on how much below you want to stay
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(belowPosition)
                                    local direction = (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).unit
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + direction)
                                    local args = {
                                        [1] = false,
                                        [2] = Vector3.new(-2126.913818359375, -973.5858154296875, 11168.841796875),
                                        [3] = CFrame.new(-2126.913818359375, -973.5858154296875, 11168.841796875, -0.9747312068939209, -0.03396324813365936, 0.2207840532064438, 0, 0.9883741736412048, 0.15204176306724548, -0.22338104248046875, 0.14819985628128052, -0.9633991122245789)
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(unpack(args))
                                    break
                                end
                            end
                        else
                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ClearQuestRemote"):FireServer()
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(383, 541, 2419)
                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ChangeQuestRemote"):FireServer(game:GetService("ReplicatedStorage"):WaitForChild("Quests"):WaitForChild("Defeat 8 Spearfishers"))

                        end
                    else
                        if game:GetService("Players").LocalPlayer.PlayerValues.Level.Value < 100 then
                            if LocalPlayer.PlayerValues.CurrentQuest.Value == "Defeat 6 Claymore Leaders" then
                                for i, v in pairs(workspace.Live:GetChildren()) do
                                    if v.Name == "Claymore Leader" and v.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                                        equipSelectedWeapon()
                                        if v.Humanoid.Health < v.Humanoid.MaxHealth * 0.99 then
                                            v.Humanoid.Health = 0
                                            --[[ v.Humanoid:TakeDamage(999999)  ]]
                                            --[[ v.Torso:destroy() ]]
                                            --[[ v:BreakJoints() ]]
                                            --[[ v.Head:destroy() ]]
            
                                        end 
                                        local targetPosition = v.HumanoidRootPart.Position
                                        local belowPosition = Vector3.new(targetPosition.X, targetPosition.Y - 10, targetPosition.Z) -- Adjust -10 based on how much below you want to stay
                                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(belowPosition)
                                        local direction = (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).unit
                                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + direction)
                                        local args = {
                                            [1] = false,
                                            [2] = Vector3.new(-2126.913818359375, -973.5858154296875, 11168.841796875),
                                            [3] = CFrame.new(-2126.913818359375, -973.5858154296875, 11168.841796875, -0.9747312068939209, -0.03396324813365936, 0.2207840532064438, 0, 0.9883741736412048, 0.15204176306724548, -0.22338104248046875, 0.14819985628128052, -0.9633991122245789)
                                        }
                                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(unpack(args))
                                        break
                                    end
                                end
                            else
                                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ClearQuestRemote"):FireServer()
                                Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2112, 541, 2511)
                                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ChangeQuestRemote"):FireServer(game:GetService("ReplicatedStorage"):WaitForChild("Quests"):WaitForChild("Defeat 6 Claymore Leaders"))

                            end
                        else
                            if game:GetService("Players").LocalPlayer.PlayerValues.Level.Value < 500 then
                                if LocalPlayer.PlayerValues.CurrentQuest.Value == "Defeat 5 Tribe Leaders" then
                                    for i, v in pairs(workspace.Live:GetChildren()) do
                                        if v.Name == "Tribe Leader" and v.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                                            equipSelectedWeapon()
                                            if v.Humanoid.Health < v.Humanoid.MaxHealth * 0.99 then
                                                v.Humanoid.Health = 0
                                                --[[ v.Humanoid:TakeDamage(999999)  ]]
                                                --[[ v.Torso:destroy() ]]
                                                --[[ v:BreakJoints() ]]
                                                --[[ v.Head:destroy() ]]
                
                                            end 
                                            local targetPosition = v.HumanoidRootPart.Position
                                            local belowPosition = Vector3.new(targetPosition.X, targetPosition.Y - 10, targetPosition.Z) -- Adjust -10 based on how much below you want to stay
                                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(belowPosition)
                                            local direction = (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).unit
                                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + direction)
                                            local args = {
                                                [1] = false,
                                                [2] = Vector3.new(-2126.913818359375, -973.5858154296875, 11168.841796875),
                                                [3] = CFrame.new(-2126.913818359375, -973.5858154296875, 11168.841796875, -0.9747312068939209, -0.03396324813365936, 0.2207840532064438, 0, 0.9883741736412048, 0.15204176306724548, -0.22338104248046875, 0.14819985628128052, -0.9633991122245789)
                                            }
                                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(unpack(args))
                                            break
                                        end
                                    end
                                else
                                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ClearQuestRemote"):FireServer()
                                    Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2492, 541, 2511)
                                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ChangeQuestRemote"):FireServer(game:GetService("ReplicatedStorage"):WaitForChild("Quests"):WaitForChild("Defeat 5 Tribe Leaders"))
                                end
                            else
                                if LocalPlayer.PlayerValues.CurrentQuest.Value == "Defeat 4 Armoured Akumas" then
                                    for i, v in pairs(workspace.Live:GetChildren()) do
                                        if v.Name == "Armoured Akuma" and v.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                                            equipSelectedWeapon()
                                            if v.Humanoid.Health < v.Humanoid.MaxHealth * 0.99 then
                                                v.Humanoid.Health = 0
                                                --[[ v.Humanoid:TakeDamage(999999)  ]]
                                                --[[ v.Torso:destroy() ]]
                                                --[[ v:BreakJoints() ]]
                                                --[[ v.Head:destroy() ]]
                
                                            end 
                                        
                                            local targetPosition = v.HumanoidRootPart.Position
                                            local belowPosition = Vector3.new(targetPosition.X, targetPosition.Y - 10, targetPosition.Z) -- Adjust -10 based on how much below you want to stay
                                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(belowPosition)
                                            local direction = (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).unit
                                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + direction)
                                            local args = {
                                                [1] = false,
                                                [2] = Vector3.new(-2126.913818359375, -973.5858154296875, 11168.841796875),
                                                [3] = CFrame.new(-2126.913818359375, -973.5858154296875, 11168.841796875, -0.9747312068939209, -0.03396324813365936, 0.2207840532064438, 0, 0.9883741736412048, 0.15204176306724548, -0.22338104248046875, 0.14819985628128052, -0.9633991122245789)
                                            }
                                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(unpack(args))
                                            break
                                        end
                                    end
                                else
                                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ClearQuestRemote"):FireServer()
                                    Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2352, 541, 1533)
                                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ChangeQuestRemote"):FireServer(game:GetService("ReplicatedStorage"):WaitForChild("Quests"):WaitForChild("Defeat 4 Armoured Akumas"))
                                end                            
                            end
                        end
                    end
                end                  
            end)
        end
    end
end) 

--[Auto kill boss]--

local Toggle = Tabs.Boss:AddToggle("Auto_Enel", {Title = "Enel", Default = false })

spawn(function()
    while task.wait() do
        if Fluent.Unloaded then break end
        if Options.Auto_Enel.Value then
            pcall(function()
                local enel = workspace.Live.Enel
                --[[ Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enel.HumanoidRootPart.CFrame ]]
                if enel and enel:FindFirstChild("Humanoid") and enel.Humanoid.Health > 0 then
                    equipSelectedWeapon()
                    local targetPosition = enel.HumanoidRootPart.Position
                    local belowPosition = Vector3.new(targetPosition.X, targetPosition.Y - 10, targetPosition.Z) 
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(belowPosition)
                    local direction = (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).unit
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + direction)
                    local args = {
                        [1] = false,
                        [2] = Vector3.new(-2126.913818359375, -973.5858154296875, 11168.841796875),
                        [3] = CFrame.new(-2126.913818359375, -973.5858154296875, 11168.841796875, -0.9747312068939209, -0.03396324813365936, 0.2207840532064438, 0, 0.9883741736412048, 0.15204176306724548, -0.22338104248046875, 0.14819985628128052, -0.9633991122245789)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(unpack(args))
                end
            end)
        end
    end
end)

local Toggle = Tabs.Boss:AddToggle("Auto_zeropts", {Title = "Zoro (PTS)", Default = false })

spawn(function()
    while task.wait() do
        if Fluent.Unloaded then break end
        if Options.Auto_zeropts.Value then
            pcall(function()--[[ workspace.Live["Zoro (PTS)"] ]]
                local zoropts = workspace.Live["Zoro (PTS)"]
                --[[ Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enel.HumanoidRootPart.CFrame ]]
                if zoropts and zoropts:FindFirstChild("Humanoid") and zoropts.Humanoid.Health > 0 then
                    equipSelectedWeapon()
                    local targetPosition = workspace.Live["Zoro (PTS)"].HumanoidRootPart.Position
                    local belowPosition = Vector3.new(targetPosition.X, targetPosition.Y - 10, targetPosition.Z) 
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(belowPosition)
                    local direction = (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).unit
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + direction)
                    local args = {
                        [1] = false,
                        [2] = Vector3.new(-2126.913818359375, -973.5858154296875, 11168.841796875),
                        [3] = CFrame.new(-2126.913818359375, -973.5858154296875, 11168.841796875, -0.9747312068939209, -0.03396324813365936, 0.2207840532064438, 0, 0.9883741736412048, 0.15204176306724548, -0.22338104248046875, 0.14819985628128052, -0.9633991122245789)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(unpack(args))
                end
            end)
        end
    end
end)

local Toggle = Tabs.Boss:AddToggle("Auto_zorots", {Title = "Zoro (TS)", Default = false })

spawn(function()
    while task.wait() do
        if Fluent.Unloaded then break end
        if Options.Auto_zorots.Value then
            pcall(function()
                local zorots = workspace.Live["Zoro (TS)"]
                --[[ Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enel.HumanoidRootPart.CFrame ]]
                if zorots and zoropts:FindFirstChild("Humanoid") and zorots.Humanoid.Health > 0 then
                    equipSelectedWeapon()
                    local targetPosition = zorots.HumanoidRootPart.Position
                    local belowPosition = Vector3.new(targetPosition.X, targetPosition.Y - 10, targetPosition.Z) 
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(belowPosition)
                    local direction = (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).unit
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + direction)
                    local args = {
                        [1] = false,
                        [2] = Vector3.new(-2126.913818359375, -973.5858154296875, 11168.841796875),
                        [3] = CFrame.new(-2126.913818359375, -973.5858154296875, 11168.841796875, -0.9747312068939209, -0.03396324813365936, 0.2207840532064438, 0, 0.9883741736412048, 0.15204176306724548, -0.22338104248046875, 0.14819985628128052, -0.9633991122245789)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(unpack(args))
                end
            end)
        end
    end
end)

-- [AutoAttack] --

local Toggle = Tabs.Player:AddToggle("Auto_Attack", {Title = "Auto Click", Default = false })

spawn(function()
    while task.wait() do
        if Fluent.Unloaded then break end
        if Options.Auto_Attack.Value then
            pcall(function()
                local args = {
                    [1] = false,
                    [2] = Vector3.new(-3055.45751953125, -2949.119140625, 10398.1826171875),
                    [3] = CFrame.new(-3055.45751953125, -2949.119140625, 10398.1826171875, -0.9409106969833374, -0.11844091862440109, 0.31726786494255066, 7.450580596923828e-09, 0.9368472099304199, 0.34973928332328796, -0.33865490555763245, 0.329073429107666, -0.8814894556999207)
                }
                
                ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(unpack(args))
            end)
        end
    end
end)

-- [Walkspeed] --

local Slider = Tabs.Player:AddSlider("Slider", {
    Title = "Walk Speed",
    Description = "Player WalkSpeed",
    Default = 1,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(Value)
        updateWalkSpeed(Value)
    end
})

--Teleport NPC--

local NPC_List = {}
for _, npc in ipairs(workspace.NPCS:GetChildren()) do
    table.insert(NPC_List, npc.Name)
end
local NPC_Teleport = Tabs.Teleport:AddDropdown("Teleport to NPC", {
    Title = "Teleport to NPC",
    Description = "Select NPC to Teleport",
    Values = NPC_List,
    Multi = false,
    Default = nil,
})
NPC_Teleport:OnChanged(function(Value)
    local selectedNPC = nil
    for _, npc in ipairs(workspace.NPCS:GetChildren()) do
        if npc.Name == Value then
            selectedNPC = npc
            break
        end
    end
    if selectedNPC and selectedNPC:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = selectedNPC.HumanoidRootPart
        local player = Game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0,0,5)
        end
    end
end)

--Entity Select--

local Entity_List = {}
local Entity_Check = {}
for _, mob in ipairs(workspace.Live:GetChildren()) do
    if mob:FindFirstChild("HumanoidRootPart") and not Entity_Check[mob.Name] and   mob.Name ~= "Enel" and   mob.Name ~= "Zoro (PTS)" and  mob.Name ~= "Zoro (TS)" then
        table.insert(Entity_List, mob.Name)
        Entity_Check[mob.Name] = true
    end
end

local Mob_Select = Tabs.Farm:AddDropdown("Attack mob", {
    Title = "Select Enemies",
    Description = "Select Enemies to Attack",
    Values = Entity_List,
    Multi = false,
    Default = nil,
})

--Toggle Attack Entity--

local Toggle = Tabs.Farm:AddToggle("AttackMob", {Title = "Attack Enemies[Instant Kills]", Default = false,Description = "Recommend Enemies [Armoured Akumas]"})
spawn(function()
    while task.wait() do
        if Fluent.Unloaded then break end
        if Options.AttackMob.Value then
            pcall(function()
                local selectedEntityName = Mob_Select.Value
                if selectedEntityName then
                    for i, v in pairs(workspace.Live:GetChildren()) do
                        if v.Name == selectedEntityName and v:FindFirstChild("Humanoid") --[[ and v.Humanoid.Health > 0 ]] and v.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                            equipSelectedWeapon()
                          --[[   LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame ]]
                            --[[ local target = v.HumanoidRootPart 
                            local offset = Vector3.new(0, 0, -5)
                            local newPosition = target.Position + target.CFrame.LookVector * offset.Z + Vector3.new(0, offset.Y, 0)
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition, target.Position) ]]
                            targetPosition = v.HumanoidRootPart.Position
                            local belowPosition = Vector3.new(targetPosition.X, targetPosition.Y - 10, targetPosition.Z) 
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(belowPosition)
                            local direction = (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).unit
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + direction)
                            
                            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BladeCombatRemote"):FireServer(false,Vector3.new(-2126.913818359375, -973.5858154296875, 11168.841796875),CFrame.new(-2126.913818359375, -973.5858154296875, 11168.841796875, -0.9747312068939209, -0.03396324813365936, 0.2207840532064438, 0, 0.9883741736412048, 0.15204176306724548, -0.22338104248046875, 0.14819985628128052, -0.9633991122245789))
                         --[[ local VirtualUser = game:GetService("VirtualUser")
                            VirtualUser:Button1Down(Vector2.new(1280, 672)) ]]
                            if v.Humanoid.Health < v.Humanoid.MaxHealth  then
                                v.Humanoid.Health = 0
                                --[[ v.Humanoid:TakeDamage(999999)  ]]
                                --[[ v.Torso:destroy() ]]
                                --[[ v:BreakJoints() ]]
                                --[[ v.Head:destroy() ]]

                            end 
                            break
                        end
                    end
                end
            end)
        end
    end
end)

--Teleport to Zone--

local Map_List = {}
for _, Zone in ipairs(workspace.DetectionZones:GetChildren()) do
    table.insert(Map_List, Zone.Name)
end
local Map_Teleport = Tabs.Teleport:AddDropdown("Teleport to Zone", {
    Title = "Teleport to Zone",
    Description = "Select Zone to Teleport",
    Values = Map_List,
    Multi = false,
    Default = nil,
})

Map_Teleport:OnChanged(function(Value)
    local selectedMap = nil
    for _, Zone in ipairs(workspace.DetectionZones:GetChildren()) do
        if Zone.Name == Value then
            selectedMap = Zone
            break
        end
    end
    local groundPosition = Vector3.new(selectedMap.Position.X, workspace.Terrain:WorldToCell(selectedMap.Position).Y -1000, selectedMap.Position.Z)
    LocalPlayer.Character.HumanoidRootPart.CFrame = selectedMap.CFrame
end)


