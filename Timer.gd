extends Timer

var enemy1= preload("res://Scenes/airship_med.tscn")
var enemy2 = preload("res://Scenes/airship_med.tscn")

func _on_timeout():
	randomize()
	var enemys= [enemy1,enemy2]
	var kinds = enemys[randi()%enemys.size()]
	var enemy = kinds.instantiate()
	enemy.position = Vector2(800, randf_range(50,650))
	
	add_child(enemy)
	wait_time = randf_range(0,1)
