ESX = nil
local xPlayer = {}
local job1 = 'test'
local job = ''
local grade = ''
local grade1 = 0
local generiert = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end
   
	ESX.PlayerData = ESX.GetPlayerData()
end)

---------------------------------------------------------------------------------------------------
_menuPool = NativeUI.CreatePool()
---------------------------------------------------------------------------------------------------

if Config.Command then
    RegisterCommand(Config.CommandName, function(source, args)
        ESX.PlayerData = ESX.GetPlayerData()
            local job2 = ESX.PlayerData.job.name
            local grade2 = ESX.PlayerData.job.grade
            Citizen.Wait(100)
            for k,v in pairs(Config.Jobs) do
                if v.name == job2 then
                    mainMenu = {}
                    openMenu(job2)
                end
            end
    end, false)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)

    if Config.enableKeyUsage then
        if IsControlJustReleased(0, Config.Key) then
            ESX.PlayerData = ESX.GetPlayerData()
            local job2 = ESX.PlayerData.job.name
            local grade2 = ESX.PlayerData.job.grade
                Citizen.Wait(100)
            for k,v in pairs(Config.Jobs) do
                if v.name == job2 then
                    mainMenu = {}
                    openMenu(job2)
                end
            end
        end
    end
    _menuPool:ProcessMenus()
   end
end)

RegisterNetEvent("emergencyPhone:openMenu")
AddEventHandler("emergencyPhone:openMenu", function()
    print('Debug')
    ESX.PlayerData = ESX.GetPlayerData()
    local job2 = ESX.PlayerData.job.name
    local grade2 = ESX.PlayerData.job.grade
        Citizen.Wait(100)
    for k,v in pairs(Config.Jobs) do
        if v.name == job2 then
            mainMenu = {}
            openMenu(job2)
            break
        end
    end
end)

function openMenu(job1)
    menuOpen = true
    local mainMenu = NativeUI.CreateMenu(Translation[Config.Locale]['menu_header'], Translation[Config.Locale]['menu_subtitle'])
    _menuPool:Add(mainMenu)

    ESX.TriggerServerCallback("emergencyPhone:getName", function(name)
        local msg = ""
        msg = name
        local besetztVon = NativeUI.CreateItem(Translation[Config.Locale]['menu_item_inuse'] .. msg, "")
        mainMenu:AddItem(besetztVon)
        if msg == Translation[Config.Locale]['menu_not_in_use'] then
            besetztVon:SetLeftBadge(BadgeStyle.Alert)
        else
            besetztVon:SetLeftBadge(BadgeStyle.Tick)
        end
    end, job1)

    Citizen.Wait(500)

    local takeEPhone = NativeUI.CreateItem(Translation[Config.Locale]['menu_item_claim'],'')
    mainMenu:AddItem(takeEPhone)
    takeEPhone:RightLabel('~b~→→→')
    local giveBackEPhone = NativeUI.CreateItem(Translation[Config.Locale]['menu_item_back'],'')
    mainMenu:AddItem(giveBackEPhone)
    giveBackEPhone:RightLabel('~b~→→→')
    local clearEPhone = NativeUI.CreateItem(Translation[Config.Locale]['menu_item_clear'],'')
    mainMenu:AddItem(clearEPhone)
    clearEPhone:RightLabel('~b~→→→')
    
    local notify = _menuPool:AddSubMenu(mainMenu, Translation[Config.Locale]['menu2_header'])
    mainMenu.Items[5]:SetLeftBadge(BadgeStyle.Star)
    mainMenu.Items[5]:RightLabel('~b~→→→')
    local message = NativeUI.CreateItem(Translation[Config.Locale]['menu2_item_onduty'],Translation[Config.Locale]['menu2_item_onduty_subtitle'])
    notify:AddItem(message)
    local message2 = NativeUI.CreateItem(Translation[Config.Locale]['menu2_item_break'],Translation[Config.Locale]['menu2_item_break_subtitle'])
    notify:AddItem(message2)
    local message3 = NativeUI.CreateItem(Translation[Config.Locale]['menu2_item_offduty'],Translation[Config.Locale]['menu2_item_offduty_subtitle'])
    notify:AddItem(message3)
    local message4 = NativeUI.CreateItem(Translation[Config.Locale]['menu2_item_own'],Translation[Config.Locale]['menu2_item_own_subtitle'])
    notify:AddItem(message4)


    mainMenu.OnItemSelect = function(sender, item, index)
        if item == takeEPhone then
            
            ESX.TriggerServerCallback('emergencyPhone:check', function(check) 
                if check then
                   ShowNotification(Translation[Config.Locale]['msg_ephone_inuse']) 
                else
                    TriggerServerEvent("emergencyPhone:saveNumber", job1)
                    ShowNotification(Translation[Config.Locale]['msg_ephone_take'])
                    
                    mainMenu:Visible(false)
                    Citizen.Wait(1000)
                    TriggerServerEvent('gcPhone:allUpdate')
                    ESX.TriggerServerCallback("emergencyPhone:getNumber", function(phone) 
                        ShowNotification(Translation[Config.Locale]['msg_ephone_newNumber'].. phone)
                    end)
                    
                end

            end, job1)
        end
        if item == giveBackEPhone then
            
            ESX.TriggerServerCallback('emergencyPhone:checkInUse', function(check) 
                print(check)
                if check then
                    TriggerServerEvent("emergencyPhone:returnNumber", job1)
                    ShowNotification(Translation[Config.Locale]['msg_ephone_giveback'])
                    
                    mainMenu:Visible(false)
                    Citizen.Wait(1000)
                    TriggerServerEvent('gcPhone:allUpdate')
                    ESX.TriggerServerCallback("emergencyPhone:getNumber", function(phone) 
                        ShowNotification(Translation[Config.Locale]['msg_ephone_newNumber'].. phone)
                    end)
                else
                    ShowNotification(Translation[Config.Locale]['dont']) 
                end

            end, job1)
        end
        if item == clearEPhone then
            ESX.TriggerServerCallback('emergencyPhone:check', function(check) 
                if not check then
                    ShowNotification(Translation[Config.Locale]['msg_ephone_notinsuse']) 
                else
                    TriggerServerEvent("emergencyPhone:resetEPhone",job1)
                    Citizen.Wait(200)
                    TriggerServerEvent('gcPhone:allUpdate')
                    ShowNotification(Translation[Config.Locale]['msg_ephone_cleared'])
                end

            end, job1)
        end
    end

    notify.OnItemSelect = function(sender, item, index)
        if item == message then
            TriggerServerEvent('emergencyPhone:OnDutyMessage', job1)
        end
        if item == message2 then
            TriggerServerEvent('emergencyPhone:breakMessage', job1)
        end
        if item == message3 then
            TriggerServerEvent('emergencyPhone:offDutyMessage', job1)
        end
        if item == message4 then
            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'leitstelleMessage', {
                title = Translation[Config.Locale]['menu2_item_dialog']
            }, function(data2, menu2)
			local msg = data2.value
			menu2.close()
            mainMenu:Visible(false)
            TriggerServerEvent('emergencyPhone:ownMessage', job1, msg)
		end,
		function(data2, menu2)
		menu2.close()
        mainMenu:Visible(false)
		end)

        end
    end


    mainMenu:Visible(true)

    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
	_menuPool:RefreshIndex()
end

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

