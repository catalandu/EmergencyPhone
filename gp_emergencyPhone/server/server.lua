ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

ESX.RegisterServerCallback('emergencyPhone:getName', function(source, cb, job)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	local office = ''

	for k,v in pairs(Config.Jobs) do
		if v.name == job then
			office = v.lable
		end
	end

	MySQL.Async.fetchAll('SELECT * FROM emergencyPhone WHERE office = @office',{
		['@office'] = office
	},function(results)
		if #results == 1 then
			local name = results[1].firstname .. ' '.. results[1].lastname
			print(name)
			cb(name)
		else
			name = Translation[Config.Locale]['menu_not_in_use']
			cb(name)
		end
	end)
	
end)
ESX.RegisterServerCallback('emergencyPhone:getJob', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local job = xPlayer.getJob().name
	cb(job)
end)
ESX.RegisterServerCallback('emergencyPhone:getRang', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local grade = xPlayer.getJob().grade
	cb(grade)
end)
ESX.RegisterServerCallback('emergencyPhone:getNumber', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	local phone = ''
	
	MySQL.Async.fetchAll('SELECT * FROM ' .. Config.UserTable .. ' WHERE ' .. Config.IdentifierTable .. '= @identifier', {
		['@identifier'] = identifier
	}, function(results)
		if #results >= 1 then
			for k,v in pairs(results) do
				phone = v.phone_number
				cb(phone)
			end
		end
	end)

end)

