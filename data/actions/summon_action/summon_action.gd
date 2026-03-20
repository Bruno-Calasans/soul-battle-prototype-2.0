extends Action
class_name SummonAction

var player: Player
var card: CreatureCardData
var slot: BoardSlot

func _init(
	_data: SummonActionData,
	_player: Player, 
	_card: CreatureCardData, 
	_slot: BoardSlot = null, 
	) -> void:
	data = _data
	card = _card
	slot = _slot


func can_execute() -> bool:
	# jogador tem energia para invocar criatura
	if not player.has_energy(card.cost):
		cancel("SEM ENERGIA PARA INVOCAR")
		return false
		
	# verifica slot
	if slot:
		# se slot está vazio
		if not slot.card == null:
			cancel("SLOT NÃO ESTÁ VAZIO")
			return false
			
		# se slot é do jogador
		if not slot.owner == player:
			cancel("JOGADOR NÃO É DONO DO SLOT")
			return false
		
	# verifica camppo por slot	
	else:
		if not player.board.has_empty_slot():
			cancel("SEM SLOT VAZIO PARA INVOCAR")
			
	return true


func execute():
	var chosed_slot: BoardSlot = slot
	var creature: Card = card.create({
		'player': player,
		'zone': player.board
	})
	
	if not slot:
		chosed_slot = player.board.get_empty_slots().pick_random()
	
	player.consume_energy(card.cost)
	player.board.summon_card(creature, chosed_slot)
	SummonEvent.new(player, creature, chosed_slot).emit()
	
