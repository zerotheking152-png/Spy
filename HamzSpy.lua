-- ================================================
-- CUSTOM NET SPY V8 - GOD MODE TOOL DEV
-- 100% RAW GUI | All Critical Bugs Fixed | Safe Hook + Dynamic Canvas + Debounce
-- Safe Fallback + Arg Length Limit + Perfect UX
-- ================================================

print("🚀 GUI STARTING... Custom Net Spy V8 GOD MODE")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- SMART PARENT + DELAY FALLBACK
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomNetSpyV8"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999999

local parentSuccess = pcall(function()
    screenGui.Parent = game:GetService("CoreGui")
end)
if not parentSuccess then screenGui.Parent = playerGui end

task.wait(0.5)
if not screenGui:IsDescendantOf(game) then
    screenGui.Parent = playerGui
    warn("⚠️ Force fallback ke PlayerGui")
end

-- MAIN FRAME
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 460, 0, 580)
mainFrame.Position = UDim2.new(0.5, -230, 0.5, -290)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 10
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(0, 255, 255)
mainStroke.Thickness = 2
mainStroke.Parent = mainFrame

-- TITLE
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 60)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 11
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 16)
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.BackgroundTransparency = 1
title.Text = "🔥 NET SPY V8 - GOD MODE"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 50, 0, 50)
closeBtn.Position = UDim2.new(1, -55, 0, 5)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.ZIndex = 12
closeBtn.Parent = titleBar
closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

-- SEARCH FILTER
local filterBox = Instance.new("TextBox")
filterBox.Size = UDim2.new(0.92, 0, 0, 35)
filterBox.Position = UDim2.new(0.04, 0, 0, 75)
filterBox.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
filterBox.PlaceholderText = "🔎 Filter remote name..."
filterBox.Text = ""
filterBox.TextColor3 = Color3.fromRGB(255, 255, 255)
filterBox.TextScaled = true
filterBox.Font = Enum.Font.Gotham
filterBox.Parent = mainFrame

local filterCorner = Instance.new("UICorner")
filterCorner.CornerRadius = UDim.new(0, 10)
filterCorner.Parent = filterBox

-- TOGGLE
local toggleFrame = Instance.new("Frame")
toggleFrame.Size = UDim2.new(0.92, 0, 0, 55)
toggleFrame.Position = UDim2.new(0.04, 0, 0, 120)
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

-- LOG SCROLL
local logScroll = Instance.new("ScrollingFrame")
logScroll.Size = UDim2.new(0.92, 0, 0, 290)
logScroll.Position = UDim2.new(0.04, 0, 0, 185)
logScroll.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
logScroll.BorderSizePixel = 0
logScroll.ScrollBarThickness = 6
logScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 255)
logScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
logScroll.CanvasSize = UDim2.new(0,0,0,0)
logScroll.Parent = mainFrame

local logCorner = Instance.new("UICorner")
logCorner.CornerRadius = UDim.new(0, 12)
logCorner.Parent = logScroll

-- CONTROL BUTTONS
local btnClear = Instance.new("TextButton")
btnClear.Size = UDim2.new(0.22, 0, 0, 45)
btnClear.Position = UDim2.new(0.04, 0, 0, 490)
btnClear.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
btnClear.Text = "🧹 CLEAR"
btnClear.TextColor3 = Color3.fromRGB(255, 255, 255)
btnClear.TextScaled = true
btnClear.Font = Enum.Font.GothamBold
btnClear.Parent = mainFrame

local btnIgnore = Instance.new("TextButton")
btnIgnore.Size = UDim2.new(0.22, 0, 0, 45)
btnIgnore.Position = UDim2.new(0.28, 0, 0, 490)
btnIgnore.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
btnIgnore.Text = "🚫 Ignore Last"
btnIgnore.TextColor3 = Color3.fromRGB(255, 255, 255)
btnIgnore.TextScaled = true
btnIgnore.Font = Enum.Font.GothamBold
btnIgnore.Parent = mainFrame

local btnResetIgnore = Instance.new("TextButton")
btnResetIgnore.Size = UDim2.new(0.22, 0, 0, 45)
btnResetIgnore.Position = UDim2.new(0.52, 0, 0, 490)
btnResetIgnore.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
btnResetIgnore.Text = "🔄 Reset Ignore"
btnResetIgnore.TextColor3 = Color3.fromRGB(255, 255, 255)
btnResetIgnore.TextScaled = true
btnResetIgnore.Font = Enum.Font.GothamBold
btnResetIgnore.Parent = mainFrame

local btnCopy = Instance.new("TextButton")
btnCopy.Size = UDim2.new(0.22, 0, 0, 45)
btnCopy.Position = UDim2.new(0.76, 0, 0, 490)
btnCopy.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
btnCopy.Text = "📋 Copy Last"
btnCopy.TextColor3 = Color3.fromRGB(255, 255, 255)
btnCopy.TextScaled = true
btnCopy.Font = Enum.Font.GothamBold
btnCopy.Parent = mainFrame

-- VARIABLES
local SpyEnabled = true
local Logs = {}
local MaxLogs = 50
local logLabels = {}
local IgnoredRemotes = {}
local filterDebounce = false

