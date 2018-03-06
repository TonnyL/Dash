class Subject {
    
    private var observers = Array<Observer>.init()
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ index: Int) {
        observers.remove(at: index)
    }
    
    func notifyObserver() {
        observers.forEach {
            $0.update()
        }
    }
    
    func doSomething() {
        
    }
    
}

protocol Observer {
    
    func update()
    
}

class ConcreteSubject: Subject {
    
    override func doSomething() {
        print("ConcreteSubject do something")
        notifyObserver()
    }
    
}

class ConcreteObserver1: Observer {
    
    func update() {
        print("ConcreteObserver1 received message")
    }
    
}

class ConcreteObserver2: Observer {
    
    func update() {
        print("ConcreteObserver2 received message")
    }
    
}

let subject = ConcreteSubject()
let observer1 = ConcreteObserver1()
let observer2 = ConcreteObserver2()

subject.addObserver(observer1)
subject.addObserver(observer2)

subject.doSomething()

subject.removeObserver(0)

subject.doSomething()
