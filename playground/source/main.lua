import "CoreLibs/object"
import "util"
import "meta"
import "screen"
import "apps"

local meta <const> = meta
local apps <const> = apps

apps.init()

function playdate.update()
	apps.current.update()

	if meta.isDebug then
		playdate.drawFPS(screen.width - 24, 12)
	end
end
