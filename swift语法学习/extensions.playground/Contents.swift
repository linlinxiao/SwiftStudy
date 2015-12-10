//: Playground - noun: a place where people can play

import UIKit

/**
*  扩展，在swift中你可以对任何类型进行扩展，使用extension关键字来声明一个扩展的开始，不同与OC的是扩展没有名字。你甚至可以对一个协议进行扩展。扩展向已有的类只能添加计算型属性，不能添加储值属性。只能添加方法，不能重写方法。可以添加便利构造器，但是不能添加指定构造器
*/
extension Double{
    var km:Double{
        return self * 1000.0
    }
    var cm:Double{
        return self/100.0
    }
    var mm:Double{
        return self/1000.0
    }
    var m:Double{
        return self
    }
    var dm:Double{
        return self/10.0
    }
}

var km = 100.km
print("100km = \(km)m")

extension Int{
    func repetitions(tast : ()->()){
        for _ in 0...self{
            tast()
        }
    }
    
    mutating func power(var ex:Int){
        while ex > 0{
            self *= self
            ex--
        }
    }
    
    enum Kind{
        case Zero,Negative,Positive
    }
    
    var kind : Kind {
        switch self{
        case 0:
            return Kind.Zero
        case let x where x > 0:
            return Kind.Positive
        default:
            return Kind.Negative
        }
    }
}

func printIntegerKind(numbers : [Int]){
    for number in numbers{
        switch number.kind{
        case .Negative:
            print("negative")
        case .Positive:
            print("positive")
        default:
            print("zero")
        }
    }
}

var value = 8
value.repetitions { () -> () in
    print("hello")
}
value.repetitions { () -> () in
    print("say")
}
value.power(2)
print(value)

printIntegerKind([22, 0, -9])

