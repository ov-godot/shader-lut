extends ColorRect

var Lut = {
	index = 0,
	map = [
		"Neutral",
		"Cinematic/Cinematic 1",
		"Cinematic/Cinematic 2",
		"Cinematic/Cinematic 3",
		"Cinematic/Cinematic 4",
		"Cinematic/Cinematic 5",
		"Cinematic/Cinematic 6",
		"Cinematic/Cinematic 7",
		"Cinematic/Cinematic 8",
		"Cinematic/Cinematic 9",
		"Cinematic/Cinematic 10",
		"Moody/Moody 1",
		"Moody/Moody 2",
		"Moody/Moody 3",
		"Moody/Moody 4",
		"Moody/Moody 5",
		"Moody/Moody 6",
		"Moody/Moody 7",
		"Moody/Moody 8",
		"Moody/Moody 9",
		"Moody/Moody 10",
		"Portrait/Portrait 1",
		"Portrait/Portrait 2",
		"Portrait/Portrait 3",
		"Portrait/Portrait 4",
		"Portrait/Portrait 5",
		"Portrait/Portrait 6",
		"Portrait/Portrait 7",
		"Portrait/Portrait 8",
		"Portrait/Portrait 9",
		"Portrait/Portrait 10",
		"ColorBoost/Aqua and Orange Dark",
		"ColorBoost/Aqua",
		"ColorBoost/Blues",
		"ColorBoost/Earth Tone Boost",
		"ColorBoost/Green Blues",
		"ColorBoost/Green Yellow",
		"ColorBoost/Oranges",
		"ColorBoost/Purple",
		"ColorBoost/Reds",
		"ColorBoost/Reds Oranges and Yellows",
		"Lutify/2-Strip Process",
		"Lutify/Berlin Sky",
		"Lutify/Chrome 1",
		"Lutify/Classic Teal and Orange",
		"Lutify/Fade to Green",
		"Lutify/Film Print 1",
		"Lutify/Film Print 2",
		"Lutify/French Comedy",
		"Lutify/Studio Skin Tone Shaper",
		"Lutify/Vintage Chrome",
		"Lutify/Blue Architecture",
		"Lutify/Blue Hour",
		"Lutify/Cold Chrome",
		"Lutify/Crisp Autumn",
		"Lutify/Dark And Somber",
		"Lutify/Hard Boost",
		"Lutify/Long Beach Morning",
		"Lutify/Lush Green",
		"Lutify/Magic Hour",
		"Lutify/Natural Boost",
		"Lutify/Orange And Blue",
		"Lutify/Soft Black And White",
		"Lutify/Waves"
	]
}

func _init():
	for i in range(Lut.map.size()):
		Lut.map[i] = {"name": Lut.map[i], "texture": load("res://shader_lut/textures/%s.png" % Lut.map[i])}
	update(Lut.index)

func _input(event):
	if not (event is InputEventKey) or not event.pressed: return
	match event.keycode:
		KEY_Z:
			update(Lut.index + 1)
			
func update(index):
	Lut.index = index%Lut.map.size()
	self.material.set_shader_parameter("lut_texture", Lut.map[Lut.index].texture)
