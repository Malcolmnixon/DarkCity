extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Fuse_picked_up(pickable):
	$TickingSound.stop()
	$Highlight.visible = false
