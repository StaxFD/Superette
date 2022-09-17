function _SuperetteButton(Shop)
    for k,v in pairs(_Superette.systeme) do            
        RageUI.Button(v.categorie.." ("..#v.items.." items)", nil, {LeftBadge = RageUI.BadgeStyle.Star}, true, {
            onSelected = function()
                _Superette.toItemSUP = v.items
            end,
        }, _Superette.Menu.SousMenuSup)
    end
end

function _SuperetteSupButton(Shop)
    for k,v in pairs(_Superette.toItemSUP) do 
        RageUI.Button(v.label,nil,{LeftBadge = RageUI.BadgeStyle.Star,RightLabel = _Superette.Translations.Menu.colorprice..v.price.."$"},true,{
            onSelected = function()
                TriggerServerEvent("_/Stax_/:BuyItem_/", Shop, v.price, v.name, v.label)
            end,
        })
    end
end
