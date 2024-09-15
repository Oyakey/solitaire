class_name Suit extends Resource

static func create(_id: String, _name: String, _color: int) -> Suit:
	var instance := Suit.new();
	instance.id = _id;
	instance.name = _name;
	instance.color = _color;
	return instance;


static var RED := 0;
static var BLACK := 1;

@export var id: String;
@export var name: String;
@export var color: int;
