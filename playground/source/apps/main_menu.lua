local gfx <const> = playdate.graphics

apps.mainMenu = {
	name = "Main Menu",
	key = "main_menu",
}

function apps.mainMenu.init()
	gfx.clear()
	gfx.drawText("*Playdate Playground*", 12, 12)

	gfx.drawText(meta.versionAndBuild, 12, screen.height - 44);
	gfx.drawText("by " .. meta.author, screen.width - 164, screen.height - 44);
end

function apps.mainMenu.update()
	if playdate.buttonIsPressed(playdate.kButtonA) then
		apps.switchTo(apps.meta)
		return
	end
end
