extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var material : Material


# Called when the node enters the scene tree for the first time.
func _ready():
	material = $DeathMesh.get_active_material(0).duplicate()
	$DeathMesh.set_surface_material(0, material)


# Perform the death fade
func death_fade(var fade_color: Color, var duration: float):
	$Tween.interpolate_property(
		material,
		"albedo_color",
		Color(fade_color.r, fade_color.g, fade_color.b, 0.0),
		Color(fade_color.r, fade_color.g, fade_color.b, 1.0),
		duration)

	$Tween.start()
