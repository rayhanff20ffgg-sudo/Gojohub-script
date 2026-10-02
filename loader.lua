--[[
╔══════════════════════════════════════════════╗
║           G O J O H U B   v5.0               ║
║      Steal An Egg / Ester Egg | NO KEY 🔓    ║
║      Style: Black & White                    ║
║      Telegram: @gojohub                      ║
╚══════════════════════════════════════════════╝
--]]

--============================================================
-- SERVICES
--============================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")

local LP = Players.LocalPlayer

--============================================================
-- CONFIG
--============================================================
local CONFIG = {
    Title = "GOJOHUB",
    Subtitle = "Steal An Egg | @gojohub",
    Version = "v5.0",
    Logo = "https://www.image2url.com/r2/default/images/1790923645788-82e8cffb-a5b9-49fa-9f7d-a6197307046e.webp",
    C = {
        White    = Color3.fromRGB(255, 255, 255),
        Black    = Color3.fromRGB(10, 10, 10),
        DarkBg   = Color3.fromRGB(18, 18, 18),
        PanelBg  = Color3.fromRGB(25, 25, 25),
        CardBg   = Color3.fromRGB(32, 32, 32),
        Border   = Color3.fromRGB(60, 60, 60),
        Text     = Color3.fromRGB(240, 240, 240),
        TextDim  = Color3.fromRGB(150, 150, 150),
        Inactive = Color3.fromRGB(80, 80, 80),
    }
}

--============================================================
-- STATE
--============================================================
local State = {
    AutoSteal = false, AutoStealAll = false, AutoHitStealers = false,
    AutoPlaceSelected = false, AutoPlaceAll = false, AutoHatchReady = false,
    AutoServerHop = false, ESP = false,
    TravelSpeed = 200, MinimumIncome = 0,
    Fly = false, Noclip = false, InfiniteJump = false,
}

--============================================================
-- CLEANUP
--============================================================
pcall(function()
    local old = LP.PlayerGui:FindFirstChild("GOJOHUB")
    if old then old:Destroy() end
end)

--============================================================
-- GUI ROOT
--============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GOJOHUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = LP:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 720, 0, 460)
Main.Position = UDim2.new(0.5, -360, 0.5, -230)
Main.BackgroundColor3 = CONFIG.C.DarkBg
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 10)
mc.Parent = Main

local ms = Instance.new("UIStroke")
ms.Color = CONFIG.C.Border
ms.Thickness = 1
ms.Parent = Main

--============================================================
-- HEADER
--============================================================
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 48)
Header.BackgroundColor3 = CONFIG.C.Black
Header.BorderSizePixel = 0
Header.Parent = Main

local hc = Instance.new("UICorner")
hc.CornerRadius = UDim.new(0, 10)
hc.Parent = Header

local hfix = Instance.new("Frame")
hfix.Size = UDim2.new(1, 0, 0, 12)
hfix.Position = UDim2.new(0, 0, 1, -12)
hfix.BackgroundColor3 = CONFIG.C.Black
hfix.BorderSizePixel = 0
hfix.Parent = Header

-- IKON LOGO DI HEADER
local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 36, 0, 36)
Logo.Position = UDim2.new(0, 8, 0.5, -18)
Logo.BackgroundTransparency = 1
Logo.Image = CONFIG.Logo
Logo.ScaleType = Enum.ScaleType.Crop
Logo.Parent = Header

local lc = Instance.new("UICorner")
lc.CornerRadius = UDim.new(1, 0)
lc.Parent = Logo

local ls = Instance.new("UIStroke")
ls.Color = CONFIG.C.White
ls.Thickness = 1
ls.Parent = Logo

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -200, 0, 24)
Title.Position = UDim2.new(0, 52, 0, 6)
Title.BackgroundTransparency = 1
Title.Text = CONFIG.Title .. "  ·  " .. CONFIG.Version
Title.TextColor3 = CONFIG.C.White
Title.TextSize = 15
Title.Font = Enum.Font.Code
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -200, 0, 16)
Subtitle.Position = UDim2.new(0, 52, 0, 26)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = CONFIG.Subtitle
Subtitle.TextColor3 = CONFIG.C.TextDim
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.Code
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

