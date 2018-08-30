////////////////////////////////////////////
/// TransitionResult
////////////////////////////////////////////
struct TransitionResult {
	let ok: Bool
}

////////////////////////////////////////////
/// Transition
////////////////////////////////////////////
class Transition: Unique {
	var destination: State
	var handler: ((inout [String: Any]) -> TransitionResult)
	
	init(id: UInt, name: String, destination: State, handler: @escaping ((inout [String: Any]) -> TransitionResult)) {
		self.destination = destination
		self.handler = handler
		super.init(id: id, name: name)
	}
}