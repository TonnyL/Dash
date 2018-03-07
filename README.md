# Dash
Design patterns in [Kotlin](https://github.com/JetBrains/kotlin) and [Swift](https://github.com/apple/swift).

> In software engineering, a software design pattern is a general, reusable solution to a commonly occurring problem within a given context in software design. 
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Software_design_pattern)**

## Table of Contents
+ [Behavioral Patterns](#behavioral-patterns)
	- [Observer](#observer)
	- [Strategy](#strategy)
	- [Command](#command)
	- [State](#state)
	- [Chain of Responsibility](#chain-of-responsibility)
	- [Visitor](#visitor)
+ [Creational Patterns](#creational-patterns)
	- [Builder](#builder)
	- [Factory Method](#factory-method)
	- [Singleton](#singleton)
	- [Abstract Factory](#abstract-factory)
+ [Structural Patterns](#structural-patterns)
	- [Adapter](#adapter)
	- [Decorator](#decorator)
	- [Facade](#facade)
	- [Protection Proxy](#protection-proxy)

### [Behavioral Patterns](#behavioral-patterns)
> In software engineering, behavioral design patterns are design patterns that identify common communication patterns between objects and realize these patterns. 
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Behavioral_pattern)**

#### [Observer](#observer)
> The observer pattern is a software design pattern in which an object, called the subject, maintains a list of its dependents, called observers, and notifies them automatically of any state changes, usually by calling one of their methods.
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Observer_pattern)**

**[Kotlin example:](Kotlin/src/Observer.kt)**

```kotlin
abstract class Subject {

    private val observers = mutableListOf<Observer>()

    fun addObserver(observer: Observer) {
        observers.add(observer)
    }

    fun removeObserver(observer: Observer) {
        observers.removeIf { it == observer }
    }

    protected fun notifyObserver() {
        observers.forEach {
            it.update()
        }
    }

    abstract fun doSomething()

}

interface Observer {

    fun update()

}

class ConcreteSubject : Subject() {

    override fun doSomething() {
        println("ConcreteSubject do something")
        notifyObserver()
    }

}

class ConcreteObserver1 : Observer {

    override fun update() {
        println("ConcreteObserver1 received message")
    }

}

class ConcreteObserver2 : Observer {

    override fun update() {
        println("ConcreteObserver2 received message")
    }

}
```

**[Kotlin usage:](Kotlin/src/Observer.kt)**

```kotlin
val subject = ConcreteSubject()
val observer1 = ConcreteObserver1()
val observer2 = ConcreteObserver2()

subject.addObserver(observer1)
subject.addObserver(observer2)

subject.doSomething()

subject.removeObserver(observer1)

subject.doSomething()
```

**[Swift example:](Swift/Swift/Observer.playground/Contents.swift)**

```swift
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
```

**[Swift usage:](Swift/Swift/Observer.playground/Contents.swift)**

```swift
let subject = ConcreteSubject()
let observer1 = ConcreteObserver1()
let observer2 = ConcreteObserver2()

subject.addObserver(observer1)
subject.addObserver(observer2)

subject.doSomething()

subject.removeObserver(0)

subject.doSomething()
```

#### [Strategy](#strategy)
> In computer programming, the strategy pattern (also known as the policy pattern) is a behavioral software design pattern that enables selecting an algorithm at runtime. 
> 
> **Source: [wikipedia.org]()**

**[Kotlin example:](Kotlin/src/Strategy.kt)**

```kotlin
interface Strategy {

    fun calculate(a: Int, b: Int): Int

}

class AddStrategy : Strategy {

    override fun calculate(a: Int, b: Int): Int = a + b

}

class SubtractStrategy : Strategy {

    override fun calculate(a: Int, b: Int): Int = a - b

}

class Calculator(private val strategy: Strategy) {

    fun calculate(a: Int, b: Int): Int = strategy.calculate(a, b)

}
```

**[Kotlin usage:](Kotlin/src/Strategy.kt)**

```kotlin
val add = Calculator(AddStrategy())
val subtract = Calculator(SubtractStrategy())

println(add.calculate(1, 2))
println(subtract.calculate(1, 2))
```

**[Swift example:](Swift/Strategy.playground/Contents.swift)**

```swift
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
```

**[Swift usage:](Swift/Command.playground/Contents.swift)**

```swift
let add = Calculator(strategy: AddStrategy())
let subtract = Calculator(strategy: SubtractStrategy())

print(add.calculate(1, 2))
print(subtract.calculate(1, 2))
```

#### [Command](#command)
> In object-oriented programming, the command pattern is a behavioral design pattern in which an object is used to encapsulate all information needed to perform an action or trigger an event at a later time.
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Command_pattern)**

**[Kotlin example:](Kotlin/src/Command.kt)**

```kotlin
class Receiver {

    fun action() {
        println("do something")
    }

}

interface Command {

    fun execute()

}

class ConcreteCommand(private val receiver: Receiver) : Command {

    override fun execute() {
        receiver.action()
    }

}

class Invoker(private val command: Command) {

    fun action() {
        command.execute()
    }

}
```

**[Kotlin usage:](Kotlin/src/Command.kt)**

```kotlin
val receiver = Receiver()
val command = ConcreteCommand(receiver)
val invoker = Invoker(command)

invoker.action()
```

**[Swift example:](Swift/Command.playground/Contents.swift)**

```swift
class Receiver {
    
    func action() {
        print("do something")
    }
    
}

protocol Command {
    
    func execute()
    
}

class ConcreteCommand: Command {
    
    private let receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.action()
    }
    
}

class Invoker {
    
    private let command: Command
    
    init(command: Command) {
        self.command = command
    }
    
    func action() {
        command.execute()
    }
    
}
```

**[Swift usage:](Swift/Command.playground/Contents.swift)**

```swift
let receiver: Receiver = Receiver()
let command: Command = ConcreteCommand(receiver: receiver)
let invoker: Invoker = Invoker(command: command)

invoker.action()
```

#### [State](#state)
> The state pattern is a behavioral software design pattern that implements a state machine in an object-oriented way. 
>
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/State_pattern)**

#### [Chain of Responsibility](#chain-of-responsibility)
> In object-oriented design, the chain-of-responsibility pattern is a design pattern consisting of a source of command objects and a series of processing objects.
>
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern)**

### [Creational Patterns](#creational-patterns)
> In software engineering, creational design patterns are design patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation. 
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Creational_pattern)**

#### [Visitor](#visitor)
> In object-oriented programming and software engineering, the visitor design pattern is a way of separating an algorithm from an object structure on which it operates. 
>
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Visitor_pattern)**

#### [Builder](#builder)
> The Builder design pattern is a creational design pattern, designed to provide a flexible design solution to various object creation problems in Object-Oriented software. 
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Builder_pattern)**

**[Kotlin example:](Kotlin/src/Builder.kt)**

```kotlin
data class Computer(
        var cpu: String? = null,
        var mainBoard: String? = null,
        var memory: String? = null,
        var graphicsCard: String? = null,
        var nic: String? = null,
        var soundCard: String? = null
)

abstract class Builder {

    private val computer = Computer()

    abstract fun setCpu()

    abstract fun setMainBoard()

    abstract fun setMemory()

    abstract fun setGraphicsCard()

    abstract fun setNic()

    abstract fun setSoundCard()

    open fun build(): Computer = computer

}

class AwesomeComputerBuilder : Builder() {

    private val awesomeComputer = Computer()

    override fun setCpu() {
        awesomeComputer.cpu = "👍 cpu"
    }

    override fun setMainBoard() {
        awesomeComputer.mainBoard = "👍 main board"
    }

    override fun setMemory() {
        awesomeComputer.memory = "👍 memory"
    }

    override fun setGraphicsCard() {
        awesomeComputer.graphicsCard = "👍 graphics card"
    }

    override fun setNic() {
        awesomeComputer.nic = "👍 nic"
    }

    override fun setSoundCard() {
        awesomeComputer.soundCard = "👍 sound card"
    }

    override fun build(): Computer = awesomeComputer

}

class JunkComputerBuilder : Builder() {

    private val junkComputer = Computer()

    override fun setCpu() {
        junkComputer.cpu = "👎 cpu"
    }

    override fun setMainBoard() {
        junkComputer.mainBoard = "👎 main board"
    }

    override fun setMemory() {
        junkComputer.memory = "👎 memory"
    }

    override fun setGraphicsCard() {
        junkComputer.graphicsCard = "👎 graphics card"
    }

    override fun setNic() {
        junkComputer.nic = "👎 nic"
    }

    override fun setSoundCard() {
        junkComputer.soundCard = "👎 sound card"
    }

    override fun build(): Computer = junkComputer

}

class Director {

    fun construct(builder: Builder) {
        builder.setCpu()
        builder.setMainBoard()
        builder.setMemory()
        builder.setGraphicsCard()
        builder.setNic()
        builder.setSoundCard()
    }

}
```

**[Kotlin usage:](Kotlin/src/Builder.kt)**

```kotlin
val director = Director()
val awesomeBuilder = AwesomeComputerBuilder()
val junkBuilder = JunkComputerBuilder()

director.construct(awesomeBuilder)
val awesomeComputer = awesomeBuilder.build()
director.construct(junkBuilder)
val junkComputer = junkBuilder.build()

println(awesomeComputer)
println(junkComputer)
```

**[Swift example:](Swift/Builder.playground/Contents.swift)**

```swift
struct Computer {
    
    var cpu: String? = nil
    var mainBoard: String? = nil
    var memory: String? = nil
    var graphicsCard: String? = nil
    var nic: String? = nil
    var soundCard: String? = nil
    
}

class Builder {
    
    private var computer: Computer = Computer()
    
    func setCpu() {}
    
    func setMainBoard() {}
    
    func setMemory() {}
    
    func setGraphicsCard() {}
    
    func setNic() {}
    
    func setSoundCard() {}
    
    func build() -> Computer {
        return computer
    }
    
}

class AwesomeComputerBuilder: Builder {
    
    var awesomeComputer: Computer = Computer()
    
    override func setCpu() {
        awesomeComputer.cpu = "👍 cpu"
    }
    
    override func setMainBoard() {
        awesomeComputer.mainBoard = "👍 main board"
    }
    
    override func setMemory() {
        awesomeComputer.memory = "👍 memory"
    }
    
    override func setGraphicsCard() {
        awesomeComputer.graphicsCard = "👍 graphics card"
    }
    
    override func setNic() {
        awesomeComputer.nic = "👍 nic"
    }
    
    override func setSoundCard() {
        awesomeComputer.soundCard = "👍 sound card"
    }
    
    override func build() -> Computer {
        return awesomeComputer
    }
    
}

class JunkComputerBuilder : Builder {
    
    private var junkComputer: Computer = Computer()
    
    override func setCpu() {
        junkComputer.cpu = "👎 cpu"
    }
    
    override func setMainBoard() {
        junkComputer.mainBoard = "👎 main board"
    }
    
    override func setMemory() {
        junkComputer.memory = "👎 memory"
    }
    
    override func setGraphicsCard() {
        junkComputer.graphicsCard = "👎 graphics card"
    }
    
    override func setNic() {
        junkComputer.nic = "👎 nic"
    }
    
    override func setSoundCard() {
        junkComputer.soundCard = "👎 sound card"
    }
    
    override func build() -> Computer {
        return junkComputer
    }
    
}

class Director {
    
    func construct(_ builder: Builder) {
        builder.setCpu()
        builder.setMainBoard()
        builder.setMemory()
        builder.setGraphicsCard()
        builder.setNic()
        builder.setSoundCard()
    }
    
}
```

**[Swift usage:](Swift/Builder.playground/Contents.swift)**

```swift
let director = Director()
let awesomeBuilder = AwesomeComputerBuilder()
let junkBuilder = JunkComputerBuilder()

director.construct(awesomeBuilder)
let awesomeComputer: Computer? = awesomeBuilder.build()
director.construct(junkBuilder)
let junkComputer: Computer? = junkBuilder.build()

print(awesomeBuilder)
print(junkComputer)
```

#### [Factory Method](#factory-method)

#### [Singleton](#singleton)
> In software engineering, the singleton pattern is a software design pattern that restricts the instantiation of a class to one object. 
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Singleton_pattern)**

**[Kotlin example:](Kotlin/src/Singleton.kt)**

```kotlin
object Singleton {
	
	fun action() {
        print("action")
    }
	
}
```

**[Kotlin usage:](Kotlin/src/Singleton.kt)**

```kotlin
Singleton.action()
```

**[Swift example:](Swift/Singleton.playground/Contents.swift)**

```swift
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
```

**[Swift usage:](Swift/Singleton.playground/Contents.swift)**

```swift
Singleton.getInstance().action()
```

#### [Abstract Factory](#abstract-factory)
> The abstract factory pattern provides a way to encapsulate a group of individual factories that have a common theme without specifying their concrete classes.
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Abstract_factory_pattern)**

### [Structural Patterns](#structural-patterns)
> In software engineering, structural design patterns are design patterns that ease the design by identifying a simple way to realize relationships between entities.
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Structural_pattern)**

#### [Adapter](#adapter)
> In software engineering, the adapter pattern is a software design pattern (also known as Wrapper, an alternative naming shared with the Decorator pattern) that allows the interface of an existing class to be used as another interface.
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Adapter_pattern)**

#### [Decorator](#decorator)
> In object-oriented programming, the decorator pattern is a design pattern that allows behavior to be added to an individual object, either statically or dynamically, without affecting the behavior of other objects from the same class.
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Decorator_pattern)**

#### [Facade](#facade)
> A facade is an object that provides a simplified interface to a larger body of code, such as a class library.
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Facade_pattern)**

#### [Proxy](#proxy)
> The Proxy design pattern is one of the twenty-three well-known GoF design patterns that describe how to solve recurring design problems to design flexible and reusable object-oriented software, that is, objects that are easier to implement, change, test, and reuse.
>
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Proxy_pattern)**

## License
Dash is under an MIT license. See the [LICENSE](LICENSE) for more information.