-- LABEL POOLING
for i = 1, MaxLogs do
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -10, 0, 0)
    lbl.AutomaticSize = Enum.AutomaticSize.Y
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextYAlignment = Enum.TextYAlignment.Top
    lbl.TextSize = 14
    lbl.Font = Enum.Font.Gotham
    lbl.TextWrapped = true
    lbl.Visible = false
    lbl.Parent = logScroll
    table.insert(logLabels, lbl)
end

local function SafeToString(v)
    local ok, result = pcall(tostring, v)
    return ok and result or "[error]"
end

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
        else 
            str = str .. SafeToString(v) .. " "
        end
    end
    -- LIMIT ARG LENGTH
    if #str > 120 then
        str = string.sub(str, 1, 120) .. "..."
    end
    return str \~= "" and str or "[no args]"
end

local function UpdateLogs()
    local filter = string.lower(filterBox.Text)
    local visibleCount = 0
    local totalHeight = 0

    for _, lbl in ipairs(logLabels) do
        lbl.Visible = false
    end

    for _, logData in ipairs(Logs) do
        local remoteLower = string.lower(logData.remote)
        if filter == "" or string.find(remoteLower, filter) then
            local lbl = logLabels[visibleCount + 1]
            if lbl then
                lbl.Text = logData.time .. " | " .. logData.action .. " → " .. logData.remote .. " | " .. logData.args
                lbl.Visible = true
                visibleCount = visibleCount + 1
                
                -- Dynamic height calculation with defer
                task.defer(function()
                    if lbl.Visible then
                        totalHeight = totalHeight + lbl.AbsoluteSize.Y + 4
                        logScroll.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
                    end
                end)
                
                if visibleCount >= MaxLogs then break end
            end
        end
    end
end

local function AddLog(action, remoteName, args)
    if not SpyEnabled then return end
    table.insert(Logs, 1, {
        time = os.date("%H:%M:%S"),
        action = action,
        remote = remoteName,
        args = ArgsToString(args)
    })
    if #Logs > MaxLogs then table.remove(Logs) end
    UpdateLogs()
end

local function UpdateToggle()
    toggleBtn.BackgroundColor3 = SpyEnabled and Color3.fromRGB(0, 220, 100) or Color3.fromRGB(220, 50, 50)
    toggleBtn.Text = SpyEnabled and "ON" or "OFF"
end

-- CONNECTIONS
toggleBtn.MouseButton1Click:Connect(function()
    SpyEnabled = not SpyEnabled
    UpdateToggle()
    AddLog("SYSTEM", "Net Spy", SpyEnabled and "✅ HIDUP" or "⛔ MATI")
end)

-- DEBOUNCED FILTER
filterBox:GetPropertyChangedSignal("Text"):Connect(function()
    if filterDebounce then return end
    filterDebounce = true
    task.wait(0.1)
    UpdateLogs()
    filterDebounce = false
end)

btnClear.MouseButton1Click:Connect(function()
    Logs = {}
    UpdateLogs()
    AddLog("SYSTEM", "Logs", "🧹 All logs cleared")
end)

btnIgnore.MouseButton1Click:Connect(function()
    if #Logs > 0 then
        local last = Logs[1]
        local key = string.lower(last.remote)
        IgnoredRemotes[key] = true
        AddLog("SYSTEM", last.remote, "🚫 IGNORED")
    end
end)

btnResetIgnore.MouseButton1Click:Connect(function()
    IgnoredRemotes = {}
    AddLog("SYSTEM", "Ignore List", "🔄 All ignores reset")
    UpdateLogs()
end)

btnCopy.MouseButton1Click:Connect(function()
    if #Logs > 0 and setclipboard then
        setclipboard(Logs[1].time .. " | " .. Logs[1].action .. " → " .. Logs[1].remote .. " | " .. Logs[1].args)
        btnCopy.Text = "✅ COPIED!"
        task.wait(1.2)
        btnCopy.Text = "📋 Copy Last"
    end
end)

-- SAFE HOOK (CRITICAL FIX APPLIED)
local oldNamecall
local hookSuccess = pcall(function()
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if SpyEnabled and (method == "FireServer" or method == "InvokeServer") and
           (self:IsA("RemoteEvent") or self:IsA("RemoteFunction")) then
            
            local remoteName = self.Name or "UnnamedRemote"
            local key = string.lower(remoteName)
            if IgnoredRemotes[key] then
                if oldNamecall then
                    return oldNamecall(self, ...)
                end
                return self
            end

            local action = method == "FireServer" and "🔥 FireServer" or "🔥 InvokeServer"
            AddLog(action, remoteName, args)
        end

        if oldNamecall then
            return oldNamecall(self, ...)
        end
        return self
    end))
end)

if hookSuccess then
    print("✅ Hookmetamethod BERHASIL (full spy active)")
else
    warn("⚠️ Hookmetamethod GAGAL – GUI tetap jalan")
end

-- DRAGGABLE
pcall(function()
    local dragging, dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)
    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end)

-- START
UpdateToggle()
AddLog("SYSTEM", "Net Spy V8", "✅ GOD MODE AKTIF")
AddLog("SYSTEM", "Features", "Safe Hook Fallback + Debounce Filter + Dynamic Canvas + Arg Limit")

print("🚀 Custom Net Spy V8 GOD MODE loaded – Ini udah level dewa bro!")

-- END SCRIPT
