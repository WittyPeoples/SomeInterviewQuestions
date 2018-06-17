//
//  Algorithm3.swift
//  SomeAlgorithm
//
//  Created by 侯博野 on 2018/5/26.
//  Copyright © 2018 satelens. All rights reserved.
//

import Foundation

/**
 给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
 你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
**/
public class Algorithm3 {
    func algorithm3() {
        let numbers = [2, 7, 11, 15]
        let expectSum = 9
        print("第一种：")
        print(expectSum_normal(numbers: numbers, expectSum: expectSum))
        print("第二种：")
        print(expectSum_normalSort(numbers: numbers, expectSum: expectSum))
        print("第三种：")
        print(expectSum_byMap(numbers: numbers, expectSum: expectSum))
    }
    
    private func expectSum_normal(numbers: Array<Int>, expectSum: Int) -> [Int] {
        if numbers.count == 0 {
            return []
        }
        for i in 0..<(numbers.count-1) {
            for j in (i+1)..<numbers.count {
                if numbers[i] + numbers[j] == expectSum {
                    return [i, j]
                }
            }
        }
        return []
    }
    
    // 借助排序
    private func expectSum_normalSort(numbers: Array<Int>, expectSum: Int) -> [Int] {
        if numbers.count == 0 {
            return []
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
                return [left, right]
            }
        }
        return []
    }
    
    // 借助Map
    func expectSum_byMap(numbers: Array<Int>, expectSum: Int) -> [Int] {
        if numbers.count == 0 {
            return []
        }
        var map = [Int: Int]()
        for i in 0..<(numbers.count-1) {
            let complement = expectSum - numbers[i]
            if map[numbers[i]] != nil && map[numbers[i]] != i {
                return [map[numbers[i]]!, i]
            }
            map[complement] = i
        }
        
        return []
    }

}

