//
//  OperationsTests.swift
//  Functional
//
//  Created by justin on 3/24/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

import UIKit
import XCTest
import Functional

class OperationsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPipe() {
        XCTAssertTrue(1|{$0 + 1} == 2)
    }

}
