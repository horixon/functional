//
//  Operations.swift
//  Functional
//
//  Created by justin on 3/24/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

//https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-XID_65
infix operator | { associativity left precedence 140 }
public func | <A,B> (left:@autoclosure()->A,right: A->B)->B
{
    return right(left())
}
