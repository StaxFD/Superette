ESX = nil 
TriggerEvent(_Superette.ESX, function(obj) ESX = obj end)
RegisterNetEvent("_/Stax_/:BuyItem_/")
AddEventHandler("_/Stax_/:BuyItem_/", function(Pos, price, Items, Stax)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xMoney = xPlayer.getMoney()
    if (#(GetEntityCoords(GetPlayerPed(src)) - Pos) > 5) then 
    DropPlayer(src,"Vous avez été kick pour avoir fait une erreur")
        return
    end
    if xMoney >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(Items,1)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Information', '~o~Supérette~s~','Vous avez acheté [~o~ x 1~s~ ~y~'..Stax..' ~s~] pour ~g~'..price..'$~s~','CHAR_MP_FM_CONTACT', 8)
    else
        TriggerClientEvent('esx:showNotification', src, "~r~Vous n'avez pas assez d'argent")
    end
end)