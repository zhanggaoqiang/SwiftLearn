//
//  main.swift
//  Swift可选类型
//
//  Created by zgq on 16/4/21.
//  Copyright © 2016年 zgq. All rights reserved.
//可选类型的概念在C和Objective-C当中是不存在。Objective-C当中最相近的东西就是，一个返回对象类型的函数，可以返回nil.nil表示不存在一个有效的对象。但是，这个只适用于对象，对于结构体，基本的C类型，枚举，就不行了。对于这些类型，Objective-C的方法通常返回一个特殊值（比如NSNotFound）表示值的缺失。这种方法假设方法的调用者知道要返回一个特殊值来进行判断。Swift的可选类型可以让你表示任何类型值的缺失，再也不用那些特殊的常量了。
import Foundation
//可选类型用于处理值缺失的情况
//Swift语言定义后缀?作为命名类型Optional的简写，下面两种等价
var optionalInteger:Int?
//var optionalInteger:Optional<Int>

//Optional是一个含有两种情况的枚举，None和Some(T),用来表示可能有或可能没有值。任何类型都可以明确声明为可选类型。当声明一个可选类型的时候，要
//确保用括号给？操作符一个合适的范围例如声明可选整形数组，应该写成(Int[])?写成Int[]?会报错

//当你声明一个可选变量或者可选属性的时候没有提供初始值，它的值默认为nil
//如果一个可选类型的实例包含一个值，你可以用后缀操作符!来访问这个值
optionalInteger=42
print(optionalInteger!)



var myString:String? = nil

if myString != nil {
    print(myString)
    
}else {
 print("字符串为 nil")
}


//强制解析
//当你确定啊可选类型确定包含值之后，你可以在可选的名字后面加一个感叹号来获取之。这儿感叹号表示"我
//知道这个可选有值，请使用它"这被称为可选值的强制解析


var myString1:String?

myString1="hello ,Swift!"

if myString1 != nil {
    print(myString1)
}else {
    print("myString 值为 nil")
}



//强制解析可选值，使用感叹号(!)
var myString2:String?
myString2="Hello ,Swift!"
if myString2 != nil {
    print(myString2!)
}else {
    
    print("myString2的值为 nil")
}



//自动解析
//你可以在声明可选变量时用感叹号(!)替换问号(?)。这样可选变量在使用时就不需要再加一个感叹号来获取值,它会自动解析

var myString3:String!

myString3="hello Swift3!"
if myString3 != nil {
    print(myString3)
}else {
    print("myString 值为 nil")
}


//可选绑定(optional binding)
//可以判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在if和while语句中来对可选类型的值进行判断并把值赋给一个常量或者变量


var myString4:String?

myString4 = "hello ,Swift4!"
if let  yourString = myString4 {
  print("你的字符串值为 - \(yourString)")
}else {
    print("你的字符串没有值")
}































        