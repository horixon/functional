//
//  Dictionary.swift
//  Functional
//
//  Created by justin on 3/24/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

import UIKit
import XCTest
import Functional

class DictionaryTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDictionaryFilter() {
        
        var d = [9:9,8:8,7:7,6:6,5:5]
        
        let s = [3:1,2:2,1:3]
        let t = Seq.filter{ (k,v) -> Bool in
            return k == 1 || v == 2
        }(s)
        
        let answer = seqto(t)
        
        XCTAssertEqual(answer[1]!,3)
        XCTAssertEqual(answer[2]!,2)
        XCTAssertNil(answer[3])
    }
}
