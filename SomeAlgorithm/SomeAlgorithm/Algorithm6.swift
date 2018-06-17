//
//  Algorithm6.swift
//  SomeAlgorithm
//
//  Created by 侯博野 on 2018/5/27.
//  Copyright © 2018 satelens. All rights reserved.
//

import Foundation

/**
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2 。
 请找出这两个有序数组的中位数。要求算法的时间复杂度为 O(log (m+n)) 。
 **/

public class Algorithm6 {
    func algorithm6() {
        let nums1 = [1, 3]
        let nums2 = [2]
        print(findMedianSortedArrays1(nums1, nums2))
        print(findMedianSortedArrays2(nums1, nums2))
    }
    
    // 归并排序
    /**
     本题若没有限制时间复杂度为O(log(m+n))的话，对两个数组使用归并排序，很容易可以找到他们的中位数，所用时间复杂度为O(m*n)
     **/
    func findMedianSortedArrays1(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        if nums1.isEmpty {
            if n%2 != 0 {
                return Double(1*nums2[n/2])
            }
            return Double(nums2[n/2]+nums2[n/2-1])/2.0
        }
        if nums2.isEmpty {
            if m%2 != 0 {
                return Double(1*nums1[m/2])
            }
            return Double(nums1[m/2]+nums1[m/2-1])/2.0
        }
        
        var i = 0
        var j = 0
        var ans = [Int]()
        while i < m && j < n {
            if nums1[i] <= nums2[j] {
                ans.append(nums1[i])
                i += 1
            } else {
                ans.append(nums2[j])
                j += 1
            }
        }
        if i < m {
            for k in i..<m {
                ans.append(nums1[k])
            }
        } else if j < n {
            for k in j..<n {
                ans.append(nums2[k])
            }
        }
        
        let len = ans.count
        if len%2 != 0 {
            return Double(1*ans[len/2])
        }
        
        return Double(ans[len/2]+ans[len/2-1])/2.0
    }
    
    // 二分查找
    /**
     但是要将时间复杂度降为O(log(m+n))，就需要尝试对两个数组同时进行二分查找，逐步排除掉不可能出现中位数的区间，最后找到所求的中位数。
     
     这种解法的主要思想就是：
     如果数组a的中位数小于数组b的中位数，那么整体的中位数只可能出现在a的右区间加上b的左区间之中；
     如果数组a的中位数大于等于数组b的中位数，那么整体的中位数只可能出现在a的左区间加上b的右区间之中。
     关键就是利用分治的思想逐渐缩小a的区间和b的区间来找到中位数。
     **/
    func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        if nums1.isEmpty {
            if n%2 != 0 {
                return Double(1*nums2[n/2])
            }
            return Double(nums2[n/2]+nums2[n/2-1])/2.0
        }
        if nums2.isEmpty {
            if m%2 != 0 {
                return Double(1*nums1[m/2])
            }
            return Double(nums1[m/2]+nums1[m/2-1])/2.0
        }
        
        let total = (m+n+1)/2;
        let total2 = (m+n+2)/2;
        
        
        return Double(find_kth(nums1, 0, nums2, 0, total) + find_kth(nums1, 0, nums2, 0, total2))/2.0
    }
    
    func find_kth(_ a: [Int], _ a_begin: Int, _ b: [Int], _ b_begin: Int, _ k: Int) -> Double {
        if a_begin > a.count - 1 {
            return Double(b[b_begin + k - 1])
        }
        if b_begin > b.count - 1 {
            return Double(a[a_begin + k - 1])
        }
        if k == 1 {
            return Double(a[a_begin] < b[b_begin] ? a[a_begin] : b[b_begin])
        }
        
        var mid_a = INT_MAX
        var mid_b = INT_MAX
        if a_begin+k/2-1 < a.count {
            mid_a = Int32(a[a_begin+k/2-1])
        }
        if b_begin+k/2-1 < b.count {
            mid_b = Int32(b[b_begin+k/2-1])
        }
        
        if mid_a < mid_b {
            return find_kth(a, a_begin+k/2, b, b_begin, k-k/2)
        }
        return find_kth(a, a_begin, b, b_begin+k/2, k-k/2)
    }
    
}

