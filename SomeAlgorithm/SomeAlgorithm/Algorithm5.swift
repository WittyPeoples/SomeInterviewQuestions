//
//  Algotithm5.swift
//  SomeAlgorithm
//
//  Created by 侯博野 on 2018/5/26.
//  Copyright © 2018 satelens. All rights reserved.
//

import Foundation

/**
 给定一个字符串，找出不含有重复字符的最长子串的长度。
 
 示例：
 给定 "abcabcbb" ，没有重复字符的最长子串是 "abc" ，那么长度就是3。
 给定 "bbbbb" ，最长的子串就是 "b" ，长度是1。
 给定 "pwwkew" ，最长子串是 "wke" ，长度是3。请注意答案必须是一个子串，"pwke" 是 子序列  而不是子串。
 **/

public class Algorithm5 {
    public func algorithm5() {
        let s = "abcabcbb"
        print(lengthOfLongestSubstring1(s))
        print(lengthOfLongestSubstring2(s))
    }
    
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var max = ""
        var current = ""
        for i in 0 ..< s.count {
            let tmp = s[s.index(s.startIndex, offsetBy: i)]
            if current.contains(tmp) {
                if current.count >= max.count {
                    max = current
                }
                let start = s.index(s.startIndex, offsetBy: i - 1)
                let end = s.index(s.startIndex, offsetBy: i)
                current = String(s[start...end])
            } else {
                current = current + String(tmp)
            }
        }
        return max.count > current.count ? max.count : current.count
    }
    
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var max = 0
        var count = 0
        for i in 0..<s.count {
            for j in count..<i {
                if s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: j)] {
                    count = j+1
                    break
                }
            }
            max = max > i - count + 1 ? max : i - count + 1
        }
        return max
    }
}


