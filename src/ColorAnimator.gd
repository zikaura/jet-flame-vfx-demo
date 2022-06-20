extends Node

export(float, 1.0, 3.0) var flame_saturation = 1.2
export var engine_colors = PoolColorArray()
export var trail_colors  = PoolColorArray()

var jet_material:  SpatialMaterial = preload("res://assets/vehicles/jet_a/tron.material")
var trail_material: SpatialMaterial = preload("res://assets/resources/materials/trail_mat.material")
var engine_flame_mat: ShaderMaterial = preload("res://assets/resources/materials/jet_flame.material")
enum COLOR_CLASS {ENGINE, TRAIL}

var elli = 0
var euli = 1
var tlli = 0
var tuli = 1

var est = 0.0
var tst = 0.0

func update_color_limits(cls):
	match cls:
		COLOR_CLASS.ENGINE:
			est = 0.0
			euli += 1
			elli += 1
			euli = wrapi(euli, 0, engine_colors.size())
			elli = wrapi(elli, 0, engine_colors.size())
		COLOR_CLASS.TRAIL:
			tst = 0.0
			tuli += 1
			tlli += 1
			tuli = wrapi(tuli, 0, engine_colors.size())
			tlli = wrapi(tlli, 0, engine_colors.size())

func _process(delta):
	var ec = lerp(engine_colors[euli], engine_colors[elli], delta)
	#engine_flame_mat.set_shader_param("FlameColorA", engine_colors[])
	#engine_flame_mat.set_shader_param("FlameColorA", engine_colors[] * flame_saturation)
