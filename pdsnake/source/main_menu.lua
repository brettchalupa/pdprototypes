local gfx <const> = playdate.graphics

local screenWidth <const> = playdate.display.getWidth()
local screenHeight <const> = playdate.display.getHeight()

local version <const> = playdate.metadata.version
local build <const> = playdate.metadata.buildNumber
local versionAndBuild <const> = version .. " (" .. build .. ")"
local author <const> = playdate.metadata.author

local xPad <const> = 24

local updates = 0

function updateMainMenu()
	updates += 1

	if playdate.buttonIsPressed(playdate.kButtonA) then
		sfxSelect:play()
		switchScene("gameplay")
	end

	gfx.clear()

	gfx.setFont(fontRoobert20)

	gfx.drawText("PDSnake", xPad, 20);

	gfx.setFont(fontRoobert11)

	if updates % 60 < 30 then
		gfx.drawText("A   Start", xPad + 4, 120);
		gfx.drawCircleAtPoint(
			xPad + 10,
			130,
			14
		)
	end

	gfx.drawText(versionAndBuild, xPad, screenHeight - 44);
	gfx.drawText(author, screenWidth - 144, screenHeight - 44);
end
