local gfx <const> = playdate.graphics

apps.mainMenu = {
	name = "Main Menu",
	key = "main_menu",
}

function apps.mainMenu.update()
	gfx.clear()
	gfx.drawText("*Playdate Playground*", 12, 12)

	gfx.drawText(meta.versionAndBuild, 12, screen.height - 44);
	gfx.drawText("by " .. meta.author, screen.width - 164, screen.height - 44);
end
