class Singleton {
    
    private init() {}
    
    static private let INSTANCE: Singleton = Singleton()
    
    static func getInstance() -> Singleton {
        return INSTANCE
    }
    
}

let singleton1 = Singleton.getInstance()
let singleton2 = Singleton.getInstance()

if (singleton1 === singleton2) {
    print("pass")
} else {
    print("error")
}
