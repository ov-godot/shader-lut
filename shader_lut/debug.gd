extends Control

var Debug = {
	position = Vector2(20, 150),
	font = preload("res://shader_lut/fonts/Roboto-Regular.ttf"),
	color = Color(0.85, 0.85, 0.85)
}

func _ready():
	set_process(true)

func _process(delta):
	queue_redraw()

func _draw():
	var lut = get_parent().Lut
	draw_string(Debug.font, Debug.position, "Shader: Lut - {0}".format([lut.map[lut.index].name]), 0, -1, 19, Debug.color)
