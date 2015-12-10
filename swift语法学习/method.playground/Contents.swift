//: Playground - noun: a place where people can play

import UIKit

 /// 方法，方法就是定义在任意类型内部的函数
//实例方法,在内部方法中使用类的实例属性的时候可以省略self来指代实例本身
//类方法，swift与OC定义类方法不同，swift的类方法在方法前面加上static关键词就可以
class Student {
    var name:String = ""
    var age:Int = 0
    
    func printStudent(){
        print("\(name) is \(age) years old.")
    }
    
    func otherMethod(){
        printStudent()
    }
    
    static func classMethod(value:Int){
        print("\(value)")
    }
}

var linda = Student()
linda.name = "Linda"
linda.age = 25
linda.printStudent()
linda.otherMethod()
Student.classMethod(13)

//结构体是不允许直接改变属性值的，如果想要强制改变其内部属性的值就一定要在方法前面加上mutating关键字
struct Point {
    var x = 0.0,y = 0.0
    mutating func movePoint(x:Double, y:Double){
        self.x = x
        self.y = y
    }
}
var point1 = Point(x: 3, y: 4)
point1.movePoint(7, y: 8)
print(point1)





