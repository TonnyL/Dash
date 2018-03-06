import org.junit.Assert
import org.junit.Test

class Role private constructor() {

    var name: String? = null
    var skill: String? = null
    var hp: Float? = null
    var sp: Float? = null
    var mp: Float? = null

    internal class Builder {

        private val role = Role()

        fun setName(name: String?): Builder {
            role.name = name
            return this
        }

        fun setSkill(skill: String?): Builder {
            role.skill = skill
            return this
        }

        fun setHp(hp: Float?): Builder {
            role.hp = hp
            return this
        }

        fun setSp(sp: Float?): Builder {
            role.sp = sp
            return this
        }

        fun setMp(mp: Float?): Builder {
            role.mp = mp
            return this
        }

        fun build(): Role {
            return role
        }

    }

}

data class Computer(
        var cpu: String? = null,
        var mainBoard: String? = null,
        var memory: String? = null,
        var graphicsCard: String? = null,
        var nic: String? = null,
        var soundCard: String? = null
)

abstract class Builder {

    private val computer = Computer()

    abstract fun setCpu()

    abstract fun setMainBoard()

    abstract fun setMemory()

    abstract fun setGraphicsCard()

    abstract fun setNic()

    abstract fun setSoundCard()

    open fun build(): Computer = computer

}

class AwesomeComputerBuilder : Builder() {

    private val awesomeComputer = Computer()

    override fun setCpu() {
        awesomeComputer.cpu = "👍 cpu"
    }

    override fun setMainBoard() {
        awesomeComputer.mainBoard = "👍 main board"
    }

    override fun setMemory() {
        awesomeComputer.memory = "👍 memory"
    }

    override fun setGraphicsCard() {
        awesomeComputer.graphicsCard = "👍 graphics card"
    }

    override fun setNic() {
        awesomeComputer.nic = "👍 nic"
    }

    override fun setSoundCard() {
        awesomeComputer.soundCard = "👍 sound card"
    }

    override fun build(): Computer = awesomeComputer

}

class JunkComputerBuilder : Builder() {

    private val junkComputer = Computer()

    override fun setCpu() {
        junkComputer.cpu = "👎 cpu"
    }

    override fun setMainBoard() {
        junkComputer.mainBoard = "👎 main board"
    }

    override fun setMemory() {
        junkComputer.memory = "👎 memory"
    }

    override fun setGraphicsCard() {
        junkComputer.graphicsCard = "👎 graphics card"
    }

    override fun setNic() {
        junkComputer.nic = "👎 nic"
    }

    override fun setSoundCard() {
        junkComputer.soundCard = "👎 sound card"
    }

    override fun build(): Computer = junkComputer

}

class Director {

    fun construct(builder: Builder) {
        builder.setCpu()
        builder.setMainBoard()
        builder.setMemory()
        builder.setGraphicsCard()
        builder.setNic()
        builder.setSoundCard()
    }

}

class BuilderTest {

    @Test
    fun testBuild() {
        val role = Role.Builder()
                .setName("Dragon")
                .setSkill("Fire")
                .setHp(100.toFloat())
                .setMp(100.toFloat())
                .setSp(100.toFloat())
                .build()

        Assert.assertNotNull(role)
        Assert.assertTrue(role.name == "Dragon")
        Assert.assertTrue(role.skill == "Fire")
        Assert.assertTrue(role.hp == 100.toFloat())
        Assert.assertTrue(role.sp == 100.toFloat())
        Assert.assertTrue(role.mp == 100.toFloat())


        val director = Director()
        val awesomeBuilder = AwesomeComputerBuilder()
        val junkBuilder = JunkComputerBuilder()

        director.construct(awesomeBuilder)
        val awesomeComputer = awesomeBuilder.build()
        director.construct(junkBuilder)
        val junkComputer = junkBuilder.build()

        Assert.assertNotNull(awesomeComputer)
        Assert.assertTrue(awesomeComputer.cpu == "👍 cpu")
        Assert.assertTrue(awesomeComputer.memory == "👍 memory")
        Assert.assertTrue(awesomeComputer.mainBoard == "👍 main board")
        Assert.assertTrue(awesomeComputer.graphicsCard == "👍 graphics card")
        Assert.assertTrue(awesomeComputer.nic == "👍 nic")
        Assert.assertTrue(awesomeComputer.soundCard == "👍 sound card")

        Assert.assertNotNull(junkComputer)
        Assert.assertTrue(junkComputer.cpu == "👎 cpu")
        Assert.assertTrue(junkComputer.mainBoard == "👎 main board")
        Assert.assertTrue(junkComputer.memory == "👎 memory")
        Assert.assertTrue(junkComputer.nic == "👎 nic")
        Assert.assertTrue(junkComputer.graphicsCard == "👎 graphics card")
        Assert.assertTrue(junkComputer.soundCard == "👎 sound card")
    }

}