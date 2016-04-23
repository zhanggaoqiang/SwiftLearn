//
//  main.swift
//  Swift结构体
//
//  Created by zgq on 16/4/22.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation

//Swift结构体是构建代码所用的一种通用的灵活的构造体
//我们可以为结构体定义属性（长量和变量）和添加方法，从而扩展结构体的功能
//与C和OC不同的是：结构体不需要实现文件和接口 结构体允许我们创建一个单一文件，且系统会自动生成面向其它代码的外部接口
//结构体总是通过被复制的方式在代码中传递，因此它的值是不可修改
//wi我们通过关键字struct来定义结构体:


struct studentMarks {
    var mark1=100
    var mark2 = 78
    var mark3 = 98
    
}
//结构体实例化使用let关键字
let marks=studentMarks()
print("Marks1 是 \(marks.mark1)")

//结构体的应用
//在你的代码中可以使用结构体来定义你的自定义数据类型
//按照通用的准则


struct markStruct1 {
    var marks1:Int=0
    var marks2:Int = 0
    var marks3:Int = 0
    
    init(marks1:Int,marks2:Int,marks3:Int) {
        
        self.marks1=marks1
        self.marks2=marks2
        self.marks3=marks3
        
    }
}


print("成绩优异")
var marks1 = markStruct1(marks1: 98,marks2: 96,marks3: 100)
print(marks1.marks1)




