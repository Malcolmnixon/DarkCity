extends Node3D

signal target_diffused

var bomb : Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Detach the bomb until its enabled
	bomb = $Bomb
	remove_child(bomb)

func enable():
	add_child(bomb)

func _on_Fuse_picked_up(_pickable):
	$Bomb/TickingSound.stop()
	$Bomb/Highlight.visible = false
	$Bomb/Fuse.drop_and_free()
	
	emit_signal("target_diffused")
