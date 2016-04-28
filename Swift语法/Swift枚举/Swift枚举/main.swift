//
//  main.swift
//  Swift枚举
//
//  Created by zgq on 16/4/26.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation

/*
 枚举简单的来说也是一种数据类型，只不过这中数据类型包含自定义的特定数据，它是一组有共同特性的数据的集合
 它声明在类中，可以通过实例化类来访问它的值
 枚举可以定义构造函数来提供一个初始化成员；可以在原始实现的基础上扩展它们的功能
 可以遵守协议来提供标准的功能
 
 */
/*
 Swift使用enum关键字来创建枚举并且把他们的整个定义放在一对大括号内
 
 */

enum DaysofaWeek {
    case Sunday
    case Monday
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case Saturday
}


var weekDay = DaysofaWeek.THURSDAY

weekDay = .THURSDAY
switch weekDay
{
case .Sunday:
    print("星期天")
case .Monday:
    print("星期一")
case .TUESDAY:
    print("星期二")
case .WEDNESDAY:
    print("星期三")
case .THURSDAY:
    print("星期四")
case .FRIDAY:
    print("星期五")
case .Saturday:
    print("星期六")
}
/*
 枚举中定义的值是这个枚举的成员值。case关键字便是一行新的成员值将被定义
 C和OC不同，Swift中的枚举成员在创建时不会被赋予一个默认的整形值，相反
 这些枚举成员本身就有完备的值，这些值是已经明确定义好的DaysofaWeek类型
 
 
 
 枚举可以分为相关值和原始值
 
 相关值：
 以下实例中定义一个名为Student的枚举类型，它可以是Name的一个相关值(Int,Int,Int)，或者是Mark的一个字符串类型相关值
 
 */

enum Student{
    case Name(String)
    case Mark(Int,Int,Int)
}
var studDetails = Student.Name("Runoob")
var studMarks = Student.Mark(98,97,95)
switch studMarks {
case .Name(let studName):
    print("学生的名字是: \(studName)。")
case .Mark(let Mark1, let Mark2, let Mark3):
    print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
}



/*
 原始值：
 原始值是字符串，字符或者任何整形值或浮点值。每个原始值在它的枚举声明中必须是唯一的。
 在原始值为整数的枚举时，不需要显示的为每一个成员赋值，Swift会自动为你赋值
 例如，当使用整数作为原始值时，隐是赋值的值依次递增，如果第一个值没有被赋初值，将会被自动置为0
 
  */

enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}

let yearMonth = Month.May.rawValue
print("数字月份为: \(yearMonth)。")










        