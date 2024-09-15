extends Node2D


# I don't know yet how to have a global enum available for several scripts.
enum Colors {RED, BLACK}

# Data for a generic 52 cards game.
var deck: Array[CardData] = [];

# Stacks nodes
@onready var cols := [
	$Col1,
	$Col2,
	$Col3,
	$Col4,
	$Col5,
	$Col6,
	$Col7,
];
@onready var drawNode := $Draw;
@onready var foundationClub := $FoundationClub;
@onready var foundationSpade := $FoundationSpade;
@onready var foundationHeart := $FoundationHeart;
@onready var foundationDiamond := $FoundationDiamond;


# Create suits data. Could be a simple JSON containing suits properties. 
var suits: Dictionary = {
	'suit.club' = Suit.create('suit.club', 'Club', Colors.BLACK),
	'suit.spade' = Suit.create('suit.spade', 'Spade', Colors.BLACK),
	'suit.heart' = Suit.create('suit.heart', 'Heart', Colors.RED),
	'suit.diamond' = Suit.create('suit.diamond', 'Diamond', Colors.RED),
}

# Generates a 52 card game. Could be a simple JSON containing cards properties.
func generateDeck() -> Array[CardData]:
	var cards : Array[CardData] = [];
	for suit: Suit in suits.values():
		for i in range(13):
			cards.append(CardData.create(i + 1, suit));
	return cards;

# Adds randomly picked cards to columns according to the rules of solitaire.
func splitDeck() -> void:
	for i: int in range(0, cols.size()):
		for j: int in range(i + 1):
			var randomIndex := randi_range(0, deck.size() - 1);
			var isLastCard := j < i;
			#var cardData: CardData = deck.pop_front();
			#if (cardData == null):
				#return ;
			#var cardNode: Card = Card.create(cardData, isLastCard);
			var cardNode: Card = Card.create(deck[randomIndex], isLastCard);
			cols[i].add_child(cardNode);
			deck.remove_at(randomIndex);

func _ready() -> void:
	deck = generateDeck();
	deck.shuffle();
	splitDeck();
	deck.shuffle();
	for index: int in range(0, deck.size() - 1):
		var cardNode: Card = Card.create(deck[index], true);
		drawNode.add_child(cardNode);
