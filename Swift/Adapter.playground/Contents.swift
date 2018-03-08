protocol Target {
    
    func request()
    
}

class Adaptee {
    
    func specificRequest() {
        print("Specific request")
    }
    
}

final class Adapter: Adaptee, Target {
    
    func request() {
        self.specificRequest()
    }
    
}

let adapter = Adapter()
adapter.specificRequest()
