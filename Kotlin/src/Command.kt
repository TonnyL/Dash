import org.junit.Test

class Receiver {

    fun action() {
        println("do something")
    }

}

interface Command {

    fun execute()

}

class ConcreteCommand(private val receiver: Receiver) : Command {

    override fun execute() {
        receiver.action()
    }

}

class Invoker(private val command: Command) {

    fun action() {
        command.execute()
    }

}

class TestCommand {

    @Test
    fun testCommand() {
        val receiver = Receiver()
        val command = ConcreteCommand(receiver)
        val invoker = Invoker(command)

        invoker.action()
    }

}