import "CoreLibs/timer"
import "CoreLibs/graphics"
import "store"
import "fonts"
import "sfx"
import "settings"
import "screen"
import "scene"
import "meta"
import "high_score"
import "main_menu"
import "gameplay"

local settings <const> = settings
local scene <const> = scene
local meta <const> = meta

settings.load()

playdate.display.setRefreshRate(50)

local menu = playdate.getSystemMenu()
menu:addCheckmarkMenuItem("play sfx", settings.playSfx, settings.toggleSfx)
menu:addMenuItem("reset score", function()
	highScore.write(0)
end)
menu:addMenuItem("main menu", function()
	scene.switchTo(scene.mainMenu)
end)

function playdate.update()
	playdate.timer.updateTimers()

	scene.updateCurrent()

	if meta.isDebug then
		playdate.drawFPS(screen.width - 24, 12)
	end
end
