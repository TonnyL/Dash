import org.junit.Test

interface Target {

    fun request()

}

open class Adaptee {

    fun specificRequest() {
        println("Specific request")
    }

}

class Adapter : Adaptee(), Target {

    override fun request() {
        this.specificRequest()
    }

}

class TestAdapter {

    @Test
    fun testAdapter() {
        val adapter = Adapter()
        adapter.specificRequest()
    }

}