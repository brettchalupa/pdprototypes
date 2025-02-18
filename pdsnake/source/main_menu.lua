local gfx <const> = playdate.graphics

local version <const> = playdate.metadata.version
local build <const> = playdate.metadata.buildNumber
local versionAndBuild <const> = version .. " (" .. build .. ")"
local author <const> = playdate.metadata.author

local xPad <const> = 24

local updates = 0

function updateMainMenu()
	updates += 1

	if playdate.buttonIsPressed(playdate.kButtonA) then
		sfx.play(sfx.select)
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

	gfx.drawText(versionAndBuild, xPad, screen.height - 44);
	gfx.drawText(author, screen.width - 144, screen.height - 44);
end
