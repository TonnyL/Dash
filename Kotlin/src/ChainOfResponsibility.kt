import org.junit.Test

class Level(level: Int) {

    var level = 1

    init {
        this.level = level
    }

}

class Request(var level: Level) {

    fun getLevel(): Int {
        return level.level
    }

}

class Response(val message: String) {

    init {
        println("Done")
    }

}

abstract class AbstractHandler {

    private var nextHandler: AbstractHandler? = null

    protected abstract val handlerLevel: Int

    fun handlerRequest(request: Request): Response? {
        var response: Response? = null

        if (handlerLevel == request.getLevel()) {
            response = response(request)
        } else {
            if (nextHandler != null) {
                println("To next handler")
                response = nextHandler?.handlerRequest(request)
            } else {
                println("No more request")
            }
        }

        return response
    }

    fun setNextHandler(handler: AbstractHandler) {
        nextHandler = handler
    }

    protected abstract fun response(request: Request): Response

}

class ConcreteHandlerA : AbstractHandler() {

    override val handlerLevel: Int
        get() = 0

    override fun response(request: Request): Response {
        println("Handled by ConcreteHandlerA")
        return Response("Response A")
    }

}

class ConcreteHandlerB : AbstractHandler() {

    override val handlerLevel: Int
        get() = 1

    override fun response(request: Request): Response {
        println("Handled by ConcreteHandlerB")
        return Response("Response B")
    }

}

class TestChainOfResponsibility {

    @Test
    fun testChainOfResponsibility() {
        val handler1 = ConcreteHandlerA()
        val handler2 = ConcreteHandlerB()

        handler1.setNextHandler(handler2)
        val response1 = handler1.handlerRequest(Request(Level(0)))
        println("==== Response message -> ${response1?.message} ====")

        val response2 = handler1.handlerRequest(Request(Level(1)))
        println("==== Response message -> ${response2?.message} ====")
    }

}