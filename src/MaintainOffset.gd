extends Spatial

export(NodePath) var targetNode
onready var target: Spatial = get_node(targetNode)
var offset: Vector3

func _ready():
	set_as_toplevel(true)
	offset = global_transform.origin - target.global_transform.origin

func _process(_delta):
	global_transform.origin = target.global_transform.origin + offset
