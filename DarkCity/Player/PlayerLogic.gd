extends Node3D


func _ready():
	GameSignals.connect("game_started",Callable(self,"_on_game_started"))
	GameSignals.connect("death_by_bombs",Callable(self,"_on_death_by_bombs"))
	GameSignals.connect("death_by_falling",Callable(self,"_on_death_by_falling"))
	GameSignals.connect("death_by_drowning",Callable(self,"_on_death_by_drowning"))

	await get_tree().create_timer(1.0).timeout
	XRServer.center_on_hmd(XRServer.RESET_BUT_KEEP_TILT, true)


func _on_game_started():
	# Disable screen controls
	$"../RightHandController/FunctionPointer".enabled = false

	# Enable game controls
	$"../LeftHandController/MovementDirect".enabled = true
	$"../LeftHandController/MovementJump".enabled = true
	$"../RightHandController/MovementDirect".enabled = true
	$"../RightHandController/MovementGrapple".enabled = true
	$"../RightHandController/MovementJump".enabled = true
	$"../MovementClimb".enabled = true
	$"../MovementGlide".enabled = true
	$"../FallDamage".enabled = true

	# Enable player body
	$"../PlayerBody".enabled = true


func _on_death_by_bombs():
	$"../XRCamera3D/DeathFade".death_fade(Color.RED, 5.0)
	$"../PlayerBody".enabled = false


func _on_death_by_falling():
	$Fall.play()
	$"../XRCamera3D/DeathFade".death_fade(Color.RED, 2.0)
	$"../PlayerBody".enabled = false


func _on_death_by_drowning():
	$Drown.play()
	$"../XRCamera3D/DeathFade".death_fade(Color.DARK_BLUE, 0.5)
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


func _on_Function_Fall_damage_player_fall_damage(_damage: float):
	GameSignals.emit_signal("death_by_falling")
