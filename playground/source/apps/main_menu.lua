local gfx <const> = playdate.graphics

apps.mainMenu = {
	name = "Main Menu",
}

local currentAppIndex = 1
local mainMenu <const> = apps.mainMenu
local menuApps = {}

function apps.mainMenu.init()
	if #menuApps == 0 then
		for k, v in pairs(apps) do
			if k ~= "current" and k ~= "mainMenu" and not util.isFunction(v) then
				table.insert(menuApps, v)
			end
		end
	end

	table.sort(menuApps, function(a, b)
		return a.name < b.name
	end)
end

function apps.mainMenu.update()
	if playdate.buttonJustPressed(playdate.kButtonA) then
		sfx.play(sfx.select)
		apps.switchTo(menuApps[currentAppIndex])
		return
	end

	if playdate.buttonJustPressed(playdate.kButtonUp) then
		sfx.play(sfx.up)

		currentAppIndex -= 1
		if currentAppIndex < 1 then
			currentAppIndex = #menuApps
		end
	end

	if playdate.buttonJustPressed(playdate.kButtonDown) then
		sfx.play(sfx.down)

		currentAppIndex += 1
		if currentAppIndex > #menuApps then
			currentAppIndex = 1
		end
	end

	-- todo: refactor to only draw this when it changes
	gfx.clear()
	gfx.setFont(fonts.medium)
	gfx.drawText("Playdate Playground", 12, 12)

	gfx.setFont(fonts.small)
	gfx.drawText(meta.versionAndBuild, 12, screen.height - 44);
	gfx.drawText("by " .. meta.author, screen.width - 164, screen.height - 44);
	mainMenu.drawApps()
end

function mainMenu.drawApps()
	for i, v in pairs(menuApps) do
		gfx.drawText(v.name, 24, i * 24 + 42)

		if currentAppIndex == i then
			gfx.fillRect(math.sin(playdate.getCurrentTimeMilliseconds() / 140) + 8, i * 24 + 42 + 6, 8, 8, 0)
		end
	end
end
