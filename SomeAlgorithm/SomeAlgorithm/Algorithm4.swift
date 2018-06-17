//
//  Algorithm4.swift
//  SomeAlgorithm
//
//  Created by 侯博野 on 2018/5/26.
//  Copyright © 2018 satelens. All rights reserved.
//

import Foundation

/**
 给定两个非空链表来表示两个非负整数。位数按照逆序方式存储，它们的每个节点只存储单个数字。将两数相加返回一个新的链表。
 你可以假设除了数字 0 之外，这两个数字都不会以零开头。
 
 实例：
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 **/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(val: Int) {
        self.val = val
        self.next = nil
    }
    public init(val: Int, next: ListNode) {
        self.val = val
        self.next = next
    }
}

class Algorithm4 {
    func algorithm4() {
        let l1 = ListNode(val: 2, next: ListNode(val: 4, next: ListNode(val: 3)))
        let l2 = ListNode(val: 5, next: ListNode(val: 6, next: ListNode(val: 4)))
        print(addTwoNumbers(l1: l1, l2: l2))
    }
    
    public func addTwoNumbers(l1: ListNode?, l2: ListNode?) -> ListNode {
        var c1 = l1
        var c2 = l2
        let sentinel = ListNode(val: 0)
        var d = sentinel
        var sum = 0
        while c1 != nil || c2 != nil {
            sum /= 10
            if c1 != nil {
                sum += (c1?.val)!
                c1 = c1?.next
            }
            if c2 != nil {
                sum += (c2?.val)!
                c2 = c2?.next
            }
            d.next = ListNode(val: sum % 10)
            d = d.next!
        }
        if sum / 10 == 1 {
            d.next = ListNode(val: 1)
        }
        return sentinel.next!
    }

}

