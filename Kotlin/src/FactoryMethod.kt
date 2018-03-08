import org.junit.Test

interface Factory {

    fun manufacture(): Product

}

interface Product {

    fun action()

}

class FactoryA : Factory {

    override fun manufacture(): Product = ProductA()

}

class FactoryB : Factory {

    override fun manufacture(): Product = ProductB()

}

class ProductA : Product {

    override fun action() {
        println("ProductA")
    }

}

class ProductB : Product {

    override fun action() {
        println("ProductB")
    }

}

class TestFactoryMethod {

    @Test
    fun testFactoryMethod() {
        val factoryA = FactoryA()
        factoryA.manufacture().action()

        val factoryB = FactoryB()
        factoryB.manufacture().action()
    }

}