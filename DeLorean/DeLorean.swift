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
    
    public class func travelTo(date: NSDate?) {
        DeLorean.sharedInstance.date = date
    }

    public class func travelToYear(year: Int) {
        let date = NSDate.dateFromYear(year, months: 0, days: 0, hours: 0, minutes: 0, seconds: 0)
        travelTo(date)
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
        var originalMethod: Method = class_getInstanceMethod(NSClassFromString(className), Selector.convertFromStringLiteral(originalSelectorName))
        var newMethod: Method = class_getInstanceMethod(NSClassFromString(className), Selector.convertFromStringLiteral(newSelectorName))
        method_exchangeImplementations(originalMethod, newMethod)
    }

    private func swizzleClassMethodForClassName(className: String, originalSelectorName: String, newSelectorName: String) {
        var originalMethod: Method = class_getClassMethod(NSClassFromString(className), Selector.convertFromStringLiteral(originalSelectorName))
        var newMethod: Method = class_getClassMethod(NSClassFromString(className), Selector.convertFromStringLiteral(newSelectorName))
        method_exchangeImplementations(originalMethod, newMethod)
    }
    
}

extension NSDate {
    
    class func deloreanDate() -> NSDate {
        if let date = DeLorean.currentDate() {
            return date
        } else {
            return NSDate.deloreanDate()
        }
    }

    class func deloreanDateWithTimeIntervalSinceNow(timeInterval: NSTimeInterval) -> NSDate {
        return NSDate().deloreanInitWithTimeIntervalSinceNow(timeInterval)
    }

    class func deloreanTimeIntervalSinceReferenceDate() -> NSTimeInterval {
        if let date = DeLorean.currentDate() {
            return date.timeIntervalSinceReferenceDate
        } else {
            return self.deloreanTimeIntervalSinceReferenceDate()
        }
    }

    func deloreanInit() -> NSDate {
        if let date = DeLorean.currentDate() {
            return date
        } else {
            return self.deloreanInit()
        }
    }

    func deloreanInitWithTimeIntervalSinceNow(timeInterval: NSTimeInterval) -> NSDate {
        if let date = DeLorean.currentDate() {
            return date.dateByAddingTimeInterval(timeInterval)
        } else {
            return self.deloreanInitWithTimeIntervalSinceNow(timeInterval);
        }
    }

    func deloreanTimeIntervalSinceNow() -> NSTimeInterval {
        if let date = DeLorean.currentDate() {
            return self.timeIntervalSinceDate(date)
        } else {
            return self.deloreanTimeIntervalSinceNow()
        }
    }

}
