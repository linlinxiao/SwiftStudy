//: Playground - noun: a place where people can play

import Cocoa

/**
*  错误处理，可以使用遵循ErrorType协议的枚举来列举错误，使用throws关键字来声明错误抛出函数，使用try(传递错误)来调用错误抛出函数。使用do{}catch{}来捕获错误，并处理错误。try?(有错误返回nil)和try!(有错误编译出错)定义简洁错误处理代码。使用defer来进行退出当前代码段的清洁工作，比如关闭文件，或者释放资源。defer语句的执行顺序是相反的，也就是第一个defer语句在第二个defer语句执行完毕才会执行
*/
enum VendingMachineError:ErrorType{
    case InvalidSelection
    case OutOfStock
    case InsufficientFunds(coins : Int)
}

struct Goods {
    var name : String
    var count : Int
    var price : Int
}

class VendingMachine {
    var goods = [Goods(name: "Bread", count: 22, price:12), Goods(name: "Soda", count: 5, price:2), Goods(name: "Milk", count: 10, price:6)]
    var coinsDeposited = 0
    func depenseSnack(snack:String, returnChange:Int){
        print("depense \(snack), return change \(returnChange) coins. \((self[snack]?.count)!) \(snack) left.")
    }
    func vendingGoods(snackName:String, count:Int, coins:Int) throws{
        defer{
            print("close")
        }
        guard let item = self[snackName] else{
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count >= count else{
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price * count <= coins else{
            throw VendingMachineError.InsufficientFunds(coins: item.price*count - coins)
        }
        
        let goodsCount = item.count - count
        self[snackName] = Goods(name: snackName, count: goodsCount, price: item.price)
        coinsDeposited += coins
        depenseSnack(snackName, returnChange:coins - item.price*count)
    }
    
    subscript(snackName:String) -> Goods?{
        get{
            for item in goods{
                guard item.name == snackName else{
                    continue
                }
                return item
            }
            
            return nil

        }
        
        set{
            for (index, item) in goods.enumerate(){
                guard item.name == snackName else{
                    continue
                }
                goods[index] = newValue!
            }
        }
    }
}

var vendingMachine = VendingMachine()
try vendingMachine.vendingGoods("Bread", count: 1, coins: 20)
do{
    try vendingMachine.vendingGoods("apple", count: 1, coins: 2)
    try vendingMachine.vendingGoods("Milk", count: 5, coins: 5)
}
catch VendingMachineError.InvalidSelection{
    print("InvalidSelection")
}
catch VendingMachineError.OutOfStock{
    print("OutOfStock")
}
catch VendingMachineError.InsufficientFunds{
    print("InsufficientFunds")
}



