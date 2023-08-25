extends Area3D

@export var limb_name = "none"

@export var limb_mesh: Node
@export var limb_rigid_body: Node
@export var limb_rigid_body_collision: Node
@export var hp = 50

signal leg_destroyed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_damage(damage):
	
	hp -= damage 
	if hp <=0:
		if limb_name == "leg":
			emit_signal("leg_destroyed")
		limb_rigid_body.visible = true 
		
		limb_rigid_body.freeze = false
		limb_rigid_body.apply_central_impulse(Player.global_transform.origin)
		limb_rigid_body_collision.disabled = false
		limb_mesh.queue_free()
		queue_free()
		
		
