//: Playground - noun: a place where people can play

import UIKit

/**
*  基本运算，跟OC和C不同的是，“＝”赋值运算不返回任何值，所以不能写在if条件，以及“%”取余运算可以对浮点数取余
*/
var value1 = 2.5
var value2 = 9
let result = Double(value2) % value1

/**
*  空合运算，a??b相当于a != nil ? a! : b,下面代码表示如果用户自定义颜色为空，那么就使用默认颜色
这种运算必须满足两个条件，１.a,b必须是同一类型;２.a必须是可选类型
*/
var userDefinedColor : String? = "green"
let defaultColor = "red"
let finalColor = userDefinedColor ?? defaultColor

//区间运算符，a...b闭区间(包括a,b),a..<b半闭半开区间(包括a,不包括b)
for i in 1...5
{
    print("\(i*i)")
}

for i in 0...5//使用遍历数组
{
    print("\(i)")
}