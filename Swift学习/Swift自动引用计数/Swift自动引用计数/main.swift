//
//  main.swift
//  Swift自动引用计数
//
//  Created by zgq on 16/4/23.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation

//Swift使用自动引用计数(ARC)这一机制来跟踪和管理应用程序的内存
//通常情况下我们不需要去手动释放内存，因为ARC会在类的实例不再被使用时，自动释放其占用的内存
//但有些时候我们还是需要在代码中实现内存管理
//ARC功能如下：
/*
 1.当每次使用init()方法创建一个类的新的实例的时候，ARC会分配一大块内存用来储存实例的信息
 2.内存中会包含实例的类型信息，以及这个实例所有相关属性的值
 3.当类实例不再被使用时，ARC释放实例所占用的内存，并让释放的内存挪作他用
 4.为了确保使用中的实例不会被销毁，ARC会跟踪和计算每一个实例正在被多少属性，常量和变量所引用
 5.实例赋值给属性，常量或变量，它们都会创建此实例的强引用，只要强引用还在，实例是不允许被销毁的
 
  */

class Person {
    var name:String = ""
    
    init(name:String){
        self.name = name
        print("\(name) 开始初始化")
    }
    deinit{
        print("\(name)被析构")
    }
    
    
}
//值会被自动初始化为nil,目前还不会引用到Person类的实例
var reference1:Person?
var reference2 :Person?
var reference3:Person?
//创建Person类的实例
reference1 = Person(name:"Runoob")
//赋值给其它两个变量，该实例又会多出两个强引用
reference2=reference1
reference3=reference1

reference1 = nil//断开第一个强引用
reference2 = nil//断开第二个强引用
reference3 = nil//断开第三个强引用，并且调用析构函数







//类实例之间的循环强引用
/* 
 上面的例子中ARC会跟踪你所新创建的Person实例的引用数量，并且会在Person实例不再被需要时销毁它
 然而，我们可能会写出这样的代码，一个类永远不会有0个强引用，这种情况发生在两个类实例互相保持对方的强引用，并让对方不被
 销毁，这就是所谓的循环强引用
 
 */


class People {
    var name:String = ""
    init(name:String){
        self.name = name
    }
    var apartment:Apartment?
    deinit {
        print("\(name) 被析构")
    }
    
    
}

class Apartment {
    var number:Int = 0
    init(number:Int)
    {
        self.number = number
    }
    
    var tenant :People?
    
    
    
    deinit
    {
        print("Apartment\(number) 被析构")
    }
    
}

//两个变量都被初始化为nil
var runoob :People?
var number73 :Apartment?
//赋值
runoob = People(name:"Runoob")

number73=Apartment(number:73)

//感叹号是用来展开和访问可选变量runoob和number73中的实例
//循环强引用被创建
runoob!.apartment=number73
number73!.tenant=runoob

//断开runoob和number73变量所持有的强引用时，引用计数并不会降为0，实例也不会被ARC销毁
//注意，当你把这两个变量设为nil时候，没有人任何一个析构函数被调用
//强引用循环阻止了person和Apartment类实例的销毁并且在你的应用程序中造成了内存泄露

runoob = nil
number73 = nil

//解决实例之间的循环强引用

/*
 1.若引用
 2.无主引用
 
 若引用和无主引用允许循环引用中的一个实例引用另外一个实例而不保持强引用。这样实例能够互相引用不产生循环强引用。
 对于声明周期中会变为nil的实例使用弱引用。相反的，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用
 
 
*/

//弱引用实例


class Module {
    var name:String = ""
    init(name:String){
        self.name = name
    }
    var sub:SubModule?
    
    
    
    deinit {
        print("\(name)主模块")
    }
    
    
}


class SubModule {
    var number:Int = 0
    init(number:Int){
        self.number = number
    }
    weak var topic:Module?
    
    
    deinit{
        print("子模块topic 数为\(number)")
    }
}


var toc:Module?
var list:SubModule?
toc = Module(name:"ARC")
list = SubModule(number:4)
toc!.sub = list
list!.topic = toc

toc = nil
list = nil


//无主引用实例












































