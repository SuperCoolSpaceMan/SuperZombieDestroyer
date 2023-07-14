extends Node3D


 

@onready var animation_tree = $AnimationTree
@onready var anim_state_machine = animation_tree["parameters/playback"]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass #anim_state_machine.travel("walking")
