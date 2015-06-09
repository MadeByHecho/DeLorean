//
//  DeLoreanTests.swift
//  DeLoreanTests
//
//  Created by Scott Petit on 8/24/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

import XCTest
import DeLorean
import Miles

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
        
        DeLorean.travelTo(year)
        
        yearFromDate(NSDate()).shouldEqual(year)
    }
    
    func testDeloreanCanTravelToASpecifiedMonth() {
        let month = 4
        
        DeLorean.travelTo(month: month)
        
        monthFromDate(NSDate()).shouldEqual(month)
    }
    
    func testDeloreanCanTravelToASpecifiedDay() {
        let day = 28
        
        DeLorean.travelTo(day: day)
        
        dayFromDate(NSDate()).shouldEqual(day)
    }
    
    func testDeloreanCanTravelToASpecifiedHour() {
        let hour = 12
        
        DeLorean.travelTo(hour: hour)
        
        hourFromDate(NSDate()).shouldEqual(hour)
    }
    
    func testDeloreanCanTravelToASpecifiedMinute() {
        let minute = 16
        
        DeLorean.travelTo(minute: minute)
        
        minuteFromDate(NSDate()).shouldEqual(minute)
    }
    
    func testDeloreanCanTravelToASpecifiedSecond() {
        let second = 55
        
        DeLorean.travelTo(second: second)
        
        secondFromDate(NSDate()).shouldEqual(second)
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
    
    func testDeLoreanTravelToWithClosureAutoTravelsBackToThePresent() {
        let originalTimeInterval = NSDate().timeIntervalSince1970
        let timeInterval: NSTimeInterval = 10000
        
        let date = NSDate(timeIntervalSince1970: timeInterval)
        DeLorean.travelTo(date) {
            date.shouldEqual(NSDate())
            date.timeIntervalSince1970.shouldEqual(timeInterval)
        }
        
        date.shouldNotEqual(NSDate())
        originalTimeInterval.shouldBeCloseTo(NSDate().timeIntervalSince1970, withAccuracy: 0.01)
    }
    
    //MARK: Private
    
    private func yearFromDate(date: NSDate) -> Int {
        let year = NSCalendar.currentCalendar().component(.Year, fromDate: date)
        return year
    }
    
    private func monthFromDate(date: NSDate) -> Int {
        let month = NSCalendar.currentCalendar().component(.Month, fromDate: date)
        return month
    }
    
    private func dayFromDate(date: NSDate) -> Int {
        let day = NSCalendar.currentCalendar().component(.Day, fromDate: date)
        return day
    }
    
    private func hourFromDate(date: NSDate) -> Int {
        let hour = NSCalendar.currentCalendar().component(.Hour, fromDate: date)
        return hour
    }
    
    private func minuteFromDate(date: NSDate) -> Int {
        let minute = NSCalendar.currentCalendar().component(.Minute, fromDate: date)
        return minute
    }
    
    private func secondFromDate(date: NSDate) -> Int {
        let second = NSCalendar.currentCalendar().component(.Second, fromDate: date)
        return second
    }
}