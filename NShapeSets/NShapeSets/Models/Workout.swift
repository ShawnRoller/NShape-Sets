//
//  Workout.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/25/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation

struct Workout {
    var sets: Double
    var rest: Double
    var currentSet: Double
    var remainingSets: Double {
        return sets - currentSet
    }

    #if DEBUG
    static let example = Workout(sets: 3, rest: 5, currentSet: 3)
    #endif
}
