settings = {
	playSfx = true, -- default
	batterySaver = false -- default
}

function settings.load()
	local save = store.read()

	if save then
		if save.playSfx ~= nil then
			settings.playSfx = save.playSfx
		end

		if save.batterySaver ~= nil then
			settings.batterySaver = save.batterySaver
		end
	end

	settings.setFrameRate()

	return settings
end

function settings.save()
	store.mergeAndWrite({
		playSfx = settings.playSfx,
		batterySaver = settings.batterySaver
	})
end

function settings.toggleSfx()
	settings.playSfx = not settings.playSfx
	settings.save()
end

function settings.toggleBatterySaver()
	settings.batterySaver = not settings.batterySaver
	settings.save()
	settings.setFrameRate()
end

function settings.setFrameRate()
	if settings.batterySaver then
		playdate.display.setRefreshRate(25)
	else
		playdate.display.setRefreshRate(50)
	end
end
