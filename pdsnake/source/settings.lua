settings = {}

settings.playSfx = true

settings.load = function()
	print("TODO: settings load")
end

settings.save = function()
	print("TODO: settings save")
end

settings.toggleSfx = function()
	settings.playSfx = not settings.playSfx
end
