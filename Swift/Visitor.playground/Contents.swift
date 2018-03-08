protocol Visitor {
    
    func visit(_ elementA: ConcreteElementA)
    
    func visit(_ elementB: ConcreteElementB)
    
}

protocol Visitable {
    
    func accept(_ visitor: Visitor)
    
}

class ConcreteVisitorA: Visitor {
    
    func visit(_ elementA: ConcreteElementA) {
        elementA.operate()
    }
    
    func visit(_ elementB: ConcreteElementB) {
        elementB.operate()
    }
    
}

class ConcreteVisitorB: Visitor {
    
    func visit(_ elementA: ConcreteElementA) {
        elementA.operate()
    }
    
    func visit(_ elementB: ConcreteElementB) {
        elementB.operate()
    }
    
}

class ConcreteElementA: Visitable {
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
    
    func operate() {
        print("ConcreteElementA ....")
    }
    
}

class ConcreteElementB: Visitable {
    
    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
    
    func operate() {
        print("ConcreteElementB ....")
    }
    
}

let visitor1 = ConcreteVisitorA()
let list1 = Array<Visitable>.init(arrayLiteral: ConcreteElementA(), ConcreteElementB())
list1.forEach {
    $0.accept(visitor1)
}

let visitor2 = ConcreteVisitorB()
let list2 = Array<Visitable>.init(arrayLiteral: ConcreteElementB())
list2.forEach {
    $0.accept(visitor2)
}
