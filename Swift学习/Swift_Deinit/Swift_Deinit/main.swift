//
//  main.swift
//  Swift_Deinit
//
//  Created by zgq on 16/4/23.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation

//Swift析构过程 在一个类的实例释放之前，析构函数被立即调用，用关键字deinit来便是析构函数
//析构函数只是适用于类类型

//析构过程原理
//Swift会自动释放不再需要的实例以释放资源
//swift通过引用计数(ARC )处理实例的内存管理
//通常当你的实例被释放时不需要手动地去清理。但是，当使用自己的资源时，你可能需要一些额外的清理。
//比如，创建了一个自定义类来打开一个文件，并写入一些数据，你可能需要在类实例被释放之前关闭该文件

//语法 

//在类的定义中，每个类最多只能有一个析构函数。析构函数不带任何参数，在写法上不带括号


var counter=0;

class BaseClass {
    
    init(){
        
        counter += 1
    }
    
    deinit{
        counter-=1
    }
    
    
}

var show:BaseClass?=BaseClass()
print(counter)
show=nil
print(counter)


//当show = ni语句执行后，计数器减去1，show占用的内存就会释放
var counter1=0;
class BaseClass1 {
    init(){
        counter1+=1
    }
    
    deinit{
        counter1-=1
    }
}


var show1:BaseClass1? = BaseClass1()

print(counter1)
print(counter1)









