import Foundation

class Role {
    
    var name: String? = nil
    var skill: String? = nil
    var hp: Float? = nil
    var sp: Float? = nil
    var mp: Float? = nil
    
    class Builder {
        
        private var role = Role()
        
        func setName(_ name: String?) -> Builder {
            role.name = name
            return self
        }
        
        func setSkill(_ skill: String?) -> Builder {
            role.skill = skill
            return self
        }
        
        func setHp(_ hp: Float?) -> Builder {
            role.hp = hp
            return self
        }
        
        func setSp(_ sp: Float?) -> Builder {
            role.sp = sp
            return self
        }
        
        func setMp(_ mp: Float?) -> Builder {
            role.mp = mp
            return self
        }
        
        func build() -> Role {
            return role
        }
        
    }
    
}

struct Computer {
    
    var cpu: String? = nil
    var mainBoard: String? = nil
    var memory: String? = nil
    var graphicsCard: String? = nil
    var nic: String? = nil
    var soundCard: String? = nil
    
}

class Builder {
    
    private var computer: Computer = Computer()
    
    func setCpu() {}
    
    func setMainBoard() {}
    
    func setMemory() {}
    
    func setGraphicsCard() {}
    
    func setNic() {}
    
    func setSoundCard() {}
    
    func build() -> Computer {
        return computer
    }
    
}

class AwesomeComputerBuilder: Builder {
    
    var awesomeComputer: Computer = Computer()
    
    override func setCpu() {
        awesomeComputer.cpu = "👍 cpu"
    }
    
    override func setMainBoard() {
        awesomeComputer.mainBoard = "👍 main board"
    }
    
    override func setMemory() {
        awesomeComputer.memory = "👍 memory"
    }
    
    override func setGraphicsCard() {
        awesomeComputer.graphicsCard = "👍 graphics card"
    }
    
    override func setNic() {
        awesomeComputer.nic = "👍 nic"
    }
    
    override func setSoundCard() {
        awesomeComputer.soundCard = "👍 sound card"
    }
    
    override func build() -> Computer {
        return awesomeComputer
    }
    
}

class JunkComputerBuilder : Builder {
    
    private var junkComputer: Computer = Computer()
    
    override func setCpu() {
        junkComputer.cpu = "👎 cpu"
    }
    
    override func setMainBoard() {
        junkComputer.mainBoard = "👎 main board"
    }
    
    override func setMemory() {
        junkComputer.memory = "👎 memory"
    }
    
    override func setGraphicsCard() {
        junkComputer.graphicsCard = "👎 graphics card"
    }
    
    override func setNic() {
        junkComputer.nic = "👎 nic"
    }
    
    override func setSoundCard() {
        junkComputer.soundCard = "👎 sound card"
    }
    
    override func build() -> Computer {
        return junkComputer
    }
    
}

class Director {
    
    func construct(_ builder: Builder) {
        builder.setCpu()
        builder.setMainBoard()
        builder.setMemory()
        builder.setGraphicsCard()
        builder.setNic()
        builder.setSoundCard()
    }
    
}

let role: Role? = Role.Builder()
    .setName("Dragon")
    .setSkill("Fire")
    .setHp(Float(100))
    .setMp(Float(100))
    .setSp(Float(100))
    .build()

if role != nil {
    print("pass")
} else {
    print("error")
}
if role?.name == "Dragon" {
    print("pass")
} else {
    print("error")
}
if role?.skill == "Fire" {
    print("pass")
} else {
    print("error")
}
if role?.hp == Float(100) {
    print("pass")
} else {
    print("error")
}
if role?.sp == Float(100) {
    print("pass")
} else {
    print("error")
}
if role?.mp == Float(100) {
    print("pass")
} else {
    print("error")
}

let director = Director()
let awesomeBuilder = AwesomeComputerBuilder()
let junkBuilder = JunkComputerBuilder()

director.construct(awesomeBuilder)
let awesomeComputer: Computer? = awesomeBuilder.build()
director.construct(junkBuilder)
let junkComputer: Computer? = junkBuilder.build()

if awesomeComputer != nil {
    print("pass")
} else {
    print("error")
}
if awesomeComputer?.cpu == "👍 cpu" {
    print("pass")
} else {
    print("error")
}
if awesomeComputer?.memory == "👍 memory" {
    print("pass")
} else {
    print("error")
}
if awesomeComputer?.mainBoard == "👍 main board" {
    print("pass")
} else {
    print("error")
}
if awesomeComputer?.graphicsCard == "👍 graphics card" {
    print("pass")
} else {
    print("error")
}
if awesomeComputer?.nic == "👍 nic" {
    print("pass")
} else {
    print("error")
}
if awesomeComputer?.soundCard == "👍 sound card" {
    print("pass")
} else {
    print("error")
}

if junkComputer != nil {
    print("pass")
} else {
    print("error")
}
if junkComputer?.cpu == "👎 cpu" {
    print("pass")
} else {
    print("error")
}
if junkComputer?.mainBoard == "👎 main board" {
    print("pass")
} else {
    print("error")
}
if junkComputer?.memory == "👎 memory" {
    print("pass")
} else {
    print("error")
}
if junkComputer?.nic == "👎 nic" {
    print("pass")
} else {
    print("error")
}
if junkComputer?.graphicsCard == "👎 graphics card" {
    print("pass")
} else {
    print("error")
}
if junkComputer?.soundCard == "👎 sound card" {
    print("pass")
} else {
    print("error")
}
