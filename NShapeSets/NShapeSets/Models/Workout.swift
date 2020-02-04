//
//  Workout.swift
//  NShapeSets
//
//  Created by Shawn Roller on 1/25/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation

class Workout: ObservableObject {
    var sets: Double
    var rest: Double
    var currentSet: Double
    var currentRest: Double
    var remainingSets: Double {
        return sets - currentSet
    }
    
    init(sets: Double, rest: Double, currentSet: Double) {
        self.sets = sets
        self.rest = rest
        self.currentRest = rest
        self.currentSet = currentSet
    }
    
    func nextSet() {
        currentSet += 1
        currentRest = rest
    }
    
    func restart() {
        currentSet = 1
        currentRest = rest
    }

    #if DEBUG
    static let example = Workout(sets: 3, rest: 5, currentSet: 3)
    #endif
}
