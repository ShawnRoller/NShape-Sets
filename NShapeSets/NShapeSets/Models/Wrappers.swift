//
//  Wrappers.swift
//  NShapeSets
//
//  Created by Shawn Roller on 3/11/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation

// from NSHipster: https://nshipster.com/propertywrapper/
@propertyWrapper
struct Clamping<Value: Comparable> {
    var value: Value
    let range: ClosedRange<Value>

    init(initialValue value: Value, _ range: ClosedRange<Value>) {
        precondition(range.contains(value))
        self.value = value
        self.range = range
    }

    var wrappedValue: Value {
        get { value }
        set { value = min(max(range.lowerBound, newValue), range.upperBound) }
    }
}
