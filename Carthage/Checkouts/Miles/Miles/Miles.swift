//
//  Miles.swift
//  Miles
//
//  Created by Scott Petit on 2/16/15.
//  Copyright (c) 2015 Hecho. All rights reserved.
//

import XCTest
import Foundation

public extension Equatable {
    public func shouldEqual<T: Equatable>(other: T, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to equal \(other)"
        if let other = other as? Self {
            XCTAssertEqual(self, other, description, file: file, line: line)
        } else {
            XCTAssertTrue(false, description, file: file, line: line)
        }
    }
}

public extension Comparable {
    public func shouldBeGreaterThan<T: Comparable>(other: T, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be greater than \(other)"
        if let other = other as? Self {
            XCTAssertGreaterThan(self, other, description)
        } else {
            XCTAssertTrue(false, description)
        }
    }
    
    public func shouldBeGreaterThanOrEqualTo<T: Comparable>(other: T, file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be greater than or equal to \(other)"
        if let other = other as? Self {
            XCTAssertGreaterThanOrEqual(self, other, description)
        } else {
            XCTAssertTrue(false, description)
        }
    }
    
    public func shouldBeLessThan<T: Comparable>(other: T, file: String = __FILE__, line: UInt = __LINE__) {
        let message = "Expected \(self) to be less than \(other)"
        if let other = other as? Self {
            XCTAssertLessThan(self, other, message)
        } else {
            XCTAssertTrue(false, message)
        }
    }
    
    public func shouldBeLessThanOrEqualTo<T: Comparable>(other: T, file: String = __FILE__, line: UInt = __LINE__) {
        let message = "Expected \(self) to be less than or Equal to \(other)"
        if let other = other as? Self {
            XCTAssertLessThanOrEqual(self, other, message)
        } else {
            XCTAssertTrue(false, message)
        }
    }
}

public extension FloatingPointType {
    public func shouldBeCloseTo<T: FloatingPointType>(other: T, withAccuracy accuracy: T, file: String = __FILE__, line: UInt = __LINE__) {
        let message = "Expected \(self) to be within \(accuracy) of \(other)"
        if let other = other as? Self, accuracy = accuracy as? Self {
            XCTAssertEqualWithAccuracy(self, other, accuracy: accuracy, message, file: file, line: line)
        } else {
            XCTAssertTrue(false, message)
        }
    }
}

public extension String {
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

public extension CollectionType where Generator.Element : Equatable {
    func shouldContain(item: Self.Generator.Element, file: String = __FILE__, line: UInt = __LINE__) {
        
        let description = "Expected \(self) to contain \(item)"
        var contains = false
        
        if let _ = indexOf(item) {
            contains = true
        }
        XCTAssertTrue(contains, description, file: file, line: line)
    }
}

public extension CollectionType {
    func shouldBeEmpty(file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be empty"
        XCTAssertTrue(isEmpty, description, file: file, line: line)
    }
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

public extension Optional {
    public func shouldBeNil(file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to be nil"
        switch self {
        case .Some(_):
            XCTAssertTrue(false, description, file: file, line: line)
        case .None:
            XCTAssertTrue(true, description, file: file, line: line)
        }
    }
    
    public func shouldNotBeNil(file: String = __FILE__, line: UInt = __LINE__) {
        let description = "Expected \(self) to not be nil"
        switch self {
        case .Some(_):
            XCTAssertTrue(true, description, file: file, line: line)
        case .None:
            XCTAssertTrue(false, description, file: file, line: line)
        }
    }
}
