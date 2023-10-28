extends CharacterBody2D

var speed = 20.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x += -speed * delta
	
	move_and_slide()
