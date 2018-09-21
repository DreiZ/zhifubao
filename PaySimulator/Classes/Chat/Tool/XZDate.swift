//
//  XZDate.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/21.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

extension Date {
    func dayFromWeekday() -> String {
        switch self.weekday(date: self) {
        case 1:
            return "星期天"
        case 2:
            return "星期一"
        case 3:
            return "星期二"
        case 4:
            return "星期三"
        case 5:
            return "星期四"
        case 6:
            return "星期五"
        default:
            return "星期六"
        }
    }
    
    func weekday(date : Date) -> Int {
        let gregorian = NSCalendar(calendarIdentifier: .gregorian)
        let comps = gregorian?.components(NSCalendar.Unit.weekday, from: date)
        return comps?.weekday ?? 1
    }
    
    func shortTimeTextOfDate() -> String {
        var interval = self.timeIntervalSince(Date())
        interval = -interval
        
        if self.isToday() {
            let dateFormat = DateFormatter()
            if self.is12Time() {
                dateFormat.dateFormat = "a h:mm"
                dateFormat.amSymbol = "上午"
                dateFormat.pmSymbol = "下午"
            }else{
                dateFormat.dateFormat = "H:mm"
            }

            let dateString = dateFormat.string(from: self)
            return dateString
        }else if self.isYesToday() {
            return "昨天"
        } else if interval < 7 * 24 * 60 * 60 {
            let weekday = self.dayFromWeekday()
            
            let dateFormat = DateFormatter()
            if self.is12Time() {
                dateFormat.dateFormat = "a h:mm"
                dateFormat.amSymbol = "上午"
                dateFormat.pmSymbol = "下午"
            }else{
                dateFormat.dateFormat = "H:mm"
            }
            
            let dateString = dateFormat.string(from: self)
            
            return weekday + " " + dateString
//
//            let dateFormat = DateFormatter()
//            dateFormat.locale = Locale(identifier: "zh_CN")
//            dateFormat.dateFormat = "ccc"
//
//            let dateString = dateFormat.string(from: self)
//            return dateString
        }else {
            let dateComponents = self.ymdDate()?.components()
            let nowComponents = Date().ymdDate()?.components()
            
            if dateComponents?.year == nowComponents?.year {
                
                let dateFormatH = DateFormatter()
                if self.is12Time() {
                    dateFormatH.dateFormat = "a h:mm"
                    dateFormatH.amSymbol = "上午"
                    dateFormatH.pmSymbol = "下午"
                }else{
                    dateFormatH.dateFormat = "H:mm"
                }
                let dateStringHour = dateFormatH.string(from: self)
                
                let dateFormat = DateFormatter()
                dateFormat.dateFormat = "M月d日"
                
                let dateString = dateFormat.string(from: self)
                return dateString + " " + dateStringHour
            }else {
                let dateFormat = DateFormatter()
                dateFormat.dateFormat = "yyyy年M月d日"
                let dateString = dateFormat.string(from: self)
                
                let dateFormatHour = DateFormatter()
                if self.is12Time() {
                    dateFormatHour.dateFormat = "a H:mm"
                    dateFormatHour.amSymbol = "上午"
                    dateFormatHour.pmSymbol = "下午"
                }else{
                    dateFormatHour.dateFormat = "H:mm"
                }
                
                let dateStringHour = dateFormatHour.string(from: self)
                
                return dateString + " " + dateStringHour
            }
        }
    }
    
    func isToday () -> Bool {
        return self.calWithValue(value: 0)
    }
    
    func isYesToday () -> Bool {
        return self.calWithValue(value: 1)
    }
    
    func calWithValue(value : Int) -> Bool {
        let dateComponents = self.ymdDate()?.components()
        let nowComponents = Date().ymdDate()?.components()
        
        let res = (dateComponents?.year == nowComponents?.year && dateComponents?.month == nowComponents?.month)
        let res1 = (dateComponents?.day)! + value == nowComponents?.day
        
        return res && res1
    }
    
    func components() -> DateComponents {
        let calendar = NSCalendar(calendarIdentifier: .gregorian)
        let unit = UInt8(CFCalendarUnit.year.rawValue) | UInt8(CFCalendarUnit.month.rawValue) | UInt8(CFCalendarUnit.day.rawValue) | UInt8(CFCalendarUnit.hour.rawValue) | UInt8(CFCalendarUnit.minute.rawValue) | UInt8(CFCalendarUnit.second.rawValue)
        
        return (calendar?.components(NSCalendar.Unit(rawValue: NSCalendar.Unit.RawValue(unit)), from: self))!
    }
    
    func ymdDate() -> Date? {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        
        let dateString = fmt.string(from: self)
        
        let date = fmt.date(from: dateString)
        
        return date
    }
    

    func is12Time() -> Bool {
        let formatStringForHours = DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: Locale.current)
        let containsA = formatStringForHours?.rangeOfCharacter(from: CharacterSet(charactersIn: "a"))
        
        if containsA == nil {
            return false
        }
        return true
    }
}
