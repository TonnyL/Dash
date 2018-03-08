protocol Factory {
    
    func manufacture() -> Product
    
}

protocol Product {
    
    func action()
    
}

class FactoryA: Factory {
    
    func manufacture() -> Product {
        return ProductA()
    }
    
}

class FactoryB: Factory {
    
    func manufacture() -> Product {
        return ProductB()
    }
    
}

class ProductA: Product {
    
    func action() {
        print("ProductA")
    }
    
}

class ProductB : Product {
    
    func action() {
        print("ProductB")
    }
    
}

let factoryA = FactoryA()
factoryA.manufacture().action()

let factoryB = FactoryB()
factoryB.manufacture().action()
