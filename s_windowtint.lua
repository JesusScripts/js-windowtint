local ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('tintmeter', function(source)
    TriggerClientEvent("tintmeter:useItem", source)
end)
