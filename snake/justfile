compile:
	rm -rf snake.pdx
	pdc source snake.pdx

simulate: compile
	killall -9 PlaydateSimulator -q || true
	PlaydateSimulator snake.pdx

alias run := simulate
