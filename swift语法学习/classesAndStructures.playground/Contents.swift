//: Playground - noun: a place where people can play

import UIKit

/**
*  基本的数据类型，枚举类型，结构体类型都是值类型，值类型就是在作为函数参数传递的时候或者是被赋予到一个变量、常量时实际上是复制了一个副本，被传递的或者被赋值的是那个副本而并不是实例本身，所以当改变赋值对象的时候，实例本身并不会改变
*/
struct Resolution {
    var width = 0
    var height = 0
}
//结构体还提供这种成员逐一构造器，但是类没有
var resolution = Resolution(width: 12, height: 89)
var resolution1 = Resolution()
var resolution2 = resolution1
resolution2.width = 20
print("resolution1.width = \(resolution1.width)")

//类是引用类型,在swift中，使用“===”恒等于来判断两个变量是不是引用同一个类的实例对象，而“==”用来判断两个变量或者常量的值或者内容是不是相同或相等
class Student{
    var name = ""
    var age = 0
}
var student1 = Student()
var student = student1
if student1 === student
{
    print("student1 is student")
}
var string1 = "nihao"
var string2 = "nihao"
if string1 == string2
{
    print("string1 is similar string2.")
}

//存储属性、计算属性，存储属性使用来存储值的，而计算属性是有某些值计算出来的值。延迟储值属性是在调用的时候才会存储
//延迟属性有点类似懒加载，只有在需要的时候才会被创建,在属性声明前面加上lazy关键字即表明这个属性是延迟属性，当在多个多线程里面使用延迟属性的时候，不能保证这个属性只被初始化一次
class DataImporter{
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var datas = [String]()
}

var dataManager = DataManager()
dataManager.datas.append("data1")
dataManager.datas.append("data2")
print(dataManager.importer.fileName)
//算值属性，只读算值属性是只有getter没有setter
struct Point {
    var x = 0.0, y = 0.0
}
struct Size{
    var width = 0.0, height = 0.0
}
struct Rect{
    var origin : Point
    var size : Size
    
    var center: Point{
        get{
            let centerX = origin.x + size.width/Double(2)
            let centerY = origin.y + size.height/Double(2)
            return Point(x: centerX, y: centerY)
        }
        set{
            origin.x = newValue.x - size.width/Double(2)
            origin.y = newValue.y - size.height/Double(2)
        }
    }
}

var squar = Rect(origin: Point(x: 0, y: 0), size: Size(width: 13, height: 50))
print("squar.center = (\(squar.center.x), \(squar.center.y))")
squar.center = Point(x: 5, y: 5)
print(squar.origin)

//属性观察器，这个比OC里面KVO,KVC模式用来观察属性变化简便的多,在非重写的算值属性可以直接使用setter来实现属性观察
class StepCounter {
    var totalSteps = 0 {
        willSet{
            print("total steps will be sitted.\(newValue)")
        }
        didSet{
            print("added \(totalSteps - oldValue) steps")
        }
    }
}

var run = StepCounter()
run.totalSteps = 34
run.totalSteps = 66
run.totalSteps = 89
run.totalSteps = 89

//全局变量，局部变量都可以使用属性观察器和计算储值，全局变量就是一切定义在函数、闭包、方法、任意类型外面的变量，局部变量就是定义在函数、闭包、方法里面的变量。全局变量和常量都是延迟计算的，所以不需要加上lazy关键字，局部变量和常量不会延迟计算
var name: String = "linlin" {
    willSet{
        print("\(newValue)")
    }
}
name = "xiaoxiao"

//类型属性，有点类似与OC里面单例与类方法的结合。用于数据共享，直接用类名来调用属性值，而不是使用实例，定义只需要在属性前面加上static关键字
class SomeClass{
    static var someProperty = "some value"
}
var some = SomeClass.someProperty
print(some)
SomeClass.someProperty = "hello"
var any = SomeClass.someProperty
print(any)







