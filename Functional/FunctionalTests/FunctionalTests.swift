//
//  FunctionalTests.swift
//  FunctionalTests
//
//  Created by justin on 12/4/14.
//  Copyright (c) 2014 Electroreef. All rights reserved.
//

import UIKit
import XCTest


class FunctionalTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFSharpPipe() {
        
        XCTAssertTrue({1}()|>{$0 + 1} == 2)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
