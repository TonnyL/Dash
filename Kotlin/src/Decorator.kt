import org.junit.Test

interface Component {

    fun action()

}

class ConcreteComponent : Component {

    override fun action() {
        println("Base function")
    }

}

abstract class Decorator(private val component: Component) : Component {

    override fun action() {
        component.action()
    }

}

class ConcreteDecoratorA(component: Component) : Decorator(component) {

    private val addedState: Int = 3

    override fun action() {
        println("ConcreteDecoratorA starts: Add new member addedState: $addedState")
        super.action()
        println("ConcreteDecoratorA ends")
    }

}

class ConcreteDecoratorB(component: Component) : Decorator(component) {

    private fun addedBehavior() {
        println("ConcreteDecoratorB starts: Add new function addedBehavior()")
    }

    override fun action() {
        addedBehavior()
        super.action()
        println("ConcreteDecoratorB ends")
    }

}

class TestDecorator {

    @Test
    fun testDecorator() {
        var component: Component = ConcreteComponent()
        component.action()

        println("=============")

        component = ConcreteDecoratorA(component)
        component.action()

        println("=============")

        component = ConcreteDecoratorB(component)
        component.action()

        println("=============")

        component = ConcreteDecoratorA(ConcreteDecoratorB(ConcreteComponent()))
        component.action()
    }

}