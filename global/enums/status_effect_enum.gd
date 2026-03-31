extends Node


enum STATUS_EFFECT_TYPE {
	PERMANENT,
	PERIODIC,
	AURA
}

enum RULE_MODIFIER {
	NO_ATTACK,
	NO_HEAL,
	NO_TARGET
}

enum BUFFABLE_ATRIBUTE {
	HP,
	ATTACK,
	DEF,
	EVADE,
	RESISTENCE
}

enum OPERATION {
	INCREASE,
	DECREASE,
	SET
}

enum EVENT_FIELD {
	TARGET, # fora de event.data
	SOURCE, # fota de event.data
	VALUE, # dentro de event.data
	DMG_TYPE, # dentro de event.data
	SLOT # dentro de event.data
}
