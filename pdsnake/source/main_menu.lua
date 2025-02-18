local gfx <const> = playdate.graphics

function updateMainMenu()
	if playdate.buttonIsPressed(playdate.kButtonA) then
		switchScene("gameplay")
	end

	gfx.clear()
	gfx.drawText("*PDSnake*", 40, 40);
	gfx.drawText("Press A to Start", 120, 40);
end
