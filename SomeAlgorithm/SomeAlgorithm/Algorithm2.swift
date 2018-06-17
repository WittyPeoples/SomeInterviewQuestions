//
//  Algotithm2.swift
//  SomeAlgorithm
//
//  Created by Satelens on 18/01/2018.
//  Copyright © 2018 satelens. All rights reserved.
//

import Foundation

/**
 给定一个整型数组（数组中的元素可重复），以及一个指定的值。打印出数组中两数之和为指定值的 所有整数对
**/

public class Algorithm2 {
    func algotithm2() {
        let numbers = [2,7,4,9,3,10,1]
        let expectSum = 11
        expectSum_bySort(numbers: numbers, expectSum: expectSum)
        print("")
        expectSum_bySet(numbers: numbers, expectSum: expectSum)
    }
    
    // 借助排序
    private func expectSum_bySort(numbers: Array<Int>, expectSum: Int) {
        if numbers.count == 0 {
            return
        }
        let temp = numbers.sorted()
        var left = 0
        var right = temp.count - 1
        
        while left < right {
            if temp[left] + temp[right] > expectSum {
                right -= 1
            } else if temp[left] + temp[right] < expectSum {
                left += 1
            } else {
                print("expectSum_bySort:\(temp[left]) + \(temp[right]) = \(expectSum)")
                right -= 1
                left += 1
            }
        }
    }
    
    // 借助Set
    func expectSum_bySet(numbers: Array<Int>, expectSum: Int) {
        if numbers.count == 0 {
            return
        }
        var intSets = Set<Int>()
        var suplement:Int = 0
        for i in numbers {
            suplement = expectSum - i
            if intSets.contains(suplement) == false {
                intSets.insert(i)
            } else {
                print("expectSum_bySet:\(i) + \(suplement) = \(expectSum)")
            }
        }
    }
    
    
}

