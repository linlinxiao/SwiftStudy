//: Playground - noun: a place where people can play

import UIKit

 /// 默认变量的类型总是跟离他最近的类型一样
var value1:Double , value2:Double , value3 : String
value1 = 23
value2 = value1
value3 = "string"

/**
*  输出函数，默认以\n结束输出,如果不想输出换行，可以给terminator传一个空字符
*/
print(value3)
print(value3,terminator:"")

let max = Int.max
let min = Int.min

 ///声明变量的时候编译器必须能够判断变量的类型
var temp1:Double

/**
*  数值型字面量，下面的字面量的整数值都是17，浮点数也有字面量
*  表示分别在字面量前面加上前缀：
　　　二进制：0b
     八进制：0o
　　　十六进制：0x
*/
let decimalIntger = 17//十进制
let binaryIntger = 0b10001//二进制
let octalIntger = 0o21//八进制
let hexadecimalIntger = 0x11//十六进制
let onemillio = 1_000_000//数值添加下划线增加可读性，但是不影响字面量

 /// 类型转换的实际是使用了目标类型的构造器
let integer8 : Int8 = 1
let integer16 : Int16 = 24
let sum = integer16 + Int16(integer8)

let doubleValue = 9.032
let intValue = 8
let sum1 = doubleValue + Double(intValue)

let trueBool = true
let falseBool = false

if trueBool {
    print("true")
}

if !falseBool
{
    print("false")
}

let dictionary = [404:"Not found"]
print(dictionary[404])
let http404error = (404, "Not found")
let (httpCode, httpMessage) = http404error
print(httpCode)
let (code,_) = http404error//使用下划线忽略某个值
print(code)

/// 可选值
let optionalValue:String? = "not null value"
let forcedValue = optionalValue!

var implictValue:String!
implictValue = "nil"
print(implictValue)
let someValue = implictValue

if optionalValue != nil
{
    print("not nil", terminator:"")
}

 /// assert函数，断言，只有保证条件为ｔｒｕｅ的时候，后面的代码才会继续运行，否则会编译不通过，适当的使用断言可以快速定位错误
let age = 3
assert(age>0, "")
