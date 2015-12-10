//: Playground - noun: a place where people can play

import UIKit

/**
*  访问控制，private(源文件任何地方都可以引用)、public(任何地方都可以引用)、internal(同一模块内任何地方都可以引用)。模块，framework或application都是模块
　　访问级别的使用原则：１.一个public访问级别的变量，不能将它的类型的级别定义为private或internal。２.函数的级别不能高于它的参数和返回值的级别。３.子类的访问级别不能高于父类的访问级别
默认的访问级别是internal,不需要显示的声明，如果要开发一个framework提供给其他人使用那么就要使用public，来向外提供接口

与其他语言不同的是private只是限制在同一源文件，即使不是同一个类，只要在同一源文件内，就可以引用，通过private(set)或internal(set)来设置属性的读写权限，可以通过public private(set)结合来设置属性的读写权限
*/



