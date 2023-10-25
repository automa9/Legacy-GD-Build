extends CharacterBody2D

const max_speed = 400
const friction = 500
var isDead = false
var score = 0.0

#Accessable via Editor
@export var speed = 300 
@export var accel = 10

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

#physics update
func _physics_process(_delta):
	
	var direction: Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	#velocity.x = move_toward(velocity.x,speed/2*direction.x,accel)
	velocity.y = move_toward(velocity.y,speed*direction.y,accel)
	move_and_slide()
	
	if velocity.y < 0:
			animation_player.play("Fly")
	elif velocity.y >0:
			animation_player.play("Fly")
			
	if !isDead:
		score +=1
		print(score)

