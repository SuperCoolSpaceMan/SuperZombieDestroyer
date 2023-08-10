extends CharacterBody3D
@onready var animation_manager = $"Enemy(animations, dismemberment)"


enum{IDLE, PATROL, CHASING, IS_SHOT_IN_LEG, CRAWLING_IDLE, CRAWLING, DEATH} # 0, 1 , 2 ,3

var state = IDLE

@onready var DebugLabel = $DebugSate #making a referance

var hp = 150



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


		IS_SHOT_IN_LEG: #5
			DebugLabel.text = "IS_SHOT_LEG STATE"
			animation_manager.travel_to_hit_legs()


#still need attack, hit, hit_head



# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_damage(damage):
	hp -= damage 
	if hp <=0:
		queue_free()

