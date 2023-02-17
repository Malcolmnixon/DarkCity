extends Node3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var material : StandardMaterial3D


# Called when the node enters the scene tree for the first time.
func _ready():
	material = $DeathMesh.get_active_material(0).duplicate()
	$DeathMesh.set_surface_override_material(0, material)


# Perform the death fade
func death_fade(fade_color: Color, duration: float):
	material.albedo_color = Color(fade_color.r, fade_color.g, fade_color.b, 0.0)

	var tween := get_tree().create_tween()
	tween.tween_property(
		material,
		"albedo_color",
		Color(fade_color.r, fade_color.g, fade_color.b, 1.0),
		duration)
