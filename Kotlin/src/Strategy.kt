import org.junit.Assert
import org.junit.Test

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

class TestStrategy {

    @Test
    fun testStrategy() {
        val add = Calculator(AddStrategy())
        val subtract = Calculator(SubtractStrategy())

        Assert.assertTrue(add.calculate(1, 2) == 3)
        Assert.assertTrue(subtract.calculate(1, 2) == -1)
    }

}