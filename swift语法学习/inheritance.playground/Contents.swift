//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var currentSpeed : Double = 0
    func description() -> String
    {
        return "the vehicle has four wheels.And current speed is \(currentSpeed) kilometer per hour"
    }
    func makeNoise(){
    }
    
    //在方法，属性前面加上final关键字，可以防止父类的方法或属性被子类重写
    final func sayhello(){
        print("hello")
    }
}

//重写方法，重写属性，重写属性观察器，重写类方法，所有的重写都必须在定义前面加上override关键字
class Car: Vehicle {
    var brandName = ""
    
    //重写属性观察器
    override var currentSpeed : Double {
        willSet{
            print(newValue)
        }
        didSet{
            print(oldValue)
        }
    }
    //重写方法
    override func description() -> String {
        return "the car has four wheels.And current speed is \(currentSpeed) kilometer per hour.It`s brandName is \(brandName)."
    }
    
//    override func sayhello(){
//    }
}

var car1 = Car()
print(car1.description())
car1.currentSpeed = 3