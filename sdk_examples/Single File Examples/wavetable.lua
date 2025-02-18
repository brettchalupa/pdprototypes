
local NOTE_CHANCE <const> = 0.9 -- play a note 90% of the time, otherwise rest
local STEP_LEN <const> = 8 -- notes are 8 seconds long
local REST_LEN <const> = 1 -- rests are 1 second long

snd = playdate.sound
sample = snd.sample.new("assets/BRAIDS02") -- from https://waveeditonline.com/

-- 
notes = { "D1", "E1", "G1", "A1", "C2", "D2", "E2", "G2", "A2", "C3", "G3", "D4" }

-- more chaotic
--notes = { 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46 }

function makesynth(sample, lforate)
	local s = snd.synth.new()
	s:setWavetable(sample, 256, 64)
	s:setADSR(0, 0.5, 0.5, 2.0)

	local lfo = snd.lfo.new(snd.kLFOTriangle)
	lfo:setCenter(0.5)
	lfo:setDepth(0.5)
	lfo:setDelay(0,1)
	lfo:setRate(lforate)
	lfo:setRetrigger(false)
	
	s:setParameterMod(2, lfo) -- param 2 changes the table position using [0,1] scaling

	return s
end

s1 = makesynth(sample, 0.05)
c1 = snd.channel.new()
c1:addSource(s1)
c1:setPan(-0.6)

s2 = makesynth(sample, 0.04)

s3 = makesynth(sample, 0.06)
c3 = snd.channel.new()
c3:addSource(s3)
c3:setPan(0.6)


local nexttime = 0

function playdate.update() 
	local now = playdate.getCurrentTimeMilliseconds()
	
	if now > nexttime then
		if math.random() < NOTE_CHANCE then
			s1:playMIDINote(notes[math.random(#notes)], 1, STEP_LEN-1.5)
			s2:playMIDINote(notes[math.random(#notes)], 1, STEP_LEN-1.5, snd.getCurrentTime()+1)
			s3:playMIDINote(notes[math.random(#notes)], 1, STEP_LEN-1.5, snd.getCurrentTime()+2)
			nexttime = now + STEP_LEN * 1000
		else
			s1:noteOff()
			s2:noteOff()
			nexttime = now + REST_LEN * 1000
		end
	end
end
