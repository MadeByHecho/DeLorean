//
//  DeLoreanTests.swift
//  DeLoreanTests
//
//  Created by Scott Petit on 8/24/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

import UIKit
import XCTest
import DeLorean

class DeLoreanTests: XCTestCase {
    
    override func tearDown() {
        DeLorean.backToThePresent()
        
        super.tearDown()
    }
    
    func testDeloreanStoresTheTravelToDate() {
        let date = NSDate(timeIntervalSince1970: 10000)
        
        DeLorean.travelTo(date)
        
        date.shouldEqual(NSDate())
    }
    
    func testDeloreanCanTravelToSpecifiedYear() {
        let year = 1999
        
        DeLorean.travelToYear(year)
        
        NSDate().year.shouldEqual(year)
    }
    
    func testDeloreanResetsCurrentDateWhenTravelingBackToThePresent() {
        let timeInterval: NSTimeInterval = 10000
        
        let date = NSDate(timeIntervalSince1970: timeInterval)
        DeLorean.travelTo(date)
        
        date.shouldEqual(NSDate())
        date.timeIntervalSince1970.shouldEqual(timeInterval)
        
        DeLorean.backToThePresent()
        
        date.shouldNotEqual(NSDate())
    }
    
    func testAddingAYearToADate() {
        let year = 1999
        
        DeLorean.travelToYear(year)
        
        let nextYear = NSDate() + 1.year
        
        (year + 1).shouldEqual(nextYear.year)
    }
    
    func testAddingYearsToADate() {
        let year = 1999
        
        DeLorean.travelToYear(year)
        
        let futureYear = NSDate() + 5.years
        
        (year + 5).shouldEqual(futureYear.year)
    }
    
    func testAddingAMonthToADate() {
        let currentMonth = NSDate().month
        
        let nextMonth = NSDate() + 1.month
        
        (currentMonth + 1).shouldEqual(nextMonth.month)
    }
    
    func testAddingMonthsToADate() {
        let currentMonth = NSDate().month
        
        let futureMonth = NSDate() + 6.months
        
        (currentMonth + 6).shouldEqual(futureMonth.month)
    }
    
    func testAddingADayToADate() {
        let currentDay = NSDate().day
        
        let nextDay = NSDate() + 1.day
        
        (currentDay + 1).shouldEqual(nextDay.day)
    }
    
    func testAddingDaysToADate() {
        let currentDay = NSDate().day
        
        let futureDay = NSDate() + 4.days
        
        (currentDay + 4).shouldEqual(futureDay.day)
    }

    func testAddingAHourToADate() {
        let currentHour = NSDate().hour
        
        let nextHour = NSDate() + 1.hour
        
        (currentHour + 1).shouldEqual(nextHour.hour)
    }
    
    func testAddingHoursToADate() {
        let currentHour = NSDate().hour
        
        var futureHour = NSDate() + 8.hours
        
        (currentHour + 8).shouldEqual(futureHour.hour)
    }
    
    func testAddingAMinuteToADate() {
        let currentMinute = NSDate().minute
        
        let nextMinute = NSDate() + 1.minute
        
        (currentMinute + 1).shouldEqual(nextMinute.minute)
    }
    
    func testAddingMinutesToADate() {
        let currentMinute = NSDate().minute
        
        let futureMinute = NSDate() + 15.minutes
        
        (currentMinute + 15).shouldEqual(futureMinute.minute)
    }
    
    func testAddingASecondToADate() {
        let currentSecond = NSDate().second
        
        let nextSecond = NSDate() + 1.second
        
        (currentSecond + 1).shouldEqual(nextSecond.second)
    }
    
    func testAddingSecondsToADate() {
        let currentSecond = NSDate().second
        
        let futureSecond = NSDate() + 12.seconds
        
        (currentSecond + 12).shouldEqual(futureSecond.second)
    }
    
    func testRemovingAYearFromADate() {
        let year = 1999
        
        DeLorean.travelToYear(year)
        
        let previousYear = NSDate() + 1.year.ago
        
        (year - 1).shouldEqual(previousYear.year)
    }

}
