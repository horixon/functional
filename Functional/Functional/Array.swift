//
//  Array.swift
//  Functional
//
//  Created by justin on 3/27/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

import Foundation

public func Arr<S:SequenceType>(source:S) -> [S.Generator.Element]{
    return Array(source)
}