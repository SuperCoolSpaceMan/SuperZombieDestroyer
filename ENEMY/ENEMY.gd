extends CharacterBody3D
@onready var animation_manager = $"Enemy(animations, dismemberment)"


enum{IDLE, PATROL, CHASING, IS_SHOT_IN_LEG, CRAWLING_IDLE, CRAWLING, DEATH} # 0, 1 , 2 ,3

var state = IDLE

@onready var DebugLabel = $DebugSate #making a referance

var hp = 150

var has_legs = true

# 3dnavigation variables
var movement_speed: float = 2.0
var movement_target_position: Vector3 = Vector3(-3.0,0.0,2.0)

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D


@onready var player_node = get_tree().get_nodes_in_group("player").front()

func navigate():
	if navigation_agent.is_navigation_finished():
		return
	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	var new_velocity: Vector3 = next_path_position - current_agent_position
	look_at(next_path_position , Vector3.UP)
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * movement_speed

	velocity = new_velocity
	move_and_slide()

func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 0.5
	navigation_agent.target_desired_distance = 0.5

func set_movement_target(movement_target: Vector3):
	navigation_agent.set_target_position(movement_target)


func _physics_process(delta):
	match state:
		IDLE: # 0
			DebugLabel.text = "IDLE STATE"
			animation_manager.travel_to_idle()

		PATROL: #1
			DebugLabel.text = "PATROL STATE"
			animation_manager.travel_to_walking()

		CHASING: #2
			DebugLabel.text = "CHASE STATE"

			set_movement_target(player_node.global_position)

			if global_position.distance_to(player_node.global_position) <= 1:
				animation_manager.travel_to_attack()
			else:
				navigate()
				animation_manager.travel_to_run()


		DEATH: #3
			DebugLabel.text = "DEATH STATE"
			animation_manager.travel_to_death()

		CRAWLING_IDLE: #4
			DebugLabel.text = "CRAWLING_IDLE STATE"
			animation_manager.travel_to_Crawling_Idle()

		CRAWLING: #5
			DebugLabel.text = "CRAWLING STATE"
			animation_manager.travel_to_crawling()
			set_movement_target(player_node.global_position)
			look_at(player_node.global_position, Vector3.UP)


		IS_SHOT_IN_LEG: #5
			DebugLabel.text = "IS_SHOT_LEG STATE"
			animation_manager.travel_to_hit_legs()


#still need attack, hit, hit_head



# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_damage(damage):
	hp -= damage 
	if hp <=0:
		queue_free()



func _on_limb_area_leg_destroyed():
	has_legs = false 
	state = CRAWLING_IDLE

