
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('tintmeter', function(source)
    TriggerClientEvent("tintmeter:useItem", source)
end)
