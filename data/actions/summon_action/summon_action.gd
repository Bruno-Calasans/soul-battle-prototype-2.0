extends Action
class_name SummonAction

var player: Player
var card: CreatureCard
var slot: BoardSlot

func _init(
	_player: Player, 
	_card: CreatureCard, 
	_slot: BoardSlot = null, 
	) -> void:
	player = _player
	card = _card
	slot = _slot


func can_execute() -> bool:
	# dados inválidos
	if player == null: 
		cancel("Jogador não encontrado")
		return false
		
	if card == null: 
		cancel("Criatura não encontrada")
		return false
		
	if card.is_destroyed():
		cancel("Criatura está destruída")
		return false
	
	# jogador tem energia para invocar criatura
	if not player.has_energy(card.get_cost()):
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
		
	# verifica campo por slot	
	else:
		if not player.board.has_empty_slot():
			cancel("SEM SLOT VAZIO PARA INVOCAR")
			
	return true


func execute():
	var chosed_slot: BoardSlot = slot
	if not slot:
		chosed_slot = player.board.get_empty_slots().pick_random()

	player.consume_energy(card.get_cost())
	GameContext.zone_system.move_card(card, player.board, chosed_slot)
	SummonEvent.new(player, card, chosed_slot).emit()
	
