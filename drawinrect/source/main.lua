-- compile with: pdc -k . drawinrect.pdx

import "CoreLibs/graphics"

local useRect = true
playdate.display.setRefreshRate(50)

function playdate.AButtonDown()
	useRect = not useRect
end

function playdate.update()
	playdate.graphics.clear()

	playdate.graphics.drawRect(40, 40, 80, 20)
	playdate.graphics.drawRect(40, 80, 80, 20)
	playdate.graphics.drawRect(40, 120, 80, 20)
	playdate.graphics.drawRect(200, 40, 80, 20)

	if useRect then
		playdate.graphics.drawTextInRect("*drawTextInRect*", 40, 40, 80, 20, nil, "..", playdate.graphics.kAlignCenter)
		playdate.graphics.drawTextInRect("*drawTextInRect*", 40, 80, 80, 20, nil, "..", playdate.graphics.kAlignCenter)
		playdate.graphics.drawTextInRect("*drawTextInRect*", 40, 120, 80, 20, nil, "..", playdate.graphics.kAlignCenter)
		playdate.graphics.drawTextInRect("*drawTextInRect*", 200, 40, 80, 20, nil, "..", playdate.graphics.kAlignCenter)
	else
		playdate.graphics.drawText("*drawText*", 40, 40, 80, 20, nil, playdate.graphics.kWrapClip, playdate.graphics.kAlignCenter)
		playdate.graphics.drawText("*drawText*", 40, 80, 80, 20, nil, playdate.graphics.kWrapClip, playdate.graphics.kAlignCenter)
		playdate.graphics.drawText("*drawText*", 40, 120, 80, 20, nil, playdate.graphics.kWrapClip, playdate.graphics.kAlignCenter)
		playdate.graphics.drawText("*drawText*", 200, 40, 80, 20, nil, playdate.graphics.kWrapClip, playdate.graphics.kAlignCenter)
	end

	playdate.drawFPS(20, 20)
end

function playdate.BButtonDown()
	local fps = playdate.display.getRefreshRate()
	if fps == 50 then
		playdate.display.setRefreshRate(30)
	else
		playdate.display.setRefreshRate(50)
	end
end
