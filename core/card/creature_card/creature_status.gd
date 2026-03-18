extends Resource
class_name CreatureStatus

# info
var race: Enums.CREATURE_RACE
var class_type: Enums.CREATURE_CLASS
var dmg_type: Enums.DMG_TYPE

# base status
var base_atk: int
var base_health: int
var base_def: int
var base_evade: int

# current status
var current_atk: int
var current_health: int
var current_def: int
var current_evade: int
var resistence: CreatureResistence
