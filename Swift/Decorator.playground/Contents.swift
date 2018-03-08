protocol Component {
    
    func action()
    
}

class ConcreteComponent: Component {
    
    func action() {
        print("Base function")
    }
    
}

class Decorator: Component {
    
    private var component: Component
    
    init(_ component: Component) {
        self.component = component
    }
    
    func action() {
        component.action()
    }
    
}

class ConcreteDecoratorA: Decorator {
    
    private var component: Component
    private let addedState: Int = 3
    
    override init(_ component: Component) {
        self.component = component
        super.init(component)
    }
    
    override func action() {
        print("ConcreteDecoratorA starts: Add new member addedState: \(addedState)")
        
        super.action()
        print("ConcreteDecoratorA ends")
    }
    
}

class ConcreteDecoratorB : Decorator {
    
    private var component: Component
    
    override init(_ component: Component) {
        self.component = component
        super.init(component)
    }
    
    private func addedBehavior() {
        print("ConcreteDecoratorB starts: Add new function addedBehavior()")
    }
    
    override func action() {
        addedBehavior()
        super.action()
        print("ConcreteDecoratorB ends")
    }
    
}

var component: Component = ConcreteComponent()
component.action()

print("=============")

component = ConcreteDecoratorA(component)
component.action()

print("=============")

component = ConcreteDecoratorB(component)
component.action()

print("=============")

component = ConcreteDecoratorA(ConcreteDecoratorB(ConcreteComponent()))
component.action()
