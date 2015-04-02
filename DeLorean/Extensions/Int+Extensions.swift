//
//  Int+Extensions.swift
//  DeLorean
//
//  Created by Scott Petit on 1/14/15.
//  Copyright (c) 2015 Scott Petit. All rights reserved.
//

import Foundation

public extension Int {
    public var year: NSDateComponents {
        return self.years
    }
    
    public var years: NSDateComponents {
        let components = NSDateComponents()
        components.year = self
        return components
    }

    public var month: NSDateComponents {
        return self.months
    }
    
    public var months: NSDateComponents {
        let components = NSDateComponents()
        components.month = self
        return components
    }
    
    public var day: NSDateComponents {
        return self.days
    }
    
    public var days: NSDateComponents {
        let components = NSDateComponents()
        components.day = self
        return components
    }
    
    public var hour: NSDateComponents {
        return self.hours
    }
    
    public var hours: NSDateComponents {
        let components = NSDateComponents()
        components.hour = self
        return components
    }
    
    public var minute: NSDateComponents {
        return self.minutes
    }
    
    public var minutes: NSDateComponents {
        let components = NSDateComponents()
        components.minute = self
        return components
    }
    
    public var second: NSDateComponents {
        return self.seconds
    }
    
    public var seconds: NSDateComponents {
        let components = NSDateComponents()
        components.second = self
        return components
    }
}

public extension NSDateComponents {
    public var ago: NSDateComponents {
        let components = NSDateComponents()
        if self.year != Int(NSDateComponentUndefined) {
            components.year = Min(self.year, -self.year)
        }
        if self.month != Int(NSDateComponentUndefined) {
            components.month = Min(self.month, -self.month)
        }
        if self.day != Int(NSDateComponentUndefined) {
            components.day = Min(self.day, -self.day)
        }
        if self.hour != Int(NSDateComponentUndefined) {
            components.hour = Min(self.hour, -self.hour)
        }
        if self.minute != Int(NSDateComponentUndefined) {
            components.minute = Min(self.minute, -self.minute)
        }
        if self.second != Int(NSDateComponentUndefined) {
            components.second = Min(self.second, -self.second)
        }
        return components
    }
}

private func Min(lhs: Int, rhs: Int) -> Int {
    if lhs < rhs {
        return lhs
    } else {
        return rhs
    }
}

public func + (lhs: NSDateComponents, rhs: NSDateComponents) -> NSDateComponents {
    let components = NSDateComponents()
    
    components.year = lhs.year != Int(NSDateComponentUndefined) ? lhs.year : rhs.year
    components.month = lhs.month != Int(NSDateComponentUndefined) ? lhs.month : rhs.month
    components.day = lhs.day != Int(NSDateComponentUndefined) ? lhs.day : rhs.day
    components.hour = lhs.hour != Int(NSDateComponentUndefined) ? lhs.hour : rhs.hour
    components.minute = lhs.minute != Int(NSDateComponentUndefined) ? lhs.minute : rhs.minute
    components.second = lhs.second != Int(NSDateComponentUndefined) ? lhs.second : rhs.second
    
    return components
}

public func + (lhs: NSDate, rhs: NSDateComponents) -> NSDate {
    let calendar = NSCalendar.currentCalendar()
    
    return calendar.dateByAddingComponents(rhs, toDate: lhs, options: nil)!
}
