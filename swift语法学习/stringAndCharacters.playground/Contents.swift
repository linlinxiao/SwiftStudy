//: Playground - noun: a place where people can play

import UIKit

//声明一个空字符串
var string1 = String()
var string2 = ""

//不同于OC的是，用var来声明一个可变字符串，let声明一个不可变字符串（都是String类型），而OC中需要声明两种类型（NSMutableString可变，NSString不可变）
var str1 = "I am a "
str1 += "programmer."
let str2 = "I am a programmer."

for character in str1.characters
{
    print(character)
}

//Character,表示单个字符
var character:Character = "."
var characters:[Character] = ["i", "a"]
print("\(characters)")
let c = String(characters)

//Unicode标量，写成\u{n}，其中n为任意１到８位１６进制数且可用的Unicode编码，每一个Character字符都是一个可扩展的字形群
var dollarSign:Character = "\u{24}"
print(dollarSign)

//使用可扩展的字符群集来连接或者改变字符串的时候，不一定会增加字符串的字符数
var word = "cafe"
print("the word \(word) has \(word.characters.count) character.")
word += "\u{301}"
print("the word \(word) has \(word.characters.count) character.")

//字符串索引
var gun = "gun"
print(gun[gun.startIndex])
print(gun[gun.startIndex.successor()])
print(gun[gun.endIndex.predecessor()])
for index in gun.characters.indices
{
    print(index)
    print(gun[index])
}

//插入删除
var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)
welcome.insertContentsOf(" world".characters, at: welcome.endIndex.predecessor())
welcome.removeAtIndex(welcome.endIndex.predecessor())
print(welcome)
let range = welcome.startIndex...welcome.startIndex.advancedBy(6)
welcome.removeRange(range)

//swift中利用"=="来判断两个字符串是否具有相同的内容
var number = 1
var youAndI = "you and i"
var we = "you and i"
if youAndI == we
{
    print("These two strings are considered equal!")
}

for codeUnit in welcome.utf8
{
    print(codeUnit)
}
for codeUnit in welcome.utf16
{
    print(codeUnit)
}
for codeUnit in welcome.unicodeScalars
{
    print("\(codeUnit.value)")
}

