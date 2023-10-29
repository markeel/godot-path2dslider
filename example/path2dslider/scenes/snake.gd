@tool
extends Control

func _ready():
	%snake_color_config.self_modulate = Color.WHITE * (.5 + %snake_color_slider.progress_ratio / 1.5)

func _on_snake_color_slider_changed_progress_ratio(ratio):
	%snake_color_config.self_modulate = Color.WHITE * (.5 + ratio / 1.5)
