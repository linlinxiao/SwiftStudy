//: Playground - noun: a place where people can play

import UIKit

/**
*  多重返回值函数,可选元组值
*/
func minMax(array:[Int]) -> (min:Int, max:Int)?
{
    guard !array.isEmpty else
    {
        print("the array is empty")
        return nil
    }
    
    var minValue = array[0]
    var maxValue = array[0]
    for value in array
    {
        if minValue > value
        {
            minValue = value
        }
        if maxValue < value
        {
            maxValue = value
        }
    }
    
    return (minValue, maxValue)
}

var array = [1, 33, 78,12,65,11]
var minAndMax = minMax(array)
if let value = minAndMax
{
    print("the max value is \(value.max), and the min value is \(value.min)")
}
array = []
minAndMax = minMax(array)

//外部参数名和局部参数名，外部参数名是函数在调用时显示的参数名，而局部参数名则是函数内部实现是使用的参数名,指定外部参数名和内部参数名时使用空格分开（不指定的情况下，默认第一个参数的外部参数名省略，其后的所有参数的外部参数名就是局部参数名）,如果不想显示外部参数名可以使用"_"忽略,sayHello(to person:String,and another: String), sayHello(to person:String,_ another: String)
func sayHello(person:String,another: String)
{
    print("Hello \(person). And nice to meet you ,\(another).")
}
sayHello("Linda", another: "Lucy")

//默认参数,默认参数最好写在最后面，这样可以保证非默认参数在调用时的顺序不变
func printFavoriteColor(name:String, favoriteColor color:String = "red")
{
    print("\(name)`s favorite color is \(color)")
}
printFavoriteColor("David")
printFavoriteColor("Lily", favoriteColor: "blue")

//可变参数，swift实现带可变参数比OC要简洁的多，只需要在参数的声明后加上...,其实就相当于那个参数是数组,一个函数最多只能有一个可变参数，在带有默认参数的情况下，可变参数要写在最后面
func averageOfnumbers(numbers:Double...) -> Double
{
    var average = 0.0
    for number in numbers
    {
        average += number
    }
    
    return average / Double(numbers.count)
}
var average = averageOfnumbers(3.2, 54.0, 78.0)

//变量参数，函数参数默认是常量参数，变量参数的改变对函数体外是不可见的，变量参数的生命仅仅存在函数调用的生命周期中
func variableParameter(var string:String, isChange:Bool) -> String
{
    if isChange
    {
        string += " has changed."
    }
    
    return string
}
print(variableParameter("string", isChange: true))

//输入输出参数，输入输出参数可以在函数体中改变函数体外的参数的值，并且输出
func swapTwoInts(inout a:Int, inout _ b:Int)
{
    let temp:Int = b
    b = a
    a = temp
}
var a = 1
var b = 3
print("Now a = \(a), b = \(b)")
swapTwoInts(&a, &b)
print("After swap, a = \(a), b = \(b)")

//函数类型，(Int,Int)->Int这个表示两个Int类型的参数并返回一个Int类型的返回值的函数类型，函数类型由参数类型和返回类型两部分组成，可以像使用一般类型一样的使用
func addTowInts(a:Int, b:Int) -> Int
{
    return a+b
}
func multiplyTwoInts(a:Int, b:Int) -> Int
{
    return a*b
}
var mathFunction:(Int,Int)->Int = addTowInts
mathFunction(2,3)
mathFunction = multiplyTwoInts
mathFunction(2,3)
//当函数类型作为参数传递的时候，有点类似与OC里面block的使用
typealias MathFunctionType = (Int,Int)->Int
func printMathResult(mathFunction:MathFunctionType, a:Int, b:Int)
{
    print("After \(mathFunction), the result is \(mathFunction(a,b))")
}
printMathResult(addTowInts, a: 5, b: 6)
//作为返回类型
func forwardOrBackward(isBackward:Bool) -> (inout Int)->Int
{
    func forward(inout a:Int) -> Int
    {
        return ++a
    }
    func backward(inout a:Int) -> Int
    {
        return --a
    }
    
    return isBackward ? backward : forward
}
var value = -6
var function = forwardOrBackward(value > 0)
while value != 0
{
    print(value)
    function(&value)
}
