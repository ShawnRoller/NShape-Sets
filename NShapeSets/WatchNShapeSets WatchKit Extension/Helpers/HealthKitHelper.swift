//
//  HealthKitHelper.swift
//  NShapeSets
//
//  Created by Shawn Roller on 3/8/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation
import HealthKit

struct HealthKitHelper {
    
    private var healthStore = HKHealthStore()
    private var session: HKWorkoutSession
    private var builder: HKWorkoutBuilder
    
    func setupHK() {
        let typesToShare: Set = [HKQuantityType.workoutType()]
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            
        }
    }
    
    func setupWorkout() {
        let config = HKWorkoutConfiguration()
        config.activityType = .traditionalStrengthTraining
        config.locationType = .unknown
        
        do {
            session = try HKWorkoutSession(healthStore: healthStore, configuration: config)
            builder = session.associatedWorkoutBuilder()
        }
        catch {
            // handle error
            return
        }
        
        builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: config)
        
        session.delegate = self
        builder.delegate = self
    }
    
    func startWorkoutSession() {
        session.startActivity(with: Date())
        builder.beginCollection(withStart: Date()) { (success, error) in
            guard success else {
                // handle error
            }
            
            // session has started
        }
    }
    
}
