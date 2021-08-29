import Cocoa

//MARK: Component

protocol Coffee {
    var cost: Double { get }
}

class ClassicCoffee: Coffee {
    var cost: Double {
        return 200
    }
}

//MARK: Decorator

protocol DecoratorCoffee: Coffee {
    var baseCoffee: Coffee { get }
    init(base: Coffee)
}

class CoffeeWithMilk: DecoratorCoffee {
    var baseCoffee: Coffee
    
    required init(base: Coffee) {
        self.baseCoffee = base
    }
    
    var cost: Double {
        return self.cost + 50
    }
}

class CoffeeWithSugar: DecoratorCoffee {
    var baseCoffee: Coffee
    
    required init(base: Coffee) {
        self.baseCoffee = base
    }
    
    var cost: Double {
        return self.cost + 20
    }
}

class CoffeeWithCream: DecoratorCoffee {
    var baseCoffee: Coffee
    
    required init(base: Coffee) {
        self.baseCoffee = base
    }
    
    var cost: Double {
        return self.cost + 100
    }
}

//MARK: Examples

var coffee = CoffeeWithCream(base:CoffeeWithMilk(base: CoffeeWithSugar(base: ClassicCoffee())))
print(coffee.cost)

