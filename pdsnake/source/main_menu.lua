local gfx <const> = playdate.graphics

local screenWidth <const> = playdate.display.getWidth()
local screenHeight <const> = playdate.display.getHeight()

local version <const> = playdate.metadata.version
local build <const> = playdate.metadata.buildNumber
local versionAndBuild <const> = version .. " (" .. build .. ")"
local author <const> = playdate.metadata.author

local xPad <const> = 12

local updates = 0

function updateMainMenu()
	updates += 1

	if playdate.buttonIsPressed(playdate.kButtonA) then
		switchScene("gameplay")
	end

	gfx.clear()

	gfx.drawText("*PDSnake*", xPad, 40);

	if updates % 60 < 30 then
		gfx.drawText("A   Start", xPad + 4, 120);
		gfx.drawCircleAtPoint(
			xPad + 8,
			128,
			12
		)
	end

	gfx.drawText(versionAndBuild, 12, screenHeight - 32);
	gfx.drawText(author, screenWidth - 116, screenHeight - 32);
end
