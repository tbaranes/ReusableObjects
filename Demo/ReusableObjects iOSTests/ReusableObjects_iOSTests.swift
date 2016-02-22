//
//  ReusableFormatter_iOSTests.swift
//  ReusableFormatter iOSTests
//
//  Created by Tom Baranes on 22/02/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation
import XCTest
@testable import ReusableObjects_Demo_iOS

class ReusableObjects_iOSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Register
    
    func testRegisterObjectThenDequeuObject_fromInstance() {
        let objectIdentifier = "test1"
        let dateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(objectIdentifier) as! NSDateFormatter
        dateFormatter.registerObjectWithIdentifier(objectIdentifier)        
        let dateFormatter2 = NSDateFormatter.dequeueReusableObjectWithIdentifier(objectIdentifier) as! NSDateFormatter
        XCTAssertTrue(dateFormatter == dateFormatter2)
    }

    func testRegisterObjectThenDequeuObject_fromClass() {
        let objectIdentifier = "test1"
        NSDateFormatter.registerObjectWithIdentifier(objectIdentifier)
        let dateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(objectIdentifier) as! NSDateFormatter
        let dateFormatter2 = NSDateFormatter.dequeueReusableObjectWithIdentifier(objectIdentifier) as! NSDateFormatter
        XCTAssertTrue(dateFormatter == dateFormatter2)
    }

    // MARK: - Unregister
    
    func testUnregisterObjectThenDequeuObject() {
        let objectIdentifier = "test1"
        let dateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(objectIdentifier) as! NSDateFormatter
        dateFormatter.registerObjectWithIdentifier(objectIdentifier)
        NSDateFormatter.unregisterObjectWithIdentifier(objectIdentifier)
        let dateFormatter2 = NSDateFormatter.dequeueReusableObjectWithIdentifier(objectIdentifier) as! NSDateFormatter
        XCTAssertFalse(dateFormatter == dateFormatter2)
    }
    
    // MARK: - Dequeue
    
    func testDequeueUnsavedObject() {
        let objectIdentifier = "test2"
        let dateFormatter = NSDateFormatter.dequeueReusableObjectWithIdentifier(objectIdentifier) as! NSDateFormatter
        let dateFormatter2 = NSDateFormatter.dequeueReusableObjectWithIdentifier(objectIdentifier) as! NSDateFormatter
        XCTAssertTrue(dateFormatter == dateFormatter2)
    }
    
}
