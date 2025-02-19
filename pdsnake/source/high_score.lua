highScore = {}

function highScore.write(score)
	store.mergeAndWrite({ highScore = score })
end

function highScore.read()
	local save = store.read()

	if save == nil or save.highScore == nil then
		return 0
	else
		return save.highScore
	end
end
