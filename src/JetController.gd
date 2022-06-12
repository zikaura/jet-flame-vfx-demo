extends Spatial

onready var animator: AnimationPlayer = $AnimationPlayer
onready var camera_setups: Array = [$CameraSetup1, $CameraSetup2]

export(float, 1.0, 10.0) var speed: float = 1.0
var current_setup_index = 0

func _ready():
	animator.play("SteeringAnim")

func _process(delta):
	var motion_delta = Vector3.FORWARD * speed * delta
	translate(motion_delta)
	
	if Input.is_action_just_pressed("switch_view"): on_switch_viewpoint()
	
func switch_viewpoint_to(index):
	camera_setups[current_setup_index].get_child(0).set("current", false)
	current_setup_index = index
	camera_setups[current_setup_index].get_child(0).set("current", true)

func on_switch_viewpoint():
	if current_setup_index == 0:
		switch_viewpoint_to(1)
	else:
		switch_viewpoint_to(0)
