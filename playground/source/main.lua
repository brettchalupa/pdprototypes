import "CoreLibs/object"
import "util"
import "meta"
import "screen"
import "apps"
import "sfx"
import "fonts"

local gfx <const> = playdate.graphics
local fonts <const> = fonts
local meta <const> = meta
local apps <const> = apps

apps.init()
gfx.setFont(fonts.small)

function playdate.update()
	apps.current.update()

	if meta.isDebug then
		playdate.drawFPS(screen.width - 24, 12)
	end
end
