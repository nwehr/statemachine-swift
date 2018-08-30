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
