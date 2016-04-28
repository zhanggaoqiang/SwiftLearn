//
//  main.swift
//  Swift属性
//
//  Created by zgq on 16/4/21.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation
import Cocoa
//一个存储属性就是存储在特定类或结构体实例里的一个常量或者变量
//可以在定义存储属性的时候指定值也可以在构造过程中设置或修改存储属性的值，甚至修改常量存储属性的值
struct Number {
    var digits:Int
    let pi  = 3.1415
}

var n = Number(digits:12345)
n.digits=67;
print("\(n.digits)")
print("\(n.pi)")

//延迟存储属性
//必须将延迟存储属性声明成变量（使用var变量），因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性
//延迟属性一般用于:1,延迟对象的创建2.当属性的值依赖于其他未知类

class sample {
    lazy var no=number()
    
    
    
    
}
class number {
    var name = "Runoon Swift教程"
    
    
}

var firstSample = sample()
print(firstSample.no.name)


//实例化变量
//OC为类实例存储值和引用提供两种方法。对于属性来说，也可以使用实例变量作为属性值的后端存储
// Swift语言中把这些理论统一用属性来实现。Swift中属性没有对应的实例变量，属性的后端存储也无法直接访问
// 这就避免了不同的场景下访问方式的困扰，同时也将属性的定义简化成一个语句
 //一个类型中属性的全部信息--包括命名，类型和内存管理特征----都在唯一一个地方定义
//计算变量
class sample1 {
    var no1 = 0.0,no2=0.0
    var length = 300.0,breadth=150.0
    
    var middle:(Double,Double){
        
        get{
            return (length/2,breadth/2)
        }
        set(axis){
            no1=axis.0-(length/2)
            no2=axis.1-(breadth/2)
        }
 
    }

}
var result = sample1()
print(result.middle)
result.middle=(0.0,10.0)
print(result.no1)
print(result.no2)


//只读计算属性 ：只有getter没有setter的计算属性就是只读计算属性
//只读计算属性总是返回一个值，可以通过.运算符访问，但不能设置新的值

class film {
    var head = ""
    var duration = 0.0
    var metaInfo:[String:String] {
        return[
        "head":self.head,
        "duration":"\(self.duration)"
        
        ]
        
    }
    
}
//必须用var关键字定义计算属性，包括只读计算属性，let关键字只用来声明常量属性，表示初始化后再也无法修改的值
var movie = film()
movie.head="Swift 属性"
movie.duration=3.09
print(movie.metaInfo["head"]!)
print(movie.metaInfo["duration"]!)






//属性观察器

//属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外。
//可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重载属性的方式为继承的属性添加属性观察器
//可以为属性添加如下的一个或全部观察器
//1.willSet在设置新的值之前调用
//2.didSet在新的值被设置之后立即调用
//3.willSet和didSet观察器在属性初始化过程中不会被调用
class  Samplepgm {
    var counter:Int=0{
        willSet(newTotal){
            print("计数器：\(newTotal)")
        }
        
        didSet{
            if counter>oldValue {
                print("新增数 \(counter - oldValue)")
            }
        }
    }
 
}


let NewCounter = Samplepgm()
NewCounter.counter=100
NewCounter.counter=800





//全局变量和局部变量

//计算属性和属性观察器所描述的模式也可以用于全局变量和局部变量
//类型属性：类型属性是作为类型定义的一部分写在类型最外层的花括号内，使用关键字static来定义值类型属性，关键字class来为类定义类型属性
//struct  Structname {
//    static  var storedTypeproperty=" "
//    static var  computedTypeProperty:Int {
//        
//    }
//    
//    
//}
//
//
//enum Enumname {
//    static var storedtypeproperty=" "
//    static var computedTypeProperty:Int {
//        
//    }
//}
//
//class classname {
//    class var computedTypeProperty:Int   {
//        
//    }
//}
//



