////////////////////////////////////////////
/// State
////////////////////////////////////////////
class State: Unique {
	var transitions: [Transition] = []
	
	init(id: UInt, name: String, transitions: [Transition] = []) {
		self.transitions = transitions
		super.init(id: id, name: name)
	}
}
