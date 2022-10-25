extends Node2D


func _ready():
	if GameState.last_time <= 0.0:
		$LastTimeValue.text = "-:--.-"
	else:
		$LastTimeValue.text = "%d:%02.1f" % [ GameState.last_time / 60.0, fmod(GameState.last_time, 60.0) ]

	if GameState.best_time <= 0.0:
		$BestTimeValue.text = "-:--.-"
	else:
		$BestTimeValue.text = "%d:%02.1f" % [ GameState.best_time / 60.0, fmod(GameState.best_time, 60.0) ]

func _on_StartButton_pressed():
	GameSignals.emit_signal("game_started")
