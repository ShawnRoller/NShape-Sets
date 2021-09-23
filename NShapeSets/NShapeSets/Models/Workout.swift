//
//  Workout.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/25/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

class Workout {
    var sets: Double
    var rest: Double
    var currentSet: Double
    
    init(sets: Double, rest: Double, currentSet: Double) {
        self.sets = sets
        self.rest = rest
        self.currentSet = currentSet
    }

    static let example = Workout(sets: 5, rest: 5, currentSet: 5)
}
