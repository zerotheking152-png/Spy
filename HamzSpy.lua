-- ================================================
-- CUSTOM NET SPY UNTUK FISH IT (100% RAW GUI)
-- Ga pake Rayfield / library apapun
-- Mirip Rayfield: clean, dark, neon, modern
-- Fixed untuk Fish It + Sleitnick Net
-- ================================================

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomNetSpyV2"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999 -- biar selalu di atas
screenGui.Parent = game:GetService("CoreGui")  -- <<< FIX UTAMA (CoreGui)

-- MAIN FRAME (mirip Rayfield)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 440, 0, 560)
mainFrame.Position = UDim2.new(0.5, -220, 0.5, -280)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(0, 255, 255)
mainStroke.Thickness = 1.5
mainStroke.Parent = mainFrame

-- TITLE BAR
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 60)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 16)
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.BackgroundTransparency = 1
title.Text = "🔥 NET SPY - CUSTOM"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = titleBar

-- CLOSE BUTTON
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 50, 0, 50)
closeBtn.Position = UDim2.new(1, -55, 0, 5)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- TOGGLE FRAME
local toggleFrame = Instance.new("Frame")
toggleFrame.Size = UDim2.new(0.92, 0, 0, 55)
toggleFrame.Position = UDim2.new(0.04, 0, 0, 75)
toggleFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
toggleFrame.BorderSizePixel = 0
toggleFrame.Parent = mainFrame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleFrame

local toggleLabel = Instance.new("TextLabel")
toggleLabel.Size = UDim2.new(0.65, 0, 1, 0)
toggleLabel.BackgroundTransparency = 1
toggleLabel.Text = "Enable Net Spy"
toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleLabel.TextScaled = true
toggleLabel.Font = Enum.Font.GothamSemibold
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
toggleLabel.Parent = toggleFrame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 85, 0, 38)
toggleBtn.Position = UDim2.new(1, -95, 0.5, -19)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
toggleBtn.Text = "ON"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Parent = toggleFrame

local toggleBtnCorner = Instance.new("UICorner")
toggleBtnCorner.CornerRadius = UDim.new(0, 10)
toggleBtnCorner.Parent = toggleBtn

-- LOG AREA (Scrolling)
local logScroll = Instance.new("ScrollingFrame")
logScroll.Size = UDim2.new(0.92, 0, 0, 310)
logScroll.Position = UDim2.new(0.04, 0, 0, 145)
logScroll.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
logScroll.BorderSizePixel = 0
logScroll.ScrollBarThickness = 5
logScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 255)
logScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
logScroll.CanvasSize = UDim2.new(0,0,0,0)
logScroll.Parent = mainFrame

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 12)
logCorner.Parent = logScroll

local logList = Instance.new("UIListLayout")
logList.SortOrder = Enum.SortOrder.LayoutOrder
logList.Padding = UDim.new(0, 4)
logList.Parent = logScroll

-- CONTROL BUTTONS
local btnClear = Instance.new("TextButton")
btnClear.Size = UDim2.new(0.45, 0, 0, 45)
btnClear.Position = UDim2.new(0.04, 0, 0, 475)
btnClear.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
btnClear.Text = "🧹 CLEAR LOGS"
btnClear.TextColor3 = Color3.fromRGB(255, 255, 255)
btnClear.TextScaled = true
btnClear.Font = Enum.Font.GothamBold
btnClear.Parent = mainFrame

local btnClearCorner = Instance.new("UICorner")
btnClearCorner.CornerRadius = UDim.new(0, 10)
btnClearCorner.Parent = btnClear

local btnCopy = Instance.new("TextButton")
btnCopy.Size = UDim2.new(0.45, 0, 0, 45)
btnCopy.Position = UDim2.new(0.51, 0, 0, 475)
btnCopy.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
btnCopy.Text = "📋 COPY LAST LOG"
btnCopy.TextColor3 = Color3.fromRGB(255, 255, 255)
btnCopy.TextScaled = true
btnCopy.Font = Enum.Font.GothamBold
btnCopy.Parent = mainFrame

local btnCopyCorner = Instance.new("UICorner")
btnCopyCorner.CornerRadius = UDim.new(0, 10)
btnCopyCorner.Parent = btnCopy

-- VAR
local SpyEnabled = true
local Logs = {}
local MaxLogs = 35
local logLabels = {}

local function ArgsToString(args)
    local str = ""
    for _, v in ipairs(args) do
        local t = typeof(v)
        if t == "table" then
            str = str .. "[Table] "
        elseif t == "Instance" then
            str = str .. "[" .. (v.Name or "Instance") .. "] "
        elseif t == "number" or t == "string" or t == "boolean" then
            str = str .. tostring(v) .. " "
        else
            str = str .. "[" .. t .. "] "
        end
    end
    return str \~= "" and str or "[no args]"
end

local function UpdateLogs()
    for _, lbl in ipairs(logLabels) do
        if lbl and lbl.Parent then lbl:Destroy() end
    end
    logLabels = {}

    for _, text in ipairs(Logs) do
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, -10, 0, 26)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.TextScaled = true
        lbl.Font = Enum.Font.Gotham
        lbl.TextWrapped = true
        lbl.Parent = logScroll
        table.insert(logLabels, lbl)
    end
end

local function AddLog(text)
    if not SpyEnabled then return end
    table.insert(Logs, 1, os.date("%H:%M:%S") .. " | " .. text)
    if #Logs > MaxLogs then table.remove(Logs) end
    UpdateLogs()
end

local function UpdateToggle()
    if SpyEnabled then
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 100)
        toggleBtn.Text = "ON"
    else
        toggleBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        toggleBtn.Text = "OFF"
    end
end

toggleBtn.MouseButton1Click:Connect(function()
    SpyEnabled = not SpyEnabled
    UpdateToggle()
    AddLog(SpyEnabled and "✅ SPY HIDUP" or "⛔ SPY MATI")
end)

btnClear.MouseButton1Click:Connect(function()
    Logs = {}
    UpdateLogs()
    AddLog("🧹 Logs sudah dibersihkan")
end)

btnCopy.MouseButton1Click:Connect(function()
    if #Logs > 0 then
        setclipboard(Logs[1])
        btnCopy.Text = "✅ COPIED!"
        task.wait(1.2)
        btnCopy.Text = "📋 COPY LAST LOG"
    end
end)

-- HOOK __NAMECALL (work di Sleitnick Net)
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if SpyEnabled then
        if (method == "FireServer" or method == "InvokeServer") and 
           (self:IsA("RemoteEvent") or self:IsA("RemoteFunction")) then
            local action = method == "FireServer" and "🔥 FireServer" or "🔥 InvokeServer"
            AddLog(action .. " → " .. self.Name .. " | " .. ArgsToString(args))
        end
    end

    return oldNamecall(self, ...)
end)

setreadonly(mt, true)

-- DRAGGABLE
local dragging, dragInput, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)
titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- START
UpdateToggle()
AddLog("✅ CUSTOM NET SPY V2 AKTIF")
AddLog("GUI diparent ke CoreGui (Fish It safe)")
AddLog("Hook __namecall sudah jalan")
AddLog("Main Fish It sekarang → semua remote bakal keliatan")

print("🚀 Custom Net Spy V2 (RAW GUI) loaded! Work di Fish It + Sleitnick Net.")

-- END SCRIPT
