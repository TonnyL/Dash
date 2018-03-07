import org.junit.Test

interface State {

    fun handle(context: Context)

}

class Context {

    var state: State? = null

    fun request() {
        state?.handle(this)
    }

}

class StartState : State {

    override fun handle(context: Context) {
        println("Start state")
        context.state = this
    }

}

class StopState : State {

    override fun handle(context: Context) {
        println("Stop state")
        context.state = this
    }

}

class TestState {

    @Test
    fun testState() {
        val context = Context()

        context.state = StartState()
        context.request()

        context.state = StopState()
        context.request()
    }

}