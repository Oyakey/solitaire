class_name Card extends Area2D

@export var value := 0;
@export var suit: Suit;
@export var verso := false;


static func create(data: CardData, _verso: bool = false) -> Node:
	var scene := load("res://card.tscn");
	var instance: Node = scene.instantiate();
	instance.value = data.value;
	instance.suit = data.suit;
	instance.verso = _verso;
	return instance;


func _process(_delta: float) -> void:
	$Card.pause();
	var suitNumber := 0;
	match suit.id:
		'suit.club':
			suitNumber = 0;
		'suit.diamond':
			suitNumber = 1;
		'suit.spade':
			suitNumber = 2;
		'suit.heart':
			suitNumber = 3;
	
	if (verso):
		$Card.frame = 53;
		return
	
	var frameNumber := suitNumber * 13 + value - 1;
	$Card.frame = frameNumber;

# func _on_area_entered(_area: Area2D) -> void:
# 	$Card.play('Highlight');
# 	print('area')

# func _on_area_exited(_area: Area2D) -> void:
# 	$Card.play('Card');
# 	print('area')

# func _on_body_entered(_body: CollisionObject2D) -> void:
# 	$Card.play('Highlight');
# 	print('body')

# func _on_body_exited(_body: CollisionObject2D) -> void:
# 	$Card.play('Card');
# 	print('body')


# func _on_texture_button_mouse_entered() -> void:
# 	print('mouse');


# func _on_texture_button_mouse_exited() -> void:
# 	print('mouse');
