ESX = nil
local znikaniepropowprzypostaci = false
local autor = "Skrypt zrobiony przez Leszek74 - Zakazuje się używania go w celach komercyjnych"

RegisterCommand("tfixped", function()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
    print(autor)
    if health > 0 then
        if not znikaniepropowprzypostaci then
            znikaniepropowprzypostaci = true
            local model = GetEntityModel(PlayerPedId())
            while not HasModelLoaded(model) do
                RequestModel(model)
                Citizen.Wait(0)
            end
            SetPlayerModel(PlayerId(), model)
            ped = PlayerPedId()
            SetPedDefaultComponentVariation(ped)
            TriggerEvent('skinchanger:getSkin', function(result)
                TriggerEvent('skinchanger:loadSkin', result)
                Citizen.Wait(50)
                SetEntityHealth(ped, health)
            end)
            Citizen.CreateThread(function()
                Citizen.Wait(10000)
                znikaniepropowprzypostaci = false
            end)
        else
            ESX.ShowNotification('Nie możesz tak szybko użyć ponownie propfix')
        end
    else
        ESX.ShowNotification('Nie możesz użyć propfix będąć w stanie BW')
    end
end)
print(autor)
