local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/TutAriEL/main/Script%20Library"))()
local Window = Library.CreateLib("脚本中心 | Grok 3", "DarkTheme")

-- 主页面
local Tab = Window:NewTab("主要功能")
local Section = Tab:NewSection("功能选项")

-- 速度调整
Section:NewSlider("移动速度", "调整角色速度", 100, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

-- 跳跃高度
Section:NewSlider("跳跃高度", "调整跳跃力量", 100, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- 自动农场开关
local autofarm = false
Section:NewToggle("自动农场", "自动收集资源", function(state)
    autofarm = state
    while autofarm do
        -- 示例自动农场逻辑
        print("正在自动农场...")
        wait(1)
    end
end)

-- 传送功能
Section:NewDropdown("传送地点", "选择传送位置", {"出生点", "商店", "秘密基地"}, function(selected)
    local pos = {
        ["出生点"] = Vector3.new(0, 10, 0),
        ["商店"] = Vector3.new(50, 10, 50),
        ["秘密基地"] = Vector3.new(100, 10, 100)
    }
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos[selected])
end)

-- UI 美化设置
local UISettings = {
    Draggable = true,
    Minimize = true,
    Transparency = 0.9,
    CornerRadius = UDim.new(0, 10)
}

-- 适配手机和电脑
local ScreenGui = Window.ScreenGui
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false