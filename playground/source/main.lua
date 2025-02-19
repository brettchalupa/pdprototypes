import "CoreLibs/object"
import "meta"
import "screen"

local meta <const> = meta

function playdate.update()
	playdate.graphics.clear()
	playdate.graphics.drawText("*Playdate Playground*", 12, 12)

	if meta.isDebug then
		playdate.drawFPS(screen.width - 24, 12)
	end
end
