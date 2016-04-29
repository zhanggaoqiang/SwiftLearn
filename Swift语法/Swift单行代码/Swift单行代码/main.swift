//
//  main.swift
//  Swift单行代码
//
//  Created by zgq on 16/4/29.
//  Copyright © 2016年 zgq. All rights reserved.
//

import Foundation


//1.数组中每个元素乘以2:
print("%d",(1...1024).map{$0 * 2})



/*2.数组中的元素求和:
 虽然这里使用reduce和加号运算符，借助了加号运算符是函数这样一个事实，但解决办法是显而易见的，我们可以到reduce更具创意的用法
 */
print("%d",(1...1024).reduce(0, combine: +))


/*3.验证在字符串中是否存在指定单词：
我们用filter来验证tweet中是否包含选定的若干关键字中的一个
*/

let words = ["Swift","iOS","cocoa","OSX","tvOS"]
let tweet = "This is an example tweet larking about Swift"
let valid = !words.filter({tweet.containsString($0)}).isEmpty

/*
 4.读取文件：
 像其它的语言一样，通过内置来读取文件到数组是不可能，但我们可以结合split和map创造一些不需要for循环的简短代码
 
 */

//let path = NSBundle.mainBundle().pathForResource("test", ofType: "text")
//let lines = try? String(contentsOfFile: path!).characters.split{$0 == "\n"}.map(String.init)
//if let lines = lines {
//    lines[0]
//    lines[1]
//    lines[2]
//    lines[3]
//}

/*
 5.祝你生日快乐！
 这将显示生日快乐到控制台，通过map以及范围和三元运算符的简单实用
 
  */

let name = "uraimo"

(1...4).forEach{print("Happy Birthday " + (($0 == 3) ? "dear \(name)":"to You"))}


/*
 过滤数组中的数字：
 在这种情况下，我们需要使用提供的过滤函数 分区要个序列。许多语言拥有常见的map.flatMap,reduce,filter等
 还有正好能做这件事的partitionBy函数，Swift如你所知没有类似的东西
 因此我们可以用partitionBy函数扩展SequenceTye来解决这个问题，我们将使用artitionBy函数来分区整形数组
  */

extension SequenceType{
    typealias Element = Self.Generator.Element
    func partitionBy(fu: (Element)->Bool)->([Element],[Element]){
        var first=[Element]()
        var second=[Element]()
        for el in self {
            if fu(el) {
                first.append(el)
            }else{
                second.append(el)
            }
        }
        return (first,second)
    }
}
let part = [82, 58, 76, 49, 88, 90].partitionBy{$0 < 60}


//11.元组：通过解构元组交换

var a = 1,b = 2
(a,b)=(b,a)


print("\(a),\(b)")


