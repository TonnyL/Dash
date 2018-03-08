protocol AbstractFactory {
    
    func manufactureContainer() -> AbstractProduct
    
    func manufactureMould() -> AbstractProduct
    
}

protocol AbstractProduct {
    
    func action()
    
}

protocol ContainerProduct: AbstractProduct {
    
}

protocol MouldProduct: AbstractProduct {
    
}

class ContainerProductA: ContainerProduct {
    
    func action() {
        print("ContainerProductA")
    }
    
}

class ContainerProductB: ContainerProduct {
    
    func action() {
        print("ContainerProductB")
    }
    
}

class MouldProductA: MouldProduct {
    
    func action() {
        print("MouldProductA")
    }
    
}

class MouldProductB: MouldProduct {
    
    func action() {
        print("MouldProductB")
    }
    
}

class FactoryFA: AbstractFactory {
    
    func manufactureContainer() -> AbstractProduct {
        return ContainerProductA()
    }
    
    func manufactureMould() -> AbstractProduct {
        return MouldProductA()
    }
    
}

class FactoryFB: AbstractFactory {
    
    func manufactureContainer() -> AbstractProduct {
        return ContainerProductB()
    }
    
    func manufactureMould() -> AbstractProduct {
        return MouldProductB()
    }
    
}

let factoryA = FactoryFA()
let factoryB = FactoryFB()

factoryA.manufactureContainer().action()
factoryA.manufactureMould().action()

factoryB.manufactureContainer().action()
factoryB.manufactureMould().action()
