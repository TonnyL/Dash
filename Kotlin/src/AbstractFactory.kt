import org.junit.Test

interface AbstractFactory {

    fun manufactureContainer(): AbstractProduct

    fun manufactureMould(): AbstractProduct

}

interface AbstractProduct {

    fun action()

}

abstract class ContainerProduct : AbstractProduct

abstract class MouldProduct : AbstractProduct

class ContainerProductA : ContainerProduct() {

    override fun action() {
        println("ContainerProductA")
    }

}

class ContainerProductB : ContainerProduct() {

    override fun action() {
        println("ContainerProductB")
    }

}

class MouldProductA : MouldProduct() {

    override fun action() {
        println("MouldProductA")
    }

}

class MouldProductB : MouldProduct() {

    override fun action() {
        println("MouldProductB")
    }

}

class FactoryFA : AbstractFactory {

    override fun manufactureContainer(): AbstractProduct = ContainerProductA()

    override fun manufactureMould(): AbstractProduct = MouldProductA()


}

class FactoryFB : AbstractFactory {

    override fun manufactureContainer(): AbstractProduct = ContainerProductB()

    override fun manufactureMould(): AbstractProduct = MouldProductB()

}

class TestAbstractFactory {

    @Test
    fun testAbstractFactory() {
        val factoryA = FactoryFA()
        val factoryB = FactoryFB()

        factoryA.manufactureContainer().action()
        factoryA.manufactureMould().action()

        factoryB.manufactureContainer().action()
        factoryB.manufactureMould().action()
    }

}