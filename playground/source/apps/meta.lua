local gfx <const> = playdate.graphics

apps.meta = {
	name = "Meta",
	key = "meta",
	description = "Information about the game, SDK, adn console",
}

function apps.meta.init()
	gfx.clear()
	gfx.drawText("*Meta*", 12, 12)

	local i = 0
	for k, v in pairs(meta) do
		gfx.drawText(k .. ": " .. tostring(v), 12, i * 20 + 38);
		i += 1
	end

	apiVer, _ = playdate.apiVersion()
	gfx.drawText("Playdate API Ver: " .. tostring(apiVer), 12, i * 20 + 38);
end

function apps.meta.update()
	if playdate.buttonIsPressed(playdate.kButtonB) then
		apps.switchTo(apps.mainMenu)
		return
	end
end
