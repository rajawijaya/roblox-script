Settings = {
    ["On Screen Trackers"] = true,
    ["Performance"] = {
        ["Disable 3D Rendering"] = false,
        ["Diable Orb Rendering"] = true,
        ["Disable Lootbags"] = true
    },
    ["Auto Collect"] = {
        ["Orbs"] = true,
        ["Lootbags"] = true
    },
    ["Auto Mailbox"] = {
        ["Recipient"] = "YOUR USER HERE", -- Person To Send To
        ["Min Dias"] = 100000000, -- Minumum Gems
        ["Enabled"] = false
    },
	["Multipliers"] = {
		["Giant Chest"] = 0,
        ["Chest"] = 0,
        ["Small Chest"] = 0,
        ["Vault"] = 0,
        ["Safe"] = 3,
        ["Present"] = 5
	},
    ["Webhooks"] = {
        ["Server Hop Webhook"] = "https://discord.com/api/webhooks/1112771449330077727/ID4nSbEjVauigCP1VMyvsXd6LEDex5GaVdqVlmbG8x4bfRlSZY-i9BmXVCOEnfpngQXb",
        ["Time Frame Webhook"] = "https://discord.com/api/webhooks/1114124503405039660/MBoma7dEqXYZUPHlTsVo1nMw5nLQLXN7IvumhBCqU36jenoyieHktmt8IT45gHr2leF6",
        ["Timeframe"] = 60 -- Seconds
    },
    ["Pet Team"] = {
        ["Mode"] = "Manual", -- Best Or Manual: Best = Highest Power, Manual = All Pets With A Certain Nickname
        ["Nickname"] = "MrKronRBLX"
    },
    ["Fruit"] = {
        ["Farm Fruit If Low"] = true,
        ["Min Fruit"] = 100, -- Starts Farming If Below This
        ["Max Fruit"] = 180, -- Stops Farming Once Above This
        ["Mode"] = "Pixel Vault" -- Pixel Vault or Server Hop
    },
    ["Boosts"] = {
        ["Triple Damage"] = true,
        ["Server Damage"] = true
    }
}

local Http = game:GetService("HttpService")

writefile("v4config.txt", Http:JSONEncode(Settings))

Http = game:GetService("HttpService")

Settings = Http:JSONDecode(readfile("v4config.txt"))

if not game:IsLoaded() then
    while not game:IsLoaded() do wait(1) end
end

if Settings["Performance"]["Disable 3D Rendering"] then game:GetService("RunService"):Set3dRenderingEnabled(false) end

local totallabelsize = 0

function makelabel()
    local sg = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.4, 0, 0.2, 0)
    label.Position = UDim2.new(0.05, 0, 0.95 - totallabelsize)
    label.BackgroundColor3 = Color3.new(0, 0, 0)
    label.BackgroundTransparency = 0
    label.BorderSizePixel = 0
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.SourceSansBold
    label.TextScaled = true
    label.TextWrapped = true
    label.Text = "Label"
    label.Parent = sg
    if not Settings["On Screen Trackers"] then sg.Enabled = false end
    
    label.ClipsDescendants = true
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = label
    
    totallabelsize = totallabelsize + 0.25
    
    return label
end

local label1 = makelabel()
local label2 = makelabel()
local label3 = makelabel()

label1.Text = "🌟 | Coins Remaining"
label2.Text = "💎 | Gems Earned"
label3.Text = "🕒 | Time Elapsed"

label1.Position = UDim2.new(0.05, 0, 0.95 - totallabelsize + 0.05)
label2.Position = UDim2.new(0.05, 0, 0.95 - totallabelsize + 0.05 + 0.25)
label3.Position = UDim2.new(0.05, 0, 0.95 - totallabelsize + 0.05 + 0.5)... (16 KB left)