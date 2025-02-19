scene = {
	mainMenu = "main_menu",
	gameplay = "gameplay",
}

scene.current = scene.mainMenu

function scene.updateCurrent()
	if scene.current == scene.mainMenu then
		updateMainMenu()
	elseif scene.current == scene.gameplay then
		updateGameplay()
	end
end

function scene.switchTo(targetScene)
	if targetScene == nil then
		print("ERROR: nil scene attempted to be switched to")
		return
	end

	scene.current = targetScene
end
