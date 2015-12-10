//: Playground - noun: a place where people can play

import UIKit

/**
*  不同与OC的是，swift的构造器不需要返回值。在结构体，如果没有自定义的构造器，系统会自动分配一个逐一成员构造器，如果有自定义的构造器，那么自动的逐一成员构造器将不可用。但是自定义的类型，如果有成员属性没有初始值，那么将必须自定义一个构造器来初始化成员属性。如果有可能为nil的属性，那么可以将这个属性定义为可选类型，这样默认的初始值就是nil。在自定义的构造其中可以使用self.init的方法调用已经定义好的构造器
*/
struct Point {
    var x = 0.0 , y = 0.0
}

struct Size {
    var width = 0.0 , height = 0.0
}

struct Rect {
    var origin:Point = Point()
    var size:Size = Size()
    var center:Point {
        set{
            origin.x = newValue.x - (size.width/2.0)
            origin.y = newValue.y - (size.height/2.0)
        }
        get{
            return Point(x: origin.x + size.width/2.0, y: origin.y + size.height/2.0)
        }
    }
    
    init(){}
    
    init(origin:Point, size:Size){
        self.origin = origin
        self.size = size
    }
    
    init(center:Point, size:Size){
        let originX = center.x - (size.width/2.0)
        let originY = center.y - (size.height/2.0)
        self.init(origin:Point(x: originX, y: originY), size:size)
    }
}

var rect1 = Rect()
var rect2 = Rect(origin: Point(x: 2, y: 2), size: Size(width: 4, height: 4))
var rect3 = Rect(center: Point(x: 1, y: 1), size: Size(width: 2, height: 2))
print(rect2.center)
print(rect3.origin)
print(rect1.center)

//在一个类的定义中，如果所有的属性都已经有默认值，那么会自动分配一个最简单的构造器init()，但是如果有自定的构造器，那么在创建实例的时候，就只能使用自定义的构造器。
class SomeClass {
    var someValue = 0
    init(somevalue:Int){
        self.someValue = somevalue
    }
    
    convenience init(){
        self.init(somevalue:0)
        someValue = 12
    }
}

/**
*  指定构造器和便利构造器，指定构造器内部总是调用父类的构造方法，而便利构造器总是调用本身类的其他构造方法；指定构造器是纵向的，而便利构造器是横向的。构造器的重写，你总是不应该重写父类的便利构造器，记住要重写也只能重写父类的指定构造器（原因从类的构造代理规则推敲，因为便利构造器总是不能从直接调用父类的构造器方法）。
*/
class Food {
    var name:String
    
    init(name:String){
        self.name = name
    }
    
    convenience init(){
        self.init(name: "[unname]")
    }
}

class RecipeIngredient: Food {
    var quantity:Int
    
    init(name:String, quantity:Int){
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name:String){
        self.init(name:name, quantity:12)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
}

var shoppingList = [ShoppingListItem]()
shoppingList.append(ShoppingListItem(name: "salt", quantity: 1))
shoppingList.append(ShoppingListItem(name: "bread"))
shoppingList[0].quantity = 1
shoppingList[0].name = "sugar"
var sugar = shoppingList[0]
print(sugar.name)


/**
*  可失败构造器，如果在构造的过程中可能失败，那么就可以定义一个可失败的构造器，“失败”在这里表示分配的资源不符合有效实例的要求，那么通过这个可失败构造器构造出来的实例是这个类的可选类型
*/
class Animal {
    var species:String
    init?(species:String){
        self.species = species
        if species.isEmpty {
            return nil
        }
    }
}
//这个时候dog是可选类型
var dog = Animal(species: "Dog")
if let animal = dog{
    print(animal.species)
}

/**
*  必要构造器，在构造器前面都必须加上required关键字，表明改类的子类必须实现该构造器,其子类重写必要构造器也必须在前面加上required关键字（这是为了保证在继承链中所有子类的该构造器都是必要的），不需要加上override关键字
*/
class AnyClass {
    var  anyValue:String
    required init(anyValue:String){
        self.anyValue = anyValue
    }
}

class AnyClassSubclass: AnyClass {
    required init(anyValue: String) {
        super.init(anyValue: anyValue)
    }
}

var anyobject = AnyClassSubclass(anyValue: "hello")
print(anyobject.anyValue)

/**
*  通过闭包、函数来设置属性默认值，闭包后面必须加上()，否则就会认为这个属性的值就是这个闭包，而不是闭包的返回值。加上()，是表示在构造这个实例的时候，通过调用闭包来设置默认值
*/
class CheckerBoard {
    var boardColors : [Bool] = { (count:Int) in
        var tempBoardColors = [Bool](count: count, repeatedValue: false)
        
        for row in 0...9{
            for colunm in 0...9{
                if (row + colunm) % 2 == 0
                {
                    tempBoardColors[row*10 + colunm] = true
                }
            }
        }
        
        return tempBoardColors
    }(100)
    
    func boardColor(row:Int, column:Int) -> Bool{
        assert(row >= 0 && row < 10 && column >= 0 && column < 10, "out of array range")
        return boardColors[row*10 + column]
    }
}

var checkerBoard = CheckerBoard()
print(checkerBoard.boardColor(5, column: 0))





