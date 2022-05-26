extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var material : Material


# Called when the node enters the scene tree for the first time.
func _ready():
	material = $DeathMesh.get_active_material(0).duplicate()
	$DeathMesh.set_surface_material(0, material)
	pass # Replace with function body.

func death_fade():
	$Tween.interpolate_property(
		material,
		"albedo_color",
		Color(0.4,0,0,0.0),
		Color(0.4,0,0,1.0),
		5.0)

	$Tween.start()
