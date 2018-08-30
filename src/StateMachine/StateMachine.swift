////////////////////////////////////////////
/// StateMachine
////////////////////////////////////////////
class StateMachine: Unique {
	var state: State
	var args: [String: Any]
	
	init(id: UInt, name: String, state: State, args: [String: Any]) {
		self.state = state
		self.args = args
		super.init(id: id, name: name)
	}
	
	func next(transition: Transition) {
		let result = transition.handler(&args)
		
		if !result.ok {
			print("Oops!")
		} else {
			state = transition.destination	
		}
	}
}