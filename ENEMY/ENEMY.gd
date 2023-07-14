extends CharacterBody3D

enum{IDLE, PATROL, CHASING, DEATH} # 0, 1 , 2 ,3
var state = IDLE
@onready var DebugLabel = $DebugSate #making a referance
var hp = 150



func _physics_process(delta):
	match state:
		IDLE: # 0
			DebugLabel.text = "IDLE STATE"
		PATROL: #1
			DebugLabel.text = "PATROL STATE"
		CHASING: #2
			DebugLabel.text = "CHASE STATE"
		DEATH: #3
			DebugLabel.text = "DEATH STATE"




# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_damage(damage):
	hp -= damage 
	if hp <=0:
		queue_free()

