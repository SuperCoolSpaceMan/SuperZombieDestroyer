extends Node3D


 

@onready var animation_tree = $AnimationTree #referance
@onready var anim_state_machine = animation_tree["parameters/playback"] #accessing animation tree canvas


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func travel_to_hit_legs():
	animation_tree["parameters/playback"].travel("hit_legs")

func travel_to_idle():
	animation_tree["parameters/playback"].travel("idle")

func travel_to_run():
	animation_tree["parameters/playback"].travel("run")

func travel_to_walking():
	animation_tree["parameters/playback"].travel("walking")

func travel_to_death():
	animation_tree["parameters/playback"].travel("death")

func travel_to_crawling():
	animation_tree["parameters/playback"].travel("crawling")

func travel_to_Crawling_Idle():
	animation_tree["parameters/playback"].travel("Crawling_Idle")

func travel_to_attack():
	animation_tree["parameters/playback"].travel("attack")
# hit, hit_head