-- ICON SEARCH
local SearchBar = Instance.new("Frame")
SearchBar.Size = UDim2.new(0, 260, 0, 28)
SearchBar.Position = UDim2.new(1, -380, 0.5, -14)
SearchBar.BackgroundColor3 = CONFIG.C.CardBg
SearchBar.BorderSizePixel = 0
SearchBar.Parent = Header

local sbc = Instance.new("UICorner")
sbc.CornerRadius = UDim.new(0, 6)
sbc.Parent = SearchBar

local SearchIcon = Instance.new("TextLabel")
SearchIcon.Size = UDim2.new(0, 24, 1, 0)
SearchIcon.Position = UDim2.new(0, 2, 0, 0)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Text = "🔍"
SearchIcon.TextColor3 = CONFIG.C.TextDim
SearchIcon.TextSize = 12
SearchIcon.Font = Enum.Font.Code
SearchIcon.Parent = SearchBar

local SearchInput = Instance.new("TextBox")
SearchInput.Size = UDim2.new(1, -28, 1, 0)
SearchInput.Position = UDim2.new(0, 26, 0, 0)
SearchInput.BackgroundTransparency = 1
SearchInput.Text = ""
SearchInput.PlaceholderText = "Search..."
SearchInput.PlaceholderColor3 = CONFIG.C.TextDim
SearchInput.TextColor3 = CONFIG.C.Text
SearchInput.TextSize = 12
SearchInput.Font = Enum.Font.Code
SearchInput.TextXAlignment = Enum.TextXAlignment.Left
SearchInput.ClearTextOnFocus = false
SearchInput.Parent = SearchBar

-- TOMBOL CLOSE
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -36, 0.5, -13)
CloseBtn.BackgroundColor3 = CONFIG.C.CardBg
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = CONFIG.C.White
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.Code
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = Header

local cbc = Instance.new("UICorner")
cbc.CornerRadius = UDim.new(0, 6)
cbc.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- TOMBOL MINIMIZE
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 26, 0, 26)
MinBtn.Position = UDim2.new(1, -68, 0.5, -13)
MinBtn.BackgroundColor3 = CONFIG.C.CardBg
MinBtn.Text = "—"
MinBtn.TextColor3 = CONFIG.C.White
MinBtn.TextSize = 14
MinBtn.Font = Enum.Font.Code
MinBtn.BorderSizePixel = 0
MinBtn.Parent = Header

local mbc = Instance.new("UICorner")
mbc.CornerRadius = UDim.new(0, 6)
mbc.Parent = MinBtn

--============================================================
-- DRAG
--============================================================
local dragging, dragInput, dragStart, startPos
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)
Header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

--============================================================
-- SIDEBAR
--============================================================
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 160, 1, -48)
Sidebar.Position = UDim2.new(0, 0, 0, 48)
Sidebar.BackgroundColor3 = CONFIG.C.Black
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local sc2 = Instance.new("UICorner")
sc2.CornerRadius = UDim.new(0, 10)
sc2.Parent = Sidebar

local sf = Instance.new("Frame")
sf.Size = UDim2.new(0, 12, 1, 0)
sf.Position = UDim2.new(1, -12, 0, 0)
sf.BackgroundColor3 = CONFIG.C.Black
sf.BorderSizePixel = 0
sf.Parent = Sidebar

local sp = Instance.new("UIPadding")
sp.PaddingTop = UDim.new(0, 10)
sp.PaddingLeft = UDim.new(0, 8)
sp.PaddingRight = UDim.new(0, 8)
sp.Parent = Sidebar

local sl = Instance.new("UIListLayout")
sl.Padding = UDim.new(0, 3)
sl.SortOrder = Enum.SortOrder.LayoutOrder
sl.Parent = Sidebar

--============================================================
-- CONTENT
--============================================================
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -160, 1, -48)
Content.Position = UDim2.new(0, 160, 0, 48)
Content.BackgroundColor3 = CONFIG.C.DarkBg
Content.BorderSizePixel = 0
Content.Parent = Main

