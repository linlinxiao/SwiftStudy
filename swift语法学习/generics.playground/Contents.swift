//: Playground - noun: a place where people can play

import UIKit

/**
*  泛型，在swift中可以说泛型无处不在，比如数组、字典，数组可以存储任意类型的值<T>(类型参数)只是告诉编译器T只是一个占位符，从而编译器不会去检查实际类型，而后面参数后的T，是表示这两个参数的类型必须是相同的。T可以用任意字符串(除了switf中关键字)代替
//<T>这是类型参数的定义方法，他紧跟方法名的后面，或者类型名的后面，多个类型参数可以放在尖括号里面，使用“,”分隔开。类型参数的命名使用开头大写的驼峰式命名
*/
//泛型函数
func swipTwoValus<T>(inout a:T, inout _ b:T){
    let temp = a
    a = b
    b = temp
}

var a = 10
var b = 20
swipTwoValus(&a, &b)
print(a)

/**
*  自定泛型集类型，栈
*/
struct Stack<Element> {
    private var items : [Element] = [Element]()
    var top:Element?{
        return items.count>0 ? items[items.endIndex-1]:nil
    }
    var bottom:Element{
        return items[items.startIndex]
    }
    mutating func pop(){
        assert(items.count>0, "no item")
        items.removeLast()
    }
    mutating func push(item:Element){
        items.append(item)
    }
    
//    init(bottom:Element){
//        items = [Element]()
//        self.push(bottom)
//    }
}

var stack = Stack<String>()
stack.push("age")
stack.push("hello")
stack.pop()
print(stack.top!)
print(stack.bottom)

/**
*  类型约束，类型约束的语法，func somefunction<T:SomeClass, U:SomeProtocol>(t:T, u:U){}
*/



