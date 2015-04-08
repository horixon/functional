//
//  TransformsTests.swift
//  Functional
//
//  Created by justin on 3/25/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

import UIKit
import XCTest
import Functional

class TransformsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFilter() {
        let s = [1,2,2,2,2,2,3]
        let t = s|Seq.filter{ $0 != 2 }
        var g = t.generate()
        XCTAssertEqual(g.next()!,1)
        XCTAssertEqual(g.next()!,3)
        XCTAssertNil(g.next())
        
        let u = t|Arr
        XCTAssertEqual(u.count,2)
        XCTAssertEqual(u[0],1)
        XCTAssertEqual(u[1],3)
    }
    
    func testMap() {
        let t = [1,2,3]|Seq.map{ (n) -> String in
            return  String(n)}
        
        var g = t.generate()
        XCTAssertEqual(g.next()!,"1")
        XCTAssertEqual(g.next()!,"2")
        XCTAssertEqual(g.next()!,"3")
        
        let u = Array(t)
        u.count
        XCTAssertEqual(u.count,3)
        XCTAssertEqual(u[0],"1")
        XCTAssertEqual(u[1],"2")
        XCTAssertEqual(u[2],"3")
        
        var z = t.generate()
        XCTAssertEqual(z.next()!,"1")
        XCTAssertEqual(z.next()!,"2")
        XCTAssertEqual(z.next()!,"3")
    }
    
    func testReduce(){
        let s = [1,2,2,2,3]
        let final = Seq.reduce(0){ (total, n) -> Int in
            return total + n
            }(s)
        
        
        XCTAssertEqual(final,10)
    }
    
    func testDict(){
        let s = [3:1,2:2,1:3]
        let t = Seq.filter{ (k,v) -> Bool in
            return k == 1 || v == 2
            }(s)
        var z = t.generate()
        var n = z.next()!
        XCTAssertEqual(n.0,2)
        XCTAssertEqual(n.1,2)
        n = z.next()!
        XCTAssertEqual(n.0,1)
        XCTAssertEqual(n.1,3)
    }
    
    func testUnzip(){
        let s = [3:1,2:2,1:3]
        
        let (k,v) = Seq.unzip(s)
        let keys = Array(k)
        let values = Array(v)
        for i in 0..<keys.count {
            let k = keys[i]
            XCTAssertEqual(s[k]!,values[i])
        }
    }
    
    func testZip(){
        let s0 = [3,2,2]
        let s1 = [1,3,3]
        
        let a = Array((s0,s1)|Seq.zip)
        
        XCTAssertEqual(a[0].0,s0[0])
        XCTAssertEqual(a[0].1,s1[0])
        XCTAssertEqual(a[1].0,s0[1])
        XCTAssertEqual(a[1].1,s1[1])
        XCTAssertEqual(a[2].0,s0[2])
        XCTAssertEqual(a[2].1,s1[2])
    }

}
