//: Playground - noun: a place where people can play

import UIKit

/**
*  for...in,如果不需要直到每一项遍历的值，可以使用“_”忽略
*/
let base = 3
let power = 10
var anwser = 1
for _ in 1...power
{
    anwser *= base
}
print(anwser)

for var i = 0;i<10;i++
{
    print(i)
}
//遍历字典
var numberOfLegs = ["human":2, "dog":4, "spider":8]
for (animalName, legs) in numberOfLegs
{
    print("A \(animalName) has \(legs) legs.")
}

///🐍和梯子的游戏,while循环,repeat...while相当于C语言的do...while
var successNumber = 0
let ladders = [3:11, 10:12, 9:18, 6:17]
let snakes = [14:4, 19:8, 22:20, 24:16]
while successNumber < 25
{
    var throwNumer = random()%6+1
    successNumber += throwNumer
    print(successNumber)
    if let up = ladders[successNumber]
    {
        successNumber = up
        print(successNumber)
    }
    if let tail = snakes[successNumber]
    {
        successNumber = tail
        print(successNumber)
    }
}
repeat
{
    
}while successNumber < 25

///switch语句，不同于C,OC的是，他可以匹配区间，以及不需要在每个case后面加上break,每个switch语句都必须包含所有case的处理语句,一个case可以包括多个模式
let someCharacter:Character = "f"
switch someCharacter
{
    case "a", "o", "u", "e", "i":
        print("\(someCharacter) is a vowel")
    default:
        print("\(someCharacter) is a consonant")
}
var approximateCount = 8
var naturalCount = ""
switch approximateCount
{
case 0:
    naturalCount = "no"
case 1...8:
    naturalCount = "few"
case 9...11:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print(naturalCount)
//元组用来同时匹配多个变量
var somePoint = (3, 3)
switch somePoint
{
case (0, 0):
    print("point \(somePoint) is　at the origin")
case (0, let y)://值绑定
    print("point \(somePoint) is　on the y-axis")
case (_, 0):
    print("point \(somePoint) is　on the x-axis")
case (-2...2, -2...2):
    print("point \(somePoint) is　inside the rectangel(2*2)")
case (let x, let y) where x == y://where增加额外的筛选条件
    print("x equal y")
default:
    print("point \(somePoint) is　outside the rectangel(2*2)")
}

///控制转移语句，continue,break,fallthrough,return,throw。fallthrough贯穿语句在switch中执行完匹配的case语句后会接着执行下一个case语句，与C语言中标准switch语句case后不加break默认效果一样
let integerToDescribe = 9
var description = "the integer \(integerToDescribe) is "
switch integerToDescribe
{
case 1,3,5,7,9:
    description += "odd number, and also "
    fallthrough
default:
    description += "an integer."
}
print(description)

//标签用于表示一段控制流代码段，在控制转移语句后面加上标签可以转移指定代码段，标签的格式是lableName:+while(等语句)
var i = 0
gameLoop: while true
{
    switch i
    {
    case 0...100:
        print("less than 100")
    default:
        print("more than 100")
        break gameLoop
    }
    
    i++
}

//guard语句,保证条件为真才会执行guard后面的语句，与if不同是guard语句必须有else分支，可以实现跟if一样的效果，是程序连贯执行，而不需要包括在else块中
var person = ["name":"张三", "location":"北京"]
func greet(person:[String: String])
{
    guard let name = person["name"] else
    {
        print("no name")
        return
    }
    
    print("\(name)")
    guard let location = person["location"] else
    {
        print("great")
        return
    }
    print("\(location)")
}
greet(person)
person = [:]
greet(person)

//检测ＡＰＩ
if #available(iOS 9, OSX 10.10.5, *)
{
    print("ios 9")
}