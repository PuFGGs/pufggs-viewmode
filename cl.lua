Citizen.CreateThread(function()
    local fpsnowpg = false
    while true do
        Citizen.Wait(10)
        DisableControlAction(0, 0, true)


        if IsDisabledControlJustReleased(0, 0) and PuFGGs.JUST_2_VIEW_MODE then
            if fpsnowpg then
                ChangeView(4)
                fpsnowpg = false
            else
                ChangeView(0)
                fpsnowpg = true
            end
        end

        if IsPedSittingInAnyVehicle(PlayerPedId()) and PuFGGs.FPS_MODE_DRIVEBY then
            if IsPedDoingDriveby(PlayerPedId()) then
                ChangeView(4)
                fpsnowpg = true
            end
        end

        if PuFGGs.FPS_MODE_ONFOOT then
            local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId())
            if aiming then
                ChangeView(4)
                fpsnowpg = true
            end            
        end
    end
end)

function ChangeView(value)
    SetFollowPedCamViewMode(value)
    SetFollowVehicleCamViewMode(value)
end