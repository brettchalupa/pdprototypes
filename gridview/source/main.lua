import 'CoreLibs/ui/gridview.lua'
import 'CoreLibs/graphics'

local gfx = playdate.graphics
gfx.clear()

local menuOptions = {"Sword", "Shield", "Arrow", "Sling", "Stone", "Longbow", "MorningStar", "Armour", "Dagger", "Rapier", "Skeggox", "War Hammer", "Battering Ram", "Catapult"}

local listview = playdate.ui.gridview.new(0, 30)
listview:setNumberOfRows(#menuOptions)
listview:setCellPadding(0, 0, 13, 10)
listview:setContentInset(24, 24, 13, 11)

function listview:drawCell(section, row, column, selected, x, y, width, height)
	if selected then
		gfx.setColor(gfx.kColorBlack)
		gfx.fillRoundRect(x, y, width, 24, 4)
		gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
	else
		gfx.setImageDrawMode(gfx.kDrawModeCopy)
	end
	gfx.drawText(menuOptions[row], x, y+6, width, height+10, nil, gfx.kWrapClip, gfx.kAlignCenter)
end

function playdate.upButtonDown()
	listview:selectPreviousRow(true)
end

function playdate.downButtonDown()
	listview:selectNextRow(true)
end

local drawGridview = true

function playdate.AButtonDown()
	drawGridview = not drawGridview
	gfx.clear()
end

function playdate.BButtonDown()
	local fps = playdate.display.getRefreshRate()
	if fps == 50 then
		playdate.display.setRefreshRate(30)
	else
		playdate.display.setRefreshRate(50)
	end
end

function playdate.update()
	playdate.timer.updateTimers()

	if drawGridview then
		gfx.setColor(gfx.kColorWhite)
		gfx.fillRect(100, 12, 160, 200)
		listview:drawInRect(100, 12, 160, 200)
	end

	playdate.drawFPS(20, 20)
end
