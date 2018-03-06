import org.junit.Test

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

class ObserverTest {

    @Test
    fun testObserver() {
        val subject = ConcreteSubject()
        val observer1 = ConcreteObserver1()
        val observer2 = ConcreteObserver2()

        subject.addObserver(observer1)
        subject.addObserver(observer2)

        subject.doSomething()

        subject.removeObserver(observer1)

        subject.doSomething()
    }

}