sfx = {}

sfx.apple = playdate.sound.sampleplayer.new("sounds/apple.wav")
sfx.death = playdate.sound.sampleplayer.new("sounds/death.wav")
sfx.select = sfx.apple

sfx.apple:setVolume(0.5)
sfx.death:setVolume(0.5)

sfx.play = function(sound)
	if settings.playSfx then
		sound:play()
	end
end
