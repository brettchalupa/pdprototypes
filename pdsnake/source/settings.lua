settings = {
	playSfx = true, -- default
}

function settings.load()
	local save = store.read()

	if save and save.playSfx ~= nil then
		settings.playSfx = save.playSfx
	end

	return settings
end

function settings.save()
	store.mergeAndWrite({
		playSfx = settings.playSfx
	})
end

function settings.toggleSfx()
	settings.playSfx = not settings.playSfx
	settings.save()
end
