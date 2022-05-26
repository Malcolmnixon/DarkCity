extends Spatial

signal target_diffused

var target_active := true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Fuse_picked_up(pickable):
	if not target_active:
		return
	
	$TickingSound.stop()
	$Highlight.visible = false
	
	emit_signal("target_diffused")
