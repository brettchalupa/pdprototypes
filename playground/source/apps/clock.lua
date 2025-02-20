local gfx <const> = playdate.graphics

apps.clock = {
	name = "Clock",
	key = "clock",
	description = "Displays time related details",
}

function apps.clock.update()
	if playdate.buttonJustPressed(playdate.kButtonB) then
		apps.switchTo(apps.mainMenu)
		return
	end

	gfx.clear()
	gfx.drawText("*Clock*", 12, 12)

	local i = 1

	gfx.drawText("Time active (ms): " .. tostring(playdate.getCurrentTimeMilliseconds()), 12, i * 20 + 24);
	i += 1
	gfx.drawText("Seconds since epoch: " .. tostring(playdate.getSecondsSinceEpoch()), 12, i * 20 + 24);
	i += 1
	gfx.drawText("Current time: " .. currentTime(), 12, i * 20 + 24);
	i += 1
end

function currentTime()
	local timeTable = {}
	local time = playdate.getTime()
	table.insert(timeTable, time.hour)
	table.insert(timeTable, ":")
	table.insert(timeTable, time.minute)
	table.insert(timeTable, ":")
	table.insert(timeTable, time.second)
	return tostring(table.concat(timeTable))
end
