//
//  main.swift
//  Swift扩展
//
//  Created by zgq on 16/4/25.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation

/*
 扩展就是向一个已有的类，结构体或枚举类型添加新功能
 扩展可以对一个类添加新的功能，但是不能重写已有的功能
 Swift中的扩展可以:
 1.添加计算型属性和计算行静态属性
 2.定义实例方法和类型方法
 3.提供新的构造器
 4.定义下标
 5.定义使用新的嵌套类型
 6.使一个已有类型符合某个协议
  */
//语法： 扩展声明使用关键字extension:
//一个扩展可以扩展一个已有类型，使其能够失陪一个或多个协议，语法格式如下






/*
 计算型属性：扩展可以向已有类型添加计算型属性和计算型类型属性
 实例：下面的例子向Int类型添加5个计算型属性并扩展其功能
  */

extension Int {
    var add:Int {
        return self + 100
    }
    
    var sub:Int {
        return self - 10
    }
    
    var mul:Int {
        return self * 10
    }
    var div :Int {
        return self / 5
    }
}

let addtion  = 3.add
print("加法运算后的值:\(addtion)")

let subtraction = 120.sub
print("减法运算后的值:\(subtraction)")

let multiplicaton = 39.mul
print("乘法运算后的值:\(multiplicaton)")

let division=55.div
print("除法运算后的值:\(division)")

let mix = 30.add + 34.sub
print("混合运算结果:\(mix)")






/*
 构造器：
 扩展可以向已有类型添加新的构造器。
 这可以让你扩展其它类型，将你自己的定制类型作为构造器参数，或者提供该类型的原始数据中没有包含的额外初始化选项
 扩展可以向类中添加新的便利构造器init()，但是它们不能向类中添加新的指定构造器或析构函数deinit。
 
 */
struct sum {
    var num1 = 100,num2=200
    
}

struct diff {
    var no1 = 200,no2 = 100
    
}

struct mult {
    var a  = sum()
    var b = diff()
    
    
}

let calc = mult()
print("mult 模块内\(calc.a.num1,calc.a.num2)")
print("mult 模块内\(calc.b.no1,calc.b.no2)")


let memcalc = mult(a:sum(num1:300,num2:500),b:diff(no1:300,no2: 100))
print("mult 模块内\(memcalc.a.num1,memcalc.a.num2)")
print("mult  模块内\(memcalc.b.no1,memcalc.b.no2)")


extension mult {
    init(x:sum,y:diff) {
        _ = x.num1 + x.num2
        _ = y.no1 + y.no2
    }
}


let a = sum(num1:100,num2: 200)
print("Sum 模块内:\(a.num1,a.num2)")

let b = diff(no1:200,no2: 200)
print("Diff 模块内:\(b.no1,b.no2)")




/*
 方法:
 扩展可以向已有类型添加新的方法和类型方法
 下面的例子可以向Int类型添加一个名为topics的新实例方法
 这个topics方法使用了一个() -> ()类型的单参数，表明函数没有参数而且没有返回值。
 定义该扩展之后，你就可以对任意整数调用topic方法，实现的功能则是多次执行某任务
 
 
 */

extension Int {
    func topics(summation:() -> ()) {
        for _ in 0..<self {
            summation()
        }
    }
}

4.topics({
    print("扩展模块内")
})

3.topics({
    print("内型转换模块内")
})



/*
 可变实例方法：
 通过扩展添加的实例方法也可以修改该实例本身。
 结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating，正如来自原始实现的修改方法一样
 实例：
 下面的例子向Swift的Double类型添加了一个新的名为square的修改方法，来实现一个原始值的平方计算
 
 
 */
extension Double  {
    mutating func  square() {
       let pi = 3.1415
        self = pi * self * self
        
        
    }
}

var Triall = 3.3
Triall.square()
print("圆的面积为: \(Triall)")


var Trial2=5.8
    Trial2.square()
print("圆的面积为:\(Trial2)")





/*
 实例：
 扩展可以向一个已有类型添加新下标
 以下例子向Swift内建类型Int添加了一个整形下标，该下标[n]返回十进制数字
 */


extension Int {
    subscript(var multtable: Int) -> Int {
        var no1 = 1
        while multtable > 0 {
            no1 *= 10
            multtable -= 1
        }
        return (self / no1) % 10
    }
}
print(12[0])
print(7869[1])
print(786534[2])








/*
 嵌套类型：
 扩展可以向已有的类，结构体和枚举添加新的嵌套类型
*/

extension Int {
    enum calc {
        case add
        case sub
        case mult
        case div
        case anything
        
    }
    var print: calc {
        switch self
        {
        case 0:
            return .add
        case 1:
            return .sub
        case 2:
            return .mult
        case 3:
            return .div
        default:
            return .anything
        }
    }
}

func result(numb: [Int]) {
    for i in numb {
        switch i.print {
        case .add:
            print(" 10 ")
        case .sub:
            print(" 20 ")
        case .mult:
            print(" 30 ")
        case .div:
            print(" 40 ")
        default:
            print(" 50 ")
            
        }
    }
}

result([0, 1, 2, 3, 4, 7])














        