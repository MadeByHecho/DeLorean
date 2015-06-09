//
//  DeLorean.swift
//  DeLorean
//
//  Created by Scott Petit on 8/24/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

import Foundation

private let _DeLoreanSharedInstance = DeLorean()

public class DeLorean {
    
    private var date: NSDate? = nil
    
    private class var sharedInstance: DeLorean {
        return _DeLoreanSharedInstance
    }
    
    private init() {
        swizzle()
    }
    
    class func currentDate() -> NSDate? {
        return DeLorean.sharedInstance.date
    }
    
    public class func travelTo(date: NSDate?, closure: (() -> Void)? = nil) {
        DeLorean.sharedInstance.date = date
        if let closure = closure {
            closure()
            DeLorean.backToThePresent()
        }
    }
    
    public class func travelTo(year: Int = 2015, month: Int = 1, day: Int = 2, hour: Int = 12, minute: Int = 30, second: Int = 3) -> NSDate? {
        let date = dateFromYear(year, months: month, days: day, hours: hour, minutes: minute, seconds: second)
        travelTo(date)
        return date
    }
    
    public class func backToThePresent() {
        travelTo(nil)
    }
    
    private func swizzle() {
        let className = "NSDate"
        
        swizzleClassMethodForClassName(className, originalSelectorName: "date", newSelectorName: "deloreanDate")
        swizzleClassMethodForClassName(className, originalSelectorName: "dateWithTimeIntervalSinceNow", newSelectorName: "deloreanDateWithTimeIntervalSinceNow")
        swizzleInstanceMethodForClassName(className, originalSelectorName: "timeIntervalSinceReferenceDate", newSelectorName: "deloreanTimeIntervalSinceReferenceDate")
        
        swizzleInstanceMethodForClassName("__NSPlaceholderDate", originalSelectorName: "init", newSelectorName: "deloreanInit")
        swizzleInstanceMethodForClassName(className, originalSelectorName: "initWithTimeIntervalSinceNow", newSelectorName: "deloreanInitWithTimeIntervalSinceNow:")
        swizzleInstanceMethodForClassName(className, originalSelectorName: "timeIntervalSinceNow", newSelectorName: "deloreanTimeIntervalSinceNow:")
    }
    
    private func swizzleInstanceMethodForClassName(className: String, originalSelectorName: String, newSelectorName: String) {
        let originalMethod: Method = class_getInstanceMethod(NSClassFromString(className), Selector(originalSelectorName))
        let newMethod: Method = class_getInstanceMethod(NSClassFromString(className), Selector(newSelectorName))
        method_exchangeImplementations(originalMethod, newMethod)
    }
    
    private func swizzleClassMethodForClassName(className: String, originalSelectorName: String, newSelectorName: String) {
        let originalMethod: Method = class_getClassMethod(NSClassFromString(className), Selector(originalSelectorName))
        let newMethod: Method = class_getClassMethod(NSClassFromString(className), Selector(newSelectorName))
        method_exchangeImplementations(originalMethod, newMethod)
    }
    
    private class func dateFromYear(year: Int, months: Int, days: Int, hours: Int, minutes: Int, seconds: Int) -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        components.calendar = calendar
        
        components.year = year
        components.month = months
        components.day = days
        components.hour = hours
        components.minute = minutes
        components.second = seconds
        
        let date = calendar.dateFromComponents(components)
        return date
    }
    
}

extension NSDate {
    
    class func deloreanDate() -> NSDate {
        let date = DeLorean.currentDate() ?? NSDate.deloreanDate()
        return date
    }
    
    class func deloreanDateWithTimeIntervalSinceNow(timeInterval: NSTimeInterval) -> NSDate {
        return NSDate().deloreanInitWithTimeIntervalSinceNow(timeInterval)
    }
    
    class func deloreanTimeIntervalSinceReferenceDate() -> NSTimeInterval {
        let timeInterval = DeLorean.currentDate()?.timeIntervalSinceReferenceDate ?? deloreanTimeIntervalSinceReferenceDate()
        return timeInterval
    }
    
    func deloreanInit() -> NSDate {
        let date = DeLorean.currentDate() ?? deloreanInit()
        return date
    }
    
    func deloreanInitWithTimeIntervalSinceNow(timeInterval: NSTimeInterval) -> NSDate {
        let date = DeLorean.currentDate()?.dateByAddingTimeInterval(timeInterval) ?? deloreanInitWithTimeIntervalSinceNow(timeInterval)
        return date
    }
    
    func deloreanTimeIntervalSinceNow() -> NSTimeInterval {
        let timeInterval: NSTimeInterval
        if let date = DeLorean.currentDate() {
            timeInterval = timeIntervalSinceDate(date)
        } else {
            timeInterval = deloreanTimeIntervalSinceNow()
        }
        return timeInterval
    }
}
