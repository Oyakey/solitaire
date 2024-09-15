class_name CardData extends Resource

var value := 0;
var suit: Suit;

static func create(_value: int, _suit: Suit) -> CardData:
	var instance: CardData = CardData.new();
	instance.value = _value;
	instance.suit = _suit;
	return instance;
