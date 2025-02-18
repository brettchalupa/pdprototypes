function writeHighScore(score)
	playdate.datastore.write({ highScore = score})
end

function readHighScore()
	local save = playdate.datastore.read()

	if save == nil then
		return nil
	end

	return save.highScore
end
