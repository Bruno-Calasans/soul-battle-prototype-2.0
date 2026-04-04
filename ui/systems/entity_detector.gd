extends Node2D
class_name EntityDetector


func detect_nodes_with_mouse() -> Array:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var space_state: PhysicsDirectSpaceState2D = get_viewport().get_world_2d().direct_space_state
	
	# Cria os parâmetros da consulta
	var params = PhysicsPointQueryParameters2D.new()
	params.position = mouse_pos
	params.collide_with_areas = true
	params.collide_with_bodies = true
	
	# pega todos os nodes colidindo com o mouse
	var result: Array = space_state.intersect_point(params).map(func(dic): return dic.collider)
	return result


func detect_first_node() -> Node:
	var nodes = detect_nodes_with_mouse()
	if nodes.size() == 0: return null
	return nodes[0]


func detect_cards() -> Array[CardView]:
	var nodes: Array = detect_nodes_with_mouse()
	var cards: Array[CardView] = []
	
	for node in nodes:
		var card = node.get_parent()
		if card is CardView: cards.append(card)
	
	return cards


func get_card_on_top() -> CardView:
	var cards: Array[CardView] = detect_cards()
	
	if cards.size() == 0: return null
	
	var top_card: CardView = cards[0]
	var highest_z_index: int = top_card.z_index
	
	for card in cards:
		if card.z_index > highest_z_index:
			top_card = card
			highest_z_index = card.z_index
	
	return top_card


func detect_card_slots() -> Array[CardSlotView]:
	var nodes: Array = detect_nodes_with_mouse()
	var slots: Array[CardSlotView] = []
	
	for node in nodes:
		var slot = node.get_parent()
		if slot is CardSlotView: slots.append(slot)
	
	return slots
	
	
func get_first_card_slot() -> CardSlotView:
	var card_slots: Array[CardSlotView] = detect_card_slots()
	if card_slots.size() == 0: return null
	return card_slots[0]
