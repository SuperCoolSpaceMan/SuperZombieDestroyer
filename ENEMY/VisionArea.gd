extends Area3D


@onready var enemy_parent_node = $".."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		if enemy_parent_node.has_legs: #BOOLEAN VARIABLES CAN ONLY HAVE TRUE OR FALSE CONDITIONS(IF OR ELSE)
			enemy_parent_node.state = enemy_parent_node.CHASING
		else: 
			enemy_parent_node.state = enemy_parent_node.CRAWLING
