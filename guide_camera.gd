extends Camera2D
class_name PanningCamera2D

@export var target: NodePath

const MIN_ZOOM: float = 0.4
const MAX_ZOOM: float = 2.4
const ZOOM_RATE: float = 8.0
const ZOOM_INCREMENT: float = 0.1

var events = {}
var last_drag_distance = 0

var _target_zoom: float = 1.0


func _physics_process(delta: float) -> void:
	zoom = lerp(zoom, _target_zoom * Vector2.ONE, ZOOM_RATE * delta)
	set_physics_process(not is_equal_approx(zoom.x, _target_zoom))


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_in()
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_out()
#			if event.double_click:
#				focus_position(get_global_mouse_position())
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_MIDDLE or event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			position -= event.relative


func zoom_in() -> void:
	_target_zoom = max(_target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)


func zoom_out() -> void:
	_target_zoom = min(_target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)


#func focus_position(target_position: Vector2) -> void:
#	var _tween = get_tree().create_tween()
#	_tween.stop()
#	_tween.interpolate_property(self, "position", position, target_position, 0.2, Tween.TRANS_EXPO)
#	_tween.start()
