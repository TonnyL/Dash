import org.junit.Test

interface Visitor {

    fun visit(elementA: ConcreteElementA)

    fun visit(elementB: ConcreteElementB)

}

interface Visitable {

    fun accept(visitor: Visitor)

}

class ConcreteVisitorA : Visitor {

    override fun visit(elementA: ConcreteElementA) {
        elementA.operate()
    }

    override fun visit(elementB: ConcreteElementB) {
        elementB.operate()
    }

}

class ConcreteVisitorB : Visitor {

    override fun visit(elementA: ConcreteElementA) {
        elementA.operate()
    }

    override fun visit(elementB: ConcreteElementB) {
        elementB.operate()
    }

}

class ConcreteElementA : Visitable {

    override fun accept(visitor: Visitor) {
        visitor.visit(this)
    }

    fun operate() {
        println("ConcreteElementA ....")
    }

}

class ConcreteElementB : Visitable {

    override fun accept(visitor: Visitor) {
        visitor.visit(this)
    }

    fun operate() {
        println("ConcreteElementB ....")
    }

}

class TestVisitor {

    @Test
    fun testVisitor() {
        val visitor1 = ConcreteVisitorA()
        val list1 = arrayListOf(ConcreteElementA(), ConcreteElementB())
        list1.forEach {
            it.accept(visitor1)
        }

        val visitor2 = ConcreteVisitorB()
        val list2 = arrayListOf(ConcreteElementB())
        list2.forEach {
            it.accept(visitor2)
        }
    }

}