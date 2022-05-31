tool
class_name Function_FallDamage
extends MovementProvider


## Signal invoked when the player takes fall damage
signal player_fall_damage


## Movement provider order
export var order := 1000

## Acceleration limit
export var ground_only := false

## Acceleration limit
export var damage_threshold := 20.0


# Previous velocity
var _previous_velocity := Vector3.ZERO

# Maximum observed acceleration
var _max_acceleration := 0.0


func _ready():
	# Set as always active
	is_active = true

func physics_movement(delta: float, player_body: PlayerBody, disabled: bool):
	# Calculate acceleration and update velocity
	var accel_vector := (player_body.velocity - _previous_velocity)
	_previous_velocity = player_body.velocity

	# Skip if not enabled
	if disabled or !enabled:
		return

	# Detect maximum acceleration
	var accel = accel_vector.length()
	if accel > _max_acceleration:
		_max_acceleration = accel

	# Skip if ground-damage only and not on ground
	if ground_only and not player_body.on_ground:
		return

	# Detect fall damage
	if accel > damage_threshold:
		emit_signal("player_fall_damage")
