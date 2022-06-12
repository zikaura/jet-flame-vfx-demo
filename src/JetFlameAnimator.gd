# extends Spatial

# onready var shape: MeshInstance = $Shape
# var current_color: Color
# var current_hue: float
# var shader_mat: ShaderMaterial

# export var color_delta: float = 0.05

# func _ready():
# 	current_color = Color.seashell
# 	shader_mat = shape.get("material/0")

# func _process(_delta):
# 	current_hue = lerp(current_hue, 1.0, color_delta)
# 	current_color = current_color.from_hsv(
# 		current_hue * 359,
# 		rand_range(35, 90),
# 		rand_range(50, 99)
# 	)
	
# 	var multiplier = rand_range(1, 5)
# 	var pc = current_color
# 	var sc = current_color * multiplier
	
# 	shader_mat.set("shader_param/FlameColorA", pc)
# 	shader_mat.set("shader_param/FlameColorB", sc)
