local gfx <const> = playdate.graphics

apps.input = {
	name = "Input",
	description = "Button presses & crank observer",
}

local input = apps.input

local buttons = nil
local function decodePlaydateButtons(bitmask)
  local pressedButtons = {}

  for _, button in ipairs(buttons) do
    local value, buttonName = button[1], button[2]
    if bitmask &= value ~= 0 then
      table.insert(pressedButtons, buttonName)
    end
  end

  return pressedButtons
end

function input.init()
	buttons = {
		{playdate.kButtonUp, "Up"},
		{playdate.kButtonDown, "Down"},
		{playdate.kButtonLeft, "Left"},
		{playdate.kButtonRight, "Right"},
		{playdate.kButtonA, "A"},
		{playdate.kButtonB, "B"},
	}
end

function input.update()
	gfx.clear()
	gfx.setFont(fonts.medium)
	gfx.drawText("Input", 12, 12)
	gfx.setFont(fonts.small)
	gfx.drawText("Use the Menu button to return to Main Menu", 12, screen.height - 38);

	local down, pressed, released = playdate.getButtonState()

	local i = 1
  for _, button in ipairs(buttons) do
    local value, buttonName = button[1], button[2]

		gfx.drawText(buttonName .. ": " .. tostring(playdate.buttonIsPressed(value)), 12, 24 * i + 24)
		i += 1
  end
end

function input.denit()
	buttons = nil
end
