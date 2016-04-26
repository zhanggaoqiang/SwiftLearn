//
//  main.swift
//  Swift协议
//
//  Created by zgq on 16/4/26.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation
/*
 协议规定了用来实现某一特定功能所必须的方法和属性
 任意能够满足协议要求的类型被称为遵循这个协议
 类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能
 
 */

/*
对属性的规定：
 协议用于指定特定的实例属性或类属性，而不用指定是存储性属性或计算行属性，此外还必须指明是
 只读的还是可读可写的
 协议中通常用var来声明变量属性，在类型声明后加上[{set get}来表示属性是可读可写的，只读属性则用{get}来表示
 */

protocol classa {
    var marks:Int{get set}
    var result:Bool{get}
    func attendance() -> String
    func markssecured() -> String
 
}
protocol classb:classa {
    var present:Bool {get set}
    var subject:String {get set}
    var stname:String {get set}
    
}

class classc:classb {
    
    var marks: Int = 96
    let result  = true
    var present = false
    var subject = "Swift 协议"
    
    var stname = "protocols"
    
    func attendance() -> String {
        return "The \(stname) has secured 99% attendance"
    }
    func markssecured() -> String {
        return "\(stname) has scored \(marks)"
    }
    
}

let student = classc()
student.stname="Swift"
student.marks=98
student.markssecured()

print(student.marks)
print(student.result)
print(student.subject)
print(student.stname)
print(student.present)




/*
 对Mutating方法的规定
 有时候需要在方法中改变它的实例
 例如，值类型(结构体，枚举)的实例方法中，将mutating关键字作为函数的前缀，写在func之前表示可以在该方法中
 修改它所属的实例及其实例属性的值
 
  */



protocol daysofarweek {
    mutating func show()
}


enum days:daysofarweek {
    case sun,mon,tue,wed,thurs,fri,sat
    mutating func show() {
        switch self {
        case sun:
            self = sun
            print("Sunday")
            
        case mon:
            self = mon
            print("Monday")
            
        case tue:
            self = tue
            print("Tuesday")
            
        case wed :
            self = wed
            print("Wednesday")
        case thurs :
            self = thurs
            print("Thursday")
            
        case fri :
            self = fri
            print("Friday")
        case sat:
            self = sat
            print("Saturday")
            
        default:
            print("No Such Day")
        }
        
        
    }
}


var res = days.thurs
res.show()


/*
 对构造器的规定：
 协议可以要求它的遵循者实现指定的构造器
 你可以像书写普通的构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体
 
 */

protocol Someprotocol {
    init(someParameter:Int)
}



protocol tcpprotocol {
    init(aprot:Int)
}
/*
 协议构造器规定在类中的实现
 你可以在遵循该协议的类中实现构造器，并指定其为类的指定构造器或者便利构造器
 在这两种情况下必须给构造器实现标上"required"修饰符
 */

class SomeClass:Someprotocol {
    required init(someParameter:Int){
        
    }
}


class tcpClass: tcpprotocol {
    required init(aprot:Int){
        
    }
}
/*
 使用required修饰符可以保证:所有遵循该协议的子类，同样能为构造器提供一个显示的实现或继承实现
 如果一个子类重写了父类的指定构造器，并且该构造器遵循了某个协议的规定，那么该构造器的实现需要被同时标示required和override修饰符
 
 */


//
//class mainClass {
//    var no1:Int = 0//局部变量
//    init(no1:Int){
//        self.no1=no1;//初始化
//    }
//    
//}
//
//class subClass: mainClass, tcpprotocol {
//    var no2: Int
//    init(no1: Int, no2 : Int) {
//        self.no2 = no2
//        super.init(no1:no1)
//    }
//    // 因为遵循协议，需要加上"required"; 因为继承自父类，需要加上"override"
//    required override convenience init(no1: Int)  {
//        self.init(no1:no1, no2:0)
//    }
//}
//
//
//let res = mainClass(no1:20)
//let  show = subClass(no1:30,no2: 0)
//
//print("res is:\(res.no1)")
//print("res is:\(show.no1)")
//print('"res is"\(show.no2)")
//

