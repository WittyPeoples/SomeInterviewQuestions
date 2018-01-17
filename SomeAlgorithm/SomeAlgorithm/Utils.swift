//
//  Utils.swift
//  SomeAlgotiyhm
//
//  Created by Satelens on 17/01/2018.
//  Copyright © 2018 Satelens. All rights reserved.
//

import Foundation

/// 控制台输入数字函数
///
/// - Parameter str: 描述
/// - Returns: 输入的数字
public func scanfInt(str: String) -> Int {
    print(str, terminator: "")
    let stdin = FileHandle.standardInput.availableData
    var input = NSString(data: stdin, encoding: String.Encoding.utf8.rawValue)! as String
    input.removeLast()
    if !isPurnInt(string: input) {
        return scanfInt(str: "警告:含非法字符，请输入纯数字:")
    }
    return Int(input)!
}

/// 判断字符串是否为整数数字
///
/// - Parameter string: 目标字符串
/// - Returns: Bool
func isPurnInt(string: String) -> Bool {
    let scan = Scanner(string: string)
    var val = 0
    return scan.scanInt(&val) && scan.isAtEnd
}



