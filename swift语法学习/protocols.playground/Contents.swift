//: Playground - noun: a place where people can play

import UIKit

/**
*  协议，协议的定义跟类类型的语法类似，协议除了可以定义方法，还可以定义属性，这样协议的遵循者就必须实现协议方法，必须提供协议属性。协议属性可以是只读的，也可以是可读可写的，并不需要表明是存储属性还是计算属性
*/
protocol FullNamed{
    var fullname:String{set get}//读写属性
    var othername:String{get}//只读属性
}

struct Person:FullNamed {
    var fullname:String
    var othername:String{
        set{
            print(newValue)
        }
        get{
            return fullname+"ll"
        }
    }
}

var person = Person(fullname: "xiaoxia")
print(person.othername)
person.othername = "hello"

/**
*  代理模式
*/
protocol ChildrenDelegate{
    var fullName:String{set get}
    func washClothes(number:Int)
    func feedBaby()
    init(fullName:String)
}

protocol NannyDelegate{
    
}

class Nanny: ChildrenDelegate {
    var fullName:String
    required init(fullName: String) {
        self.fullName = fullName
    }
    
    func washClothes(number: Int) {
        print("\(self.fullName) washed \(number) clothes.)")
    }
    
    func feedBaby() {
        print("the nanny whose name is \(self.fullName) is feeding the baby.")
    }
}

class Children {
    var delegate:ChildrenDelegate?
    func cry(){
        self.delegate?.feedBaby()
    }
}

extension Children:NannyDelegate
{}

var baby = Children()
baby.delegate = Nanny(fullName: "Lucy")
baby.cry()

/**
*  类专属协议，可以通过在协议名加上:class来表明该协议只能有类来遵循，class关键字必须排在继承的协议的最前
*/
protocol SomeProtocol:class, ChildrenDelegate{
}
//struct SomeStructuer:SomeProtocol {
//    
//}

/**
*  协议合成，有时候需要同时遵循多个协议，那么可以用protocol<,>的写法来表明遵循多个协议
*/
var delegate : protocol<ChildrenDelegate, NannyDelegate>

/**
*  对可选协议的规定，通过在变量或者方法前面加上optional关键字来声明方法或者变量是可选的，也就是可以选择遵循的。但是可选协议只在含有＠objc的协议中生效，而且也只能被继承自OC的类或者同样带有@objc关键字的类遵循
*/
@objc protocol CounterDataSource{
    optional func incrementForCount(count:Int)
}

class Count: CounterDataSource {
     @objc func incrementForCount(count: Int) {
        print("hello")
    }
}

var count = Count()
count.incrementForCount(1)


/**
*  扩展协议，其实就是增加方法实现，这样就不需要在所有遵循这里面都实现一遍,还可以通过扩展的方式来为协议提供默认的实现
*/
extension ChildrenDelegate{
    func coaxBaby(){
        print("hahaha")
    }
}
baby.delegate?.coaxBaby()

/**
*  为协议扩展添加限制
*/

extension CollectionType where Generator.Element :ChildrenDelegate{
}
