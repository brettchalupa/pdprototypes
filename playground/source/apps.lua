apps = {}

import "apps/accel"
import "apps/main_menu"
import "apps/meta"
import "apps/sysinfo"
import "apps/time"

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
