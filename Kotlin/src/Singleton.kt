import org.junit.Assert
import org.junit.Test

object Singleton

class SingletonTest {

    @Test
    fun testSingleton() {
        val singleton1 = Singleton
        val singleton2 = Singleton

        Assert.assertTrue(singleton1 == singleton2)
    }

}
