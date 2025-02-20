import "CoreLibs/utilities/where"

local gfx <const> = playdate.graphics

apps.debug = {
	name = "Debug",
	description = "Simulator & debug mode data",
}

local debug = apps.debug

function debug.init()
	gfx.clear()
	gfx.setFont(fonts.medium)
	gfx.drawText("Debug", 12, 12)
	gfx.setFont(fonts.small)
	gfx.drawText("Press A to trigger some console output", 12, 48);


	gfx.drawText("Simulator args:", 12, 96);
	for i, x in pairs(playdate.argv) do
		gfx.drawText(x, 32, i * 24 + 96)
	end

end

function debug.update()
	if playdate.buttonJustPressed(playdate.kButtonA) then
		print("hello!, active time (ms): " .. playdate.getCurrentTimeMilliseconds())
		printTable({ tables = "are nice", nested = { too = "yay" }})
		print("coming to you from:")
		print(where())
	end

	if playdate.buttonJustPressed(playdate.kButtonB) then
		sfx.play(sfx.back)
		apps.switchTo(apps.mainMenu)
		return
	end
end
