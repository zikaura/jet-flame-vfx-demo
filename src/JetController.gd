extends Spatial

onready var animator: AnimationPlayer = $AnimationPlayer
onready var particles: CPUParticles = get_parent().get_node("StarParticles/Particles")
onready var camera_setups: Array = [$CameraSetup1, $CameraSetup2]

var speed: float = 9.0
var current_setup_index = 0

func _ready():
	animator.play("SteeringAnimation")
	particles.set("direction", Vector3.BACK)

func _process(delta):
	# Switch camera setup with mouse clicks
	if Input.is_action_just_pressed("switch_view"): on_switch_viewpoint()
	# Loop animation (not sure why it's not looping on default)
	if not animator.is_playing():
		animator.play("SteeringAnimation")
	# Go Beyond - Plus Ultra!
	var motion_delta = Vector3.FORWARD * speed * delta
	translate(motion_delta)
	
func switch_viewpoint_to(index):
	camera_setups[current_setup_index].get_child(0).set("current", false)
	current_setup_index = index
	camera_setups[current_setup_index].get_child(0).set("current", true)

func on_switch_viewpoint():
	if current_setup_index == 0:
		switch_viewpoint_to(1)
		particles.set("direction", Vector3.FORWARD)
	else:
		switch_viewpoint_to(0)
		particles.set("direction", Vector3.BACK)
