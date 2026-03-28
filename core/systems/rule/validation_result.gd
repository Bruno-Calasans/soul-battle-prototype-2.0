class_name ValidationResult

var ok: bool = true
var reason: String = ""

func fail(fail_reason: String):
	ok = false
	reason = fail_reason
