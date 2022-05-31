extends Spatial


func _ready():
	GameSignals.connect("death_by_bombs", self, "_on_death_by_bombs")
	GameSignals.connect("death_by_falling", self, "_on_death_by_falling")
	GameSignals.connect("death_by_drowning", self, "_on_death_by_drowning")


func _on_death_by_bombs():
	$"../ARVRCamera/DeathFade".death_fade(Color.red, 5.0)
	$"../PlayerBody".enabled = false


func _on_death_by_falling():
	$Fall.play()
	$"../ARVRCamera/DeathFade".death_fade(Color.red, 2.0)
	$"../PlayerBody".enabled = false


func _on_death_by_drowning():
	$Drown.play()
	$"../ARVRCamera/DeathFade".death_fade(Color.darkblue, 0.5)
	$"../PlayerBody".enabled = false


func _on_Function_Grapple_movement_grapple_started():
	$GrappleFire.play()
	$GrappleSwing.play()


func _on_Function_Grapple_movement_grapple_finished():
	$GrappleFire.stop()
	$GrappleSwing.stop()


func _on_Function_Glide_movement_player_glide_start():
	$GlideSound.play()


func _on_Function_Glide_movement_player_glide_end():
	$GlideSound.stop()


func _on_Function_Fall_damage_player_fall_damage():
	GameSignals.emit_signal("death_by_falling")
