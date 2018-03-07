protocol Strategy {
    
    func calculate(_ a: Int, _ b: Int) -> Int
    
}

final class AddStrategy: Strategy {
    
    func calculate(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
}

final class SubtractStrategy: Strategy {
    
    func calculate(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
    
}

class Calculator {
    
    private let strategy: Strategy
    
    init(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func calculate(_ a: Int, _ b: Int) -> Int {
        return strategy.calculate(a, b)
    }
    
}

let add = Calculator(strategy: AddStrategy())
let subtract = Calculator(strategy: SubtractStrategy())

print(add.calculate(1, 2))
print(subtract.calculate(1, 2))
