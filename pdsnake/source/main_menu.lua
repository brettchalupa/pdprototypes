local gfx <const> = playdate.graphics

local meta <const> = meta
local sfx <const> = sfx
local fonts <const> = fonts
local xPad <const> = 24
local scene <const> = scene

local updates = 0

function updateMainMenu()
	updates += 1

	if playdate.buttonIsPressed(playdate.kButtonA) then
		sfx.play(sfx.select)
		resetGame()
		scene.switchTo(scene.gameplay)
	end

	gfx.clear()

	gfx.setFont(fonts.medium)

	gfx.drawText(meta.name, xPad, 20);

	gfx.setFont(fonts.small)

	if updates % 60 < 30 then
		gfx.drawText("A   Start", xPad + 4, 120);
		gfx.drawCircleAtPoint(
			xPad + 10,
			130,
			14
		)
	end

	gfx.drawText(meta.versionAndBuild, xPad, screen.height - 44);
	gfx.drawText(meta.author, screen.width - 144, screen.height - 44);
end
