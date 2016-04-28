//
//  main.swift
//  Swift字符
//
//  Created by zgq on 16/4/27.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation
/*
 
 Swift的字符是一个单一的字符字符串字面量，数据类型为Character
 
 以下实例列出了两个字符实例：
 
 */

let char1:Character = "A"
let char2:Character = "B"
print("char1 的值为\(char1)")
print("char2 的值为 \(char2)")

//如果你想在Charcter字符类型的常量中存储更多的字符。，则程序会报错

//空字符变量
//Swift中不能创建空的字符类型变量或常量

//遍历字符串中的字符Swift的String类型表示特定序列的字符类型值的集合。，内一个字符之代表一个Unicode字符

for ch in "Hello".characters {
    print(ch)
}

//字符串连接字符
var varA:String = "Hello"
let varB:Character = "G"
varA.append(varB)
print("varc = \(varA)")

        