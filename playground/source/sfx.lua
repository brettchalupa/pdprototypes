sfx = {}

function sfx.play(note)
	sfx.synth:playNote(note, 0.5, 0.1)
end

sfx.back = "B4"
sfx.select = "B5"
sfx.up = "E5"
sfx.down = "A5"

sfx.synth = playdate.sound.synth.new(playdate.sound.kWaveSine)
