extends Node3D


 

@onready var animation_tree = $AnimationTree
@onready var anim_state_machine = animation_tree["parameters/playback"] #accessing animation tree canvas


var is_running = false
var is_death = false
var is_idle = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation_tree.set("parameters/conditions/RUNNING",is_running) #Sets the condition to same value as bool. check inspector description
	animation_tree.set("parameters/conditions/back_to_idle",is_idle)
