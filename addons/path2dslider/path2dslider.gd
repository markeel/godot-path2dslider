@tool
extends Control
class_name Path2DSlider

@export_range(0, 360, 0.001, "radians") var marker_start_rotation : float = 0.0 :
	set(r):
		marker_start_rotation = r
		if is_inside_tree() and _curve != null:
			var blen = _curve.get_baked_length()
			_position_marker(progress_ratio * blen)

@export_range(0.0, 1.0, 0.001) var progress_ratio : float = 0.0 : 
	set(p):
		progress_ratio = p
		if is_inside_tree() and _curve != null:
			var blen = _curve.get_baked_length()
			_position_marker(progress_ratio * blen)
			changed_progress_ratio.emit(progress_ratio)

var _curve : Curve2D
var _marker : Control
var _dragging := false

signal changed_progress_ratio(ratio)

func _ready():
	get_tree().node_added.connect(_on_scene_nodes_changed)
	get_tree().node_removed.connect(_on_scene_nodes_changed)
	_analyze_children()

func _on_scene_nodes_changed(node : Node):
	_analyze_children()

func _analyze_children():
	var old_curve = _curve
	var old_marker = _marker
	_curve = null
	_marker = null
	for n in get_children():
		if n is Path2D:
			_curve = n.curve
		if n is Control:
			_marker = n
	if old_marker != _marker:
		_marker.gui_input.connect(_on_marker_gui_input)
		if _curve != null:
			var blen = _curve.get_baked_length()
			_position_marker(progress_ratio * blen)
		update_configuration_warnings()
	if old_curve != _curve:
		if _curve != null:
			_curve.changed.connect(_on_curve_changed)
		var blen = _curve.get_baked_length()
		_position_marker(progress_ratio * blen)
		update_configuration_warnings()

func _on_curve_changed():
	var blen = _curve.get_baked_length()
	_position_marker(progress_ratio * blen)

func _position_marker(value):
	if _curve != null:
		var t = _curve.sample_baked_with_rotation(value)
		var r = t.get_rotation() - marker_start_rotation
		_marker.set_position(t.get_origin()-_marker.pivot_offset)
		_marker.set_rotation(r)

func _on_marker_gui_input(event):
	if _dragging:
		if event is InputEventMouseMotion:
			var mouseevent = event as InputEventMouseMotion
			var mousepos_local = get_global_transform().affine_inverse() * mouseevent.global_position
			var blen = _curve.get_baked_length()
			var offset = _curve.get_closest_offset(mousepos_local)
			progress_ratio = offset / blen
	if event is InputEventMouseButton:
		var mouseevent = event as InputEventMouseButton
		if mouseevent.button_index == MOUSE_BUTTON_LEFT:
			if mouseevent.is_pressed():
				_dragging = true
			elif mouseevent.is_released():
				_dragging = false

func _get_configuration_warnings():
	var errors := PackedStringArray()
	if _curve == null:
		errors.push_back("A Path2D node is a required child of this node to describe the path of the slider")
	if _marker == null:
		errors.push_back("A Control node is a required child of this node to provide the slider thumb")
	return errors
