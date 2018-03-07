class Receiver {
    
    func action() {
        print("do something")
    }
    
}

protocol Command {
    
    func execute()
    
}

class ConcreteCommand: Command {
    
    private let receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.action()
    }
    
}

class Invoker {
    
    private let command: Command
    
    init(command: Command) {
        self.command = command
    }
    
    func action() {
        command.execute()
    }
    
}

let receiver: Receiver = Receiver()
let command: Command = ConcreteCommand(receiver: receiver)
let invoker: Invoker = Invoker(command: command)

invoker.action()
