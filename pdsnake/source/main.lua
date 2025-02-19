import "CoreLibs/object"
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

local menu = playdate.getSystemMenu()
menu:addMenuItem("reset score", function()
	highScore.write(0)
	mainMainu.init()
end)
menu:addCheckmarkMenuItem("play sfx", settings.playSfx, settings.toggleSfx)
menu:addCheckmarkMenuItem("batt. saver", settings.batterySaver, settings.toggleBatterySaver)

function playdate.update()
	playdate.timer.updateTimers()

	scene.updateCurrent()

	if meta.isDebug then
		playdate.drawFPS(screen.width - 24, 12)
	end
end
