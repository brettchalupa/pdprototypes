import "CoreLibs/object"
import "meta"
import "screen"
import "apps"

local meta <const> = meta
local apps <const> = apps

local currentApp = apps.mainMenu

function playdate.update()
	currentApp.update()

	if meta.isDebug then
		playdate.drawFPS(screen.width - 24, 12)
	end
end