local ctc = Instance.new("UICorner")
ctc.CornerRadius = UDim.new(0, 10)
ctc.Parent = Content

local cf = Instance.new("Frame")
cf.Size = UDim2.new(0, 12, 1, 0)
cf.Position = UDim2.new(0, 0, 0, 0)
cf.BackgroundColor3 = CONFIG.C.DarkBg
cf.BorderSizePixel = 0
cf.Parent = Content

--============================================================
-- PAGES
--============================================================
local Pages = {}
local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 2
    page.ScrollBarImageColor3 = CONFIG.C.TextDim
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = false
    page.Parent = Content

    local l = Instance.new("UIListLayout")
    l.Padding = UDim.new(0, 10)
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.Parent = page

    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0, 14)
    p.PaddingLeft = UDim.new(0, 14)
    p.PaddingRight = UDim.new(0, 14)
    p.PaddingBottom = UDim.new(0, 14)
    p.Parent = page

    Pages[name] = page
end

--============================================================
-- HELPERS
--============================================================
local function createSectionHeader(parent, text)
    local h = Instance.new("Frame")
    h.Size = UDim2.new(1, 0, 0, 24)
    h.BackgroundTransparency = 1
    h.Parent = parent
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 1, 0)
    t.BackgroundTransparency = 1
    t.Text = text
    t.TextColor3 = CONFIG.C.White
    t.TextSize = 13
    t.Font = Enum.Font.Code
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = h
end

local function createSection(parent, title)
    local s = Instance.new("Frame")
    s.Size = UDim2.new(1, 0, 0, 0)
    s.AutomaticSize = Enum.AutomaticSize.Y
    s.BackgroundColor3 = CONFIG.C.PanelBg
    s.BorderSizePixel = 0
    s.Parent = parent

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = s

    local st = Instance.new("UIStroke")
    st.Color = CONFIG.C.Border
    st.Thickness = 1
    st.Parent = s

    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0, 12)
    p.PaddingLeft = UDim.new(0, 14)
    p.PaddingRight = UDim.new(0, 14)
    p.PaddingBottom = UDim.new(0, 14)
    p.Parent = s

    local l = Instance.new("UIListLayout")
    l.Padding = UDim.new(0, 8)
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.Parent = s

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -30, 0, 22)
    t.BackgroundTransparency = 1
    t.Text = title
    t.TextColor3 = CONFIG.C.White
    t.TextSize = 13
    t.Font = Enum.Font.Code
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.LayoutOrder = 0
    t.Parent = s

    return s
end

local function createToggle(parent, text, defaultState, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 30)
    row.BackgroundTransparency = 1
    row.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -60, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = CONFIG.C.Text
    lbl.TextSize = 12
    lbl.Font = Enum.Font.Code
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 44, 0, 22)
    toggle.Position = UDim2.new(1, -44, 0.5, -11)
    toggle.BackgroundColor3 = defaultState and CONFIG.C.White or CONFIG.C.Inactive
    toggle.Text = ""
    toggle.BorderSizePixel = 0
    toggle.Parent = row

    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(1, 0)
    tc.Parent = toggle

    local ball = Instance.new("Frame")
    ball.Size = UDim2.new(0, 16, 0, 16)
    ball.Position = defaultState and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    ball.BackgroundColor3 = CONFIG.C.Black
    ball.BorderSizePixel = 0
    ball.Parent = toggle

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = ball

    local state = defaultState
    toggle.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(toggle, TweenInfo.new(0.15), {
            BackgroundColor3 = state and CONFIG.C.White or CONFIG.C.Inactive
        }):Play()
        TweenService:Create(ball, TweenInfo.new(0.15), {
            Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        }):Play()
        if callback then pcall(callback, state) end
    end)
end

