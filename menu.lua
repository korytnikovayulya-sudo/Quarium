-- =====================================================
--              ПРЕМИУМ МЕНЮ ДЛЯ ДЕЛЬТЫ
--                by Tormentor412
-- =====================================================

print("Загрузка премиум меню...")

-- ===== ПЕРЕМЕННЫЕ =====
local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local gui = Instance.new("ScreenGui")
gui.Name = "PremiumMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ===== ПРИВЕТСТВИЕ "Hello!" =====
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "Hello!"
hello.TextColor3 = Color3.fromRGB(255, 255, 255)
hello.TextScaled = true
hello.Font = Enum.Font.Bold
hello.Parent = gui

-- Убираем "Hello!" через 1.5 секунды
game:GetService("TweenService"):Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
game:GetService("Debris"):AddItem(hello, 1.5)

-- ===== ОСНОВНОЕ МЕНЮ =====
wait(1.5)

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 500)
frame.Position = UDim2.new(0.5, -200, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(0, 100, 255) -- Синий
frame.BackgroundTransparency = 0.3 -- Прозрачный
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- ===== ЗАГОЛОВОК С КНОПКАМИ =====
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
header.BackgroundTransparency = 0
header.Parent = frame

-- Название меню
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🔷 PREMIUM MENU"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.Bold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- Кнопка "Закрыть" (крестик)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 1, -4)
closeBtn.Position = UDim2.new(0.92, 0, 0, 2)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.Bold
closeBtn.Parent = header

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Кнопка "Удалить" (мусорка)
local deleteBtn = Instance.new("TextButton")
deleteBtn.Size = UDim2.new(0, 30, 1, -4)
deleteBtn.Position = UDim2.new(0.85, 0, 0, 2)
deleteBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 50)
deleteBtn.Text = "🗑"
deleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteBtn.TextSize = 18
deleteBtn.Font = Enum.Font.Bold
deleteBtn.Parent = header

deleteBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- ===== ФУНКЦИЯ СОЗДАНИЯ КНОПОК-ГАЛОЧЕК =====
local function createToggle(yPos, labelText, defaultValue)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 40)
    container.Position = UDim2.new(0.05, 0, yPos, 0)
    container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    container.BackgroundTransparency = 0.1
    container.BorderSizePixel = 0
    container.Parent = frame

    -- Текст
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0.05, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 18
    label.Font = Enum.Font.SourceSansBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    -- Сама галочка (белая)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 30, 0, 30)
    toggle.Position = UDim2.new(0.85, 0, 0.05, 0)
    toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Text = defaultValue and "✅" or "⬜"
    toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    toggle.TextSize = 20
    toggle.Font = Enum.Font.Bold
    toggle.Parent = container

    local state = defaultValue
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = state and "✅" or "⬜"
        return state
    end)

    return {container, toggle, function() return state end}
end

-- ===== СОЗДАНИЕ ФУНКЦИЙ =====
-- ESP
local espToggle = createToggle(0.12, "📡 ESP (подсветка игроков)", false)
-- Silent Aim
local silentAimToggle = createToggle(0.25, "🎯 Silent Aim (авто-прицел)", false)
-- ESP Survivors
local espSurvivors = createToggle(0.38, "👤 ESP Survivors", false)
-- ESP Killers
local espKillers = createToggle(0.51, "👹 ESP Killers", false)

-- ===== КНОПКА ДЛЯ ПЕРЕЗАПУСКА МЕНЮ =====
local restartBtn = Instance.new("TextButton")
restartBtn.Size = UDim2.new(0.3, 0, 0, 35)
restartBtn.Position = UDim2.new(0.35, 0, 0.68, 0)
restartBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
restartBtn.BackgroundTransparency = 0.2
restartBtn.Text = "🔄 Перезапустить"
restartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
restartBtn.TextSize = 16
restartBtn.Font = Enum.Font.SourceSansBold
restartBtn.Parent = frame

restartBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    wait(0.5)
    frame.Visible = true
end)

-- ===== ФУНКЦИЯ ESP (простая) =====
local function updateESP()
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr ~= player and plr.Character then
            local highlight = Instance.new("Highlight")
            highlight.Parent = plr.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.Enabled = false
            -- Здесь можно добавить логику включения/выключения
        end
    end
end

-- ===== НИК В ЛЕВОМ НИЖНЕМ УГЛУ =====
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0, 200, 0, 20)
watermark.Position = UDim2.new(0, 10, 1, -30)
watermark.BackgroundTransparency = 1
watermark.Text = "👑 Tormentor412 Owner"
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.TextSize = 14
watermark.Font = Enum.Font.SourceSansBold
watermark.TextXAlignment = Enum.TextXAlignment.Left
watermark.Parent = gui

print("✅ Премиум меню загружено! Приятной игры, Tormentor412!")
