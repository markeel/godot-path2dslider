@tool
extends Panel

@export var offset : Vector2 = Vector2(0.05, 0.1) :
	set(o):
		offset = o
		if is_inside_tree():
			_set_shader_param()

func _set_shader_param():
	var rot = get_global_transform().get_rotation()
	var v = Transform2D(-rot, Vector2(0,0)) * offset
	material.set_shader_parameter('offset', v)

func _ready():
	set_notify_transform(true)

func _notification(what):
	if what == NOTIFICATION_TRANSFORM_CHANGED:
		_set_shader_param()
