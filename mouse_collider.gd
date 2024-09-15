extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse := get_global_mouse_position();
	position = mouse;
	pass

func _on_mouse_area_entered(_body: CollisionObject2D) -> void:
	print('mouseEntered');


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var space_state := get_world_2d().direct_space_state;
	# var global_position := get_global_mouse_position();
	var query := PhysicsRayQueryParameters2D.create(global_position, global_position + Vector2.DOWN * 100);
	var result := space_state.intersect_ray(query);
	# print(result);
	if result:
		print(result);


func _on_mouse_entered() -> void:
	print('mouseEntered');
	pass # Replace with function body.

func _on_area_entered(area: Area2D) -> void:
	print(area.value);
	pass # Replace with function body.
