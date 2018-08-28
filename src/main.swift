////////////////////////////////////////////
/// Unique
////////////////////////////////////////////
class Unique {
	let id: UInt
	let name: String
	
	init(id: UInt, name: String) {
		self.id = id
		self.name = name
	}
}

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

func load() -> StateMachine {
	let s1 = State(id: 1, name: "Start")
	let s2 = State(id: 2, name: "End")

	let t1 = Transition(id: 1, name: "Complete", destination: s2, handler: {(args: inout [String: Any]) -> TransitionResult in
		return TransitionResult(ok: true)
	})

	s1.transitions.append(t1)

	return StateMachine(id: 1, name: "Main", state: s1, args: [String: Any]())

}

var sm = load()

print(sm.state.id)

sm.next(transition: sm.state.transitions[0])

print(sm.state.id)
