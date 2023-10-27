@tool
extends Control

@export var num_values : int :
	set(nv):
		num_values = nv
		if is_inside_tree():
			var v := int(num_values * %outer.progress_ratio)
			%data.text = "%d" % v

func _ready():
	var v := int(num_values * %outer.progress_ratio)
	%data.text = "%d" % v

func _on_outer_changed_progress_ratio(ratio):
	var v := int(num_values * ratio)
	%data.text = "%d" % v

func _on_inner_changed_progress_ratio(ratio):
	var v := int(num_values * ratio)
	%data2.text = "%d" % v
