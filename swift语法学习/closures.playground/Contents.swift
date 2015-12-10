//: Playground - noun: a place where people can play

import UIKit
/**
*  闭包，全局函数和嵌套函数都是特殊的闭包，sort(_:)是系统提供的排序方法，可以按照用途进行排序
*/
func backward(a:String, b:String) -> Bool
{
    return a > b
}

let names = ["Nancy", "Lucy", "David", "Smith"]
print(names.sort(backward))
//闭包的完整写法,{(parameter1,parameter2) -> returnType in statement}
names.sort({(s1:String, s2:String) -> Bool in return s1 > s2})
//闭包简略写法，一般利用闭包作为参数进行传递，闭包的参数类型以及返回类型都可以推断出来，所以都可以省略不谢（->也可以不写），如果只包含单一表达式，那么（return也可以省略不写）
names.sort({(s1, s2) in return s1 > s2})
names.sort({(s1, s2) in s1 > s2})
names.sort({s1, s2 in s1 > s2})
//参数名称缩写，swift提供了参数的缩写方式，$0,$1,$2...来表示对应的参数顺序,在使用参数名称缩写的时候可以省略参数的声明
names.sort({$0 > $1})
names.sort(>)//运算符函数

//尾随闭包,当尾随闭包函数只有一个闭包参数时()可以省略，尾随闭包对于闭包体比较大而清晰代码结构非常有用
names.sort(){$0 > $1}
names.sort{$0 > $1}

//闭包函数定义
func closureTest(name:String ,closure:(inout Int,inout Int) -> Void) ->String {
    var a = 1
    var b = 2
    closure(&a,&b)
    return "a = \(a), b = \(b)"
}

closureTest("") { (a, b) -> Void in
    a = 4
    b = 3
}

//map函数
let digitalNames = [1:"One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine", 0:"Zero"]
let numbers = [145, 23, 879, 62]
let digitals = numbers.map { (var number) -> String in
    var digital = ""
    while number > 0
    {
        digital = digitalNames[number%10]! + digital
        number = number/10
    }
    
    return digital
}
print(digitals)

//非逃逸闭包(@noescape)，自动闭包(@autoclosure暗示了非逃逸特性,如果要可逃逸得用@autoclosure(escaping)),自动闭包不接受任何参数，当它被调用的时候会返回被包装在其中的表达式的值，使用自动闭包的时候可以省略{}
func serveCostomer(@autoclosure closure:()->String)
{
    print(closure())
}

var array = ["name","age","sex","card"]
serveCostomer(array.removeAtIndex(3))

