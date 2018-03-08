class Level {
    
    var level: Int = 1
    
    init(_ level: Int) {
        self.level = level
    }
    
}

class Request {
    
    var level: Level
    
    init(_ level: Level) {
        self.level = level
    }
    
    func getLevel() -> Int {
        return level.level
    }
    
}

class Response {
    
    let message: String
    
    init(_ message: String) {
        self.message = message
        print("Done")
    }
    
}

class AbstractHandler {
    
    private var nextHandler: AbstractHandler? = nil
    
    var handlerLevel: Int = 0
    
    func handlerRequest(_ request: Request) -> Response? {
        var resp: Response? = nil
        
        if handlerLevel == request.getLevel() {
            resp = response(request)
        } else {
            if nextHandler != nil {
                print("To next handler")
                resp = nextHandler?.handlerRequest(request)
            } else {
                print("No more request")
            }
        }
        
        return resp
    }
    
    func setNextHandler(_ handler: AbstractHandler) {
        nextHandler = handler
    }
    
    func response(_ request: Request) -> Response? {
        return nil
    }
    
}

class ConcreteHandlerA: AbstractHandler {
    
    override var handlerLevel: Int {
        get {
            return 0
        }
        set {
            
        }
    }
    
    override func response(_ request: Request) -> Response? {
        print("Handled by ConcreteHandlerA")
        return Response("Response A")
    }
    
}

class ConcreteHandlerB: AbstractHandler {
    
    override var handlerLevel: Int {
        get {
            return 1
        }
        set {
            
        }
    }
    
    override func response(_ request: Request) -> Response? {
        print("Handled by ConcreteHandlerB")
        return Response("Response B")
    }
    
}

let handler1 = ConcreteHandlerA()
let handler2 = ConcreteHandlerB()

handler1.setNextHandler(handler2)
let response1 = handler1.handlerRequest(Request(Level(0)))
print("==== Response message -> \(response1?.message ?? "") ====")

let response2 = handler1.handlerRequest(Request(Level(1)))
print("==== Response message -> \(response2?.message ?? "") ====")
