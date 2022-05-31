extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player_body : PlayerBody = $"../Player/PlayerBody"

var targets : Array
var targets_remaining : int
var countdown : Timer
var alive := true

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect game signals
	GameSignals.connect("death_by_bombs", self, "_on_death_by_bombs")
	GameSignals.connect("death_by_falling", self, "_on_death_by_falling")
	GameSignals.connect("death_by_drowning", self, "_on_death_by_drowning")
	
	# Connect all target diffused signals
	targets = get_tree().get_nodes_in_group("target")
	targets_remaining = targets.size()
	for t in targets:
		t.connect("target_diffused", self, "_on_target_diffused")


func _process(var _delta):
	if alive and player_body.kinematic_node.transform.origin.y < 0.0:
		alive = false
		GameSignals.emit_signal("death_by_drowning")


func _on_target_diffused():
	# Count down until all targets diffused
	targets_remaining -= 1
	if targets_remaining == 0:
		_on_victory()

func _on_death_by_bombs():
	# Play explosion sound
	$Explosion.play()


func _on_Explosion_finished():
	get_tree().reload_current_scene()


func _on_death_by_falling():
	# Stop game timers and sounds
	$ThreatMessage.stop()
	$ThreatTimer.stop()
	$BombsTimer.stop()

	# Wait for 5 seconds then restart the game
	yield(get_tree().create_timer(5.0), "timeout")
	get_tree().reload_current_scene()


func _on_death_by_drowning():
	# Stop game timers and sounds
	$ThreatMessage.stop()
	$ThreatTimer.stop()
	$BombsTimer.stop()

	# Wait for 5 seconds then restart the game
	yield(get_tree().create_timer(5.0), "timeout")
	get_tree().reload_current_scene()


func _on_victory():
	# Stop game timer and play victory sound
	$BombsTimer.stop()
	$Victory.play()


func _on_Victory_finished():
	# Wait for 30 seconds
	yield(get_tree().create_timer(30.0), "timeout")

	# Restart the game
	get_tree().reload_current_scene()


func _on_ThreatTimer_timeout():
	# Start playing the threat message
	$ThreatMessage.play()


func _on_ThreatMessage_finished():
	# Enable all targets
	for t in targets:
		t.enable()

	# Start the game countdown
	$BombsTimer.start()
	countdown = Timer.new()
	add_child(countdown)
	countdown.connect("timeout", GameSignals, "death_by_bombs")
	countdown.one_shot = true
	countdown.start(180.0)


func _on_BombsTimer_timeout():
	GameSignals.emit_signal("death_by_bombs")
