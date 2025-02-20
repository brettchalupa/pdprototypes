local gfx <const> = playdate.graphics

apps.accel = {
	name = "Accel",
	description = "Accelerometer ball rolling demo",
}

local accel = apps.accel
local clamp <const> = util.clamp
local x, y = nil, nil

function accel.init()
	x, y = 200, 120
	playdate.startAccelerometer()
end

-- ball roll code adapted from Inside Playdate
function accel.update()
	if playdate.buttonJustPressed(playdate.kButtonB) then
		sfx.play(sfx.back)
		apps.switchTo(apps.mainMenu)
		return
	end

	gfx.clear()
	gfx.setFont(fonts.medium)
	gfx.drawText("Accel", 12, 12)
	gfx.setFont(fonts.small)
	gfx.drawText("tilt to roll ball", 260, 16)

	local gravityX, gravityY, _gravityZ = playdate.readAccelerometer()

	x = clamp(x + gravityX * 10, 0, 400)
	y = clamp(y + gravityY * 10, 0, 240)
	gfx.fillCircleAtPoint(x, y, 10)
end

function accel.denit()
	x, y = nil, nil
	playdate.stopAccelerometer()
end
