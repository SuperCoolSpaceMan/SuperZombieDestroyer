extends Control
@onready var Parent_node = $".." #create a referance to the parent node and script

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ESC"): 
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		if Input.is_action_just_released("ESC"):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_idle_pressed():
	Parent_node.state = Parent_node.IDLE 


func _on_patrol_pressed():
	Parent_node.state = Parent_node.PATROL


func _on_chase_pressed():
	Parent_node.state = Parent_node.CHASING


func _on_death_pressed():
	Parent_node.state = Parent_node.DEATH


func _on_crawling_idle_pressed():
	Parent_node.state = Parent_node.CRAWLING_IDLE


func _on_crawling_pressed():
	Parent_node.state = Parent_node.CRAWLING 


func _on_is_shot_in_leg_pressed():
	Parent_node.state = Parent_node.IS_SHOT_IN_LEG

