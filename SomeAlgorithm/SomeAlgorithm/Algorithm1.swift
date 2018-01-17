//
//  Algorithm1.swift
//  SomeAlgorithm
//
//  Created by 侯博野 on 17/01/2018.
//  Copyright © 2018 satelens. All rights reserved.
//

import Cocoa

/**
 给四个随机数字，打印出所有能组合成的所有三位数，并且不能各个位数不重复
 **/

func algotiyhm1() {
    let num1 = scanfInt(str: "请输入第一个数字：")
    let num2 = scanfInt(str: "请输入第二个数字：")
    let num3 = scanfInt(str: "请输入第三个数字：")
    let num4 = scanfInt(str: "请输入第四个数字：")
    
    var numbers = [num1, num2, num3, num4]
    var result = [Int]()
    
    for index1 in 0..<4 {
        if index1 != 0 {
            numbers.swapAt(index1, 0)
        }
        let n1 = numbers[0]
        for index2 in 1..<4 {
            let n2 = numbers[index2]
            for index3 in 1..<4 {
                let n3 = numbers[index3]
                if n2 != n3 {
                    let mid = n1*100 + n2*10 + n3
                    result.append(mid)
                }
            }
        }
    }
    print("所有组合为\(result.count)个:", result)
}

