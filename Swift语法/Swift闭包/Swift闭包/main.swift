//
//  main.swift
//  Swift闭包
//
//  Created by zgq on 16/5/4.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation

/*
 闭包是自包含的功能代码块，可以在代码中使用或者用来作为参数传值
 Swift中的闭包与C和OC 的代码快以及其它语言的匿名函数比较类似
 全局函数和嵌套函数其实就是特殊的闭包
 闭包的形式：
 全局函数：有名字但不能捕获任何值
 嵌套函数：有名字也能捕获封闭函数内的值
 闭包表达式：无名闭包，使用轻量级语法，可以根据上下文环境捕获值

 
 Swift闭包有很多优化的地方：
 1.根据上下文推断参数和返回值类型
 2.从单行表达式闭包中隐士返回(也就是闭包体中只有一行代码，可以省略return)
 3.可以使用简化的参数名如$0,$1(从0开始，表示第i个参数)
 4.提供了尾随闭包语法
*/




//以下定义了一个接受参数并返回指定类型的闭包语法

let  studentname = { print("Swift闭包实例") }
studentname()

//以下闭包形式接受两个参数并返回布尔值

let divide = { (val1:Int,val2:Int)  -> Int in

return val1 / val2


}
let result = divide(200,20)
print(result)




/*
 闭包表达式：
 闭包表达式是一种利用简洁语法构建内联闭包的方式，闭包表达式提供了一些语法优化，使得撰写闭包简单明了
 sort函数：
 Swift标准库提供了sort函数，会根据你提供的用于排序的闭包函数将已知类型数组中的值进行排序。
 排序完成后，sort方法会返回一个与原数组大小相同，包含同类型元素已正确排序的数组，原数组不会被改变
 sort函数需要传入两个参数
 1.以知类型的数组
 2.闭包函数，该闭包函数需要传入与数组元素类型相同的两个值，并返回一个布尔值来表明当排序结束后传入的第一个
 参数
 
 
 
 */



let names = ["AT","AE","D","S","BE"]
func backwards(s1:String,s2:String) -> Bool {
    return s1 > s2
}


var reversed  = names.sort(backwards)
print(reversed)



//参数名称缩写：Swift自动为内敛函数提供了参数名称缩写功能，你可以通过$0,$1,$2来顺序调用闭包的参数
var reversed1 = names.sort({ $0 > $1 })

//￥1$2表示闭包中第一个和第二个String类型的参数，in关键字也同样可以被省略





/*
 运算符函数：
 实际上还有一种更简短的方式来撰写上面例子中闭包表达式
 Swift的String类型定义了关于大于号的字符串实现，其作为一个函数接受两个String类型的参数并返回bol值
 
 
 
 */


var reversed2 = names.sort(>)
print("reserved2is \(reversed2)")




/*
 尾随闭包：
 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
 
 
 
 */


var reserved3 = names.sort() {$0 > $1  }
print("3 是\(reserved3)")

//如果函数只需要闭包表达式一个参数，当你使用尾随闭包时，你审计可以把()省略掉








/*
 捕获值：
 闭包可以在其定义的上下文中捕获常量或者变量
 即使定义这些常量和变量的原阈已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值
 Swift最简单的闭包形式是嵌套函数，也就是定义在其它函数体内的函数
 嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量
 */


func make(formake amount :Int) -> () ->Int {
    var run = 0
    func  incre() -> Int {
        run += amount
        return run
        
    
    
    }
    return incre
    
}


let inctement = make(formake: 10)
print(inctement())
print(inctement())
print(inctement())



/*
 闭包是引用类型：
 上面例子中inctement是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量值
 这是因为函数和闭包都是引用类型
 无论你将函数/闭包赋值给一个敞亮害死变量，你实际上都是将常量或变量设置为对应函数的或闭包的引用
 这意味着如果你将闭包赋值给了两个不同的常量或者变量，两个值会指向同一个闭包：
 
 
 */



let alsoictement = inctement
print("这个是:\(alsoictement())")














