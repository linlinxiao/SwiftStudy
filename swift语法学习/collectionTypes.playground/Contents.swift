//: Playground - noun: a place where people can play

import UIKit

//数组
var array1:[String] = [ "s"]
array1.append("e")
print(array1)
array1 = []
array1 = Array(count: 12, repeatedValue: "1")
array1.removeFirst()
print(array1)
for index in 1...3
{
    array1[index] = "2"
}
print(array1)
for (index, value) in array1.enumerate()
{
    print("\(index) + \(value)")
}
var arr = [1, 2, 3]
var arr1 = [Int]()
arr1 += arr
var arr2 = arr + arr1

//集合
var letters = Set<Character>()
letters.insert("s")
letters = []
var names:Set<String> = ["zhangsan", "lisi", "wangwu"]
var ages:Set = [1,2,3]
var set1:Set = [2,3,5,6]
ages.union(set1)//并集
ages.intersect(set1)//交集

//字典
var numberOfInteger = [Int:String]()
numberOfInteger[16] = "sixteen"
print(numberOfInteger)
var integerOfNumber = Dictionary<String, Int>()
integerOfNumber["sixteen"] = 16
print(integerOfNumber)
var dic1:Dictionary = ["five":5, 6:"six"]
print(dic1)
dic1.updateValue(2, forKey: "two")
print(dic1)
dic1.removeValueForKey("two")
print(dic1)
var value1 = dic1[2] ?? 3
print(value1)
if var obj = dic1[6]
{
    print(obj)
}
