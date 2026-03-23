class_name ValidationResult

var ok: bool = true
var reason: String = ""

func fail(_reason: String):
	ok = false
	reason = _reason
