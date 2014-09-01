
//
//  NSDateExtensions.swift
//  Calvin
//
//  Created by Scott Petit on 7/6/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

import Foundation

extension NSDate {
    
    func year() -> Int {
        let components = NSCalendar.currentCalendar().components(.YearCalendarUnit, fromDate: self)
        let year = components.year
        return year
    }
    
    class func dateFromYear(year: Int, months: Int, days: Int, hours: Int, minutes: Int, seconds: Int) -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        components.calendar = calendar
        
        if year != 0 {
            components.year = year
        }
        if months != 0 {
            components.month = months
        }
        if days != 0 {
            components.day = days
        }
        if hours != 0 {
            components.hour = hours
        }
        if minutes != 0 {
            components.minute = minutes
        }
        if seconds != 0 {
            components.second = seconds
        }
        
        let date = calendar.dateFromComponents(components)
        return date
    }

}
