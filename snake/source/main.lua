import "CoreLibs/graphics"
import "main_menu"
import "gameplay"

local scene = "main_menu"

local menu = playdate.getSystemMenu()
menu:addMenuItem("reset score", function()
	playdate.datastore.write({ highScore = 0 })
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
end

function switchScene(newScene)
	scene = newScene
end

