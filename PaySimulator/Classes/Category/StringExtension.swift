//
//  String.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/29.
//  Copyright © 2018年 再出发. All rights reserved.
//

import Foundation

extension String {
    func isIncludeChinese() -> Bool {
        for ch in self.unicodeScalars {
            // 中文字符范围：0x4e00 ~ 0x9fff
            if (0x4e00 < ch.value  && ch.value < 0x9fff) {
                return true
            }
        }
        return false
    }
    
    func transformToPinyin() -> String {
        let stringRef = NSMutableString(string: self) as CFMutableString
        // 转换为带音标的拼音
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false);
        // 去掉音标
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false);
        let pinyin = stringRef as String;
        
        return pinyin
    }
    
    func transformToPinyinWithoutBlank() -> String {
        var pinyin = self.transformToPinyin()
        // 去掉空格
        pinyin = pinyin.trimmingCharacters(in: .whitespaces)
        return pinyin
    }
    
    func getPinyinHead() -> String {
        // 字符串转换为首字母大写
        let pinyin = self.transformToPinyin().capitalized
        var headPinyinStr = ""
        
        // 获取所有大写字母
        for ch in pinyin.characters {
            if ch <= "Z" && ch >= "A" {
                headPinyinStr.append(ch)
            }
        }
        return headPinyinStr
    }
}

extension String {
    /// 顺序查找指定子串，每个字符只扫描一次，不重复扫描。返回Range数组
    func zranges(of string: String) -> [Range<String.Index>] {
        var rangeArray = [Range<String.Index>]()
        var searchedRange: Range<String.Index>
        guard let sr = self.range(of: self) else {
            return rangeArray
        }
        searchedRange = sr
        
        var resultRange = self.range(of: string, options: .regularExpression, range: searchedRange, locale: nil)
        while let range = resultRange {
            rangeArray.append(range)
            searchedRange = Range(uncheckedBounds: (range.upperBound, searchedRange.upperBound))
            resultRange = self.range(of: string, options: .regularExpression, range: searchedRange, locale: nil)
        }
        return rangeArray
    }
    
    /// 顺序查找指定子串，每个字符只扫描一次，不重复扫描。返回NSRange数组
    func nsranges(of string: String) -> [NSRange] {
        return zranges(of: string).map { (range) -> NSRange in
            self.nsrange(fromRange: range)
        }
    }
    
    /// 把Range转成NSRange
    func nsrange(fromRange range : Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
}
