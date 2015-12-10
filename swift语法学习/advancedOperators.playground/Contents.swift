//: Playground - noun: a place where people can play

import Cocoa

/**
*  高级运算符
*/
//位运算符，"~"按位取反,"&"按位与,"｜"按位或,"^"按位异或,"<<"按位左移,">>"按位右移
let initiaBits : UInt8 = 0b00001111
let other : UInt8 = 0b11110000
let invertedBits : UInt8 = ~initiaBits
print(invertedBits)
//溢出运算符，swift默认是不允许溢出的，当计算后的数值超过类型所表示的数值范围，会编译报错。当然也可以利用溢出运算符来进行溢出计算，溢出运算都是以"&"开头的。"&+""&-""&*"

/**
*  运算符重载，运算符分为前缀、中缀、后缀运算符。添加关键字"prefix"、"infix"和"postfix"关键字来声明是前缀、中缀或者后缀
*/
struct Verctor2D {
    var x = 0.0, y = 0.0
}

func +(left :Verctor2D, right:Verctor2D) -> Verctor2D{
    let x = left.x + right.x
    let y = left.y + right.y
    return Verctor2D(x: x, y: y)
}

prefix func -(verctor:Verctor2D) -> Verctor2D{
    return Verctor2D(x: -verctor.x, y: -verctor.y)
}



