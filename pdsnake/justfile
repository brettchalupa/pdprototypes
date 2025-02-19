compile:
	rm -rf pdsnake.pdx
	pdc source pdsnake.pdx

simulate: compile
	killall -9 PlaydateSimulator -q || true
	PlaydateSimulator pdsnake.pdx

alias run := simulate

release:
	rm -rf pdsnake-release.pdx
	pdc -s source pdsnake-release.pdx
	zip -r pdsnake-release.pdx.zip pdsnake-release.pdx
