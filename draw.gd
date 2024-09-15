extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var children := get_children();
	for index: int in range(0, children.size()):
		children[index].position.y = -index * 1;
		if (index < children.size() - 1):
			children[index].collision_layer = 2;