/*
 尽管协议本身并不实现任何功能，但是协议可以当做类型来使用
 协议可以像其它普通类型一样来使用，使用场景：
 1，作为函数，方法或构造器中的参数类型或返回值类型
 2，作为常量，变量或属性的类型，
 3，作为数组，字典或其它容器中的元素类型
 */

protocol Generator {
    associatedtype members
    func next() -> members?
    
}

var items = [10,20,30].generate()
while let x = items.next() {
    print(x)
}


for lists in [1,2,3].map({i in i*5}) {
    print(lists)
}

print([100,200,300])
print([1,2,3].map({i in i * 10}))



/*
 在扩展中添加协议成员：
 我们可以通过扩展来扩冲已存在的类型(类，结构体，枚举)
 扩展可以为已存在的类型添加属性，方法，下标脚本，协议成员
 
 
 */


protocol  AgeClasificationProtocol {
    var age:Int {get}
    func agetype() -> String
    
}

class Person {
    let firstname:String
    let lastname:String
    var age:Int
    init(firstname:String,lastname:String) {
        self.firstname = firstname
        self.lastname = lastname
        self.age = 10
    }
    
}


extension Person :AgeClasificationProtocol {
    func fullname() -> String {
        var c:String
        c=firstname+" "+lastname
        return c
        
    }
    
    func agetype() -> String {
        switch age {
        case 0...2:
            return "Baby"
            
        case 2...12:
            
            return"Children"
        case 13...19:
            return "Teenager"
            
        case let x where x>65:
            return "Elderly"
            
        default:
            return  "Normal"
        }
    }
    
    
}



/*
 
 协议的继承：
 协议能够继承一个或者多个其它的协议，可以在继承的协议基础上增加新的内容要求
 协议的继承语法与类的继承相似，多个被继承的协议间用逗号隔开
 
 
 */


protocol Classa {
    var no1:Int{get set}
    func calc(sun:Int)
    
}

protocol Result {
    func print(target:Classa)
}


class Student2: Result {
    func print(target: Classa) {
        target.calc(1)
    }


}

class Student: Classa {
    var no1: Int = 10
    func calc(sum: Int) {
        no1 -= sum
        print("学生尝试 \(sum)次努力")
        if no1 <= 0 {
            print("学生缺席考试")
        }
        
        
    }
}


class Player {
    
    var stmark:Result!
    init(stmark:Result) {
        self.stmark = stmark
    }
    
    
    func print(target:Classa) {
        stmark.print(target)
    }
    
}



var marks = Player(stmark:Student2())
var marksex  = Student()

marks.print(marksex)

marks.print(marksex)
marks.print(marksex)

marks.print(marksex)
marks.print(marksex)
marks.print(marksex)




//类专属协议
/*
 
 你可以在协议的继承列表中，通过添加class关键字，限制协议只能适配到类类型
 该class关键字必须是第一个出现在协议的继承列表中，其后，才是其它继承协议。，格式如下：
 
 
 
 */

protocol TcpProtocol {
    init(no1:Int)
}


class MainClass {
    var no1 : Int
    init(no1:Int){
        self.no1 = no1;
        
    }
    
}

//
//class SubClass1: MainClass,TcpProtocol {
//    var no2:Int = 0
//    convenience init(no1:Int,no2:Int){
//       
//        self.no2 = no2
//        self.init(no1:no1)
//        
//    }
//    
//}
//
//

/*
 协议合成：
 
 Swift支持合成多个协议，这在我们需要同时遵循过个协议时非常有用
 
 
 
 */











/*
 检验协议的一致性
 你可以使用is和as操作符来检查是否遵循某一协议或强制转化为某一类型
 1.is操作符用来检查实例是否遵循了某个实例
 as?返回一个可选值，当实例遵循协议时，返回该协议类型。否则返回nil
 as用以强制向下转型，如果转型失败。会引起运行时错误
 
 
 */







