protocol State {
    
    func handle(_ context: Context)
    
}

class Context {
    
    var state: State? = nil
    
    func request() {
        state?.handle(self)
    }
    
}

final class StartState: State {
    
    func handle(_ context: Context) {
        print("Start state")
        context.state = self
    }
    
}

final class StopState: State {
    
    func handle(_ context: Context) {
        print("Stop state")
        context.state = self
    }
    
}

let context = Context()

context.state = StartState()
context.request()

context.state = StopState()
context.request()
