extends Resource
class_name DamageContext

var source: CreatureCard
var target: CreatureCard
var base_damage: int
var damage: int
var dmg_type: CARD_ENUM.DMG_TYPE
var ignore_def: int = 0

func _init(_source: CreatureCard, _target: CreatureCard, _damage: int, _dmg_type: CARD_ENUM.DMG_TYPE):
	source = _source
	target = _target
	base_damage = _damage
	damage = _damage
	dmg_type = _dmg_type
	
