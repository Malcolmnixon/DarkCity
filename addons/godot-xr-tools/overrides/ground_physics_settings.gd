tool
class_name XRToolsGroundPhysicsSettings
extends Resource

## Enumeration flags for which ground physics properties are enabled
enum GroundPhysicsFlags {
	MOVE_DRAG = 		0b00000001,
	MOVE_TRACTION = 	0b00000010,
	MOVE_MAX_SLOPE = 	0b00000100,
	JUMP_MAX_SLOP = 	0b00001000,
	JUMP_VELOCITY = 	0b00010000,
	BOUNCINESS = 		0b00100000,
	BOUNCE_THRESHOLD = 	0b01000000,
}

## Flags defining which ground velocities are enabled
export (int, FLAGS, 
	"Move Drag", 
	"Move Traction", 
	"Move Max Slope", 
	"Jump Max Slope", 
	"Jump Velocity", 
	"Bounciness", 
	"Bounce Threshold") var flags := 0

## Movement drag factor
export var move_drag := 5.0

## Movement traction factor
export var move_traction := 30.0

## Stop sliding on slope
export var stop_on_slope := true

## Movement maximum slope
export (float, 0.0, 85.0) var move_max_slope := 45.0

## Jump maximum slope
export (float, 0.0, 85.0) var jump_max_slope := 45.0

## Jump velocity
export var jump_velocity := 3.0

## Ground bounciness (0 = no bounce, 1 = full bounciness)
export var bounciness := 0.0

## Bounce threshold (skip bounce if velocity less than threshold)
export var bounce_threshold := 1.0


# Handle class initialization with default parameters
func _init(
	p_flags = 0, 
	p_move_drag = 5.0, 
	p_move_traction = 30.0, 
	p_move_max_slope = 45.0, 
	p_jump_max_slope = 45.0,
	p_jump_velocity = 3.0,
	p_bounciness = 0.0,
	p_bounce_threshold = 1.0):
	# Save the parameters
	flags = p_flags
	move_drag = p_move_drag
	move_traction = p_move_traction
	move_max_slope = p_move_max_slope
	jump_max_slope = p_jump_max_slope
	jump_velocity = p_jump_velocity
	bounciness = p_bounciness
	bounce_threshold = p_bounce_threshold

static func get_move_drag(override: XRToolsGroundPhysicsSettings, default: XRToolsGroundPhysicsSettings) -> float:
	if override and override.flags & GroundPhysicsFlags.MOVE_DRAG:
		return override.move_drag
	else:
		return default.move_drag

static func get_move_traction(override: XRToolsGroundPhysicsSettings, default: XRToolsGroundPhysicsSettings) -> float:
	if override and override.flags & GroundPhysicsFlags.MOVE_TRACTION:
		return override.move_traction
	else:
		return default.move_traction

static func get_move_max_slope(override: XRToolsGroundPhysicsSettings, default: XRToolsGroundPhysicsSettings) -> float:
	if override and override.flags & GroundPhysicsFlags.MOVE_MAX_SLOPE:
		return override.move_max_slope
	else:
		return default.move_max_slope

static func get_jump_max_slope(override: XRToolsGroundPhysicsSettings, default: XRToolsGroundPhysicsSettings) -> float:
	if override and override.flags & GroundPhysicsFlags.JUMP_MAX_SLOP:
		return override.jump_max_slope
	else:
		return default.jump_max_slope

static func get_jump_velocity(override: XRToolsGroundPhysicsSettings, default: XRToolsGroundPhysicsSettings) -> float:
	if override and override.flags & GroundPhysicsFlags.JUMP_VELOCITY:
		return override.jump_velocity
	else:
		return default.jump_velocity

static func get_bounciness(override: XRToolsGroundPhysicsSettings, default: XRToolsGroundPhysicsSettings) -> float:
	if override and override.flags & GroundPhysicsFlags.BOUNCINESS:
		return override.bounciness
	else:
		return default.bounciness

static func get_bounce_threshold(override: XRToolsGroundPhysicsSettings, default: XRToolsGroundPhysicsSettings) -> float:
	if override and override.flags & GroundPhysicsFlags.BOUNCE_THRESHOLD:
		return override.bounce_threshold
	else:
		return default.bounce_threshold
