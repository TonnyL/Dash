class Singleton {
    
    private init() {}
    
    static private let INSTANCE: Singleton = Singleton()
    
    static func getInstance() -> Singleton {
        return INSTANCE
    }
    
    func action() {
        print("action")
    }
    
}

let singleton1 = Singleton.getInstance()
let singleton2 = Singleton.getInstance()

if (singleton1 === singleton2) {
    print("pass")
} else {
    print("error")
}

singleton1.action()
