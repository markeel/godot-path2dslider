@tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("Path2DSlider", "Control", preload("path2dslider.gd"), preload("icon.svg"))

func _exit_tree():
	remove_custom_type("Path2DSlider")
