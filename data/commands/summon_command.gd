# jogador invoca criatura
extends GameCommand
class_name SummonCardCommand

var player: Player
var card: CreatureCard
var slot: BoardSlot

func _init(_player: Player, _card: CreatureCard, _slot: BoardSlot = null) -> void:
	player = _player
	card = _card
	slot = _slot
	
	
func can_execute() -> bool:
	# dados inválidos
	if player == null: 
		reject("Jogador não encontrado")
		return false
		
	if card == null: 
		reject("Criatura não encontrada")
		return false
		
	if card.is_destroyed():
		reject("Criatura está destruída")
		return false
	
	# jogador não tem energia
	if not player.has_energy(card.data.cost): 
		reject("Jogador não tem energia o suficiente")
		return false
	
	# jogador não tem slot vazio
	if not player.board.has_empty_slot(): 
		reject("Jogador não tem slot vazio no campo")
		return false
	
	
	if slot:
		# jogador não é dono da card
		var same_slot_owner = slot.owner == player
		if not same_slot_owner: 
			reject("Jogador não possui este card")
			return false
		
		# slot já está ocupado
		if slot.card :
			reject("Slot já está ocupado") 
			return false
	
	return true

	
func to_action():
	return SummonAction.new(player, card, slot)
	
	
