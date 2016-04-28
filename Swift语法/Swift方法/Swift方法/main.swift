//
//  main.swift
//  Swift方法
//
//  Created by zgq on 16/4/22.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation
//在OC中类是唯一能够定义方法的类型
//在Swift中，你不仅能选择是否要定义一个类/结构体/枚举，还能灵活的在你创建的类型上定义方法

//在Swift中实例方法是属于某个特定类，结构体或者枚举类型实例的方法
//实例方法提供以下方法：
//可以访问和修改实例属性
//提供与实例目的相关的功能


//1.实例方法要写在它所属的类型的前后大括号内
//2.实例方法能够隐身访问它所属类型的所有的其他实例方法和属性
//3.实例方法只能被它所属的类的某个特定实例调用
//4.实例方法不能脱离于现存的实例而被调用


class Count {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount:Int){
        count+=amount;
    }
    
    func reset()  {
        count=0
    }
    
}
 let counter = Count()
  counter.increment()

counter.incrementBy(5)
print(counter.count)
counter.reset()
print(counter.count)



//方法的局部参数名称和外部参数名称

//Swift函数可以同时有一个局部名称（在函数体内部使用）和一个外部名称（在调用函数时使用）
//Swift中的方法和OC方法极其相似，SWift中方法名称通常用一个介词指向方法的第一个参数
//Swift默认仅给方法的第一个参数名称一个局部参数名称；默认同时给第二个和后续的参数名称为全局参数名称
class division {
    
    var count1 :Int = 0
    func increment1(no1:Int,no2:Int) {
        count1=no1/no2;
        print(count1)
    }
    
}

let counter1=division()

counter1.increment1(1800, no2: 3)



//是否提供外部名称设置
//我们强制在第一个参数添加外部名称把这个局部名称当做外部名称使用(Swift2.0前使用# 号)
//相反，我们也可以使用下划线(_)设置第二个以及后续的参数不提供一个外部名称

class multiplication {
    var count:Int = 0
    func increment2(first no1:Int,no2:Int) {
        count=no1*no2;
        print(count)
    }
    
}

let counter2 = multiplication()
counter2.increment2(first: 800, no2: 3)




//self属性
//类型的每一个实例都有一个隐含属性叫self,self完全等同于该实例本身
//你可以在一个实例的实例方法中使用这个隐含的self属性来引用当前实例


class calculation {
    var a:Int = 0
    var b:Int = 0
    var res:Int = 0
    
    init(a:Int,b:Int) {
        self.a = a
        self.b=b
        res=a+b
        print("self内：\(res)")
        
    }
    
    func tot(c:Int) -> Int {
        return res-c
    }
    
    func result() {
        print("结果为: \(tot(20))")
        print("结果为:\(tot(50))")
        
    }
 }

let pri = calculation(a:600,b:300)
let sum=calculation(a:1200,b:300)
pri.result()
sum.result()


//在实例方法中修改值类型
//Swift语言中结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改
//但是，如果你确实需要在某个具体的方法中修改结构体或者枚举的属性，你可以选择变异(mutating)
//这个方法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中
//方法还可以给它隐含的self属性值一个全新的实例，这个新实例在方法结束后将替换原来的实例


struct area {
    var length = 1
    var breadth = 1
    
    func area() -> Int {
        return length*breadth
    }
    
    mutating func scaleBy(res:Int) {
        length *= res
        breadth *= res
        print(length)
        print(breadth)
    }
}

var val = area(length:3,breadth:5)
val.scaleBy(3)
val.scaleBy(30)
val.scaleBy(300)




//在可变方法中给self赋值
//可变方法能够赋给隐含属性self一个全新的实例


struct area1 {
    var length = 1
    var breadth = 1
    
    func area1() -> Int {
        return length*breadth
    }
    
    mutating func scaleBy(res:Int) {
        self.length *= res
        self.breadth *= res
        print(length)
        print(breadth)
        
        
    }
    
}


var val1 = area1(length: 3,breadth: 5)
val.scaleBy(13)




//类型方法
//实例方法是被类型的某个实例调用的方法，你也可以定义类型本身调用的方法，这种方法就叫做类型方法】
//声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static.类可能会用关键字class来允许子类重写父类的方法
//类型方法和实例方法一样用点号(.)语法调用


class Math {
    class func  abs(number:Int)->Int {
        if number<0 {
            return (-number)
        }else
        {
            return number
        }
    }
}

struct absno {
    static func abs(number:Int)->Int
    {
        
        if number<0 {
            return (-number)
        }else{
            
            return number
            
        }
      }
}



let no = Math.abs(-35)
let num = absno.abs(-5)
print(no)
print(num)









