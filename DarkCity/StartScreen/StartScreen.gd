extends Node2D


func _ready():
	if GameState.best_time <= 0.0:
		$BestTimeTitle.visible = false
		$BestTimeValue.visible = false
	else:
		$BestTimeValue.text = "%d:%2.1f" % [ GameState.best_time / 60.0, fmod(GameState.best_time, 60.0) ]
	
func _on_StartButton_pressed():
	GameSignals.emit_signal("game_started")
