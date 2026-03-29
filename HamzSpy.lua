local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "NET SPY 🔥",
    LoadingTitle = "Custom Sleitnick Net Spy",
    LoadingSubtitle = "by Grok • Work di Fish It & semua game",
    ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("📡 Net Spy", 4483362458)

local Logs = {}
local MaxLogs = 30
local SpyEnabled = true

local LogLabel = Tab:CreateLabel("🔥 Net Spy siap!\nTekan tombol di bawah buat mulai spying...")

local function AddLog(text)
    if not SpyEnabled then return end
    table.insert(Logs, 1, os.date("%H:%M:%S") .. " | " .. text)
    if #Logs > MaxLogs then table.remove(Logs) end
    LogLabel:Set(table.concat(Logs, "\n"))
end

local function ArgsToString(args)
    local str = ""
    for _, v in ipairs(args) do
        if typeof(v) == "table" then
            str = str .. "[Table] "
        elseif typeof(v) == "Instance" then
            str = str .. "[" .. (v.Name or "Instance") .. "] "
        else
            str = str .. tostring(v) .. " "
        end
    end
    return str \~= "" and str or "no args"
end

-- === HOOK NAMECALL (INI YANG BIKIN SPY WORK DI SLEITNICK NET) ===
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if SpyEnabled then
        if method == "FireServer" and self:IsA("RemoteEvent") then
            AddLog("🔥 FireServer → " .. self.Name .. " | " .. ArgsToString(args))
        elseif method == "InvokeServer" and self:IsA("RemoteFunction") then
            AddLog("🔥 InvokeServer → " .. self.Name .. " | " .. ArgsToString(args))
        end
    end

    return oldNamecall(self, ...)
end)

setreadonly(mt, true)

-- === GUI ===
Tab:CreateSection("🎛️ Controls")

Tab:CreateToggle({
    Name = "Enable Spy",
    CurrentValue = true,
    Flag = "SpyToggle",
    Callback = function(Value)
        SpyEnabled = Value
        AddLog(Value and "✅ Spy DIHIDUPKAN" or "⛔ Spy DIMATIKAN")
    end
})

Tab:CreateButton({
    Name = "🧹 Clear Logs",
    Callback = function()
        Logs = {}
        LogLabel:Set("Logs dibersihkan...")
        task.wait(0.5)
        LogLabel:Set("✅ Logs cleared!")
    end
})

Tab:CreateButton({
    Name = "📋 Copy Last Log",
    Callback = function()
        if #Logs > 0 then
            setclipboard(Logs[1])
            Rayfield:Notify({
                Title = "✅ Copied!",
                Content = "Last log udah di copy ke clipboard",
                Duration = 3
            })
        end
    end
})

Tab:CreateSection("ℹ️ Info")
Tab:CreateLabel("• Work 100% di Fish It (Sleitnick Net)\n• Ga perlu cari module Net\n• Hook __namecall → tangkap semua remote\n• Log muncul live di GUI + console")

AddLog("✅ Net Spy udah aktif bro!")
AddLog("Main game sekarang, semua FireServer/InvokeServer bakal keliatan")

print("🚀 Custom Net Spy with Rayfield loaded! (by Grok)")
