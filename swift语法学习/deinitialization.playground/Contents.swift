//: Playground - noun: a place where people can play

import UIKit

/**
*  析构器，析构器只适用于类类型，析构器就相当于OC里面的dealloc方法，在对象被释放的时候调用，自动调用
*/
class Bank {
    static var totalCoins = 10_000
    static func vendCoins(var numberOfVendCoins:Int) -> Int{
        numberOfVendCoins = min(numberOfVendCoins, totalCoins)
        totalCoins -= numberOfVendCoins
        return numberOfVendCoins
    }
    static func recieveCoins(coins:Int){
        totalCoins += coins
    }
}
class Player {
    var purchaseCoins : Int
    init(coins:Int){
        self.purchaseCoins = Bank.vendCoins(coins)
    }
    
    func winCoins(coins:Int){
        purchaseCoins += Bank.vendCoins(coins)
    }
    
    deinit{
        Bank.recieveCoins(purchaseCoins)
    }
}

var player1 : Player? = Player(coins: 200)
print(Bank.totalCoins)
player1!.winCoins(400)
print(Bank.totalCoins)
player1 = nil
print(Bank.totalCoins)
