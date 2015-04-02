
//
//  NSDateExtensions.swift
//  Calvin
//
//  Created by Scott Petit on 7/6/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

import Foundation

public extension NSDate {
    
    var year: Int {
        let year = NSCalendar.currentCalendar().component(.CalendarUnitYear, fromDate: self)
        return year
    }
    
    var month: Int {
        let month = NSCalendar.currentCalendar().component(.CalendarUnitMonth, fromDate: self)
        return month
    }
    
    var day: Int {
        let day = NSCalendar.currentCalendar().component(.CalendarUnitDay, fromDate: self)
        return day
    }
    
    var hour: Int {
        let hour = NSCalendar.currentCalendar().component(.CalendarUnitHour, fromDate: self)
        return hour
    }
    
    var minute: Int {
        let minute = NSCalendar.currentCalendar().component(.CalendarUnitMinute, fromDate: self)
        return minute
    }
    
    var second: Int {
        let second = NSCalendar.currentCalendar().component(.CalendarUnitSecond, fromDate: self)
        return second
    }

}
