-- ================================================
-- CUSTOM NET SPY V2 - FIXED FOR FISH IT + SLEITNICK NET
-- 100% RAW GUI | No Rayfield | Clean Dark Neon Modern
-- FIXED: Hook + Dynamic Log + Stability
-- ================================================

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomNetSpyV2"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999
screenGui.Parent = game:GetService("CoreGui")

-- MAIN FRAME
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
title.Text = "🔥 NET SPY V2 - FISH IT"
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

-- TOGGLE FRAME + NEON STROKE
local toggleFrame = Instance.new("Frame")
toggleFrame.Size = UDim2.new(0.92, 0, 0, 55)
toggleFrame.Position = UDim2.new(0.04, 0, 0, 75)
toggleFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
toggleFrame.BorderSizePixel = 0
toggleFrame.Parent = mainFrame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 12)
toggleCorner.Parent = toggleFrame

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(0, 255, 255)
toggleStroke.Thickness = 1
toggleStroke.Parent = toggleFrame

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

-- LOG AREA (FIXED: Dynamic Height)
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

-- VARIABLES
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
        elseif t == "nil" then
            str = str .. "[nil] "
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
        lbl.Size = UDim2.new(1, -10, 0, 0)           -- AUTO HEIGHT
        lbl.AutomaticSize = Enum.AutomaticSize.Y
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.TextYAlignment = Enum.TextYAlignment.Top
        lbl.TextScaled = false
        lbl.TextSize = 14
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

-- TOGGLE BUTTON
toggleBtn.MouseButton1Click:Connect(function()
    SpyEnabled = not SpyEnabled
    UpdateToggle()
    AddLog(SpyEnabled and "✅ SPY HIDUP" or "⛔ SPY MATI")
end)

-- CLEAR & COPY
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

-- ==================== FIXED HOOK (MOST IMPORTANT) ====================
-- Hook pake hookmetamethod → 100% work di Fish It + Sleitnick Net
local oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if SpyEnabled and (method == "FireServer" or method == "InvokeServer") and
       (self:IsA("RemoteEvent") or self:IsA("RemoteFunction")) then
        
        local action = method == "FireServer" and "🔥 FireServer" or "🔥 InvokeServer"
        local remoteName = self.Name or "UnnamedRemote"
        AddLog(action .. " → " .. remoteName .. " | " .. ArgsToString(args))
    end

    return oldNamecall(self, ...)
end))

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
AddLog("✅ CUSTOM NET SPY V2 AKTIF (FIXED)")
AddLog("GUI diparent ke CoreGui + Hook hookmetamethod")
AddLog("Semua Remote FireServer/InvokeServer bakal keliatan")
AddLog("Work perfect di Fish It + Sleitnick Net 🔥")

print("🚀 Custom Net Spy V2 FIXED loaded! Work di Fish It + Sleitnick Net.")

-- END SCRIPT
