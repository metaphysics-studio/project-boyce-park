extends Camera2D

## == Class Name ==============================================================
## Class description goes here...
## ============================================================================

## == Variables ===============================================================

## Constants
const ZOOM_LEVELS : Array = [ 0.5, 1.0, 2.0, 4.0, 8.0]
@onready var MAXIMUM_ZOOM : float = ZOOM_LEVELS[ZOOM_LEVELS.size() - 1]

## "Psuedo-Constants"
@onready var SCROLL_SPEED : int = 10

## Variables
var _zoom_level : int = 1 : set = setZoomLevel, get = getZoomLevel
var _is_panning : bool = false
var allow_movement: bool = false : 
	set(new_val): allow_movement = new_val

## == Initialization ==========================================================

func _ready() -> void:
	enabled = true
	global_position = Vector2(32, 148)
	call_deferred("@allow_movement_setter", true)

## == Pre-Defined Methods =====================================================

func _process(delta : float) -> void:
	if not allow_movement: return
	move_editor()
	_is_panning = Input.is_action_pressed("mouse_middle")

func _unhandled_input(event : InputEvent) -> void:
	if not allow_movement: return
	
	if event.is_action_pressed("zoom_in"): zoom_in()
	elif event.is_action_pressed("zoom_out"): zoom_out()
	
	if event is InputEventMouseMotion and _is_panning:
		global_position -= event.relative * (1.0/zoom.x) * 0.75

## == Custom Methods ==========================================================

func _is_valid_move(new_position) -> bool:
	var within_x = new_position.x >= limit_left and new_position.x < limit_right
	var within_y = new_position.y >= limit_top and new_position.y < limit_bottom
	return within_x and within_y

func move_editor() -> void:
	var delta_move : Vector2 = Vector2.ZERO
	if Input.is_action_pressed("camera_up"):
		delta_move.y -= SCROLL_SPEED * (1.0/zoom.x)
	if Input.is_action_pressed("camera_left"):
		delta_move.x -= SCROLL_SPEED * (1.0/zoom.x)
	if Input.is_action_pressed("camera_down"):
		delta_move.y += SCROLL_SPEED * (1.0/zoom.x)
	if Input.is_action_pressed("camera_right"):
		delta_move.x += SCROLL_SPEED * (1.0/zoom.x)
	
	var new_position = global_position + delta_move
	if _is_valid_move(new_position):
		global_position = new_position

## == Setters & Getters =======================================================

func getZoomLevel() -> int:
	return _zoom_level

func setZoomLevel(lvl : int) -> void:
	_zoom_level = clampi(lvl, 0, ZOOM_LEVELS.size() - 1)
	var zoom_value = ZOOM_LEVELS[_zoom_level]
	zoom = Vector2(zoom_value, zoom_value)
	#desired_zoom = Vector2(zoom_value, zoom_value)
	#allow_movement = false
	#var tween = create_tween()
	#tween.set_ease(Tween.EASE_IN_OUT)
	#tween.set_trans(Tween.TRANS_QUAD)
	#tween.tween_property(self, "zoom", desired_zoom, 0.25)
	#await tween.finished
	#allow_movement = true


func zoom_in() -> void:
	_zoom_level = _zoom_level + 1

func zoom_out() -> void:
	_zoom_level = _zoom_level - 1

## == Setters-Adjacent Methods ================================================

## == Signal-Related Methods ==================================================

## == END OF FILE =============================================================
