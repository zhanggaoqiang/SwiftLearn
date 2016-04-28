//
//  main.swift
//  Swift数组
//
//  Created by zgq on 16/4/26.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation

/*
 Swift数组使用有序列表存储同一类型的多个值，相同的值可以多次出现在一个数组的不同位置
 Swift数组会强制检测元素的类型，，如果类型不同则会报错，Swift数组应该遵循像Array<Alement>这样的形式。其中Element是这个数组中唯一允许存在的数据类型
 如果创建一个数组，并赋给一个变量。则创建的集合就是可以修改的，这意味着在创建数组后，通过检测，删除，修改的凡事改变数组里的项目，如果将一个数组赋值给常量，数组就不可修改，并且数组的大小和内容都不可以修改
 
 
 */
//创建数组
/*
 我们可以使用构造语法来创建一个由特定数据类型构成的空数组：
 */


//访问数组
//我们可以根据数组的索引来访问数组的元素语法如下：
var someInts=[Int](count:3,repeatedValue:10)

var someVar = someInts[0]
print("第一个元素的值\(someVar)");
print("第二个元素的值 \(someInts[1])")

/*
 修改数组
 你可以使用append()方法或者赋值运算符+=在数组末尾添加元素，如下我们初始化一个数组，并向其中添加元素
 */

var someInts1 = [Int]()
someInts1.append(20)
someInts1.append(30)
someInts1 += [40]

print("第一个为：\(someInts1[0])")
print("第二个为: \(someInts1[1])")
print("第三个为: \(someInts1[2])")

//我们也可以通过索引修改数组元素的值
someInts1[2]=50
print("修改后的第二个值为: \(someInts1[2])")

//遍历数组：我们可以使用for-in循环来遍历所有数组中的数据项：


var someStrs = [String]()
someStrs.append("Apple")
someStrs.append("Amazon")
someStrs.append("Runoob")
someStrs.append("Googl")


for  item  in someStrs {
    print(item)
}

//如果我们同时需要每个数据项的值和索引值，可以使用Stirng的enumerate（)方法来 进行数组遍历。实例如下
for (index,item )in someStrs.enumerate() {
    print("在 index= \(index)位置为\(item)")
    
}



//合并数组
//我们可以使用加法操作符来合并两种已存在的相同类型数组,xin新数组shu的数据类型会从两个shu数组的数据类型中推断出来：
var intsA = [Int](count:2,repeatedValue:2)
var intsVB = [Int](count:3,repeatedValue:3)

var intsC = intsA + intsVB

for item in intsC {
    print(item)
    
}



//count属性
//我们可以使用count属性来计算数组元素的个数：
print("intsC的元素的个数: \(intsC.count)")

//isEmpty属性，我们可以通过只读书析构来判断数组是否为空，返回布尔值
print("intsA.isEmpty = \(intsA.isEmpty)")




        