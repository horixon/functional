//
//  Dictionary.swift
//  Functional
//
//  Created by justin on 3/24/15.
//  Copyright (c) 2015 Electroreef. All rights reserved.
//

//In Xcode_6.3_beta_4 (swift 1.2) you can create a public extension in a module.  If that is still the behavior when it's out of bete we can remove this method
public func seqto<Key,Value>(s:SequenceOf<(Key,Value)>) -> Dictionary<Key,Value> {
    return Dictionary(s)
}

extension Dictionary {
    init(_ s: SequenceOf<Element>) {
        self.init()
        for (k,v) in s {
            self[k] = v
        }
    }
}