//: Playground - noun: a place where people can play

import UIKit

/// 可空链式调用,"!"用于隐式解析，当你确定一定有值的时候使用，否则会变异出错
class Residence {
    var numberOfRooms: Int = 0
}

class Person {
    var name: String
    var residence : Residence?
    
    init(name:String){
        self.name = name
    }
}

var wangming:Person = Person(name: "wangming")
wangming.residence = Residence()
var numberOfRooms = wangming.residence!.numberOfRooms
print(wangming.residence?.numberOfRooms)



