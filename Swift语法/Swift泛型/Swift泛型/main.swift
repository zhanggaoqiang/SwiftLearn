//
//  main.swift
//  Swift泛型
//
//  Created by zgq on 16/4/28.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation

/*
 Swift提供了泛型让你写出灵活且可重用的函数和类型
 Swift标准库通过泛型代码来构建出来的
 Swift的数组和字典类型都是泛型集
 你可以创建一个Int数组，也可以创建一个String数组，或者甚至可以是任何其它Swift的类型数据数组
 
 
 
 */
//以下实例是一个非泛型函数用来交换两个Int值：
//ding定义一个交换两个变量的函数
func exchange(inout a:Int,inout b:Int){
    let temp = a
    a = b
    b = temp
    
}

var num1 = 100
var num2 = 200
print("交换前数据 :\(num1)和\(num2)")
exchange(&num1, b: &num2)
print("交换后的数据 :\(num1)和\(num2)")



//泛型函数可以访问任何类型，如Int或String
//以下实例是一个泛型函数exchange用来交换两个Int和String值：
/*
 这个函数的泛型类型版本使用了占位类型名字（tong通常情况下用字母T来表示）来代替实际类型名
 占位类型名没有提示T是什么类型，dan但是它提示了a和b必须是同一类型T.只有exchange(_:_:)
 函数在每次调用时所传入的实际类型才能决定T所代表的类型
 另外一个不同之处在于这个泛型函数后面跟着占位类型名字(T)使用尖括号括起来的
 这个尖括号告诉Swift那个T是exchange函数所定义的一个类型，因为T是一个占位命名类型，Swift不回去查找命名为
 T的实际类型
 
 */
func exchange1<T>(inout a:T,inout b:T)  {
    let temp = a
    a = b
    b = temp
    
}

var numb1 = 100
var numb2 = 200

print("交换前数据:  \(numb1) 和 \(numb2)")
exchange1(&numb1, b: &numb2)
print("交换后数据: \(numb1) 和 \(numb2)")

var str1 = "A"
var str2 = "B"

print("交换前数据:  \(str1) 和 \(str2)")
exchange1(&str1, b: &str2)
print("交换后数据: \(str1) 和 \(str2)")





/*
 Swift允许你定义你自己的泛型类型
 自定义 类，结构体和枚举用于任何类型，如同Array和Dictionary的用法
*/


struct TOS<T> {
    var items = [T]()
    
    mutating func push(item:T ){
        items.append(item)
    }
    mutating func pop() ->T {
        return items.removeLast()
    }
    
}
var tos = TOS<String>()
tos.push("Swift")
print(tos.items)

tos.push("泛型")
print(tos.items)

tos.push("类型参数")
print(tos.items)

tos.push("类型参数名")
print(tos.items)


let deletetos = tos.pop()
print(tos.items)




/*
 
 扩展泛型类型：
 当你扩展一个泛型类型的时候(使用extension关键字)，你并不需要在扩展的定义中提供类型参数列表
 更加方便的是，原始类型定义中声明的类型参数列表在扩展里可以使用的，并且这些来自原始类型中的参数
 名称会被用作原始定义中类型参数的引用
 实例：
 下面例子扩展了类型TOS类型，为其添加了一个名为firsrt的只读计算属性，它将会返回当前栈顶端的元素而不会将其从展中溢出
 
 
  */

struct TOS1<T> {
    var items = [T]()
    mutating  func push(item:T){
        items.append(item)
    }
    
    mutating func pop() ->T {
        return items.removeLast()
    }
    
}


var tos1 = TOS1<String>()
tos1.push("Swift")
print(tos1.items)


tos1.push("泛型")
print(tos1.items)

tos1.push("类型参数")
print(tos1.items)

tos1.push("类型参数名")
print(tos1.items)


extension TOS1 {
    var first:T? {
        return items.isEmpty ?nil:items[items.count-1]
    }
 }


if let first = tos1.first {
    print("zhandin栈顶部项:\(first)")
}


/*
 类型约束：
 类型约束制定了一个必须继承自指定类的类型参数，或者遵循一个特定的协议或协议构成
 
 类型约束语法
 你可以写一个在一个类型参数名后面的类型约束，通过冒号分割，来作为参数脸的一部分。
 这种作用与泛型函数的类型约束的基础语法
 
 
 */


func findStringIndex(array:[String],_ valueToFind:String) -> Int? {
    
    for (index,value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
    
    
    
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]

if let foundIndex = findStringIndex(strings, "llama") {
    print("llama 的下标索引值为 \(foundIndex)")
}



/*
 
 关联类型实例：
 Swift中使用typealias关键字来设置关联类型
 定义一个协议时，有的时候声明一个或者多个关联类型作为协议定义的一部分是非常有用的
*/

protocol Container {
    associatedtype itemType
    mutating func append(item:itemType)
    var count:Int{get}
    subscript(i:Int) ->itemType{get}
    
    
    
    
    
}




struct TOS2<T>:Container {
    
    var items = [T]()
    mutating func push(item:T){
        items.append(item)
    }
    
    mutating func pop() ->T {
        
        return items.removeLast()
    }
    
    mutating func append(item: T) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i:Int)  ->T {
        return items[i]
    }
}

var tos3 = TOS2<String>()
tos3.push("Swift")
print(tos3.items)

tos3.push("泛型")
print(tos3.items)

tos3.push("参数类型")
print(tos.items)

tos3.push("类型参数名")
print(tos3.items)



/*where语句：
类型约束能够确保类型符合泛型函数或类的定义约束
 你可以在参数列表中通过使用where语句定义参数的约束
 你可以写一个where语句，紧跟在类型参数列表后面，where语句后跟一个或者多个针对关联类型的约束
 
 
*/














