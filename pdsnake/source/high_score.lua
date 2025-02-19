highScore = {}

function highScore.write(score)
	local save = playdate.datastore.read()

	if save == nil then
		save = {}
	end

	save.highScore = score

	playdate.datastore.write(save)
end

function highScore.read()
	local save = playdate.datastore.read()

	if save == nil then
		return 0
	end

	return save.highScore
end
