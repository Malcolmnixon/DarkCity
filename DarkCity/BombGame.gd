extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var targets : Array
var targets_remaining : int
var countdown : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect all target diffused signals
	targets = get_tree().get_nodes_in_group("target")
	targets_remaining = targets.size()
	for t in targets:
		t.connect("target_diffused", self, "_on_target_diffused")

	# Start the threat
	_start_threat()

func _start_threat():
	# Wait for 10 seconds
	yield(get_tree().create_timer(10.0), "timeout")

	# Play the threat message
	$ThreatMessage.play()

func _on_ThreatMessage_finished():
	# Enable all targets
	for t in targets:
		t.enable()

	# Start the game countdown
	countdown = Timer.new()
	add_child(countdown)
	countdown.connect("timeout", self, "_on_countdown_finished")
	countdown.one_shot = true
	countdown.start(180.0)

func _on_target_diffused():
	# Count down until all targets diffused
	targets_remaining -= 1
	if targets_remaining == 0:
		_on_victory()

func _on_countdown_finished():
	# Play the explosion and kill the player
	$Explosion.play()
	$"../Player/PlayerLogic".die()

func _on_Explosion_finished():
	# Restart the game
	get_tree().reload_current_scene()

func _on_victory():
	countdown.stop()
	$Victory.play()

	# Wait for 10 seconds
	yield(get_tree().create_timer(30.0), "timeout")

	# Restart the game
	get_tree().reload_current_scene()
