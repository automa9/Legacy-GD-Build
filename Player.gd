extends CharacterBody2D
#Accessable via Editor
@export var speed = 300 
@export var gravity = 30
@export var jump_force = 200

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D
#physics update
func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
			
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
			velocity.y = -jump_force
		
	var horizontal_direction  = Input.get_axis("ui_left","ui_right")
	velocity.x  = speed * horizontal_direction
	if horizontal_direction != 0:
		switch_direction(horizontal_direction)
		#sprite.flip_h = (horizontal_direction==-1)
		
	move_and_slide()
	
	print(velocity)
	update_animations(horizontal_direction)
	
func update_animations(horizontal_direction):
	if is_on_floor():
			if horizontal_direction == 0 :
				animation_player.play("Idle")
			else:
				animation_player.play("Run")
	else:
		if velocity.y < 0:
			animation_player.play("Jump")
		elif velocity.y >0:
			animation_player.play("Fall")

func switch_direction(horizontal_direction):
	sprite.flip_h = (horizontal_direction ==-1)
	sprite.position.x = horizontal_direction *4
