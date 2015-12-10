//: Playground - noun: a place where people can play

import UIKit

/**
枚举类型跟其他类型命名规则一样的，它本身就是一个数据类型，具体的一个枚举类型的值，本身就是一个具体的值，不像C,OC中每个枚举值都有一个默认的整数类型的值,也可以用","在同一行定义多个枚举值
*/
enum CampassPoint
{
    case North,South
    case East
    case West
}

var directionPoint = CampassPoint.East
directionPoint = .North

switch directionPoint
{
case .North:
    print("to north \(directionPoint)")
case .South:
    print("to south")
case .East:
    print("to east")
case .West:
    print("to west")
}

//关联值，每个枚举成员都可以有不同类型的关联值
enum BarCode{
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productCode = BarCode.UPCA(888, 324, 1, 34)
//productCode = .QRCode("ABTSBHRBCH")

//如果关联值需要全部定义为var,let,可以简便写
switch productCode
{
case let .UPCA(firstNum, secondNum, thirdNum, fouthNum):
    print("the product barcode is \(firstNum).\(secondNum).\(thirdNum).\(fouthNum)")
case .QRCode(var codeString):
    print("the product barcode is \(codeString)")
}

//原始值，原始值不同于关联值，原始值是在定义枚举成员的时候就已经确定的，是不可变的，而关联值是可以改变的,各个枚举成员的原始值必须是同一类型的，如果枚举类型是
enum ASCLLControlCharacter : Character
{
    case Tab = "\t"
    case LineFeed = "\n"
}
//利用构造器创建出来的枚举实例的类型是可选的，因为根据你提供的初始值不一定能够在枚举成员的列表中找到对应的枚举成员
var controlCharacter = ASCLLControlCharacter.init(rawValue: "\\")
