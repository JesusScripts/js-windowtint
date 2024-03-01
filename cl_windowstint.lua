ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local tint = nil

RegisterNetEvent('tintmeter:useItem', function()
    local vehicle, distance = ESX.Game.GetClosestVehicle()
    local playerPed = PlayerPedId()
    if vehicle and distance <= 2 then
        ExecuteCommand("me Attaching tint meter to the window")
        RequestAnimDict('weapons@first_person@aim_rng@generic@projectile@sticky_bomb@')
        while not HasAnimDictLoaded('weapons@first_person@aim_rng@generic@projectile@sticky_bomb@') do Citizen.Wait(100) end
        if lib.progressBar({
            duration = 2000,
            label = 'Attaching tint meter to the window',
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
            },
            anim = {
                dict = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@',
                clip = 'plant_vertical' 
            },
        }) then
            Citizen.Wait(2000)
            ExecuteCommand("do Device measuring window transparency")
            if lib.progressBar({
                duration = 10000,
                label = 'Measuring window transparency',
                useWhileDead = false,
                canCancel = true,
            }) then
                if GetVehicleWindowTint(vehicle) == -1  then
                    ExecuteCommand('do This vehicle has basic window tint')
                elseif GetVehicleWindowTint(vehicle) == 0 then
                    ExecuteCommand('do This vehicle has no window tint')
                elseif GetVehicleWindowTint(vehicle) == 1 then
                    ExecuteCommand('do This vehicle has window tint: Pure Black')
                elseif GetVehicleWindowTint(vehicle) == 2 then
                    ExecuteCommand('do This vehicle has window tint: Dark Smoke')
                elseif GetVehicleWindowTint(vehicle) == 3 then
                    ExecuteCommand('do This vehicle has window tint: Light Smoke')
                elseif GetVehicleWindowTint(vehicle) == 4 then
                    ExecuteCommand('do This vehicle has basic window tint')
                elseif GetVehicleWindowTint(vehicle) == 5 then
                    ExecuteCommand('do This vehicle has window tint: Limo')
                elseif GetVehicleWindowTint(vehicle) == 6 then
                    ExecuteCommand('do This vehicle has window tint: Green')
                end
            end
        end
    else 
        lib.notify({
            title = 'Tintmeter',
            description = 'You are far from the vehicle',
            type = 'error'
        })
    end
end)