ESX.RegisterServerCallback('emergencyPhone:check', function(source, cb, job)
	local office = ''

	for k,v in pairs(Config.Jobs) do
		if v.name == job then
			office = v.lable
		end
	end

	MySQL.Async.fetchAll('SELECT * FROM emergencyPhone WHERE office = @office AND NOT identifier = @identifier',{
		['@identifier'] = 1,
		['@office'] = office
	},function(results)
		if #results == 1 then
			cb(true)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('emergencyPhone:checkInUse', function(source, cb, job)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	local office = ''

	for k,v in pairs(Config.Jobs) do
		if v.name == job then
			office = v.lable
		end
	end

	MySQL.Async.fetchAll('SELECT * FROM emergencyPhone WHERE identifier = @identifier AND office = @office',{
		['@identifier'] = identifier,
		['@office'] = office
	},function(results)
		if #results == 1 then
			cb(true)
		else
			cb(false)
		end
	end)
end)


RegisterServerEvent('emergencyPhone:saveNumber')
AddEventHandler('emergencyPhone:saveNumber', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	local firstname = ''
	local lastname = ''
	local phone = ''
	local office = ''

	for k,v in pairs(Config.Jobs) do
		if v.name == job then
			office = v.lable
		end
	end
	
	MySQL.Async.fetchAll('SELECT * FROM ' .. Config.UserTable ..  ' WHERE ' .. Config.IdentifierTable .. ' = @identifier', {
		['@identifier'] = identifier
	}, function(results)
		if #results >= 1 then
			for k,v in pairs(results) do
				firstname = v.firstname
				lastname = v.lastname
				phone = v.phone_number
			end

			MySQL.Sync.execute('INSERT INTO `emergencyPhone`(`identifier`, `firstname`, `lastname`,`phone_number`,`office`) VALUES (@identifier,@firstname,@lastname,@phone,@office)', { 
				['@identifier'] = identifier,
				['@firstname'] = firstname,
				['@lastname'] = lastname,
				['@phone'] = phone,
				['@office'] = office,
			})

			for k,v in pairs(Config.Jobs) do
				if v.name == job then
					phone = v.number
				end
			end
			MySQL.Async.execute('UPDATE ' .. Config.UserTable ..  ' SET ' .. Config.NumberTable .. ' =@newNumber WHERE ' .. Config.IdentifierTable .. ' = @identifier',{['@identifier'] = identifier,['@newNumber'] = phone}, function() end)
		end
	end)
end)

RegisterServerEvent('emergencyPhone:returnNumber')
AddEventHandler('emergencyPhone:returnNumber', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	local phone = ''
	local office = ''

	for k,v in pairs(Config.Jobs) do
		if v.name == job then
			office = v.lable
		end
	end
	
	MySQL.Async.fetchAll('SELECT * FROM emergencyPhone WHERE identifier = @identifier AND office = @office', {
		['@identifier'] = identifier,
		['@office'] = office,
	}, function(results)
		print(#results)
		if #results == 1 then
			for k,v in pairs(results) do
				phone = v.phone_number
				print(phone)
			end
			MySQL.Async.execute('UPDATE ' .. Config.UserTable .. ' SET ' .. Config.NumberTable .. ' =@newNumber WHERE ' .. Config.IdentifierTable .. ' = @identifier',{['@identifier'] = identifier,['@newNumber'] = phone}, function() end)
			MySQL.Sync.execute('DELETE FROM `emergencyPhone` WHERE identifier = @identifier AND office = @office', { 
				['@identifier'] = identifier,
				['@office'] = office,
			})
		end
	end)
end)

RegisterServerEvent('emergencyPhone:resetEPhone')
AddEventHandler('emergencyPhone:resetEPhone', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	local firstname = ''
	local lastname = ''
	local phone = ''
	
	local office = ''

	for k,v in pairs(Config.Jobs) do
		if v.name == job then
			office = v.lable
		end
	end

	MySQL.Async.fetchAll('SELECT * FROM emergencyPhone WHERE office = @office AND NOT id = @id', {
		['@office'] = office,
		['@id'] = 1
	}, function(results)
		if #results >= 1 then
			for k,v in pairs(results) do
				identifier = v.identifier
				phone = v.phone_number
				
				MySQL.Async.execute('UPDATE ' .. Config.UserTable .. ' SET ' .. Config.NumberTable .. ' =@newNumber WHERE ' .. Config.IdentifierTable .. ' = @identifier',{['@identifier'] = identifier,['@newNumber'] = phone}, function() end)
				
				MySQL.Sync.execute('DELETE FROM `emergencyPhone` WHERE office = @office', { 
					['@office'] = office,
				})
			end
		end
	end)
end)

RegisterServerEvent('emergencyPhone:OnDutyMessage')
AddEventHandler('emergencyPhone:OnDutyMessage', function(job)
	_source  = source
	xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if job == 'mechanic' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_mechanic_header'], Translation[Config.Locale]['msg_mechanic_subtitle'], Translation[Config.Locale]['msg_mechanic_text'], Translation[Config.Locale]['msg_mechanic_picture'], Translation[Config.Locale]['msg_mechanic_badged'])
		elseif job == 'police' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_police_header'], Translation[Config.Locale]['msg_police_subtitle'], Translation[Config.Locale]['msg_police_text'], Translation[Config.Locale]['msg_police_picture'], Translation[Config.Locale]['msg_police_badged'])
		elseif job == 'bennys' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_bennys_header'], Translation[Config.Locale]['msg_bennys_subtitle'], Translation[Config.Locale]['msg_bennys_text'],Translation[Config.Locale]['msg_bennys_picture'], Translation[Config.Locale]['msg_bennys_badged'])
		elseif job == 'ambulance' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_ambulance_header'], Translation[Config.Locale]['msg_ambulance_subtitle'], Translation[Config.Locale]['msg_ambulance_text'], Translation[Config.Locale]['msg_ambulance_picture'], Translation[Config.Locale]['msg_ambulance_badged'])
		elseif job == 'cardealer' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_cardealer_header'], Translation[Config.Locale]['msg_cardealer_subtitle'], Translation[Config.Locale]['msg_cardealer_text'], Translation[Config.Locale]['msg_cardealer_picture'], Translation[Config.Locale]['msg_cardealer_badged'])
		end
	end
end)

RegisterServerEvent('emergencyPhone:breakMessage')
AddEventHandler('emergencyPhone:breakMessage', function(job)
	_source  = source
	xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if job == 'mechanic' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_mechanic_header'], Translation[Config.Locale]['msg_mechanic_subtitle'], Translation[Config.Locale]['msg_mechanic_text_break'], Translation[Config.Locale]['msg_mechanic_picture'], Translation[Config.Locale]['msg_mechanic_badged'])
		elseif job == 'police' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_police_header'], Translation[Config.Locale]['msg_police_subtitle'], Translation[Config.Locale]['msg_police_text_break'], Translation[Config.Locale]['msg_police_picture'], Translation[Config.Locale]['msg_police_badged'])
		elseif job == 'bennys' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_bennys_header'], Translation[Config.Locale]['msg_bennys_subtitle'], Translation[Config.Locale]['msg_bennys_text_break'],Translation[Config.Locale]['msg_bennys_picture'], Translation[Config.Locale]['msg_bennys_badged'])
		elseif job == 'ambulance' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_ambulance_header'], Translation[Config.Locale]['msg_ambulance_subtitle'], Translation[Config.Locale]['msg_ambulance_text_break'], Translation[Config.Locale]['msg_ambulance_picture'], Translation[Config.Locale]['msg_ambulance_badged'])
		elseif job == 'cardealer' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_cardealer_header'], Translation[Config.Locale]['msg_cardealer_subtitle'], Translation[Config.Locale]['msg_cardealer_text_break'], Translation[Config.Locale]['msg_cardealer_picture'], Translation[Config.Locale]['msg_cardealer_badged'])
		end
	end
end)

RegisterServerEvent('emergencyPhone:offDutyMessage')
AddEventHandler('emergencyPhone:offDutyMessage', function(job)
	_source  = source
	xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if job == 'mechanic' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_mechanic_header'], Translation[Config.Locale]['msg_mechanic_subtitle'], Translation[Config.Locale]['msg_mechanic_text_offduty'], Translation[Config.Locale]['msg_mechanic_picture'], Translation[Config.Locale]['msg_mechanic_badged'])
		elseif job == 'police' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_police_header'], Translation[Config.Locale]['msg_police_subtitle'], Translation[Config.Locale]['msg_police_text_offduty'], Translation[Config.Locale]['msg_police_picture'], Translation[Config.Locale]['msg_police_badged'])
		elseif job == 'bennys' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_bennys_header'], Translation[Config.Locale]['msg_bennys_subtitle'], Translation[Config.Locale]['msg_bennys_text_offduty'],Translation[Config.Locale]['msg_bennys_picture'], Translation[Config.Locale]['msg_bennys_badged'])
		elseif job == 'ambulance' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_ambulance_header'], Translation[Config.Locale]['msg_ambulance_subtitle'], Translation[Config.Locale]['msg_ambulance_text_offduty'], Translation[Config.Locale]['msg_ambulance_picture'], Translation[Config.Locale]['msg_ambulance_badged'])
		elseif job == 'cardealer' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_cardealer_header'], Translation[Config.Locale]['msg_cardealer_subtitle'], Translation[Config.Locale]['msg_cardealer_text_offduty'], Translation[Config.Locale]['msg_cardealer_picture'], Translation[Config.Locale]['msg_cardealer_badged'])
		end

	end
end)

RegisterServerEvent('emergencyPhone:ownMessage')
AddEventHandler('emergencyPhone:ownMessage', function(job, msg)
	_source  = source
	xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		if job == 'mechanic' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_mechanic_own_header'], Translation[Config.Locale]['msg_mechanic_own_subtitle'], msg, Translation[Config.Locale]['msg_mechanic_picture'], Translation[Config.Locale]['msg_mechanic_badged'])
		elseif job == 'police' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_police_own_header'], Translation[Config.Locale]['msg_police_own_subtitle'], msg, Translation[Config.Locale]['msg_police_picture'], Translation[Config.Locale]['msg_police_badged'])
		elseif job == 'bennys' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_bennys_own_header'], Translation[Config.Locale]['msg_bennys_own_subtitle'], msg, Translation[Config.Locale]['msg_bennys_picture'], Translation[Config.Locale]['msg_bennys_badged'])
		elseif job == 'ambulance' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_ambulance_own_header'], Translation[Config.Locale]['msg_ambulance_own_subtitle'], msg, Translation[Config.Locale]['msg_ambulance_picture'], Translation[Config.Locale]['msg_ambulance_badged'])
		elseif job == 'cardealer' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], Translation[Config.Locale]['msg_cardealer_own_header'], Translation[Config.Locale]['msg_cardealer_own_subtitle'], msg, Translation[Config.Locale]['msg_cardealer_picture'], Translation[Config.Locale]['msg_cardealer_badged'])
		end

	end
end)