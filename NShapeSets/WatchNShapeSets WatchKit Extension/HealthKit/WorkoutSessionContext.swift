//
//  WorkoutSessionContext.swift
//  NShapeSets
//
//  Created by Shawn Roller on 3/15/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation
import HealthKit

class WorkoutSessionContext {
    
    let configuration: HKWorkoutConfiguration
    let healthStore: HKHealthStore
    
    init(healthStore: HKHealthStore, configuration: HKWorkoutConfiguration) {
        self.healthStore = healthStore
        self.configuration = configuration
    }
    
}
