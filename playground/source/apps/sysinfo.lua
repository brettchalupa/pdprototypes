local gfx <const> = playdate.graphics

apps.sysinfo = {
	name = "Sysinfo",
	key = "sysinfo",
	description = "Information about the console",
}

local sysinfo = apps.sysinfo

function apps.sysinfo.update()
	if playdate.buttonJustPressed(playdate.kButtonB) then
		sfx.play(sfx.back)
		apps.switchTo(apps.mainMenu)
		return
	end

	gfx.clear()
	gfx.setFont(fonts.medium)
	gfx.drawText("Sysinfo", 12, 12)
	gfx.setFont(fonts.small)

	local i = 1

	gfx.drawText("Language: " .. sysinfo.currentLanguage(), 12, i * 24 + 28);
	i += 1

	powerStatus = playdate.getPowerStatus()
	local powerStatusStrs = {}
	for k, v in pairs(powerStatus) do
		table.insert(powerStatusStrs, k .. ": " .. tostring(v) .. " | ")
	end
	gfx.drawText("Power Status:", 12, i * 24 + 28);
	i += 1
	gfx.drawText(table.concat(powerStatusStrs), 28, i * 24 + 28);
	i += 1

	gfx.drawText("battery %: " .. tostring(playdate.getBatteryPercentage()), 28, i * 24 + 28);
	i += 1
	gfx.drawText("battery voltage: " .. tostring(playdate.getBatteryVoltage()), 28, i * 24 + 28);
	i += 1
	gfx.drawText("Setting - reduce flashing: " .. tostring(playdate.getReduceFlashing()), 12, i * 24 + 28);
	i += 1
	gfx.drawText("Setting - flipped: " .. tostring(playdate.getFlipped()), 12, i * 24 + 28);
	i += 1
	gfx.drawText("Crank docked: " .. tostring(playdate.isCrankDocked()), 12, i * 24 + 28);
end

function sysinfo.currentLanguage()
	local lang = playdate.getSystemLanguage()

	if lang == playdate.graphics.font.kLanguageEnglish then
		return "English"
	elseif lang == playdate.graphics.font.kLanguageJapanese then
		return "日本語"
	else
		return "Unknown"
	end
end
