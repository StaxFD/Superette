_Superette.Menu = _Superette.Menu or {}
_Superette.Menu.Create = function(Shop)
    print(Shop)
    _Superette.Menu.main = RageUI.CreateMenu(_Superette.Translations.Menu.Title, _Superette.Translations.Menu.Title)
    _Superette.Menu.SousMenuSup = RageUI.CreateSubMenu(_Superette.Menu.main,_Superette.Translations.Menu.Title, _Superette.Translations.Menu.Title)
end