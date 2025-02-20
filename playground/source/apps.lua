apps = {}

import "apps/main_menu"
import "apps/meta"

function apps.init()
	apps.switchTo(apps.mainMenu)
end

function apps.switchTo(app)
	if apps.current and apps.current.deinit then
		apps.current.deinit()
	end

	apps.current = app

	if apps.current.init then
		apps.current.init()
	end
end
