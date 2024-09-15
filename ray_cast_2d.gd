extends RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var lastCollider: Card;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if (lastCollider != null):
		lastCollider.get_node('Card').play('Card');
	if (is_colliding()):
		var collidingCard: Card = get_collider();
		collidingCard.get_node('Card').play('Highlight');
		lastCollider = collidingCard;
