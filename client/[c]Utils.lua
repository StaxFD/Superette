ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(80)
    end
    TriggerEvent("Superette:blips")
end)
local tablepositionsandblips = _Superette.positions
function _Superette.Menu:Main(Shop)
    _Superette.Menu.Create(Shop)
    RageUI.Visible(_Superette.Menu.main, not RageUI.Visible(_Superette.Menu.main))
	FreezeEntityPosition(PlayerPedId(),true)
    while _Superette.Menu.main do
        Citizen.Wait(0)
        RageUI.IsVisible(_Superette.Menu.main, function()
            _SuperetteButton(Shop)
        end)
        RageUI.IsVisible(_Superette.Menu.SousMenuSup, function()
            _SuperetteSupButton(Shop)
        end)
        if not RageUI.Visible(_Superette.Menu.main) 
        and not RageUI.Visible(_Superette.Menu.SousMenuSup) 
        then 
            _Superette.Menu.main = RMenu:DeleteType("_Superette.Menu.main", true, FreezeEntityPosition(PlayerPedId(),false))
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local wait = 700
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(tablepositionsandblips) do
            local PositionSup = vector3(v.pos)
            local dst1 = #(playerPos - PositionSup)
            if dst1 < 3.0 then
                wait = 0
                DrawMarker(1, v.pos.x,v.pos.y,v.pos.z-1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 155, 0, 0, 0, 0, 0, 0, 0)
                if dst1 < 2.0 then
                    ESX.ShowHelpNotification(_Superette.Translations.Menu.HelpNotif)
                    if IsControlJustReleased(1, 38) then
                        _Superette.Menu:Main(PositionSup)
                    end
                end
            end
        end
        Wait(wait)
    end
end)


RegisterNetEvent("Superette:blips")
AddEventHandler("Superette:blips", function()
    for k,v in pairs(tablepositionsandblips) do
        blip = AddBlipForCoord(v.pos.x,v.pos.y,v.pos.z)
        SetBlipSprite(blip, 52)
        SetBlipScale(blip, 0.65)
        SetBlipColour(blip, 25)
        SetBlipDisplay(blip, 4)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Superette")
        EndTextCommandSetBlipName(blip)
    end
end)