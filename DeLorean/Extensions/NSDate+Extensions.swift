
//
//  NSDateExtensions.swift
//  Calvin
//
//  Created by Scott Petit on 7/6/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

import Foundation

extension NSDate {
    
    func dayOfYear() -> Int {
        let dayOfYear = NSCalendar.currentCalendar().ordinalityOfUnit(.DayCalendarUnit, inUnit: .YearCalendarUnit, forDate: self)
        return dayOfYear
    }
    
    func hourOfDay() -> Int {
        let components = NSCalendar.currentCalendar().components(.HourCalendarUnit, fromDate: self)
        let hourOfDay = components.hour
        return hourOfDay
    }
        
    func dayOfMonth() -> Int {
        let components = NSCalendar.currentCalendar().components(.DayCalendarUnit, fromDate: self)
        let day = components.day
        return day
    }

    func monthOfYear() -> Int {
        let components = NSCalendar.currentCalendar().components(.MonthCalendarUnit, fromDate: self)
        let month = components.month
        return month
    }

    func year() -> Int {
        let components = NSCalendar.currentCalendar().components(.YearCalendarUnit, fromDate: self)
        let year = components.year
        return year
    }
    
    func isBefore(date: NSDate) -> Bool {
        let isBefore = self.compare(date) == NSComparisonResult.OrderedAscending
        return isBefore;
    }
    
    func isSameDayAs(date: NSDate) -> Bool {
        let isSameDay = (self.dayOfYear() == date.dayOfYear()) && (self.monthOfYear() == date.monthOfYear()) && (self.year() == date.year())
        return isSameDay
    }
    
    func startOfDate() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        
        let calendarUnit: NSCalendarUnit = .YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit
        let hours = calendar.minimumRangeOfUnit(.HourCalendarUnit).location
        let minutes = calendar.minimumRangeOfUnit(.MinuteCalendarUnit).location
        let seconds = calendar.minimumRangeOfUnit(.SecondCalendarUnit).location
        
        let components = calendar.components(calendarUnit, fromDate:self)
        return NSDate.dateFromYear(components.year, months: components.month, days: components.day, hours: hours, minutes: minutes, seconds: seconds)
    }
    
    func startOfNextDay() -> NSDate? {
        var date = self.startOfDate()?.dateDaysAfter(1)
        return date
    }
    
    class func startOfCurrentDay() -> NSDate? {
        return NSDate().startOfDate()
    }
    
    class func startOfTomorrow() -> NSDate? {
        return NSDate().startOfNextDay()
    }
    
    func dateSecondsAfter(seconds: Int) -> NSDate {
        return self.dateByAdding(years: 0, months: 0, weeks: 0, days: 0, hours: 0, minutes: 0, seconds: seconds)
    }
    
    func dateMinutesAfter(minutes: Int) -> NSDate {
        return self.dateByAdding(years: 0, months: 0, weeks: 0, days: 0, hours: 0, minutes: minutes, seconds:0)
    }
    
    func dateHoursAfter(hours: Int) -> NSDate {
        return self.dateByAdding(years: 0, months: 0, weeks: 0, days: 0, hours: hours, minutes: 0, seconds: 0)
    }
    
    func dateDaysAfter(days: Int) -> NSDate {
        return self.dateByAdding(years: 0, months: 0, weeks: 0, days: days, hours: 0, minutes: 0, seconds: 0)
    }
    
    func dateWeeksAfter(weeks: Int) -> NSDate {
        return self.dateByAdding(years: 0, months: 0, weeks: weeks, days: 0, hours: 0, minutes: 0, seconds: 0)
    }
    
    func dateMonthsAfter(months: Int) -> NSDate {
        return self.dateByAdding(years: 0, months: months, weeks: 0, days: 0, hours: 0, minutes: 0, seconds: 0)
    }
    
    func dateYearsAfter(years: Int) -> NSDate {
        return self.dateByAdding(years: years, months: 0, weeks: 0, days: 0, hours: 0, minutes: 0, seconds: 0)
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
    
    func dateByAdding(#years: Int, months: Int, weeks: Int, days: Int, hours: Int, minutes: Int, seconds: Int) -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        components.calendar = calendar
        
        if years != 0 {
            components.year = years
        }
        if months != 0 {
            components.month = months
        }
        if weeks != 0 {
            components.weekOfYear = weeks
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
        
        let date = calendar.dateByAddingComponents(components, toDate: self, options: NSCalendarOptions())
        return date
    }

}
