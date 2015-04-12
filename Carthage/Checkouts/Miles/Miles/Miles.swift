//
//  Miles.swift
//  Miles
//
//  Created by Scott Petit on 2/16/15.
//  Copyright (c) 2015 Hecho. All rights reserved.
//

import XCTest
import Foundation

public extension String {
    public func shouldEqual(string: String, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to equal \(string)"
        XCTAssertEqual(self, string, description, file: file, line: line)
    }
    
    public func shouldContain(string: String, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to contain \(string)"
        XCTAssertTrue(self.rangeOfString(string) != nil, description, file: file, line: line)
    }
    
    public func shouldHavePrefix(string: String, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to have a prefix of \(string)"
        XCTAssertTrue(self.hasPrefix(string), description, file: file, line: line)
    }
    
    public func shouldHaveSuffix(string: String, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to have a suffix of \(string)"
        XCTAssertTrue(self.hasSuffix(string), description, file: file, line: line)
    }
}

public extension Character {
    func shouldEqual(character: Character, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to equal \(character)"
        XCTAssertEqual(self, character, description, file: file, line: line)
    }
}

public extension Int {
    func shouldEqual(int: Int, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to equal \(int)"
        XCTAssertEqual(self, int, description, file: file, line: line)
    }
    
    func shouldBeGreaterThan(int: Int, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be greater than \(int)"
        XCTAssertTrue(self > int, description, file: file, line: line)
    }
    
    func shouldBeLessThan(int: Int, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be less than \(int)"
        XCTAssertTrue(self < int, description, file: file, line: line)
    }
    
    func shouldBeGreaterThanOrEqualTo(int: Int, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be greater than or equal to \(int)"
        XCTAssertTrue(self >= int, description, file: file, line: line)
    }
    
    func shouldBeLessThanOrEqualTo(int: Int, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be less than or equal to \(int)"
        XCTAssertTrue(self <= int, description, file: file, line: line)
    }
}

public extension Float {
    func shouldEqual(float: Float, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to equal \(float)"
        XCTAssertEqual(self, float, description, file: file, line: line)
    }
    
    func shouldBeGreaterThan(float: Float, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be greater than \(float)"
        XCTAssertTrue(self > float, description, file: file, line: line)
    }
    
    func shouldBeLessThan(float: Float, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be less than \(float)"
        XCTAssertTrue(self < float, description, file: file, line: line)
    }
    
    func shouldBeGreaterThanOrEqualTo(float: Float, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be greater than or equal to \(float)"
        XCTAssertTrue(self >= float, description, file: file, line: line)
    }
    
    func shouldBeLessThanOrEqualTo(float: Float, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be less than or equal to \(float)"
        XCTAssertTrue(self <= float, description, file: file, line: line)
    }
    
    func shouldBeCloseTo(float: Float, withAccuracy accuracy: Float, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be within \(accuracy) of \(float)"
        XCTAssertEqualWithAccuracy(self, float, accuracy, description, file: file, line: line)
    }
}

public extension Double {
    func shouldEqual(double: Double, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to equal \(double)"
        XCTAssertEqual(self, double, description, file: file, line: line)
    }
    
    func shouldBeGreaterThan(double: Double, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be greater than \(double)"
        XCTAssertTrue(self > double, description, file: file, line: line)
    }
    
    func shouldBeLessThan(double: Double, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be less than \(double)"
        XCTAssertTrue(self < double, description, file: file, line: line)
    }
    
    func shouldBeGreaterThanOrEqualTo(double: Double, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be greater than or equal to \(double)"
        XCTAssertTrue(self >= double, description, file: file, line: line)
    }
    
    func shouldBeLessThanOrEqualTo(double: Double, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be less than or equal to \(double)"
        XCTAssertTrue(self <= double, description, file: file, line: line)
    }
    
    func shouldBeCloseTo(double: Double, withAccuracy accuracy: Double, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be within \(accuracy) of \(double)"
        XCTAssertEqualWithAccuracy(self, double, accuracy, description, file: file, line: line)
    }
}

public extension Bool {
    func shouldBeTrue(file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be true"
        XCTAssertTrue(self, description, file: file, line: line)
    }
    
    func shouldBeFalse(file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be false"
        XCTAssertFalse(self, description, file: file, line: line)
    }
}

public extension NSObject {
    func shouldEqual(object: NSObject, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to equal \(object)"
        XCTAssertEqual(self, object, description, file: file, line: line)
    }
    
    func shouldNotEqual(object: NSObject, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to not equal \(object)"
        XCTAssertNotEqual(self, object, description, file: file, line: line)
    }
    
    func shouldBeIdenticalTo(object: NSObject, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be identical to \(object))"
        XCTAssertTrue(self === object, description, file: file, line: line)
    }
    
    func shouldBeKindOfClass(aClass: AnyClass, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be kind of Class \(aClass)"
        XCTAssertTrue(self.isKindOfClass(aClass), description, file: file, line: line)
    }
}

public func shouldContain<T: Equatable>(array: [T], item: T, file: String = __FILE__, line: UInt = __LINE__) {
    let description = "Expected \(array) to contain \(item)"
    var contains = false
    
    for value in array {
        if value == item {
            contains = true
            break
        }
    }
    XCTAssertTrue(contains, description, file: file, line: line)
}

public func shouldBeEmpty<T>(array: [T],file: String = __FILE__, line: UInt = __LINE__) {
    let description = "Expected \(array) to be empty"
    XCTAssertTrue(array.isEmpty, description, file: file, line: line)
}

public func shouldContain<Key : Hashable, Value: Equatable>(dictionary: [Key : Value], item: Value, file: String = __FILE__, line: UInt = __LINE__) {
    let description = "Expected \(dictionary) to contain \(item)"
    var contains = false
    
    for (_, value) in dictionary {
        if value == item {
            contains = true
            break
        }
    }
    XCTAssertTrue(contains, description, file: file, line: line)
}

public func shouldBeEmpty<Key : Hashable, Value>(dictionary: [Key : Value],file: String = __FILE__, line: UInt = __LINE__) {
    let description = "Expected \(dictionary) to be empty"
    XCTAssertTrue(dictionary.isEmpty, description, file: file, line: line)
}

public func shouldBeNil<T>(optional: Optional<T>, file: String = __FILE__, line: UInt = __LINE__) {
    let description = "Expected \(optional) to be nil"
    switch optional {
    case .Some(_):
        XCTAssertTrue(false, description, file: file, line: line)
    case .None:
        XCTAssertTrue(true, description, file: file, line: line)
    }
}

public func shouldNotBeNil<T>(optional: Optional<T>, file: String = __FILE__, line: UInt = __LINE__) {
    let description = "Expected \(optional) to not be nil"
    switch optional {
    case .Some(_):
        XCTAssertTrue(true, description, file: file, line: line)
    case .None:
        XCTAssertTrue(false, description, file: file, line: line)
    }
}
