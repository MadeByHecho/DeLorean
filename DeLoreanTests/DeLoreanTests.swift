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
        
        XCTAssertEqual(date, NSDate.date())
        XCTAssertEqual(date, NSDate())
    }
    
    func testDeloreanCanTravelToSpecifiedYear() {
        let year = 1999
        
        DeLorean.travelToYear(year)
        
        XCTAssertEqual(NSDate.date().year(), year)
        XCTAssertEqual(NSDate().year(), year)
    }
    
    func testDeloreanResetsCurrentDateWhenTravelingBackToThePresent() {
        let timeInterval: NSTimeInterval = 10000
        
        let date = NSDate(timeIntervalSince1970: timeInterval)
        DeLorean.travelTo(date)
        
        XCTAssertEqual(date, NSDate())
        XCTAssertEqual(date, NSDate.date())
        XCTAssertEqual(date.timeIntervalSince1970, timeInterval)
        
        DeLorean.backToThePresent()
        
        XCTAssertNotEqual(date, NSDate())
        XCTAssertNotEqual(date, NSDate.date())
    }
    
}
