//: Playground - noun: a place where people can play

import UIKit

/// "class"和"static"都可以用来声明一个类属性和方法。不同的是利用"class"关键字修饰的类属性或方法，是可以有子类重写的。而用"static"关键字修饰的，就相当于加了final关键字，子类不能重写相关的属性。因为储值属性是不能被子类重写的，故也不能用"class"关键字修饰。
class SomeClass {
    static var someValue : String = ""
    class var someValue1 : Int{
        return 199
    }
    
    class func someMethod(){
        print("some")
    }
}

class SomeClassSubClass: SomeClass {
//    override static var someValue : String = "hello"
    override class var someValue1:Int{
        return 22
    }
    
    override class func someMethod(){
        
    }
}

print(SomeClass.someValue1)
print(SomeClassSubClass.someValue1)



