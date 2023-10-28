extends CharacterBody2D

const max_speed = 400
const friction = 500
var isDead = false
var score = 0.0
const GRAVITY = 40.0

#Accessable via Editor
@export var jump_speed = -100 
@export var speed = 100
@export var accel = 10

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

#physics update
func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = jump_speed
		velocity.x = 0
	if Input.is_action_pressed("ui_down"):
		velocity.y = speed
		velocity.x = 0
	#var direction: Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	#velocity.x = move_toward(velocity.x,speed/2*direction.x,accel)
	#velocity.y = move_toward(velocity.y,speed*direction.y,accel*GRAVITY)
	move_and_slide()
	
	if velocity.y < 0:
			animation_player.play("Fly")
	elif velocity.y >0:
			animation_player.play("Fly")
			
	if !isDead:
		score +=1
		print(score)

