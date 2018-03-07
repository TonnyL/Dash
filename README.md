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

### [Behavioral Patterns](#)
> In software engineering, behavioral design patterns are design patterns that identify common communication patterns between objects and realize these patterns. 
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Behavioral_pattern)**

#### [Observer](#)
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

#### [Strategy](#)

#### [Command](#)
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

#### [State](#)

#### [Chain of Responsibility](#)

### [Creational Patterns](#)
> In software engineering, creational design patterns are design patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation. 
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Creational_pattern)**

#### [Visitor](#)

#### [Builder](#)
> The Builder design pattern is a creational design pattern, designed to provide a flexible design solution to various object creation problems in Object-Oriented software. 
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Builder_pattern)**

#### [Factory Method](#)

#### [Singleton](#)
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

#### [Abstract Factory](#)

### [Structural Patterns](#)
> In software engineering, structural design patterns are design patterns that ease the design by identifying a simple way to realize relationships between entities.
> 
> **Source: [wikipedia.org](https://en.wikipedia.org/wiki/Structural_pattern)**

#### [Adapter](#)

#### [Decorator](#)

#### [Facade](#)

#### [Protection Proxy](#)

## License
Dash is under an MIT license. See the LICENSE for more information.