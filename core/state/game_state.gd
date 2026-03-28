extends Resource
class_name GameState

var players: Array[Player] = []
var turn_player: Player
var turn_number: int = 1

func get_enemies(player: Player) -> Array[Card]:
	var cards = get_all_board_cards()
	return cards.filter(func (card: Card): return card.owner != player)
	
	
func get_allies(player: Player) -> Array[Card]:
	var cards = get_all_board_cards()
	return cards.filter(func (card: Card): return card.owner == player)


func get_all_board_cards() -> Array[Card]:
	var cards: Array[Card] = []
	for player in players: 
		cards.append_array(player.board.cards)
	return cards


func summon_creature(source: Variant, card: CreatureCard, slot: BoardSlot = null):
	if source is Player:
		
		if slot != null:
			slot.card = card
			
		var chosed_slot = source.get_empty_slots().pick_random()
		chosed_slot.card = card
		
	if source is Card:
		print("Creature summons creature")
		
		
func add_player(player: Player):
	players.append(player)
