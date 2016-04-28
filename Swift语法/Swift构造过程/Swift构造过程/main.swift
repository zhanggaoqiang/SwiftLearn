//
//  main.swift
//  Swift构造过程
//
//  Created by zgq on 16/4/22.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation

//Swift构造过程是为了使用某个类，结构体或者枚举类型的实例而进行的准备过程，这个过程包含了为实例中的每个属性
//设置初始值和为其执行必要的准备和初始化任务
//Swift中构造函数用init()方法
//与OC构造器不同，Swift构造器无需返回值，它们的主要任务是保证实例在第一次使用前完成正确的初始化
//类实例也可以通过定义析构器在类实例释放之前执行清理内存的工作


//以下结构体定义一个不带参数的构造器init,并在里面将存储性属性length和breadth的值初始化为6和12


struct rectangle {
    var length:Double=0;
    var breadth:Double = 0
    init() {
        length=6
        breadth=12;
    }
    
    
}

var area = rectangle()
print("矩形的面积 \(area.length*area.breadth)")


//moren默认属性值，同样也可以在属性声明时为其设置默认值


struct rectangle1 {
    var length = 6
    var breadth = 12
    
    
}


var  area1 = rectangle()

print("矩形的面积 \(area1.length*area1.breadth)")


//构造参数
//你可以在定义构造器init()时提供构造参数


struct rectangle2 {
    var length:Double=0
    var breadth:Double = 0
    var area:Double = 0
    
    
    init(fromLength length:Double,fromeBreadth breadth:Double){
        
        self.length=length
        self.breadth=breadth
        area=length*breadth
        
        
    }
    
    
    
}

let ar = rectangle2(fromLength: 6, fromeBreadth: 12)
print("面积为: \(ar.area)")




//内部和外部参数名
//跟函数和方法参数相同，构造函数也存在一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字
//构造器并不像函数和方法那样在括号前有一个可以辨别的名字。所以在调用构造器时，主要通过构造器中参数名和类型来确定需要调用的构造器
//如果你在定义构造器时没有提供参数的外部名字，Swift会为每个构造器的参数自动生成一个跟内部名字相同的外部名
struct Color {
    let red,green,blue:Double
    init(red:Double,green:Double,blue:Double) {
        self.red = red
        self.green=green
        self.blue=blue
        
    }
    init(white:Double){
        red=white
        green=white
        blue=white
    }
}
//创建一个新的Color实例，通过三种颜色的外部参数名来传值，并调用构造器
let magenta = Color(red:1.0,green:0.0,blue:1.0)
print("red 值为:\(magenta.red)")
print("green 值为:\(magenta.green)")
print("blue 值为:\(magenta.blue)")

//创建一个新的Color实例，通过三种颜色的外部参数名来传值，并调用构造器
let halfGray = Color(white:0.5)
print("red 值为:\(halfGray.red)")
print("green 值为:\(halfGray.green)")
print("blue 值为:\(halfGray.blue)")







//没有外部名称参数
//如果你不希望为构造器的某个参数提供外部名字,你可以使用下划线来现实和描述它的外部名

struct Rectangle3 {
    var length:Double
    init(frombreadth breadth:Double) {
        length=breadth*10
        
    }
    
    init(frombre bre:Double) {
        length=bre * 30
    }
    
    
    //不提供外部名字
    init(_ area:Double){
        length = area
    }
    
}

//调用不提供外部名字
let  rectarea3=Rectangle3(180.0)
print("面积为:\(rectarea3.length)")

//调用提供外部名字
let rectarea4=Rectangle3(frombreadth:30)
print("调用外部名字:\(rectarea4.length)")




//可选属性设置
//如果你定制的类型包含一个逻辑上允许取值为空的存储型属性，，你都需要将它定义为可选属性optional type（可选属性类型）
//当存储属性声明为可选时，将自动初始化为空nil
struct Rectangle4{
    var length:Double?
    init(frombreadth breadth:Double){
        length=breadth * 10
    }
    
    
    init(fromble bre:Double) {
        length = bre * 30
    }
    init(_ area:Double){
        length = area
    }
    
}

let rect1 = Rectangle4(180.0)

