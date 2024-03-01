
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('tintchecker', function(source)
    TriggerClientEvent("tintmeter:useItem", source)
end)