local function createDropdown(parent, text, options, defaultOption, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 30)
    container.BackgroundTransparency = 1
    container.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0, 100, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = CONFIG.C.Text
    lbl.TextSize = 12
    lbl.Font = Enum.Font.Code
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = container

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -110, 1, 0)
    btn.Position = UDim2.new(0, 110, 0, 0)
    btn.BackgroundColor3 = CONFIG.C.CardBg
    btn.Text = defaultOption
    btn.TextColor3 = CONFIG.C.Text
    btn.TextSize = 12
    btn.Font = Enum.Font.Code
    btn.BorderSizePixel = 0
    btn.Parent = container

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn

    local s = Instance.new("UIStroke")
    s.Color = CONFIG.C.Border
    s.Thickness = 1
    s.Parent = btn

    local open = false
    local dropdown

    btn.MouseButton1Click:Connect(function()
        if open then
            open = false
            if dropdown then dropdown:Destroy() end
            return
        end
        open = true

        dropdown = Instance.new("ScrollingFrame")
        dropdown.Size = UDim2.new(1, -110, 0, 120)
        dropdown.Position = UDim2.new(0, 110, 1, 4)
        dropdown.BackgroundColor3 = CONFIG.C.CardBg
        dropdown.BorderSizePixel = 0
        dropdown.ScrollBarThickness = 2
        dropdown.ZIndex = 10
        dropdown.Parent = container

        local dc = Instance.new("UICorner")
        dc.CornerRadius = UDim.new(0, 6)
        dc.Parent = dropdown

        local dl = Instance.new("UIListLayout")
        dl.Padding = UDim.new(0, 2)
        dl.Parent = dropdown

        for _, opt in ipairs(options) do
            local ob = Instance.new("TextButton")
            ob.Size = UDim2.new(1, -8, 0, 26)
            ob.BackgroundColor3 = CONFIG.C.PanelBg
            ob.Text = opt
            ob.TextColor3 = CONFIG.C.Text
            ob.TextSize = 11
            ob.Font = Enum.Font.Code
            ob.BorderSizePixel = 0
            ob.Parent = dropdown

            local oc = Instance.new("UICorner")
            oc.CornerRadius = UDim.new(0, 4)
            oc.Parent = ob

            ob.MouseButton1Click:Connect(function()
                btn.Text = opt
                open = false
                dropdown:Destroy()
                if callback then pcall(callback, opt) end
            end)
        end
    end)
end

local function createSlider(parent, text, minVal, maxVal, defaultVal, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 40)
    container.BackgroundTransparency = 1
    container.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 16)
    lbl.BackgroundTransparency = 1
    lbl.Text = text .. ": " .. defaultVal
    lbl.TextColor3 = CONFIG.C.Text
    lbl.TextSize = 12
    lbl.Font = Enum.Font.Code
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = container

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, 0, 0, 4)
    bar.Position = UDim2.new(0, 0, 0, 26)
    bar.BackgroundColor3 = CONFIG.C.Inactive
    bar.BorderSizePixel = 0
    bar.Parent = container

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = bar

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
    fill.BackgroundColor3 = CONFIG.C.White
    fill.BorderSizePixel = 0
    fill.Parent = bar

    local fc = Instance.new("UICorner")
    fc.CornerRadius = UDim.new(1, 0)
    fc.Parent = fill

    local dragging = false
    local function update(input)
        local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        local val = math.floor(minVal + (maxVal - minVal) * pos)
        fill.Size = UDim2.new(pos, 0, 1, 0)
        lbl.Text = text .. ": " .. val
        if callback then pcall(callback, val) end
    end

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = CONFIG.C.CardBg
    btn.Text = text
    btn.TextColor3 = CONFIG.C.Text
    btn.TextSize = 12
    btn.Font = Enum.Font.Code
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Parent = parent

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn

    local s = Instance.new("UIStroke")
    s.Color = CONFIG.C.Border
    s.Thickness = 1
    s.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = CONFIG.C.White}):Play()
        TweenService:Create(btn, TweenInfo.new(0.15), {TextColor3 = CONFIG.C.Black}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = CONFIG.C.CardBg}):Play()
        TweenService:Create(btn, TweenInfo.new(0.15), {TextColor3 = CONFIG.C.Text}):Play()
