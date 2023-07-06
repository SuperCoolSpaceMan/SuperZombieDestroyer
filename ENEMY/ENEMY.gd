extends CharacterBody3D
var hp = 150
# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_damage(damage):
	hp -= damage 
	if hp <=0:
		queue_free()

