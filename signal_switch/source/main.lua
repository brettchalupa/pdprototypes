local scenes = {}

scenes.mainMenu = {}
function scenes.mainMenu.update()
	playdate.graphics.drawText("Main Menu", 10, 10)
	if playdate.buttonJustPressed(playdate.kButtonA) then
		scenes.current = scenes.gameplay
	end
end

scenes.gameplay = {}
function scenes.gameplay.update()
	playdate.graphics.drawText("Gameplay", 10, 10)
	if playdate.buttonJustPressed(playdate.kButtonB) then
		scenes.current = scenes.mainmenu
	end
end

scenes.current = scenes.mainMenu

function playdate.update()
	playdate.graphics.clear()
	scenes.current.update()
end

function playdate.serialMessageReceived(message)
	print("Received message: " .. message)
	if string.find(message, "scene:") == 1 then
		local scene = string.sub(message, 7)
		print("Switching to " .. scene .. " from serialMessageReceived")
		local newScene = scenes[scene]

		if newScene == nil then
			print("Scene " .. scene .. " does not exist")
			return
		end

		scenes.current = newScene
	end
end
