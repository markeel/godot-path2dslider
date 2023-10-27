@tool
extends Panel

var points : PackedVector2Array : 
	set(p):
		points = p
		queue_redraw()

func _draw():
	for p in points:
		draw_rect(Rect2(p.x-2, p.y-2, 4, 4), Color.PURPLE, true)
