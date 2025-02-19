-- compile with: pdc -k . tsize.pdx

t = { }

function playdate.update()
	if playdate.buttonJustPressed(playdate.kButtonA) then
		table.insert(t, { gridX = 18 })
	end

	playdate.graphics.clear()

	-- incorrect way:
	playdate.graphics.drawText("getsize: " .. table.getsize(t), 40, 40)

	-- correct way:
	-- playdate.graphics.drawText("#: " .. #t, 40, 40)

	-- learn more at https://devforum.play.date/t/getting-size-of-a-table-with-table-getsize-table-what-is-a-hash-count/9709/8
end
