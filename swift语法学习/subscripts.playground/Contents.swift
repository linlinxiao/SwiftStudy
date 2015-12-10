//: Playground - noun: a place where people can play

import UIKit

/**
*  下标脚本，快捷去除元素的方法，下标脚本的语法是实例方法语法与计算属性语法相结合，用关键字subscript来定义一个类型的下标取值,用到下标的如Array[index],Dictionary[key],与计算属性一样，分为读写、只读下标，实现语法跟计算属性类似
*/
struct TimesTable {
    let multiplier : Int
    subscript(index:Int) ->Int
        {
        return self.multiplier * index
    }
    
//    init(multiplier:Int)
//    {
//        self.multiplier = multiplier
//    }
}

var timesTable = TimesTable(multiplier: 4)
print(timesTable[1])
print(timesTable[2])
print(timesTable[3])

//下标参数也可以是多个，但是不能使用默认参数和输入输出参数
struct Matrix {
    let rows, columns:Int
    var grid: [Double]
    
    init(rows:Int, columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func insideGrid(row:Int, column:Int) -> Bool
    {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row:Int, column:Int) -> Double
        {
        get{
            assert(insideGrid(row, column: column), "out of range")
            return grid[columns * row + column]
        }
        set{
            assert(insideGrid(row, column: column), "out of range")
            grid[columns * row + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 5, columns: 6)
print(matrix[2,3])
matrix[3,4] = 6
print(matrix[3,4])
print(matrix)






