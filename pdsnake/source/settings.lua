settings = {
	playSfx = true,
	isDebug = string.find(playdate.metadata.version, "-dev") ~= nil,
}

function settings.load()
	local save = playdate.datastore.read()

	if save and save.playSfx ~= nil then
		settings.playSfx = save.playSfx
	end

	return settings.playSfx
end

function settings.save()
	local save = playdate.datastore.read()

	if save == nil then
		save = {}
	end

	save.playSfx = settings.playSfx
	playdate.datastore.write(save)
end

function settings.toggleSfx()
	settings.playSfx = not settings.playSfx
	settings.save()
end
