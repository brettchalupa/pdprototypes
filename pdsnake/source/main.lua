import "CoreLibs/graphics"
import "fonts"
import "sfx"
import "settings"
import "screen"
import "high_score"
import "main_menu"
import "gameplay"

local scene = "main_menu"

local settings <const> = settings

settings.load()

local menu = playdate.getSystemMenu()
menu:addCheckmarkMenuItem("play sfx", settings.playSfx, settings.toggleSfx)
menu:addMenuItem("reset score", function()
	highScore.write(0)
end)
menu:addMenuItem("main menu", function()
	switchScene("main_menu")
end)

function playdate.update()
	if scene == "main_menu" then
		updateMainMenu()
	elseif scene == "gameplay" then
		updateGameplay()
	end

	if settings.isDebug then
		playdate.drawFPS(screen.width - 24, 12)
	end
end

function switchScene(newScene)
	scene = newScene
end