print("面积：\(rect1.length)")









//构造过程中修改常量属性
//只要在构造过程结束前常量的值能确定，你可以再构造过程中的任意时间点修改常量属性的值
//对某个类实例来说，它的常量属性只能在定义它的的类的构造过程中秀发，不能在子类中修改
//尽管length属性是常量，我们仍然可以在其类的构造器中设置它的值


struct recttangle5 {
    let length:Double?
    init(frombreadth breadth:Double){
        length = breadth * 10
        
    }
    
    init(frombre bre:Double){
        length = bre * 20
    }
    init(_ area:Double){
        length = area
    }
    
    
}

let rect5 = recttangle5(180.0)
print("面积为:\(rect5.length)")




//默认构造器
//默认构造器将简单的创建一个所有属性值都设置为默认值的实例
//以下实例中，ShoppingList类中的所有属性都有默认值，它是没有父类的基类，它将自动获得一个可以为所有属性值的默认构造器
class ShoppingListItem {
    var name :String?
    var quantity = 1
    var purchase = false
  
}

var item = ShoppingListItem()
print("名字为:\(item.name)")






//结构体的逐一成员构造器
//如果结构体对所有存储行属性提供了默认值且自身没有提供定制的构造器，它们能自动获得一个逐一成员构造器
//我们在调用逐一成员构造器时，通过与成员属性名相同的参数名进行传值来完成对成员属性的初始赋值
//由于这两个存储性属性都有默认值，结构体自动获得了一个逐一成员构造器init(width:height).你可以用它为结构欧体创建新的实例

struct Rectangle6 {
    
    
    var length = 100.0,breadth=200.0
    
}

let area6 = Rectangle6(length: 24.0,breadth: 32.0)
print("矩形的面积:\(area6.length)")






//值类型的构造器代理
//构造器可以通过调用其它构造器来完成实例的部分构造过程。这个过程成为构造器代理，它能减少多个构造器间的代码重复
//struct Size {
//    var width = 0.0,height = 0.0
//    
//    
//}
//struct Point {
//    var x = 0.0,y = 0.0
//    
//}
//
//struct Rect7 {
//    var original = Point()
//    var size = Size()
//    init(){
//        
//    }
//    
//    init(original:Point,size:Size) {
//        self.original=original
//        self.size=size
//    }
//    
//    init(center:Point,size:Size){
//        let originX = center.x-(size.width/2)
//        let originY = center.y-(size.height/2)
//        self.init()
//        
//        
//    }
//    
//    
//    
//    
//}
//



//构造器的继承和重载：
/*
 
 Swift中子类不会默认继承父类的构造器
 父类的构造器仅在确定和安全的情况下被继承
 当你重写一个父类指定构造器时，你需要写override修饰符
*/

class SuperClass{

    var corners  = 4
    var description :String {
        return "\(corners) 边"
        
    }
    
}
let rectangle8 = SuperClass()
print("矩形:\(rectangle8.description)")



class SubClass: SuperClass {
    override init() {
        super.init()
        corners = 5
    }
}

let subClass = SubClass()
print("五角型：\(subClass.description)")









//指定构造器和便利构造器实例：
/*
 接下来的例子将在操作中展示指定构造器，便利构造器和自动构造器的继承
 它定义了包含两个类MainClass,SubClass的类层次结构，并将演示它们的构造器是如何相互作用的
*/

class MainClass {
    var name:String
    init(name:String){
        self.name = name
    }
    
    convenience init() {
        self.init(name:"[匿名]")
    }
    
}


let  main = MainClass(name:"Runoob")
print("MainClass 名字为: \(main.name)")

let main2 = MainClass()
print("没有对应名字:\(main2.name)")

class SubClass8: MainClass {
    var count:Int
    
    init(name:String,count:Int){
        self.count = count
        super.init(name: name)
    }
    
    
    override convenience init(name: String) {
        self.init(name:name,count: 1)
        
    }
    
}

let sub8 = SubClass8(name:"Runoob")
print("MainClass 名字为:\(sub8.name)")

let sub9 = SubClass8(name:"Runoob",count:3)
print("count 变量: \(sub9.count)")















