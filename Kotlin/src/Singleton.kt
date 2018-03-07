import org.junit.Assert
import org.junit.Test

object Singleton {

    fun action() {
        println("action")
    }

}

class SingletonTest {

    @Test
    fun testSingleton() {
        val singleton1 = Singleton
        val singleton2 = Singleton

        Assert.assertTrue(singleton1 == singleton2)

        singleton1.action()
    }

}
