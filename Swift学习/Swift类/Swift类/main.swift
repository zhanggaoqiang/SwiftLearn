//
//  main.swift
//  Swift类
//
//  Created by zgq on 16/4/21.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation
//Swift类是构建代码所用的一种通用且灵活的构造体 ，Swift并不要求你为自定义类去创建独立的接口和实现文件，
//你所要做的是在一个单一文件中定义一个类，系统会自动生成面向其它代码的外部接口
//与结构体相比类还有如下附加功能
//1,继承允许一个类继承另一个类的特征2.类型转换允许在运行时检查和解释一个类实例的类型3.解构器允许一个类实例释放任何其所分配的资源 4引用计数允许对一个类的多次引用

//类定义
class student {
    var studname :String = ""
    var mark:Int = 0
    var mark2:Int = 0
    
}

let studrecord = student()




class MarksStruct {
    var mark :Int = 0
    init(mark:Int){
        self.mark=mark
    }
    
}

class studentMarks {
   
    var marks = 300
    
}
 let marks = studentMarks();
print("成绩为\(marks.marks)")



//作为引用类型访问类属性 类的属性可以通过.来访问。格式为:实例化类名.属性名

class  studentMarks1 {
    var marks1 = 300
    var marks2 = 400
    var marks3 = 900
 }


let marks1 = studentMarks1()

print("Makrs1 is \(marks1.marks1)")




//恒等运算符
//因为类是引用类型，有可能有多个常量和变量在后台同时引用某一个类实例
//为了能够判定两个常量或者变量是否引用同一个类实例,Swift内建了两个恒等运算符



class SampleClass {
  
    let myProperty:String
    init(s:String){
        myProperty=s
        
    }
    
}

func ==(lhs:SampleClass,rhs:SampleClass) -> Bool {
    return lhs.myProperty==rhs.myProperty
}


let spClass1 = SampleClass(s:"Hello")
let spClass2 = SampleClass(s:"Hello")


if spClass1===spClass2 {
    print("引用相同的实例 \(spClass1)")
}

if  spClass1 !== spClass2 {
    print("引用不同的实例 \(spClass1)")
}




















